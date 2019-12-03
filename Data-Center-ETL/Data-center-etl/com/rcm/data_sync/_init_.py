from com.rcm.etl.数据同步.新版.conf.main import *

source = [dict(
    auth_name="janYu",
    database="smm_greatmart",
    table_list=["t_user_info", "t_admire_record", "t_user_relation", "t_member_device"],
    distable_tag=''  # 分表tag,默认空
), dict(
    auth_name="janYu",
    database="wfm",
    table_list=["wfm_member_info", "wfm_login_log", "wfm_member_rights", "wfm_member_device"],
    distable_tag=''
), dict(
    auth_name="janYu",
    database="smm_order",
    table_list=["t_user_addressinfo", "t_user_profit"],
    distable_tag=''
)]

if __name__ == '__main__':
    get_mysql_meta(source)
