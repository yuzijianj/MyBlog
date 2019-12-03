def deal_raw():
    for x in range(33):
        if x == 0:
            continue
        if x < 10:
            print("a10{} comment ".format(x))
        else:
            print("a1{}".format(x))


def deal_ddl(table):
    comment = open("{}.txt".format(table), 'r', encoding='UTF-8').read().split("\n")
    trait_data = []
    rate_data = []
    rate_sql_data = []
    for col in comment:
        num = comment.index(col)
        if num == 0:
            res = "id String comment \"id,yyyymmdd\""
            trait_data.append(res)
            rate_data.append(res)
            rate_sql_data.append(col)
        elif 0 < num < 10:
            res = "a10{0} bigint comment \"{1}\"".format(num, col)
            if '转化' in res:
                res = res.replace("bigint", 'double')
            trait_data.append(res)
            rate_data.append(res)

            res = "a10{0}_day double comment \"{1}_日比\"".format(num, col)
            rate_data.append(res)
            res = "a10{0}_week double comment \"{1}_周比\"".format(num, col)
            rate_data.append(res)

            res = "--{0}\nself_format(a10{1})".format(col, num)
            rate_sql_data.append(res)
            res = "rate(t1.a10{0},t2.a1{0})".format(num)
            rate_sql_data.append(res)
            res = "rate(t1.a10{0},t3.a1{0})".format(num)
            rate_sql_data.append(res)
        else:
            res = "a1{0} bigint comment \"{1}\"".format(num, col)
            if '转化' in res:
                res = res.replace("bigint", 'double')
            trait_data.append(res)
            rate_data.append(res)

            res = "--{0}\nself_format(a1{1})".format(col, num)
            rate_sql_data.append(res)
            res = "a1{0}_day double comment \"{1}_日比\"".format(num, col)
            rate_data.append(res)
            res = "a1{0}_week double comment \"{1}_周比\"".format(num, col)
            rate_data.append(res)

            res = "rate(t1.a1{0},t2.a1{0})".format(num)
            rate_sql_data.append(res)
            res = "rate(t1.a1{0},t3.a1{0})".format(num)
            rate_sql_data.append(res)

        open("{}_trait_res.txt".format(table), "wb").write(",\n".join(trait_data).encode("utf-8"))
        open("{}_rate_res.txt".format(table), "wb").write(",\n".join(rate_data).encode("utf-8"))
        open("{}_rate_sql_res.txt".format(table), "wb").write(",\n".join(rate_sql_data).encode("utf-8"))


if __name__ == '__main__':
    # deal_ddl("流量业绩日报")
    # deal_ddl("小黑鱼整体流量时报")
    deal_ddl("流量日报")


