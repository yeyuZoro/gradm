/*
Navicat MySQL Data Transfer

Source Server         : lfl
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : gradm

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-05-29 18:56:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gradm_back_permission`
-- ----------------------------
DROP TABLE IF EXISTS `gradm_back_permission`;
CREATE TABLE `gradm_back_permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `creator` int(8) unsigned DEFAULT '0' COMMENT '创建人id',
  `modifier` int(8) DEFAULT '0' COMMENT '修改人',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` char(1) DEFAULT 'N' COMMENT '是否删除',
  `pvg_key` varchar(50) DEFAULT NULL COMMENT '菜单key',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单url',
  `parent_id` int(11) DEFAULT NULL COMMENT '父id',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_menu` tinyint(1) DEFAULT NULL COMMENT '是否为菜单',
  `is_nav` tinyint(1) DEFAULT '0' COMMENT '是否为导航',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of gradm_back_permission
-- ----------------------------
INSERT INTO `gradm_back_permission` VALUES ('1', '0', '0', null, null, 'N', 'PVG', '权限管理', '/admin/pvg/**', '0', '11', '1', '0');
INSERT INTO `gradm_back_permission` VALUES ('2', '0', '0', '2016-04-29 17:53:58', '2016-04-29 17:56:08', 'N', 'cec', '测试', '/cec/**', '1', '8888', '1', '1');
INSERT INTO `gradm_back_permission` VALUES ('3', '0', '0', '2016-05-02 16:11:33', '2016-05-02 16:23:44', 'N', 'GOODS', '配件管理', '/admin/goods/**', '0', '11', '1', '1');
INSERT INTO `gradm_back_permission` VALUES ('4', '0', '0', '2016-05-02 16:12:29', '2016-05-28 18:09:56', 'N', 'GOODS_LIST', '配件列表', '/admin/goods', '3', '9999', '1', '0');
INSERT INTO `gradm_back_permission` VALUES ('5', '0', '0', '2016-05-04 20:43:11', '2016-05-04 20:43:11', 'N', 'PVG_LIST', '权限列表', '/admin/pvg/permission', '1', '9999', '1', '0');
INSERT INTO `gradm_back_permission` VALUES ('6', '0', '0', '2016-05-04 20:44:16', '2016-05-04 20:44:16', 'N', 'GOODS_CAT', '配件分类', '/admin/goods/category', '3', '9999', '1', '0');
INSERT INTO `gradm_back_permission` VALUES ('7', '0', '0', '2016-05-04 20:44:40', '2016-05-28 17:52:08', 'N', 'ORDER', '销售管理', '/admin/order/**', '0', '11', '1', '0');
INSERT INTO `gradm_back_permission` VALUES ('8', '0', '0', '2016-05-04 20:45:14', '2016-05-28 18:28:50', 'N', 'ORDER_LIST', '订单列表', '/admin/order', '7', '9999', '1', '0');
INSERT INTO `gradm_back_permission` VALUES ('9', '0', '0', '2016-05-04 20:45:44', '2016-05-04 20:45:44', 'N', 'USER', '用户管理', '/admin/user/**', '0', '12', '1', '1');
INSERT INTO `gradm_back_permission` VALUES ('10', '0', '0', '2016-05-04 20:46:12', '2016-05-29 16:58:47', 'N', 'USER_MESSAGE', '员工信息', '/admin/user', '9', '9999', '1', '0');
INSERT INTO `gradm_back_permission` VALUES ('11', '0', '0', '2016-05-04 20:46:36', '2016-05-04 20:46:36', 'N', 'STOCK', '库存管理', '/admin/stock/**', '0', '11', '1', '1');
INSERT INTO `gradm_back_permission` VALUES ('12', '0', '0', '2016-05-04 20:47:04', '2016-05-28 18:32:57', 'N', 'STOCK_MESSAGE', '库存信息', '/admin/stock', '11', '9999', '1', '0');
INSERT INTO `gradm_back_permission` VALUES ('13', '0', '0', '2016-05-19 20:05:08', '2016-05-19 20:05:08', 'N', 'BACK_ROLE', '角色列表', '/admin/pvg/role', '1', '9999', '1', '0');
INSERT INTO `gradm_back_permission` VALUES ('14', '0', '0', '2016-05-29 18:04:52', '2016-05-29 18:07:57', 'N', 'BACK_USER', '用户列表', '/admin/pvg/user', '1', '112', '1', '0');

-- ----------------------------
-- Table structure for `gradm_back_role`
-- ----------------------------
DROP TABLE IF EXISTS `gradm_back_role`;
CREATE TABLE `gradm_back_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `creator` int(8) unsigned DEFAULT '0' COMMENT '创建人id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(8) unsigned DEFAULT '0' COMMENT '修改人id',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` char(1) DEFAULT 'N' COMMENT '是否删除',
  `name` varchar(50) DEFAULT '' COMMENT '角色名称',
  `permission_ids` varchar(500) DEFAULT NULL COMMENT '权限ID列表，以，隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理后台角色表';

-- ----------------------------
-- Records of gradm_back_role
-- ----------------------------
INSERT INTO `gradm_back_role` VALUES ('1', '1', '2016-05-19 20:07:46', '1', '2016-05-19 20:07:46', 'N', '超级管理员', '1,2,5,13,3,4,6,7,8,9,10,11,12');
INSERT INTO `gradm_back_role` VALUES ('2', '1', '2016-05-19 20:13:30', '1', '2016-05-29 15:41:57', 'N', '仓管', '3,4,6,11,12');
INSERT INTO `gradm_back_role` VALUES ('3', '1', '2016-05-29 18:40:18', '1', '2016-05-29 18:40:18', 'N', '客服', '7,8');

-- ----------------------------
-- Table structure for `gradm_back_user`
-- ----------------------------
DROP TABLE IF EXISTS `gradm_back_user`;
CREATE TABLE `gradm_back_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `creator` int(8) unsigned DEFAULT '0' COMMENT '创建人id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` int(8) unsigned DEFAULT '0' COMMENT '修改人id',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` char(1) DEFAULT 'N' COMMENT '是否删除',
  `manager_id` int(11) unsigned DEFAULT '0' COMMENT '用户id',
  `is_admin` int(11) DEFAULT '0' COMMENT '是否为超级管理员，1为超级管理员，0为普通管理员',
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色id',
  `permission_ids` varchar(500) DEFAULT NULL COMMENT '权限ID列表，以，隔开',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '登陆名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(50) DEFAULT '' COMMENT '用户姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理后台用户权限表';

-- ----------------------------
-- Records of gradm_back_user
-- ----------------------------
INSERT INTO `gradm_back_user` VALUES ('1', '0', '2016-05-06 18:17:45', '0', '2016-05-06 17:46:40', 'N', '1', '1', '1', null, '123', '123', '李飞龙');
INSERT INTO `gradm_back_user` VALUES ('2', '1', '2016-05-29 18:38:25', '1', '2016-05-29 18:44:21', 'N', null, '0', '2', '3,4,6,11,12', '000198', '123', '小李');
INSERT INTO `gradm_back_user` VALUES ('3', '1', '2016-05-29 18:40:39', '1', '2016-05-29 18:40:39', 'N', null, '0', '3', '7,8', '000123', '123', '李希');

-- ----------------------------
-- Table structure for `gradm_goods`
-- ----------------------------
DROP TABLE IF EXISTS `gradm_goods`;
CREATE TABLE `gradm_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配件ID',
  `is_deleted` char(1) NOT NULL DEFAULT 'N' COMMENT '是否删除:Y/N',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间，入库时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `creator` int(11) DEFAULT '0' COMMENT '创建人',
  `modifier` int(11) DEFAULT '0' COMMENT '修改人',
  `name` varchar(200) NOT NULL COMMENT '配件名称',
  `goods_sn` varchar(50) NOT NULL COMMENT '配件编号',
  `measure_unit` varchar(50) DEFAULT '' COMMENT '最小单位',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '销售价格',
  `stock` decimal(12,2) DEFAULT '0.00' COMMENT '库存',
  `category_id` int(11) unsigned DEFAULT '0' COMMENT '配件类型 对应gradm_goods_catefory表id',
  `goods_brand` varchar(90) DEFAULT NULL COMMENT '配件品牌',
  PRIMARY KEY (`id`),
  KEY `cat` (`category_id`),
  CONSTRAINT `cat` FOREIGN KEY (`category_id`) REFERENCES `gradm_goods_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='配件表';

-- ----------------------------
-- Records of gradm_goods
-- ----------------------------
INSERT INTO `gradm_goods` VALUES ('1', 'Y', '2016-05-04 20:13:28', '2016-05-04 20:13:28', '0', '0', '大众轮胎', 'SP-00001', '只', '223.50', '600.00', '4', '大众');
INSERT INTO `gradm_goods` VALUES ('2', 'N', '2016-05-04 20:13:35', '2016-05-04 20:13:35', '0', '0', '大众轮胎', 'SP-00001', '只', '223.50', '600.00', '4', '大众');
INSERT INTO `gradm_goods` VALUES ('3', 'Y', '2016-05-04 20:32:50', '2016-05-04 20:32:50', '0', '0', '1123', '1123', '1', '11.00', '11.00', '3', 'tt');
INSERT INTO `gradm_goods` VALUES ('4', 'N', '2016-05-04 20:36:50', '2016-05-04 20:36:50', '0', '0', '现代索纳塔原装电池', 'DC-00001', '个', '467.00', '889.00', '5', '现代');
INSERT INTO `gradm_goods` VALUES ('5', 'N', '2016-05-04 20:37:47', '2016-05-04 20:37:47', '0', '0', '12缸发动机', 'FDJ-00001', '个', '2336.50', '356.00', '6', '上海一汽大众');
INSERT INTO `gradm_goods` VALUES ('6', 'N', '2016-05-28 18:25:04', '2016-05-28 18:28:17', '0', '0', 'CE', 'CEC-99123', '一对', '1123.00', '123.00', '1', 'CE');
INSERT INTO `gradm_goods` VALUES ('7', 'N', '2016-05-28 19:11:44', '2016-05-28 19:11:44', '0', '0', 'ms雨刮', 'MS10832', '一对', '50.00', '123.00', '7', '嘉德');
INSERT INTO `gradm_goods` VALUES ('8', 'Y', '2016-05-28 19:14:01', '2016-05-28 19:14:01', '0', '0', 'ms雨刮', 'MS10832', '一对', '50.00', '123.00', '7', '嘉德');
INSERT INTO `gradm_goods` VALUES ('9', 'N', '2016-05-29 14:31:49', '2016-05-29 18:44:50', '0', '0', '轮胎ZX3', 'LT012001', '个', '1235.00', '188.00', '4', 'ZEON');

-- ----------------------------
-- Table structure for `gradm_goods_category`
-- ----------------------------
DROP TABLE IF EXISTS `gradm_goods_category`;
CREATE TABLE `gradm_goods_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类ID',
  `is_deleted` varchar(1) NOT NULL DEFAULT 'N' COMMENT '是否删除:Y/N',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间，入库时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `creator` int(11) DEFAULT '0' COMMENT '创建人',
  `modifier` int(11) DEFAULT '0' COMMENT '修改人',
  `cat_name` varchar(90) NOT NULL COMMENT '分类名称',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父分类ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='配件分类';

-- ----------------------------
-- Records of gradm_goods_category
-- ----------------------------
INSERT INTO `gradm_goods_category` VALUES ('1', 'N', '2016-05-04 11:37:11', '2016-05-04 11:37:11', '0', '0', '油品', '0');
INSERT INTO `gradm_goods_category` VALUES ('2', 'N', '2016-05-04 11:38:44', '2016-05-04 11:38:44', '0', '0', '汽机油', '1');
INSERT INTO `gradm_goods_category` VALUES ('3', 'N', '2016-05-04 11:50:52', '2016-05-04 11:50:52', '0', '0', '养护用品', '0');
INSERT INTO `gradm_goods_category` VALUES ('4', 'N', '2016-05-04 20:12:57', '2016-05-04 20:12:57', '0', '0', '轮胎', '0');
INSERT INTO `gradm_goods_category` VALUES ('5', 'N', '2016-05-04 20:36:27', '2016-05-04 20:36:27', '0', '0', '电池', '0');
INSERT INTO `gradm_goods_category` VALUES ('6', 'N', '2016-05-04 20:37:24', '2016-05-04 20:37:24', '0', '0', '发动机', '0');
INSERT INTO `gradm_goods_category` VALUES ('7', 'N', '2016-05-28 19:10:53', '2016-05-28 19:10:53', '0', '0', '雨刮', '0');

-- ----------------------------
-- Table structure for `gradm_manager`
-- ----------------------------
DROP TABLE IF EXISTS `gradm_manager`;
CREATE TABLE `gradm_manager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `is_deleted` char(1) NOT NULL DEFAULT 'N' COMMENT '是否删除:Y/N',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `creator` int(11) DEFAULT '0' COMMENT '创建人',
  `modifier` int(11) DEFAULT '0' COMMENT '修改人',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '标记管理员1是管理员0不是',
  `gender` tinyint(1) DEFAULT NULL COMMENT '0是女性，1是男性',
  `identity_card` varchar(18) DEFAULT '' COMMENT '身份证号码',
  `age` varchar(20) DEFAULT '' COMMENT '年龄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of gradm_manager
-- ----------------------------
INSERT INTO `gradm_manager` VALUES ('1', 'Y', null, null, '0', '0', '李飞龙', '1888888888', '1', '1', '', '');
INSERT INTO `gradm_manager` VALUES ('2', 'Y', '2016-05-29 17:14:42', '2016-05-29 17:27:37', '0', '0', '李飞龙', '1888888888', '1', '1', '111', '11');
INSERT INTO `gradm_manager` VALUES ('3', 'N', '2016-05-29 17:27:31', '2016-05-29 17:27:31', '0', '0', '李琦', '12233667789', '0', '0', '22222222222', '11');
INSERT INTO `gradm_manager` VALUES ('4', 'N', '2016-05-29 17:35:42', '2016-05-29 17:35:42', '0', '0', '王五', '13255697851', '0', '1', '360112198804112365', '22');
INSERT INTO `gradm_manager` VALUES ('5', 'N', '2016-05-29 17:35:59', '2016-05-29 17:35:59', '0', '0', '陈丽', '18722023657', '0', '0', '450114199205051235', '33');
INSERT INTO `gradm_manager` VALUES ('6', 'N', '2016-05-29 17:36:16', '2016-05-29 17:36:16', '0', '0', '李强', '15633321547', '0', '1', '362012198905301543', '54');

-- ----------------------------
-- Table structure for `gradm_order_info`
-- ----------------------------
DROP TABLE IF EXISTS `gradm_order_info`;
CREATE TABLE `gradm_order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `creator` int(11) DEFAULT '0' COMMENT '创建人id',
  `modifier` int(11) DEFAULT '0' COMMENT '修改人id',
  `gmt_create` datetime DEFAULT NULL COMMENT '订单开立时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '订单修改时间',
  `is_deleted` char(1) DEFAULT 'N' COMMENT '是否删除, 默认为N',
  `order_type` int(11) DEFAULT '0' COMMENT '订单类型',
  `order_sn` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `order_name` varchar(500) DEFAULT '' COMMENT '订单名称',
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '配件id,关联gradm_goods表',
  `customer_id` int(11) DEFAULT '0' COMMENT '用户id',
  `order_status` varchar(10) DEFAULT NULL COMMENT '订单状态：DDCJ 订单创建，DDYFK订单已付款，WXDD无效订单',
  `customer_name` varchar(50) DEFAULT '' COMMENT '客户名称',
  `customer_mobile` varchar(20) DEFAULT '' COMMENT '客户手机号码',
  `order_amount` decimal(12,2) DEFAULT '0.00' COMMENT '订单金额',
  `discount` decimal(12,2) DEFAULT NULL COMMENT '优惠金额',
  `pay_time` datetime DEFAULT NULL COMMENT '结算时间',
  `pay_status` tinyint(3) unsigned DEFAULT '0' COMMENT '支付状态，0为未支付，2为已支付',
  `pay_amount` decimal(12,2) DEFAULT '0.00' COMMENT '实付金额',
  `contact_name` varchar(50) DEFAULT NULL COMMENT '联系人姓名',
  `contact_mobile` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `customer_address` varchar(200) DEFAULT NULL COMMENT '收货地址',
  `postscript` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='订单表, 保存订单基本信息';

-- ----------------------------
-- Records of gradm_order_info
-- ----------------------------
INSERT INTO `gradm_order_info` VALUES ('1', '0', '0', '2016-05-09 17:00:23', '2016-05-09 17:00:28', 'N', '0', 'DDLT201604280001', '大众轮胎(进口)3398型', '1', '2', 'DDYFK', '李强', '13377889900', '600.00', '0.00', '2016-05-10 17:00:46', '2', '600.00', '李强', '13377889900', '杭州余杭区西溪印象33号', '螺旋纹');
INSERT INTO `gradm_order_info` VALUES ('2', '0', '0', '2016-05-02 17:05:44', '2016-05-02 17:05:47', 'N', '0', 'DDJY201604280012', '福斯机油5W 0L', '0', '0', 'DDYFK', '东成', '15988766543', '988.00', '0.00', '2016-05-03 17:06:01', '2', '988.00', '李丽', '18299098878', '江西南京东路235号', '红色装');
INSERT INTO `gradm_order_info` VALUES ('3', '0', '0', '2016-05-07 17:05:51', '2016-05-07 17:05:53', 'N', '0', 'DDHHS201604280003', '劳斯莱斯发动机234型', '0', '0', 'DDYFK', '马云', '18888888888', '111111111.00', '0.00', '2016-05-07 17:06:04', '2', '111111111.00', '马云', '18888888888', '杭州余杭区淘宝城', 'NB');

-- ----------------------------
-- Table structure for `gradm_stock`
-- ----------------------------
DROP TABLE IF EXISTS `gradm_stock`;
CREATE TABLE `gradm_stock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `is_deleted` char(1) NOT NULL DEFAULT 'N' COMMENT '是否删除:Y/N',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间，入库时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `creator` int(11) DEFAULT '0' COMMENT '创建人',
  `modifier` int(11) DEFAULT '0' COMMENT '修改人',
  `goods_id` int(11) unsigned NOT NULL COMMENT '配件id',
  `goods_name` varchar(50) NOT NULL COMMENT '配件名称',
  `measure_unit` varchar(50) DEFAULT '' COMMENT '最小单位',
  `current_stock` decimal(12,2) DEFAULT '0.00' COMMENT '当前库存数量',
  `real_stock` decimal(12,2) DEFAULT NULL COMMENT '实盘库存',
  `diff_stock` decimal(12,2) DEFAULT NULL COMMENT '库存差额，实际库存-当前系统库存',
  `reason` varchar(200) DEFAULT NULL COMMENT '原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='库存信息';

-- ----------------------------
-- Records of gradm_stock
-- ----------------------------
INSERT INTO `gradm_stock` VALUES ('1', 'N', '2016-05-11 18:43:56', '2016-05-12 18:44:01', '0', '0', '2', '大众轮胎', '只', '600.00', '620.00', '-20.00', '退货返回');
INSERT INTO `gradm_stock` VALUES ('2', 'N', null, null, '0', '0', '4', '现代索纳塔原装电池', '个', '889.00', '870.00', '19.00', null);
INSERT INTO `gradm_stock` VALUES ('3', 'N', null, null, '0', '0', '5', '12缸发动机', '个', '356.00', '356.00', '0.00', null);
INSERT INTO `gradm_stock` VALUES ('4', 'N', null, null, '0', '0', '6', 'CE', '一对', '123.00', '128.00', '-5.00', '仓库不良品');
INSERT INTO `gradm_stock` VALUES ('5', 'N', '2016-05-28 19:14:01', '2016-05-28 19:14:01', '0', '0', '8', 'ms雨刮', '一对', '123.00', '123.00', '0.00', null);
INSERT INTO `gradm_stock` VALUES ('6', 'N', '2016-05-29 14:31:50', '2016-05-29 18:44:50', '0', '0', '9', '轮胎ZX3', '个', '188.00', '117.00', '71.00', null);
