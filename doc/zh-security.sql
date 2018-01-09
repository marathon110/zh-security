/*
Navicat MySQL Data Transfer

Source Server         : personnal
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : zh-security

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2018-01-02 11:39:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名case insensitive即大小写不敏感',
  `operation` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '耗时,相应时间',
  `method` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT 'ip地址',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '-1', '获取用户信息为空', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-08 10:49:05');
INSERT INTO `sys_log` VALUES ('2', '1', 'admin', '登陆', '113', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-08 10:58:19');
INSERT INTO `sys_log` VALUES ('3', '1', 'admin', '登陆', '88', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-08 13:58:07');
INSERT INTO `sys_log` VALUES ('4', '1', 'admin', '登陆', '106', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 09:25:58');
INSERT INTO `sys_log` VALUES ('5', '1', 'admin', '登陆', '85', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 09:43:31');
INSERT INTO `sys_log` VALUES ('6', '1', 'admin', '登陆', '100', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 10:13:07');
INSERT INTO `sys_log` VALUES ('7', '1', 'admin', '登陆', '88', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 14:32:04');
INSERT INTO `sys_log` VALUES ('8', '1', 'admin', '登陆', '89', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 14:34:31');
INSERT INTO `sys_log` VALUES ('9', '-1', '获取用户信息为空', '登陆', '0', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 15:22:11');
INSERT INTO `sys_log` VALUES ('10', '1', 'admin', '登陆', '22', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 15:22:17');
INSERT INTO `sys_log` VALUES ('11', '1', 'admin', '登陆', '82', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 15:47:41');
INSERT INTO `sys_log` VALUES ('12', '1', 'admin', '登陆', '91', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 15:59:53');
INSERT INTO `sys_log` VALUES ('13', '1', 'admin', '登陆', '96', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 16:04:17');
INSERT INTO `sys_log` VALUES ('14', '1', 'admin', '登陆', '83', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 16:06:00');
INSERT INTO `sys_log` VALUES ('15', '1', 'admin', '登陆', '89', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 16:07:16');
INSERT INTO `sys_log` VALUES ('16', '1', 'admin', '登陆', '101', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 16:14:59');
INSERT INTO `sys_log` VALUES ('17', '1', 'admin', '登陆', '84', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 16:34:22');
INSERT INTO `sys_log` VALUES ('18', '1', 'admin', '登陆', '84', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 16:40:20');
INSERT INTO `sys_log` VALUES ('19', '1', 'admin', '登陆', '82', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-11 16:47:29');
INSERT INTO `sys_log` VALUES ('20', '1', 'admin', '登陆', '89', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 09:17:18');
INSERT INTO `sys_log` VALUES ('21', '1', 'admin', '登陆', '88', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 09:18:09');
INSERT INTO `sys_log` VALUES ('22', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 09:26:15');
INSERT INTO `sys_log` VALUES ('23', '1', 'admin', '登陆', '73', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 09:34:49');
INSERT INTO `sys_log` VALUES ('24', '1', 'admin', '登陆', '91', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 09:37:37');
INSERT INTO `sys_log` VALUES ('25', '1', 'admin', '登陆', '79', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 09:44:28');
INSERT INTO `sys_log` VALUES ('26', '1', 'admin', '登陆', '87', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 09:46:27');
INSERT INTO `sys_log` VALUES ('27', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 09:51:13');
INSERT INTO `sys_log` VALUES ('28', '1', 'admin', '登陆', '123', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 10:22:09');
INSERT INTO `sys_log` VALUES ('29', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 10:58:45');
INSERT INTO `sys_log` VALUES ('30', '1', 'admin', '登陆', '88', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 14:54:35');
INSERT INTO `sys_log` VALUES ('31', '1', 'admin', '登陆', '3', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 15:12:17');
INSERT INTO `sys_log` VALUES ('32', '1', 'admin', '登陆', '88', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 15:49:27');
INSERT INTO `sys_log` VALUES ('33', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 15:53:16');
INSERT INTO `sys_log` VALUES ('34', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 16:00:53');
INSERT INTO `sys_log` VALUES ('35', '1', 'admin', '登陆', '80', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 16:03:41');
INSERT INTO `sys_log` VALUES ('36', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 16:13:12');
INSERT INTO `sys_log` VALUES ('37', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 16:14:15');
INSERT INTO `sys_log` VALUES ('38', '1', 'admin', '登陆', '86', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 16:17:17');
INSERT INTO `sys_log` VALUES ('39', '1', 'admin', '登陆', '16', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-12 17:04:11');
INSERT INTO `sys_log` VALUES ('40', '1', 'admin', '登陆', '94', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-13 09:19:22');
INSERT INTO `sys_log` VALUES ('41', '1', 'admin', '登陆', '94', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-13 09:27:21');
INSERT INTO `sys_log` VALUES ('42', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-13 09:30:18');
INSERT INTO `sys_log` VALUES ('43', '1', 'admin', '登陆', '93', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-13 09:42:10');
INSERT INTO `sys_log` VALUES ('44', '1', 'admin', '登陆', '91', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2017-12-13 09:44:17');
INSERT INTO `sys_log` VALUES ('45', '1', 'admin', '登陆', '91', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-13 09:57:21');
INSERT INTO `sys_log` VALUES ('46', '1', 'admin', '登陆', '104', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-13 10:33:12');
INSERT INTO `sys_log` VALUES ('47', '1', 'admin', '登陆', '81', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-13 10:51:24');
INSERT INTO `sys_log` VALUES ('48', '1', 'admin', '登陆', '109', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-13 10:53:38');
INSERT INTO `sys_log` VALUES ('49', '1', 'admin', '登陆', '109', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-15 11:13:12');
INSERT INTO `sys_log` VALUES ('50', '1', 'admin', '登陆', '81', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-15 11:33:33');
INSERT INTO `sys_log` VALUES ('51', '1', 'admin', '登陆', '118', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 10:55:49');
INSERT INTO `sys_log` VALUES ('52', '1', 'admin', '登陆', '85', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:06:05');
INSERT INTO `sys_log` VALUES ('53', '1', 'admin', '登陆', '84', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:07:30');
INSERT INTO `sys_log` VALUES ('54', '1', 'admin', '登陆', '106', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:24:59');
INSERT INTO `sys_log` VALUES ('55', '1', 'admin', '登陆', '3', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:25:54');
INSERT INTO `sys_log` VALUES ('56', '1', 'admin', '登陆', '111', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:30:41');
INSERT INTO `sys_log` VALUES ('57', '1', 'admin', '登陆', '81', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:31:42');
INSERT INTO `sys_log` VALUES ('58', '1', 'admin', '登陆', '98', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:41:15');
INSERT INTO `sys_log` VALUES ('59', '1', 'admin', '登陆', '94', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:42:18');
INSERT INTO `sys_log` VALUES ('60', '1', 'admin', '登陆', '96', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:43:22');
INSERT INTO `sys_log` VALUES ('61', '1', 'admin', '登陆', '115', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:45:43');
INSERT INTO `sys_log` VALUES ('62', '1', 'admin', '登陆', '97', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:48:52');
INSERT INTO `sys_log` VALUES ('63', '1', 'admin', '登陆', '114', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:49:30');
INSERT INTO `sys_log` VALUES ('64', '1', 'admin', '登陆', '100', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:55:18');
INSERT INTO `sys_log` VALUES ('65', '1', 'admin', '登陆', '80', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:56:13');
INSERT INTO `sys_log` VALUES ('66', '1', 'admin', '登陆', '82', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 11:58:16');
INSERT INTO `sys_log` VALUES ('67', '1', 'admin', '登陆', '111', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 12:29:33');
INSERT INTO `sys_log` VALUES ('68', '1', 'admin', '登陆', '80', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 12:30:48');
INSERT INTO `sys_log` VALUES ('69', '1', 'admin', '登陆', '101', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 16:18:09');
INSERT INTO `sys_log` VALUES ('70', '1', 'admin', '登陆', '103', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 16:31:20');
INSERT INTO `sys_log` VALUES ('71', '1', 'admin', '登陆', '119', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-19 16:38:02');
INSERT INTO `sys_log` VALUES ('72', '1', 'admin', '登陆', '108', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-20 13:57:46');
INSERT INTO `sys_log` VALUES ('73', '1', 'admin', '登陆', '3', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-20 14:09:17');
INSERT INTO `sys_log` VALUES ('74', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-20 14:26:31');
INSERT INTO `sys_log` VALUES ('75', '1', 'admin', '登陆', '3', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-20 14:30:36');
INSERT INTO `sys_log` VALUES ('76', '-1', null, '退出系统', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2017-12-20 14:36:21');
INSERT INTO `sys_log` VALUES ('77', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-20 14:36:33');
INSERT INTO `sys_log` VALUES ('78', '1', 'admin', '登陆', '103', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-20 14:54:14');
INSERT INTO `sys_log` VALUES ('79', '1', 'admin', '登陆', '105', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-25 15:57:13');
INSERT INTO `sys_log` VALUES ('80', '-1', null, '退出系统', '8', 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2017-12-25 15:59:39');
INSERT INTO `sys_log` VALUES ('81', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-25 16:00:51');
INSERT INTO `sys_log` VALUES ('82', '1', 'admin', '登陆', '1', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-25 16:08:33');
INSERT INTO `sys_log` VALUES ('83', '1', 'admin', '登陆', '122', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-25 16:45:50');
INSERT INTO `sys_log` VALUES ('84', '1', 'admin', '登陆', '130', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-25 16:48:32');
INSERT INTO `sys_log` VALUES ('85', '1', 'admin', '登陆', '122', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-25 16:54:48');
INSERT INTO `sys_log` VALUES ('86', '1', 'admin', '登陆', '94', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-25 17:00:41');
INSERT INTO `sys_log` VALUES ('87', '1', 'admin', '登陆', '87', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-25 17:10:48');
INSERT INTO `sys_log` VALUES ('88', '1', 'admin', '登陆', '87', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-26 09:04:45');
INSERT INTO `sys_log` VALUES ('89', '1', 'admin', '登陆', '110', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-26 10:55:12');
INSERT INTO `sys_log` VALUES ('90', '1', 'admin', '登陆', '91', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-26 14:47:55');
INSERT INTO `sys_log` VALUES ('91', '1', 'admin', '登陆', '87', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-26 15:42:26');
INSERT INTO `sys_log` VALUES ('92', '1', 'admin', '登陆', '85', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-26 16:02:44');
INSERT INTO `sys_log` VALUES ('93', '1', 'admin', '登陆', '86', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-26 16:38:37');
INSERT INTO `sys_log` VALUES ('94', '1', 'admin', '登陆', '118', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-26 16:39:20');
INSERT INTO `sys_log` VALUES ('95', '1', 'admin', '登陆', '90', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-27 09:04:54');
INSERT INTO `sys_log` VALUES ('96', '1', 'admin', '登陆', '90412', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-27 09:07:17');
INSERT INTO `sys_log` VALUES ('97', '1', 'admin', '登陆', '81', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-27 09:12:18');
INSERT INTO `sys_log` VALUES ('98', '1', 'admin', '登陆', '96363', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-27 09:14:25');
INSERT INTO `sys_log` VALUES ('99', '1', 'admin', '登陆', '84', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-27 09:34:17');
INSERT INTO `sys_log` VALUES ('100', '-1', null, '退出系统', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2017-12-27 09:38:37');
INSERT INTO `sys_log` VALUES ('101', '1', 'admin', '登陆', '4', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-27 09:38:44');
INSERT INTO `sys_log` VALUES ('102', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-27 10:11:05');
INSERT INTO `sys_log` VALUES ('103', '1', 'admin', '登陆', '86', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-27 14:59:24');
INSERT INTO `sys_log` VALUES ('104', '1', 'admin', '登陆', '124', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-27 15:47:58');
INSERT INTO `sys_log` VALUES ('105', '1', 'admin', '登陆', '83', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-28 14:47:59');
INSERT INTO `sys_log` VALUES ('106', '1', 'admin', '登陆', '3', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '192.168.30.105', '2017-12-28 15:00:21');
INSERT INTO `sys_log` VALUES ('107', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '192.168.30.105', '2017-12-28 15:02:23');
INSERT INTO `sys_log` VALUES ('108', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-28 15:29:10');
INSERT INTO `sys_log` VALUES ('109', '1', 'admin', '登陆', '3', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-28 15:50:38');
INSERT INTO `sys_log` VALUES ('110', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-28 15:58:42');
INSERT INTO `sys_log` VALUES ('111', '1', 'admin', '登陆', '3', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-28 16:02:00');
INSERT INTO `sys_log` VALUES ('112', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-28 16:06:08');
INSERT INTO `sys_log` VALUES ('113', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-28 16:17:11');
INSERT INTO `sys_log` VALUES ('114', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-28 16:20:12');
INSERT INTO `sys_log` VALUES ('115', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-28 16:20:12');
INSERT INTO `sys_log` VALUES ('116', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-28 16:21:23');
INSERT INTO `sys_log` VALUES ('117', '1', 'admin', '登陆', '1', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '192.168.30.105', '2017-12-28 16:52:25');
INSERT INTO `sys_log` VALUES ('118', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-28 17:00:54');
INSERT INTO `sys_log` VALUES ('119', '1', 'admin', '登陆', '82', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-28 17:08:39');
INSERT INTO `sys_log` VALUES ('120', '1', 'admin', '登陆', '3', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '192.168.30.105', '2017-12-28 17:09:14');
INSERT INTO `sys_log` VALUES ('121', '1', 'admin', '登陆', '121', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-29 11:28:17');
INSERT INTO `sys_log` VALUES ('122', '1', 'admin', '登陆', '2', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '192.168.9.103', '2017-12-29 11:39:35');
INSERT INTO `sys_log` VALUES ('123', '1', 'admin', '登陆', '12', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-29 13:28:13');
INSERT INTO `sys_log` VALUES ('124', '1', 'admin', '登陆', '89', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-29 13:53:55');
INSERT INTO `sys_log` VALUES ('125', '1', 'admin', '登陆', '1', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-29 13:55:16');
INSERT INTO `sys_log` VALUES ('126', '1', 'admin', '登陆', '93', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-29 15:34:36');
INSERT INTO `sys_log` VALUES ('127', '1', 'admin', '登陆', '93', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-29 15:39:06');
INSERT INTO `sys_log` VALUES ('128', '1', 'admin', '登陆', '75', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-29 15:47:19');
INSERT INTO `sys_log` VALUES ('129', '-1', '获取用户信息为空', '登陆', '0', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-29 16:39:34');
INSERT INTO `sys_log` VALUES ('130', '1', 'admin', '登陆', '18', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-29 16:39:39');
INSERT INTO `sys_log` VALUES ('131', '1', 'admin', '登陆', '81', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-29 16:41:06');
INSERT INTO `sys_log` VALUES ('132', '1', 'admin', '登陆', '118', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2017-12-29 16:44:23');
INSERT INTO `sys_log` VALUES ('133', '1', 'admin', '登陆', '80', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-02 09:10:33');
INSERT INTO `sys_log` VALUES ('134', '1', 'admin', '登陆', '91', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-02 09:19:01');
INSERT INTO `sys_log` VALUES ('135', '1', 'admin', '登陆', '84', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-02 10:28:23');
INSERT INTO `sys_log` VALUES ('136', '1', 'admin', '登陆', '89', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-02 10:34:34');
INSERT INTO `sys_log` VALUES ('137', '1', 'admin', '登陆', '82', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-02 11:29:39');
INSERT INTO `sys_log` VALUES ('138', '1', 'admin', '登陆', '100', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-02 11:33:03');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '基础管理', null, null, '0', 'fa fa-coffee', '0', '2017-12-20 14:22:08', null);
INSERT INTO `sys_menu` VALUES ('2', '0', '系统管理', null, null, '0', 'fa fa-desktop', '1', '2017-12-20 14:41:56', null);
INSERT INTO `sys_menu` VALUES ('3', '2', '用户管理', 'base/user/list.html', null, '1', 'fa fa-user', '0', '2017-12-20 14:47:55', null);
INSERT INTO `sys_menu` VALUES ('4', '2', '角色管理', 'base/role/list.html', null, '1', 'fa fa-paw', '1', '2017-12-20 14:48:31', null);
INSERT INTO `sys_menu` VALUES ('5', '2', '菜单管理', 'base/menu/list.html', null, '1', 'fa fa-th-list', '2', '2017-12-20 14:49:24', null);
INSERT INTO `sys_menu` VALUES ('6', '3', '新增', null, 'sys:user:save', '2', null, '0', '2018-01-02 11:16:16', null);
INSERT INTO `sys_menu` VALUES ('7', '3', '编辑', null, 'sys:user:edit', '2', null, '0', '2018-01-02 11:17:09', null);
INSERT INTO `sys_menu` VALUES ('8', '3', '删除', null, 'sys:user:remove', '2', null, '0', '2018-01-02 11:17:38', null);
INSERT INTO `sys_menu` VALUES ('9', '4', '新增', null, 'sys:role:save', '2', null, '0', '2018-01-02 11:18:15', null);
INSERT INTO `sys_menu` VALUES ('10', '4', '编辑', null, 'sys:role:edit', '2', null, '0', '2018-01-02 11:18:54', null);
INSERT INTO `sys_menu` VALUES ('11', '4', '删除', null, 'sys:role:remove', '2', null, '0', '2018-01-02 11:19:26', null);
INSERT INTO `sys_menu` VALUES ('12', '4', '分配权限', null, 'sys:role:authorize', '2', null, '0', '2018-01-02 11:22:15', null);
INSERT INTO `sys_menu` VALUES ('13', '5', '新增', null, 'sys:menu:save', '2', null, '0', '2018-01-02 11:23:15', null);
INSERT INTO `sys_menu` VALUES ('14', '5', '编辑', null, 'sys:menu:edit', '2', null, '0', '2018-01-02 11:23:38', null);
INSERT INTO `sys_menu` VALUES ('15', '5', '删除', null, 'sys:menu:remove', '2', null, '0', '2018-01-02 11:24:04', null);
INSERT INTO `sys_menu` VALUES ('16', '3', '启用', null, 'sys:user:enable', '2', null, '0', '2018-01-02 11:25:00', null);
INSERT INTO `sys_menu` VALUES ('17', '3', '禁用', null, 'sys:user:disable', '2', null, '0', '2018-01-02 11:25:40', null);
INSERT INTO `sys_menu` VALUES ('18', '3', '重置密码', null, 'sys:user:resetPassword', '2', null, '0', '2018-01-02 11:26:07', null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '【系统内置】', '1', '2017-12-20 14:34:21', null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('4', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('5', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('6', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('7', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('8', '1', '8');
INSERT INTO `sys_role_menu` VALUES ('9', '1', '9');
INSERT INTO `sys_role_menu` VALUES ('10', '1', '10');
INSERT INTO `sys_role_menu` VALUES ('11', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('12', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('13', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('14', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('15', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('16', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('17', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('18', '1', '18');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '941f0f074eeeb6ffbf1abb4d22a6be97', '736720794@qq.com', '17621776714', '1', '1', '2017-12-08 10:56:35', null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1');
