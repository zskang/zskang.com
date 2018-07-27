/*
Navicat MySQL Data Transfer

Source Server         : localhost-146
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : zsk

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2018-07-27 15:43:13
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
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0/30 * * * * ? ', 'Asia/Shanghai');

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
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  `SCHED_TIME` decimal(28,0) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
INSERT INTO `qrtz_fired_triggers` VALUES ('RenrenScheduler', 'HF-13014615326742582431532674258298', 'TASK_1', 'DEFAULT', 'HF-1301461532674258243', '1532677380014', '5', 'ACQUIRED', null, null, '0', '0', '1532677410000');

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
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'com.framework.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720026636F6D2E6672616D65776F726B2E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740018636F6D2E6672616D65776F726B2E7461736B2E546573745A7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000164DA6D07CA7874000F302F3330202A202A202A202A203F207372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740004747474617400016174000473737373737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'HF-1301461532674258243', '1532677384205', '15000');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1532677410000', '1532677380000', '5', 'ACQUIRED', 'CRON', '1532672935000', '0', null, '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720026636F6D2E6672616D65776F726B2E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740005746573745A7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000164DA6D07CA7874000F302F3330202A202A202A202A203F207372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740004747474617400016174000473737373737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(100) unsigned NOT NULL AUTO_INCREMENT,
  `bean_name` varchar(45) DEFAULT NULL,
  `method_name` varchar(45) DEFAULT NULL,
  `params` varchar(45) DEFAULT NULL,
  `cron_expression` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `create_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  UNIQUE KEY `job_id_UNIQUE` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testZ', 'ttta', 'a', '0/30 * * * * ? ', '0', 'ssss', '2018-07-27 14:28:55.882');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `job_id` bigint(100) NOT NULL,
  `bean_name` varchar(45) DEFAULT NULL,
  `method_name` varchar(45) DEFAULT NULL,
  `params` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `error` varchar(200) DEFAULT NULL,
  `times` varchar(45) DEFAULT NULL,
  `create_time` varchar(45) DEFAULT NULL,
  `log_id` bigint(100) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `log_id_UNIQUE` (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', 'com.framework.task.TestZ', 'ttta', 'a', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'com.framework.task.TestZ\' is defined', '1', '2018-07-27 14:48:00.026', '1');
INSERT INTO `schedule_job_log` VALUES ('1', 'com.framework.task.TestZ', 'ttta', 'a', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'com.framework.task.TestZ\' is defined', '1', '2018-07-27 14:48:02.535', '2');
INSERT INTO `schedule_job_log` VALUES ('1', 'com.framework.task.TestZ', 'ttta', 'a', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'com.framework.task.TestZ\' is defined', '1', '2018-07-27 14:48:30.007', '3');
INSERT INTO `schedule_job_log` VALUES ('1', 'com.framework.task.TestZ', 'ttta', 'a', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'com.framework.task.TestZ\' is defined', '13', '2018-07-27 14:49:00.019', '4');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '1', 'java.lang.NoSuchMethodException: com.framework.task.TestZ.ttta(java.lang.String)', '1', '2018-07-27 14:49:12.171', '5');
INSERT INTO `schedule_job_log` VALUES ('1', 'com.framework.task.TestZ', 'ttta', 'a', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'com.framework.task.TestZ\' is defined', '2', '2018-07-27 14:49:30.024', '6');
INSERT INTO `schedule_job_log` VALUES ('1', 'com.framework.task.TestZ', 'ttta', 'a', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'com.framework.task.TestZ\' is defined', '1', '2018-07-27 14:50:00.008', '7');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '3', '2018-07-27 14:52:03.896', '8');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 14:52:03.972', '9');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 14:52:30.027', '10');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '13', '2018-07-27 14:53:00.034', '11');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '3', '2018-07-27 14:53:30.012', '12');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 14:54:00.031', '13');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 14:54:30.011', '14');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '14', '2018-07-27 14:55:00.015', '15');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '14', '2018-07-27 14:55:30.027', '16');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 14:56:00.027', '17');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 14:56:30.032', '18');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 14:57:00.033', '19');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 14:57:30.027', '20');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '13', '2018-07-27 14:58:00.035', '21');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '3', '2018-07-27 14:58:30.025', '22');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 14:59:00.032', '23');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '3', '2018-07-27 14:59:30.027', '24');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:00:00.028', '25');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '16', '2018-07-27 15:00:30.013', '26');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '4', '2018-07-27 15:01:00.034', '27');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:01:30.023', '28');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:02:00.011', '29');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:02:30.012', '30');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '10', '2018-07-27 15:03:00.027', '31');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:03:30.011', '32');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:04:00.012', '33');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '10', '2018-07-27 15:04:30.009', '34');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:05:00.011', '35');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '13', '2018-07-27 15:05:30.028', '36');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:06:00.027', '37');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:06:30.028', '38');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:07:00.035', '39');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:07:30.009', '40');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '11', '2018-07-27 15:08:00.027', '41');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:08:30.01', '42');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:09:00.032', '43');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:09:30.008', '44');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:10:00.009', '45');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '11', '2018-07-27 15:10:30.028', '46');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:11:00.028', '47');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:11:30.026', '48');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:12:00.01', '49');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:12:30.028', '50');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '12', '2018-07-27 15:13:00.029', '51');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:13:30.028', '52');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:14:00.028', '53');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:14:30.019', '54');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:15:00.036', '55');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '13', '2018-07-27 15:15:30.009', '56');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:16:00.011', '57');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:16:30.028', '58');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:17:00.021', '59');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '3', '2018-07-27 15:17:30.018', '60');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '10', '2018-07-27 15:18:00.031', '61');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:18:30.008', '62');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:19:00.027', '63');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:19:30.028', '64');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:20:00.025', '65');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '14', '2018-07-27 15:20:30.016', '66');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:21:00.025', '67');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:21:30.028', '68');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:22:00.027', '69');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:22:30.025', '70');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '12', '2018-07-27 15:23:00.022', '71');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:23:30.017', '72');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:24:00.032', '73');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:24:30.019', '74');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:25:00.019', '75');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '12', '2018-07-27 15:25:30.019', '76');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:26:00.021', '77');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:26:30.019', '78');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:27:00.009', '79');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:27:30.027', '80');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '12', '2018-07-27 15:28:00.028', '81');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:28:30.017', '82');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '3', '2018-07-27 15:29:00.017', '83');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '0', '2018-07-27 15:29:30.031', '84');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:30:00.03', '85');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '13', '2018-07-27 15:30:30.028', '86');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:31:00.028', '87');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:31:30.024', '88');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:32:00.028', '89');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:32:30.022', '90');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '15', '2018-07-27 15:33:00.017', '91');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:33:30.008', '92');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:34:00.022', '93');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:34:30.022', '94');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '5', '2018-07-27 15:35:00.017', '95');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '11', '2018-07-27 15:35:30.009', '96');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:36:00.024', '97');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:36:30.008', '98');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '5', '2018-07-27 15:37:00.021', '99');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:37:30.023', '100');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '17', '2018-07-27 15:38:00.018', '101');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '3', '2018-07-27 15:38:30.015', '102');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:39:00.015', '103');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:39:30.016', '104');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:40:00.015', '105');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '12', '2018-07-27 15:40:30.015', '106');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:41:00.021', '107');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:41:30.015', '108');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '2', '2018-07-27 15:42:00.033', '109');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '1', '2018-07-27 15:42:30.028', '110');
INSERT INTO `schedule_job_log` VALUES ('1', 'testZ', 'ttta', 'a', '0', null, '44', '2018-07-27 15:43:00.008', '111');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(100) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `value` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `key` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientIp` varchar(255) DEFAULT NULL,
  `operateContent` varchar(255) DEFAULT NULL,
  `operateModule` varchar(255) DEFAULT NULL,
  `operateResult` varchar(255) DEFAULT NULL,
  `operateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `operateType` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `operateModuleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2676 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '', '', 'ContextLoader', '', '2018-07-27 14:12:38', 'initWebApplicationContext', '', '');
INSERT INTO `sys_log` VALUES ('2', '', '', 'AbstractApplicationContext', '', '2018-07-27 14:12:38', 'prepareRefresh', '', '');
INSERT INTO `sys_log` VALUES ('3', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:12:38', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('4', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:12:39', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('5', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:12:40', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('6', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:12:41', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('7', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:12:42', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('8', '', '', 'PropertiesLoaderSupport', '', '2018-07-27 14:12:43', 'loadProperties', '', '');
INSERT INTO `sys_log` VALUES ('9', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:43', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('10', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:43', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('11', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:43', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('12', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:44', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('13', '', '', 'DruidDataSource', '', '2018-07-27 14:12:46', 'init', '', '');
INSERT INTO `sys_log` VALUES ('14', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:46', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('15', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:46', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('16', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:46', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('17', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('18', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('19', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('20', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('21', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('22', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('23', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('24', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('25', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('26', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('27', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('28', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('29', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('30', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('31', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('32', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('33', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('34', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('35', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('36', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('37', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('38', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('39', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('40', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:47', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('41', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('42', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('43', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('44', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('45', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('46', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('47', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('48', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('49', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('50', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('51', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('52', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('53', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('54', '', '', 'AuthorizingRealm', '', '2018-07-27 14:12:48', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('55', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('56', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:12:48', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('57', '', '', 'StdSchedulerFactory', '', '2018-07-27 14:12:49', 'instantiate', '', '');
INSERT INTO `sys_log` VALUES ('58', '', '', 'SchedulerSignalerImpl', '', '2018-07-27 14:12:49', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('59', '', '', 'QuartzScheduler', '', '2018-07-27 14:12:49', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('60', '', '', 'JobStoreSupport', '', '2018-07-27 14:12:49', 'initialize', '', '');
INSERT INTO `sys_log` VALUES ('61', '', '', 'JobStoreCMT', '', '2018-07-27 14:12:49', 'initialize', '', '');
INSERT INTO `sys_log` VALUES ('62', '', '', 'QuartzScheduler', '', '2018-07-27 14:12:49', 'initialize', '', '');
INSERT INTO `sys_log` VALUES ('63', '', '', 'StdSchedulerFactory', '', '2018-07-27 14:12:49', 'instantiate', '', '');
INSERT INTO `sys_log` VALUES ('64', '', '', 'StdSchedulerFactory', '', '2018-07-27 14:12:49', 'instantiate', '', '');
INSERT INTO `sys_log` VALUES ('65', '', '', 'QuartzScheduler', '', '2018-07-27 14:12:49', 'setJobFactory', '', '');
INSERT INTO `sys_log` VALUES ('66', '', '', 'AbstractUrlHandlerMapping', '', '2018-07-27 14:12:51', 'registerHandler', '', '');
INSERT INTO `sys_log` VALUES ('67', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:51', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('68', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:51', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('69', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:51', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('70', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('71', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('72', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('73', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('74', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('75', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('76', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('77', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('78', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('79', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('80', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('81', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('82', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('83', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('84', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('85', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('86', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('87', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('88', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('89', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('90', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('91', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('92', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('93', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('94', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('95', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('96', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('97', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('98', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('99', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('100', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('101', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('102', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('103', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('104', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('105', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('106', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('107', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('108', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('109', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('110', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('111', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('112', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('113', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('114', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('115', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('116', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('117', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('118', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('119', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('120', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('121', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('122', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('123', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('124', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('125', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('126', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('127', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('128', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('129', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('130', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('131', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('132', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('133', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('134', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('135', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('136', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('137', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('138', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('139', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('140', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('141', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('142', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('143', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('144', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('145', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('146', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('147', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('148', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('149', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('150', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('151', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('152', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('153', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('154', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('155', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('156', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('157', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('158', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('159', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('160', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('161', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('162', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('163', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('164', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('165', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('166', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('167', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('168', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('169', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('170', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('171', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('172', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:59', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('173', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:59', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('174', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:59', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('175', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:59', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('176', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:59', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('177', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:59', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('178', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:59', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('179', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:59', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('180', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:59', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('181', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:12:59', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('182', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('183', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('184', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('185', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('186', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('187', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('188', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('189', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('190', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('191', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('192', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('193', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('194', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('195', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('196', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('197', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('198', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('199', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('200', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('201', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('202', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:02', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('203', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:02', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('204', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:02', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('205', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:02', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('206', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:02', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('207', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:02', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('208', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:02', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('209', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:02', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('210', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:02', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('211', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('212', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('213', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('214', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('215', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('216', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('217', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('218', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('219', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('220', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:04', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('221', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:04', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('222', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:04', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('223', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:04', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('224', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:04', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('225', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:04', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('226', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:04', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('227', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:04', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('228', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:05', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('229', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:05', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('230', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:05', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('231', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:05', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('232', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:05', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('233', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:05', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('234', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:05', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('235', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:05', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('236', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:06', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('237', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:06', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('238', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:06', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('239', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:06', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('240', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:06', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('241', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:06', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('242', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:06', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('243', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:06', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('244', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:07', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('245', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:07', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('246', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:07', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('247', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:07', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('248', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:07', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('249', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:07', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('250', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:07', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('251', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:07', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('252', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:08', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('253', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:08', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('254', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:08', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('255', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:08', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('256', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:08', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('257', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:08', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('258', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:08', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('259', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:09', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('260', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:09', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('261', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:09', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('262', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:09', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('263', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:09', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('264', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:09', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('265', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:09', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('266', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:10', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('267', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:10', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('268', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:10', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('269', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:10', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('270', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:10', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('271', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:10', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('272', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:10', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('273', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:11', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('274', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:11', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('275', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:11', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('276', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:11', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('277', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:11', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('278', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:11', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('279', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:11', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('280', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:12', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('281', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:12', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('282', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:12', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('283', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:12', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('284', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:12', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('285', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:12', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('286', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:12', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('287', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:13', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('288', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:13', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('289', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:13', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('290', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:13', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('291', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:13', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('292', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:13', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('293', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:14', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('294', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:14', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('295', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:14', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('296', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:14', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('297', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:14', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('298', '', '', 'Version', '', '2018-07-27 14:13:14', '<clinit>', '', '');
INSERT INTO `sys_log` VALUES ('299', '', '', 'RequestMappingHandlerAdapter', '', '2018-07-27 14:13:16', 'initControllerAdviceCache', '', '');
INSERT INTO `sys_log` VALUES ('300', '', '', 'RequestMappingHandlerAdapter', '', '2018-07-27 14:13:16', 'initControllerAdviceCache', '', '');
INSERT INTO `sys_log` VALUES ('301', '', '', 'VelocityViewResolver', '', '2018-07-27 14:13:16', 'initApplicationContext', '', '');
INSERT INTO `sys_log` VALUES ('302', '', '', 'VelocityConfigurer', '', '2018-07-27 14:13:17', 'postProcessVelocityEngine', '', '');
INSERT INTO `sys_log` VALUES ('303', '', '', 'FreeMarkerConfigurer', '', '2018-07-27 14:13:17', 'postProcessTemplateLoaders', '', '');
INSERT INTO `sys_log` VALUES ('304', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:17', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('305', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:18', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('306', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:18', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('307', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:18', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('308', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:18', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('309', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:18', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('310', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:18', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('311', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:19', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('312', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:19', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('313', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:19', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('314', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:19', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('315', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:19', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('316', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:20', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('317', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:20', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('318', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:20', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('319', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:20', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('320', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:20', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('321', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:20', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('322', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:21', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('323', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:21', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('324', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:21', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('325', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:21', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('326', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:21', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('327', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:21', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('328', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:22', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('329', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:22', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('330', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:22', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('331', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:22', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('332', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:22', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('333', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('334', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('335', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('336', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('337', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('338', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('339', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:24', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('340', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:24', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('341', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:24', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('342', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:24', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('343', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:24', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('344', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('345', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('346', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('347', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('348', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('349', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('350', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:26', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('351', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:26', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('352', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:26', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('353', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:26', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('354', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:26', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('355', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:27', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('356', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:27', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('357', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:27', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('358', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:27', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('359', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:27', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('360', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:28', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('361', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:28', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('362', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:28', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('363', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:28', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('364', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:28', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('365', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:29', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('366', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:29', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('367', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:29', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('368', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:29', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('369', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:29', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('370', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:30', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('371', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:30', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('372', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:30', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('373', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:30', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('374', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:30', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('375', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:31', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('376', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:31', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('377', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:31', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('378', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:31', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('379', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:31', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('380', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:32', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('381', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:32', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('382', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:32', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('383', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:32', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('384', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:32', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('385', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:33', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('386', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:33', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('387', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:33', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('388', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:33', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('389', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:34', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('390', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:34', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('391', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:34', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('392', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:34', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('393', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:34', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('394', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:35', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('395', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:35', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('396', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:35', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('397', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:35', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('398', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:35', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('399', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:36', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('400', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:36', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('401', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:36', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('402', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:36', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('403', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:37', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('404', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:37', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('405', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:37', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('406', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:37', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('407', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:37', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('408', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:38', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('409', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:38', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('410', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:38', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('411', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:38', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('412', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:39', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('413', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:39', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('414', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:39', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('415', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:39', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('416', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:39', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('417', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:40', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('418', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:40', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('419', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:40', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('420', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:40', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('421', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:41', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('422', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:41', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('423', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:41', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('424', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:41', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('425', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:41', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('426', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:42', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('427', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:42', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('428', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:42', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('429', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:42', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('430', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:43', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('431', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:43', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('432', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:43', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('433', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:43', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('434', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('435', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('436', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('437', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('438', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('439', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('440', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('441', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('442', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('443', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:46', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('444', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:46', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('445', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:46', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('446', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:46', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('447', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('448', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('449', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('450', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('451', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:48', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('452', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:48', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('453', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:48', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('454', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:48', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('455', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:49', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('456', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:49', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('457', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:49', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('458', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:49', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('459', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:50', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('460', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:50', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('461', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:50', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('462', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:50', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('463', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:50', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('464', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:51', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('465', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:51', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('466', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:51', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('467', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:51', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('468', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('469', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('470', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('471', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:52', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('472', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('473', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('474', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('475', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:53', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('476', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('477', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('478', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('479', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:54', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('480', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('481', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('482', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:55', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('483', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('484', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('485', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('486', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:56', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('487', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('488', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('489', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('490', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:57', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('491', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('492', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('493', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('494', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:58', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('495', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:59', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('496', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:59', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('497', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:59', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('498', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:13:59', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('499', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('500', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('501', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('502', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('503', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('504', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('505', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('506', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:02', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('507', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:02', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('508', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:02', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('509', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:02', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('510', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('511', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('512', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('513', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('514', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:04', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('515', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:04', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('516', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:04', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('517', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:05', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('518', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:05', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('519', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:05', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('520', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:05', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('521', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:06', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('522', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:06', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('523', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:06', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('524', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:07', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('525', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:07', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('526', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:07', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('527', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:07', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('528', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:08', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('529', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:08', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('530', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:08', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('531', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:08', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('532', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:09', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('533', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:09', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('534', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:14:09', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('535', '', '', 'DefaultLifecycleProcessor$LifecycleGroup', '', '2018-07-27 14:14:10', 'start', '', '');
INSERT INTO `sys_log` VALUES ('536', '', '', 'SchedulerFactoryBean', '', '2018-07-27 14:14:10', 'startScheduler', '', '');
INSERT INTO `sys_log` VALUES ('537', '', '', 'ContextLoader', '', '2018-07-27 14:14:10', 'initWebApplicationContext', '', '');
INSERT INTO `sys_log` VALUES ('538', '', '', 'FrameworkServlet', '', '2018-07-27 14:14:11', 'initServletBean', '', '');
INSERT INTO `sys_log` VALUES ('539', '', '', 'AbstractApplicationContext', '', '2018-07-27 14:14:11', 'prepareRefresh', '', '');
INSERT INTO `sys_log` VALUES ('540', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:14:11', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('541', '', '', 'FrameworkServlet', '', '2018-07-27 14:14:13', 'initServletBean', '', '');
INSERT INTO `sys_log` VALUES ('542', '', '', 'UserRealm', '', '2018-07-27 14:14:38', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('543', '', '', 'UserRealm', '', '2018-07-27 14:14:38', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('544', '0:0:0:0:0:0:0:1', '', 'SysLoginController', '', '2018-07-27 14:14:39', 'login', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('545', '0:0:0:0:0:0:0:1', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:14:39', 'loadBeanDefinitions', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('546', '0:0:0:0:0:0:0:1', '', 'SQLErrorCodesFactory', '', '2018-07-27 14:14:39', '<init>', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('547', '0:0:0:0:0:0:0:1', '', 'RRExceptionHandler', '', '2018-07-27 14:14:40', 'resolveException', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('548', '', '', 'UserRealm', '', '2018-07-27 14:14:50', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('549', '', '', 'UserRealm', '', '2018-07-27 14:14:51', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('550', '', '', 'SchedulerFactoryBean$1', '', '2018-07-27 14:15:10', 'run', '', '');
INSERT INTO `sys_log` VALUES ('551', '', '', 'JobStoreSupport', '', '2018-07-27 14:15:11', 'logWarnIfNonZero', '', '');
INSERT INTO `sys_log` VALUES ('552', '', '', 'JobStoreSupport', '', '2018-07-27 14:15:11', 'clusterRecover', '', '');
INSERT INTO `sys_log` VALUES ('553', '', '', 'QuartzScheduler', '', '2018-07-27 14:15:11', 'start', '', '');
INSERT INTO `sys_log` VALUES ('554', '', '', 'UserRealm', '', '2018-07-27 14:18:54', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('555', '', '', 'UserRealm', '', '2018-07-27 14:18:54', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('556', '', '', 'UserRealm', '', '2018-07-27 14:19:07', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('557', '', '', 'UserRealm', '', '2018-07-27 14:19:07', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('558', '0:0:0:0:0:0:0:1', '', 'SysLoginController', '', '2018-07-27 14:19:07', 'login', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('559', '0:0:0:0:0:0:0:1', '', 'RRExceptionHandler', '', '2018-07-27 14:19:07', 'resolveException', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('560', '', '', 'UserRealm', '', '2018-07-27 14:19:57', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('561', '0:0:0:0:0:0:0:1', '系统登陆:2018-07-27 14:19:57', '系统登陆', '登陆成功', '2018-07-27 14:19:57', '登陆', 'admin', null);
INSERT INTO `sys_log` VALUES ('562', '', '', 'UserRealm', '', '2018-07-27 14:19:57', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('563', '0:0:0:0:0:0:0:1', '', 'SysLoginController', '', '2018-07-27 14:19:57', 'login', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('564', '', '', 'ServletToolboxManager', '', '2018-07-27 14:19:58', 'getInstance', '', '');
INSERT INTO `sys_log` VALUES ('565', '', '', 'XMLToolboxManager', '', '2018-07-27 14:19:58', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('566', '', '', 'ServletToolboxManager', '', '2018-07-27 14:19:58', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('567', '', '', 'AuthorizingRealm', '', '2018-07-27 14:20:34', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('568', '', '', 'AuthorizingRealm', '', '2018-07-27 14:20:36', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('569', '', '', 'AuthorizingRealm', '', '2018-07-27 14:20:36', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('570', '', '', 'AuthorizingRealm', '', '2018-07-27 14:20:36', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('571', '', '', 'AuthorizingRealm', '', '2018-07-27 14:20:36', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('572', '0:0:0:0:0:0:0:1', '', 'AuthorizingRealm', '', '2018-07-27 14:20:36', 'getAuthorizationCacheLazy', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('573', '0:0:0:0:0:0:0:1', '', 'AuthorizingRealm', '', '2018-07-27 14:20:36', 'getAuthorizationCacheLazy', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('574', '0:0:0:0:0:0:0:1', '', 'AuthorizingRealm', '', '2018-07-27 14:20:36', 'getAuthorizationCacheLazy', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('575', '0:0:0:0:0:0:0:1', '', 'AuthorizingRealm', '', '2018-07-27 14:20:36', 'getAuthorizationCacheLazy', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('576', '0:0:0:0:0:0:0:1', '', 'AuthorizingRealm', '', '2018-07-27 14:22:24', 'getAuthorizationCacheLazy', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('577', '0:0:0:0:0:0:0:1', '', 'AuthorizingRealm', '', '2018-07-27 14:22:24', 'getAuthorizationCacheLazy', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('578', '0:0:0:0:0:0:0:1', '', 'AuthorizingRealm', '', '2018-07-27 14:22:25', 'getAuthorizationCacheLazy', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('579', '0:0:0:0:0:0:0:1', '', 'AuthorizingRealm', '', '2018-07-27 14:22:25', 'getAuthorizationCacheLazy', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('580', '0:0:0:0:0:0:0:1', '', 'AuthorizingRealm', '', '2018-07-27 14:22:25', 'getAuthorizationCacheLazy', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('581', '0:0:0:0:0:0:0:1', '', 'AuthorizingRealm', '', '2018-07-27 14:22:25', 'getAuthorizationCacheLazy', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('582', '0:0:0:0:0:0:0:1', '系统登陆:2018-07-27 14:22:55', '系统登陆', '登陆成功', '2018-07-27 14:22:55', '登陆', 'admin', null);
INSERT INTO `sys_log` VALUES ('583', '0:0:0:0:0:0:0:1', '', 'AuthorizingRealm', '', '2018-07-27 14:22:25', 'getAuthorizationCacheLazy', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('584', '', '', 'AuthorizingRealm', '', '2018-07-27 14:22:25', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('585', '', '', 'UserRealm', '', '2018-07-27 14:22:55', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('586', '', '', 'UserRealm', '', '2018-07-27 14:22:55', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('587', '0:0:0:0:0:0:0:1', '', 'SysLoginController', '', '2018-07-27 14:22:55', 'login', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('588', '', '', 'AuthorizingRealm', '', '2018-07-27 14:22:59', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('589', '', '', 'AuthorizingRealm', '', '2018-07-27 14:22:59', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('590', '', '', 'AuthorizingRealm', '', '2018-07-27 14:22:59', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('591', '', '', 'AuthorizingRealm', '', '2018-07-27 14:22:59', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('592', '', '', 'AuthorizingRealm', '', '2018-07-27 14:22:59', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('593', '', '', 'AuthorizingRealm', '', '2018-07-27 14:22:59', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('594', '', '', 'AuthorizingRealm', '', '2018-07-27 14:22:59', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('595', '0:0:0:0:0:0:0:1', '', 'AuthorizingRealm', '', '2018-07-27 14:23:00', 'getAuthorizationCacheLazy', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('596', '', '', 'AbstractApplicationContext', '', '2018-07-27 14:23:07', 'doClose', '', '');
INSERT INTO `sys_log` VALUES ('597', '', '', 'AbstractApplicationContext', '', '2018-07-27 14:23:07', 'doClose', '', '');
INSERT INTO `sys_log` VALUES ('598', '', '', 'DefaultLifecycleProcessor$LifecycleGroup', '', '2018-07-27 14:23:07', 'stop', '', '');
INSERT INTO `sys_log` VALUES ('599', '', '', 'QuartzScheduler', '', '2018-07-27 14:23:07', 'standby', '', '');
INSERT INTO `sys_log` VALUES ('600', '', '', 'SchedulerFactoryBean', '', '2018-07-27 14:23:07', 'destroy', '', '');
INSERT INTO `sys_log` VALUES ('601', '', '', 'QuartzScheduler', '', '2018-07-27 14:23:07', 'shutdown', '', '');
INSERT INTO `sys_log` VALUES ('602', '', '', 'QuartzScheduler', '', '2018-07-27 14:23:07', 'standby', '', '');
INSERT INTO `sys_log` VALUES ('603', '', '', 'ContextLoader', '', '2018-07-27 14:23:41', 'initWebApplicationContext', '', '');
INSERT INTO `sys_log` VALUES ('604', '', '', 'AbstractApplicationContext', '', '2018-07-27 14:23:42', 'prepareRefresh', '', '');
INSERT INTO `sys_log` VALUES ('605', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:23:42', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('606', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:23:45', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('607', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:24:02', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('608', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:24:13', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('609', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:24:22', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('610', '', '', 'PropertiesLoaderSupport', '', '2018-07-27 14:24:37', 'loadProperties', '', '');
INSERT INTO `sys_log` VALUES ('611', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:37', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('612', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:37', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('613', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:38', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('614', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:39', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('615', '', '', 'DruidDataSource', '', '2018-07-27 14:24:40', 'init', '', '');
INSERT INTO `sys_log` VALUES ('616', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:40', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('617', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('618', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('619', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('620', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('621', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('622', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('623', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('624', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('625', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('626', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('627', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('628', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('629', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('630', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('631', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('632', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('633', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('634', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('635', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('636', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('637', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('638', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('639', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('640', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('641', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('642', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('643', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('644', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('645', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('646', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('647', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('648', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('649', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('650', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('651', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('652', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('653', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('654', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('655', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('656', '', '', 'AuthorizingRealm', '', '2018-07-27 14:24:41', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('657', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('658', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:24:41', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('659', '', '', 'StdSchedulerFactory', '', '2018-07-27 14:24:42', 'instantiate', '', '');
INSERT INTO `sys_log` VALUES ('660', '', '', 'SchedulerSignalerImpl', '', '2018-07-27 14:24:42', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('661', '', '', 'QuartzScheduler', '', '2018-07-27 14:24:42', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('662', '', '', 'JobStoreSupport', '', '2018-07-27 14:24:42', 'initialize', '', '');
INSERT INTO `sys_log` VALUES ('663', '', '', 'JobStoreCMT', '', '2018-07-27 14:24:42', 'initialize', '', '');
INSERT INTO `sys_log` VALUES ('664', '', '', 'QuartzScheduler', '', '2018-07-27 14:24:42', 'initialize', '', '');
INSERT INTO `sys_log` VALUES ('665', '', '', 'StdSchedulerFactory', '', '2018-07-27 14:24:42', 'instantiate', '', '');
INSERT INTO `sys_log` VALUES ('666', '', '', 'StdSchedulerFactory', '', '2018-07-27 14:24:42', 'instantiate', '', '');
INSERT INTO `sys_log` VALUES ('667', '', '', 'QuartzScheduler', '', '2018-07-27 14:24:42', 'setJobFactory', '', '');
INSERT INTO `sys_log` VALUES ('668', '', '', 'AbstractUrlHandlerMapping', '', '2018-07-27 14:24:44', 'registerHandler', '', '');
INSERT INTO `sys_log` VALUES ('669', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('670', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('671', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('672', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('673', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('674', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('675', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('676', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('677', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('678', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('679', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('680', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('681', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('682', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('683', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('684', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('685', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('686', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('687', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('688', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('689', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('690', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('691', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('692', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('693', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('694', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('695', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('696', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('697', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('698', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('699', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('700', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('701', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('702', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('703', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('704', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('705', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('706', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('707', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('708', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('709', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('710', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('711', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('712', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('713', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('714', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('715', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('716', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('717', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('718', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('719', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('720', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('721', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('722', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('723', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('724', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('725', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('726', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('727', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('728', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('729', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('730', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('731', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('732', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('733', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('734', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('735', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('736', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('737', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('738', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('739', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('740', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('741', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('742', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('743', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('744', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('745', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('746', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('747', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('748', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('749', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('750', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('751', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('752', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('753', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('754', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('755', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('756', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('757', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('758', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('759', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('760', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('761', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('762', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('763', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('764', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('765', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('766', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('767', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('768', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('769', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('770', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('771', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('772', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('773', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('774', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('775', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('776', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('777', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('778', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('779', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('780', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('781', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('782', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('783', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('784', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('785', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('786', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('787', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('788', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('789', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('790', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('791', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('792', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('793', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('794', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('795', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('796', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('797', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('798', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('799', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('800', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('801', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('802', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('803', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('804', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('805', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('806', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('807', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('808', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('809', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('810', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('811', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('812', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('813', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('814', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('815', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('816', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('817', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('818', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('819', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('820', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('821', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('822', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('823', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('824', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('825', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('826', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('827', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('828', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('829', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('830', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('831', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('832', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('833', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('834', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('835', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('836', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('837', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('838', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('839', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('840', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('841', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('842', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:44', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('843', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('844', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('845', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('846', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('847', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('848', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('849', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('850', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('851', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('852', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('853', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('854', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('855', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('856', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('857', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('858', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('859', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('860', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('861', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('862', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('863', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('864', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('865', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('866', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('867', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('868', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('869', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('870', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('871', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('872', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('873', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('874', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('875', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('876', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('877', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('878', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('879', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('880', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('881', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('882', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('883', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('884', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('885', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('886', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('887', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('888', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('889', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('890', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('891', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('892', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('893', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('894', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('895', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('896', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('897', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('898', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('899', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:45', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('900', '', '', 'Version', '', '2018-07-27 14:24:45', '<clinit>', '', '');
INSERT INTO `sys_log` VALUES ('901', '', '', 'RequestMappingHandlerAdapter', '', '2018-07-27 14:24:46', 'initControllerAdviceCache', '', '');
INSERT INTO `sys_log` VALUES ('902', '', '', 'RequestMappingHandlerAdapter', '', '2018-07-27 14:24:46', 'initControllerAdviceCache', '', '');
INSERT INTO `sys_log` VALUES ('903', '', '', 'VelocityViewResolver', '', '2018-07-27 14:24:46', 'initApplicationContext', '', '');
INSERT INTO `sys_log` VALUES ('904', '', '', 'VelocityConfigurer', '', '2018-07-27 14:24:46', 'postProcessVelocityEngine', '', '');
INSERT INTO `sys_log` VALUES ('905', '', '', 'FreeMarkerConfigurer', '', '2018-07-27 14:24:47', 'postProcessTemplateLoaders', '', '');
INSERT INTO `sys_log` VALUES ('906', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('907', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('908', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('909', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('910', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('911', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('912', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('913', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('914', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('915', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('916', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('917', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('918', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('919', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('920', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('921', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('922', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('923', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('924', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('925', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('926', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('927', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('928', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('929', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('930', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('931', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('932', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('933', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('934', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('935', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('936', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('937', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('938', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('939', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('940', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('941', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('942', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('943', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('944', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('945', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('946', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('947', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('948', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('949', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('950', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('951', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('952', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('953', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('954', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('955', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('956', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('957', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('958', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('959', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('960', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('961', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('962', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('963', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('964', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('965', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('966', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('967', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('968', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('969', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('970', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('971', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('972', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('973', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('974', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('975', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('976', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('977', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('978', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('979', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('980', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('981', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('982', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('983', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('984', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('985', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('986', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('987', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('988', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('989', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('990', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('991', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('992', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('993', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('994', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('995', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('996', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('997', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('998', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('999', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1000', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1001', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1002', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1003', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1004', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1005', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1006', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1007', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1008', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1009', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1010', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1011', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1012', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1013', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1014', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1015', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1016', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1017', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1018', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1019', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1020', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1021', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1022', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1023', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1024', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1025', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1026', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1027', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1028', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1029', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1030', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1031', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1032', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1033', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1034', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1035', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1036', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1037', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1038', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1039', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1040', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1041', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1042', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1043', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1044', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1045', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1046', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1047', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1048', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1049', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1050', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1051', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1052', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1053', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1054', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1055', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1056', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1057', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1058', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1059', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1060', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1061', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1062', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1063', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1064', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1065', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1066', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1067', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1068', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1069', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1070', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1071', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1072', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1073', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1074', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1075', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1076', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1077', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1078', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1079', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1080', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1081', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1082', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1083', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1084', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1085', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1086', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1087', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1088', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1089', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1090', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1091', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1092', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1093', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1094', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1095', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1096', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1097', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1098', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1099', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1100', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1101', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1102', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1103', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1104', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1105', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1106', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1107', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1108', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1109', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1110', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1111', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1112', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1113', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1114', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1115', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1116', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1117', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1118', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1119', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1120', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1121', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1122', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1123', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1124', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1125', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1126', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1127', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1128', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1129', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1130', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1131', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1132', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1133', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1134', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1135', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1136', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:24:47', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1137', '', '', 'DefaultLifecycleProcessor$LifecycleGroup', '', '2018-07-27 14:24:47', 'start', '', '');
INSERT INTO `sys_log` VALUES ('1138', '', '', 'SchedulerFactoryBean', '', '2018-07-27 14:24:47', 'startScheduler', '', '');
INSERT INTO `sys_log` VALUES ('1139', '', '', 'ContextLoader', '', '2018-07-27 14:24:47', 'initWebApplicationContext', '', '');
INSERT INTO `sys_log` VALUES ('1140', '', '', 'FrameworkServlet', '', '2018-07-27 14:24:47', 'initServletBean', '', '');
INSERT INTO `sys_log` VALUES ('1141', '', '', 'AbstractApplicationContext', '', '2018-07-27 14:24:47', 'prepareRefresh', '', '');
INSERT INTO `sys_log` VALUES ('1142', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:24:47', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('1143', '0:0:0:0:0:0:0:1', '系统登陆:2018-07-27 14:25:44', '系统登陆', '登陆成功', '2018-07-27 14:25:44', '登陆', 'admin', null);
INSERT INTO `sys_log` VALUES ('1144', '', '', 'FrameworkServlet', '', '2018-07-27 14:24:51', 'initServletBean', '', '');
INSERT INTO `sys_log` VALUES ('1145', '', '', 'UserRealm', '', '2018-07-27 14:25:44', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('1146', '', '', 'UserRealm', '', '2018-07-27 14:25:44', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('1147', '0:0:0:0:0:0:0:1', '', 'SysLoginController', '', '2018-07-27 14:25:44', 'login', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('1148', '', '', 'ServletToolboxManager', '', '2018-07-27 14:25:44', 'getInstance', '', '');
INSERT INTO `sys_log` VALUES ('1149', '', '', 'XMLToolboxManager', '', '2018-07-27 14:25:44', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('1150', '', '', 'ServletToolboxManager', '', '2018-07-27 14:25:44', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('1151', '', '', 'SchedulerFactoryBean$1', '', '2018-07-27 14:25:47', 'run', '', '');
INSERT INTO `sys_log` VALUES ('1152', '', '', 'JobStoreSupport', '', '2018-07-27 14:25:47', 'logWarnIfNonZero', '', '');
INSERT INTO `sys_log` VALUES ('1153', '', '', 'JobStoreSupport', '', '2018-07-27 14:25:47', 'clusterRecover', '', '');
INSERT INTO `sys_log` VALUES ('1154', '', '', 'QuartzScheduler', '', '2018-07-27 14:25:47', 'start', '', '');
INSERT INTO `sys_log` VALUES ('1155', '', '', 'AuthorizingRealm', '', '2018-07-27 14:26:15', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1156', '', '', 'AuthorizingRealm', '', '2018-07-27 14:26:16', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1157', '', '', 'AuthorizingRealm', '', '2018-07-27 14:26:16', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1158', '', '', 'AuthorizingRealm', '', '2018-07-27 14:26:16', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1159', '', '', 'AuthorizingRealm', '', '2018-07-27 14:26:16', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1160', '', '', 'AuthorizingRealm', '', '2018-07-27 14:26:16', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1161', '', '', 'AuthorizingRealm', '', '2018-07-27 14:26:16', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1162', '', '', 'AuthorizingRealm', '', '2018-07-27 14:26:16', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1163', '', '', 'AuthorizingRealm', '', '2018-07-27 14:28:55', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1164', '', '', 'ErrorLogger', '', '2018-07-27 14:28:56', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1165', '', '', 'AuthorizingRealm', '', '2018-07-27 14:28:57', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1166', '', '', 'JobStoreSupport', '', '2018-07-27 14:29:23', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1167', '', '', 'ErrorLogger', '', '2018-07-27 14:29:23', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1168', '', '', 'JobStoreSupport', '', '2018-07-27 14:29:47', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1169', '', '', 'ErrorLogger', '', '2018-07-27 14:29:47', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1170', '', '', 'JobStoreSupport', '', '2018-07-27 14:30:11', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1171', '', '', 'ErrorLogger', '', '2018-07-27 14:30:11', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1172', '', '', 'AbstractApplicationContext', '', '2018-07-27 14:30:17', 'doClose', '', '');
INSERT INTO `sys_log` VALUES ('1173', '', '', 'AbstractApplicationContext', '', '2018-07-27 14:30:17', 'doClose', '', '');
INSERT INTO `sys_log` VALUES ('1174', '', '', 'ContextLoader', '', '2018-07-27 14:30:53', 'initWebApplicationContext', '', '');
INSERT INTO `sys_log` VALUES ('1175', '', '', 'AbstractApplicationContext', '', '2018-07-27 14:30:53', 'prepareRefresh', '', '');
INSERT INTO `sys_log` VALUES ('1176', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:30:53', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('1177', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:30:55', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('1178', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:31:05', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('1179', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:31:11', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('1180', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:31:13', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('1181', '', '', 'PropertiesLoaderSupport', '', '2018-07-27 14:31:15', 'loadProperties', '', '');
INSERT INTO `sys_log` VALUES ('1182', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:16', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1183', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:16', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1184', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:16', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1185', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:17', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1186', '', '', 'DruidDataSource', '', '2018-07-27 14:31:18', 'init', '', '');
INSERT INTO `sys_log` VALUES ('1187', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:18', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1188', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:19', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1189', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:19', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1190', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:19', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1191', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:19', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1192', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:19', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1193', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:19', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1194', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:19', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1195', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:19', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1196', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:19', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1197', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:19', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1198', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1199', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1200', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1201', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1202', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1203', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1204', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1205', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1206', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1207', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1208', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1209', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1210', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1211', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1212', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1213', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1214', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1215', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1216', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1217', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1218', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1219', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1220', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1221', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1222', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1223', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1224', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1225', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1226', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1227', '', '', 'AuthorizingRealm', '', '2018-07-27 14:31:20', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1228', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1229', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:31:20', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1230', '', '', 'StdSchedulerFactory', '', '2018-07-27 14:31:21', 'instantiate', '', '');
INSERT INTO `sys_log` VALUES ('1231', '', '', 'SchedulerSignalerImpl', '', '2018-07-27 14:31:21', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('1232', '', '', 'QuartzScheduler', '', '2018-07-27 14:31:21', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('1233', '', '', 'JobStoreSupport', '', '2018-07-27 14:31:21', 'initialize', '', '');
INSERT INTO `sys_log` VALUES ('1234', '', '', 'JobStoreCMT', '', '2018-07-27 14:31:21', 'initialize', '', '');
INSERT INTO `sys_log` VALUES ('1235', '', '', 'QuartzScheduler', '', '2018-07-27 14:31:21', 'initialize', '', '');
INSERT INTO `sys_log` VALUES ('1236', '', '', 'StdSchedulerFactory', '', '2018-07-27 14:31:21', 'instantiate', '', '');
INSERT INTO `sys_log` VALUES ('1237', '', '', 'StdSchedulerFactory', '', '2018-07-27 14:31:21', 'instantiate', '', '');
INSERT INTO `sys_log` VALUES ('1238', '', '', 'QuartzScheduler', '', '2018-07-27 14:31:21', 'setJobFactory', '', '');
INSERT INTO `sys_log` VALUES ('1239', '', '', 'AbstractUrlHandlerMapping', '', '2018-07-27 14:31:23', 'registerHandler', '', '');
INSERT INTO `sys_log` VALUES ('1240', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1241', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1242', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1243', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1244', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1245', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1246', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1247', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1248', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1249', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1250', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1251', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1252', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1253', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1254', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1255', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1256', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1257', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1258', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1259', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1260', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1261', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1262', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1263', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1264', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1265', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1266', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1267', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1268', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1269', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1270', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1271', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1272', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1273', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1274', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1275', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1276', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1277', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1278', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1279', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1280', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1281', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1282', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1283', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1284', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1285', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1286', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1287', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1288', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1289', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1290', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1291', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1292', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1293', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1294', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1295', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1296', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1297', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1298', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1299', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1300', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1301', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1302', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1303', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1304', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1305', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1306', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1307', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1308', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1309', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1310', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1311', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1312', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1313', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1314', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1315', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1316', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1317', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1318', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1319', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1320', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1321', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1322', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1323', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1324', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1325', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1326', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1327', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1328', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1329', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1330', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1331', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1332', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1333', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1334', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1335', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1336', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1337', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1338', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1339', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1340', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1341', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1342', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1343', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1344', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1345', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1346', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1347', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1348', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1349', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1350', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1351', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1352', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1353', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1354', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1355', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1356', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1357', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1358', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1359', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1360', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1361', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1362', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1363', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1364', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1365', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1366', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1367', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1368', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1369', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1370', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1371', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1372', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1373', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1374', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1375', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1376', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1377', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1378', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1379', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1380', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1381', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1382', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1383', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1384', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1385', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1386', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1387', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1388', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1389', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1390', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1391', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1392', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1393', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1394', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1395', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1396', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1397', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1398', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1399', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1400', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1401', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1402', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1403', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1404', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1405', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1406', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1407', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1408', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1409', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1410', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1411', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1412', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1413', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1414', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1415', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1416', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1417', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1418', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1419', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1420', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1421', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1422', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1423', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1424', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1425', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1426', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1427', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1428', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1429', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1430', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1431', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1432', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1433', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1434', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1435', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1436', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1437', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1438', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1439', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1440', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1441', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1442', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1443', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1444', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1445', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1446', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1447', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1448', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1449', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1450', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1451', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1452', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1453', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1454', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1455', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1456', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1457', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1458', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1459', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1460', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1461', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1462', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1463', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1464', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1465', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1466', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1467', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1468', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1469', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1470', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:23', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1471', '', '', 'Version', '', '2018-07-27 14:31:23', '<clinit>', '', '');
INSERT INTO `sys_log` VALUES ('1472', '', '', 'RequestMappingHandlerAdapter', '', '2018-07-27 14:31:24', 'initControllerAdviceCache', '', '');
INSERT INTO `sys_log` VALUES ('1473', '', '', 'RequestMappingHandlerAdapter', '', '2018-07-27 14:31:24', 'initControllerAdviceCache', '', '');
INSERT INTO `sys_log` VALUES ('1474', '', '', 'VelocityViewResolver', '', '2018-07-27 14:31:25', 'initApplicationContext', '', '');
INSERT INTO `sys_log` VALUES ('1475', '', '', 'VelocityConfigurer', '', '2018-07-27 14:31:25', 'postProcessVelocityEngine', '', '');
INSERT INTO `sys_log` VALUES ('1476', '', '', 'FreeMarkerConfigurer', '', '2018-07-27 14:31:25', 'postProcessTemplateLoaders', '', '');
INSERT INTO `sys_log` VALUES ('1477', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1478', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1479', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1480', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1481', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1482', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1483', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1484', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1485', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1486', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1487', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1488', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1489', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1490', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1491', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1492', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1493', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1494', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1495', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1496', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1497', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1498', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1499', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1500', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1501', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1502', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1503', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1504', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1505', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1506', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1507', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1508', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1509', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1510', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1511', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1512', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1513', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1514', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1515', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1516', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1517', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1518', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1519', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1520', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1521', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1522', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1523', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1524', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1525', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1526', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1527', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1528', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1529', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1530', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1531', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1532', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1533', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1534', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1535', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1536', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1537', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1538', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1539', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1540', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1541', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1542', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1543', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1544', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1545', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1546', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1547', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1548', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1549', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1550', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1551', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1552', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1553', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1554', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1555', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1556', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1557', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1558', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1559', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1560', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1561', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1562', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1563', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1564', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1565', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1566', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1567', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1568', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1569', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1570', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1571', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1572', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1573', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1574', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1575', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1576', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1577', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1578', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1579', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1580', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1581', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1582', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1583', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1584', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1585', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1586', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1587', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1588', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1589', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1590', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1591', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1592', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1593', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1594', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1595', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1596', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1597', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1598', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1599', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1600', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1601', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1602', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1603', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1604', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1605', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1606', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1607', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1608', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1609', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1610', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1611', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1612', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1613', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1614', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1615', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1616', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1617', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1618', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1619', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1620', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1621', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1622', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1623', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1624', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1625', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1626', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1627', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1628', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1629', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1630', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1631', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1632', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1633', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1634', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1635', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1636', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1637', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1638', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1639', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1640', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1641', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1642', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1643', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1644', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1645', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1646', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1647', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1648', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1649', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1650', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1651', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1652', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1653', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1654', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1655', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1656', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1657', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1658', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1659', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1660', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1661', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1662', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1663', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1664', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1665', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1666', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1667', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1668', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1669', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1670', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1671', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1672', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1673', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1674', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1675', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1676', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1677', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1678', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1679', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1680', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1681', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1682', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1683', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1684', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1685', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1686', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1687', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1688', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1689', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1690', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1691', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1692', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1693', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1694', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1695', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1696', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1697', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1698', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1699', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1700', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1701', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1702', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1703', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1704', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1705', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1706', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1707', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:31:25', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1708', '', '', 'DefaultLifecycleProcessor$LifecycleGroup', '', '2018-07-27 14:31:26', 'start', '', '');
INSERT INTO `sys_log` VALUES ('1709', '', '', 'SchedulerFactoryBean', '', '2018-07-27 14:31:26', 'startScheduler', '', '');
INSERT INTO `sys_log` VALUES ('1710', '', '', 'ContextLoader', '', '2018-07-27 14:31:26', 'initWebApplicationContext', '', '');
INSERT INTO `sys_log` VALUES ('1711', '', '', 'FrameworkServlet', '', '2018-07-27 14:31:26', 'initServletBean', '', '');
INSERT INTO `sys_log` VALUES ('1712', '', '', 'AbstractApplicationContext', '', '2018-07-27 14:31:26', 'prepareRefresh', '', '');
INSERT INTO `sys_log` VALUES ('1713', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:31:26', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('1714', '0:0:0:0:0:0:0:1', '系统登陆:2018-07-27 14:31:39', '系统登陆', '登陆成功', '2018-07-27 14:31:39', '登陆', 'admin', null);
INSERT INTO `sys_log` VALUES ('1715', '', '', 'FrameworkServlet', '', '2018-07-27 14:31:27', 'initServletBean', '', '');
INSERT INTO `sys_log` VALUES ('1716', '', '', 'UserRealm', '', '2018-07-27 14:31:39', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('1717', '', '', 'UserRealm', '', '2018-07-27 14:31:39', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('1718', '0:0:0:0:0:0:0:1', '', 'SysLoginController', '', '2018-07-27 14:31:39', 'login', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('1719', '', '', 'ServletToolboxManager', '', '2018-07-27 14:31:40', 'getInstance', '', '');
INSERT INTO `sys_log` VALUES ('1720', '', '', 'XMLToolboxManager', '', '2018-07-27 14:31:40', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('1721', '', '', 'ServletToolboxManager', '', '2018-07-27 14:31:40', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('1722', '', '', 'AuthorizingRealm', '', '2018-07-27 14:31:43', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1723', '', '', 'AuthorizingRealm', '', '2018-07-27 14:31:43', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1724', '', '', 'AuthorizingRealm', '', '2018-07-27 14:31:43', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1725', '', '', 'AuthorizingRealm', '', '2018-07-27 14:31:43', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1726', '', '', 'AuthorizingRealm', '', '2018-07-27 14:31:43', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1727', '', '', 'AuthorizingRealm', '', '2018-07-27 14:31:43', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1728', '', '', 'AuthorizingRealm', '', '2018-07-27 14:31:43', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1729', '', '', 'AuthorizingRealm', '', '2018-07-27 14:31:44', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1730', '', '', 'AuthorizingRealm', '', '2018-07-27 14:31:49', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1731', '', '', 'AuthorizingRealm', '', '2018-07-27 14:31:51', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1732', '', '', 'SchedulerFactoryBean$1', '', '2018-07-27 14:32:26', 'run', '', '');
INSERT INTO `sys_log` VALUES ('1733', '', '', 'JobStoreSupport', '', '2018-07-27 14:32:26', 'logWarnIfNonZero', '', '');
INSERT INTO `sys_log` VALUES ('1734', '', '', 'JobStoreSupport', '', '2018-07-27 14:32:26', 'clusterRecover', '', '');
INSERT INTO `sys_log` VALUES ('1735', '', '', 'QuartzScheduler', '', '2018-07-27 14:32:26', 'start', '', '');
INSERT INTO `sys_log` VALUES ('1736', '', '', 'JobStoreSupport', '', '2018-07-27 14:32:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1737', '', '', 'ErrorLogger', '', '2018-07-27 14:32:26', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1738', '', '', 'JobStoreSupport', '', '2018-07-27 14:32:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1739', '', '', 'JobStoreSupport', '', '2018-07-27 14:32:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1740', '', '', 'JobStoreSupport', '', '2018-07-27 14:32:50', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1741', '', '', 'JobStoreSupport', '', '2018-07-27 14:33:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1742', '', '', 'JobStoreSupport', '', '2018-07-27 14:33:14', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1743', '', '', 'JobStoreSupport', '', '2018-07-27 14:33:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1744', '', '', 'ErrorLogger', '', '2018-07-27 14:33:26', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1745', '', '', 'JobStoreSupport', '', '2018-07-27 14:33:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1746', '', '', 'JobStoreSupport', '', '2018-07-27 14:33:50', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1747', '', '', 'JobStoreSupport', '', '2018-07-27 14:34:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1748', '', '', 'ErrorLogger', '', '2018-07-27 14:34:02', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1749', '', '', 'JobStoreSupport', '', '2018-07-27 14:34:14', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1750', '', '', 'JobStoreSupport', '', '2018-07-27 14:34:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1751', '', '', 'JobStoreSupport', '', '2018-07-27 14:34:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1752', '', '', 'ErrorLogger', '', '2018-07-27 14:34:38', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1753', '', '', 'JobStoreSupport', '', '2018-07-27 14:34:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1754', '', '', 'JobStoreSupport', '', '2018-07-27 14:34:50', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1755', '', '', 'JobStoreSupport', '', '2018-07-27 14:35:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1756', '', '', 'JobStoreSupport', '', '2018-07-27 14:35:14', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1757', '', '', 'JobStoreSupport', '', '2018-07-27 14:35:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1758', '', '', 'ErrorLogger', '', '2018-07-27 14:35:26', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1759', '', '', 'JobStoreSupport', '', '2018-07-27 14:35:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1760', '', '', 'JobStoreSupport', '', '2018-07-27 14:35:50', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1761', '', '', 'ErrorLogger', '', '2018-07-27 14:35:50', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1762', '', '', 'JobStoreSupport', '', '2018-07-27 14:36:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1763', '', '', 'ErrorLogger', '', '2018-07-27 14:36:02', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1764', '', '', 'JobStoreSupport', '', '2018-07-27 14:36:14', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1765', '', '', 'ErrorLogger', '', '2018-07-27 14:36:14', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1766', '', '', 'JobStoreSupport', '', '2018-07-27 14:36:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1767', '', '', 'JobStoreSupport', '', '2018-07-27 14:36:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1768', '', '', 'ErrorLogger', '', '2018-07-27 14:36:38', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1769', '', '', 'JobStoreSupport', '', '2018-07-27 14:36:50', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1770', '', '', 'ErrorLogger', '', '2018-07-27 14:36:50', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1771', '', '', 'JobStoreSupport', '', '2018-07-27 14:37:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1772', '', '', 'ErrorLogger', '', '2018-07-27 14:37:02', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1773', '', '', 'JobStoreSupport', '', '2018-07-27 14:37:14', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1774', '', '', 'ErrorLogger', '', '2018-07-27 14:37:14', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1775', '', '', 'JobStoreSupport', '', '2018-07-27 14:37:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1776', '', '', 'JobStoreSupport', '', '2018-07-27 14:37:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1777', '', '', 'ErrorLogger', '', '2018-07-27 14:37:38', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1778', '', '', 'JobStoreSupport', '', '2018-07-27 14:37:50', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1779', '', '', 'ErrorLogger', '', '2018-07-27 14:37:50', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1780', '', '', 'JobStoreSupport', '', '2018-07-27 14:38:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1781', '', '', 'ErrorLogger', '', '2018-07-27 14:38:02', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1782', '', '', 'JobStoreSupport', '', '2018-07-27 14:38:14', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1783', '', '', 'JobStoreSupport', '', '2018-07-27 14:38:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1784', '', '', 'ErrorLogger', '', '2018-07-27 14:38:26', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1785', '', '', 'JobStoreSupport', '', '2018-07-27 14:38:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1786', '', '', 'ErrorLogger', '', '2018-07-27 14:38:38', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1787', '', '', 'JobStoreSupport', '', '2018-07-27 14:38:50', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1788', '', '', 'ErrorLogger', '', '2018-07-27 14:38:50', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1789', '', '', 'JobStoreSupport', '', '2018-07-27 14:39:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1790', '', '', 'ErrorLogger', '', '2018-07-27 14:39:02', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1791', '', '', 'JobStoreSupport', '', '2018-07-27 14:39:14', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1792', '', '', 'ErrorLogger', '', '2018-07-27 14:39:14', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1793', '', '', 'JobStoreSupport', '', '2018-07-27 14:39:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1794', '', '', 'JobStoreSupport', '', '2018-07-27 14:39:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1795', '', '', 'ErrorLogger', '', '2018-07-27 14:39:38', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1796', '', '', 'JobStoreSupport', '', '2018-07-27 14:39:50', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1797', '', '', 'JobStoreSupport', '', '2018-07-27 14:40:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1798', '', '', 'ErrorLogger', '', '2018-07-27 14:40:02', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1799', '', '', 'JobStoreSupport', '', '2018-07-27 14:40:14', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1800', '', '', 'ErrorLogger', '', '2018-07-27 14:40:14', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1801', '', '', 'JobStoreSupport', '', '2018-07-27 14:40:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1802', '', '', 'JobStoreSupport', '', '2018-07-27 14:40:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1803', '', '', 'ErrorLogger', '', '2018-07-27 14:40:38', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1804', '', '', 'JobStoreSupport', '', '2018-07-27 14:40:50', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1805', '', '', 'ErrorLogger', '', '2018-07-27 14:40:50', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1806', '', '', 'JobStoreSupport', '', '2018-07-27 14:41:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1807', '', '', 'JobStoreSupport', '', '2018-07-27 14:41:14', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1808', '', '', 'JobStoreSupport', '', '2018-07-27 14:41:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1809', '', '', 'ErrorLogger', '', '2018-07-27 14:41:26', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1810', '', '', 'JobStoreSupport', '', '2018-07-27 14:41:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1811', '', '', 'JobStoreSupport', '', '2018-07-27 14:41:50', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1812', '', '', 'JobStoreSupport', '', '2018-07-27 14:42:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1813', '', '', 'ErrorLogger', '', '2018-07-27 14:42:02', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1814', '', '', 'JobStoreSupport', '', '2018-07-27 14:42:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1815', '', '', 'JobStoreSupport', '', '2018-07-27 14:42:14', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1816', '', '', 'JobStoreSupport', '', '2018-07-27 14:42:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1817', '', '', 'JobStoreSupport', '', '2018-07-27 14:42:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1818', '', '', 'ErrorLogger', '', '2018-07-27 14:42:38', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1819', '', '', 'JobStoreSupport', '', '2018-07-27 14:42:50', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1820', '', '', 'JobStoreSupport', '', '2018-07-27 14:43:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1821', '', '', 'JobStoreSupport', '', '2018-07-27 14:43:14', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1822', '', '', 'ErrorLogger', '', '2018-07-27 14:43:14', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1823', '', '', 'JobStoreSupport', '', '2018-07-27 14:43:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1824', '', '', 'ErrorLogger', '', '2018-07-27 14:43:26', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1825', '', '', 'JobStoreSupport', '', '2018-07-27 14:43:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1826', '', '', 'JobStoreSupport', '', '2018-07-27 14:43:50', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1827', '', '', 'ErrorLogger', '', '2018-07-27 14:43:50', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1828', '', '', 'JobStoreSupport', '', '2018-07-27 14:44:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1829', '', '', 'ErrorLogger', '', '2018-07-27 14:44:02', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1830', '', '', 'JobStoreSupport', '', '2018-07-27 14:44:14', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1831', '', '', 'ErrorLogger', '', '2018-07-27 14:44:14', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1832', '', '', 'JobStoreSupport', '', '2018-07-27 14:44:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1833', '', '', 'JobStoreSupport', '', '2018-07-27 14:44:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1834', '', '', 'ErrorLogger', '', '2018-07-27 14:44:38', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1835', '', '', 'JobStoreSupport', '', '2018-07-27 14:44:50', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1836', '', '', 'JobStoreSupport', '', '2018-07-27 14:45:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1837', '', '', 'JobStoreSupport', '', '2018-07-27 14:45:14', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1838', '', '', 'JobStoreSupport', '', '2018-07-27 14:45:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1839', '', '', 'ErrorLogger', '', '2018-07-27 14:45:26', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1840', '', '', 'JobStoreSupport', '', '2018-07-27 14:45:38', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1841', '', '', 'ErrorLogger', '', '2018-07-27 14:45:38', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1842', '', '', 'JobStoreSupport', '', '2018-07-27 14:45:50', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1843', '', '', 'JobStoreSupport', '', '2018-07-27 14:46:02', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1844', '', '', 'ErrorLogger', '', '2018-07-27 14:46:02', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1845', '', '', 'JobStoreSupport', '', '2018-07-27 14:46:14', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1846', '', '', 'ErrorLogger', '', '2018-07-27 14:46:14', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1847', '', '', 'ScheduleJob', '', '2018-07-27 14:46:18', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1848', '', '', 'ScheduleJob', '', '2018-07-27 14:46:18', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1849', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:46:18', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('1850', '', '', 'SQLErrorCodesFactory', '', '2018-07-27 14:46:18', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('1851', '', '', 'JobRunShell', '', '2018-07-27 14:46:18', 'run', '', '');
INSERT INTO `sys_log` VALUES ('1852', '', '', 'ErrorLogger', '', '2018-07-27 14:46:18', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1853', '', '', 'JobStoreSupport', '', '2018-07-27 14:46:26', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('1854', '', '', 'ScheduleJob', '', '2018-07-27 14:46:26', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1855', '', '', 'ScheduleJob', '', '2018-07-27 14:46:26', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1856', '', '', 'JobRunShell', '', '2018-07-27 14:46:26', 'run', '', '');
INSERT INTO `sys_log` VALUES ('1857', '', '', 'ErrorLogger', '', '2018-07-27 14:46:26', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1858', '', '', 'ScheduleJob', '', '2018-07-27 14:46:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1859', '', '', 'ScheduleJob', '', '2018-07-27 14:46:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1860', '', '', 'JobRunShell', '', '2018-07-27 14:46:30', 'run', '', '');
INSERT INTO `sys_log` VALUES ('1861', '', '', 'ErrorLogger', '', '2018-07-27 14:46:30', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1862', '', '', 'ScheduleJob', '', '2018-07-27 14:47:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1863', '', '', 'ScheduleJob', '', '2018-07-27 14:47:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1864', '', '', 'JobRunShell', '', '2018-07-27 14:47:00', 'run', '', '');
INSERT INTO `sys_log` VALUES ('1865', '', '', 'ErrorLogger', '', '2018-07-27 14:47:00', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1866', '', '', 'AuthorizingRealm', '', '2018-07-27 14:47:02', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1867', '', '', 'ScheduleJob', '', '2018-07-27 14:47:02', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1868', '', '', 'ScheduleJob', '', '2018-07-27 14:47:02', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1869', '', '', 'JobRunShell', '', '2018-07-27 14:47:02', 'run', '', '');
INSERT INTO `sys_log` VALUES ('1870', '', '', 'ErrorLogger', '', '2018-07-27 14:47:02', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1871', '', '', 'AuthorizingRealm', '', '2018-07-27 14:47:04', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1872', '', '', 'ScheduleJob', '', '2018-07-27 14:47:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1873', '', '', 'ScheduleJob', '', '2018-07-27 14:47:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1874', '', '', 'JobRunShell', '', '2018-07-27 14:47:30', 'run', '', '');
INSERT INTO `sys_log` VALUES ('1875', '', '', 'ErrorLogger', '', '2018-07-27 14:47:30', 'schedulerError', '', '');
INSERT INTO `sys_log` VALUES ('1876', '', '', 'ScheduleJob', '', '2018-07-27 14:48:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1877', '', '', 'ScheduleJob', '', '2018-07-27 14:48:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1878', '', '', 'AuthorizingRealm', '', '2018-07-27 14:48:02', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1879', '', '', 'ScheduleJob', '', '2018-07-27 14:48:02', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1880', '', '', 'ScheduleJob', '', '2018-07-27 14:48:02', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1881', '', '', 'AuthorizingRealm', '', '2018-07-27 14:48:03', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1882', '', '', 'ScheduleJob', '', '2018-07-27 14:48:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1883', '', '', 'ScheduleJob', '', '2018-07-27 14:48:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1884', '', '', 'ScheduleJob', '', '2018-07-27 14:49:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1885', '', '', 'ScheduleJob', '', '2018-07-27 14:49:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1886', '', '', 'AuthorizingRealm', '', '2018-07-27 14:49:07', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1887', '', '', 'AuthorizingRealm', '', '2018-07-27 14:49:07', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1888', '', '', 'AuthorizingRealm', '', '2018-07-27 14:49:07', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1889', '', '', 'AuthorizingRealm', '', '2018-07-27 14:49:07', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1890', '', '', 'AuthorizingRealm', '', '2018-07-27 14:49:07', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1891', '', '', 'AuthorizingRealm', '', '2018-07-27 14:49:07', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1892', '', '', 'AuthorizingRealm', '', '2018-07-27 14:49:07', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1893', '', '', 'AuthorizingRealm', '', '2018-07-27 14:49:07', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1894', '', '', 'AuthorizingRealm', '', '2018-07-27 14:49:07', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1895', '', '', 'AuthorizingRealm', '', '2018-07-27 14:49:12', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1896', '', '', 'ScheduleJob', '', '2018-07-27 14:49:12', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1897', '', '', 'ScheduleJob', '', '2018-07-27 14:49:12', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1898', '', '', 'AuthorizingRealm', '', '2018-07-27 14:49:12', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1899', '', '', 'ScheduleJob', '', '2018-07-27 14:49:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1900', '', '', 'ScheduleJob', '', '2018-07-27 14:49:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1901', '', '', 'ScheduleJob', '', '2018-07-27 14:50:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1902', '', '', 'ScheduleJob', '', '2018-07-27 14:50:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('1903', '', '', 'AbstractApplicationContext', '', '2018-07-27 14:50:08', 'doClose', '', '');
INSERT INTO `sys_log` VALUES ('1904', '', '', 'AbstractApplicationContext', '', '2018-07-27 14:50:08', 'doClose', '', '');
INSERT INTO `sys_log` VALUES ('1905', '', '', 'ContextLoader', '', '2018-07-27 14:50:47', 'initWebApplicationContext', '', '');
INSERT INTO `sys_log` VALUES ('1906', '', '', 'AbstractApplicationContext', '', '2018-07-27 14:50:48', 'prepareRefresh', '', '');
INSERT INTO `sys_log` VALUES ('1907', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:50:48', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('1908', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:50:49', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('1909', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:50:50', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('1910', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:50:51', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('1911', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:50:51', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('1912', '', '', 'PropertiesLoaderSupport', '', '2018-07-27 14:50:52', 'loadProperties', '', '');
INSERT INTO `sys_log` VALUES ('1913', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:53', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1914', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:53', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1915', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:53', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1916', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:54', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1917', '', '', 'DruidDataSource', '', '2018-07-27 14:50:56', 'init', '', '');
INSERT INTO `sys_log` VALUES ('1918', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:56', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1919', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:56', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1920', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:56', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1921', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:56', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1922', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1923', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1924', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1925', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1926', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1927', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1928', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1929', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1930', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1931', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1932', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1933', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1934', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1935', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1936', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1937', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1938', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1939', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1940', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1941', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1942', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1943', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1944', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1945', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1946', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1947', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1948', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1949', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1950', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1951', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1952', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1953', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1954', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1955', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1956', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1957', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1958', '', '', 'AuthorizingRealm', '', '2018-07-27 14:50:57', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('1959', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1960', '', '', 'PostProcessorRegistrationDelegate$BeanPostProcessorChecker', '', '2018-07-27 14:50:57', 'postProcessAfterInitialization', '', '');
INSERT INTO `sys_log` VALUES ('1961', '', '', 'StdSchedulerFactory', '', '2018-07-27 14:50:58', 'instantiate', '', '');
INSERT INTO `sys_log` VALUES ('1962', '', '', 'SchedulerSignalerImpl', '', '2018-07-27 14:50:58', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('1963', '', '', 'QuartzScheduler', '', '2018-07-27 14:50:58', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('1964', '', '', 'JobStoreSupport', '', '2018-07-27 14:50:58', 'initialize', '', '');
INSERT INTO `sys_log` VALUES ('1965', '', '', 'JobStoreCMT', '', '2018-07-27 14:50:58', 'initialize', '', '');
INSERT INTO `sys_log` VALUES ('1966', '', '', 'QuartzScheduler', '', '2018-07-27 14:50:58', 'initialize', '', '');
INSERT INTO `sys_log` VALUES ('1967', '', '', 'StdSchedulerFactory', '', '2018-07-27 14:50:58', 'instantiate', '', '');
INSERT INTO `sys_log` VALUES ('1968', '', '', 'StdSchedulerFactory', '', '2018-07-27 14:50:58', 'instantiate', '', '');
INSERT INTO `sys_log` VALUES ('1969', '', '', 'QuartzScheduler', '', '2018-07-27 14:50:58', 'setJobFactory', '', '');
INSERT INTO `sys_log` VALUES ('1970', '', '', 'AbstractUrlHandlerMapping', '', '2018-07-27 14:51:00', 'registerHandler', '', '');
INSERT INTO `sys_log` VALUES ('1971', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1972', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1973', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1974', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1975', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1976', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1977', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1978', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1979', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1980', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1981', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1982', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1983', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1984', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1985', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1986', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1987', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1988', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1989', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1990', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1991', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1992', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1993', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1994', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1995', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1996', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1997', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1998', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('1999', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2000', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2001', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2002', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2003', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2004', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2005', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2006', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2007', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2008', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2009', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2010', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2011', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2012', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2013', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2014', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2015', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2016', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2017', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2018', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2019', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2020', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2021', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2022', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2023', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2024', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2025', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2026', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2027', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2028', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2029', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2030', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2031', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2032', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2033', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2034', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2035', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2036', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2037', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2038', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2039', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2040', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2041', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2042', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2043', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2044', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2045', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2046', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2047', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2048', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2049', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2050', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2051', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2052', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2053', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2054', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2055', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2056', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2057', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2058', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2059', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2060', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2061', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2062', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2063', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2064', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2065', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2066', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2067', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2068', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2069', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2070', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2071', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2072', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2073', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2074', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2075', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2076', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2077', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2078', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2079', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2080', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2081', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2082', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2083', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2084', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2085', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2086', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2087', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2088', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2089', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2090', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2091', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2092', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2093', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2094', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2095', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2096', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2097', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2098', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2099', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2100', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2101', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2102', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2103', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2104', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2105', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2106', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2107', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2108', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2109', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2110', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2111', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2112', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2113', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2114', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2115', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2116', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2117', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:00', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2118', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2119', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2120', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2121', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2122', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2123', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2124', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2125', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2126', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2127', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2128', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2129', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2130', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2131', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2132', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2133', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2134', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2135', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2136', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2137', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2138', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2139', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2140', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2141', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2142', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2143', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2144', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2145', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2146', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2147', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2148', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2149', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2150', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2151', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2152', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2153', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2154', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2155', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2156', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2157', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2158', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2159', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2160', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2161', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2162', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2163', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2164', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2165', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2166', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2167', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2168', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2169', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2170', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2171', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2172', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2173', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2174', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2175', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2176', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2177', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2178', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2179', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2180', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2181', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2182', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2183', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2184', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2185', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2186', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2187', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2188', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2189', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2190', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2191', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2192', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2193', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2194', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2195', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2196', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2197', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2198', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2199', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2200', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2201', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:01', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2202', '', '', 'Version', '', '2018-07-27 14:51:01', '<clinit>', '', '');
INSERT INTO `sys_log` VALUES ('2203', '', '', 'RequestMappingHandlerAdapter', '', '2018-07-27 14:51:02', 'initControllerAdviceCache', '', '');
INSERT INTO `sys_log` VALUES ('2204', '', '', 'RequestMappingHandlerAdapter', '', '2018-07-27 14:51:02', 'initControllerAdviceCache', '', '');
INSERT INTO `sys_log` VALUES ('2205', '', '', 'VelocityViewResolver', '', '2018-07-27 14:51:02', 'initApplicationContext', '', '');
INSERT INTO `sys_log` VALUES ('2206', '', '', 'VelocityConfigurer', '', '2018-07-27 14:51:02', 'postProcessVelocityEngine', '', '');
INSERT INTO `sys_log` VALUES ('2207', '', '', 'FreeMarkerConfigurer', '', '2018-07-27 14:51:03', 'postProcessTemplateLoaders', '', '');
INSERT INTO `sys_log` VALUES ('2208', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2209', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2210', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2211', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2212', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2213', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2214', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2215', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2216', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2217', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2218', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2219', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2220', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2221', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2222', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2223', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2224', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2225', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2226', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2227', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2228', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2229', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2230', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2231', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2232', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2233', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2234', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2235', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2236', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2237', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2238', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2239', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2240', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2241', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2242', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2243', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2244', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2245', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2246', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2247', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2248', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2249', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2250', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2251', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2252', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2253', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2254', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2255', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2256', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2257', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2258', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2259', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2260', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2261', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2262', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2263', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2264', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2265', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2266', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2267', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2268', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2269', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2270', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2271', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2272', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2273', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2274', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2275', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2276', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2277', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2278', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2279', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2280', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2281', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2282', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2283', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2284', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2285', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2286', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2287', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2288', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2289', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2290', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2291', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2292', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2293', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2294', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2295', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2296', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2297', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2298', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2299', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2300', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2301', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2302', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2303', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2304', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2305', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2306', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2307', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2308', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2309', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2310', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2311', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2312', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2313', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2314', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2315', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2316', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2317', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2318', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2319', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2320', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2321', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2322', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2323', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2324', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2325', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2326', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2327', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2328', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2329', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2330', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2331', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2332', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2333', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2334', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2335', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2336', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2337', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2338', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2339', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2340', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2341', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2342', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2343', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2344', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2345', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2346', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2347', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2348', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2349', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2350', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2351', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2352', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2353', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2354', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2355', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2356', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2357', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2358', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2359', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2360', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2361', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2362', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2363', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2364', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2365', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2366', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2367', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2368', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2369', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2370', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2371', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2372', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2373', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2374', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2375', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2376', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2377', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2378', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2379', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2380', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2381', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2382', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2383', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2384', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2385', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2386', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2387', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2388', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2389', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2390', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2391', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2392', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2393', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2394', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2395', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2396', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2397', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2398', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2399', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2400', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2401', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2402', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2403', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2404', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2405', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2406', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2407', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2408', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2409', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2410', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2411', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2412', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2413', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2414', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2415', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2416', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2417', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2418', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2419', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2420', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2421', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2422', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2423', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2424', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2425', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2426', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2427', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2428', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2429', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2430', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2431', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2432', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2433', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2434', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2435', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2436', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2437', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2438', '', '', 'AbstractHandlerMethodMapping', '', '2018-07-27 14:51:03', 'registerHandlerMethod', '', '');
INSERT INTO `sys_log` VALUES ('2439', '', '', 'DefaultLifecycleProcessor$LifecycleGroup', '', '2018-07-27 14:51:03', 'start', '', '');
INSERT INTO `sys_log` VALUES ('2440', '', '', 'SchedulerFactoryBean', '', '2018-07-27 14:51:03', 'startScheduler', '', '');
INSERT INTO `sys_log` VALUES ('2441', '', '', 'ContextLoader', '', '2018-07-27 14:51:03', 'initWebApplicationContext', '', '');
INSERT INTO `sys_log` VALUES ('2442', '', '', 'FrameworkServlet', '', '2018-07-27 14:51:03', 'initServletBean', '', '');
INSERT INTO `sys_log` VALUES ('2443', '', '', 'AbstractApplicationContext', '', '2018-07-27 14:51:03', 'prepareRefresh', '', '');
INSERT INTO `sys_log` VALUES ('2444', '', '', 'XmlBeanDefinitionReader', '', '2018-07-27 14:51:03', 'loadBeanDefinitions', '', '');
INSERT INTO `sys_log` VALUES ('2445', '0:0:0:0:0:0:0:1', '系统登陆:2018-07-27 14:51:13', '系统登陆', '登陆成功', '2018-07-27 14:51:13', '登陆', 'admin', null);
INSERT INTO `sys_log` VALUES ('2446', '', '', 'FrameworkServlet', '', '2018-07-27 14:51:04', 'initServletBean', '', '');
INSERT INTO `sys_log` VALUES ('2447', '', '', 'UserRealm', '', '2018-07-27 14:51:13', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('2448', '', '', 'UserRealm', '', '2018-07-27 14:51:13', 'doGetAuthenticationInfo', '', '');
INSERT INTO `sys_log` VALUES ('2449', '0:0:0:0:0:0:0:1', '', 'SysLoginController', '', '2018-07-27 14:51:13', 'login', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('2450', '', '', 'ServletToolboxManager', '', '2018-07-27 14:51:14', 'getInstance', '', '');
INSERT INTO `sys_log` VALUES ('2451', '', '', 'XMLToolboxManager', '', '2018-07-27 14:51:14', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('2452', '', '', 'ServletToolboxManager', '', '2018-07-27 14:51:14', '<init>', '', '');
INSERT INTO `sys_log` VALUES ('2453', '', '', 'AuthorizingRealm', '', '2018-07-27 14:51:18', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('2454', '', '', 'AuthorizingRealm', '', '2018-07-27 14:51:18', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('2455', '', '', 'AuthorizingRealm', '', '2018-07-27 14:51:18', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('2456', '', '', 'AuthorizingRealm', '', '2018-07-27 14:51:18', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('2457', '', '', 'AuthorizingRealm', '', '2018-07-27 14:51:18', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('2458', '', '', 'AuthorizingRealm', '', '2018-07-27 14:51:18', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('2459', '', '', 'AuthorizingRealm', '', '2018-07-27 14:51:18', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('2460', '0:0:0:0:0:0:0:1', '', 'AuthorizingRealm', '', '2018-07-27 14:51:18', 'getAuthorizationCacheLazy', '', '用户登陆');
INSERT INTO `sys_log` VALUES ('2461', '', '', 'AuthorizingRealm', '', '2018-07-27 14:51:22', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('2462', '', '', 'AuthorizingRealm', '', '2018-07-27 14:51:23', 'getAuthorizationCacheLazy', '', '');
INSERT INTO `sys_log` VALUES ('2463', '', '', 'SchedulerFactoryBean$1', '', '2018-07-27 14:52:03', 'run', '', '');
INSERT INTO `sys_log` VALUES ('2464', '', '', 'JobStoreSupport', '', '2018-07-27 14:52:03', 'logWarnIfNonZero', '', '');
INSERT INTO `sys_log` VALUES ('2465', '', '', 'JobStoreSupport', '', '2018-07-27 14:52:03', 'clusterRecover', '', '');
INSERT INTO `sys_log` VALUES ('2466', '', '', 'QuartzScheduler', '', '2018-07-27 14:52:03', 'start', '', '');
INSERT INTO `sys_log` VALUES ('2467', '', '', 'JobStoreSupport', '', '2018-07-27 14:52:03', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('2468', '', '', 'JobStoreSupport', '', '2018-07-27 14:52:03', 'recoverMisfiredJobs', '', '');
INSERT INTO `sys_log` VALUES ('2469', '', '', 'ScheduleJob', '', '2018-07-27 14:52:03', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2470', '', '', 'ScheduleJob', '', '2018-07-27 14:52:03', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2471', '', '', 'ScheduleJob', '', '2018-07-27 14:52:03', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2472', '', '', 'ScheduleJob', '', '2018-07-27 14:52:03', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2473', '', '', 'ScheduleJob', '', '2018-07-27 14:52:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2474', '', '', 'ScheduleJob', '', '2018-07-27 14:52:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2475', '', '', 'ScheduleJob', '', '2018-07-27 14:53:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2476', '', '', 'ScheduleJob', '', '2018-07-27 14:53:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2477', '', '', 'ScheduleJob', '', '2018-07-27 14:53:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2478', '', '', 'ScheduleJob', '', '2018-07-27 14:53:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2479', '', '', 'ScheduleJob', '', '2018-07-27 14:54:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2480', '', '', 'ScheduleJob', '', '2018-07-27 14:54:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2481', '', '', 'ScheduleJob', '', '2018-07-27 14:54:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2482', '', '', 'ScheduleJob', '', '2018-07-27 14:54:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2483', '', '', 'ScheduleJob', '', '2018-07-27 14:55:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2484', '', '', 'ScheduleJob', '', '2018-07-27 14:55:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2485', '', '', 'ScheduleJob', '', '2018-07-27 14:55:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2486', '', '', 'ScheduleJob', '', '2018-07-27 14:55:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2487', '', '', 'ScheduleJob', '', '2018-07-27 14:56:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2488', '', '', 'ScheduleJob', '', '2018-07-27 14:56:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2489', '', '', 'ScheduleJob', '', '2018-07-27 14:56:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2490', '', '', 'ScheduleJob', '', '2018-07-27 14:56:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2491', '', '', 'ScheduleJob', '', '2018-07-27 14:57:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2492', '', '', 'ScheduleJob', '', '2018-07-27 14:57:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2493', '', '', 'ScheduleJob', '', '2018-07-27 14:57:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2494', '', '', 'ScheduleJob', '', '2018-07-27 14:57:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2495', '', '', 'ScheduleJob', '', '2018-07-27 14:58:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2496', '', '', 'ScheduleJob', '', '2018-07-27 14:58:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2497', '', '', 'ScheduleJob', '', '2018-07-27 14:58:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2498', '', '', 'ScheduleJob', '', '2018-07-27 14:58:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2499', '', '', 'ScheduleJob', '', '2018-07-27 14:59:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2500', '', '', 'ScheduleJob', '', '2018-07-27 14:59:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2501', '', '', 'ScheduleJob', '', '2018-07-27 14:59:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2502', '', '', 'ScheduleJob', '', '2018-07-27 14:59:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2503', '', '', 'ScheduleJob', '', '2018-07-27 15:00:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2504', '', '', 'ScheduleJob', '', '2018-07-27 15:00:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2505', '', '', 'ScheduleJob', '', '2018-07-27 15:00:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2506', '', '', 'ScheduleJob', '', '2018-07-27 15:00:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2507', '', '', 'ScheduleJob', '', '2018-07-27 15:01:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2508', '', '', 'ScheduleJob', '', '2018-07-27 15:01:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2509', '', '', 'ScheduleJob', '', '2018-07-27 15:01:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2510', '', '', 'ScheduleJob', '', '2018-07-27 15:01:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2511', '', '', 'ScheduleJob', '', '2018-07-27 15:02:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2512', '', '', 'ScheduleJob', '', '2018-07-27 15:02:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2513', '', '', 'ScheduleJob', '', '2018-07-27 15:02:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2514', '', '', 'ScheduleJob', '', '2018-07-27 15:02:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2515', '', '', 'ScheduleJob', '', '2018-07-27 15:03:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2516', '', '', 'ScheduleJob', '', '2018-07-27 15:03:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2517', '', '', 'ScheduleJob', '', '2018-07-27 15:03:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2518', '', '', 'ScheduleJob', '', '2018-07-27 15:03:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2519', '', '', 'ScheduleJob', '', '2018-07-27 15:04:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2520', '', '', 'ScheduleJob', '', '2018-07-27 15:04:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2521', '', '', 'ScheduleJob', '', '2018-07-27 15:04:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2522', '', '', 'ScheduleJob', '', '2018-07-27 15:04:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2523', '', '', 'ScheduleJob', '', '2018-07-27 15:05:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2524', '', '', 'ScheduleJob', '', '2018-07-27 15:05:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2525', '', '', 'ScheduleJob', '', '2018-07-27 15:05:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2526', '', '', 'ScheduleJob', '', '2018-07-27 15:05:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2527', '', '', 'ScheduleJob', '', '2018-07-27 15:06:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2528', '', '', 'ScheduleJob', '', '2018-07-27 15:06:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2529', '', '', 'ScheduleJob', '', '2018-07-27 15:06:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2530', '', '', 'ScheduleJob', '', '2018-07-27 15:06:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2531', '', '', 'ScheduleJob', '', '2018-07-27 15:07:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2532', '', '', 'ScheduleJob', '', '2018-07-27 15:07:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2533', '', '', 'ScheduleJob', '', '2018-07-27 15:07:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2534', '', '', 'ScheduleJob', '', '2018-07-27 15:07:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2535', '', '', 'ScheduleJob', '', '2018-07-27 15:08:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2536', '', '', 'ScheduleJob', '', '2018-07-27 15:08:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2537', '', '', 'ScheduleJob', '', '2018-07-27 15:08:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2538', '', '', 'ScheduleJob', '', '2018-07-27 15:08:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2539', '', '', 'ScheduleJob', '', '2018-07-27 15:09:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2540', '', '', 'ScheduleJob', '', '2018-07-27 15:09:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2541', '', '', 'ScheduleJob', '', '2018-07-27 15:09:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2542', '', '', 'ScheduleJob', '', '2018-07-27 15:09:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2543', '', '', 'ScheduleJob', '', '2018-07-27 15:10:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2544', '', '', 'ScheduleJob', '', '2018-07-27 15:10:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2545', '', '', 'ScheduleJob', '', '2018-07-27 15:10:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2546', '', '', 'ScheduleJob', '', '2018-07-27 15:10:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2547', '', '', 'ScheduleJob', '', '2018-07-27 15:11:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2548', '', '', 'ScheduleJob', '', '2018-07-27 15:11:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2549', '', '', 'ScheduleJob', '', '2018-07-27 15:11:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2550', '', '', 'ScheduleJob', '', '2018-07-27 15:11:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2551', '', '', 'ScheduleJob', '', '2018-07-27 15:12:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2552', '', '', 'ScheduleJob', '', '2018-07-27 15:12:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2553', '', '', 'ScheduleJob', '', '2018-07-27 15:12:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2554', '', '', 'ScheduleJob', '', '2018-07-27 15:12:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2555', '', '', 'ScheduleJob', '', '2018-07-27 15:13:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2556', '', '', 'ScheduleJob', '', '2018-07-27 15:13:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2557', '', '', 'ScheduleJob', '', '2018-07-27 15:13:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2558', '', '', 'ScheduleJob', '', '2018-07-27 15:13:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2559', '', '', 'ScheduleJob', '', '2018-07-27 15:14:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2560', '', '', 'ScheduleJob', '', '2018-07-27 15:14:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2561', '', '', 'ScheduleJob', '', '2018-07-27 15:14:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2562', '', '', 'ScheduleJob', '', '2018-07-27 15:14:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2563', '', '', 'ScheduleJob', '', '2018-07-27 15:15:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2564', '', '', 'ScheduleJob', '', '2018-07-27 15:15:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2565', '', '', 'ScheduleJob', '', '2018-07-27 15:15:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2566', '', '', 'ScheduleJob', '', '2018-07-27 15:15:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2567', '', '', 'ScheduleJob', '', '2018-07-27 15:16:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2568', '', '', 'ScheduleJob', '', '2018-07-27 15:16:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2569', '', '', 'ScheduleJob', '', '2018-07-27 15:16:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2570', '', '', 'ScheduleJob', '', '2018-07-27 15:16:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2571', '', '', 'ScheduleJob', '', '2018-07-27 15:17:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2572', '', '', 'ScheduleJob', '', '2018-07-27 15:17:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2573', '', '', 'ScheduleJob', '', '2018-07-27 15:17:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2574', '', '', 'ScheduleJob', '', '2018-07-27 15:17:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2575', '', '', 'ScheduleJob', '', '2018-07-27 15:18:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2576', '', '', 'ScheduleJob', '', '2018-07-27 15:18:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2577', '', '', 'ScheduleJob', '', '2018-07-27 15:18:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2578', '', '', 'ScheduleJob', '', '2018-07-27 15:18:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2579', '', '', 'ScheduleJob', '', '2018-07-27 15:19:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2580', '', '', 'ScheduleJob', '', '2018-07-27 15:19:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2581', '', '', 'ScheduleJob', '', '2018-07-27 15:19:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2582', '', '', 'ScheduleJob', '', '2018-07-27 15:19:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2583', '', '', 'ScheduleJob', '', '2018-07-27 15:20:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2584', '', '', 'ScheduleJob', '', '2018-07-27 15:20:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2585', '', '', 'ScheduleJob', '', '2018-07-27 15:20:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2586', '', '', 'ScheduleJob', '', '2018-07-27 15:20:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2587', '', '', 'ScheduleJob', '', '2018-07-27 15:21:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2588', '', '', 'ScheduleJob', '', '2018-07-27 15:21:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2589', '', '', 'ScheduleJob', '', '2018-07-27 15:21:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2590', '', '', 'ScheduleJob', '', '2018-07-27 15:21:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2591', '', '', 'ScheduleJob', '', '2018-07-27 15:22:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2592', '', '', 'ScheduleJob', '', '2018-07-27 15:22:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2593', '', '', 'ScheduleJob', '', '2018-07-27 15:22:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2594', '', '', 'ScheduleJob', '', '2018-07-27 15:22:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2595', '', '', 'ScheduleJob', '', '2018-07-27 15:23:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2596', '', '', 'ScheduleJob', '', '2018-07-27 15:23:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2597', '', '', 'ScheduleJob', '', '2018-07-27 15:23:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2598', '', '', 'ScheduleJob', '', '2018-07-27 15:23:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2599', '', '', 'ScheduleJob', '', '2018-07-27 15:24:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2600', '', '', 'ScheduleJob', '', '2018-07-27 15:24:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2601', '', '', 'ScheduleJob', '', '2018-07-27 15:24:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2602', '', '', 'ScheduleJob', '', '2018-07-27 15:24:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2603', '', '', 'ScheduleJob', '', '2018-07-27 15:25:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2604', '', '', 'ScheduleJob', '', '2018-07-27 15:25:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2605', '', '', 'ScheduleJob', '', '2018-07-27 15:25:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2606', '', '', 'ScheduleJob', '', '2018-07-27 15:25:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2607', '', '', 'ScheduleJob', '', '2018-07-27 15:26:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2608', '', '', 'ScheduleJob', '', '2018-07-27 15:26:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2609', '', '', 'ScheduleJob', '', '2018-07-27 15:26:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2610', '', '', 'ScheduleJob', '', '2018-07-27 15:26:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2611', '', '', 'ScheduleJob', '', '2018-07-27 15:27:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2612', '', '', 'ScheduleJob', '', '2018-07-27 15:27:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2613', '', '', 'ScheduleJob', '', '2018-07-27 15:27:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2614', '', '', 'ScheduleJob', '', '2018-07-27 15:27:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2615', '', '', 'ScheduleJob', '', '2018-07-27 15:28:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2616', '', '', 'ScheduleJob', '', '2018-07-27 15:28:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2617', '', '', 'ScheduleJob', '', '2018-07-27 15:28:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2618', '', '', 'ScheduleJob', '', '2018-07-27 15:28:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2619', '', '', 'ScheduleJob', '', '2018-07-27 15:29:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2620', '', '', 'ScheduleJob', '', '2018-07-27 15:29:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2621', '', '', 'ScheduleJob', '', '2018-07-27 15:29:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2622', '', '', 'ScheduleJob', '', '2018-07-27 15:29:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2623', '', '', 'ScheduleJob', '', '2018-07-27 15:30:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2624', '', '', 'ScheduleJob', '', '2018-07-27 15:30:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2625', '', '', 'ScheduleJob', '', '2018-07-27 15:30:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2626', '', '', 'ScheduleJob', '', '2018-07-27 15:30:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2627', '', '', 'ScheduleJob', '', '2018-07-27 15:31:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2628', '', '', 'ScheduleJob', '', '2018-07-27 15:31:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2629', '', '', 'ScheduleJob', '', '2018-07-27 15:31:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2630', '', '', 'ScheduleJob', '', '2018-07-27 15:31:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2631', '', '', 'ScheduleJob', '', '2018-07-27 15:32:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2632', '', '', 'ScheduleJob', '', '2018-07-27 15:32:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2633', '', '', 'ScheduleJob', '', '2018-07-27 15:32:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2634', '', '', 'ScheduleJob', '', '2018-07-27 15:32:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2635', '', '', 'ScheduleJob', '', '2018-07-27 15:33:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2636', '', '', 'ScheduleJob', '', '2018-07-27 15:33:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2637', '', '', 'ScheduleJob', '', '2018-07-27 15:33:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2638', '', '', 'ScheduleJob', '', '2018-07-27 15:33:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2639', '', '', 'ScheduleJob', '', '2018-07-27 15:34:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2640', '', '', 'ScheduleJob', '', '2018-07-27 15:34:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2641', '', '', 'ScheduleJob', '', '2018-07-27 15:34:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2642', '', '', 'ScheduleJob', '', '2018-07-27 15:34:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2643', '', '', 'ScheduleJob', '', '2018-07-27 15:35:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2644', '', '', 'ScheduleJob', '', '2018-07-27 15:35:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2645', '', '', 'ScheduleJob', '', '2018-07-27 15:35:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2646', '', '', 'ScheduleJob', '', '2018-07-27 15:35:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2647', '', '', 'ScheduleJob', '', '2018-07-27 15:36:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2648', '', '', 'ScheduleJob', '', '2018-07-27 15:36:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2649', '', '', 'ScheduleJob', '', '2018-07-27 15:36:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2650', '', '', 'ScheduleJob', '', '2018-07-27 15:36:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2651', '', '', 'ScheduleJob', '', '2018-07-27 15:37:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2652', '', '', 'ScheduleJob', '', '2018-07-27 15:37:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2653', '', '', 'ScheduleJob', '', '2018-07-27 15:37:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2654', '', '', 'ScheduleJob', '', '2018-07-27 15:37:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2655', '', '', 'ScheduleJob', '', '2018-07-27 15:38:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2656', '', '', 'ScheduleJob', '', '2018-07-27 15:38:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2657', '', '', 'ScheduleJob', '', '2018-07-27 15:38:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2658', '', '', 'ScheduleJob', '', '2018-07-27 15:38:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2659', '', '', 'ScheduleJob', '', '2018-07-27 15:39:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2660', '', '', 'ScheduleJob', '', '2018-07-27 15:39:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2661', '', '', 'ScheduleJob', '', '2018-07-27 15:39:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2662', '', '', 'ScheduleJob', '', '2018-07-27 15:39:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2663', '', '', 'ScheduleJob', '', '2018-07-27 15:40:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2664', '', '', 'ScheduleJob', '', '2018-07-27 15:40:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2665', '', '', 'ScheduleJob', '', '2018-07-27 15:40:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2666', '', '', 'ScheduleJob', '', '2018-07-27 15:40:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2667', '', '', 'ScheduleJob', '', '2018-07-27 15:41:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2668', '', '', 'ScheduleJob', '', '2018-07-27 15:41:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2669', '', '', 'ScheduleJob', '', '2018-07-27 15:41:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2670', '', '', 'ScheduleJob', '', '2018-07-27 15:41:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2671', '', '', 'ScheduleJob', '', '2018-07-27 15:42:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2672', '', '', 'ScheduleJob', '', '2018-07-27 15:42:00', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2673', '', '', 'ScheduleJob', '', '2018-07-27 15:42:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2674', '', '', 'ScheduleJob', '', '2018-07-27 15:42:30', 'executeInternal', '', '');
INSERT INTO `sys_log` VALUES ('2675', '', '', 'ScheduleJob', '', '2018-07-27 15:43:00', 'executeInternal', '', '');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(200) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(200) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `perms` varchar(400) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `open` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_id_UNIQUE` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('200', '0', '系统管理', null, null, '0', null, '1', 'true');
INSERT INTO `sys_menu` VALUES ('201', '200', '用户管理', 'sys/user.html', 'sys:user:list,sys:user:save,sys:user:update,sys:user:delete,sys:user:info', '1', null, '1', 'true');
INSERT INTO `sys_menu` VALUES ('202', '200', '菜单管理', 'sys/menu.html', 'sys:menu:list,sys:menu:save,sys:menu:update,sys:menu:delete,sys:menu:select,sys:menu:perms,sys:menu:info', '1', null, '2', 'true');
INSERT INTO `sys_menu` VALUES ('203', '200', '角色管理', 'sys/role.html', 'sys:role:list,sys:role:save,sys:role:update,sys:role:delete,sys:role:select,sys:role:info', '1', null, '3', 'true');
INSERT INTO `sys_menu` VALUES ('204', '200', '配置管理', 'sys/config.html', 'sys:config:list,sys:config:save,sys:config:update,sys:config:delete,sys:config:info', '1', null, '4', 'true');
INSERT INTO `sys_menu` VALUES ('205', '200', '定时任务管理', 'sys/schedule.html', 'sys:schedule:list,sys:schedule:save,sys:schedule:update,sys:schedule:delete,sys:schedule:run,sys:schedule:info', '1', null, '5', 'true');
INSERT INTO `sys_menu` VALUES ('206', '200', '定时任务日志', 'sys/schedule_log.html', 'sys:schedule:log,sys:schedule:info', '1', null, '6', 'true');
INSERT INTO `sys_menu` VALUES ('207', '200', '代码生成器', 'sys/generator.html', 'sys:generator:list,sys:generator:code', '1', null, '7', 'true');
INSERT INTO `sys_menu` VALUES ('208', '200', '日志管理', 'sys/log.html', 'sys:log:list,sys:log:info', '1', null, '8', 'true');
INSERT INTO `sys_menu` VALUES ('209', '200', '通知中心', 'sys/notice.html', 'sys:notice:list,sys:notice:save,sys:notice:update,sys:notice:info', '1', null, '9', 'true');
INSERT INTO `sys_menu` VALUES ('210', '0', '业务相关', '', '', '0', null, '2', 'true');
INSERT INTO `sys_menu` VALUES ('211', '210', '微信小视频管理', 'bus/wx_video.html', 'bus:wx:video:list,bus:wx:video:save,bus:wx:video:info,bus:wx:video:delete', '1', null, '1', 'true');
INSERT INTO `sys_menu` VALUES ('212', '0', '参考样例', null, null, '0', null, '3', 'true');
INSERT INTO `sys_menu` VALUES ('213', '212', '图表展示', 'demo/echart.html', 'demo:echart:show', '1', null, '1', 'true');
INSERT INTO `sys_menu` VALUES ('214', '200', '组织机构管理', 'sys/org.html', 'org:list,org:delete,org:save,org:update', '1', null, '2', null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(100) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `create_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_id_UNIQUE` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('999', '管理员', '管理员', '2016-01-01 12:33:33');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(100) NOT NULL,
  `menu_id` bigint(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('999', '200');
INSERT INTO `sys_role_menu` VALUES ('999', '201');
INSERT INTO `sys_role_menu` VALUES ('999', '202');
INSERT INTO `sys_role_menu` VALUES ('999', '203');
INSERT INTO `sys_role_menu` VALUES ('999', '204');
INSERT INTO `sys_role_menu` VALUES ('999', '205');
INSERT INTO `sys_role_menu` VALUES ('999', '206');
INSERT INTO `sys_role_menu` VALUES ('999', '207');

-- ----------------------------
-- Table structure for sys_unit
-- ----------------------------
DROP TABLE IF EXISTS `sys_unit`;
CREATE TABLE `sys_unit` (
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `code` varchar(20) NOT NULL,
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(20) DEFAULT NULL,
  `address` text,
  `email` varchar(30) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `parentId` varchar(50) DEFAULT NULL,
  `hasChildren` tinyint(1) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `createTime` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统机构表';

-- ----------------------------
-- Records of sys_unit
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(100) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', '253479240@qq.com', '18055150696', '1', '2016-01-01 11:22:33');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(100) DEFAULT NULL,
  `role_id` bigint(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '999');
