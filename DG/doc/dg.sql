/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50145
Source Host           : localhost:3306
Source Database       : dg

Target Server Type    : MYSQL
Target Server Version : 50145
File Encoding         : 65001

Date: 2010-11-16 16:55:12
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dg_admin`
-- ----------------------------
DROP TABLE IF EXISTS `dg_admin`;
CREATE TABLE `dg_admin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `USERNAME` varchar(20) NOT NULL COMMENT '登录名',
  `PASSWORD` varchar(32) NOT NULL COMMENT '登录密码',
  `REALNAME` varchar(20) NOT NULL COMMENT '真实名',
  `EMAIL` varchar(50) NOT NULL COMMENT '电子邮件',
  `PHONE` varchar(20) NOT NULL COMMENT '电话号码',
  `LASTLOGINTIME` datetime NOT NULL COMMENT '上次登录时间',
  `LASTLOGINIP` varchar(20) NOT NULL COMMENT '上次登录IP',
  `SUPER` tinyint(4) NOT NULL COMMENT '超级管理员标识：1是；0否',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERNAME_UNIQUE` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员信息表';

-- ----------------------------
-- Records of dg_admin
-- ----------------------------
INSERT INTO `dg_admin` VALUES ('1', 'admin', '202CB962AC59075B964B07152D234B70', 'xxx', 'xxx', '10000', '2010-11-15 22:00:41', '127.0.0.1', '1');

-- ----------------------------
-- Table structure for `dg_order`
-- ----------------------------
DROP TABLE IF EXISTS `dg_order`;
CREATE TABLE `dg_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ORDERNO` varchar(20) NOT NULL COMMENT '订单号',
  `USERID` int(11) NOT NULL COMMENT '用户ID',
  `GENERATETIME` datetime NOT NULL COMMENT '下单时间',
  `NUMIID` varchar(15) NOT NULL COMMENT '商品ID',
  `ITEMTITLE` varchar(200) NOT NULL COMMENT '商品名',
  `ITEMURL` varchar(200) NOT NULL COMMENT '商品URL',
  `PRICE` varchar(15) NOT NULL COMMENT '商品价格',
  `COUNT` int(11) NOT NULL COMMENT '订购数量',
  `EXPRESSFEE` varchar(10) NOT NULL COMMENT '国内段运费',
  `FEE` varchar(10) NOT NULL COMMENT '国际运费',
  `CHARGE` varchar(10) NOT NULL COMMENT '手续费',
  `TOTAL` varchar(10) NOT NULL COMMENT '总费用',
  `ADMINTAG` tinyint(4) NOT NULL COMMENT '管理状态',
  `USERTAG` tinyint(4) NOT NULL COMMENT '用户状态',
  `BACKUPURL` varchar(200) NOT NULL COMMENT '备用URL',
  `REMARK` varchar(200) NOT NULL COMMENT '用户备注',
  `IP` varchar(20) NOT NULL COMMENT '订单生成时IP',
  PRIMARY KEY (`ID`),
  KEY `FK_USERID_ORDER` (`USERID`),
  CONSTRAINT `FK_USERID_ORDER` FOREIGN KEY (`USERID`) REFERENCES `dg_user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='客户订单表';

-- ----------------------------
-- Records of dg_order
-- ----------------------------
INSERT INTO `dg_order` VALUES ('1', '20101116162942RNN', '1', '2010-11-16 16:29:42', '8254298203', '韩国 蝴蝶结 圈圈 单排扣 红色毛呢大衣短外套 特价~', 'http://item.taobao.com/item.htm?id=8254298203', '188.00', '12', '5.00', '12', '50', '2323', '0', '1', '12', '无', '127.0.0.1');

-- ----------------------------
-- Table structure for `dg_user`
-- ----------------------------
DROP TABLE IF EXISTS `dg_user`;
CREATE TABLE `dg_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `USERNAME` varchar(20) NOT NULL COMMENT '登录名',
  `PASSWORD` varchar(32) NOT NULL COMMENT '密码',
  `REALNAME` varchar(20) NOT NULL COMMENT '真实名',
  `EMAIL` varchar(50) NOT NULL COMMENT '电子邮件',
  `PHONE` varchar(20) NOT NULL COMMENT '电话号码',
  `LASTLOGINTIME` datetime NOT NULL COMMENT '上次登录时间',
  `LASTLOGINIP` varchar(20) NOT NULL COMMENT '上次登录IP',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERNAME_UNIQUE` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of dg_user
-- ----------------------------
INSERT INTO `dg_user` VALUES ('1', 'xxx', '202CB962AC59075B964B07152D234B70', 'xxx', 'xxx', '10000', '2010-11-16 15:04:03', '127.0.0.1');
