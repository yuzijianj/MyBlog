#!/usr/bin/python3
import pymysql.cursors
import re
import simplejson as json
import shutil
import os
import datetime

now = datetime.datetime.now()
# 分表优化 正则
# 账号映射表、处理表数据处理
# 分表问题、账号密码问题
# 字段感知
# adb任务

# 分表后缀加table_tag
mysql_source = [dict(
    table_list=["sps_mg_activity_attend_record", "sps_mg_activity_info", "sps_mg_reward_distribute_log",
                "sps_mg_prize_info"]
    , host="fbs_sps-slave.db.blackfi.sh"
    , data_source="sps"
    , port=3362)]

path = "conf/"
mysql_path = "mysql_meta"
res_job_path = "res_job"
res_meta_path = "res_meta"
# 重建输出文件夹
shutil.rmtree(mysql_path)
shutil.rmtree(res_job_path)
shutil.rmtree(res_meta_path)
os.mkdir(mysql_path)
os.mkdir(res_job_path)
os.mkdir(res_meta_path)


# 配置
def get_conf():
    file = open("{}databases.csv".format(path), "r").read()
    database = dict()
    for line in file.split("\n"):
        cols = line.split(",")
        database[cols[0]] = dict(host=cols[1], port=int(cols[2]), user='RO_dwsync', password='K4Com#PaL!S1KoR')
    return database


# 一、获取mysql列表
def get_mysql_meta(mysql_source):
    database = get_conf()
    for source in mysql_source:
        datasource = source["database"]
        auth_name = source["auth_name"]
        if source["distable_tag"] is None or source["distable_tag"] == "":
            table_tag = "#"
        else:
            table_tag = source["distable_tag"]
        db = pymysql.connect(host=database.get(datasource)['host'],
                             port=database.get(datasource)["port"],
                             user='RO_dwsync',
                             password='K4Com#PaL!S1KoR',
                             db=datasource,
                             charset='utf8')
        cursor = db.cursor()
        for table in source["table_list"]:

            # meta处理
            try:
                cursor.execute("show create table {}".format(table))
                data = cursor.fetchone()
                print(table)
                open("{}/{}.sql".format(mysql_path, table.replace(table_tag, "_分表")), "wb").write(
                    data[1].encode("utf-8"))
                # alter meta
                meta_convert(datasource, table, data[1], table_tag, auth_name)
            except():
                print("table_convert:{}数据异常。。。。".format(table))

            # job处理
            try:
                cursor.execute("SHOW FULL COLUMNS  FROM {}".format(table))
                data = cursor.fetchall()
                get_odps_job(datasource, table, data, table_tag, auth_name)
            except():
                print("job_convert:{}数据异常。。。。".format(table))
    db.close()
    print("Done !")


# 二、mysql_meta -> odps/adb_meta
def meta_convert(datasource, table_name, mysql_meta, table_tag, auth_name):
    p1 = re.compile(
        r'([\s\S]*)( date| int| tinyint| varchar| timestamp| decimal| bigint| double)([\s\S]*)(COMMENT|AUTO_INCREMENT)([\s\S]*)',
        re.I)
    p2 = re.compile(r"(CREATE TABLE)([\s\S]*)", re.I)
    p3 = re.compile(r"([\s\S]*)(PRIMARY |UNIQUE |KEY )([\s\S]*)", re.I)
    p4 = re.compile(r"([\s\S]*)(COMMENT=|utf8)([\s\S]*)", re.I)

    #  mysql->odps  部分
    odps_map = dict(
        int='bigint',
        tinyint="bigint",
        varchar='String',
        decimal='String',
        timestamp='datetime',
        date='datetime'
    )
    #  mysql->odps  部分
    adb_map = dict(
        int='bigint',
        tinyint="bigint",
        # varchar='varchar',
        decimal='bigint',
        date='datetime'
        # timestamp='timestamp'
    )

    ods_table = []
    edw_table = []
    adb_table = []
    odps_table_name = "{}_{}_dd".format(datasource, table_name.replace(table_tag, ""))
    for line in mysql_meta.split("\n"):
        p1_res = p1.match(line)
        # 1、字段处理
        if p1_res:
            ods_res_line = p1_res.group(1) + p1_res.group(2) + " " + p1_res.group(4).replace(
                "AUTO_INCREMENT", "") + p1_res.group(5)
            edw_res_line = ods_res_line
            adb_res_line = ods_res_line
            # 字段映射
            for key in odps_map.keys():
                ods_res_line = ods_res_line.replace(' {} '.format(key), ' {} '.format(odps_map[key]))
                if key == "decimal":
                    edw_res_line = edw_res_line.replace(' {} '.format(key), ' {} '.format("bigint"))
                else:
                    edw_res_line = edw_res_line.replace(' {} '.format(key), ' {} '.format(odps_map[key]))
            for key in adb_map.keys():
                adb_res_line = adb_res_line.replace(' {} '.format(key), ' {} '.format(adb_map[key]))

            # del tag
            if "del_flag" in p1_res.group(1):
                edw_res_line = "del_flag"
                adb_res_line = "del_flag"
        # 2、表头处理

        elif p2.match(line):
            ods_res_line = line.replace(table_name, "dc_ods.{}".format(odps_table_name))
            edw_res_line = line.replace(table_name, "dc_edw.{}".format(odps_table_name))
            adb_res_line = line.replace(table_name, "xhy_warehouse.{}".format(odps_table_name))

        # 3、主键处理
        elif p3.match(line):
            continue
        # 4、表尾处理
        else:
            p4_res = p4.match(line)
            if p4_res:
                if p4_res.group(3) == "":
                    comment = "\'\'"
                else:
                    comment = p4_res.group(3)

                ods_res_line = ",)COMMENT {} \nPARTITIONED BY (ts STRING,hour STRING);".format(comment)
                edw_res_line = ods_res_line

                adb_res_line = ",)PARTITION BY HASH KEY (id) PARTITION NUM 128\n" \
                               "SUBPARTITION BY LIST KEY (ts)\n" \
                               "SUBPARTITION OPTIONS (available_partition_num = 90)\n" \
                               "TABLEGROUP edw\n" \
                               "OPTIONS (UPDATETYPE='batch')\n" \
                               "COMMENT {};".format(comment)
            else:
                ods_res_line = line
                edw_res_line = line
                adb_res_line = line
        ods_table.append(ods_res_line)
        # 排除 del_tag
        if edw_res_line != "del_flag":
            edw_table.append(edw_res_line)
            adb_table.append(adb_res_line)
    odps_meta = ("\n".join(ods_table) + "\n\n\n" + "\n".join(edw_table) + "\n\n\n" +
                 "\n".join(adb_table)).replace(",\n,)", "\n)")

    open("{}/{}.osql".format(res_meta_path, odps_table_name), "wb").write(
        odps_meta.encode("utf-8"))


