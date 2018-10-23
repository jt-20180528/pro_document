/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.12 : Database - op
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`op` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `op2;

/*Table structure for table `t_bet_order` */

DROP TABLE IF EXISTS `t_bet_order`;

CREATE TABLE `t_bet_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_CODE` varchar(10) NOT NULL COMMENT '租户代号',
  `USER_ID` int(11) NOT NULL COMMENT '用户ID',
  `USER_NAME` varchar(16) NOT NULL COMMENT '用户帐号',
  `ORDERNO` varchar(40) NOT NULL COMMENT '投注单号',
  `BATCH_ORDERNO` varchar(40) DEFAULT NULL COMMENT '单次投注记录批处理单号',
  `GAME_ID` int(11) NOT NULL COMMENT '彩种ID',
  `LOTTERY_NUMBER_ID` int(11) NOT NULL COMMENT '彩种期号ID',
  `BET_ID` int(11) NOT NULL COMMENT '投注类型Id',
  `BET_SINGLE_AMOUNT` decimal(15,5) DEFAULT '0.00000' COMMENT '单注金额 - 2元',
  `BET_MULTIPLE` int(11) DEFAULT '1' COMMENT '投注倍数',
  `BET_COUNT` int(11) NOT NULL COMMENT '投注注数',
  `BET_DIGITS` varchar(100) NOT NULL COMMENT '投注位',
  `BET_NUMBER` longtext NOT NULL COMMENT '投注号码',
  `BET_REBATE_STATUS` tinyint(2) DEFAULT NULL COMMENT '投注返点派发状态',
  `BET_SECRET` varchar(32) DEFAULT NULL COMMENT '投注加密信息',
  `BET_TIME` timestamp NOT NULL COMMENT '投注时间',
  `BET_TOTAL_AMOUNT` decimal(15,5) DEFAULT '0.00000' COMMENT '投注总额',
  `BET_WAY` tinyint(2) DEFAULT NULL COMMENT '投注方式,0普通，1追号',
  `LOTTERY_NUMBER` varchar(100) DEFAULT NULL COMMENT '开奖号码',
  `ORDER_STATUS` tinyint(2) DEFAULT NULL COMMENT '订单状态',
  `WIN_AMOUNT` decimal(15,5) DEFAULT '0.00000' COMMENT '中奖金额',
  `WIN_COUNT` int(11) DEFAULT '0' COMMENT '中奖注数',
  `WIN_SECRET` varchar(32) DEFAULT NULL COMMENT 'WIN_SECRET',
  `WIN_STATUS` tinyint(2) DEFAULT NULL COMMENT '开奖状态',
  `AGENT_REBATE_STATUS` tinyint(2) DEFAULT NULL COMMENT '代理返点派发状态',
  `AGENT_REBATE_AMOUNT` decimal(15,5) DEFAULT NULL COMMENT '代理返点金额（取消， 不做统计）',
  `AWARD_STATUS` tinyint(2) DEFAULT NULL COMMENT '派奖状态',
  `AWARD_TIME` timestamp NULL DEFAULT NULL COMMENT '派奖时间',
  `REBATE_AMOUNT` decimal(15,5) DEFAULT '0.00000' COMMENT '投注返点金额',
  `REBATE_CHOOSE` decimal(15,5) DEFAULT '0.00000' COMMENT '所选返点',
  `REBATE_USER` decimal(15,5) DEFAULT NULL COMMENT '用户返点',
  `CHASE_NUMBER_ID` int(11) DEFAULT NULL COMMENT '追号号码ID',
  `CHASE_ORDER_ID` int(11) DEFAULT NULL COMMENT '追号记录ID',
  `ODDS` decimal(15,5) DEFAULT '0.00000' COMMENT '赔率',
  `DEVICE` tinyint(2) DEFAULT NULL COMMENT '投注设备',
  `LAST_MODIFIED_BY` varchar(16) DEFAULT NULL COMMENT '最后修改人',
  `LAST_MODIFIED_DATE` timestamp NULL DEFAULT NULL COMMENT '最后修改时间',
  `ADAPT` tinyint(2) DEFAULT '0' COMMENT '适应赔率(如果为0,取本表的odds字段作为赔率),如果为1,则取赔率表的赔率开奖',
  `PLATFORM_TYPE` tinyint(2) NOT NULL COMMENT '平台类型',
  `ROOM_ID` int(11) DEFAULT NULL COMMENT '房间id',
  PRIMARY KEY (`id`,`BET_TIME`),
  UNIQUE KEY `IDX_ORDERNO` (`ORDERNO`,`BET_TIME`) USING BTREE,
  KEY `IDX_USER_ID` (`USER_ID`) USING BTREE,
  KEY `IDX_BET_ID` (`BET_ID`) USING BTREE,
  KEY `IDX_LOTTERY_NUMBER_ID` (`LOTTERY_NUMBER_ID`) USING BTREE,
  KEY `IDX.GAME_ID` (`GAME_ID`) USING BTREE,
  KEY `IDX_TENANT_CODE_BET_TIME` (`TENANT_CODE`,`BET_TIME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投注记录表'
PARTITION BY RANGE (unix_timestamp(`BET_TIME`))
(PARTITION t_bet_order_20181008 VALUES LESS THAN (1538928000)  ENGINE = InnoDB,
 PARTITION t_bet_order_20181009 VALUES LESS THAN (1539100800) ENGINE = InnoDB,
 PARTITION t_bet_order_20181010 VALUES LESS THAN (1539187200) ENGINE = InnoDB,
 PARTITION t_bet_order_20181011 VALUES LESS THAN (1539273600) ENGINE = InnoDB,
 PARTITION t_bet_order_20181012 VALUES LESS THAN (1539360000) ENGINE = InnoDB,
 PARTITION t_bet_order_20181013 VALUES LESS THAN (1539446400) ENGINE = InnoDB,
 PARTITION t_bet_order_20181014 VALUES LESS THAN (1539532800) ENGINE = InnoDB,
 PARTITION t_bet_order_20181015 VALUES LESS THAN (1539619200) ENGINE = InnoDB,
 PARTITION t_bet_order_20181016 VALUES LESS THAN (1539705600) ENGINE = InnoDB,
 PARTITION t_bet_order_20181017 VALUES LESS THAN (1539792000) ENGINE = InnoDB,
 PARTITION t_bet_order_20181018 VALUES LESS THAN (1539878400) ENGINE = InnoDB,
 PARTITION t_bet_order_20181019 VALUES LESS THAN (1539964800) ENGINE = InnoDB,
 PARTITION t_bet_order_20181020 VALUES LESS THAN (1540051200) ENGINE = InnoDB,
 PARTITION t_bet_order_20181021 VALUES LESS THAN (1540137600) ENGINE = InnoDB,
 PARTITION t_bet_order_20181022 VALUES LESS THAN (1540224000) ENGINE = InnoDB);

