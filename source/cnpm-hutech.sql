/*
Navicat MySQL Data Transfer

Source Server         : localhost 8080
Source Server Version : 50613
Source Host           : localhost:3307
Source Database       : cnpm-hutech

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2017-05-20 22:56:17
*/

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `comment`;
DROP TABLE IF EXISTS `post`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `user`;

-- ----------------------------
-- Table structure for category
-- ----------------------------

CREATE TABLE `category` (
  `CATID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATNAME` varchar(255) DEFAULT NULL,
  `CATDESCRIPTION` text,
  PRIMARY KEY (`CATID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'CD1-CNPM', null);
INSERT INTO `category` VALUES ('2', 'Lập trình di động', null);
INSERT INTO `category` VALUES ('3', 'Kĩ thuật lập trình', null);
INSERT INTO `category` VALUES ('4', 'Lập trình C', null);
INSERT INTO `category` VALUES ('5', 'Cấu trúc dữ liệu và giải thuật', null);
INSERT INTO `category` VALUES ('6', 'Công nghệ phần mềm', null);
INSERT INTO `category` VALUES ('7', 'Thương mại điện tử', null);

-- ----------------------------
-- Table structure for comment
-- ----------------------------

CREATE TABLE `comment` (
  `CID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PID` bigint(20) DEFAULT NULL,
  `UID` int(11) DEFAULT NULL,
  `CDATE` datetime DEFAULT NULL,
  `CCOMMENT` text,
  PRIMARY KEY (`CID`),
  KEY `FK_REFERENCE_4` (`PID`),
  KEY `FK_REFERENCE_7` (`UID`),
  CONSTRAINT `FK_REFERENCE_4` FOREIGN KEY (`PID`) REFERENCES `post` (`PID`),
  CONSTRAINT `FK_REFERENCE_7` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '1', '2017-05-12 17:52:03', 'Hay vá bạn ơi <3');

-- ----------------------------
-- Table structure for post
-- ----------------------------

CREATE TABLE `post` (
  `PID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` int(11) DEFAULT NULL,
  `CATID` bigint(20) DEFAULT NULL,
  `PTITLE` text,
  `PDESCRIPTION` text,
  `PDATE` datetime DEFAULT NULL,
  `PASSCODE` text,
  `PCONTENT` longtext,
  `PMETADATA` text,
  PRIMARY KEY (`PID`),
  KEY `FK_REFERENCE_1` (`UID`),
  KEY `FK_REFERENCE_5` (`CATID`),
  CONSTRAINT `FK_REFERENCE_1` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`),
  CONSTRAINT `FK_REFERENCE_5` FOREIGN KEY (`CATID`) REFERENCES `category` (`CATID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', '1', '7', 'Cau Hoi Trac Nghiem Tham Khao TMDT', null, '2017-05-02 14:00:24', null, 'Các bạn bấm dzô đây để tải về: http://www.mediafire.com/view/?h0ad8bgdwo4iqxt . Nguồn: Blog 10cth1-2 HUTECH (http://10cth12.nready.net/home/read.php?640)', null);
INSERT INTO `post` VALUES ('2', '1', '7', 'Tài liệu môn Phần mềm nguồn mở và Thuơng mại điện tử', null, '2017-05-04 14:04:51', null, 'Bấm vào đây để tải: http://www.mediafire.com/?8ch6we2va5x67 . Nguồn: http://10cth12.nready.net/home/read.php?627', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `UNAME` varchar(255) DEFAULT NULL,
  `UPWD` text,
  `UMAIL` varchar(255) DEFAULT NULL,
  `UMETADATA` text,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'quantri', '1234', 'team@nready.net', null);
SET FOREIGN_KEY_CHECKS=1;
