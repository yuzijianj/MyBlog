CREATE TABLE `wfm_member_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员id',
  `phone_number` varchar(64) NOT NULL DEFAULT '' COMMENT '手机号',
  `platform_id` varchar(16) NOT NULL DEFAULT '' COMMENT 'ios,android',
  `term_sys_version` varchar(128) NOT NULL DEFAULT '' COMMENT '系统版本号',
  `term_model` varchar(128) NOT NULL DEFAULT '' COMMENT '设备型号',
  `term_id` varchar(128) NOT NULL DEFAULT '' COMMENT '设备唯一标识',
  `finger_print` varchar(300) NOT NULL DEFAULT '' COMMENT '指纹（风控）',
  `network` varchar(64) NOT NULL DEFAULT '' COMMENT '网络',
  `network_operator` varchar(64) NOT NULL DEFAULT '' COMMENT '网络运营商',
  `major_app_version` varchar(64) NOT NULL DEFAULT '' COMMENT '主APP版本号',
  `app_version` varchar(64) NOT NULL DEFAULT '' COMMENT 'app版本号',
  `app_type` int(11) NOT NULL DEFAULT '0' COMMENT 'app类型（0、未知，1、FDS急用钱，2、TNP小黑鱼，3、JTA融360，4、LAS彩票，5、LICAI珊瑚理财，6、H5-M站，7、……com.tiefan.wfm.intf.enums.MemberIdBizzEnum）',
  `p_value` varchar(64) NOT NULL DEFAULT '' COMMENT 'p值',
  `register_channel` varchar(128) NOT NULL DEFAULT '' COMMENT '注册渠道',
  `source_ip` varchar(32) NOT NULL DEFAULT '' COMMENT 'Ip',
  `position_lon` varchar(32) NOT NULL DEFAULT '' COMMENT '经度',
  `position_lat` varchar(32) NOT NULL DEFAULT '' COMMENT '纬度',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `app_id` varchar(20) NOT NULL DEFAULT 'xhy' COMMENT 'appId',
  PRIMARY KEY (`id`),
  KEY `idx_p_value` (`p_value`),
  KEY `idx_app_type` (`app_type`),
  KEY `user_name` (`phone_number`),
  KEY `idx_member_id` (`member_id`),
  KEY `idx_termId` (`term_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42057828 DEFAULT CHARSET=utf8 COMMENT='设备信息表'