/*Table structure for table `t_lottery_number` */

DROP TABLE IF EXISTS `t_lottery_number`;

CREATE TABLE `t_lottery_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_CODE` varchar(10) DEFAULT NULL COMMENT '租户代号',
  `OPEN_TIME` timestamp NULL DEFAULT NULL COMMENT '开盘时间',
  `CLOSE_TIME` timestamp NULL DEFAULT NULL COMMENT '封盘时间',
  `SCHEDULED_LOTTERY_TIME` timestamp NULL DEFAULT NULL COMMENT '预定开奖时间',
  `LOTTERY_TIME` timestamp NULL DEFAULT NULL COMMENT '实际开奖时间',
  `GAME_ID` int(11) NOT NULL COMMENT '彩种ID',
  `ISSUE` varchar(20) NOT NULL COMMENT '期号',
  `LOTTERY_NUMBER` varchar(96) DEFAULT NULL COMMENT '开奖号码',
  `LOTTERY_TYPE` tinyint(2) DEFAULT NULL COMMENT '开奖方式 1手动；2自动',
  `REBATE_TOTAL` decimal(15,5) DEFAULT '0.00000' COMMENT '返点总额(投注返点+代理返点) ',
  `SECRET` varchar(32) DEFAULT NULL COMMENT '加密信息',
  `STATUS` tinyint(2) NOT NULL COMMENT '状态',
  `WIN_MONEY_TOTAL` decimal(15,5) DEFAULT '0.00000' COMMENT '中奖总额',
  `WIN_ORDERS` int(11) DEFAULT '0' COMMENT '中奖注单数',
  `OPERATE_TIME` timestamp NOT NULL COMMENT '操作时间',
  `OPERATOR` varchar(20) NOT NULL COMMENT '操作者',
  `CRAWLER_TIME_COST` int(11) DEFAULT '0' COMMENT '开奖号码采集耗时',
  `CRAWLER_URL_DESCRIPTION` varchar(20) DEFAULT NULL COMMENT '开奖号码采集来源',
  `REMARK` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`,`OPERATE_TIME`),
  UNIQUE KEY `UNQ_TENANTCODE_GAMEID_ISSUE` (`TENANT_CODE`,`GAME_ID`,`ISSUE`,`OPERATE_TIME`) USING BTREE,
  KEY `IDX_GAME_ID` (`GAME_ID`) USING BTREE,
  KEY `IDX_ISSUE` (`ISSUE`) USING BTREE,
  KEY `IDX_SCHEDULED_LOTTERY_TIME` (`SCHEDULED_LOTTERY_TIME`) USING BTREE,
  KEY `IDX_CLOSE_TIME` (`CLOSE_TIME`) USING BTREE,
  KEY `IDX_TENANT_CODE_OPEN_TIME` (`TENANT_CODE`,`OPEN_TIME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='期号表'
PARTITION BY RANGE (unix_timestamp(`OPERATE_TIME`))
(PARTITION t_lottery_number_20181011 VALUES LESS THAN (1539273600) ENGINE = InnoDB,
 PARTITION t_lottery_number_20181012 VALUES LESS THAN (1539360000) ENGINE = InnoDB,
 PARTITION t_lottery_number_20181013 VALUES LESS THAN (1539446400) ENGINE = InnoDB,
 PARTITION t_lottery_number_20181014 VALUES LESS THAN (1539532800) ENGINE = InnoDB,
 PARTITION t_lottery_number_20181015 VALUES LESS THAN (1539619200) ENGINE = InnoDB,
 PARTITION t_lottery_number_20181016 VALUES LESS THAN (1539705600) ENGINE = InnoDB,
 PARTITION t_lottery_number_20181017 VALUES LESS THAN (1539792000) ENGINE = InnoDB,
 PARTITION t_lottery_number_20181018 VALUES LESS THAN (1539878400) ENGINE = InnoDB,
 PARTITION t_lottery_number_20181019 VALUES LESS THAN (1539964800) ENGINE = InnoDB,
 PARTITION t_lottery_number_20181020 VALUES LESS THAN (1540051200) ENGINE = InnoDB,
 PARTITION t_lottery_number_20181021 VALUES LESS THAN (1540137600) ENGINE = InnoDB,
 PARTITION t_lottery_number_20181022 VALUES LESS THAN (1540224000) ENGINE = InnoDB);

/*Table structure for table `t_report_game` */

DROP TABLE IF EXISTS `t_report_game`;

