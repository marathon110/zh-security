/*
Navicat MySQL Data Transfer

Source Server         : zhaozhenghao
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : test-security

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2018-06-06 15:59:56
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
INSERT INTO `qrtz_scheduler_state` VALUES ('quartzScheduler', 'DESKTOP-FR3S3ED1528271506703', '1528271732947', '15000');

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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1 COMMENT='定时任务日志';

-- ----------------------------
-- Records of quartz_job_log
-- ----------------------------
INSERT INTO `quartz_job_log` VALUES ('127', '4', 'tastTask', 'test', 'hah\"xixi\"a', '0', 'java.lang.NoSuchMethodException: net.zhenghao.zh.quartz.task.TestTask.test(java.lang.String)', '6', '2018-01-25 17:37:21');
INSERT INTO `quartz_job_log` VALUES ('128', '4', 'tastTask', 'test', 'hah\"xixi\"a', '0', 'java.lang.NoSuchMethodException: net.zhenghao.zh.quartz.task.TestTask.test(java.lang.String)', '1', '2018-01-25 17:37:24');
INSERT INTO `quartz_job_log` VALUES ('129', '4', 'tastTask', 'test', 'hah\"xixi\"a', '0', 'java.lang.NoSuchMethodException: net.zhenghao.zh.quartz.task.TestTask.test(java.lang.String)', '1', '2018-01-25 17:37:27');
INSERT INTO `quartz_job_log` VALUES ('130', '4', 'tastTask', 'test', 'hah\"xixi\"a', '0', 'java.lang.NoSuchMethodException: net.zhenghao.zh.quartz.task.TestTask.test(java.lang.String)', '1', '2018-01-25 17:37:30');
INSERT INTO `quartz_job_log` VALUES ('131', '4', 'tastTask', 'test', 'hah\"xixi\"a', '0', 'java.lang.NoSuchMethodException: net.zhenghao.zh.quartz.task.TestTask.test(java.lang.String)', '1', '2018-01-25 17:37:33');
INSERT INTO `quartz_job_log` VALUES ('132', '4', 'tastTask', 'test', 'hah\"xixi\"a', '0', 'java.lang.NoSuchMethodException: net.zhenghao.zh.quartz.task.TestTask.test(java.lang.String)', '1', '2018-01-25 17:37:36');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COMMENT='文件管理';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('1', null, '6f481eaeed98c56c40f0d4292b944719', '3', '1.mp4', '6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', '\\upload\\1\\2018-02-09\\6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', '260457390', '248.4MB', 'mp4', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', null, null, '1', null, null);
INSERT INTO `sys_file` VALUES ('2', null, '6f481eaeed98c56c40f0d4292b944719', '3', '1.mp4', '6f481eaeed98c56c40f0d4292b9447191518163446048.mp4', '\\upload\\1\\2018-02-09\\6f481eaeed98c56c40f0d4292b9447191518163446048.mp4', '260457390', '248.4MB', 'mp4', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\6f481eaeed98c56c40f0d4292b9447191518163446048.mp4', null, null, '1', null, null);
INSERT INTO `sys_file` VALUES ('3', null, '6f481eaeed98c56c40f0d4292b944719', '3', '1.mp4', '6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', '\\upload\\1\\2018-02-09\\6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', '260457390', '248.4MB', 'mp4', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', '2', null, '1', '2018-02-09 16:28:50', null);
INSERT INTO `sys_file` VALUES ('5', null, 'b58e4e8045ca7a50993a09b96dc82c28', '3', '2.mp4', 'b58e4e8045ca7a50993a09b96dc82c281518165181139.mp4', '\\upload\\1\\2018-02-09\\b58e4e8045ca7a50993a09b96dc82c281518165181139.mp4', '212357474', '202.5MB', 'mp4', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\b58e4e8045ca7a50993a09b96dc82c281518165181139.mp4', '1', null, '1', '2018-02-09 16:33:05', null);
INSERT INTO `sys_file` VALUES ('6', null, 'b58e4e8045ca7a50993a09b96dc82c28', '3', '2.mp4', 'b58e4e8045ca7a50993a09b96dc82c281518165181139.mp4', '\\upload\\1\\2018-02-09\\b58e4e8045ca7a50993a09b96dc82c281518165181139.mp4', '212357474', '202.5MB', 'mp4', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\b58e4e8045ca7a50993a09b96dc82c281518165181139.mp4', '2', null, '1', '2018-02-09 16:33:37', null);
INSERT INTO `sys_file` VALUES ('7', null, '6f481eaeed98c56c40f0d4292b944719', '3', '1.mp4', '6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', '\\upload\\1\\2018-02-09\\6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', '260457390', '248.4MB', 'mp4', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', '2', null, '1', '2018-02-09 16:34:44', null);
INSERT INTO `sys_file` VALUES ('8', null, 'b58e4e8045ca7a50993a09b96dc82c28', '3', '2.mp4', 'b58e4e8045ca7a50993a09b96dc82c281518165181139.mp4', '\\upload\\1\\2018-02-09\\b58e4e8045ca7a50993a09b96dc82c281518165181139.mp4', '212357474', '202.5MB', 'mp4', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\b58e4e8045ca7a50993a09b96dc82c281518165181139.mp4', '2', null, '1', '2018-02-09 16:34:44', null);
INSERT INTO `sys_file` VALUES ('9', null, '98352a9a2e38b23622cddd697dd5d492', '6', 'CentOS 64 位-s002.vmdk', '98352a9a2e38b23622cddd697dd5d4921518165310249.vmdk', '\\upload\\1\\2018-02-09\\98352a9a2e38b23622cddd697dd5d4921518165310249.vmdk', '723451904', '689.9MB', 'vmdk', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\98352a9a2e38b23622cddd697dd5d4921518165310249.vmdk', '1', null, '1', '2018-02-09 16:35:39', null);
INSERT INTO `sys_file` VALUES ('10', null, '98352a9a2e38b23622cddd697dd5d492', '6', 'CentOS 64 位-s002.vmdk', '98352a9a2e38b23622cddd697dd5d4921518165310249.vmdk', '\\upload\\1\\2018-02-09\\98352a9a2e38b23622cddd697dd5d4921518165310249.vmdk', '723451904', '689.9MB', 'vmdk', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\98352a9a2e38b23622cddd697dd5d4921518165310249.vmdk', '2', null, '1', '2018-02-09 16:36:38', null);
INSERT INTO `sys_file` VALUES ('11', null, '6f481eaeed98c56c40f0d4292b944719', '3', '1.mp4', '6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', '\\upload\\1\\2018-02-09\\6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', '260457390', '248.4MB', 'mp4', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', '2', null, '1', '2018-02-09 16:37:58', null);
INSERT INTO `sys_file` VALUES ('12', null, 'f6cddbd98031a2ed72c38ea62d82de8a', '1', 'maozai.jpg', 'f6cddbd98031a2ed72c38ea62d82de8a1518165489091.jpg', '\\upload\\1\\2018-02-09\\f6cddbd98031a2ed72c38ea62d82de8a1518165489091.jpg', '22494', '22.0KB', 'jpg', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\f6cddbd98031a2ed72c38ea62d82de8a1518165489091.jpg', '1', null, '1', '2018-02-09 16:38:09', null);
INSERT INTO `sys_file` VALUES ('13', null, 'f6cddbd98031a2ed72c38ea62d82de8a', '1', 'maozai.jpg', 'f6cddbd98031a2ed72c38ea62d82de8a1518165489091.jpg', '\\upload\\1\\2018-02-09\\f6cddbd98031a2ed72c38ea62d82de8a1518165489091.jpg', '22494', '22.0KB', 'jpg', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\f6cddbd98031a2ed72c38ea62d82de8a1518165489091.jpg', '2', null, '1', '2018-02-09 16:38:51', null);
INSERT INTO `sys_file` VALUES ('14', null, '01d69be895e937daeeaeec4ce7257164', '3', '20171113_140404.mp4', '01d69be895e937daeeaeec4ce72571641518165594334.mp4', '\\upload\\1\\2018-02-09\\01d69be895e937daeeaeec4ce72571641518165594334.mp4', '23073819', '22.0MB', 'mp4', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\01d69be895e937daeeaeec4ce72571641518165594334.mp4', '1', null, '1', '2018-02-09 16:39:54', null);
INSERT INTO `sys_file` VALUES ('15', null, '01d69be895e937daeeaeec4ce7257164', '3', '20171113_140404.mp4', '01d69be895e937daeeaeec4ce72571641518165594334.mp4', '\\upload\\1\\2018-02-09\\01d69be895e937daeeaeec4ce72571641518165594334.mp4', '23073819', '22.0MB', 'mp4', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\01d69be895e937daeeaeec4ce72571641518165594334.mp4', '2', null, '1', '2018-02-09 16:40:06', null);
INSERT INTO `sys_file` VALUES ('16', null, '01d69be895e937daeeaeec4ce7257164', '3', '20171113_140404.mp4', '01d69be895e937daeeaeec4ce72571641518165594334.mp4', '\\upload\\1\\2018-02-09\\01d69be895e937daeeaeec4ce72571641518165594334.mp4', '23073819', '22.0MB', 'mp4', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\01d69be895e937daeeaeec4ce72571641518165594334.mp4', '2', null, '1', '2018-02-09 16:42:04', null);
INSERT INTO `sys_file` VALUES ('17', null, '30dc760a096752a30c24944a127f7fd0', '1', '0HHS%L7N}0B1LYRC)PM5ZPS.png', '30dc760a096752a30c24944a127f7fd01518165734267.png', '\\upload\\1\\2018-02-09\\30dc760a096752a30c24944a127f7fd01518165734267.png', '19549', '19.1KB', 'png', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\30dc760a096752a30c24944a127f7fd01518165734267.png', '1', null, '1', '2018-02-09 16:42:14', null);
INSERT INTO `sys_file` VALUES ('18', null, 'e9b902175bb68657e9503c697e2106e1', '2', '深信服VPN用户操作手册.docx', 'e9b902175bb68657e9503c697e2106e11518165757212.docx', '\\upload\\1\\2018-02-09\\e9b902175bb68657e9503c697e2106e11518165757212.docx', '958901', '936.4KB', 'docx', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\e9b902175bb68657e9503c697e2106e11518165757212.docx', '1', null, '1', '2018-02-09 16:42:37', null);
INSERT INTO `sys_file` VALUES ('19', null, 'e9b902175bb68657e9503c697e2106e1', '2', '深信服VPN用户操作手册.docx', 'e9b902175bb68657e9503c697e2106e11518165757212.docx', '\\upload\\1\\2018-02-09\\e9b902175bb68657e9503c697e2106e11518165757212.docx', '958901', '936.4KB', 'docx', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\e9b902175bb68657e9503c697e2106e11518165757212.docx', '2', null, '1', '2018-02-09 16:42:52', null);
INSERT INTO `sys_file` VALUES ('20', null, '6f481eaeed98c56c40f0d4292b944719', '3', '党建.mp4', '6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', '\\upload\\1\\2018-02-09\\6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', '260457390', '248.4MB', 'mp4', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-02-09\\6f481eaeed98c56c40f0d4292b9447191518161844192.mp4', '2', null, '1', '2018-03-01 15:58:58', '2018-03-28 16:13:16');
INSERT INTO `sys_file` VALUES ('21', null, '80652491ddadd6bb10110c44e78dfbdf', '3', '新垣结衣.mp4', '80652491ddadd6bb10110c44e78dfbdf1519978137196.mp4', '\\upload\\1\\2018-03-02\\80652491ddadd6bb10110c44e78dfbdf1519978137196.mp4', '6502939', '6.2MB', 'mp4', '192.168.30.1', 'E:/zh_work/upload\\1\\2018-03-02\\80652491ddadd6bb10110c44e78dfbdf1519978137196.mp4', '1', null, '1', '2018-03-02 16:08:57', null);

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
  `type` tinyint(255) DEFAULT NULL COMMENT '日志类型 1-登录 2-访问 3-操作 4-异常 5-授权 6-微信',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=516 DEFAULT CHARSET=latin1 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('234', '1', 'admin', '清空日志', '3', 'net.zhenghao.zh.common.controller.SysLogController.batchRemoveAll()', null, '0:0:0:0:0:0:0:1', '2018-01-22 15:09:15', '1', '响应时间：3ms', '3');
INSERT INTO `sys_log` VALUES ('235', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"2bcwm\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 17:34:47', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('236', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"w8nxy\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-01-25 17:35:12', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('237', '1', 'admin', '新增定时任务', null, 'net.zhenghao.zh.quartz.controller.QuartzJobController.save()', '{\"beanName\":\"asd\",\"cronExpression\":\"sad\",\"jobId\":3,\"methodName\":\"\\\"cd\\\"sa\\\"\",\"params\":\"das\",\"remark\":\"sad\",\"status\":1}', '0:0:0:0:0:0:0:1', '2018-01-25 17:35:49', '0', '异常信息：CronExpression \'sad\' is invalid.', '4');
INSERT INTO `sys_log` VALUES ('238', '1', 'admin', '新增定时任务', '26', 'net.zhenghao.zh.quartz.controller.QuartzJobController.save()', '{\"beanName\":\"tastTask\",\"cronExpression\":\"0/3 * * * * ?\",\"jobId\":4,\"methodName\":\"test\",\"params\":\"hah\\\"xixi\\\"a\",\"remark\":\"哈\\\"哈\\\"哈\",\"status\":1}', '0:0:0:0:0:0:0:1', '2018-01-25 17:37:21', '1', '响应时间：26ms', '3');
INSERT INTO `sys_log` VALUES ('239', '1', 'admin', '删除定时任务', '14', 'net.zhenghao.zh.quartz.controller.QuartzJobController.remove()', '[4]', '0:0:0:0:0:0:0:1', '2018-01-25 17:37:36', '1', '响应时间：14ms', '3');
INSERT INTO `sys_log` VALUES ('240', '1', 'admin', '新增用户', '9', 'net.zhenghao.zh.shiro.controller.SysUserController.save()', '{\"mobile\":\"\",\"password\":\"abeccef605f446a63decabbb9e20c8aa\",\"roleIdList\":[1],\"status\":1,\"userId\":2,\"userIdCreate\":1,\"username\":\"哈哈\\\"xi\\\"\"}', '0:0:0:0:0:0:0:1', '2018-01-25 17:38:08', '1', '响应时间：9ms', '3');
INSERT INTO `sys_log` VALUES ('241', '1', 'admin', '删除用户', '4', 'net.zhenghao.zh.shiro.controller.SysUserController.batchRemove()', '[2]', '0:0:0:0:0:0:0:1', '2018-01-25 17:38:16', '1', '响应时间：4ms', '3');
INSERT INTO `sys_log` VALUES ('242', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"xbnbg\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-01 09:44:11', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('243', '1', 'admin', '新增菜单', '6', 'net.zhenghao.zh.shiro.controller.SysMenuController.save()', '{\"icon\":\"fa fa-file\",\"name\":\"文件管理\",\"orderNum\":4,\"parentId\":1,\"parentName\":\"基础管理\",\"type\":1,\"url\":\"base/file/list.html\"}', '0:0:0:0:0:0:0:1', '2018-02-01 10:05:08', '1', '响应时间：6ms', '3');
INSERT INTO `sys_log` VALUES ('244', '1', 'admin', '新增菜单', '6', 'net.zhenghao.zh.shiro.controller.SysMenuController.save()', '{\"name\":\"刷新\",\"orderNum\":0,\"parentId\":43,\"parentName\":\"文件管理\",\"perms\":\"sys:file:list\",\"type\":2,\"url\":\"/sys/file/list\"}', '0:0:0:0:0:0:0:1', '2018-02-01 10:19:20', '1', '响应时间：6ms', '3');
INSERT INTO `sys_log` VALUES ('245', '1', 'admin', '新增菜单', '5', 'net.zhenghao.zh.shiro.controller.SysMenuController.save()', '{\"name\":\"新增\",\"orderNum\":0,\"parentId\":43,\"parentName\":\"文件管理\",\"perms\":\"sys:file:save\",\"type\":2,\"url\":\"/sys/file/save\"}', '0:0:0:0:0:0:0:1', '2018-02-01 10:20:16', '1', '响应时间：5ms', '3');
INSERT INTO `sys_log` VALUES ('246', '1', 'admin', '新增菜单', '4', 'net.zhenghao.zh.shiro.controller.SysMenuController.save()', '{\"name\":\"编辑\",\"orderNum\":0,\"parentId\":43,\"parentName\":\"文件管理\",\"perms\":\"sys:file:edit\",\"type\":2,\"url\":\"sys/file/edit\"}', '0:0:0:0:0:0:0:1', '2018-02-01 10:20:54', '1', '响应时间：4ms', '3');
INSERT INTO `sys_log` VALUES ('247', '1', 'admin', '新增菜单', '5', 'net.zhenghao.zh.shiro.controller.SysMenuController.save()', '{\"name\":\"删除\",\"orderNum\":0,\"parentId\":43,\"parentName\":\"文件管理\",\"perms\":\"sys:file:remove\",\"type\":2,\"url\":\"sys/file/remove\"}', '0:0:0:0:0:0:0:1', '2018-02-01 10:21:42', '1', '响应时间：5ms', '3');
INSERT INTO `sys_log` VALUES ('248', '1', 'admin', '分配权限', '16', 'net.zhenghao.zh.shiro.controller.SysRoleController.updateRoleAuthorization()', '{\"menuIdList\":[1,19,20,21,27,22,23,28,29,30,31,32,33,34,39,40,41,35,36,37,38,42,43,44,45,46,47,2,3,6,7,8,16,17,18,24,4,9,10,11,12,25,5,13,14,15,26],\"remark\":\"【系统内置】\",\"roleId\":1,\"roleName\":\"超级管理员\",\"roleSign\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-01 10:22:07', '1', '响应时间：16ms', '5');
INSERT INTO `sys_log` VALUES ('249', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"w5dye\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-01 14:06:48', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('250', '-1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"a6bn\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-02 09:20:36', '0', '登录失败：验证码不正确', '1');
INSERT INTO `sys_log` VALUES ('251', '-1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"a6bnc\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-02 09:20:37', '0', '登录失败：验证码不正确', '1');
INSERT INTO `sys_log` VALUES ('252', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"g27by\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-02 09:20:42', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('253', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"by78a\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-05 09:33:47', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('254', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ecn6w\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-05 09:39:23', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('255', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"7bn2p\",\"password\":\"123\",\"username\":\"admin\"}', '192.168.1.128', '2018-02-05 11:05:57', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('256', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"n37wa\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-05 14:08:42', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('257', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"5cyf8\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-05 15:48:05', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('258', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"5mgna\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-06 09:09:39', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('259', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"66a36\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-06 09:11:18', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('260', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"n6w68\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-07 14:43:55', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('261', '1', 'admin', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-02-07 14:48:25', '1', '退出系统', '1');
INSERT INTO `sys_log` VALUES ('262', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"cxf6y\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-07 14:49:10', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('263', '1', 'admin', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-02-07 14:50:43', '1', '退出系统', '1');
INSERT INTO `sys_log` VALUES ('264', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"xwm56\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-07 14:50:47', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('265', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"3m66n\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-07 15:31:20', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('266', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ngem8\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-07 16:58:03', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('267', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"8mp33\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-08 10:34:07', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('268', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"mne4c\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-08 10:41:53', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('269', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"fng6n\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-08 11:00:47', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('270', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"aye2y\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-08 11:04:57', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('271', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"33g28\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-08 13:35:30', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('272', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"a83an\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-08 13:46:47', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('273', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"7f6xw\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-08 16:04:12', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('274', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"mmc3b\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-08 16:22:44', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('275', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"e3cpc\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-02-09 15:36:57', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('276', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"f3cny\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-01 15:04:24', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('277', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"nmnp6\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-02 10:56:14', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('278', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"n7pma\",\"password\":\"123\",\"username\":\"admin\"}', '192.168.1.5', '2018-03-02 11:02:36', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('279', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"c4bb5\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-02 13:33:00', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('280', '-1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"54nm\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-02 14:07:56', '0', '登录失败：验证码不正确', '1');
INSERT INTO `sys_log` VALUES ('281', '-1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"54nm4\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-02 14:07:57', '0', '登录失败：验证码不正确', '1');
INSERT INTO `sys_log` VALUES ('282', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"e2g83\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-02 14:08:02', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('283', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"bgmny\",\"password\":\"123\",\"username\":\"admin\"}', '127.0.0.1', '2018-03-05 10:47:59', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('284', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"74mfa\",\"password\":\"123\",\"username\":\"admin\"}', '127.0.0.1', '2018-03-05 10:51:06', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('285', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"fncyn\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-08 15:55:53', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('286', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"p8dan\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-08 15:56:39', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('287', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"gaeag\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-08 16:05:52', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('288', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"6me6m\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-08 16:40:12', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('289', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"yn3gg\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-08 17:04:44', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('290', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"myamd\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-09 09:14:25', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('291', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"wycpn\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-09 10:10:42', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('292', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"wgnfn\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-22 15:31:52', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('293', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"7yc6d\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-28 13:40:54', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('294', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"xyxa6\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-28 15:26:22', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('295', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"pfmn6\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-28 15:55:37', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('296', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"d5f6y\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-28 16:02:08', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('297', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"6cx6p\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-28 16:06:08', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('298', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"58my3\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-28 16:12:17', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('299', '1', 'admin', '修改文件管理', '12', 'net.zhenghao.zh.file.controller.SysFileController.update()', '{\"fileAddress\":\"E:/zh_work/upload\\\\1\\\\2018-02-09\\\\6f481eaeed98c56c40f0d4292b9447191518161844192.mp4\",\"fileExt\":\"mp4\",\"fileId\":20,\"fileIp\":\"192.168.30.1\",\"fileMd\":\"6f481eaeed98c56c40f0d4292b944719\",\"fileName\":\"6f481eaeed98c56c40f0d4292b9447191518161844192.mp4\",\"filePath\":\"\\\\upload\\\\1\\\\2018-02-09\\\\6f481eaeed98c56c40f0d4292b9447191518161844192.mp4\",\"fileShow\":\"党建.mp4\",\"fileSize\":260457390,\"fileSizeFormat\":\"248.4MB\",\"fileType\":3,\"gmtCreate\":1519891138000,\"uploadType\":2,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-03-28 16:13:16', '1', '响应时间：12ms', '3');
INSERT INTO `sys_log` VALUES ('300', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"2x6m6\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-28 16:20:11', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('301', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"e7n73\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-28 16:27:29', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('302', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"22xan\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-28 16:45:20', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('303', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"pycfm\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-03-29 14:15:05', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('304', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"5wan6\",\"password\":\"123\",\"username\":\"admin\"}', '192.168.5.74', '2018-03-29 14:55:59', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('305', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"2b32n\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-02 14:33:35', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('306', '1', 'admin', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-04-02 15:18:27', '1', '退出系统', '1');
INSERT INTO `sys_log` VALUES ('307', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"bbdxm\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-02 16:28:39', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('308', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"6pneb\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-03 10:46:09', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('309', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"n3faf\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-03 11:02:28', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('310', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"3mnmd\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-03 15:33:38', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('311', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"xp4mw\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-03 16:17:24', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('312', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"bdwnw\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-03 17:33:26', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('313', '1', 'admin', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-04-03 17:36:15', '1', '退出系统', '1');
INSERT INTO `sys_log` VALUES ('314', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"wy7p4\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-03 17:36:21', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('315', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"md72b\",\"password\":\"123\",\"username\":\"admin\"}', '192.168.5.112', '2018-04-03 17:54:01', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('316', '1', 'admin', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-04-03 17:57:35', '1', '退出系统', '1');
INSERT INTO `sys_log` VALUES ('317', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"6e5nd\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-03 18:04:57', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('318', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"2p3bf\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-08 10:23:50', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('319', '1', 'admin', '修改菜单', '34', 'net.zhenghao.zh.shiro.controller.SysMenuController.update()', '{\"icon\":\"fa fa-wrench\",\"menuId\":48,\"name\":\"开发者工具\",\"orderNum\":0,\"parentId\":0,\"type\":0}', '0:0:0:0:0:0:0:1', '2018-04-08 10:34:08', '1', '响应时间：34ms', '3');
INSERT INTO `sys_log` VALUES ('320', '1', 'admin', '修改菜单', '8', 'net.zhenghao.zh.shiro.controller.SysMenuController.update()', '{\"icon\":\"fa fa-rocket\",\"menuId\":49,\"name\":\"接口测试\",\"orderNum\":0,\"parentId\":48,\"parentName\":\"开发者工具\",\"type\":1,\"url\":\"base/api/list.html\"}', '0:0:0:0:0:0:0:1', '2018-04-08 10:36:00', '1', '响应时间：8ms', '3');
INSERT INTO `sys_log` VALUES ('321', '1', 'admin', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-04-08 10:36:06', '1', '退出系统', '1');
INSERT INTO `sys_log` VALUES ('322', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"nfen8\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-08 10:36:10', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('323', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"a2eg5\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-08 13:47:08', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('324', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"b3f62\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-08 14:01:23', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('325', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"p48ba\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-08 14:18:30', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('326', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"m23xa\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-08 14:51:35', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('327', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"472fy\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-08 17:47:02', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('328', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"4gy5a\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-08 18:08:14', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('329', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"dw82b\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 09:36:20', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('330', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"2e7d3\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 09:45:00', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('331', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"gw2d8\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 09:48:44', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('332', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"n6x78\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 09:50:05', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('333', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"745p3\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 09:54:09', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('334', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"3gef3\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 09:57:17', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('335', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"f85wg\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 10:08:29', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('336', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"8ay43\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 10:17:00', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('337', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"gnwn8\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 10:18:38', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('338', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"pgbnp\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 11:14:16', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('339', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ew8nn\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 11:15:53', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('340', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"cdxbc\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 11:19:00', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('341', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"6dywb\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 11:26:06', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('342', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"6pcgc\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 11:28:01', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('343', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"e8x5d\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 13:34:16', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('344', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"y5dxe\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 13:58:19', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('345', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ywpw2\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 14:00:36', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('346', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"4e37e\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 14:36:04', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('347', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"g5457\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-09 14:39:42', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('348', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"dm3ny\",\"password\":\"123\",\"username\":\"admin\"}', '192.168.5.9', '2018-04-09 15:21:58', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('349', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"5385m\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 13:57:00', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('350', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"da3fd\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 14:39:56', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('351', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"6cc3f\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 14:41:12', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('352', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"fg8a2\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 15:21:26', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('353', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"m73yx\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 15:24:25', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('354', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"p3ne3\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 15:46:55', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('355', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"wxc43\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 15:49:07', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('356', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"6np83\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 15:52:18', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('357', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"wg235\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 15:57:13', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('358', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"p62b2\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 16:17:00', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('359', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"xy3n2\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 16:22:05', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('360', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"3nn4g\",\"password\":\"123\",\"username\":\"admin\"}', '192.168.5.9', '2018-04-10 16:24:34', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('361', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"np8an\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 17:54:38', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('362', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"bfxpf\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 17:55:50', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('363', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"y3pmc\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 17:56:08', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('364', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"gwwp7\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 17:58:32', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('365', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"f8npm\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 18:04:14', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('366', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"n4be4\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 18:06:41', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('367', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"fpw74\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 18:09:18', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('368', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"2adan\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 18:16:08', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('369', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"f3fby\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-10 18:19:37', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('370', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"3nwba\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 09:29:19', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('371', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"pbwdy\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 15:18:00', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('372', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"4x2fe\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 15:19:35', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('373', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"3a8pc\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 15:26:50', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('374', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"42e8d\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 15:30:54', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('375', '-1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"e2g\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 15:42:42', '0', '登录失败：验证码不正确', '1');
INSERT INTO `sys_log` VALUES ('376', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"nedcc\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 15:42:46', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('377', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"6cnx2\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 15:43:35', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('378', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"gdamn\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 15:53:23', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('379', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ax2d3\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 15:56:41', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('380', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"gebpx\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 16:02:46', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('381', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"5nnxb\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 16:05:24', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('382', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"4p652\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 16:16:21', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('383', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"pef3g\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 16:20:16', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('384', '1', 'admin', '退出登陆', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.logout()', null, '0:0:0:0:0:0:0:1', '2018-04-11 16:20:20', '1', '退出系统', '1');
INSERT INTO `sys_log` VALUES ('385', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ncwyf\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 16:21:50', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('386', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"gc86y\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 16:21:59', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('387', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"7fbgw\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 17:33:05', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('388', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"cnbga\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 17:57:14', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('389', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"2ydg6\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-11 18:00:58', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('390', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"eb6mw\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-12 09:28:09', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('391', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"mg6x4\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-12 09:37:46', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('392', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"f84a3\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-12 09:44:41', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('393', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"64f4b\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-12 09:49:57', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('394', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"n86y5\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-12 10:35:59', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('395', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"cfde5\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-12 13:32:01', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('396', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"4pwbn\",\"password\":\"123\",\"username\":\"admin\"}', '192.168.5.9', '2018-04-12 13:33:58', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('397', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"6wbx6\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-12 13:53:47', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('398', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"772xf\",\"password\":\"123\",\"username\":\"admin\"}', '192.168.5.9', '2018-04-12 13:55:54', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('399', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ned4n\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-13 16:31:01', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('400', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"nwg3b\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-13 16:32:14', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('401', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"46x33\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-13 17:11:47', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('402', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"bf8wa\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-13 17:42:17', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('403', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"pga3w\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-16 09:42:35', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('404', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"xc765\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-16 09:44:08', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('405', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"685p3\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-16 09:45:06', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('406', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"begnf\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-16 10:05:50', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('407', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"gpd5c\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-16 11:03:41', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('408', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"7pxna\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-16 11:15:11', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('409', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"cmwpy\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-16 13:14:46', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('410', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"4md7d\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-16 13:38:01', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('411', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"meg4n\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-16 15:40:04', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('412', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"8enna\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-16 15:44:51', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('413', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"e27gx\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-16 15:46:43', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('414', '1', 'admin', '新增或更新微信基本配置', null, 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\"}', '0:0:0:0:0:0:0:1', '2018-04-16 16:04:11', '0', '异常信息：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'nusll\' in \'class net.zhenghao.zh.wechat.entity.WechatConfigEntity\'', '4');
INSERT INTO `sys_log` VALUES ('415', '1', 'admin', '新增或更新微信基本配置', null, 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:14:11', '0', '异常信息：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'nusll\' in \'class net.zhenghao.zh.wechat.entity.WechatConfigEntity\'', '4');
INSERT INTO `sys_log` VALUES ('416', '1', 'admin', '新增或更新微信基本配置', '36', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:23:06', '1', '响应时间：36ms', '3');
INSERT INTO `sys_log` VALUES ('417', '1', 'admin', '新增或更新微信基本配置', '37', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:28:11', '1', '响应时间：37ms', '3');
INSERT INTO `sys_log` VALUES ('418', '1', 'admin', '新增或更新微信基本配置', '53', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:30:13', '1', '响应时间：53ms', '3');
INSERT INTO `sys_log` VALUES ('419', '1', 'admin', '新增或更新微信基本配置', '6', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736eaha\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523867413000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:31:33', '1', '响应时间：6ms', '3');
INSERT INTO `sys_log` VALUES ('420', '1', 'admin', '新增或更新微信基本配置', '5', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523867493000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:34:27', '1', '响应时间：5ms', '3');
INSERT INTO `sys_log` VALUES ('421', '1', 'admin', '新增或更新微信基本配置', '5', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523867667000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:37:27', '1', '响应时间：5ms', '3');
INSERT INTO `sys_log` VALUES ('422', '1', 'admin', '新增或更新微信基本配置', '5', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523867847000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:38:06', '1', '响应时间：5ms', '3');
INSERT INTO `sys_log` VALUES ('423', '1', 'admin', '新增或更新微信基本配置', '6', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea1\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523867886000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:43:01', '1', '响应时间：6ms', '3');
INSERT INTO `sys_log` VALUES ('424', '1', 'admin', '新增或更新微信基本配置', '5', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523868181000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:43:32', '1', '响应时间：5ms', '3');
INSERT INTO `sys_log` VALUES ('425', '1', 'admin', '新增或更新微信基本配置', '34', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea1\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523868212000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:45:25', '1', '响应时间：34ms', '3');
INSERT INTO `sys_log` VALUES ('426', '1', 'admin', '新增或更新微信基本配置', '5', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea1\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a02\",\"gmtCreate\":1523866986000,\"gmtModified\":1523868325000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:45:30', '1', '响应时间：5ms', '3');
INSERT INTO `sys_log` VALUES ('427', '1', 'admin', '新增或更新微信基本配置', '4', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523868330000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:45:36', '1', '响应时间：4ms', '3');
INSERT INTO `sys_log` VALUES ('428', '1', 'admin', '新增或更新微信基本配置', '4', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523868336000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:49:03', '1', '响应时间：4ms', '3');
INSERT INTO `sys_log` VALUES ('429', '1', 'admin', '新增或更新微信基本配置', '5', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523868543000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:51:06', '1', '响应时间：5ms', '3');
INSERT INTO `sys_log` VALUES ('430', '1', 'admin', '新增或更新微信基本配置', '4', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"\",\"gmtCreate\":1523866986000,\"gmtModified\":1523868666000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:51:36', '1', '响应时间：4ms', '3');
INSERT INTO `sys_log` VALUES ('431', '1', 'admin', '新增或更新微信基本配置', '5', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523868696000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:51:57', '1', '响应时间：5ms', '3');
INSERT INTO `sys_log` VALUES ('432', '1', 'admin', '新增或更新微信基本配置', '7', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523868717000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:54:40', '1', '响应时间：7ms', '3');
INSERT INTO `sys_log` VALUES ('433', '1', 'admin', '新增或更新微信基本配置', '5', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523868880000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 16:58:26', '1', '响应时间：5ms', '3');
INSERT INTO `sys_log` VALUES ('434', '1', 'admin', '新增或更新微信基本配置', '5', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523869106000,\"id\":1,\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-16 17:00:04', '1', '响应时间：5ms', '3');
INSERT INTO `sys_log` VALUES ('435', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"cdy36\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 09:44:39', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('436', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"e863w\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 11:04:59', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('437', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"5233b\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 11:09:14', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('438', '1', 'admin', '新增或更新微信基本配置', null, 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523869204000,\"id\":1,\"token\":\"zzh\",\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-17 11:12:03', '0', '异常信息：nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'encoding_aes_key\' in \'class net.zhenghao.zh.wechat.entity.WechatConfigEntity\'', '4');
INSERT INTO `sys_log` VALUES ('439', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ymxc5\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 11:15:16', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('440', '1', 'admin', '新增或更新微信基本配置', '34', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523869204000,\"id\":1,\"token\":\"zzh\",\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-04-17 11:15:25', '1', '响应时间：34ms', '3');
INSERT INTO `sys_log` VALUES ('441', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ffxnw\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 13:55:53', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('442', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"mn42m\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 15:31:43', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('443', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"xynm8\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 15:33:38', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('444', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"pnpyw\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 15:34:37', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('445', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"c4pww\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 15:37:55', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('446', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ynxyc\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 15:39:23', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('447', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"xdymf\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 15:42:32', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('448', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"pnym5\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 15:44:30', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('449', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"bmxx6\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 16:28:58', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('450', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"5ednw\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 16:31:07', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('451', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"nnxfx\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 16:32:59', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('452', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ab6e3\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 16:45:24', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('453', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"7mn7p\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-17 16:47:24', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('454', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"yfd5x\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-18 10:44:39', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('455', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"yggba\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-18 13:35:08', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('456', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"dw4ca\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-18 16:37:56', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('457', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"yx4pf\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-18 16:46:27', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('458', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"778g4\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-18 16:47:41', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('459', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"7fn5x\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-18 17:16:07', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('460', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"5wfe2\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-18 17:22:59', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('461', '1', 'admin', '新增菜单', '8', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":1,\"key\":\"\",\"name\":\"扫码\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":0,\"type\":\"\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-18 17:23:15', '1', '响应时间：8ms', '3');
INSERT INTO `sys_log` VALUES ('462', '1', 'admin', '新增菜单', '5', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":2,\"key\":\"scancode_waitmsg\",\"name\":\"扫码带提示\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":1,\"parentName\":\"扫码\",\"type\":\"scancode_waitmsg\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-18 17:23:51', '1', '响应时间：5ms', '3');
INSERT INTO `sys_log` VALUES ('463', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"wmabg\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-18 17:36:30', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('464', '1', 'admin', '新增菜单', '7', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":2,\"key\":\"scancode_push\",\"name\":\"扫码推事件\",\"orderNum\":1,\"pagepath\":\"\",\"parentId\":1,\"parentName\":\"扫码\",\"type\":\"scancode_push\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-18 17:42:13', '1', '响应时间：7ms', '3');
INSERT INTO `sys_log` VALUES ('465', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"5x356\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-19 10:07:11', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('466', '1', 'admin', '修改菜单', '47', 'net.zhenghao.zh.wechat.controller.WechatMenuController.update()', '{\"appid\":\"1\",\"buttonType\":2,\"id\":3,\"key\":\"scancode_push1\",\"name\":\"扫码推事件1\",\"orderNum\":1,\"pagepath\":\"1\",\"parentId\":1,\"parentName\":\"扫码\",\"type\":\"scancode_push1\",\"url\":\"1\"}', '0:0:0:0:0:0:0:1', '2018-04-19 10:07:33', '1', '响应时间：47ms', '3');
INSERT INTO `sys_log` VALUES ('467', '1', 'admin', '修改菜单', '6', 'net.zhenghao.zh.wechat.controller.WechatMenuController.update()', '{\"appid\":\"\",\"buttonType\":2,\"id\":3,\"key\":\"scancode_push\",\"name\":\"扫码推事件\",\"orderNum\":1,\"pagepath\":\"\",\"parentId\":1,\"parentName\":\"扫码\",\"type\":\"scancode_push\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 10:07:49', '1', '响应时间：6ms', '3');
INSERT INTO `sys_log` VALUES ('468', '1', 'admin', '新增菜单', '6', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":1,\"key\":\"\",\"name\":\"asdad\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":0,\"type\":\"\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 10:08:05', '1', '响应时间：6ms', '3');
INSERT INTO `sys_log` VALUES ('469', '1', 'admin', '删除菜单', '7', 'net.zhenghao.zh.wechat.controller.WechatMenuController.remove()', '[4]', '0:0:0:0:0:0:0:1', '2018-04-19 10:08:10', '1', '响应时间：7ms', '3');
INSERT INTO `sys_log` VALUES ('470', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"aegce\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-19 10:22:22', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('471', '1', 'admin', '新增菜单', '6', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":1,\"key\":\"\",\"name\":\"发图\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":0,\"type\":\"\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 10:23:26', '1', '响应时间：6ms', '6');
INSERT INTO `sys_log` VALUES ('472', '1', 'admin', '新增菜单', '5', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":1,\"key\":\"pic_sysphoto\",\"name\":\"系统拍照发图\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":5,\"parentName\":\"发图\",\"type\":\"pic_sysphoto\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 10:32:56', '1', '响应时间：5ms', '6');
INSERT INTO `sys_log` VALUES ('473', '1', 'admin', '新增菜单', '5', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":2,\"key\":\"pic_photo_or_album\",\"name\":\"拍照或者相册发图\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":\"pic_photo_or_album\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 10:33:40', '1', '响应时间：5ms', '6');
INSERT INTO `sys_log` VALUES ('474', '1', 'admin', '修改菜单', '8', 'net.zhenghao.zh.wechat.controller.WechatMenuController.update()', '{\"appid\":\"\",\"buttonType\":2,\"id\":6,\"key\":\"pic_sysphoto\",\"name\":\"系统拍照发图\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":5,\"parentName\":\"发图\",\"type\":\"pic_sysphoto\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 10:36:08', '1', '响应时间：8ms', '6');
INSERT INTO `sys_log` VALUES ('475', '1', 'admin', '修改菜单', '5', 'net.zhenghao.zh.wechat.controller.WechatMenuController.update()', '{\"appid\":\"\",\"buttonType\":2,\"id\":7,\"key\":\"pic_photo_or_album\",\"name\":\"拍照或者相册发图\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":5,\"parentName\":\"发图\",\"type\":\"pic_photo_or_album\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 10:36:19', '1', '响应时间：5ms', '6');
INSERT INTO `sys_log` VALUES ('476', '1', 'admin', '新增菜单', '4', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":2,\"key\":\"pic_weixin\",\"name\":\"微信相册发图\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":5,\"parentName\":\"发图\",\"type\":\"pic_weixin\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 10:38:17', '1', '响应时间：4ms', '6');
INSERT INTO `sys_log` VALUES ('477', '1', 'admin', '修改菜单', '5', 'net.zhenghao.zh.wechat.controller.WechatMenuController.update()', '{\"appid\":\"\",\"buttonType\":2,\"id\":7,\"key\":\"pic_photo_or_album\",\"name\":\"拍照或者相册发图\",\"orderNum\":1,\"pagepath\":\"\",\"parentId\":5,\"parentName\":\"发图\",\"type\":\"pic_photo_or_album\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 10:45:28', '1', '响应时间：5ms', '6');
INSERT INTO `sys_log` VALUES ('478', '1', 'admin', '修改菜单', '5', 'net.zhenghao.zh.wechat.controller.WechatMenuController.update()', '{\"appid\":\"\",\"buttonType\":2,\"id\":8,\"key\":\"pic_weixin\",\"name\":\"微信相册发图\",\"orderNum\":2,\"pagepath\":\"\",\"parentId\":5,\"parentName\":\"发图\",\"type\":\"pic_weixin\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 10:45:37', '1', '响应时间：5ms', '6');
INSERT INTO `sys_log` VALUES ('479', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"76d3f\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-19 11:04:01', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('480', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"2mwfm\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-19 13:50:19', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('481', '1', 'admin', '新增菜单', '8', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":1,\"key\":\"\",\"name\":\"其他\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":0,\"type\":\"\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 14:10:48', '1', '响应时间：8ms', '6');
INSERT INTO `sys_log` VALUES ('482', '1', 'admin', '新增菜单', '5', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":2,\"key\":\"location_select\",\"name\":\"发送位置\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":9,\"parentName\":\"其他\",\"type\":\"location_select\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 14:11:10', '1', '响应时间：5ms', '6');
INSERT INTO `sys_log` VALUES ('483', '1', 'admin', '新增菜单', '5', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":1,\"key\":\"my\",\"name\":\"我的信息\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":9,\"parentName\":\"其他\",\"type\":\"click\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 14:11:39', '1', '响应时间：5ms', '6');
INSERT INTO `sys_log` VALUES ('484', '1', 'admin', '新增菜单', '5', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":2,\"key\":\"\",\"name\":\"关于作者\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":9,\"parentName\":\"其他\",\"type\":\"view\",\"url\":\"https://github.com/zhaozhenghao1993/\"}', '0:0:0:0:0:0:0:1', '2018-04-19 14:12:18', '1', '响应时间：5ms', '6');
INSERT INTO `sys_log` VALUES ('485', '1', 'admin', '修改菜单', '54', 'net.zhenghao.zh.wechat.controller.WechatMenuController.update()', '{\"appid\":\"\",\"buttonType\":2,\"id\":11,\"key\":\"my\",\"name\":\"我的信息\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":9,\"parentName\":\"其他\",\"type\":\"click\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 14:12:30', '1', '响应时间：54ms', '6');
INSERT INTO `sys_log` VALUES ('486', '1', 'admin', '新增菜单', '4', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":1,\"key\":\"\",\"name\":\"haha\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":0,\"type\":\"\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 14:12:53', '1', '响应时间：4ms', '6');
INSERT INTO `sys_log` VALUES ('487', '1', 'admin', '删除菜单', '8', 'net.zhenghao.zh.wechat.controller.WechatMenuController.remove()', '[13]', '0:0:0:0:0:0:0:1', '2018-04-19 14:13:36', '1', '响应时间：8ms', '6');
INSERT INTO `sys_log` VALUES ('488', '1', 'admin', '新增菜单', '5', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":2,\"key\":\"test\",\"name\":\"haha\",\"orderNum\":3,\"pagepath\":\"\",\"parentId\":9,\"parentName\":\"其他\",\"type\":\"click\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 14:28:50', '1', '响应时间：5ms', '6');
INSERT INTO `sys_log` VALUES ('489', '1', 'admin', '删除菜单', '7', 'net.zhenghao.zh.wechat.controller.WechatMenuController.remove()', '[14]', '0:0:0:0:0:0:0:1', '2018-04-19 14:30:10', '1', '响应时间：7ms', '6');
INSERT INTO `sys_log` VALUES ('490', '1', 'admin', '新增菜单', '4', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":2,\"key\":\"aaa\",\"name\":\"asdad\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":9,\"parentName\":\"其他\",\"type\":\"click\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 14:31:46', '1', '响应时间：4ms', '6');
INSERT INTO `sys_log` VALUES ('491', '1', 'admin', '删除菜单', '31', 'net.zhenghao.zh.wechat.controller.WechatMenuController.remove()', '[15]', '0:0:0:0:0:0:0:1', '2018-04-19 14:40:31', '1', '响应时间：31ms', '6');
INSERT INTO `sys_log` VALUES ('492', '1', 'admin', '新增菜单', '7', 'net.zhenghao.zh.wechat.controller.WechatMenuController.save()', '{\"appid\":\"\",\"buttonType\":1,\"key\":\"\",\"name\":\"haha\",\"orderNum\":0,\"pagepath\":\"\",\"parentId\":0,\"type\":\"\",\"url\":\"\"}', '0:0:0:0:0:0:0:1', '2018-04-19 14:41:05', '1', '响应时间：7ms', '6');
INSERT INTO `sys_log` VALUES ('493', '1', 'admin', '删除菜单', '7', 'net.zhenghao.zh.wechat.controller.WechatMenuController.remove()', '[16]', '0:0:0:0:0:0:0:1', '2018-04-19 14:41:22', '1', '响应时间：7ms', '6');
INSERT INTO `sys_log` VALUES ('494', '1', 'admin', '删除微信菜单', '531', 'net.zhenghao.zh.wechat.controller.WechatMenuController.delete()', null, '0:0:0:0:0:0:0:1', '2018-04-19 15:06:38', '1', '响应时间：531ms', '6');
INSERT INTO `sys_log` VALUES ('495', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"g3g6b\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-19 15:15:23', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('496', '1', 'admin', '菜单提交微信', '842', 'net.zhenghao.zh.wechat.controller.WechatMenuController.submit()', null, '0:0:0:0:0:0:0:1', '2018-04-19 15:16:05', '1', '响应时间：842ms', '6');
INSERT INTO `sys_log` VALUES ('497', '1', 'admin', '菜单提交微信', '616', 'net.zhenghao.zh.wechat.controller.WechatMenuController.submit()', null, '0:0:0:0:0:0:0:1', '2018-04-19 15:17:33', '1', '响应时间：616ms', '6');
INSERT INTO `sys_log` VALUES ('498', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"gyd5w\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-19 15:58:00', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('499', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"4b2n5\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-20 16:24:58', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('500', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ccwcn\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-26 10:05:14', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('501', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"n5a27\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-26 10:07:15', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('502', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"yewyy\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-26 15:06:14', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('503', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"b4b5e\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-27 16:54:06', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('504', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"d4epn\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-27 17:05:43', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('505', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"84b44\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-28 14:22:50', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('506', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"ycyg2\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-04-28 15:16:12', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('507', '-1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"8ym47\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-05-18 17:29:37', '0', '登录失败：验证码不正确', '1');
INSERT INTO `sys_log` VALUES ('508', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"72x6c\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-05-18 17:29:42', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('509', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"py23n\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-05-21 13:44:44', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('510', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"de467\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-05-21 13:57:32', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('511', '1', 'admin', '新增或更新微信基本配置', '61', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"gmtCreate\":1523866986000,\"gmtModified\":1523934925000,\"id\":1,\"redirectUri\":\"http://zhenghao.free.ngrok.cc/zh-security\",\"token\":\"zzh\",\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-05-21 14:01:14', '1', '响应时间：61ms', '6');
INSERT INTO `sys_log` VALUES ('512', '1', 'admin', '新增或更新微信基本配置', '8', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"encodingAesKey\":\"fdsf\",\"gmtCreate\":1523866986000,\"gmtModified\":1526882474000,\"id\":1,\"redirectUri\":\"http://zhenghao.free.ngrok.cc/zh-security\",\"token\":\"zzh\",\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-05-21 14:05:28', '1', '响应时间：8ms', '6');
INSERT INTO `sys_log` VALUES ('513', '1', 'admin', '新增或更新微信基本配置', '7', 'net.zhenghao.zh.wechat.controller.WechatConfigController.saveOrUpdate()', '{\"appId\":\"wx398b1aa8f1e736ea\",\"appsecret\":\"d4688f34553d63c92a1d8f84286b04a0\",\"encodingAesKey\":\"\",\"gmtCreate\":1523866986000,\"gmtModified\":1526882728000,\"id\":1,\"redirectUri\":\"http://zhenghao.free.ngrok.cc/zh-security\",\"token\":\"zzh\",\"userIdCreate\":1}', '0:0:0:0:0:0:0:1', '2018-05-21 14:05:33', '1', '响应时间：7ms', '6');
INSERT INTO `sys_log` VALUES ('514', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"c2e2x\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-05-21 14:10:00', '1', '登录成功', '1');
INSERT INTO `sys_log` VALUES ('515', '1', 'admin', '登录', null, 'net.zhenghao.zh.shiro.controller.SysLoginController.login()', '{\"captcha\":\"466ny\",\"password\":\"123\",\"username\":\"admin\"}', '0:0:0:0:0:0:0:1', '2018-05-21 16:30:06', '1', '登录成功', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1 COMMENT='系统菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '基础管理', null, null, '0', 'fa fa-coffee', '2', '2017-12-20 14:22:08', null);
INSERT INTO `sys_menu` VALUES ('2', '0', '系统管理', null, null, '0', 'fa fa-desktop', '3', '2017-12-20 14:41:56', null);
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
INSERT INTO `sys_menu` VALUES ('43', '1', '文件管理', 'base/file/list.html', null, '1', 'fa fa-file', '4', '2018-02-01 10:05:08', null);
INSERT INTO `sys_menu` VALUES ('44', '43', '刷新', '/sys/file/list', 'sys:file:list', '2', null, '0', '2018-02-01 10:19:20', null);
INSERT INTO `sys_menu` VALUES ('45', '43', '新增', '/sys/file/save', 'sys:file:save', '2', null, '0', '2018-02-01 10:20:16', null);
INSERT INTO `sys_menu` VALUES ('46', '43', '编辑', 'sys/file/edit', 'sys:file:edit', '2', null, '0', '2018-02-01 10:20:54', null);
INSERT INTO `sys_menu` VALUES ('47', '43', '删除', 'sys/file/remove', 'sys:file:remove', '2', null, '0', '2018-02-01 10:21:42', null);
INSERT INTO `sys_menu` VALUES ('48', '0', '开发者工具', null, null, '0', 'fa fa-wrench', '0', '2018-04-08 10:19:57', '2018-04-08 10:34:08');
INSERT INTO `sys_menu` VALUES ('49', '48', '接口测试', 'base/tools/api.html', null, '1', 'fa fa-rocket', '0', '2018-04-08 10:22:18', '2018-04-08 10:36:00');
INSERT INTO `sys_menu` VALUES ('50', '49', '发送', '/sys/api/request', 'sys:api:request', '2', null, '0', '2018-04-09 09:42:12', null);
INSERT INTO `sys_menu` VALUES ('51', '48', '二维码', 'base/tools/qrcode.html', null, '1', 'fa fa-qrcode', '1', '2018-04-11 17:30:05', null);
INSERT INTO `sys_menu` VALUES ('52', '51', '生成', '/sys/code/qrcode', 'sys:code:qrcode', '2', null, '0', '2018-04-11 17:31:56', null);
INSERT INTO `sys_menu` VALUES ('53', '0', '微信管理', null, null, '0', 'fa fa-wechat', '0', '2018-04-13 16:08:18', null);
INSERT INTO `sys_menu` VALUES ('54', '53', '我的公众号', 'base/wechat/wechat.html', null, '1', 'fa fa-user-circle', '0', '2018-04-13 16:29:23', null);
INSERT INTO `sys_menu` VALUES ('55', '54', '配置信息', '/wechat/config/info', 'wechat:config:info', '2', null, '0', '2018-04-16 17:06:49', null);
INSERT INTO `sys_menu` VALUES ('56', '54', '保存配置信息', '/wechat/config/save', 'wechat:config:save', '2', null, '0', '2018-04-16 17:08:44', null);
INSERT INTO `sys_menu` VALUES ('57', '53', '微信菜单', 'base/wechat/menu_list.html', null, '1', 'fa fa-list-ul', '1', '2018-04-18 16:45:07', null);
INSERT INTO `sys_menu` VALUES ('58', '57', '刷新', '/wechat/menu/list', 'wechat:menu:list', '2', null, '0', '2018-04-19 15:10:15', null);
INSERT INTO `sys_menu` VALUES ('59', '57', '新增', '/wechat/menu/save', 'wechat:menu:save', '2', null, '0', '2018-04-19 15:10:55', null);
INSERT INTO `sys_menu` VALUES ('60', '57', '编辑', '/wechat/menu/update', 'wechat:menu:edit', '2', null, '0', '2018-04-19 15:11:56', null);
INSERT INTO `sys_menu` VALUES ('61', '57', '删除', '/wechat/menu/remove', 'wechat:menu:remove', '2', null, '0', '2018-04-19 15:12:35', null);
INSERT INTO `sys_menu` VALUES ('62', '57', '提交微信菜单', '/wechat/menu/submit', 'wechat:menu:submit', '2', null, '0', '2018-04-19 15:13:24', null);
INSERT INTO `sys_menu` VALUES ('63', '57', '删除微信菜单', '/wechat/menu/delete', 'wechat:menu:delete', '2', null, '0', '2018-04-19 15:13:52', null);
INSERT INTO `sys_menu` VALUES ('64', '54', '微信用户刷新', '/wechat/user/list', 'wechat:user:list', '2', null, '0', '2018-06-06 15:50:39', null);
INSERT INTO `sys_menu` VALUES ('65', '54', '微信用户统计', '/wechat/user/count', 'wechat:user:count', '2', null, '0', '2018-06-06 15:51:03', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1 COMMENT='角色菜单关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('43', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('44', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('45', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('46', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('47', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('48', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('49', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('50', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('51', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('52', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('53', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('54', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('55', '1', '33');
INSERT INTO `sys_role_menu` VALUES ('56', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('57', '1', '39');
INSERT INTO `sys_role_menu` VALUES ('58', '1', '40');
INSERT INTO `sys_role_menu` VALUES ('59', '1', '41');
INSERT INTO `sys_role_menu` VALUES ('60', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('61', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('62', '1', '37');
INSERT INTO `sys_role_menu` VALUES ('63', '1', '38');
INSERT INTO `sys_role_menu` VALUES ('64', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('65', '1', '43');
INSERT INTO `sys_role_menu` VALUES ('66', '1', '44');
INSERT INTO `sys_role_menu` VALUES ('67', '1', '45');
INSERT INTO `sys_role_menu` VALUES ('68', '1', '46');
INSERT INTO `sys_role_menu` VALUES ('69', '1', '47');
INSERT INTO `sys_role_menu` VALUES ('70', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('71', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('72', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('73', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('74', '1', '8');
INSERT INTO `sys_role_menu` VALUES ('75', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('76', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('77', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('78', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('79', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('80', '1', '9');
INSERT INTO `sys_role_menu` VALUES ('81', '1', '10');
INSERT INTO `sys_role_menu` VALUES ('82', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('83', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('84', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('85', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('86', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('87', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('88', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('89', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('90', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('91', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('92', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('93', '1', '51');
INSERT INTO `sys_role_menu` VALUES ('94', '1', '52');
INSERT INTO `sys_role_menu` VALUES ('95', '1', '53');
INSERT INTO `sys_role_menu` VALUES ('96', '1', '54');
INSERT INTO `sys_role_menu` VALUES ('97', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('98', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('99', '1', '57');
INSERT INTO `sys_role_menu` VALUES ('100', '1', '58');
INSERT INTO `sys_role_menu` VALUES ('101', '1', '59');
INSERT INTO `sys_role_menu` VALUES ('102', '1', '60');
INSERT INTO `sys_role_menu` VALUES ('103', '1', '61');
INSERT INTO `sys_role_menu` VALUES ('104', '1', '62');
INSERT INTO `sys_role_menu` VALUES ('105', '1', '63');
INSERT INTO `sys_role_menu` VALUES ('106', '1', '64');
INSERT INTO `sys_role_menu` VALUES ('107', '1', '65');

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

-- ----------------------------
-- Table structure for wechat_config
-- ----------------------------
DROP TABLE IF EXISTS `wechat_config`;
CREATE TABLE `wechat_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信appid',
  `appsecret` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信appsecret',
  `token` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '令牌(Token)',
  `encoding_aes_key` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '消息加解密密钥(EncodingAESKey)',
  `redirect_uri` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '授权回调页面域名',
  `user_id_create` bigint(20) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='微信基本配置表';

-- ----------------------------
-- Records of wechat_config
-- ----------------------------
INSERT INTO `wechat_config` VALUES ('1', 'wx398b1aa8f1e736ea', 'd4688f34553d63c92a1d8f84286b04a0', 'zzh', '', 'http://e33ee430.ngrok.io/zh-security', '1', '2018-04-16 16:23:06', '2018-05-21 14:05:33');

-- ----------------------------
-- Table structure for wechat_menu
-- ----------------------------
DROP TABLE IF EXISTS `wechat_menu`;
CREATE TABLE `wechat_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，最外层菜单为0',
  `type` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单的响应动作类型，view表示网页类型，click表示点击类型，miniprogram表示小程序类型',
  `name` varchar(70) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单标题，不超过16个字节，子菜单不超过60个字节',
  `key` varchar(130) CHARACTER SET utf8 DEFAULT NULL COMMENT 'click等点击类型必须,菜单KEY值，用于消息接口推送，不超过128字节',
  `url` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '网页 链接，用户点击菜单可打开链接，不超过1024字节。',
  `appid` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '小程序的appid（仅认证公众号可配置）',
  `pagepath` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '小程序的页面路径',
  `button_type` int(11) DEFAULT NULL COMMENT '菜单级别1：一级菜单 2：二级菜单',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='微信菜单';

-- ----------------------------
-- Records of wechat_menu
-- ----------------------------
INSERT INTO `wechat_menu` VALUES ('1', '0', '', '扫码', '', '', '', '', '1', '0', '2018-04-18 17:23:15', null);
INSERT INTO `wechat_menu` VALUES ('2', '1', 'scancode_waitmsg', '扫码带提示', 'scancode_waitmsg', '', '', '', '2', '0', '2018-04-18 17:23:51', null);
INSERT INTO `wechat_menu` VALUES ('3', '1', 'scancode_push', '扫码推事件', 'scancode_push', '', '', '', '2', '1', '2018-04-18 17:42:13', '2018-04-19 10:07:49');
INSERT INTO `wechat_menu` VALUES ('5', '0', '', '发图', '', '', '', '', '1', '0', '2018-04-19 10:23:26', null);
INSERT INTO `wechat_menu` VALUES ('6', '5', 'pic_sysphoto', '系统拍照发图', 'pic_sysphoto', '', '', '', '2', '0', '2018-04-19 10:32:56', '2018-04-19 10:36:08');
INSERT INTO `wechat_menu` VALUES ('7', '5', 'pic_photo_or_album', '拍照或者相册发图', 'pic_photo_or_album', '', '', '', '2', '1', '2018-04-19 10:33:40', '2018-04-19 10:45:28');
INSERT INTO `wechat_menu` VALUES ('8', '5', 'pic_weixin', '微信相册发图', 'pic_weixin', '', '', '', '2', '2', '2018-04-19 10:38:17', '2018-04-19 10:45:37');
INSERT INTO `wechat_menu` VALUES ('9', '0', '', '其他', '', '', '', '', '1', '0', '2018-04-19 14:10:48', null);
INSERT INTO `wechat_menu` VALUES ('10', '9', 'location_select', '发送位置', 'location_select', '', '', '', '2', '0', '2018-04-19 14:11:10', null);
INSERT INTO `wechat_menu` VALUES ('11', '9', 'click', '我的信息', 'my', '', '', '', '2', '0', '2018-04-19 14:11:39', '2018-04-19 14:12:30');
INSERT INTO `wechat_menu` VALUES ('12', '9', 'view', '关于作者', '', 'https://github.com/zhaozhenghao1993/', '', '', '2', '0', '2018-04-19 14:12:18', null);

-- ----------------------------
-- Table structure for wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `wechat_user`;
CREATE TABLE `wechat_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '微信openid',
  `mobile` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号',
  `realname` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '真实姓名',
  `nickname` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户的昵称',
  `sex` int(10) DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户所在城市',
  `country` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户所在国家',
  `province` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户所在省份',
  `headimgurl` varchar(500) DEFAULT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。',
  `unionid` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段',
  `language` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='微信授权页用户表';

-- ----------------------------
-- Records of wechat_user
-- ----------------------------
INSERT INTO `wechat_user` VALUES ('1', 'oedtL0hUAuDDIHQa53j4m9oCSydU', null, null, '赵正浩', '1', '洛阳', '中国', '河南', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqUqAib22tdoSjpCYwY5zxQwAicFwicNbpiciavPOZDsB6vDib7GDoQiccy919Mf8SDPlFy1dvPDEEymjePA/132', null, 'zh_CN', '2018-05-22 15:05:55', '2018-05-29 11:56:42');
INSERT INTO `wechat_user` VALUES ('2', 'oedtL0oz0Fuzijc8nPGJ_wToGPh4', null, null, '窝系渣渣辉', '1', '', '爱尔兰', '都柏林', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Uwx7klGClscItIdR0UyXanViaX9HJ0580wtnicyGUxEHibGUcHu17oibH8OxicroS8UFicBWWQRvWuo5y5BAprW7S6icQ/132', null, 'zh_CN', '2018-05-23 14:14:24', '2018-05-23 14:16:05');
