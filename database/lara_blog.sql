/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : lara_blog

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 03/29/2018 22:27:11 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录名',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '昵称',
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理员头像',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理员邮箱',
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理员手机号码',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录密码',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_username_unique` (`username`),
  UNIQUE KEY `admin_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin`
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES ('1', 'admin', '阿斯蒂', 'admin/avatar/201709252301431506351703.1018325.png', 'qqucx@163.com', '1354027035', '$2y$10$BfJeNdqyPJx4tAopF8Gm2uX0I9gNt4qvWOL13JAS0rEaQYLWj0d32', '3uHeYaFkWgGvaQHlt2ngk2H3bUOr0MajPlBLUwHdxfgM2ovXz1Ex6ntFnyLD', '2017-02-20 07:46:45', '2017-09-25 23:01:43'), ('2', 'test02', 'tesyt', 'admin/avatar/201706211428091498055289.8433364.png', 'hhbjkd@163.com', '13925185624', '$2y$10$vt9KXgYOJrItL0xPvvsyOuMYvLposWgeWu1z4BRmjEAH5BBjVMYK6', null, '2017-06-21 14:28:09', '2017-06-21 14:28:09'), ('3', 'test', '何红波', 'admin/avatar/201707041349201499176160.9228621.jpeg', '1196450116@qq.com', '13925185625', '$2y$10$IL0...iOkVuzMc4ol5Ed.OhmnmKn7MnbXpwF1FHxRRNHMhM5ZXaPC', 'qVFnQHhyNUQw49B4HzNOu9G1OiwrYv6QaIq6OnupT4skpzYOlkL4JynPPd3Q', '2017-07-04 13:49:20', '2017-08-12 03:52:31');
COMMIT;

-- ----------------------------
--  Table structure for `admin_logger`
-- ----------------------------
DROP TABLE IF EXISTS `admin_logger`;
CREATE TABLE `admin_logger` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `catalog` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'url',
  `intro` text COLLATE utf8mb4_unicode_ci COMMENT '操作',
  `ip` char(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1' COMMENT '操作ip',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin_logger`