CREATE TABLE `t_report_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_CODE` varchar(10) NOT NULL COMMENT '租户代号',
  `AUTO_LOTTERY_ISSUE_COUNT` int(11) DEFAULT '0' COMMENT '自动开奖期数',
  `CP_AGENT_REBATE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '已结算彩票代理返点金额',
  `CP_BET_GAIN_TOTAL` decimal(15,5) DEFAULT '0.00000' COMMENT '已结算彩票投注盈亏',
  `CP_BET_ORDERS` int(11) DEFAULT '0' COMMENT '已结算彩票注单数',
  `CP_BET_REBATE_TOTAL` decimal(15,5) DEFAULT '0.00000' COMMENT '已结算彩票投注返点金额',
  `CP_BET_TOTAL` decimal(15,5) DEFAULT '0.00000' COMMENT '已结算彩票投注金额',
  `CP_REAL_GAIN_TOTAL` decimal(15,5) DEFAULT '0.00000' COMMENT '已结算彩票实际盈亏',
  `CP_UNSETTLED_ORDERS` int(11) DEFAULT '0' COMMENT '未结彩票注单数',
  `CP_UNSETTLED_TOTAL` decimal(15,5) DEFAULT '0.00000' COMMENT '彩票未结注单总额',
  `CP_WIN_ORDERS` int(11) DEFAULT '0' COMMENT '已结算彩票中奖注单数',
  `CP_WIN_TOTAL` decimal(15,5) DEFAULT '0.00000' COMMENT '已结算彩票中奖金额',
  `HAND_LOTTERY_ISSUE_COUNT` int(11) DEFAULT '0' COMMENT '人工开奖期数',
  `LOTTERY_ISSUE_COUNT` int(11) DEFAULT '0' COMMENT '开奖期数',
  `OPEN_ISSUE_COUNT` int(11) DEFAULT '0' COMMENT '开盘期数',
  `REPORT_DATE` timestamp NOT NULL COMMENT '报表日期',
  `UNLOTTERY_ISSUE_COUNT` int(11) DEFAULT '0' COMMENT '未开奖期数',
  `GAME_ID` int(11) NOT NULL COMMENT '彩种ID',
  `PLATFORM_TYPE` tinyint(4) NOT NULL COMMENT '平台类型(CT,KG)',
  `COUNT_USER` int(11) DEFAULT '0' COMMENT '该游戏每天玩家人数',
  PRIMARY KEY (`id`,`REPORT_DATE`),
  UNIQUE KEY `UNQ_TENANTCODE_DATE_GAME` (`TENANT_CODE`,`REPORT_DATE`,`GAME_ID`,`PLATFORM_TYPE`) USING BTREE,
  KEY `IDX_TENANT_CODE` (`TENANT_CODE`) USING BTREE,
  KEY `IDX_REPORT_DATE` (`REPORT_DATE`) USING BTREE,
  KEY `IDX_GAME_ID` (`GAME_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏报表'
PARTITION BY RANGE (unix_timestamp(`REPORT_DATE`))
(PARTITION t_report_game_20181008 VALUES LESS THAN (1538928000) ENGINE = InnoDB,
 PARTITION t_report_game_20181009 VALUES LESS THAN (1539100800) ENGINE = InnoDB,
 PARTITION t_report_game_20181010 VALUES LESS THAN (1539187200) ENGINE = InnoDB,
 PARTITION t_report_game_20181011 VALUES LESS THAN (1539273600) ENGINE = InnoDB,
 PARTITION t_report_game_20181012 VALUES LESS THAN (1539360000) ENGINE = InnoDB,
 PARTITION t_report_game_20181013 VALUES LESS THAN (1539446400) ENGINE = InnoDB,
 PARTITION t_report_game_20181014 VALUES LESS THAN (1539532800) ENGINE = InnoDB,
 PARTITION t_report_game_20181015 VALUES LESS THAN (1539619200) ENGINE = InnoDB,
 PARTITION t_report_game_20181016 VALUES LESS THAN (1539705600) ENGINE = InnoDB,
 PARTITION t_report_game_20181017 VALUES LESS THAN (1539792000) ENGINE = InnoDB,
 PARTITION t_report_game_20181018 VALUES LESS THAN (1539878400) ENGINE = InnoDB,
 PARTITION t_report_game_20181019 VALUES LESS THAN (1539964800) ENGINE = InnoDB,
 PARTITION t_report_game_20181020 VALUES LESS THAN (1540051200) ENGINE = InnoDB,
 PARTITION t_report_game_20181021 VALUES LESS THAN (1540137600) ENGINE = InnoDB,
 PARTITION t_report_game_20181022 VALUES LESS THAN (1540224000) ENGINE = InnoDB);

/*Table structure for table `t_report_team` */

DROP TABLE IF EXISTS `t_report_team`;

