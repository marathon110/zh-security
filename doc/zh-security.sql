/*
Navicat MySQL Data Transfer

Source Server         : personnal
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : zh-security

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2018-01-17 17:09:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `quartz_job`;
CREATE TABLE `quartz_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Spring Bean名称',
  `method_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态，0：暂停，1：正常',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='定时任务';

-- ----------------------------
-- Records of quartz_job
-- ----------------------------

-- ----------------------------
-- Table structure for quartz_job_log
-- ----------------------------
DROP TABLE IF EXISTS `quartz_job_log`;
CREATE TABLE `quartz_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态 0：失败 1：成功',
  `error` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='定时任务日志';

-- ----------------------------
-- Records of quartz_job_log
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=latin1 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('173', '1', 'admin', '清空日志', '5', 'net.zhenghao.zh.common.controller.SysLogController.batchRemoveAll()', null, '0:0:0:0:0:0:0:1', '2018-01-09 13:39:26', '1', '响应时间：5ms', '3');
INSERT INTO `sys_log` VALUES ('174', '1', 'admin', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-01-09 13:39:55', '1', '退出系统', '1');
INSERT INTO `sys_log` VALUES ('175', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"pf42e\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-09 14:30:57', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('176', '1', 'admin', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-01-09 14:31:49', '1', '退出系统', '1');
INSERT INTO `sys_log` VALUES ('177', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"e2cyf\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-09 14:55:27', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('178', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"2nc43\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-11 13:51:44', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('179', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"awn6a\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-11 14:47:25', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('180', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"bwc6g\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-11 15:09:39', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('181', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"4b82c\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-11 15:10:42', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('182', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"5adxw\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-15 10:42:51', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('183', '1', 'admin', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-01-15 11:05:52', '1', '退出系统', '1');
INSERT INTO `sys_log` VALUES ('184', '-1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"bxw7w\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-15 11:06:09', '0', '登录失败：验证码不正确', '1');
INSERT INTO `sys_log` VALUES ('185', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"8857e\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-15 11:06:12', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('186', '1', 'admin', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-01-15 11:17:57', '1', '退出系统', '1');
INSERT INTO `sys_log` VALUES ('187', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"m24wn\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-15 11:18:11', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('188', '2', 'ceshi', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-01-15 13:10:58', '1', '退出系统', '1');
INSERT INTO `sys_log` VALUES ('189', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"nm5cf\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-15 13:11:03', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('190', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"an2yy\",\"password\":\"123\",\"username\":\"admin\"}', '192.168.1.142', '2018-01-15 14:57:01', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('191', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"cbx6c\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-16 11:46:35', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('192', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"3acnd\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-16 12:43:10', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('193', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"77wc7\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-17 15:13:27', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('194', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"naaac\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-17 15:23:37', '1', '登录成功', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COMMENT='系统菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '基础管理', null, null, '0', 'fa fa-coffee', '0', '2017-12-20 14:22:08', null);
INSERT INTO `sys_menu` VALUES ('2', '0', '系统管理', null, null, '0', 'fa fa-desktop', '1', '2017-12-20 14:41:56', null);
INSERT INTO `sys_menu` VALUES ('3', '2', '用户管理', 'base/user/list.html', null, '1', 'fa fa-user', '0', '2017-12-20 14:47:55', null);
INSERT INTO `sys_menu` VALUES ('4', '2', '角色管理', 'base/role/list.html', null, '1', 'fa fa-paw', '1', '2017-12-20 14:48:31', null);
INSERT INTO `sys_menu` VALUES ('5', '2', '菜单管理', 'base/menu/list.html', null, '1', 'fa fa-th-list', '2', '2017-12-20 14:49:24', null);
INSERT INTO `sys_menu` VALUES ('6', '3', '新增', '/sys/user/save', 'sys:user:save', '2', null, '0', '2018-01-02 11:16:16', null);
INSERT INTO `sys_menu` VALUES ('7', '3', '编辑', '/sys/user/update', 'sys:user:edit', '2', null, '0', '2018-01-02 11:17:09', null);
INSERT INTO `sys_menu` VALUES ('8', '3', '删除', '/sys/user/remove', 'sys:user:remove', '2', null, '0', '2018-01-02 11:17:38', null);
INSERT INTO `sys_menu` VALUES ('9', '4', '新增', '/sys/role/save', 'sys:role:save', '2', null, '0', '2018-01-02 11:18:15', null);
INSERT INTO `sys_menu` VALUES ('10', '4', '编辑', '/sys/role/update', 'sys:role:edit', '2', null, '0', '2018-01-02 11:18:54', null);
INSERT INTO `sys_menu` VALUES ('11', '4', '删除', '/sys/role/remove', 'sys:role:remove', '2', null, '0', '2018-01-02 11:19:26', null);
INSERT INTO `sys_menu` VALUES ('12', '4', '分配权限', '/sys/role/authorize', 'sys:role:authorize', '2', null, '0', '2018-01-02 11:22:15', null);
INSERT INTO `sys_menu` VALUES ('13', '5', '新增', '/sys/menu/save', 'sys:menu:save', '2', null, '0', '2018-01-02 11:23:15', null);
INSERT INTO `sys_menu` VALUES ('14', '5', '编辑', '/sys/menu/update', 'sys:menu:edit', '2', null, '0', '2018-01-02 11:23:38', null);
INSERT INTO `sys_menu` VALUES ('15', '5', '删除', '/sys/menu/remove', 'sys:menu:remove', '2', null, '0', '2018-01-02 11:24:04', null);
INSERT INTO `sys_menu` VALUES ('16', '3', '启用', '/sys/user/enable', 'sys:user:enable', '2', null, '0', '2018-01-02 11:25:00', null);
INSERT INTO `sys_menu` VALUES ('17', '3', '禁用', '/sys/user/disable', 'sys:user:disable', '2', null, '0', '2018-01-02 11:25:40', null);
INSERT INTO `sys_menu` VALUES ('18', '3', '重置密码', '/sys/user/rest', 'sys:user:resetPassword', '2', null, '0', '2018-01-02 11:26:07', null);
INSERT INTO `sys_menu` VALUES ('19', '1', '系统日志', 'base/log/list.html', null, '1', 'fa fa-warning', '0', '2018-01-02 13:40:25', null);
INSERT INTO `sys_menu` VALUES ('20', '19', '删除', '/sys/log/remove', 'sys:log:remove', '2', null, '0', '2018-01-02 13:41:15', null);
INSERT INTO `sys_menu` VALUES ('21', '19', '清空', '/sys/log/clear', 'sys:log:clear', '2', null, '0', '2018-01-02 13:41:46', null);
INSERT INTO `sys_menu` VALUES ('22', '1', '敏捷开发', 'base/generator/list.html', null, '1', 'fa fa-archive', '1', '2018-01-15 10:44:45', null);
INSERT INTO `sys_menu` VALUES ('23', '22', '生成代码', '/sys/generator/code', 'sys:gen:code', '2', null, '0', '2018-01-15 10:46:27', null);
INSERT INTO `sys_menu` VALUES ('24', '3', '刷新', '/sys/user/list', 'sys:user:list', '2', null, '0', '2018-01-15 13:03:48', null);
INSERT INTO `sys_menu` VALUES ('25', '4', '刷新', '/sys/role/list', 'sys:role:list', '2', null, '0', '2018-01-15 13:03:51', null);
INSERT INTO `sys_menu` VALUES ('26', '5', '刷新', '/sys/menu/list', 'sys:menu:list', '2', null, '0', '2018-01-15 13:04:41', null);
INSERT INTO `sys_menu` VALUES ('27', '19', '刷新', '/sys/log/list', 'sys:log:list', '2', null, '0', '2018-01-15 13:06:54', null);
INSERT INTO `sys_menu` VALUES ('28', '22', '刷新', '/sys/generator/list', 'sys:gen:list', '2', null, '0', '2018-01-15 13:23:45', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='系统角色';

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COMMENT='角色菜单关系';

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
INSERT INTO `sys_role_menu` VALUES ('22', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('23', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('24', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('25', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('26', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('27', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('28', '1', '28');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='系统用户';

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='用户角色关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1');
