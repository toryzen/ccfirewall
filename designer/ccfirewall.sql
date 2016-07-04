/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.30 : Database - community_ccfirewall
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`community_ccfirewall` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `community_ccfirewall`;

/*Table structure for table `block_log` */

DROP TABLE IF EXISTS `block_log`;

CREATE TABLE `block_log` (
  `block_time` datetime DEFAULT NULL,
  `block_second` int(11) DEFAULT NULL COMMENT '封停秒数',
  `block_reason` varchar(10) DEFAULT NULL COMMENT '全局规则为0,特殊规则为1',
  `server_ip` varchar(15) DEFAULT NULL,
  `block_ip` varchar(35) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL COMMENT '1:success -1:already -2:iperror -3:passerr -4:flag',
  `result` text,
  `cuuid` varchar(50) DEFAULT NULL,
  KEY `block_time` (`block_time`),
  KEY `server_ip` (`server_ip`),
  KEY `block_ip` (`block_ip`),
  KEY `flag` (`flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `block_server_log` */

DROP TABLE IF EXISTS `block_server_log`;

CREATE TABLE `block_server_log` (
  `updatetime` datetime DEFAULT NULL,
  `server_ip` varchar(155) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  KEY `updatetime` (`updatetime`),
  KEY `url` (`server_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `block_url_log` */

DROP TABLE IF EXISTS `block_url_log`;

CREATE TABLE `block_url_log` (
  `updatetime` datetime DEFAULT NULL,
  `url` varchar(155) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  KEY `updatetime` (`updatetime`),
  KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ip_frequency` */

DROP TABLE IF EXISTS `ip_frequency`;

CREATE TABLE `ip_frequency` (
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `cnt` int(11) NOT NULL COMMENT 'IP计数',
  `ip` varchar(35) NOT NULL COMMENT 'IP',
  `direct_nginx` tinyint(4) NOT NULL COMMENT '是否直接请求nginx,1为真',
  `area` varchar(100) DEFAULT NULL COMMENT '地域',
  `country` varchar(35) DEFAULT NULL COMMENT '国家',
  `province` varchar(4) DEFAULT NULL COMMENT '省份',
  `starttime` datetime DEFAULT NULL COMMENT '本次开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '本次结束时间',
  `during` int(11) DEFAULT NULL COMMENT '所用时间(秒)',
  `alerts` tinyint(4) DEFAULT NULL COMMENT '封停标志,-1关闭封停,-2白名单,0未超时,1封停,2警告,-3不是黑名单',
  `block_reason` varchar(10) DEFAULT NULL COMMENT '全局规则为0,特殊规则为1',
  `detail` text COMMENT '完整信息',
  `sdetail` text COMMENT 'Squid完整信息',
  `cuuid` varchar(50) DEFAULT NULL COMMENT 'UUID',
  KEY `alerts` (`alerts`),
  KEY `updatetime` (`updatetime`),
  KEY `uuid` (`cuuid`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ip_frequency_del` */

DROP TABLE IF EXISTS `ip_frequency_del`;

CREATE TABLE `ip_frequency_del` (
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `cnt` int(11) DEFAULT NULL COMMENT 'ip次数',
  `ip` varchar(35) NOT NULL COMMENT 'IP',
  `direct_nginx` tinyint(4) NOT NULL COMMENT '是否直接请求nginx,1为真',
  `area` varchar(100) DEFAULT NULL COMMENT '地域',
  `country` varchar(35) DEFAULT NULL COMMENT '国家',
  `province` varchar(4) DEFAULT NULL COMMENT '省份',
  `starttime` datetime DEFAULT NULL COMMENT '本次开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '本次结束时间',
  `during` int(11) DEFAULT NULL COMMENT '所用时间(秒)',
  `detail` text COMMENT '完整信息',
  `sdetail` text COMMENT 'Squid完整信息',
  `cuuid` varchar(50) DEFAULT NULL COMMENT 'UUID',
  KEY `updatetime` (`updatetime`),
  KEY `uuid` (`cuuid`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `unblock_log` */

DROP TABLE IF EXISTS `unblock_log`;

CREATE TABLE `unblock_log` (
  `unblock_time` datetime DEFAULT NULL,
  `block_time` datetime DEFAULT NULL,
  `block_second` int(11) DEFAULT NULL COMMENT '封停秒数',
  `block_reason` varchar(10) DEFAULT NULL COMMENT '全局规则为0,特殊规则为1',
  `server_ip` varchar(15) DEFAULT NULL,
  `block_ip` varchar(35) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL COMMENT '1:success -1:already -2:iperror -3:passerr -4:flag',
  `result` text,
  `cuuid` varchar(50) DEFAULT NULL,
  KEY `unblock_time` (`block_time`),
  KEY `block_time` (`block_time`),
  KEY `server_ip` (`server_ip`),
  KEY `block_ip` (`block_ip`),
  KEY `flag` (`flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