CREATE TABLE `t_report_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL COMMENT '用户ID',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '直属上级ID',
  `FLOOR` tinyint(4) DEFAULT NULL COMMENT '所在层级',
  `USER_NAME` varchar(16) NOT NULL COMMENT '用户帐号',
  `ACTIVE_USERS` int(11) DEFAULT '0' COMMENT '有效用户数',
  `LOGINED_USERS` int(11) DEFAULT '0' COMMENT '登录用户数',
  `REGISTERED_USERS` int(11) DEFAULT '0' COMMENT '新增注册用户数',
  `RECHARGE_TIMES` int(11) DEFAULT '0' COMMENT '用户充值次数',
  `RECHARGE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '用户充值总额',
  `TRANSFER_TIMES_RI` int(11) DEFAULT '0' COMMENT '上级转入次数',
  `TRAER_TIMES_RO` int(11) DEFAULT '0' COMMENT '转给下级次数',
  `TRANSFER_TOTAL_RI` decimal(18,5) DEFAULT '0.00000' COMMENT '上级转入总额',
  `TRANSFER_TOTAL_RO` decimal(18,5) DEFAULT '0.00000' COMMENT '转给下级总额',
  `BALANCE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '平台账户余额',
  `WITHDRAW_TIMES` int(11) DEFAULT '0' COMMENT '用户提现次数',
  `WITHDRAW_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '用户提现总额',
  `ACTIVITY_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '活动赠送',
  `REPORT_DATE` timestamp NOT NULL COMMENT '报表日期',
  `TENANT_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`REPORT_DATE`),
  UNIQUE KEY `UK_USER_ID_AND_REPORT_DATE` (`USER_ID`,`REPORT_DATE`) USING BTREE,
  KEY `IDX_USER_NAME` (`USER_NAME`) USING BTREE,
  KEY `IDX_REPORT_DATE` (`REPORT_DATE`) USING BTREE,
  KEY `IDX_TENANT_CODE` (`TENANT_CODE`) USING BTREE,
  KEY `IDX_PARENT_ID` (`PARENT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY RANGE (unix_timestamp(`REPORT_DATE`))
(PARTITION t_report_team_20181008 VALUES LESS THAN (1538928000) ENGINE = InnoDB,
 PARTITION t_report_team_20181009 VALUES LESS THAN (1539100800) ENGINE = InnoDB,
 PARTITION t_report_team_20181010 VALUES LESS THAN (1539187200) ENGINE = InnoDB,
 PARTITION t_report_team_20181011 VALUES LESS THAN (1539273600) ENGINE = InnoDB,
 PARTITION t_report_team_20181012 VALUES LESS THAN (1539360000) ENGINE = InnoDB,
 PARTITION t_report_team_20181013 VALUES LESS THAN (1539446400) ENGINE = InnoDB,
 PARTITION t_report_team_20181014 VALUES LESS THAN (1539532800) ENGINE = InnoDB,
 PARTITION t_report_team_20181015 VALUES LESS THAN (1539619200) ENGINE = InnoDB,
 PARTITION t_report_team_20181016 VALUES LESS THAN (1539705600) ENGINE = InnoDB,
 PARTITION t_report_team_20181017 VALUES LESS THAN (1539792000) ENGINE = InnoDB,
 PARTITION t_report_team_20181018 VALUES LESS THAN (1539878400) ENGINE = InnoDB,
 PARTITION t_report_team_20181019 VALUES LESS THAN (1539964800) ENGINE = InnoDB,
 PARTITION t_report_team_20181020 VALUES LESS THAN (1540051200) ENGINE = InnoDB,
 PARTITION t_report_game_20181021 VALUES LESS THAN (1540137600) ENGINE = InnoDB,
 PARTITION t_report_game_20181022 VALUES LESS THAN (1540224000) ENGINE = InnoDB);

/*Table structure for table `t_report_team_platform` */

DROP TABLE IF EXISTS `t_report_team_platform`;

CREATE TABLE `t_report_team_platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL COMMENT '用户ID',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '直属上级ID',
  `FLOOR` tinyint(4) DEFAULT NULL COMMENT '所在层级',
  `USER_NAME` varchar(16) NOT NULL COMMENT '用户帐号',
  `BALANCE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '账户总额',
  `BET_GAIN_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '投注盈亏',
  `BET_ORDERS` int(11) DEFAULT '0' COMMENT '投注单数',
  `BET_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '投注总额',
  `WIN_ORDERS` int(11) DEFAULT '0' COMMENT '中奖单数',
  `WIN_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '中奖总额',
  `AGENT_REBATE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '代理返点金额',
  `BET_REBATE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '投注返点总额',
  `BET_USERS` int(11) DEFAULT '0' COMMENT '投注用户数',
  `REAL_GAIN_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '实际盈亏',
  `PLATFORM_TYPE` tinyint(4) NOT NULL COMMENT '平台类型(CP,KG,AG,BB,MG,PT)',
  `TENANT_CODE` varchar(10) DEFAULT NULL,
  `REPORT_DATE` timestamp NOT NULL COMMENT '报表日期',
  PRIMARY KEY (`id`,`REPORT_DATE`),
  UNIQUE KEY `UNQ_REPORT_DATE_USER_ID_PLATFORM_TYPE` (`REPORT_DATE`,`USER_ID`,`PLATFORM_TYPE`) USING BTREE,
  KEY `IDX_REPOER_DATE` (`REPORT_DATE`),
  KEY `IDX_USER_ID` (`USER_ID`) USING BTREE,
  KEY `IDX_TENANT_CODE` (`TENANT_CODE`) USING BTREE,
  KEY `IDX_PARENT_ID` (`PARENT_ID`) USING BTREE,
  KEY `IDX_TENANT_CODE_REPORT_DATE` (`TENANT_CODE`,`REPORT_DATE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY RANGE (unix_timestamp(`REPORT_DATE`))
(PARTITION t_report_team_platform_20181008 VALUES LESS THAN (1538928000) ENGINE = InnoDB,
 PARTITION t_report_team_platform_20181009 VALUES LESS THAN (1539100800) ENGINE = InnoDB,
 PARTITION t_report_team_platform_20181010 VALUES LESS THAN (1539187200) ENGINE = InnoDB,
 PARTITION t_report_team_platform_20181011 VALUES LESS THAN (1539273600) ENGINE = InnoDB,
 PARTITION t_report_team_platform_20181012 VALUES LESS THAN (1539360000) ENGINE = InnoDB,
 PARTITION t_report_team_platform_20181013 VALUES LESS THAN (1539446400) ENGINE = InnoDB,
 PARTITION t_report_team_platform_20181014 VALUES LESS THAN (1539532800) ENGINE = InnoDB,
 PARTITION t_report_team_platform_20181015 VALUES LESS THAN (1539619200) ENGINE = InnoDB,
 PARTITION t_report_team_platform_20181016 VALUES LESS THAN (1539705600) ENGINE = InnoDB,
 PARTITION t_report_team_platform_20181017 VALUES LESS THAN (1539792000) ENGINE = InnoDB,
 PARTITION t_report_team_platform_20181018 VALUES LESS THAN (1539878400) ENGINE = InnoDB,
 PARTITION t_report_team_platform_20181019 VALUES LESS THAN (1539964800) ENGINE = InnoDB,
 PARTITION t_report_team_platform_20181020 VALUES LESS THAN (1540051200) ENGINE = InnoDB,
 PARTITION t_report_team_platform_20181021 VALUES LESS THAN (1540137600) ENGINE = InnoDB,
 PARTITION t_report_team_platform_20181022 VALUES LESS THAN (1540224000) ENGINE = InnoDB);

/*Table structure for table `t_report_tenant` */

DROP TABLE IF EXISTS `t_report_tenant`;

CREATE TABLE `t_report_tenant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_CODE` varchar(10) NOT NULL COMMENT '租户代号',
  `ACTIVE_USERS` int(11) DEFAULT '0' COMMENT '有效用户数',
  `GAIN_MONEY_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '账面盈亏',
  `LOGINED_USERS` int(11) DEFAULT '0' COMMENT '登录用户数',
  `RECHARGE_FEE` decimal(18,5) DEFAULT '0.00000' COMMENT '用户充值手续费',
  `RECHARGE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '用户充值总额',
  `REGISTERED_USERS` int(11) DEFAULT '0' COMMENT '新增注册用户数',
  `WITHDRAW_FEE_ACCEPT` decimal(18,5) DEFAULT '0.00000' COMMENT '用户提款手续费',
  `WITHDRAW_TOTAL_ACCEPT` decimal(18,5) DEFAULT '0.00000' COMMENT '用户提款总额',
  `ACTIVITY_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '活动赠送',
  `USER_BALANCE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '用户账户总额',
  `BET_ORDERS` int(11) DEFAULT '0' COMMENT '投注单数',
  `BET_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '投注总额',
  `WIN_ORDERS` int(11) DEFAULT '0' COMMENT '中奖单数',
  `WIN_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '中奖总额',
  `AGENT_REBATE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '代理返点金额',
  `BET_REBATE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '投注返点总额',
  `UNSETTLED_ORDERS` int(11) DEFAULT '0' COMMENT '未结彩票注单数',
  `UNSETTLED_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '彩票未结注单总额',
  `IN_TIMES` int(11) DEFAULT '0' COMMENT '转入次数(CP,KG值为0)',
  `IN_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '转入总额(CP,KG值为0)',
  `OUT_TIMES` int(11) DEFAULT '0' COMMENT '转出次数(CP,KG值为0)',
  `OUT_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '转出总额(CP,KG值为0)',
  `REPORT_DATE` timestamp NOT NULL COMMENT '报表日期',
  PRIMARY KEY (`id`,`REPORT_DATE`),
  UNIQUE KEY `UNQ_REPORT_DATE_TENANT_CODE` (`REPORT_DATE`,`TENANT_CODE`),
  KEY `IDX_TENANT_CODE` (`TENANT_CODE`) USING BTREE,
  KEY `IDX_REPORT_DATE` (`REPORT_DATE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司报表'
 PARTITION BY RANGE (unix_timestamp(`REPORT_DATE`))
(PARTITION t_report_tenant_20181008 VALUES LESS THAN (1538928000) ENGINE = InnoDB,
 PARTITION t_report_tenant_20181009 VALUES LESS THAN (1539100800) ENGINE = InnoDB,
 PARTITION t_report_tenant_20181010 VALUES LESS THAN (1539187200) ENGINE = InnoDB,
 PARTITION t_report_tenant_20181011 VALUES LESS THAN (1539273600) ENGINE = InnoDB,
 PARTITION t_report_tenant_20181012 VALUES LESS THAN (1539360000) ENGINE = InnoDB,
 PARTITION t_report_tenant_20181013 VALUES LESS THAN (1539446400) ENGINE = InnoDB,
 PARTITION t_report_tenant_20181014 VALUES LESS THAN (1539532800) ENGINE = InnoDB,
 PARTITION t_report_tenant_20181015 VALUES LESS THAN (1539619200) ENGINE = InnoDB,
 PARTITION t_report_tenant_20181016 VALUES LESS THAN (1539705600) ENGINE = InnoDB,
 PARTITION t_report_tenant_20181017 VALUES LESS THAN (1539792000) ENGINE = InnoDB,
 PARTITION t_report_tenant_20181018 VALUES LESS THAN (1539878400) ENGINE = InnoDB,
 PARTITION t_report_tenant_20181019 VALUES LESS THAN (1539964800) ENGINE = InnoDB,
 PARTITION t_report_tenant_20181020 VALUES LESS THAN (1540051200) ENGINE = InnoDB,
 PARTITION t_report_tenant_20181021 VALUES LESS THAN (1540137600) ENGINE = InnoDB,
 PARTITION t_report_tenant_20181022 VALUES LESS THAN (1540224000) ENGINE = InnoDB);

/*Table structure for table `t_report_tenant_platform` */

DROP TABLE IF EXISTS `t_report_tenant_platform`;

CREATE TABLE `t_report_tenant_platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_CODE` varchar(10) NOT NULL COMMENT '租户代号',
  `USER_BALANCE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '用户账户总额',
  `BET_GAIN_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '投注盈亏',
  `UNSETTLED_ORDERS` int(11) DEFAULT '0' COMMENT '未结彩票注单数',
  `UNSETTLED_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '彩票未结注单总额',
  `BET_ORDERS` int(11) DEFAULT '0' COMMENT '投注单数',
  `BET_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '投注总额',
  `WIN_ORDERS` int(11) DEFAULT '0' COMMENT '中奖单数',
  `WIN_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '中奖总额',
  `AGENT_REBATE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '代理返点金额',
  `BET_REBATE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '投注返点总额',
  `REAL_GAIN_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '实际盈亏',
  `IN_TIMES` int(11) DEFAULT '0' COMMENT '转入次数(CP,KG值为0)',
  `IN_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '转入总额(CP,KG值为0)',
  `OUT_TIMES` int(11) DEFAULT '0' COMMENT '转出次数(CP,KG值为0)',
  `OUT_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '转出总额(CP,KG值为0)',
  `BET_USERS` int(11) DEFAULT '0' COMMENT 'AG投注用户数',
  `PLATFORM_TYPE` tinyint(4) NOT NULL COMMENT '平台类型(CP,KG,AG,BB,MG,PT)',
  `REPORT_DATE` timestamp NOT NULL COMMENT '报表日期',
  PRIMARY KEY (`id`,`REPORT_DATE`),
  UNIQUE KEY `UNQ_REPORT_DATE_TENANT_CODE_PLATFORM_TYPE` (`REPORT_DATE`,`TENANT_CODE`,`PLATFORM_TYPE`) USING BTREE,
  KEY `IDX_TENANT_CODE` (`TENANT_CODE`) USING BTREE,
  KEY `IDX_REPORT_DATE` (`REPORT_DATE`) USING BTREE,
  KEY `IDX_PLATFORM_TYPE` (`PLATFORM_TYPE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司平台报表'
PARTITION BY RANGE (unix_timestamp(`REPORT_DATE`))
(PARTITION t_report_tenant_platform_20181008 VALUES LESS THAN (1538928000) ENGINE = InnoDB,
 PARTITION t_report_tenant_platform_20181009 VALUES LESS THAN (1539100800) ENGINE = InnoDB,
 PARTITION t_report_tenant_platform_20181010 VALUES LESS THAN (1539187200) ENGINE = InnoDB,
 PARTITION t_report_tenant_platform_20181011 VALUES LESS THAN (1539273600) ENGINE = InnoDB,
 PARTITION t_report_tenant_platform_20181012 VALUES LESS THAN (1539360000) ENGINE = InnoDB,
 PARTITION t_report_tenant_platform_20181013 VALUES LESS THAN (1539446400) ENGINE = InnoDB,
 PARTITION t_report_tenant_platform_20181014 VALUES LESS THAN (1539532800) ENGINE = InnoDB,
 PARTITION t_report_tenant_platform_20181015 VALUES LESS THAN (1539619200) ENGINE = InnoDB,
 PARTITION t_report_tenant_platform_20181016 VALUES LESS THAN (1539705600) ENGINE = InnoDB,
 PARTITION t_report_tenant_platform_20181017 VALUES LESS THAN (1539792000) ENGINE = InnoDB,
 PARTITION t_report_tenant_platform_20181018 VALUES LESS THAN (1539878400) ENGINE = InnoDB,
 PARTITION t_report_tenant_platform_20181019 VALUES LESS THAN (1539964800) ENGINE = InnoDB,
 PARTITION t_report_tenant_platform_20181020 VALUES LESS THAN (1540051200) ENGINE = InnoDB,
 PARTITION t_report_tenant_platform_20181021 VALUES LESS THAN (1540137600) ENGINE = InnoDB,
 PARTITION t_report_tenant_platform_20181022 VALUES LESS THAN (1540224000) ENGINE = InnoDB);

/*Table structure for table `t_report_user` */

DROP TABLE IF EXISTS `t_report_user`;

CREATE TABLE `t_report_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL COMMENT '用户ID',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '直属上级ID',
  `FLOOR` tinyint(4) DEFAULT NULL COMMENT '所在层级',
  `USER_NAME` varchar(16) NOT NULL COMMENT '用户帐号',
  `TENANT_CODE` varchar(10) NOT NULL COMMENT '租户代号',
  `LOGIN_STATUS` tinyint(2) DEFAULT '0' COMMENT '当日是否登录',
  `RECHARGE_TIMES` int(11) DEFAULT '0' COMMENT '用户充值次数',
  `RECHARGE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '用户充值总额',
  `TRANSFER_TIMES_RI` int(11) DEFAULT '0' COMMENT '上级转入次数',
  `TRAER_TIMES_RO` int(11) DEFAULT '0' COMMENT '转给下级次数',
  `TRANSFER_TOTAL_RI` decimal(18,5) DEFAULT '0.00000' COMMENT '上级转入总额',
  `TRANSFER_TOTAL_RO` decimal(18,5) DEFAULT '0.00000' COMMENT '转给下级总额',
  `WITHDRAW_TIMES` int(11) DEFAULT '0' COMMENT '用户提现次数',
  `WITHDRAW_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '用户提现总额',
  `ACTIVITY_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '活动赠送',
  `REPORT_DATE` timestamp NOT NULL COMMENT '报表日期',
  `ACCOUNT_TYPE` tinyint(2) NOT NULL COMMENT '帐号类型',
  PRIMARY KEY (`id`,`REPORT_DATE`),
  UNIQUE KEY `UK_USER_ID_AND_REPORT_DATE` (`USER_ID`,`REPORT_DATE`) USING BTREE,
  KEY `IDX_TENANT_CODE` (`TENANT_CODE`) USING BTREE,
  KEY `IDX_USER_NAME` (`USER_NAME`) USING BTREE,
  KEY `IDX_REPORT_DATE` (`REPORT_DATE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户报表'
PARTITION BY RANGE (unix_timestamp(`REPORT_DATE`))
(PARTITION t_report_user_20181008 VALUES LESS THAN (1538928000) ENGINE = InnoDB,
 PARTITION t_report_user_20181009 VALUES LESS THAN (1539100800) ENGINE = InnoDB,
 PARTITION t_report_user_20181010 VALUES LESS THAN (1539187200) ENGINE = InnoDB,
 PARTITION t_report_user_20181011 VALUES LESS THAN (1539273600) ENGINE = InnoDB,
 PARTITION t_report_user_20181012 VALUES LESS THAN (1539360000) ENGINE = InnoDB,
 PARTITION t_report_user_20181013 VALUES LESS THAN (1539446400) ENGINE = InnoDB,
 PARTITION t_report_user_20181014 VALUES LESS THAN (1539532800) ENGINE = InnoDB,
 PARTITION t_report_user_20181015 VALUES LESS THAN (1539619200) ENGINE = InnoDB,
 PARTITION t_report_user_20181016 VALUES LESS THAN (1539705600) ENGINE = InnoDB,
 PARTITION t_report_user_20181017 VALUES LESS THAN (1539792000) ENGINE = InnoDB,
 PARTITION t_report_user_20181018 VALUES LESS THAN (1539878400) ENGINE = InnoDB,
 PARTITION t_report_user_20181019 VALUES LESS THAN (1539964800) ENGINE = InnoDB,
 PARTITION t_report_user_20181020 VALUES LESS THAN (1540051200) ENGINE = InnoDB,
 PARTITION t_report_user_20181021 VALUES LESS THAN (1540137600) ENGINE = InnoDB,
 PARTITION t_report_user_20181022 VALUES LESS THAN (1540224000) ENGINE = InnoDB);

/*Table structure for table `t_report_user_platform` */

DROP TABLE IF EXISTS `t_report_user_platform`;

CREATE TABLE `t_report_user_platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL COMMENT '用户ID',
  `PARENT_ID` int(11) DEFAULT NULL COMMENT '直属上级ID',
  `FLOOR` tinyint(4) DEFAULT NULL COMMENT '所在层级',
  `USER_NAME` varchar(16) NOT NULL COMMENT '用户帐号',
  `TENANT_CODE` varchar(10) NOT NULL COMMENT '租户代号',
  `BET_GAIN_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '投注盈亏',
  `UNSETTLED_ORDERS` int(11) DEFAULT '0' COMMENT '未结注单数',
  `UNSETTLED_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '未结订单总额',
  `BET_ORDERS` int(11) DEFAULT '0' COMMENT '投注单数',
  `BET_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '投注总额',
  `WIN_ORDERS` int(11) DEFAULT '0' COMMENT '中奖单数',
  `WIN_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '中奖总额',
  `AGENT_REBATE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '代理返点金额',
  `BET_REBATE_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '投注返点总额',
  `REAL_GAIN_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '实际盈亏',
  `IN_TIMES` int(11) DEFAULT '0' COMMENT '转入次数(CT,KG值为0)',
  `IN_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '转入总额(CT,KG值为0)',
  `OUT_TIMES` int(11) DEFAULT '0' COMMENT '转出次数(CT,KG值为0)',
  `OUT_TOTAL` decimal(18,5) DEFAULT '0.00000' COMMENT '转出总额(CT,KG值为0)',
  `PLATFORM_TYPE` tinyint(4) NOT NULL COMMENT '平台类型(CT,KG,AG,BB,MG,PT)',
  `REPORT_DATE` timestamp NOT NULL COMMENT '报表日期',
  `ACCOUNT_TYPE` tinyint(2) NOT NULL COMMENT '帐号类型',
  PRIMARY KEY (`id`,`REPORT_DATE`),
  UNIQUE KEY `UNQ_REPORT_DATE_USER_ID_PLATFORM_TYPE` (`REPORT_DATE`,`USER_ID`,`PLATFORM_TYPE`) USING BTREE,
  KEY `IDX_TENANT_CODE` (`TENANT_CODE`) USING BTREE,
  KEY `IDX_USER_NAME` (`USER_NAME`) USING BTREE,
  KEY `IDX_REPORT_DATE` (`REPORT_DATE`) USING BTREE,
  KEY `IDX_PLATFORM_TYPE` (`PLATFORM_TYPE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户平台报表'
PARTITION BY RANGE (unix_timestamp(`REPORT_DATE`))
(PARTITION t_report_user_platform_20181008 VALUES LESS THAN (1538928000) ENGINE = InnoDB,
 PARTITION t_report_user_platform_20181009 VALUES LESS THAN (1539100800) ENGINE = InnoDB,
 PARTITION t_report_user_platform_20181010 VALUES LESS THAN (1539187200) ENGINE = InnoDB,
 PARTITION t_report_user_platform_20181011 VALUES LESS THAN (1539273600) ENGINE = InnoDB,
 PARTITION t_report_user_platform_20181012 VALUES LESS THAN (1539360000) ENGINE = InnoDB,
 PARTITION t_report_user_platform_20181013 VALUES LESS THAN (1539446400) ENGINE = InnoDB,
 PARTITION t_report_user_platform_20181014 VALUES LESS THAN (1539532800) ENGINE = InnoDB,
 PARTITION t_report_user_platform_20181015 VALUES LESS THAN (1539619200) ENGINE = InnoDB,
 PARTITION t_report_user_platform_20181016 VALUES LESS THAN (1539705600) ENGINE = InnoDB,
 PARTITION t_report_user_platform_20181017 VALUES LESS THAN (1539792000) ENGINE = InnoDB,
 PARTITION t_report_user_platform_20181018 VALUES LESS THAN (1539878400) ENGINE = InnoDB,
 PARTITION t_report_user_platform_20181019 VALUES LESS THAN (1539964800) ENGINE = InnoDB,
 PARTITION t_report_user_platform_20181020 VALUES LESS THAN (1540051200) ENGINE = InnoDB,
 PARTITION t_report_user_platform_20181021 VALUES LESS THAN (1540137600) ENGINE = InnoDB,
 PARTITION t_report_user_platform_20181022 VALUES LESS THAN (1540224000) ENGINE = InnoDB);

/*Table structure for table `t_transaction` */

DROP TABLE IF EXISTS `t_transaction`;

CREATE TABLE `t_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_CODE` varchar(10) NOT NULL COMMENT '租户代号',
  `USER_ID` int(11) NOT NULL COMMENT '用户ID',
  `USER_NAME` varchar(16) NOT NULL COMMENT '用户帐号',
  `ORDERNO` longtext NOT NULL COMMENT '订单号(如果多个逗号隔开)',
  `BATCH_ORDERNO` varchar(40) DEFAULT NULL COMMENT '批订单号',
  `CURRENT_BALANCE` decimal(15,5) DEFAULT '0.00000' COMMENT '当前余额',
  `PREVIOUS_BALANCE` decimal(15,5) DEFAULT '0.00000' COMMENT '账变前余额',
  `TRANSACTION_AMOUNT` decimal(15,5) DEFAULT '0.00000' COMMENT '账变金额',
  `TRANSACTION_DIRECTION` tinyint(2) DEFAULT NULL COMMENT '账变方向 1收入;2支出',
  `TRANSACTION_SUBCLASS` tinyint(2) NOT NULL COMMENT '账变细类',
  `TRANSACTION_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '账变时间',
  `TRANSACTION_TYPE` tinyint(2) DEFAULT NULL COMMENT '账变类型',
  `PLATFORM_TYPE` tinyint(2) NOT NULL COMMENT '平台类型',
  PRIMARY KEY (`id`,`TRANSACTION_TIME`),
  KEY `IDX_USER_ID` (`USER_ID`) USING BTREE,
  KEY `IDX_TENANT_CODE` (`TENANT_CODE`) USING BTREE,
  KEY `IDX_TRANSACTION_TIME` (`TRANSACTION_TIME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账变流水表'
PARTITION BY RANGE (unix_timestamp(`TRANSACTION_TIME`))
(PARTITION t_transaction_20181008 VALUES LESS THAN (1538928000) ENGINE = InnoDB,
 PARTITION t_transaction_20181009 VALUES LESS THAN (1539100800) ENGINE = InnoDB,
 PARTITION t_transaction_20181010 VALUES LESS THAN (1539187200) ENGINE = InnoDB,
 PARTITION t_transaction_20181011 VALUES LESS THAN (1539273600) ENGINE = InnoDB,
 PARTITION t_transaction_20181012 VALUES LESS THAN (1539360000) ENGINE = InnoDB,
 PARTITION t_transaction_20181013 VALUES LESS THAN (1539446400) ENGINE = InnoDB,
 PARTITION t_transaction_20181014 VALUES LESS THAN (1539532800) ENGINE = InnoDB,
 PARTITION t_transaction_20181015 VALUES LESS THAN (1539619200) ENGINE = InnoDB,
 PARTITION t_transaction_20181016 VALUES LESS THAN (1539705600) ENGINE = InnoDB,
 PARTITION t_transaction_20181017 VALUES LESS THAN (1539792000) ENGINE = InnoDB,
 PARTITION t_transaction_20181018 VALUES LESS THAN (1539878400) ENGINE = InnoDB,
 PARTITION t_transaction_20181019 VALUES LESS THAN (1539964800) ENGINE = InnoDB,
 PARTITION t_transaction_20181020 VALUES LESS THAN (1540051200) ENGINE = InnoDB,
 PARTITION t_transaction_20181021 VALUES LESS THAN (1540137600) ENGINE = InnoDB,
 PARTITION t_transaction_20181022 VALUES LESS THAN (1540224000) ENGINE = InnoDB);

DELIMITER $$

USE `op2`$$

DROP PROCEDURE IF EXISTS `proc_add_partition_by_day`$$

CREATE DEFINER=`root`@`%` PROCEDURE `proc_add_partition_by_day`(IN v_tablename VARCHAR(50),v_add_interval INT)
BEGIN
/* =======================================================================
     * 系统名 : **系统
     * 子系统名 : 创建,删除分区
     * PROC名 : proc_mc_addjust_partition
     * 概要 : 每天规定时间内创建和删除分区
     * 例：加分区： alter table mc_stat_trends add partition (partition p20150417 VALUES LESS THAN('2015-04-17'))
     *     删分区:  alter table mc_stat_trends drop partition p20150310
     * 改版履历 :
     * 版本 日期 作者名 备注
     * 1.0.1 2015.03.01 ### 初次作成
     * ======================================================================= */
    -- 传入变量: v_drop_interval 删除日  v_add_interval 添加日
    DECLARE v_add_interval_1 INT;
    SET v_add_interval_1=v_add_interval+1;
	SET @t0=CONCAT('alter table ',v_tablename,' add partition ','(PARTITION ',v_tablename,'_', CONCAT(DATE_FORMAT(DATE_ADD(NOW(),INTERVAL v_add_interval DAY),'%Y%m%d')), 
	' VALUES LESS THAN',' (UNIX_TIMESTAMP',CONCAT("('",DATE_FORMAT(DATE(DATE_ADD(NOW(),INTERVAL v_add_interval_1 DAY)),'%Y-%m-%d'),' 00:00:00',"')"),')','ENGINE = INNODB)');
	
	PREPARE stmt FROM @t0; 
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
	
END$$

DELIMITER ;

DELIMITER $$

USE `op2`$$

DROP PROCEDURE IF EXISTS `proc_table_partition_by_2d_after`$$

CREATE DEFINER=`root`@`%` PROCEDURE `proc_table_partition_by_2d_after`()
BEGIN 
SET @array_tableName="t_bet_order,t_report_game,t_report_team,t_report_team_platform,t_report_tenant,t_report_tenant_platform,t_report_user,t_report_user_platform,t_transaction,t_lottery_number"; 
SET @i=1; 
SET @count=CHAR_LENGTH(@array_tableName)-CHAR_LENGTH(REPLACE(@array_tableName,',','')) + 1; 
SET @tableName='';
WHILE @i <= @count 
DO 
SET @tableName=REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(@array_tableName,',',@i)),',',1));
CALL proc_add_partition_by_day(@tableName,2);
SET @i=@i+1; 
END WHILE; 
END$$