# 三、生成对应的odps同步任务
def get_odps_job(datasource, table_name, cols_list, table_tag, auth_name):
    back_ods = json.loads(open("{}ods_job.json".format(path), "r").read())
    back_edw = open("{}edw_job.txt".format(path), "r").read()
    ods_columns = []
    edw_columns1 = []
    edw_columns2 = []
    odps_table_name = "{}_{}_dd".format(datasource, table_name.replace(table_tag, ""))
    for list in cols_list:
        ods_columns.append(list[0])
        if "del_flag" != list[0]:
            edw_columns1.append(list[0])
            if 'decimal' not in list[1]:
                edw_columns2.append(list[0])
            else:
                edw_columns2.append("CAST(ROUND({0}*100) AS BIGINT) AS {0}".format(list[0]))

    edw_columns1 = "\n      ,".join(edw_columns1)
    edw_columns2 = "\n      ,".join(edw_columns2)

    back_ods["steps"][0]["parameter"]["column"] = ods_columns
    back_ods["steps"][0]["parameter"]["connection"][0]["datasource"] = datasource
    back_ods["steps"][0]["parameter"]["connection"][0]["table"] = [table_name]
    back_ods["steps"][1]["parameter"]["table"] = odps_table_name
    # 当add_time 是order_time时
    if "add_time" not in ods_columns and "order_time" in ods_columns:
        back_ods["steps"][0]["parameter"]["where"] = back_ods["steps"][0]["parameter"]["where"].replace("add_time",
                                                                                                        "order_time")

    # 分表提醒
    open("{}/{}.json".format(res_job_path, (datasource + "_" + table_name + "_dd").replace(table_tag, "_分表")),
         "wb").write(
        json.dumps(back_ods, indent=2, sort_keys=False).encode("utf-8"))
    back_ods2 = back_ods
    ts = (now + datetime.timedelta(hours=-1)).strftime("%Y%m%d")
    hour = (now + datetime.timedelta(hours=-1)).strftime("%H")
    date = (now + datetime.timedelta(hours=-1)).strftime("%Y-%m-%d %H:59:59")

    back_ods2["steps"][0]["parameter"]["where"] = "update_time <= '{0}'".format(date)  # 当前时间
    back_ods2["steps"][1]["parameter"]["partition"] = "ts={0},hour={1}".format(ts, hour)  # 获取当前时间

    open("{}/_back_{}.json".format(res_job_path, odps_table_name), "wb").write(
        json.dumps(back_ods2, indent=2, sort_keys=False).encode("utf-8"))
    open("{}/edw_{}.osql".format(res_job_path, odps_table_name), "wb").write(
        back_edw.format(odps_table_name, edw_columns1, edw_columns2, "{td}", "{td_bef}", auth_name,
                        now.strftime("%Y-%m-%d %H:%M:%S")).encode("utf-8"))


if __name__ == '__main__':
    get_mysql_meta()
