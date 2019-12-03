# -*- coding: utf-8 -*-
import json
import os
import shutil


# 列转json
def col_to_json():
    with open('mapping/logic_mapping.txt', 'r', encoding='UTF-8') as file:
        dimension_json = dict()
        for list in file.read().split("\n"):
            col = list.replace('\'', "").split("\t")
            if col[2] != "":
                dimension_json[col[1]] = dict(id=col[0], logic=col[2].replace("\\\"", "'"))

        json_str = json.dumps(dimension_json, indent=2, separators=(',', ':'), ensure_ascii=False).encode(
            "utf-8")
        open("mapping/{}.json".format('logic_mapping'), "wb").write(json_str)
        print(1)


# 字符串类型的代码块
def run_string():
    str1 = 'print(2)'
    str2 = "print('{}_{}'.format(1,2))"
    exec("print('Hello World')")
    eval(str1)
    eval(str2)
    eval("print(2 * 3)")


def del_file():
    path = "test"
    os.remove(path)  # 删除文件
    os.removedirs("test/ts")  # 删除空文件夹
    shutil.rmtree(path)  # 递归删除文件夹
