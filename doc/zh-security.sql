/*
Navicat MySQL Data Transfer

Source Server         : personnal
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : zh-security

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2018-02-09 16:44:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('quartzScheduler', 'LAPTOP-BDE3NRRF1517449287467', '1517449348733', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

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
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `doc_id` bigint(20) DEFAULT NULL COMMENT '对应文档id',
  `file_md` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件MD5值（做秒传）',
  `file_type` tinyint(255) DEFAULT NULL COMMENT '文件类型 1：图片，2：文档,3：视频，4：种子，5：音乐，6：其他，负数进入回收站',
  `file_show` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件展示名（原文件名）',
  `file_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件上传后名称',
  `file_path` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件上传路径',
  `file_size` bigint(200) DEFAULT NULL COMMENT '文件大小(单位B)',
  `file_size_format` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件大小页面展示',
  `file_ext` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件后缀名',
  `file_ip` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件上传服务器ip',
  `file_address` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件所在服务器磁盘位置',
  `upload_type` tinyint(255) DEFAULT NULL COMMENT '上传类型，1：普通上传，2：MD5匹配秒传',
  `remark` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `user_id_create` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='文件管理';

-- ----------------------------
-- Records of sys_file
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
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=latin1 COMMENT='系统日志';

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
INSERT INTO `sys_log` VALUES ('195', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"7ageb\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-22 09:11:30', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('196', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"fpyyg\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-22 11:05:41', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('197', '1', 'admin', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-01-22 11:24:33', '1', '退出系统', '1');
INSERT INTO `sys_log` VALUES ('198', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"33gc6\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-22 11:24:37', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('199', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"5fnyc\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-22 13:11:04', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('200', '1', 'admin', '清空定时任务日志', '2', 'net.zhenghao.zh.quartz.controller.QuartzJobLogController.batchRemoveAll()', null, '0:0:0:0:0:0:0:1', '2018-01-22 14:24:51', '0', '操作失败', '3');
INSERT INTO `sys_log` VALUES ('201', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"w7g28\",\"password\":\"123\",\"username\":\"admin\"}', '127.0.0.1', '2018-01-23 10:02:40', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('202', '1', 'admin', '登陆', '85', 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-23 10:16:31', null, null, null);
INSERT INTO `sys_log` VALUES ('203', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"pcam6\",\"password\":\"123\",\"username\":\"admin\"}', '192.168.1.122', '2018-01-23 16:18:59', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('204', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"y58p2\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-23 16:20:57', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('205', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"pnem2\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-23 16:22:34', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('206', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"pnaaa\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-23 16:51:42', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('207', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"myfbn\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-23 17:02:35', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('208', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"bn7yw\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-23 17:28:50', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('209', '-1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ndag4\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-24 08:43:13', '0', '登录失败：验证码不正确', '1');
INSERT INTO `sys_log` VALUES ('210', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ee2da\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-24 08:43:17', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('211', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"gn7d6\",\"password\":\"123\",\"username\":\"admin\"}', '192.168.1.131', '2018-01-24 08:46:28', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('212', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"fwnnn\",\"password\":\"123\",\"username\":\"admin\"}', '127.0.0.1', '2018-01-24 09:57:32', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('213', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"beee8\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 08:50:56', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('214', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"a4f3e\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 08:53:27', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('215', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"3pn36\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 08:54:28', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('216', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"55dxn\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 09:00:18', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('217', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"c2ymb\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 09:01:15', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('218', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"75y43\",\"password\":\"123\",\"username\":\"admin\"}', '192.168.1.137', '2018-01-25 09:02:36', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('219', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"6n7e5\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 09:05:11', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('220', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"mnne3\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 09:11:23', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('221', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"b87ad\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 09:24:19', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('222', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"3g6b8\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 09:33:24', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('223', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"e45g5\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 09:34:02', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('224', '-1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"7\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 09:36:55', '0', '登录失败：验证码不正确', '1');
INSERT INTO `sys_log` VALUES ('225', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"a6c4c\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 09:37:00', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('226', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"x3cyn\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 09:41:15', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('227', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"na4f4\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 09:54:30', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('228', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"pw77a\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-26 16:12:54', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('229', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"nyy3g\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-26 16:13:01', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('230', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"5p86x\",\"password\":\"123\",\"username\":\"admin\"}', '192.168.1.122', '2018-01-26 16:13:48', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('231', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"fcaan\",\"password\":\"123\",\"username\":\"admin\"}', '192.168.1.122', '2018-01-26 16:14:59', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('232', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"exa7c\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-29 16:44:56', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('233', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"3gb3n\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-31 14:26:07', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('234', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"2xb7e\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-31 16:09:45', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('235', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"xd7ax\",\"password\":\"123\",\"username\":\"admin\"}', '127.0.0.1', '2018-01-31 16:25:42', '1', '登录成功', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COMMENT='系统菜单';

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
INSERT INTO `sys_menu` VALUES ('29', '1', '定时任务', 'base/quartz/list.html', null, '1', 'fa fa-bell', '2', '2018-01-22 11:09:09', null);
INSERT INTO `sys_menu` VALUES ('30', '29', '刷新', '/quartz/job/list', 'quartz:job:list', '2', null, '0', '2018-01-22 11:09:59', null);
INSERT INTO `sys_menu` VALUES ('31', '29', '新增', '/quartz/job/save', 'quartz:job:save', '2', null, '0', '2018-01-22 11:10:33', null);
INSERT INTO `sys_menu` VALUES ('32', '29', '编辑', '/quartz/job/update', 'quartz:job:edit', '2', null, '0', '2018-01-22 11:11:08', null);
INSERT INTO `sys_menu` VALUES ('33', '29', '删除', '/quartz/job/remove', 'quartz:job:remove', '2', null, '0', '2018-01-22 11:12:23', null);
INSERT INTO `sys_menu` VALUES ('34', '29', '日志列表', null, 'quartz:job:log', '2', null, '0', '2018-01-22 11:13:38', null);
INSERT INTO `sys_menu` VALUES ('35', '29', '更多', null, 'quartz:job:more', '2', null, '0', '2018-01-22 11:14:04', null);
INSERT INTO `sys_menu` VALUES ('36', '35', '立即执行', '/quartz/job/run', 'quartz:job:run', '2', null, '0', '2018-01-22 11:16:09', null);
INSERT INTO `sys_menu` VALUES ('37', '35', '启用', '/quartz/job/enable', 'quartz:job:enable', '2', null, '0', '2018-01-22 11:16:53', null);
INSERT INTO `sys_menu` VALUES ('38', '35', '停用', '/quartz/job/disable', 'quartz:job:disable', '2', null, '0', '2018-01-22 11:17:19', null);
INSERT INTO `sys_menu` VALUES ('39', '34', '刷新', '/quartz/job/log/list', 'quartz:log:list', '2', null, '0', '2018-01-22 11:19:15', null);
INSERT INTO `sys_menu` VALUES ('40', '34', '删除', '/quartz/job/log/remove', 'quartz:log:remove', '2', null, '0', '2018-01-22 11:19:45', null);
INSERT INTO `sys_menu` VALUES ('41', '34', '清空', '/quartz/job/log/clear', 'quartz:log:clear', '2', null, '0', '2018-01-22 11:20:11', null);
INSERT INTO `sys_menu` VALUES ('42', '1', '系统监控', 'druid/index.html', null, '1', 'fa fa-bug', '3', '2018-01-22 11:21:26', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COMMENT='角色菜单关系';

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
INSERT INTO `sys_role_menu` VALUES ('29', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('30', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('31', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('32', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('33', '1', '33');
INSERT INTO `sys_role_menu` VALUES ('34', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('35', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('36', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('37', '1', '37');
INSERT INTO `sys_role_menu` VALUES ('38', '1', '38');
INSERT INTO `sys_role_menu` VALUES ('39', '1', '39');
INSERT INTO `sys_role_menu` VALUES ('40', '1', '40');
INSERT INTO `sys_role_menu` VALUES ('41', '1', '41');
INSERT INTO `sys_role_menu` VALUES ('42', '1', '42');

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
