# -*- coding: utf-8 -*-
from odps import ODPS
import requests
import json
import sys

print(sys.argv[1])
print(sys.argv[2])
# 参数：table_name 和 ts
table_name = str(sys.argv[1])
ts = str(sys.argv[2])

# 表名异常处理
warning_url = 'https://oapi.dingtalk.com/robot/send?access_token=c82641c99b8ba515eea9c883276bf9f581d40e8a583e4f8c6ed1f22f1ae6905a'
odps = ODPS('xxx', 'xxx', 'dc_ads')
headers = {'Content-Type': 'application/json'}
err_msg = None
report_instance = odps.execute_sql(
    "select * from dc_ads.dingtalk_report_send_mapping where report_table_name= '" + table_name + "' and del_flag=0")

with report_instance.open_reader() as reader_table:
    for record in reader_table:
        url = record['dict_value']
        if ts is not None and table_name is not None:
            content = None
            instance = odps.execute_sql(
                'select * from dc_ads.' + table_name + ' where id=' + ts + ' limit 1')
            with instance.open_reader() as reader_table:
                for record in reader_table:
                    content = {"content": record['content']}
            if content is not None:
                program = {
                    "msgtype": "text",
                    "text": content
                }
                data = json.dumps(program)
                r = requests.post(url, data=data, headers=headers, timeout=30)
                re_text = r.text.encode('ascii', 'ignore')
                re_json = json.loads(re_text)
                if r.status_code == 200 and re_json['errcode'] == 0:
                    suc_msg = '{0} success send !\n{1}'.format(table_name, re_text)
                    print(suc_msg)
                else:
                    err_msg = table_name + ' DingTalk send failed!'
            else:
                err_msg = table_name + ' DingTalk send failed: content cannot be null'
        else:
            err_msg = table_name + ' DingTalk send failed: parameter cannot be null'

        if err_msg is not None:
            print(err_msg)
            requests.post(warning_url, data=json.dumps({
                "msgtype": "text",
                "text": {"content": err_msg}
            }), headers=headers, timeout=30)
