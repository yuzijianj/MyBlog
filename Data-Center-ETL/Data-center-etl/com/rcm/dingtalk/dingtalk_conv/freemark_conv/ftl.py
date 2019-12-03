# coding=utf-8
import os
import re

sour_path = "../ftl"


def regexp(data):
    pt1 = re.compile(r"{[0-9a-zA-Z+-.()/?*,#'} ]*|/?[^日|(周| 月][\u4e00-\u9fa5APPapp]+[-–]{0,1}[\u4e00-\u9fa5GMV]*")
    # pt1 = re.compile(r"{[0-9a-zA-Z+-.()/?*'} ]*|/?[^日|(周| 月][\u4e00-\u9fa5APPapp]+[-–]{0,1}[\u4e00-\u9fa5GMV]*")
    # pt1 = re.compile(r"\?[^日|(周| 月][\u4e00-\u9fa5APP]+[-–]\{0,1}[\u4e00-\u9fa5GMV]*")
    res = pt1.findall(data)
    # 清洗掉纯a-zA-Z

    print("res1--  " + str(res))

    return res


def is_contain_chinese(check_str):
    """
    判断字符串中是否包含中文
    :param check_str: {str} 需要检测的字符串
    :return: {bool} 包含返回True， 不包含返回False
    """
    for ch in check_str:
        if u'\u4e00' <= ch <= u'\u9fff':
            return True
    return False


def file_deal():
    files = os.listdir(sour_path)
    p1 = re.compile(r'([a-z]+[0-9]+).(now|lastDay|lastWeek|lastMonth)')
    p2 = re.compile(r"({|\*100}|\?[^0-9*]*)")
    p3 = re.compile(r"/?[^日|(周| 月][\u4e00-\u9fa5APPapp]+[-–]{0,1}[\u4e00-\u9fa5GMV]*")
    # \?!a[^0-9*]*  非 a开头
    m1 = re.compile(r"[^/]*/[^/]*/[^/]*")

    # 函数映射
    str_mapping = dict(
        now='t1',
        lastDay='t2',
        lastWeek='t3',
        lastMonth='t4'
    )

    for file in files:
        if file.split(".")[1] != "ftl":
            continue
        with open(sour_path + "/" + file, 'r', encoding='UTF-8') as f1:
            file_name = f1.name
            raw_data = f1.read()
            list_data = regexp(raw_data)
            # list_data[0] = "t1.id"
            # list_data.remove(list_data[1])
            res1_data = []
            res2_data = []
            res3_data = []
            for ls in list_data:
                # etl
                if ls.isalpha() and ls not in ('MAU'):
                    continue
                if ls == ",":
                    continue
                if is_contain_chinese(ls) is True:
                    ls = "--" + ls.replace("\n", "")

                res = p1.sub(r'\2.\1', ls)
                res = p2.sub("", res)
                res = res.replace("}", "")
                for key in str_mapping.keys():
                    res = res.replace(key, str_mapping[key])

                ct = res.count("/")
                ct2 = p3.findall(res)
                print(ct2)
                if ct == 1:
                    dt = re.sub(r'/[\s\S]*', "", res)
                elif ct == 4:
                    dt = m1.match(res).group(0)

                if ct != 0:
                    dt = "rate" + dt
                elif res == "t1.id":
                    dt = res
                elif len(ct2) > 0 and is_contain_chinese(ls) is False:
                    dt = "self_format(" + res + ")"
                else:
                    dt = res

                print("res2--  " + res)
                if is_contain_chinese(ls) is False:
                    res = res + ","
                    dt = dt + ","
                else:
                    comment = res.replace("-", "")
                    res3_data.append(comment)
                res1_data.append(res)
                res2_data.append(dt)


            ftl_res1 = "\n".join(res1_data).encode("utf-8")
            ftl_res2 = "\n".join(res2_data).encode("utf-8")
            ftl_res3 = "\n".join(res3_data).encode("utf-8")

            open("{}/{}_res1".format(sour_path, file_name), "wb").write(ftl_res1)
            open("{}/{}_res2".format(sour_path, file_name), "wb").write(ftl_res2)
            open("{}/{}_res3".format(sour_path, file_name), "wb").write(ftl_res3)


if __name__ == '__main__':
    file_deal()
    #
    # text1 = ",t1.e120\n" \
    #         ",(t1.e145-t3.e145)/t3.e145\n" \
    #         ",(t1.e120-lastMonth.e120)/lastMonth.e120\n" \
    #         ",((t1.e801/t1.e201)-(t3.e801/t3.e201))/(t3.e801/t3.e201)"
    #
    # m1 = re.compile(r"[^/]*/[^/]*/[^/]*")
    # for text in text1.split("\n"):
    #     cnt = text.count("/")
    #     if cnt == 1:
    #         data = re.sub(r'/[\s\S]*', "", text)
    #     elif cnt == 4:
    #         data = m1.match(text).group(0)
    #     elif cnt == 0 and text != "t1.id":
    #         data = text.replace(",", ",rate(") + ")"
    #     else:
    #         data = text
    #     data = data.replace(",", ",rate")
    #     print(data)
