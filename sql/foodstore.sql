/*
Navicat MySQL Data Transfer

Source Server         : DatebaseLink_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : foodstore

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-01-04 14:40:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminID` int(4) NOT NULL,
  `adminName` varchar(25) NOT NULL,
  `adminPwd` varchar(50) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'Admin', 'admin');
INSERT INTO `admin` VALUES ('2', 'test', '123456');

-- ----------------------------
-- Table structure for `commodityclassone`
-- ----------------------------
DROP TABLE IF EXISTS `commodityclassone`;
CREATE TABLE `commodityclassone` (
  `CommodityClassOneId` int(12) NOT NULL,
  `CommodityClassOneName` varchar(255) NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CommodityClassOneId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of commodityclassone
-- ----------------------------
INSERT INTO `commodityclassone` VALUES ('1', '休闲零食', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `commodityclassone` VALUES ('2', '水饮冲调', '2018-12-29 11:15:48', '2018-12-29 11:15:48');
INSERT INTO `commodityclassone` VALUES ('3', '生鲜食材', '2018-12-29 11:16:22', '2018-12-29 11:16:22');
INSERT INTO `commodityclassone` VALUES ('4', 'test', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `commodityclassone` VALUES ('5', 'test1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `commodityclassthree`
-- ----------------------------
DROP TABLE IF EXISTS `commodityclassthree`;
CREATE TABLE `commodityclassthree` (
  `CommodityClassThreeId` int(2) NOT NULL,
  `CommodityClassThreeName` varchar(255) NOT NULL,
  `CommodityClassThreePrice` double NOT NULL,
  `CommodityClassTwoId` int(12) NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `imgsrc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CommodityClassThreeId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of commodityclassthree
-- ----------------------------
INSERT INTO `commodityclassthree` VALUES ('1', '好吃点', '3.5', '1', '2018-12-29 11:22:22', '2019-01-03 15:30:13', '/FoodStore/Home/picture/01.jpg');
INSERT INTO `commodityclassthree` VALUES ('2', '苏打饼干', '3.5', '1', '2018-12-29 11:22:35', '2019-01-03 22:28:36', '/FoodStore/Home/picture/02.jpg');
INSERT INTO `commodityclassthree` VALUES ('3', '肉松饼', '4.5', '2', '2018-12-29 11:22:50', '2019-01-03 22:28:43', '/FoodStore/Home/picture/03.jpg');
INSERT INTO `commodityclassthree` VALUES ('4', '彩笛卷', '5.5', '2', '2018-12-29 11:23:06', '2019-01-03 22:28:45', '/FoodStore/Home/picture/04.jpg');
INSERT INTO `commodityclassthree` VALUES ('5', '乳酸菌', '10.5', '6', '2018-12-29 20:40:18', '2019-01-03 22:28:48', '/FoodStore/Home/picture/05.jpg');
INSERT INTO `commodityclassthree` VALUES ('6', '可乐', '3', '11', '2018-12-29 11:24:21', '2019-01-03 22:28:51', '/FoodStore/Home/picture/06.jpg');
INSERT INTO `commodityclassthree` VALUES ('7', '雪碧', '3', '11', '2018-12-29 11:24:29', '2019-01-03 22:28:53', '/FoodStore/Home/picture/07.jpg');
INSERT INTO `commodityclassthree` VALUES ('8', '冻干柠檬片', '5', '9', '2018-12-29 11:24:52', '2019-01-03 22:29:04', '/FoodStore/Home/picture/08.jpg');
INSERT INTO `commodityclassthree` VALUES ('9', '陈皮普洱', '30', '9', '2018-12-29 11:25:11', '2019-01-03 22:29:08', '/FoodStore/Home/picture/09.jpg');
INSERT INTO `commodityclassthree` VALUES ('10', '星巴克', '90', '7', '2018-12-29 11:25:22', '2019-01-03 16:10:32', '/FoodStore/Home/picture/01.jpg');
INSERT INTO `commodityclassthree` VALUES ('11', '伯朗咖啡', '70', '7', '2018-12-29 11:25:44', '2019-01-03 16:10:32', '/FoodStore/Home/picture/01.jpg');
INSERT INTO `commodityclassthree` VALUES ('12', '蒙古老酸奶', '10', '12', '2018-12-29 11:26:13', '2019-01-03 16:10:33', '/FoodStore/Home/picture/01.jpg');
INSERT INTO `commodityclassthree` VALUES ('13', '玉米', '19.9', '14', '0000-00-00 00:00:00', '2019-01-03 16:10:34', '/FoodStore/Home/picture/01.jpg');
INSERT INTO `commodityclassthree` VALUES ('14', '小南瓜', '9.9', '14', '0000-00-00 00:00:00', '2019-01-03 16:10:34', '/FoodStore/Home/picture/01.jpg');
INSERT INTO `commodityclassthree` VALUES ('15', 'test', '90', '14', '0000-00-00 00:00:00', '2019-01-03 16:10:35', '/FoodStore/Home/picture/01.jpg');
INSERT INTO `commodityclassthree` VALUES ('16', '好吃点', '123', '13', '0000-00-00 00:00:00', '2019-01-03 16:10:35', '/FoodStore/Home/picture/01.jpg');
INSERT INTO `commodityclassthree` VALUES ('17', '好吃点', '123', '14', '0000-00-00 00:00:00', '2019-01-03 16:10:39', '/FoodStore/Home/picture/01.jpg');
INSERT INTO `commodityclassthree` VALUES ('18', '好吃点', '90', '13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '/FoodStore/Home/picture/01.jpg');

-- ----------------------------
-- Table structure for `commodityclasstwo`
-- ----------------------------
DROP TABLE IF EXISTS `commodityclasstwo`;
CREATE TABLE `commodityclasstwo` (
  `CommodityClassTwoId` int(2) NOT NULL,
  `CommodityClassTwoName` varchar(255) NOT NULL,
  `CommodityClassOneId` int(12) NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CommodityClassTwoId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of commodityclasstwo
-- ----------------------------
INSERT INTO `commodityclasstwo` VALUES ('1', '饼干', '1', '2018-12-29 11:17:23', '2018-12-29 11:17:23');
INSERT INTO `commodityclasstwo` VALUES ('2', '糕点', '1', '2018-12-29 11:17:53', '2018-12-29 11:17:53');
INSERT INTO `commodityclasstwo` VALUES ('3', '坚果蜜饯', '1', '2018-12-29 11:17:54', '2018-12-29 11:17:54');
INSERT INTO `commodityclasstwo` VALUES ('4', '塘巧', '1', '2018-12-29 11:17:56', '2018-12-29 11:17:56');
INSERT INTO `commodityclasstwo` VALUES ('5', '布丁', '1', '2018-12-29 11:17:57', '2018-12-29 11:17:57');
INSERT INTO `commodityclasstwo` VALUES ('6', '含乳饮料', '2', '2018-12-29 11:18:58', '2018-12-29 11:18:58');
INSERT INTO `commodityclasstwo` VALUES ('7', '咖啡饮料', '2', '2018-12-29 11:18:50', '2018-12-29 11:18:50');
INSERT INTO `commodityclasstwo` VALUES ('8', '饮用水', '2', '2018-12-29 11:18:56', '2018-12-29 11:18:56');
INSERT INTO `commodityclasstwo` VALUES ('9', '茗茶', '2', '2018-12-29 11:19:00', '2018-12-29 11:19:00');
INSERT INTO `commodityclasstwo` VALUES ('10', '冲饮谷物', '2', '2018-12-29 11:19:01', '2018-12-29 11:19:01');
INSERT INTO `commodityclasstwo` VALUES ('11', '碳酸饮料', '2', '2018-12-29 11:19:27', '2018-12-29 11:19:27');
INSERT INTO `commodityclasstwo` VALUES ('12', '乳制品', '3', '2018-12-29 11:19:28', '2018-12-29 11:19:28');
INSERT INTO `commodityclasstwo` VALUES ('13', '肉类', '3', '2018-12-29 11:19:39', '2018-12-29 11:19:39');
INSERT INTO `commodityclasstwo` VALUES ('14', '蔬菜', '3', '2018-12-29 11:19:42', '2018-12-29 11:19:42');
INSERT INTO `commodityclasstwo` VALUES ('15', '蛋类', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `commodityclasstwo` VALUES ('16', '进口水果', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `commodityclasstwo` VALUES ('17', '好丽友', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `commodityclasstwo` VALUES ('18', '星球杯', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `commodityclasstwo` VALUES ('19', '星球杯1', '5', '0000-00-00 00:00:00', '2019-01-02 08:40:16');
INSERT INTO `commodityclasstwo` VALUES ('20', 'test12', '1', '0000-00-00 00:00:00', '2019-01-02 09:38:49');

-- ----------------------------
-- Table structure for `placeorder`
-- ----------------------------
DROP TABLE IF EXISTS `placeorder`;
CREATE TABLE `placeorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placeorder_str` varchar(5000) CHARACTER SET utf8 DEFAULT NULL,
  `total` double DEFAULT NULL,
  `ordertime` timestamp NULL DEFAULT NULL,
  `userEmail` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of placeorder
-- ----------------------------
INSERT INTO `placeorder` VALUES ('10', '<table><tr><td>好吃点</td><td>3.5</td><td>1</td><td>3.5</td></tr></table><table><tr><td>肉松饼</td><td>4.5</td><td>2</td><td>9.0</td></tr></table>', '12.5', '2019-01-03 22:17:35', '11111@qq.com');
INSERT INTO `placeorder` VALUES ('11', '<table><tr><td>好吃点</td><td>3.5</td><td>3</td><td>10.5</td></tr></table><table><tr><td>肉松饼</td><td>4.5</td><td>2</td><td>9.0</td></tr></table><table><tr><td>彩笛卷</td><td>5.5</td><td>1</td><td>5.5</td></tr></table>', '25', '2019-01-03 22:19:13', 'Home@qq.com');
INSERT INTO `placeorder` VALUES ('7', '<table><tr><td>好吃点</td><td>3.5</td><td>1</td><td>3.5</td></tr></table><table><tr><td>肉松饼</td><td>4.5</td><td>1</td><td>4.5</td></tr></table><table><tr><td>彩笛卷</td><td>5.5</td><td>1</td><td>5.5</td></tr></table>', '13.5', '2019-01-03 22:15:21', '11111@qq.com');
INSERT INTO `placeorder` VALUES ('12', '<table><tr><td>伯朗咖啡</td><td>70.0</td><td>1</td><td>70.0</td></tr></table><table><tr><td>陈皮普洱</td><td>30.0</td><td>1</td><td>30.0</td></tr></table>', '100', '2019-01-03 22:20:05', 'Home@qq.com');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` int(50) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userPwd` varchar(255) DEFAULT NULL,
  `userRegistDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '张强', 'hypocritez@vip.qq.com', 'MTIzNDU2', '2019-01-04 00:08:20');
INSERT INTO `user` VALUES ('2', '杨雪凝', '123@qq.com', 'MTIzNDU2', '2019-01-04 00:09:33');
INSERT INTO `user` VALUES ('3', '蔡博', '919687276@qq.com', 'MTIzNDU2', '2019-01-04 00:10:13');
INSERT INTO `user` VALUES ('4', '谭诗颂', '23456@qq.com', 'MTIzNDU2', '2019-01-04 00:09:53');
INSERT INTO `user` VALUES ('5', '11111', '111@qq.com', 'MTExMTExMQ==', '2019-01-02 19:30:57');
INSERT INTO `user` VALUES ('6', 'caibo', '919687276@qq.com', 'YWE5MTk2NTIwMTMxNA==', '2019-01-02 19:30:57');
INSERT INTO `user` VALUES ('7', '1111111', '11111@qq.com', 'MTExMTExMQ==', '2019-01-03 09:35:11');
INSERT INTO `user` VALUES ('8', 'Home', 'Home@qq.com', 'aG9tZQ==', '2019-01-03 22:18:34');
INSERT INTO `user` VALUES ('14', 'test', 'test@qq.com', 'MTIzNDU2', '2019-01-04 14:14:58');
