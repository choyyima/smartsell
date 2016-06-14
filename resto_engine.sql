/*
Navicat MySQL Data Transfer

Source Server         : aryana
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : resto_engine

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2016-06-14 16:16:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '', 'choyyima.aja@gmail.com', '88997ab14bfed3275c83', 'choyyima', '01b307acba4f54f55aafc33bb06bbbf6ca803e9a', '1');