-- ----------------------------
BEGIN;
INSERT INTO `admin_logger` VALUES ('1', '1', 'create', 'http://www.larablog.com/admin/permission', '添加了后台权限【admin.permission.create】', '127.0.0.1', '1499171721'), ('2', '1', 'create', 'http://www.larablog.com/admin/permission', '添加了后台权限【admin.permission.edit】', '127.0.0.1', '1499171742'), ('3', '1', 'create', 'http://www.larablog.com/admin/permission', '添加了后台权限【admin.permission.destroy】', '127.0.0.1', '1499171805'), ('4', '1', 'create', 'http://www.larablog.com/admin/permission', '添加了后台权限【admin.role.create】', '127.0.0.1', '1499171856'), ('5', '1', 'create', 'http://www.larablog.com/admin/permission', '添加了后台权限【admin.role.edit】', '127.0.0.1', '1499171883'), ('6', '1', 'create', 'http://www.larablog.com/admin/permission', '添加了后台权限【admin.role.destroy】', '127.0.0.1', '1499171912'), ('7', '1', 'create', 'http://www.larablog.com/admin/permission', '添加了后台权限【admin.user.create】', '127.0.0.1', '1499172034'), ('8', '1', 'create', 'http://www.larablog.com/admin/permission', '添加了后台权限【admin.user.edit】', '127.0.0.1', '1499172062'), ('9', '1', 'update', 'http://www.larablog.com/admin/permission/14', '编辑了后台权限【admin.user.edit】', '127.0.0.1', '1499172114'), ('10', '1', 'update', 'http://www.larablog.com/admin/permission/14', '编辑了后台权限【admin.user.edit】', '127.0.0.1', '1499172206'), ('11', '1', 'update', 'http://www.larablog.com/admin/permission/14', '编辑了后台权限【admin.user.edit】', '127.0.0.1', '1499172552'), ('12', '1', 'update', 'http://www.larablog.com/admin/permission/13', '编辑了后台权限【admin.user.create】', '127.0.0.1', '1499172568'), ('13', '1', 'create', 'http://www.larablog.com/admin/permission', '添加了后台权限【admin.user.destroy】', '127.0.0.1', '1499172610'), ('14', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1499175059'), ('15', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1499175086'), ('16', '1', 'update', 'http://www.larablog.com/admin/user/3', '编辑了后台用户【test】', '127.0.0.1', '1499176406'), ('17', '1', 'update', 'http://www.larablog.com/admin/user/3', '编辑了后台用户【test】', '127.0.0.1', '1499176411'), ('18', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1499180676'), ('19', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1499180678'), ('20', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1499180678'), ('21', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1499180679'), ('22', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1499180689'), ('23', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1499180697'), ('24', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1499180747'), ('25', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1499180802'), ('26', '1', 'update', 'http://www.larablog.com/admin/permission/2', '编辑了后台权限【admin.permission.index】', '127.0.0.1', '1499385763'), ('27', '1', 'update', 'http://www.larablog.com/admin/permission/2', '编辑了后台权限【admin.permission.index】', '127.0.0.1', '1499385776'), ('28', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1499988939'), ('29', '1', 'create', 'http://www.larablog.com/admin/category', '添加了后台分类【test】', '127.0.0.1', '1500105680'), ('30', '1', 'update', 'http://www.larablog.com/admin/category/2', '删除了分类【test】', '127.0.0.1', '1500105926'), ('31', '1', 'update', 'http://www.larablog.com/admin/category/1', '删除了分类【asd】', '127.0.0.1', '1500105930'), ('32', '1', 'create', 'http://www.larablog.com/admin/category', '添加了后台分类【Linux】', '127.0.0.1', '1500113679'), ('33', '1', 'create', 'http://www.larablog.com/admin/category', '添加了后台分类【windows】', '127.0.0.1', '1500113796'), ('34', '1', 'create', 'http://www.larablog.com/admin/category', '添加了后台分类【Mysql】', '127.0.0.1', '1500113837'), ('35', '1', 'create', 'http://www.larablog.com/admin/category', '添加了后台分类【mysql 常用命令】', '127.0.0.1', '1500113864'), ('36', '1', 'update', 'http://www.larablog.com/admin/category/6', '编辑了分类【mysql 常用命令】', '127.0.0.1', '1500115123'), ('37', '1', 'update', 'http://www.larablog.com/admin/category/6', '删除了分类【mysql 常用命令】', '127.0.0.1', '1500115129'), ('38', '1', 'create', 'http://www.larablog.com/admin/permission', '添加了后台权限【admin.goods】', '127.0.0.1', '1500115361'), ('39', '1', 'create', 'http://www.larablog.com/admin/permission', '添加了后台权限【admin.category.index】', '127.0.0.1', '1500115437'), ('40', '1', 'update', 'http://www.larablog.com/admin/permission/16', '编辑了后台权限【admin.goods】', '127.0.0.1', '1500115459'), ('41', '1', 'update', 'http://www.larablog.com/admin/permission/1', '编辑了后台权限【admin.permission】', '127.0.0.1', '1500115473'), ('42', '1', 'update', 'http://www.larablog.com/admin/permission/16', '编辑了后台权限【admin.goods】', '127.0.0.1', '1500115484'), ('43', '1', 'create', 'http://www.larablog.com/admin/article', '添加了后台文章【linux】', '127.0.0.1', '1500174715'), ('44', '1', 'create', 'http://www.larablog.com/admin/article', '添加了后台文章【linux】', '127.0.0.1', '1500174784'), ('45', '1', 'update', 'http://www.larablog.com/admin/articles/3', '编辑了后台文章【linux】', '127.0.0.1', '1500182801'), ('46', '1', 'update', 'http://www.larablog.com/admin/articles/3', '编辑了后台文章【linux】', '127.0.0.1', '1500182808'), ('47', '1', 'update', 'http://www.larablog.com/admin/articles/3', '编辑了后台文章【linux】', '127.0.0.1', '1500183774'), ('48', '1', 'update', 'http://www.larablog.com/admin/articles/3', '编辑了后台文章【linux】', '127.0.0.1', '1500183918'), ('49', '1', 'delete', 'http://www.larablog.com/admin/articles/1', '删除了文章[linux]', '127.0.0.1', '1500184018'), ('50', '1', 'create', 'http://www.larablog.com/admin/permission', '添加了后台权限【admin.articles.index】', '127.0.0.1', '1500184211'), ('51', '1', 'create', 'http://www.larablog.com/admin/articles', '添加了后台文章【windows 优化技巧】', '127.0.0.1', '1500184459'), ('52', '1', 'delete', 'http://www.larablog.com/admin/articles/2', '删除了文章[linux]', '127.0.0.1', '1500184602'), ('53', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1500184969'), ('54', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1500199437'), ('55', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1500199447'), ('56', '1', 'create', 'http://www.larablog.com/admin/goods', '添加了商品【admin】', '127.0.0.1', '1501993060'), ('57', '1', 'create', 'http://www.larablog.com/admin/goods', '添加了商品【】', '127.0.0.1', '1501993822'), ('58', '1', 'create', 'http://www.larablog.com/admin/goods', '添加了商品【】', '127.0.0.1', '1501993981'), ('59', '1', 'create', 'http://www.larablog.com/admin/goods', '添加了商品【】', '127.0.0.1', '1501994026'), ('60', '1', 'create', 'http://www.larablog.com/admin/goods', '添加了商品【魅族pro6】', '127.0.0.1', '1501994126'), ('61', '1', 'create', 'http://www.larablog.com/admin/goods', '添加了商品【苹果笔记本电脑】', '127.0.0.1', '1501994718'), ('62', '1', 'delete', 'http://www.larablog.com/admin/goods/6', '删除了商品[苹果笔记本电脑]', '127.0.0.1', '1501994767'), ('63', '1', 'update', 'http://www.larablog.com/admin/goods/5', '编辑了商品【魅族pro6】', '127.0.0.1', '1501998889'), ('64', '1', 'update', 'http://www.larablog.com/admin/goods/5', '编辑了商品【魅族pro6】', '127.0.0.1', '1501998889'), ('65', '1', 'create', 'http://www.larablog.com/admin/goods', '添加了商品【苹果笔记】', '127.0.0.1', '1502003160'), ('66', '1', 'create', 'http://www.larablog.com/admin/permission', '添加了后台权限【admin.goods.index】', '127.0.0.1', '1502016280'), ('67', '1', 'create', 'http://www.larablog.com/admin/goods', '添加了商品【小米笔记本】', '127.0.0.1', '1502031086'), ('68', '1', 'create', 'http://www.larablog.com/admin/goods', '添加了商品【魅族耳机】', '127.0.0.1', '1502031163'), ('69', '1', 'delete', 'http://www.larablog.com/admin/goods/9', '删除了商品[魅族耳机]', '127.0.0.1', '1502031182'), ('70', '1', 'update', 'http://www.larablog.com/admin/goods/8', '编辑了商品【小米笔记本】', '127.0.0.1', '1502031250'), ('71', '1', 'update', 'http://www.larablog.com/admin/user/3', '编辑了后台用户【test】', '127.0.0.1', '1502509951'), ('72', '1', 'update', 'http://www.larablog.com/admin/category/5', '编辑了分类【Mysql】', '127.0.0.1', '1503836422'), ('73', '1', 'update', 'http://www.larablog.com/admin/goods/8', '编辑了商品【小米笔记本】', '127.0.0.1', '1503836577'), ('74', '1', 'update', 'http://www.larablog.com/admin/articles/4', '编辑了后台文章【windows 优化技巧】', '127.0.0.1', '1503836639'), ('75', '1', 'update', 'http://www.larablog.com/admin/articles/4', '编辑了后台文章【windows 优化技巧】', '127.0.0.1', '1503836663'), ('76', '1', 'update', 'http://www.larablog.com/admin/articles/4', '编辑了后台文章【windows 优化技巧】', '127.0.0.1', '1503836685'), ('77', '1', 'create', 'http://www.larablog.com/admin/articles', '添加了后台文章【test】', '127.0.0.1', '1503837171'), ('78', '1', 'update', 'http://www.larablog.com/admin/user/1', '编辑了后台用户【admin】', '127.0.0.1', '1506351703'), ('79', '1', 'update', 'http://www.larablog.com/admin/goods/7', '编辑了商品【苹果笔记】', '127.0.0.1', '1506433289'), ('80', '1', 'update', 'http://www.larablog.com/admin/permission/18', '编辑了后台权限【admin.articles.index】', '127.0.0.1', '1508040196'), ('81', '1', 'update', 'http://www.larablog.com/admin/permission/2', '编辑了后台权限【admin.permission.index】', '127.0.0.1', '1508040216');
COMMIT;

-- ----------------------------
--  Table structure for `admin_message`
-- ----------------------------
DROP TABLE IF EXISTS `admin_message`;
CREATE TABLE `admin_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `from_uid` int(10) unsigned DEFAULT '0' COMMENT '发自',
  `to_uid` int(10) unsigned DEFAULT '0' COMMENT '发送至',
  `content` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `is_read` tinyint(1) DEFAULT '0' COMMENT '0未读 1已读',
  `send_at` int(10) unsigned DEFAULT '0' COMMENT '发送时间',
  `created_at` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin_message`
-- ----------------------------
BEGIN;
INSERT INTO `admin_message` VALUES ('1', '新消息', '1', '3', '你有一条新信息', '0', '0', '1502510053'), ('2', '新消息', '1', '3', 'testadas', '0', '0', '1502613205');
COMMIT;

-- ----------------------------
--  Table structure for `admin_permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_role`;
CREATE TABLE `admin_permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permission_role_permission_id_role_id_unique` (`permission_id`,`role_id`),
  KEY `admin_permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin_permission_role`
-- ----------------------------
BEGIN;
INSERT INTO `admin_permission_role` VALUES ('5', '1', '1'), ('10', '1', '3'), ('6', '2', '1'), ('1', '2', '2'), ('11', '2', '3'), ('7', '3', '1'), ('12', '3', '3'), ('8', '4', '1'), ('4', '4', '2'), ('13', '4', '3'), ('9', '5', '1'), ('14', '5', '3'), ('15', '7', '1'), ('16', '8', '1'), ('17', '9', '1'), ('18', '10', '1'), ('19', '11', '1'), ('20', '12', '1'), ('21', '13', '1'), ('22', '14', '1'), ('23', '15', '1'), ('24', '16', '1'), ('27', '16', '4'), ('25', '17', '1'), ('28', '17', '4'), ('26', '18', '1'), ('29', '18', '4'), ('30', '19', '4');
COMMIT;

-- ----------------------------
--  Table structure for `admin_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限名称',
  `display_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '显示名称',
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '层级',
  `icon` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'icon 图标',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `order_num` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin_permissions`
-- ----------------------------
BEGIN;
INSERT INTO `admin_permissions` VALUES ('1', 'admin.permission', '权限管理', '', '0', 'fa-users', '0', '1', '5', '2017-06-27 14:33:22', '2017-07-15 10:44:33'), ('2', 'admin.permission.index', '权限列表', '', '0', '', '1', '0', '1', '2017-06-27 14:36:29', '2017-10-15 12:03:36'), ('3', 'admin.role.index', '角色列表', '', '0', '', '1', '1', '0', '2017-06-27 14:37:32', '2017-06-27 14:37:32'), ('4', 'admin.user.index', '用户管理', '', '0', '', '1', '1', '0', '2017-06-27 14:38:46', '2017-06-27 14:38:46'), ('5', 'admin.user.logger', '操作日志', '', '0', '', '1', '1', '0', '2017-06-27 14:39:26', '2017-06-27 14:39:26'), ('7', 'admin.permission.create', '权限添加', '', '0', '', '2', '1', '1', '2017-07-04 12:35:21', '2017-07-04 12:35:21'), ('8', 'admin.permission.edit', '权限编辑', '', '0', '', '2', '1', '0', '2017-07-04 12:35:42', '2017-07-04 12:35:42'), ('9', 'admin.permission.destroy', '权限删除', '', '0', '', '2', '1', '0', '2017-07-04 12:36:45', '2017-07-04 12:36:45'), ('10', 'admin.role.create', '角色添加', '', '0', '', '3', '1', '0', '2017-07-04 12:37:36', '2017-07-04 12:37:36'), ('11', 'admin.role.edit', '权限编辑', '', '0', '', '3', '1', '0', '2017-07-04 12:38:03', '2017-07-04 12:38:03'), ('12', 'admin.role.destroy', '权限删除', '', '0', '', '3', '1', '0', '2017-07-04 12:38:32', '2017-07-04 12:38:32'), ('13', 'admin.user.create', '用户添加', '', '0', '', '4', '1', '2', '2017-07-04 12:40:34', '2017-07-04 12:49:28'), ('14', 'admin.user.edit', '用户编辑', '', '0', '', '4', '1', '1', '2017-07-04 12:41:02', '2017-07-04 12:49:12'), ('15', 'admin.user.destroy', '用户删除', '', '0', '', '4', '1', '0', '2017-07-04 12:50:10', '2017-07-04 12:50:10'), ('16', 'admin.goods', '内容管理', '', '0', 'fa  fa-tag', '0', '1', '10', '2017-07-15 10:42:41', '2017-07-15 10:44:44'), ('17', 'admin.category.index', '分类管理', '', '0', '', '16', '1', '0', '2017-07-15 10:43:57', '2017-07-15 10:43:57'), ('18', 'admin.articles.index', '文章管理', '', '0', '', '16', '1', '0', '2017-07-16 05:50:11', '2017-07-16 05:50:11'), ('19', 'admin.goods.index', '商品列表', '', '0', '', '16', '1', '0', '2017-08-06 10:44:40', '2017-08-06 10:44:40');
COMMIT;

-- ----------------------------
--  Table structure for `admin_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_user`;
CREATE TABLE `admin_role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_role_user_user_id_role_id_unique` (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin_role_user`
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_user` VALUES ('4', '1', '1'), ('3', '3', '4');
COMMIT;

-- ----------------------------
--  Table structure for `admin_roles`
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `display_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '显示名称',
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `admin_roles`
-- ----------------------------
BEGIN;
INSERT INTO `admin_roles` VALUES ('1', '超级管理员', '', '系统超级管理员', '2017-06-28 17:07:25', '2017-06-28 17:07:25'), ('2', '库存管理员', '', '库存管理员 负责公司库存相关操作', '2017-06-28 17:16:51', '2017-06-28 17:16:51'), ('3', '开发程序员', '', '负责功能模块开发', '2017-06-28 17:17:15', '2017-06-28 17:17:15'), ('4', '测试角色1', '', '测试角色1', '2017-06-28 17:17:50', '2017-06-28 17:39:00');
COMMIT;

-- ----------------------------
--  Table structure for `articles`
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(5) unsigned DEFAULT '0' COMMENT '类型',
  `category_id` int(10) unsigned DEFAULT '0' COMMENT '分类id',
  `picture` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '封面',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '简介',
  `content` text COLLATE utf8mb4_unicode_ci,
  `view_num` int(10) unsigned DEFAULT '0' COMMENT '浏览数量',
  `is_hot` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `articles`
-- ----------------------------
BEGIN;
INSERT INTO `articles` VALUES ('3', '0', '3', 'images/201707160313031500174783.9896826.jpeg', 'linux', 'linux', 'linux', '<p>title qwe qwe we qwe qwe&nbsp;</p><p><br></p><p><br></p>', '0', '0', '2017-07-16 03:13:03', '2017-07-16 05:45:18'), ('4', '0', '4', 'images/201707160554191500184459.1466178.jpeg', 'windows 优化技巧', 'windows,优化技巧', 'windows 优化技巧windows 优化技巧windows 优化技巧windows 优化技巧', '<p>&nbsp;优化技巧优化技巧优化技巧优化技巧优化技巧优化技巧优化技巧</p>', '0', '1', '2017-07-16 05:54:19', '2017-09-04 07:15:01'), ('5', '0', '4', 'images/201708272032511503837171.6995122.jpeg', 'test', 'test,name', 'twsetwqe', '<p>esasdfasdf</p>', '0', '0', '2017-08-27 20:32:51', '2017-08-27 20:32:51');
COMMIT;

-- ----------------------------
--  Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT '0' COMMENT '类型',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `order_num` smallint(5) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `category`
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES ('3', '0', 'Linux', '0', '2017-07-15 10:14:39', '2017-07-15 10:14:39'), ('4', '0', 'windows', '2', '2017-07-15 10:16:36', '2017-07-15 10:16:36'), ('5', '3', 'Mysql', '10', '2017-07-15 10:17:17', '2017-08-27 20:20:22');
COMMIT;

-- ----------------------------
--  Table structure for `goods`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `goods`
-- ----------------------------
BEGIN;
INSERT INTO `goods` VALUES ('5', '魅族pro6', 'images/201708060435261501994126.8316494.jpeg', '2689.00', '魅族pro6', '2017-08-06 04:35:26', '2017-08-06 05:54:49'), ('7', '苹果笔记', 'goods/201708060706001502003160.7096402.png', '12554.00', '苹果笔记', '2017-08-06 07:06:00', '2017-08-06 07:06:00'), ('8', '小米笔记本', 'goods/201708061451261502031086.1953820.png', '4890.00', '小米笔记本', '2017-08-06 14:51:26', '2017-08-27 20:22:57');
COMMIT;

-- ----------------------------
--  Table structure for `goods_third`
-- ----------------------------
DROP TABLE IF EXISTS `goods_third`;
CREATE TABLE `goods_third` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned DEFAULT '0',
  `name` varchar(300) DEFAULT NULL COMMENT '商品名称',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '价格',
  `sales` mediumint(8) unsigned DEFAULT '0',
  `fav_num` mediumint(8) unsigned DEFAULT '0' COMMENT '收藏',
  `props` text COMMENT '属性',
  `location` varchar(20) DEFAULT NULL COMMENT '所在地',
  `shop_title` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `item_id` bigint(20) unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5824 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `goods_third`
-- ----------------------------
BEGIN;
INSERT INTO `goods_third` VALUES ('5724', '7', 'Apple/苹果 MacBook Air MD711CH/B MD760 11 13寸超薄笔记本电脑', '3999.00', '0', '1302', '2014款 11寸 MD711B 128G,2015款 11寸 MD712B 256G,2015款 11寸 MJVM2 128G,2015款 11寸 MJVP2 256G,2013款 13寸 MD760A   128G,2013款 13寸 MD761A  256G,2014款 13寸 MD760B  128G,2014款 13寸 MD761B  256G,2015款 13寸 MJVE2 128G,2015款 13寸 MJVG2 256G,2016款 13寸 MMGF2 128G,2016款 13寸 MMGG2 256G,拍下联系客服改价', '浙江杭州', '黑猫苹果体验店', '540510427360', '2017-08-06 07:28:46', '2017-08-06 07:28:46'), ('5725', '7', 'Apple/苹果 MacBook Air MMGG2CH/A  苹果笔记本电脑超薄学生办公', '4388.00', '0', '450', '16款/13寸/GF2/8/128/ 5代5250U,16款/13寸/GG2/8/256/ 5代5250U,15款/13寸/VE2/4/128/ 5代 5250U,15款/13寸/VG2/4/256/ 5代5250U,14款/13寸/760B/4/128/4代4260U,14款/13寸/761B/4/256/4代4260U,14款/13寸/761A/4/256/4代4250U,15款/11寸/VM2/4/128/ 5代5250U,15款/11寸/VP2/4/256/ 5代5250U,14款/11寸/712B/4/256/ 4代4250U,13款/11寸/711A定制/8/25/ 4650U,13款/11寸/712A/4/256/ 4代4250U', '广东广州', '乐途本本', '553782771094', '2017-08-06 07:28:46', '2017-08-06 07:28:46'), ('5726', '7', '17新款Apple/苹果 13 英寸 1.8GHz 处理器 MacBook Air笔记本电脑', '6188.00', '0', '372', '银色', '广东深圳', '禾木林数码专营店', '553473584568', '2017-08-06 07:28:46', '2017-08-06 07:28:46'), ('5727', '7', 'Apple/苹果 12 英寸 MacBook 256GB MLHF2 视网膜笔记本电脑 NEW', '5988.00', '0', '7168', '2015款 M 1.1G 256G,2016款 M3 256G 金色8月8促销,2016款 M3 1.1G 256G,2016款 M5 1.2G 512G,2015款 M 1.2G 512G,2016款 M7 1.3G 512G,拍下备注需要的颜色或者联系小二,15款有金色 银色 灰色,16款有金色 银色 灰色 玫瑰金,2017款 i5 1.3G 256G 新款', '广东广州', '香港数码港湾', '45874856601', '2017-08-06 07:28:47', '2017-08-06 07:28:47'), ('5728', '7', '2017新款Apple/苹果MacBook Air MMGF2CH/A国行笔记本13英寸MQD32', '5950.00', '0', '218', '17款13寸低配【MQD32CH/A】,17款13寸高配【MQD42CH/A】,17款低配定制2.2 i7CPU,17款高配定制2.2 i7CPU,17款高配定制512G SSD,17款高配定制2.2 i7CPU+512G SSD,16款低配定制2.2 i7CPU,16款高配定制2.2 i7CPU', '上海', 'Machome苹果家园', '529546020704', '2017-08-06 07:28:47', '2017-08-06 07:28:47'), ('5729', '7', '2017新款国行Apple/苹果12英寸 MacBook 256GB超薄笔记本电脑512G', '7980.00', '0', '3840', '17款国行灰色256G-低配,17款国行银色256G-低配,17款国行金色256G-低配,17款国行玫瑰金256G-低配,17款国行灰色512G-高配,17款国行银色512G-高配,17款国行金色512G-高配,17款国行玫瑰金512G-高配,17款选配1.2 M3/16G内存/256G,17款选配1.3 i5/16G内存/256G,17款选配1.4 i7/16G内存/256G,17款选配1.3 i5/16G内存/512G,17款选配1.4 i7/8G内存/512G,17款选配1.4 i7/16G内存/512G,16款国行灰色256G-低配,16款国行金色256G-标配,16款国行灰色512G-高配,16款国行银色512G-高配,16款国行金色512G-高配,16款国行玫瑰金512G-高配,荐-16款定制M7-8G内存-512G金色', '上海', 'Machome苹果家园', '521384140733', '2017-08-06 07:28:50', '2017-08-06 07:28:50'), ('5730', '7', 'Apple/苹果 MacBook Pro MJLT2CH/A MLH42 15寸Retina笔记本电脑', '6988.00', '0', '1260', '15款 MJLT2 2.5G 512G,14款 MGXC2 2.5G 512G,15款 MJLQ2 2.2G 256G,13款 ME294,16款 MLH42 2.7G 512G R455 2G,15款 MJLT2 2.8G 1000G,15款 MJLQ2 2.2G 512G,14款 MGXA2 2.2G 256G,13款 ME293,16款 MLH32 2.6G 256G R450 2G,17款 MPTR2 2.8G 256G R555 2G,17款 MPTU2 2.8G 256G R555 2G,17款  i7 3.1G 256G R560 4G  顶', '广东广州', '香港数码港湾', '545994516921', '2017-08-06 07:28:51', '2017-08-06 07:28:51'), ('5731', '7', '2017款Apple/苹果 13英寸 MacBook Pro 13寸笔记本电脑xq2 xv2xw2', '8568.00', '0', '6386', '17款低配128G深空灰MPXQ2CH/A,17款低配128G银色MPXR2CH/A,17款低配256G深空灰MPXT2CH/A,17款低配256G银色MPXU2CH/A,17款中配256G深空灰MPXV2CH/A,17款中配256G银色MPXX2CH/A,17款高配512G深空灰MPXW2CH/A,17款高配512G银色MPXY2CH/A', '广东深圳', '骏腾数码总店(正品)', '540878708394', '2017-08-06 07:28:51', '2017-08-06 07:28:51'), ('5732', '7', '2017 Apple/苹果 MacBook Air MMGF2CH/A MAC超薄笔记本电脑 13寸', '5950.00', '0', '6816', '具体请参考宝贝里官网配置截图,信用卡和花呗要另外补1%手续费,2017行货13寸D32（官网6988）,2017行货13寸D42（官网8488）,都是未拆官方原封国行机器,2017 15寸pro高配TV2 激活7.22日', '上海', '牛牛的梦想新世界', '520863574450', '2017-08-06 07:28:52', '2017-08-06 07:28:52'), ('5733', '7', '17款Apple/苹果 13英寸：MacBook Pro 3.1GHz 处理器 256GB笔记本', '13288.00', '0', '794', '银色,深空灰色', '浙江杭州', '卓辰数码旗舰店', '553359777848', '2017-08-06 07:28:52', '2017-08-06 07:28:52'), ('5734', '7', 'Apple/苹果 MacBook Air MJVM2CH/A MD711B P2苹果笔记本电脑', '3685.00', '0', '1948', 'MJVM2 i5/4G/128G/HD6000,MJVP2  i5/4G/256G/HD6000,MD712B  i5/4G/256G/HD5000,MD711B  i5/4G/128G/HD5000,MD711A i5/4G/128G/HD5000,MD712A  i5/4G/256G/HD5000,其他型号拍下改价格', '广东广州', '艾菲尔苹果店', '540337644526', '2017-08-06 07:28:52', '2017-08-06 07:28:52'), ('5735', '7', '国行Apple/苹果 12 英寸 MacBook 256GB笔记本电脑512可定制2017', '7980.00', '0', '756', '16款国行金色低配256GB,16款国行灰色低配256GB,16款国行玫瑰金低配256GB,16款国行金色高配512GB,16款国行银色高配512GB,16款国行灰色高配512GB,16款国行玫瑰金高配512GB,17款国行金色低配256GB,17款国行灰色低配256GB,17款国行银色低配256GB,17款国行玫瑰金低配256GB,17款国行金色高配512GB,17款国行灰色高配512GB,17款国行银色高配512GB,17款国行玫瑰金高配512GB,官方选配M3 1.2G/16GB/256GB,官方选配i5 1.3G/16GB/256GB,官方选配i7 1.4G/16GB/256GB,官方选配i5 1.3G/16GB/512GB,官方选配i7 1.4G/8GB/512GB,官方选配i7 1.4G/16GB/512GB,官方选配i7 1.4G/8GB/256GB', '上海', '苹果地带MacZone', '44171846574', '2017-08-06 07:28:53', '2017-08-06 07:28:53'), ('5736', '7', 'Apple/苹果 MacBook Air MMGF2CH/A 11寸13寸 D32 D42 笔记本电脑', '4000.00', '0', '14588', '15款11寸128G/4G/1.6港行标配VM2,15款11寸256G/4G/1.6港行高配VP2,15款13寸128G/4G/1.6港行标配VE2,15款13寸256G/4G/1.6港行高配VG2,16款13寸128G/8G/1.6港行标配GF2,16款13寸256G/8G/1.6港行高配GG2,16款13寸128G/8G/1.6国行标配GF2,16款13寸256G/8G/1.6国行高配GG2,17款13寸128/8G/1.8国行标配D32,17款13寸256/8G/1.8国行标配D42,【国行带官方牛皮纸盒】,【香港定制7-15工作日】', '广东深圳', 'WAYEN韦恩国际代购', '38814120197', '2017-08-06 07:28:54', '2017-08-06 07:28:54'), ('5737', '7', '国行13寸Apple/苹果 MacBook Pro MF839CH/A笔记本macbookpro2017', '7730.00', '0', '540', '15款13寸i5 2.7/8G/128G/ 银839,15款15寸i7 2.2/16G/256G/银LQ2,16款13寸i5 2.0/8G/256G/银-UQ2,16款13寸i5 2.0/8G/256G/灰-L42,16款13寸i5 2.9/8G/256/Bar银VP2,16款13寸i5 2.9/8G/256/Bar灰H12,16款13寸i5 2.9/8G/512/Bar银QG2,16款13寸i5 2.9/8G/512/Bar灰QF2,16款15寸i7 2.6/16G/256Bar银W72,16款15寸i7 2.6/16G/256Bar灰H32,16款15寸i7 2.7/16G/512Bar银W82,16款15寸i7 2.7/16G/512Bar灰H42,17款13寸i5 2.3/8G/128G灰-XQ2,17款13寸i5 2.3/8G/128G银-XR2,17款13寸i5 2.3/8G/256G灰-XT2,17款13寸i5 2.3/8G/256G银-XU2,17款13寸i5 3.1/8G/256/Bar灰XV2,17款13寸i5 3.1/8G/256/Bar银XX2,17款13寸i5 3.1/8G/512/Bar灰XW2,17款13寸i5 3.1/8G/512/Bar银XY2,17款15寸i7 2.8/16G/256Bar灰TR2,17款15寸i7 2.8/16G/256Bar银TU2,17款15寸i7 2.9/16G/512Bar灰TT2,17款15寸i7 2.9/16G/512Bar银TV2', '北京', '北京天天数码港', '527393811630', '2017-08-06 07:28:54', '2017-08-06 07:28:54'), ('5738', '7', 'Apple/苹果 MacBook Pro MF839CH/A  MGX72 MD212 笔记本电脑13寸', '4988.00', '0', '2714', '15款13寸MF839,15款13寸MF840,15款13寸MF841,14款13寸MGX72,14款13寸MGX82,14款13寸MGX92,13款13寸MD212,13款13寸MD213,13款13寸ME662,16款13寸MLL42-无Bar,16款13寸MLVP2美版-带Bar', '广东广州', '乐途本本', '544540649127', '2017-08-06 07:28:57', '2017-08-06 07:28:57'), ('5739', '7', 'Apple/苹果 MacBook Air MJVM2CH/A VP2,MD711B 11.6寸笔记本电脑', '4088.00', '0', '7000', '2015款 11寸 MJVM2 128G,2015款 11寸 MJVP2  256G,2014款 11寸 MD712B 256G,2013款 11寸 MD711A,2014款 11寸 MD711B 128G,15款 11寸 MJVM2 i7 8G 128G,15款 11寸 MJVP2 i7 8G 256G,14款 11寸 MD711B i7 8G 128G,14款 11寸 MD712B i7 8G 256G', '广东广州', '香港数码港湾', '36418004875', '2017-08-06 07:28:57', '2017-08-06 07:28:57'), ('5740', '7', 'Apple/苹果 12 英寸 MacBook 256GB 笔记本 new 512G电脑2017新款', '7888.00', '0', '3198', 'YF2新款M3 1.2G/8G/256G/灰色,YH2新款M3 1.2G/8G/256G/银色,YK2新款M3 1.2G/8G/256G/金色,YM2新款M3 1.2G/8G/256G/玫瑰金,YG2新款i5 1.3G/8G/512G/灰色,YJ2新款i5 1.3G/8G/512G/银色,YL2新款i5 1.3G/8G/512G/金色,YN2新款i5 1.3G/8G/512G/玫瑰金,2016款H72国/m3/8G/256G/灰色,2016款HA2国/m3/8G/256G/银色,2016款HE2国/m3/8G/256G/金色,2016款GL2国/m3/8G/256G/玫瑰金,2016款H82国/m5/8G/512G/灰色,2016款HC2国/m5/8G/512G/银色,2016款HF2国/m5/8G/512G/金色,2016款GM2国/m5/8G/512G/玫瑰金,新款2017定制M3 1.2G/16G/256G,新款2017定制i5 1.3G/16G/256G,新款2017定制i7 1.4G/16G/256G,新款2017定制i5 1.3G/16G/512G,新款2017定制i7 1.4G/16G/512G,2017新款MacBook升级定制', '上海', '小徐苹果直销店', '44824988903', '2017-08-06 07:28:57', '2017-08-06 07:28:57'), ('5741', '7', '17款Apple/苹果 12 英寸 1.2GHz 处理器256G 轻薄 便携笔记本电脑', '9588.00', '0', '920', '金色,银色,深空灰色,玫瑰金色', '浙江杭州', '卓辰数码旗舰店', '553434215531', '2017-08-06 07:28:58', '2017-08-06 07:28:58'), ('5742', '7', '2017款Apple/苹果 MacBook Pro MF839CH/A 13寸15寸XV2笔记本定制', '6666.00', '0', '5022', '15款/13寸/低配839/2.7/8G/128,定制机官网价格88折 定金链接,17款13寸/i5 2.3/8G/128/640/灰,17款13寸/i5 2.3/8G/128/640/银,17款13寸/i5 2.3/8G/256/640/灰,17款13寸/i5 2.3/8G/256/640/银,17款13寸/i5 3.1/8G/256/Bar/灰,17款13寸/i5 3.1/8G/256/Bar/银,17款13寸/i5 3.1/8G/512/Bar/灰,17款13寸/i5 3.1/8G/512/Bar/银,17款15寸/i7 2.8/16G/256/Bar/灰,17款15寸/i7 2.8/16G/256/Bar/银,17款15寸/i7 2.9/16G/512/Bar/灰,17款15寸/i7 2.9/16G/512/Bar/银,16款13寸/i5 2.0/8G/256/540/灰,16款13寸/i5 2.0/8G/256/540/银,16款13寸/i5 2.9/8G/256/Bar/灰,16款13寸/i5 2.9/8G/256/Bar/银,16款13寸/i5 2.9/8G/512/Bar/灰,16款13寸/i5 2.9/8G/512/Bar/银,16款15寸/i7 2.6/16G/256/Bar/灰,16款15寸/i7 2.6/16G/256/Bar/银,16款15寸/i7 2.7/16G/512/Bar/灰,16款15寸/i7 2.7/16G/512/Bar/银', '上海', '九年老店苹果帮原沪港直通车', '10107886924', '2017-08-06 07:28:58', '2017-08-06 07:28:58'), ('5743', '7', 'Apple/苹果 13 英寸: MacBook Air 128GB D32 笔记本电脑2017新款', '5680.00', '0', '218', '2016款128G银色MMGF2CH/A,2016款256G银色MMGG2CH/A,2017新款128G银色MQD32CH/A现货,2017新款256G银色MQD42CH/A现货', '四川成都', 'Apple苹果之家－初心', '543491243903', '2017-08-06 07:28:58', '2017-08-06 07:28:58'), ('5744', '7', '2017新款Apple/苹果 MacBook Pro MLH12CH/A13/15寸笔记本电脑bar', '7820.00', '0', '206', '2017款13寸128G灰色MPXQ2CH/A,2017款13寸128G银色MPXR2CH/A,2017款13寸256G灰色MPXT2CH/A,2017款13寸256G银色MPXU2CH/A,2017款Bar13寸256灰色MPXV2CH/A,2017款Bar13寸256银色MPXX2CH/A,2017款Bar13寸512灰色MPXW2CH/A,2017款Bar13寸512银色MPXY2CH/A,2017款Bar15寸256灰色MPTR2CH/A,2017款Bar15寸256银色MPTU2CH/A,2017款Bar15寸512灰色MPTT2CH/A,2017款Bar15寸512银色MPTV2CH/A,2016款13寸256G灰色MLL42CH/A,2016款13寸256G银色MMUQ2CH/A,2016款Bar13寸256灰色MLH12CH/A,2016款Bar13寸256银色MLVP2CH/A,2016款Bar13寸512灰色MNQF2CH/A,2016款Bar13寸512银色MNQG2CH/A,2016款Bar15寸256灰色MLH32CH/A,2016款Bar15寸256银色MLW72CH/A,2016款Bar15寸512灰色MLH42CH/A,2016款Bar15寸512银色MLW82CH/A,2015款13寸128G银色MF839CH/A,2015款15寸256G银色MJLQ2CH/A', '四川成都', 'Apple苹果之家－初心', '543872421063', '2017-08-06 07:29:00', '2017-08-06 07:29:00'), ('5745', '7', '蓝鹰致品LYZPIN GD全新笔记本电脑I7游戏便携本13.3英寸手提苹果', '3088.00', '0', '174', '金色', '广东广州', '蓝鹰科技笔记本电脑', '537339822214', '2017-08-06 07:29:00', '2017-08-06 07:29:00'), ('5746', '7', '2017新款Apple/苹果 MacBook Pro MLH32CH/A13 15.4英寸H42笔记本', '11850.00', '0', '256', '15款15寸低/2.2/16G/256G【LQ2】,热销-16款15低/2.6/16G/256G/灰,热销-16款15低/2.6/16G/256G/银,热销-16款15高/2.7/16G/512G/灰,热销-16款15高/2.7/16G/512G/银,75折16款15寸高定2.9/2TB/460 4G,17款15寸低/2.8/16G/256G/灰,17款15寸低/2.8/16G/256G/银,17款15寸高/2.9/16G/512G/灰,17款15寸高/2.9/16G/512G/银,17款15寸选配定制机型专拍,15款15寸定制2.2 i7/16G/512G', '上海', 'Machome苹果家园', '529452887365', '2017-08-06 07:29:00', '2017-08-06 07:29:00'), ('5747', '7', '2017全新款Apple/苹果 MacBook Air MMGF2CH/A国港行版笔记本电脑', '5000.00', '0', '276', '以下国行官方全新牛皮纸盒双原封,17款13寸i5 1.8/8G/128G/集显/银,17款13寸i5 1.8/8G/256G/集显/银,16款13寸i5 1.6/8G/128G/集显/银,16款13寸i5 1.6/8G/256G/集显/银,八年代购老店，诚信第一,人格担保100%全新原封原装正品,官方渠道代购，无任何中间环节,现货说话，当天即可发出,花呗额度不够可以分开支付,支持上门自提，顺丰包邮', '江苏南京', '小骁Apple苹果代购', '40406842586', '2017-08-06 07:29:01', '2017-08-06 07:29:01'), ('5748', '7', 'Apple/苹果 MacBook Pro MJLT2CH/A LQ2 MC975笔记本电脑15寸独显', '6488.00', '0', '1608', '15寸2012年MC975,15寸2012年ME664,15寸2013年ME294,15寸2015年MJLT2,15寸2014年MGXC2,15寸2015年MJLQ2,15寸2014年MGXA2', '广东广州', '苹果尊选 恒久信赖', '39289739767', '2017-08-06 07:29:02', '2017-08-06 07:29:02'), ('5749', '7', '笔记本游戏本全新电脑八通道代购快递直发游戏本苹果外星人戴尔', '1000.00', '0', '44', '电脑,电脑佣金,香港路线及人肉,普通USPS,快速USPS', '美国', '豪情海外', '545636202162', '2017-08-06 07:29:02', '2017-08-06 07:29:02'), ('5750', '7', 'Apple/苹果 MacBook Air MMGF2CH/A G2 MJVE2笔记本电脑13寸超薄', '5188.00', '0', '118', '16年 MMGF2 8G/128G全新,16年 MMGG2 8G/256G全新,16年 MMGF2 8G/128G拆封,15年 MJVE2 4G/128G拆封,15年 MJVG2 4G/256G拆封,14年 MD760B 4G/128G拆封,14年 MD761B 4G/256G拆封,13年 MD760A 4G/128G拆封,13年 MD761A 4G/256G拆封,12年 MD231 4G/128G拆封,12年 MD232 4G/256拆封', '北京', '韩氏乐淘', '553169537712', '2017-08-06 07:29:02', '2017-08-06 07:29:02'), ('5751', '7', 'Apple/苹果 MacBook Air MJVM2CH/A 11寸13寸超薄便携笔记本电脑', '4288.00', '0', '58', 'MD711A（11.6寸）,MD711B（11.6寸）,MJVM2（11.6寸）,MD760A (13.3寸),MD760B (13.3寸),MJVE2 (13.3寸,其它型号请联系客服', '北京', '北京伟豪数码正品店', '553698334890', '2017-08-06 07:29:02', '2017-08-06 07:29:02'), ('5752', '7', 'Apple/苹果 MacBook Air MJVM2CH/A 苹果笔记本AIR 11.6寸', '3700.00', '0', '1834', '14款I5 4G 128G  MD711B,15款 I5 4G 128G MJVM2CH/A,15款 I5 4G 256G MJVP2CH/A,13款I5 4G 128G  MD711A', '陕西西安', '善本之家', '543698537718', '2017-08-06 07:29:04', '2017-08-06 07:29:04'), ('5753', '7', 'Apple/苹果 12 英寸 MacBook 256GB 苹果笔记本电脑超薄 玫瑰金', '7860.00', '0', '20', '17款256G灰色MNYF2,17款256G银色MNYH2,17款256G金色MNYK2,17款256G玫瑰金色MNYM2,17款512G灰色MNYG2,17款512G银色MNYJ2,17款512G金色MNYL2,16款256G灰色MLH72,16款256G金色MLHE2,16款512G灰色MLH82,16款512G银色MLHC2,16款512G金色MLHF2', '广东广州', '菊花本本', '554545718378', '2017-08-06 07:29:04', '2017-08-06 07:29:04'), ('5754', '7', 'Apple/苹果 MacBook Pro MJLQ2CH/A LT2 15寸Retina笔记本电脑H32', '6488.00', '0', '11808', '2012款 Retina Pro 15寸,2015款 顶配  MJLT2 2.5G,2014款 中配 MGXA2 256G,2013款 Retina Pro 15寸,2015款 中配 MJLQ2  256G,2014款 顶配 MGXC2 512G,2016款 中配 MLH32 256G,2016款 高配 MLH42 512G', '广东广州', '香港数码港湾', '22461095788', '2017-08-06 07:29:04', '2017-08-06 07:29:04'), ('5755', '7', 'Apple/苹果 12 英寸 MacBook 256GB 12寸retina笔记本电脑 2017款', '8100.00', '0', '118', '老款H72 深空灰256G国行,老款HA2 银色256G国行,老款HE2 香槟金256G国行,老款GL2 玫瑰金256G国行,新款 YK2香槟金256G国行,新款 YM2玫瑰金256G国行,新款 YH2银色256G国行,新款 YF2深空灰256G国行,新款 YL2香槟金512G国行,新款 YN2玫瑰金512G国行,新款 YJ2银色512G国行,新款 YG2深空灰512G国行,老款 GM2玫瑰金512G国行,老款 HF2香槟金512G国行,老款 HC2银色512G国行,老款 H82深空灰512G国行', '四川成都', '万淘宜购', '45257729572', '2017-08-06 07:29:04', '2017-08-06 07:29:04'), ('5756', '7', '2017款Apple/苹果MacBook ProMLH12CH/A 13 15寸XV2 TT2笔记本电', '8700.00', '0', '108', '16款13寸银 i5 2.0 8G 256无bar,16款13寸灰 i5 2.0 8G 256无bar,16款13寸银 i5 2.9 8G 256/带bar,16款13寸灰 i5 2.9 8G 256/带bar,16款13寸银 i5 2.9 8G 512带bar,16款13寸灰 i5 2.9 8G 512带bar,16款15寸灰 i7 2.6 16G 256带bar,16款15寸银 i7 2.6 16G 256带bar,16款15寸灰 i7 2.7 16G 512带bar,16款15寸银 i7 2.7 16G 512带bar,17款13寸灰 i5 2.3 8G 128无bar,17款13寸银 i5 2.3 8G 128无bar,17款13寸灰 i5 2.3 8G 256无bar,17款13寸银 i5 2.3 8G 256无bar,17款13寸灰 i5 3.1 8G 256带bar,17款13寸银 i5 3.1 8G 256带bar,17款13寸灰 i5 3.1 8G 512带bar,17款13寸银 i5 3.1 8G 512带bar,17款15寸灰 i7 2.8 16G 256带bar,17款15寸银 i7 2.8 16G 256带bar,17款15寸灰 i7 2.9 16G 512带bar,17款15寸银 i7 2.9 16G 512带bar,花呗付款有百分之1手续分期没有,实体店展示机出售 支持回收置换', '北京', '商都苹果原装批发', '541159874357', '2017-08-06 07:29:05', '2017-08-06 07:29:05'), ('5757', '7', 'Apple/苹果 MacBook Pro MF839CH/A国行13.3英寸视网膜笔记本电脑', '7888.00', '0', '20', '15款 MF839 8G/128G全新,15款 MF839 8G/128G拆封,15款 MF840 8G/256G全新,15款 MF840 8G/256G拆封,15款 MF841 8G/512G全新,15款 MF841 8G/512G拆封,14款 MGX72 8G/128G拆封,14款 MGX82 8G/256G拆封,14款 MGX92 8G/512G拆封', '北京', '韩氏乐淘', '553720942241', '2017-08-06 07:29:07', '2017-08-06 07:29:07'), ('5758', '7', 'Apple/苹果 MacBook Air MQD32CH/A MMGF2 笔记本电脑超薄air13寸', '5910.00', '0', '32', '17款/1.8/8/128/D32,17款/1.8/8/256/D42', '广东广州', '菊花本本', '554545362231', '2017-08-06 07:29:07', '2017-08-06 07:29:07'), ('5759', '7', 'Apple/苹果 MacBook Air 13 英寸: 128GB/256G 新17款笔记本电脑', '5498.00', '0', '44', '2016款GG2国行8G高配256G,2017款D32国行8G低配128G,2016款拆封激活128G全新,2016款GF2国行8G高配128G,2017款D42国行8G高配256G', '四川成都', '灵兴数码企业店', '554419340233', '2017-08-06 07:29:07', '2017-08-06 07:29:07'), ('5760', '7', 'Apple/苹果 MacBook Air MJVE2CH/A MD760 G2 13寸超薄笔记本电脑', '4299.00', '0', '94', '10年13寸air   MC503 2G 128G,11年13寸air   MC965 4G 128G,12年 13寸air   MD231 4G 128G,13年 13寸air  MD760A 4G 128G,14年 13寸air  MD760B 4G 128G,15年  13寸air  MJVE2  4G 128G,16年 13寸air   MMGF2 8G 128G,10年 11寸air  MC505  2G 64G,11年 11寸air  MC968 2G 64G,12年 11寸ai  MD223 4G 64G,13年 11寸air   MD711A 4G 128G,14年 11寸air MD711B 4G 128G,15年 11寸air  MJVM2 4G 128G,其他型号和配置请拍下改价', '浙江杭州', '多多苹果数码', '544842151463', '2017-08-06 07:29:07', '2017-08-06 07:29:07'), ('5761', '7', 'Apple/苹果 MacBook Air MD760CH/A笔记本苹果电脑13寸15寸17Pro', '2599.00', '0', '128', '13寸款 苹果小白 白色,13寸款 银色1号,13寸款 银色2号,15寸款 银色,17寸款 银色', '广东广州', '洪兴电脑 二手笔记本电脑', '551176257157', '2017-08-06 07:29:07', '2017-08-06 07:29:07'), ('5762', '7', '苹果风格笔记本电脑超薄便携学生手提超级游戏本上网金属I5处理器', '300.00', '0', '22', '货到付款定金', '广东深圳', '卖产品的小男孩', '556275927504', '2017-08-06 07:29:07', '2017-08-06 07:29:07'), ('5763', '7', 'Apple/苹果 MacBook Pro MGXA2CH/A Q2 T2香港代购15寸笔记本2017', '11888.00', '0', '364', '(老款)15吋/2.2GHz/256GB,(老款)15吋/2.5GHz/512GB,(16带Bar)15吋/2.6GHz/256GB灰色,(16带Bar)15吋/2.6GHz/256GB银色,(16带Bar)15吋/2.7GHz/512GB灰色,(16带Bar)15吋/2.7GHz/512GB银色,如需定制请联系客服询价,注意：定制链接勿直接拍下,双系统安装本店客户下单25元,type-c转接器本店客户下单168元,(17带Bar)15吋/2.8/256GB灰色TR2,(17带Bar)15吋/2.8/256GB银色TU2,(17带Bar)15吋/2.8/512GB灰色TT2,(17带Bar)15吋/2.8/512GB银色TV2', '香港九龙', '卖苹果的方小杰', '527917736680', '2017-08-06 07:29:07', '2017-08-06 07:29:07'), ('5764', '7', '2017款Apple/苹果 12英寸MacBook 256GB笔记本电脑512G YM2 YN2', '8599.00', '0', '25676', '17款256G深空灰MNYF2CH/A国行,17款256G金色MNYK2CH/A国行,17款256G玫瑰金MNYM2CH/A国行,17款256G银色MNYH2CH/A国行,17款512G深空灰MNYG2CH/A国行,17款512G金色MNYL2CH/A国行,17款512G玫瑰金MNYN2CH/A国行,17款512G银色MNYJ2CH/A国行', '广东深圳', '骏腾数码总店(正品)', '522172046546', '2017-08-06 07:29:07', '2017-08-06 07:29:07'), ('5765', '7', 'Apple/苹果 MacBook Air MJVM2CH/A MJVE2 MD711 笔记本电脑超薄', '3988.00', '0', '4446', '11寸MJVM2,11寸MJVP2,13寸MMGF2,13寸MMGG2,13寸MJVE2,13寸MD760B,13寸MD761B,13寸MD761A,13寸MJVG2,11寸MD711B,11寸MD711定制', '广东广州', '乐途本本', '43051230734', '2017-08-06 07:29:08', '2017-08-06 07:29:08'), ('5766', '7', '2017款Apple/苹果 MacBook Pro MLW82CH/A 15寸笔记本电脑TR2 TT2', '15580.00', '0', '2928', '17款256G深空灰MPTR2CH/A国行,17款256G银色MPTU2CH/A国行,17款512G深空灰MPTT2CH/A国行,17款512G银色MPTV2CH/A国行', '广东深圳', '骏腾数码总店(正品)', '541025576142', '2017-08-06 07:29:10', '2017-08-06 07:29:10'), ('5767', '7', 'Apple/苹果 MacBook Air 13 英寸: 128GB/256G 新17款笔记本电脑', '5758.00', '0', '1470', '需定制机（详细问客服）,新17款13寸128G银（MQD32CH/A）,新17款13寸256G银（MQD42CH/A）', '四川成都', '乐购苹果', '45216485303', '2017-08-06 07:29:11', '2017-08-06 07:29:11'), ('5768', '7', 'Apple/苹果 MacBook Pro MD101CH/A  13寸视网膜苹果笔记本电脑', '3647.00', '0', '372', 'MD101 带光驱2012款,MD102 带光驱2012款,MD212  视网膜2012款,MD213 视网膜2012款,ME662 视网膜2013款,ME864  视网膜2013款,ME865  视网膜2013款,ME866  视网膜2013款,MGX72   视网膜2014款,MGX82   视网膜2014款,MGX92   视网膜2014款,MF839 视网膜2015款,MF840 视网膜2015款,MF841 视网膜2015款,LL42 视网膜2016款 深灰色,UQ2 视网膜2016款 银色,VP2 视网膜2016款 带TB 银色,H12 视网膜2016款 带TB 深灰色,QF2 视网膜2016款 带TB深灰色,QG2视网膜2016款 带TB银色', '广东广州', '艾菲尔苹果店', '541871859831', '2017-08-06 07:29:12', '2017-08-06 07:29:12'), ('5769', '7', 'Apple/苹果 MacBook Air MJVM2CH/A超薄11寸13寸2017年笔记本电脑', '4288.00', '0', '198', '15年11寸MJVM2/4G/128G,16年13寸MMGF2/8G/128G,15年13寸MJVE2/4G/128G,14年11寸MD711B/4G/128G,13年11寸MD712A/4G/256G,13年11寸MD712B/4G/128G,12年11寸MD223/4G/64G,12年11寸MD224/4G/128G,17年新款现货13寸air咨询客服,买即送键盘膜/内胆包赠品,赠送实体店铺一月质保服务,顺丰包邮同城闪送使命必达', '北京', '韩氏乐淘', '553399336259', '2017-08-06 07:29:12', '2017-08-06 07:29:12'), ('5770', '7', '2017新款Apple/苹果 12英寸 MacBook 256GB 512G 笔记本电脑 国行', '6688.00', '0', '3796', '17款-国/m3 1.2/8G/256深空灰YF2,17款-国/m3 1.2/8G/256G银色-YH2,17款-国/m3 1.2/8G/256G金色-YK2,17款-国/m3 1.2/8G/256玫瑰金YM2,17款-国/i5 1.3/8G/512深空灰YG2,17款-国/i5 1.3/8G/512G银色-YJ2,17款-国/i5 1.3/8G/512G金色-YL2,17款-国/i5 1.3/8G/512玫瑰金YN2,16款-国/m3 1.1/8G/256深空灰H72,16款-国/m3 1.1/8G/256G银色-HA2,16款-国/m3 1.1/8G/256G金色-HE2,16款-国/m3 1.1/8G/256玫瑰金GL2,16款-国/i5 1.2/8G/512深空灰H82,16款-国/i5 1.2/8G/512G银色-HC2,16款-国/i5 1.2/8G/512G金色-HF2,16款-国/i5 1.2/8G/512玫瑰金GM2,15款-国/m 1.1/8G/256G深空灰Y32,实体店可自提，可维修，可置换,推荐大家先收藏或加入购物车', '北京', '苹果之家 实体店与网店结合 售后无忧', '45108964448', '2017-08-06 07:29:12', '2017-08-06 07:29:12'), ('5771', '7', '国行 Apple/苹果 MacBook Air MMGG2CH/A 13.3英寸轻薄笔记本电脑', '7588.00', '0', '4068', '银色', '浙江杭州', '卓辰数码旗舰店', '530683052432', '2017-08-06 07:29:13', '2017-08-06 07:29:13'), ('5772', '7', 'Apple/苹果 MacBook Pro MF839CH/A 840,13寸retina笔记本电脑XW2', '4888.00', '0', '198', '13.3”/2.5 i5/8GB/128GB MD212,13.3”/2.5 i5/8GB/256GB MD213,13.3”/2.6 i5/8GB/256GB ME662,13.3”/2.6 i5/8GB/256GB  X82,13.3”/2.4 i5/8GB/256GB ME865,13.3”/2.7 i5/8GB/128GB MF839,13.3”/2.7 i5/8GB/256GB MF840,13.3”/2.6 i5/8GB/128GB X72', '广东广州', '苹果尊选 恒久信赖', '39296838596', '2017-08-06 07:29:13', '2017-08-06 07:29:13'), ('5773', '7', 'Apple/苹果 12 英寸 MacBook 256GB国行笔记本电脑512G玫瑰金包邮', '8350.00', '0', '874', '17款12寸M3 1.2/8G/256G灰色,17款12寸M3 1.2/8G/256G银色,17款12寸M3 1.2/8G/256G金色,17款12寸M3 1.2/8G/256G粉色,17款12寸i5 1.3/8G/512G灰色,17款12寸i5 1.3/8G/512G银色,17款12寸i5 1.3/8G/512G金色,17款12寸i5 1.3/8G/512G粉色,16款12寸M3 1.1/8G/256G灰色,16款12寸M3 1.1/8G/256G银色,16款12寸M3 1.1/8G/256G金色,16款12寸M3 1.1/8G/256G粉色,16款12寸M5 1.2/8G/512G金色,16款12寸M5 1.2/8G/512G粉色', '浙江杭州', '杭州朗朗数码苹果实体店', '44814616150', '2017-08-06 07:29:15', '2017-08-06 07:29:15'), ('5774', '7', '2017款Apple/苹果 MacBook Pro MLVP2CH/A 笔记本电脑 13寸 15寸', '10300.00', '0', '162', '16款13寸/2.9/8/256/银色VP2国行,16款13寸/2.9/8/256/灰色H12国行', '广东广州', '乐途本本', '554264822725', '2017-08-06 07:29:15', '2017-08-06 07:29:15'), ('5775', '7', 'Apple/苹果 MacBook Pro MD101CH/A MD103 13寸15寸独显笔记本', '3200.00', '0', '10930', '13.3”/2.5 i5/4GB/500GB MD101,13.3”/2.4 i5/4GB/500GB MD313,15.4”/2.53 i7/4GB/500GB MD103', '广东广州', '苹果尊选 恒久信赖', '42336208339', '2017-08-06 07:29:15', '2017-08-06 07:29:15'), ('5776', '7', 'Apple/苹果 13英寸 MacBook Pro MF839CH/A国行笔记本电脑13寸15', '7838.00', '0', '308', '13寸256G灰色bar（型号H12）,13寸256G银色Bar（型号VP2）,13寸512G灰色Bar（型号QF2）,13寸512G银色Bar（型号QG2）,15寸256G灰色Bar（型号H32）,15寸256G银色Bar（型号W72）,15寸512G灰色Bar（型号H42）,15寸512G银色Bar（型号W82）,老款13寸128G（MF839CH/A）,17款15寸256G灰色（型号TR2）,17款15寸256G银色（型号TU2）,17款15寸512G灰色（型号TT2）,17款15寸512G银色（型号TV2）,17款13寸128G灰色（型号XQ2）,17款13寸128G银色（型号XR2）,17款13寸256G灰色（型号XT2）,17款13寸256G银色（型号XU2）,17款13寸256G灰色Bar（型号XV2）,17款13寸256G银色Bar（型号XX2）,17款13寸512G灰色Bar（型号XW2）,17款13寸512G银色Bar（型号XY2）', '四川成都', '乐购苹果', '541979703780', '2017-08-06 07:29:16', '2017-08-06 07:29:16'), ('5777', '7', 'Apple/苹果 MacBook Air MQD32CH/A 13.3寸 2017年新款笔记本电脑', '5878.00', '0', '1760', '17款13寸8G 128G【MQD32CH/A】,16款13寸8G 256G【MMGG2CH/A】,17款13寸8G 256G【MQD42CH/A】', '四川成都', '成都深蓝苹果', '534402062335', '2017-08-06 07:29:17', '2017-08-06 07:29:17'), ('5778', '7', 'Apple/苹果 MacBook Air MD711CH/A11 13寸15超薄笔记本苹果电脑', '2600.00', '0', '3826', '13寸 苹果小白带光驱款   白色,13寸 超薄款  银色,11寸 超薄款  银色,13寸 带光驱款  银色,15寸17寸 带光驱款 银色', '广东广州', '洪兴电脑 二手笔记本电脑', '549231384958', '2017-08-06 07:29:17', '2017-08-06 07:29:17'), ('5779', '7', 'Apple/苹果 13英寸 MacBook Pro 2017年新款15寸笔记本电脑可定制', '7688.00', '0', '74', '全国型号都是国行牛皮纸原封联保,2015/13寸/2.7/8G/128G/银,2015/15寸/2.2/16G/256G/银,2017/13寸/2.3/8G/128G/灰,2017/13寸/2.3/8G/128G/银,2017/13寸/2.3/8G/256G/灰,2017/13寸/2.3/8G/256G/银,2017/13寸/3.1/8G/256G/bar/灰,2017/13寸/3.1/8G/256G/bar/银,2017/13寸/3.1/8G/512G/bar/灰,2017/13寸/3.1/8G/512G/bar/银色,2017/15寸/2.8/16G/256G/bar/灰,2017/15寸/2.8/16G/256G/bar/银,2017/15寸/2.9/16G/512G/bar/灰,2017/15寸/2.9/16G/512G/bar/银,2016/13寸/2.9/8G/256G/bar/灰,2016/13寸/2.9/8G/256G/bar/银,2016/13寸/2.9/8G/512G/bar/灰,2016/13寸/2.9/8G/512G/bar/银,2016/15寸/2.6/16G/256G/bar/灰,2016/15寸/2.6/16G/256G/bar/银,2016/15寸/2.7/16G/512G/bar/灰,2016/15寸/2.7/16G/512G/bar/银', '四川成都', '灵兴数码企业店', '554194523995', '2017-08-06 07:29:17', '2017-08-06 07:29:17'), ('5780', '7', 'Apple/苹果 MacBook Pro MJLQ2CH/A笔记本电脑/15英寸/256GB', '12888.00', '0', '2118', '银白色', '广东深圳', '禾木林数码专营店', '45770557481', '2017-08-06 07:29:17', '2017-08-06 07:29:17'), ('5781', '7', '2017新款Apple/苹果 MacBook Air MMGF2新D32苹果D42笔记本电脑', '5950.00', '0', '6724', '16款GF2【13.3/8G/128G】,16款GG2【13.3/8G/256G】,17款D32【13.3/8G/128G】,17款D42【13.3/8G/256G】', '浙江杭州', '杭州百脑汇宏泰数码苹果店', '40168752480', '2017-08-06 07:29:21', '2017-08-06 07:29:21'), ('5782', '7', 'Apple/苹果 MacBook Pro MF839CH/A MD101游戏办公笔记本电脑13寸', '6300.00', '0', '1084', 'MF839（13.3寸）,看详情页配置表，有多种选择,其他型号拍下联系客服改价', '北京', '达海数码', '536884637936', '2017-08-06 07:29:21', '2017-08-06 07:29:21'), ('5783', '7', 'Apple/苹果 MacBook Air MMGF2 13.3寸D32新款笔记本2017款实体店', '5750.00', '0', '872', '老款（国）13寸 i5/8G/256G,2017款（国)13寸 i5/8G/128G,2017款（国)13寸 i5/8G/256G,价格不含发票(如需详细客服),老款（国）13寸 i5/8G/128G', '四川成都', '万淘宜购', '35320324341', '2017-08-06 07:29:22', '2017-08-06 07:29:22'), ('5784', '7', 'Apple/苹果 MacBook Pro MD101CH/A 办公笔记本电脑13寸15寸17寸', '4688.00', '0', '20784', '13寸MD101 4G 500G,15寸MD103 4G 500G', '广东广州', '乐途本本', '17627075860', '2017-08-06 07:29:22', '2017-08-06 07:29:22'), ('5785', '7', '2017 Apple/苹果 MacBook Air MMGF2CH/A D32 D42 13寸笔记本定制', '4000.00', '0', '2824', '定制机专用,16款 13寸低配F2 国行,16款 13寸高配G2 国行,17款 13寸低配D32国行,17款 13寸高配D42国行', '上海', '九年老店苹果帮原沪港直通车', '40962522191', '2017-08-06 07:29:23', '2017-08-06 07:29:23'), ('5786', '7', 'Apple/苹果 MacBook Air MJVE2CH/A MMGF2 G2 13寸超薄笔记本电脑', '4000.00', '0', '2752', 'MD231 开封激活,MD232 开封激活,MD760A 开封激活,MD761A 开封激活,MD760B 开封激活,MD761B 开封激活,MJVE2 开封激活,MJVG2 开封激活,MMGF2 开封激活,MMGG2 开封激活,MC966 开封激活', '上海', '上海俊羽数码科技', '537258625737', '2017-08-06 07:29:23', '2017-08-06 07:29:23'), ('5787', '7', '17款Apple/苹果 13英寸：MacBook Pro 256GB 轻薄 商务笔记本电脑', '11188.00', '0', '328', '银色,深空灰色', '浙江杭州', '卓辰数码旗舰店', '553388366959', '2017-08-06 07:29:23', '2017-08-06 07:29:23'), ('5788', '7', 'Apple/苹果 MacBook Air MD760CH/B  E2 MJVG2 M2 超薄笔记本电脑', '4288.00', '0', '30', '', '广东江门', '小鲸鱼数码城', '555000335213', '2017-08-06 07:29:23', '2017-08-06 07:29:23'), ('5789', '7', 'Apple/苹果MacBook Pro MF839CH/A XQ2 XR2 13寸视网膜笔记本电脑', '7088.00', '0', '1196', 'MF839CH/A 国行原封8G/128G,MF840CH/A国行原封8G/256G,MF841CH/A国行原封8G/512G,16款最新pro低配现货,MF839ZP/A 港未激活8G/128G,MF840ZP/A港未激活8G/256G,MF841ZP/A港未激活8G/512G,17款128G低配灰色MPXQ2CH/A,17款128G低配银色MPXR2CH/A,17款256G低配灰色MPXT2CH/A,17款256G低配银色MPXU2CH/A,17款256G中配灰色MPXV2CH/A,17款256G中配银色MPXX2CH/A,17款512G高配灰色MPXW2CH/A,17款512G高配银色MPXY2CH/A', '广东广州', '香港大雄数码行', '540802617685', '2017-08-06 07:29:23', '2017-08-06 07:29:23'), ('5790', '7', 'Apple/苹果 MacBook Air MD760CH/B A1466 11 13寸笔记本电脑超薄', '2588.00', '0', '362', '2010款 11寸 MC505,2010款 11寸 MC506,2011款 11寸 MC969,2012款 11寸 MD224,2013款 11寸 MD711A,2013款 11寸 MD712A,2014款 11寸 MD711B,2014款 11寸 MD712B,2015款 11寸 MJVM2,2015款 11寸 MJVP2,2010款 13寸 MC503,2011款 13寸 MC965,2011款 13寸 MC966,2012款 13寸 MD231,2012款 13寸 MD232,2013款 13寸 MD760A,2013款 13寸 MD761A,2014款 13寸 MD760B,2014款 13寸 MD761B,2015款 13寸 MJVE2,2015款 13寸 MJVG2,2016款 13寸 MMGF2,2016款 13寸 MMGG2,其它型号 拍下改价', '浙江杭州', 'E天数码', '549500885530', '2017-08-06 07:29:23', '2017-08-06 07:29:23'), ('5791', '7', 'Apple/苹果 MacBook Pro MJLT2CH/A LQ2 MGXC2苹果笔记本电脑15寸', '7988.00', '0', '3172', '15寸独显16/512/MJLT2,15寸集成16/5256/MJLQ2,15寸集成16/256/MJLQ2定制,15寸集成16/256MGXA2,15寸独显16/512/MGXC2,15寸独显16/1TB/MGXC2定制,15寸集成8/256/ME293,15寸独显16/512/ME294,15寸独显8/256/ME664,15寸独显16/512/ME665,13寸集成8/128/MF839,13寸集成8/256/MF840,13寸集成8/512/MF841,13寸集成8/256/MGX82,13寸集成8/512/MGX92', '广东广州', '乐途本本', '35666858318', '2017-08-06 07:29:39', '2017-08-06 07:29:39'), ('5792', '7', 'Apple/苹果 MacBook Air MC503CH/A 760B E2 MJVG2 M2 笔记本电脑', '4388.00', '0', '17060', '', '广东广州', '中启数码科技', '534120374007', '2017-08-06 07:29:39', '2017-08-06 07:29:39'), ('5793', '7', '国行Apple/苹果 MacBook Pro MJLQ2CH/A 手提i7笔记本电脑 15英寸', '12988.00', '0', '7006', '银白色', '浙江杭州', '卓辰数码旗舰店', '45669807759', '2017-08-06 07:29:39', '2017-08-06 07:29:39'), ('5794', '7', '国行Apple/苹果 MacBook Air MMGF2CH/A 13.3英寸 轻薄笔记本电脑', '6288.00', '0', '426', '银色', '山东济南', '三际数码官方旗舰店', '550620219266', '2017-08-06 07:29:40', '2017-08-06 07:29:40'), ('5795', '7', 'Apple/苹果 MacBook Pro MF839CH/A新2017款笔记本电脑13寸15现货', '7880.00', '0', '3804', '17款XQ2国行【13.3/8G/128G】灰,17款XR2国行【13.3/8G/128G】银,17款XT2国行【13.3/8G/256G】灰,17款XU2国行【13.3/8G/256G】银,17款XV2【13.3/8G/256G/Bar】灰,17款XX2【13.3/8G/256G/Bar】银,17款XW2【13.3/8G/512G/Bar】灰,17款XY2【13.3/8G/512G/Bar】银,17款TR2【15.4/16G/256/Bar】灰,17款TU2【15.4/16G/256/Bar】银,17款TT2【15.4/16G/512/Bar】灰,17款TV2【15.4/16G/512/Bar】银,16款VP2【13.3/8G/256/Bar】银,16款QF2【13.3/8G/512/Bar】灰,16款QG2【13.3/8G/512/Bar】银,16款H32【15.4/16G/256/Bar】灰,16款W72【15.4/16G/256/Bar】银,16款H42【15.4/16G/512/Bar】灰,16款W82【15.4/16G/512/Bar】银,15款国行839【I5 2.7/8G/128G】,15款国行LQ2【i7 2.2/16G/256】', '浙江杭州', '杭州百脑汇宏泰数码苹果店', '37480728373', '2017-08-06 07:29:40', '2017-08-06 07:29:40'), ('5796', '7', '港版正品 Apple/苹果 MacBook Air 笔记本电脑 F2G2 32 42 2017款', '5788.00', '0', '1440', '新款13寸128G（MQD32）,新款13寸256G(MQD42),老款13吋128G(MMGF2),老款13吋256G(MMGG2)', '广东深圳', '洛基(香港)代購', '521794081549', '2017-08-06 07:29:40', '2017-08-06 07:29:40'), ('5797', '7', '2017新款Apple/苹果 MacBook Pro MLL42CH/A  MPXQ2 笔记本电脑', '8780.00', '0', '2270', '17款13寸/XR2银色', '广东广州', '乐途本本', '45041877448', '2017-08-06 07:29:40', '2017-08-06 07:29:40'), ('5798', '7', 'Apple/苹果 12 英寸 MacBook 256GB 2017新款512G苹果笔记本电脑', '8380.00', '0', '8548', '17新款【国行】256G深空灰色,17新款【国行】256G银色,17新款【国行】256G金色,17新款【国行】256G玫瑰金色,17新款【国行】512G深空灰色,17新款【国行】512G银色,17新款【国行】512G金色,17新款【国行】512G玫瑰金色,16新款【国行】256G深空灰色,16新款【国行】256G银色,16新款【国行】256G金色,16新款【国行】256G玫瑰金色,16新款【国行】512G银色,16新款【国行】512G金色,16新款【国行】512G玫瑰金色', '浙江杭州', '杭州百脑汇宏泰数码苹果店', '45110857375', '2017-08-06 07:29:40', '2017-08-06 07:29:40'), ('5799', '7', '17款香港代购Apple/苹果 12 英寸 MacBook 256GB超薄笔记本电脑', '6788.00', '0', '5094', '17款YF2灰256G标配国行100%原封,17款YH2银256G标配国行100%原封,17款YK2金256G标配国行100%原封,17款YM2粉256G标配国行100%原封,17款Y42灰512G高配国行100%原封,17款YJ2银512G高配国行100%原封,17款YL2金512G高配国行100%原封,17款YN2粉512G高配国行100%原封,16款H72灰256G标配国行100%原封,16款HA2银256G标配国行100%原封,16款HE2金256G标配国行100%原封,16款GL2粉256G标配国行100%原封,16款H82灰512高配国行100%原封,16款HC2银512高配国行100%原封,16款HF2金512高配国行100%原封,16款GM2粉512高配国行100%原封,【国行原封官方牛皮纸盒包顺丰】,【支持香港定制升级请联系客服】,15款Y42灰512G高配美版过保,15款4N2银512G高配美版过保,15款865金512G高配美版过保,美版15款未激活过保提供店保2年', '广东深圳', 'WAYEN韦恩国际代购', '44037839782', '2017-08-06 07:29:41', '2017-08-06 07:29:41'), ('5800', '7', 'Apple/苹果 MacBook Pro MF839CH/A新2017款笔记本电脑13寸15包邮', '7890.00', '0', '554', '15款国行839【i5 2.7/8G/128G】,15款国行LQ2【i7 2.2/16G/256】,16款UQ2/13.3寸/2.0/8G/256/银,16款VP2/13.3/2.9/8G/256/Bar/银,16款QF2/13.3/2.9/8G/512/Bar/灰,16款QG2/13.3/2.9/8G/512/Bar/银,16款W72/15.4/2.6/16/256/Bar银,16款W82/15.4/2.7/16/512/Bar银,17款XQ2/13.3寸/2.3/8G/128/灰,17款XR2/13.3寸/2.3/8G/128/银,17款XT2/13.3寸/2.3/8G/256/灰,17款XU2/13.3寸/2.3/8G/256/银,17款XV2/13.3/3.1/8/256/Bar/灰,17款XX2/13.3/3.1/8G/256/Bar/银,17款XW2/13.3/3.1/8G/512/Bar灰,17款XY2/13.3/3.1/8G/512/Bar银,17款TR2/15.4/2.8/16/256/Bar/灰,17款TU2/15.4/2.8/16/256/Bar/银,17款TT2/15.4/2.9/16/512/Bar/灰,17款TV2/15.4/2.9/16/512/Bar/银', '浙江杭州', '苹果国行精品店', '527368369114', '2017-08-06 07:29:41', '2017-08-06 07:29:41'), ('5801', '7', 'Apple/苹果 MacBook Air MQD32CH/A 1.8Ghz 13.3寸轻薄笔记本电脑', '6388.00', '0', '46', '128G 固态硬盘 MQD32 银色', '山东济南', '三际数码官方旗舰店', '555364223028', '2017-08-06 07:29:41', '2017-08-06 07:29:41'), ('5802', '7', '2017全新苹果风格笔记本电脑15寸超薄手提游戏本超级刀锋版上网本', '300.00', '0', '334', '联系客服下定金银色,联系客服下定金白色,联系客服下定金黄色', '广东深圳', '卖产品的小男孩', '549856577641', '2017-08-06 07:29:41', '2017-08-06 07:29:41'), ('5803', '7', 'Apple/苹果 MacBook Pro MD101CH/A MD103 MD760 MC700笔记本电脑', '2880.00', '0', '524', 'MC700,MD313,MD101,MD101 120固态版,MD313 120固态版,视网膜MF839,视网膜MD212,视网膜X72全套,MD103,MD102,AIR MC965,AIR MD761B,AIR MJVM2,AIR MD232,AIR MC968,AIR MC968全套,AIR MC504,MC374', '上海', '逸能科技', '545490971032', '2017-08-06 07:29:41', '2017-08-06 07:29:41'), ('5804', '7', 'Apple/苹果 13 英寸 1.8GHz 处理器 MacBook Air超轻薄笔记本电脑', '6488.00', '0', '9282', '银色', '浙江杭州', '卓辰数码旗舰店', '553347317051', '2017-08-06 07:29:41', '2017-08-06 07:29:41'), ('5805', '7', '17款Apple/苹果 13英寸：MacBook Pro 128GB 轻薄 办公笔记本电脑', '9588.00', '0', '4422', '银色,深空灰色', '浙江杭州', '卓辰数码旗舰店', '553388086354', '2017-08-06 07:29:42', '2017-08-06 07:29:42'), ('5806', '7', '2017新款Apple/苹果 MacBook Air MMGF2CH/A国行13寸笔记本电脑32', '5750.00', '0', '24768', '16款【i5 1.6/8G/128G】国行GF2,17款【i5 1.8/8G/128G】国行D32,17款【i5 1.8/8G/256G】国行D42,杭州本地支持闪送1-4小时当日达', '浙江杭州', '杭州朗朗数码苹果实体店', '12423567922', '2017-08-06 07:29:42', '2017-08-06 07:29:42'), ('5807', '7', '2017新款Apple/苹果 MacBook Pro MF839CH/A国行笔记本电脑13寸15', '7890.00', '0', '12916', '17款XQ2/13.3寸/2.3/8G/128/灰,17款XR2/13.3寸/2.3/8G/128/银,17款XT2/13.3寸/2.3/8G/256/灰,17款XU2/13.3寸/2.3/8G/256/银,17款XV2/13.3/3.1/8G/256/Bar/灰,17款XX2/13.3/3.1/8G/256/Bar/银,17款XW2/13.3/3.1/8G/512/Bar灰,17款XY2/13.3/3.1/8G/512/Bar银,17款TR2/15.4/2.8/16/256/Bar/灰,17款TU2/15.4/2.8/16/256/Bar/银,17款TT2/15.4/2.9/16/512/Bar/灰,17款TV2/15.4/2.9/16/512/Bar/银,16款UQ2/13.3寸/2.0/8G/256/银,16款VP2/13.3/2.9/8G/256/Bar/银,16款QF2/13.3/2.9/8G/512/Bar/灰,16款QG2/13.3/2.9/8G/512/Bar/银,16款W72/15.4/2.6/16/256/Bar/银,16款W82/15.4/2.7/16/512/Bar银,15款国行839【i5 2.7/8G/128G】,15款国行LQ2【i7 2.2/16G/256】', '浙江杭州', '杭州朗朗数码苹果实体店', '25778708710', '2017-08-06 07:29:42', '2017-08-06 07:29:42'), ('5808', '7', '2017款Apple/苹果 MacBook Air MMGF2CH/A 13寸笔记本电脑D32 D42', '5758.00', '0', '50038', '2016款13寸8G/128G国行MMGF2CH/A,2017款13寸8G/128G国行MQD32CH/A,2017款13寸8G/256G国行MQD42CH/A', '广东深圳', '骏腾数码总店(正品)', '522152519839', '2017-08-06 07:29:42', '2017-08-06 07:29:42'), ('5809', '7', 'Apple MacBook Air 13.3英寸笔记本电脑I5 8G 128G MQD32CH/A银色', '6488.00', '0', '2062', '128G 固态硬盘 MQD32 银色', '江苏南京', '苏宁易购官方旗舰店', '553627775790', '2017-08-06 07:29:42', '2017-08-06 07:29:42'), ('5810', '7', 'Apple/苹果 MacBook Air MMGF2CH/A MD760超薄笔记本电脑11寸13寸', '4288.00', '0', '12900', '13寸MMGF2,13寸MMGG2,13寸MJVE2,13寸MJVG2,13寸MD760B,13寸MD761B,13寸MD760A,13寸MD761A,11寸MJVM2,11寸MJVP2,全场顺丰包邮，送鼠标', '广东广州', '乐途本本', '535990135859', '2017-08-06 07:29:44', '2017-08-06 07:29:44'), ('5811', '7', 'Apple/苹果 12 英寸 MacBook 256GB 超薄笔记本电脑灰色金色 512G', '6047.00', '0', '10462', '2015款美版MJY32灰色256G,2015款美版MF855银色256G,2015款美版MK4M2金色256G,2016款美版MLHA2银色256G,2016款美版MLHE2金色256G,2016款美版MLH72深空灰色256G,2015款港版MJY32灰色256G,2015款港版MF855银色256G,2015款港版MK4M2金色256G,2015款美版MK4N2金色512G,2015款美版MF865银色512G,2015款美版MJY42深空灰色512G,2015款美版MJY42定制深空灰512G,2016款港版MLHA2银色256G,2016款港版MLHE2金色256G,2016款港版MLH72深空灰色256G,2016款MLH82灰色 512G套餐①,2016款MLH82灰色 512G套餐②,2016款MLHC2银色 512G,2016款MLHF2金色 512G,2016款MMGM2玫瑰金色512G', '广东广州', '乐途本本', '45010754752', '2017-08-06 07:29:44', '2017-08-06 07:29:44'), ('5812', '7', 'Apple/苹果 MacBook Pro MF840CH/A 839 MJLT2笔记本电脑13寸15寸', '6388.00', '0', '30060', '2015年13寸MF839/8G/128G,13寸MF840/8G/256G,13寸MF841/8G/512G,15寸MJLQ2/16G/256G,15寸MJLT2独显/16G/512G,15寸MGXA2/16G/256G,15寸ME293/8G/256G,15寸MGXC2/16G/512G,15寸MGXC2定制/16G/1TB,13寸MGX72/8/128G,13寸MGX82/8/256G,13寸MGX92/8/512G', '广东广州', '乐途本本', '36300936930', '2017-08-06 07:29:44', '2017-08-06 07:29:44'), ('5813', '7', '国行Apple/苹果 MacBook Pro MF839CH/A 13寸笔记本电脑2017带Bar', '7700.00', '0', '2228', '15款13寸Pro低配MF839CH,17款低配灰/2.3/8G/128/非Bar,17款低配银/2.3/8G/128/非Bar,17款高配灰/2.3/8G/256/非Bar,17款高配银/2.3/8G/256/非Bar,17款低配灰/3.1/8G/256/带Bar,17款低配银/3.1/8G/256/带Bar,17款高配灰/3.1/8G/512/带Bar,17款高配银/3.1/8G/512/带Bar,16款中配灰/2.9/8G/256/带Bar,16款中配银/2.9/8G/256/带Bar,16款高配灰/2.9/8G/512/带Bar,16款高配银/2.9/8G/512/带Bar,官方选配定制机型专拍-灰色,官方选配定制机型专拍-银色', '上海', '苹果地带MacZone', '36473078418', '2017-08-06 07:29:44', '2017-08-06 07:29:44'), ('5814', '7', 'Apple/苹果 MacBook Air MMGF2  MJVE2 MMGG2 13寸苹果笔记本电脑', '3982.00', '0', '7672', '2016款 MMGF2  i5/8G/128G,2016款 MMGG2  i5/8G/256G,2015款 MJVE2  i5/4G/128G,2015款 MJVG2  i5/4G/256G,2014款 MD760B i5/4G/128G,2014款 MD761B i5/4G/256G,2013款 MD760A i5/4G/128G,2013款 MD761A i5/4G/256G,2012款 MD231 i5/4G/128G,2012款 MD232 i5/4G/256G', '广东广州', '艾菲尔苹果店', '540338387662', '2017-08-06 07:29:44', '2017-08-06 07:29:44'), ('5815', '7', 'Apple/苹果 MacBook Air MMGF2CH/A  GG2 D32 13寸苹果笔记本电脑', '5088.00', '0', '13010', '11寸4G/128G港未激活：MJVM2ZP/A,11寸4G/256G港未激活：MJVP2ZP/A,13寸4G/128G港未激活：MJVE2ZP/A,13寸4G/256G港未激活：MJVG2ZP/A,13寸8G/128G港未激活：MMGF2ZP/A,13寸8G/256G港未激活：MMGG2ZP/A,13寸8G/128G国行原封：MMGF2CH/A,13寸8G/256G国行原封：MMGG2CH/A,13寸8G/128G国行原封：MQD32CH/A,13寸8G/256G国行原封：MQD42CH/A', '广东广州', '香港大雄数码行', '540791616342', '2017-08-06 07:29:44', '2017-08-06 07:29:44'), ('5816', '7', 'Apple/苹果 MacBook Air MD711CH/B GF2 11 13寸超薄款笔记本电脑', '3999.00', '0', '3772', '2014款 11寸 MD711B,2014款 11寸 MD712B,2015款 11寸 MJVM2,2015款 11寸 MJVP2,2013款 13寸 MD760A,2013款 13寸 MD761A,2014款 13寸 MD760B,2014款 13寸 MD761B,2015款 13寸 MJVE2,2015款 13寸 MJVG2,2016款 13寸 MMGF2,2016款 13寸 MMGG2,其他型号拍下联系客服改价', '广东深圳', '麦克本本', '541293085767', '2017-08-06 07:29:45', '2017-08-06 07:29:45'), ('5817', '7', 'Apple/苹果MacBook Air 13.3英寸笔记本电脑I5 8G 256G MQD42CH/A', '8088.00', '0', '552', '银色', '江苏南京', '苏宁易购官方旗舰店', '553587837212', '2017-08-06 07:29:45', '2017-08-06 07:29:45'), ('5818', '7', '国行Apple/苹果 MacBook Pro MLH42CH/A 15寸笔记本电脑2017带Bar', '11820.00', '0', '2682', '2015款15寸低配MJLQ2CH,16款低配灰/2.6/16G/256/带Bar,16款低配银/2.6/16G/256/带Bar,16款高配灰/2.7/16G/512/带Bar,17款高配灰/2.9/16/512/4GB显卡,17款高配银/2.9/16/512/4GB显卡,17款低配灰/2.8/16/256/2GB显卡,17款低配银/2.8/16/256/2GB显卡,惊爆价16款定制i7 2.9/2TB/4GB,17款低配定制Pro 560 4GB显卡,17款低配定制512G+560 4GB显卡,17款低配定制1TB+560 4GB显卡,17款高配定制1TB闪存,17款高配定制i7 3.1+1TB闪存,17款高配定制i7  3.1+2TB闪存,17款高配定制i7 3.1Ghz CPU,15款低配LQ2定制512GB闪存', '上海', '苹果地带MacZone', '36484488682', '2017-08-06 07:29:45', '2017-08-06 07:29:45'), ('5819', '7', '13寸国行Apple/苹果 MacBook Air MMGF2CH/A笔记本电脑2017 MQD32', '5780.00', '0', '3218', '16版GF2低配i5 1.6/8G/128G,16版GG2高配i5 1.6/8G/256G,17款D32低配i5 1.8/8G/128G,17款D42高配i5 1.8/8G/256G,官方选配i7  2.2/8G/128G,官方选配i7  2.2/8G/256G,官方选配i7  2.2/8G/512G,官方选配i5 1.8/8G/512G', '上海', '苹果地带MacZone', '18887214486', '2017-08-06 07:29:45', '2017-08-06 07:29:45'), ('5820', '7', 'Apple/苹果 12 英寸 MacBook 256GB玫瑰金视网膜苹果笔记本电脑', '6047.04', '0', '5922', '15款灰色 256G,15款金色 256G,15款银色 256G,15款灰色 512G,15款金色 512G,15款银色 512G,16款灰色 256G,16款金色 256G,16款银色 256G,16款粉色 256G,16款灰色 512G,16款金色 512G,16款银色 512G,16款粉色 512G,其它型号拍下客服改价格', '广东广州', '艾菲尔苹果店', '540402948091', '2017-08-06 07:29:45', '2017-08-06 07:29:45'), ('5821', '7', 'Apple/苹果 MacBook Pro MF840CH/A 839,13寸retina笔记本电脑VP2', '4888.00', '0', '13260', 'MF841 i7 3.1G 16G 512G,16款  MLL42 i7 2.4G 16G 256G,16款 Touchbar i5 2.9G 256G,MF839 i5 2.7G 8G 128G,MF840 i5 2.7G 8G 256G,14款 MGX72 128G,14款 MGX82 256G,13款 ME865 256G,13款 ME864 128G,MF841 i5 2.9G 8G 512G,16款  MLL42 i5 2.0G 8G 256G', '广东广州', '香港数码港湾', '524317472497', '2017-08-06 07:29:46', '2017-08-06 07:29:46'), ('5822', '7', 'Apple/苹果 MacBook Air MMGG2CH/A GF2 13寸超薄笔记本电脑 QD32', '4088.00', '0', '658', '15款 MJVE2 i5 5250U 4G 128G,14款 MD760B i5 4G 128G,16款 MMGG2 i5 5250U 8G 256G,15款 MJVG2 i5 5250U 4G 256G,13款 MD760A i5 4G 128G,16款 MMGF2 i5 5250U 8G 128G,2017款 MQD32 i7  2.2G 128G,2017款 MQD42 i7  2.2G 256G,2017款 MQD42 i5  1.8G 256G,14款 MD760B i7 1.7G  8G 128G', '广东广州', '香港数码港湾', '550167287606', '2017-08-06 07:29:46', '2017-08-06 07:29:46'), ('5823', '7', 'Apple/苹果 MacBook Air MMGF2CH/A MQD32 D42 G2 13寸笔记本电脑', '4088.00', '0', '12218', 'MD760B 13寸 2014款 128g,MMGG2 13寸 2016款 256g,17款 MQD42 i7  2.2G 256G 高配,MD760A 13寸 2013款 128g,MJVG2 13寸 2015款 256g,MJVE2 13寸 2015款 128g,2017款 MQD32 i5  1.8G 128G,MMGF2 13寸 2016款 128g,17款 MQD32 i7  2.2G 128G 高配', '广东广州', '香港数码港湾', '45802586893', '2017-08-06 07:29:47', '2017-08-06 07:29:47');
COMMIT;

-- ----------------------------
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `migrations`
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1'), ('2', '2014_10_12_100000_create_password_resets_table', '1'), ('3', '2017_06_14_022352_create_admin_table', '2'), ('4', '2017_06_14_024819_create_admin_roles_table', '2'), ('5', '2017_06_14_025918_create_admin_permissions_table', '2'), ('6', '2017_06_14_033137_create_permission_role_table', '2'), ('7', '2017_06_14_033815_create_admin_role_user_table', '2'), ('8', '2017_06_14_034434_create_admin_logger_table', '2'), ('9', '2017_06_14_034444_create_admin_message_table', '2'), ('10', '2017_06_14_034456_create_category_table', '2'), ('11', '2017_06_14_034514_create_articles_table', '2'), ('13', '2017_06_28_145632_create_admin_permission_role_table', '3');
COMMIT;

-- ----------------------------
--  Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限id',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_role_permission_id_role_id_unique` (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
