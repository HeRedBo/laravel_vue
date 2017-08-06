DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '产品名字',
  `picture` varchar(100) DEFAULT NULL COMMENT '产品图像',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '价格',
  `tag` varchar(50) DEFAULT NULL COMMENT '淘宝关键词',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `goods_third`;
CREATE TABLE `goods_third` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned DEFAULT '0',
  `name` varchar(300) DEFAULT NULL COMMENT '商品名称',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '价格',
  `sales` mediumint(8) unsigned DEFAULT '0',
  `fav_num` mediumint(8) unsigned DEFAULT '0' COMMENT '收藏',
  `props` text  COMMENT '属性',
  `location` varchar(20) DEFAULT NULL COMMENT '所在地',
  `shop_title` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `item_id` bigint(20) unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5424 DEFAULT CHARSET=utf8;