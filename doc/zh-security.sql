/*
Navicat MySQL Data Transfer

Source Server         : personnal
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : zh-security

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2018-01-09 14:43:52
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
  `result` tinyint(255) DEFAULT NULL COMMENT '操作结果 1-成功 0-失败',
  `remark` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '操作描述',
  `type` tinyint(255) DEFAULT NULL COMMENT '日志类型 1-登录 2-访问 3-操作 4-异常 5-授权',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('173', '1', 'admin', '清空日志', '5', 'net.zhenghao.zh.common.controller.SysLogController.batchRemoveAll()', null, '0:0:0:0:0:0:0:1', '2018-01-09 13:39:26', '1', '响应时间：5ms', '3');
INSERT INTO `sys_log` VALUES ('174', '1', 'admin', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-01-09 13:39:55', '1', '退出系统', '1');
INSERT INTO `sys_log` VALUES ('175', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"pf42e\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-09 14:30:57', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('176', '1', 'admin', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-01-09 14:31:49', '1', '退出系统', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

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
INSERT INTO `sys_menu` VALUES ('19', '1', '系统日志', 'base/log/list.html', null, '1', 'fa fa-warning', '0', '2018-01-02 13:40:25', null);
INSERT INTO `sys_menu` VALUES ('20', '19', '删除', null, 'sys:log:remove', '2', null, '0', '2018-01-02 13:41:15', null);
INSERT INTO `sys_menu` VALUES ('21', '19', '清空', '', 'sys:log:clear', '2', null, '0', '2018-01-02 13:41:46', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

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
INSERT INTO `sys_role_menu` VALUES ('19', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('20', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('21', '1', '21');

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
