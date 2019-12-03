CREATE TABLE `t_user_addressinfo` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `memberId` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `receiver_name` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `defaultFlag` varchar(2) NOT NULL DEFAULT '' COMMENT '是否是默认收货地址',
  `mobile` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `province_code` int(11) NOT NULL DEFAULT '0' COMMENT '省级地址code',
  `province_name` varchar(64) NOT NULL DEFAULT '' COMMENT '省级名称',
  `city_code` int(11) NOT NULL DEFAULT '0' COMMENT '城市地址code',
  `city_name` varchar(64) NOT NULL DEFAULT '' COMMENT '城市名称',
  `district_code` int(11) NOT NULL DEFAULT '0' COMMENT '区县code',
  `district_name` varchar(64) NOT NULL DEFAULT '' COMMENT '区县名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '具体地址',
  `email` varchar(128) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `zip_code` int(11) NOT NULL DEFAULT '0' COMMENT '邮政编码',
  `label` varchar(128) NOT NULL DEFAULT '' COMMENT '地址标签',
  `real_name` varchar(64) NOT NULL DEFAULT '' COMMENT '身份证上的姓名，用于海淘场景',
  `id_card_number` varchar(128) NOT NULL DEFAULT '' COMMENT '身份证ID',
  `id_card_valid_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '身份证是否有效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '地址生成时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '地址更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该地址是否已被标记删除',
  PRIMARY KEY (`id`),
  KEY `index_memberId` (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=64390 DEFAULT CHARSET=utf8 COMMENT='用户地址管理表'