# -*- coding: utf-8 -*-
import json
import os
import shutil

sour_path = "json"


# 指标自动比对job和延伸指标逻辑
# job自动比对sql逻辑并生成
# SQL逻辑自动比对指标库
# 自动生成异常报告


# mapping处理
def config():
    with open('mapping/column_mapping.json', 'r', encoding='UTF-8') as file:
        columns_json = json.loads(file.read())
        cols_json = dict()
        for arr in columns_json:
            col_arr = json.loads(columns_json[arr])
            for col in col_arr:
                col["job_name"] = arr
                cols_json[col['hBaseColumnName']] = col
    with open('mapping/table_mapping.json', 'r', encoding='UTF-8') as file:
        jobs_json = json.loads(file.read())
    with open('mapping/logic_mapping.json', 'r', encoding='UTF-8') as file:
        logic_json = json.loads(file.read())

    sql_list = os.listdir('mapping/traits')

    return cols_json, jobs_json, logic_json, sql_list


def mkdir(path):
    folder = os.path.exists(path)
    if not folder:
        os.makedirs(path)


def del_dir():
    path = "result"
    # os.remove(path)  # 删除文件
    # os.removedirs("test/ts")  # 删除空文件夹
    folder = os.path.exists(path)
    if folder:
        shutil.rmtree(path)  # 递归删除文件夹


def function_map(sql, type):
    # 函数映射
    func_mapping = dict(
        format='to_char'
    )

    # 通用映射
    sql = sql.replace("{ts}", "${ts}").replace("{hour}", "${hour}")

    if type == 1:
        sql = sql.replace("HH:mm:ss", "HH:mi:ss")
        for key in func_mapping.keys():
            sql = sql.replace(key, func_mapping[key])

    return sql


def data_map():
    arr = config()
    cols_json = arr[0]
    jobs_json = arr[1]
    logic_json = arr[2]
    sql_list = arr[3]

    files = os.listdir(sour_path)
    for file in files:
        if file.split(".")[1] != "json":
            continue
        with open(sour_path + "/" + file, 'r', encoding='UTF-8') as f1:
            trait_json = json.loads(f1.read())
            job_desc = trait_json[0]['title']
            job_list = []
            err_list = []
            for col in trait_json[0]['metrics']:
                for col_name in col['name'].split('#'):
                    if cols_json.get(col_name, None) is not None:  # 若查不到？#问题？
                        job_name = cols_json[col_name]['job_name']
                        name_desc = cols_json[col_name]['hiveColumnName']
                        if job_name not in job_list:
                            job_list.append(job_name)  # 去重
                    else:
                        err_list.append(col_name)

                    # A、json 添加job名和表描述
                    col['job_name'] = str(len(job_list)) + "、" + job_name
                    col['name_desc'] = name_desc

                if '#' in col['name'] and logic_json.get(col['name'], None) is not None:
                    col['logic'] = col['name']

            mkdir('result/{}'.format(job_desc))
            open("result/error.osql", "wb").write("".join(err_list).encode("utf-8"))

            open("result/{}.json".format(job_desc), "wb").write(
                json.dumps(trait_json, indent=2, separators=(',', ':'), ensure_ascii=False).encode(
                    "utf-8"))

            # B、生成对应SQL列表      维护已处理指标集合，并自动写入新的sql
            for job_name in job_list:
                index = job_list.index(job_name) + 1

                # sql处理
                hive_sql = function_map(jobs_json[job_name], 0)
                odps_sql = function_map(jobs_json[job_name], 1)

                # 比对trait库
                if job_name + ".osql" in sql_list:
                    file = open("mapping/traits/{}".format(job_name + ".osql"), 'r',
                                encoding='UTF-8')  # 打开文件
                    job_name = job_name + "_done"
                    odps_sql = file.read()

                table_sql = odps_sql + ";\n\n\n\n\n----hive sql\n\n" + hive_sql
                open("result/{}/{}_{}.osql".format(job_desc, index, job_name), "wb").write(
                    table_sql.encode("utf-8"))


if __name__ == '__main__':
    data_map()
    print(1)
