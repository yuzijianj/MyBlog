CREATE TABLE `t_member_device` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员号',
  `device_id` varchar(50) NOT NULL DEFAULT '' COMMENT '设备号',
  `client_ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'ip',
  `platform` varchar(10) NOT NULL DEFAULT '' COMMENT '平台',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0-登录1-开屏',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx-member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=725258 DEFAULT CHARSET=utf8 COMMENT='设备记录表'