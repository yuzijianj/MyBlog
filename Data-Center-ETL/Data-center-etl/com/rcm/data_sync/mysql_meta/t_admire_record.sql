CREATE TABLE `t_admire_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员号',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级会员号',
  `order_count` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝期间成交订单数量',
  `admire_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '锁粉时间',
  `expire_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_admire_time` (`admire_time`),
  KEY `idx_member_id` (`member_id`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_expire_time` (`expire_time`)
) ENGINE=InnoDB AUTO_INCREMENT=64048 DEFAULT CHARSET=utf8 COMMENT='用户锁粉记录表'