DELIMITER ;

DELIMITER $$

USE `op2`$$

DROP PROCEDURE IF EXISTS `proc_table_partition_by_day`$$

CREATE DEFINER=`root`@`%` PROCEDURE `proc_table_partition_by_day`()
BEGIN 
SET @array_tableName="t_bet_order,t_report_game,t_report_team,t_report_team_platform,t_report_tenant,t_report_tenant_platform,t_report_user,t_report_user_platform,t_transaction,t_lottery_number"; 
SET @i=1; 
SET @count=CHAR_LENGTH(@array_tableName)-CHAR_LENGTH(REPLACE(@array_tableName,',','')) + 1; 
SET @tableName='';
WHILE @i <= @count 
DO 
SET @tableName=REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(@array_tableName,',',@i)),',',1));
CALL proc_add_partition_by_day(@tableName,1);
SET @i=@i+1; 
END WHILE; 
END$$

DELIMITER ;

DELIMITER $$

create EVENT `event_table_partition_by_2d_after` ON SCHEDULE EVERY 1 DAY STARTS '2016-09-26 22:30:00' ON COMPLETION NOT PRESERVE DISABLE ON SLAVE DO CALL proc_table_partition_by_2d_after()$$

DELIMITER ;

DELIMITER $$

create EVENT `event_table_partition_by_day` ON SCHEDULE EVERY 1 DAY STARTS '2016-09-26 22:10:00' ON COMPLETION NOT PRESERVE DISABLE ON SLAVE DO CALL proc_table_partition_by_day()$$

DELIMITER ;