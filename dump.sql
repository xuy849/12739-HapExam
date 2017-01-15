-- MySQL dump 10.13  Distrib 5.6.25, for Win64 (x86_64)
--
-- Host: localhost    Database: hap_dev
-- ------------------------------------------------------
-- Server version	5.6.25-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','1',1),('schema.history','create(6.0.0.3)',1),('schema.version','6.0.0.3',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangelog`
--

DROP TABLE IF EXISTS `databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangelog`
--

LOCK TABLES `databasechangelog` WRITE;
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-1','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:39',1,'EXECUTED','7:9cac9c56da25e14795c9ad0fa1436c19','sqlFile','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-2','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:39',2,'EXECUTED','7:5d560b358c03c9fee1a39da807b02b23','createTable (x2)','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-3','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:39',3,'EXECUTED','7:9e2fe3457ff81d91b48b534a6459aaa0','createTable, addUniqueConstraint, createTable','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-4','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:40',4,'EXECUTED','7:551f342eb60fdf566c4d95a61b161363','createTable, createIndex, createTable','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-5','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:40',5,'EXECUTED','7:7d29d8abcefb7bb07043a9897e31d08d','createTable, addUniqueConstraint','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-6','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:40',6,'EXECUTED','7:425119fea37700db89b302ec51f02a00','createTable','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-7','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:40',7,'EXECUTED','7:141374b97762ca54b459b60beba2c040','createTable','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-8','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:40',8,'EXECUTED','7:9a674f57a67ab46523528c8447b31202','createTable','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-9','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:40',9,'EXECUTED','7:9f83aa6e28d4f23ee298b99802076e7d','createTable, createIndex','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-10','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:41',10,'EXECUTED','7:cbc692f7425bc6701f2c567fe508b542','createTable, createIndex','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-11','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:41',11,'EXECUTED','7:4d8043535ee793e9409b1fea6b934289','createTable','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-12','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:41',12,'EXECUTED','7:f6ece7f4163ef166c20a2f42424dd9e2','createTable','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-13','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:41',13,'EXECUTED','7:a49ef97998b9acf74e22cb3a066b8743','createTable, addUniqueConstraint','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-14','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:41',14,'EXECUTED','7:616e4f25d42a9d13f7259fb497395d3e','createTable, addUniqueConstraint','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-15','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:41',15,'EXECUTED','7:d84b793422dc1ae60a6ef833796ca8ec','createTable (x2)','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-16','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:42',16,'EXECUTED','7:7b692fe998f27eb0d4c8992ad8fe98d1','createTable, addUniqueConstraint, createIndex, createTable','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-17','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:42',17,'EXECUTED','7:113d335667c184c47f7f0e7650eb87e2','createTable (x2)','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-18','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:42',18,'EXECUTED','7:f9e230001744d362be869c79e52d913b','createTable, addUniqueConstraint','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-19','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:42',19,'EXECUTED','7:e5283c602c58c0c70ba7c286eae45df7','createTable, addUniqueConstraint, createIndex','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-20','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:43',20,'EXECUTED','7:31098a41b812119f3dd5ee3322670659','createTable','',NULL,'3.4.2',NULL,NULL),('20160609-hailor-21','hailor','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:43',21,'EXECUTED','7:b32904539b879705d32f2ad4a434ff01','createTable, addUniqueConstraint','',NULL,'3.4.2',NULL,NULL),('20160610-sys-attach-category-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:43',22,'EXECUTED','7:999c5a29fe71bd6a72a54d87537e753e','createTable (x2)','',NULL,'3.4.2',NULL,NULL),('20160610-sys-attachment-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:43',23,'EXECUTED','7:3de8de4f612baa8c57693dfa20d4dac5','createTable, createIndex (x2)','',NULL,'3.4.2',NULL,NULL),('20160610-sys-file-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:44',24,'EXECUTED','7:cba72ad08c077065381aa2a6fe368c62','createTable, createIndex','',NULL,'3.4.2',NULL,NULL),('20160611-sys-message-transaction-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:44',25,'EXECUTED','7:8687ecbd4890bfac4be5c8c847dc2478','createTable, createIndex (x2)','',NULL,'3.4.2',NULL,NULL),('20160611-sys-message-attachment-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:44',26,'EXECUTED','7:5705fdfba5272a56d655a1bffe282801','createTable, createIndex (x2)','',NULL,'3.4.2',NULL,NULL),('20160611-sys-message-email-account-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:44',27,'EXECUTED','7:c96d61576e45aac0862c5219c491d42c','createTable','',NULL,'3.4.2',NULL,NULL),('20160611-sys-message-email-config-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:44',28,'EXECUTED','7:bb29c2927842699262131ba2f1dd60bc','createTable','',NULL,'3.4.2',NULL,NULL),('20160613-sys-message-email-white-lt-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:44',29,'EXECUTED','7:d935ef8ebd2bb4867f2de5e8b1cd4a70','createTable','',NULL,'3.4.2',NULL,NULL),('20160613-sys-message-receiver-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:45',30,'EXECUTED','7:a19fcaa3839cf5d58c5a517c4a6d716f','createTable, createIndex','',NULL,'3.4.2',NULL,NULL),('20160613-sys-message-template-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:45',31,'EXECUTED','7:30d17456a88542cd03ca7c4ebafe28a8','createTable','',NULL,'3.4.2',NULL,NULL),('20160613-sys-preferences-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:45',32,'EXECUTED','7:86dba2866476bb547c66f1a1dca40caa','createTable, addUniqueConstraint','',NULL,'3.4.2',NULL,NULL),('20160613-sys-account-retrieve-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:45',33,'EXECUTED','7:b85978e55ee07971e98e327946d2eff2','createTable','',NULL,'3.4.2',NULL,NULL),('20160922-sys-config-1','xuhailin','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:45',34,'EXECUTED','7:9a086e0e95e6567eda7bd6dbc803318a','createTable','',NULL,'3.4.2',NULL,NULL),('20160926-activiti.create.engine-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:57',35,'EXECUTED','7:db6e32a91292af7bd67a1b554392e055','sqlFile','',NULL,'3.4.2',NULL,NULL),('20160926-activiti.create.history-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:49:59',36,'EXECUTED','7:5eb0e316ceac016258fe1a8796c5a04b','sqlFile','',NULL,'3.4.2',NULL,NULL),('20160926-activiti.create.identity-1','jessen','2016-06-09-init-table-migration.groovy','2017-01-07 11:50:00',37,'EXECUTED','7:d9ba093bbd73a17a565e45a0a3b1b1dc','sqlFile','',NULL,'3.4.2',NULL,NULL),('2016-10-9-FND_COMPANY','jialongzuo','2016-06-09-init-table-migration.groovy','2017-01-07 11:50:00',38,'EXECUTED','7:5ae91b53baf9301cc0b53cd33913c0f5','createTable (x2)','',NULL,'3.4.2',NULL,NULL),('20161011-sys-userLogin-1','jialongzuo','2016-06-09-init-table-migration.groovy','2017-01-07 11:50:00',39,'EXECUTED','7:4868890d35400bf73b6e6e3390e6cbb2','createTable','',NULL,'3.4.2',NULL,NULL),('20160926-niujiaqing-hr-employee','niujiaqing','2016-09-26-init-migration.groovy','2017-01-07 11:50:00',40,'EXECUTED','7:07c915a5d30d8d22125f508467d49556','createTable','',NULL,'3.4.2',NULL,NULL),('20160926-niujiaqing-hr-org-unit','niujiaqing','2016-09-26-init-migration.groovy','2017-01-07 11:50:00',41,'EXECUTED','7:fd02936bc948ab02489e94072e720030','createTable (x2)','',NULL,'3.4.2',NULL,NULL),('20160926-niujiaqing-hr-org-position','niujiaqing','2016-09-26-init-migration.groovy','2017-01-07 11:50:01',42,'EXECUTED','7:465365db4389d13a1203bac7735d3251','createTable (x2)','',NULL,'3.4.2',NULL,NULL),('20160926-niujiaqing-hr-employee-assign','niujiaqing','2016-09-26-init-migration.groovy','2017-01-07 11:50:01',43,'EXECUTED','7:d0b5a1ca504c1ef36fb410f41c830123','createTable, addUniqueConstraint','',NULL,'3.4.2',NULL,NULL),('20161011-niujiaqing-sys-dashboard','niujiaqing','2016-09-26-init-migration.groovy','2017-01-07 11:50:01',44,'EXECUTED','7:044b40288f4a9e51ce9f5f53ac14a23d','createTable (x2)','',NULL,'3.4.2',NULL,NULL),('20161012-niujiaqing-user-dashboard','niujiaqing','2016-09-26-init-migration.groovy','2017-01-07 11:50:01',45,'EXECUTED','7:15a304a37ab173818db363debca865c6','createTable','',NULL,'3.4.2',NULL,NULL),('20161031-sys-interfaceHeader-1','xiangyuQi','2016-09-26-init-migration.groovy','2017-01-07 11:50:01',46,'EXECUTED','7:773b32780ba1136e5879eb3c733a1afb','createTable (x2)','',NULL,'3.4.2',NULL,NULL),('20161031-sys-interfaceLine-1','xiangyuQi','2016-09-26-init-migration.groovy','2017-01-07 11:50:02',47,'EXECUTED','7:4a0f79c06570442fc3e392aff56adac3','createTable (x2)','',NULL,'3.4.2',NULL,NULL),('20161117-sys-user-demo-1','xuhailin','2016-09-26-init-migration.groovy','2017-01-07 11:50:02',48,'EXECUTED','7:2631f516111601ec396aace8c0401d32','createTable (x2)','',NULL,'3.4.2',NULL,NULL),('20161121-sys-if-invoke-in-1','xiangyuQi','2016-09-26-init-migration.groovy','2017-01-07 11:50:02',49,'EXECUTED','7:adf8895c0b6b018e26fa25ff2d9d0523','createTable, createIndex (x4)','',NULL,'3.4.2',NULL,NULL),('20161121-sys-if-invoke-out-1','xiangyuQi','2016-09-26-init-migration.groovy','2017-01-07 11:50:02',50,'EXECUTED','7:caf8f033968cd31f816dc46077f61d6a','createTable, createIndex (x4)','',NULL,'3.4.2',NULL,NULL),('20160601-hailor-1','jessen','hbi/core/db/2016-06-01-init-migration.groovy','2017-01-07 11:50:03',51,'EXECUTED','7:db8c28b026c8937eb118a19768efa7c4','createTable','',NULL,'3.4.2',NULL,NULL),('20161009-xiangyuqi-1','xiangyuqi','patch.groovy','2017-01-07 11:50:03',52,'EXECUTED','7:70978c14109fc229144487006afccf91','addColumn','',NULL,'3.4.2',NULL,NULL),('20161025-zhizheng.yang-1','zhizheng.yang','patch.groovy','2017-01-07 11:50:03',53,'EXECUTED','7:c514a1778adc006e19237dbaf9ac7b6f','addColumn','',NULL,'3.4.2',NULL,NULL),('20161104-zhizheng.yang','zhizheng.yang','patch.groovy','2017-01-07 11:50:03',54,'EXECUTED','7:d20c8a541f028fa8876bdb71fafa05f4','addColumn','',NULL,'3.4.2',NULL,NULL),('20161109-xiangyuqi-1','xiangyu.qi','patch.groovy','2017-01-07 11:50:04',55,'EXECUTED','7:e9c2e00a3a580cde9301e67bdaa86513','renameColumn, addUniqueConstraint','',NULL,'3.4.2',NULL,NULL),('20161110-jialongzuo-1','jialong.zuo','patch.groovy','2017-01-07 11:50:04',56,'EXECUTED','7:164ccff8482ca92bc4c91622d34cf2da','addUniqueConstraint','',NULL,'3.4.2',NULL,NULL),('20161129-jialongzuo-1','jialong.zuo','patch.groovy','2017-01-07 11:50:04',57,'EXECUTED','7:91ca2128eff23ef5dc99b6f9ae7ffe41','addColumn','',NULL,'3.4.2',NULL,NULL),('20160613-data-sys-attach-category-1','jessen','2016-06-09-init-data-migration.groovy','2017-01-07 11:50:04',58,'EXECUTED','7:d7254fb792a2581c0c921cda8b90698b','sqlFile','',NULL,'3.4.2',NULL,NULL),('20160613-data-sys-message-email-config-1','jessen','2016-06-09-init-data-migration.groovy','2017-01-07 11:50:04',59,'EXECUTED','7:c39e780093128f2d0aafed24b3109466','sqlFile','',NULL,'3.4.2',NULL,NULL),('20160613-data-sys-message-email-account-1','jessen','2016-06-09-init-data-migration.groovy','2017-01-07 11:50:04',60,'EXECUTED','7:763810fcf72218794f8e4258011bef88','sqlFile','',NULL,'3.4.2',NULL,NULL),('20160613-data-sys-message-email-white-lt-1','jessen','2016-06-09-init-data-migration.groovy','2017-01-07 11:50:04',61,'EXECUTED','7:f5032ab5d66464c5d77ca62f90ca05ad','sqlFile','',NULL,'3.4.2',NULL,NULL),('20160613-data-sys-message-template-1','jessen','2016-06-09-init-data-migration.groovy','2017-01-07 11:50:04',62,'EXECUTED','7:45cef023d3167bf5abed8b84d0c6ee8e','sqlFile','',NULL,'3.4.2',NULL,NULL),('20160930-init-data-xlsx','jessen','2016-06-09-init-data-migration.groovy','2017-01-07 11:50:10',63,'EXECUTED','7:a23ef8b0ef5431d1321804e4550d8cd3','customChange','',NULL,'3.4.2',NULL,NULL),('20160601-yourname-1','yourname','hbi/core/db/2016-06-01-init-data.groovy','2017-01-07 11:50:10',64,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','Empty','',NULL,'3.4.2',NULL,NULL);
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangeloglock`
--

DROP TABLE IF EXISTS `databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangeloglock`
--

LOCK TABLES `databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fnd_company_b`
--

DROP TABLE IF EXISTS `fnd_company_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fnd_company_b` (
  `company_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_code` varchar(30) NOT NULL COMMENT '公司编码',
  `company_type` varchar(30) DEFAULT NULL COMMENT '公司类型',
  `address` varchar(2000) DEFAULT NULL COMMENT '地址',
  `company_level_id` bigint(20) DEFAULT NULL,
  `parent_company_id` bigint(20) DEFAULT NULL,
  `chief_position_id` bigint(20) DEFAULT NULL,
  `start_date_active` datetime DEFAULT NULL,
  `end_date_active` datetime DEFAULT NULL,
  `company_short_name` varchar(2000) DEFAULT NULL COMMENT '公司简称',
  `company_full_name` varchar(2000) DEFAULT NULL COMMENT '公司全称',
  `zipcode` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `FND_COMPANY_B_U1` (`company_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fnd_company_b`
--

LOCK TABLES `fnd_company_b` WRITE;
/*!40000 ALTER TABLE `fnd_company_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `fnd_company_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fnd_company_tl`
--

DROP TABLE IF EXISTS `fnd_company_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fnd_company_tl` (
  `company_id` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `company_short_name` varchar(2000) DEFAULT NULL,
  `company_full_name` varchar(2000) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`company_id`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fnd_company_tl`
--

LOCK TABLES `fnd_company_tl` WRITE;
/*!40000 ALTER TABLE `fnd_company_tl` DISABLE KEYS */;
/*!40000 ALTER TABLE `fnd_company_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hap_ar_customers`
--

DROP TABLE IF EXISTS `hap_ar_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hap_ar_customers` (
  `CUSTOMER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `CUSTOMER_NUMBER` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '客户编号',
  `CUSTOMER_NAME` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  `COMPANY_ID` bigint(20) NOT NULL COMMENT '公司ID',
  `ENABLED_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Y' COMMENT '启用标识',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 COMMENT='客户主数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hap_ar_customers`
--

LOCK TABLES `hap_ar_customers` WRITE;
/*!40000 ALTER TABLE `hap_ar_customers` DISABLE KEYS */;
INSERT INTO `hap_ar_customers` VALUES (201,'C001','上海达芙妮',101,'Y','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1),(202,'C002','光明乳业',101,'Y','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1),(203,'C003','东阿阿胶',101,'N','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1),(204,'C004','大华科技',101,'Y','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1),(205,'C005','腾讯科技',104,'Y','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1);
/*!40000 ALTER TABLE `hap_ar_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hap_inv_inventory_items`
--

DROP TABLE IF EXISTS `hap_inv_inventory_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hap_inv_inventory_items` (
  `INVENTORY_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '物料ID',
  `ITEM_CODE` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物料编码',
  `ITEM_UOM` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物料单位',
  `ITEM_DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物料描述',
  `ORDER_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Y' COMMENT '是否能用于销售',
  `START_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '生效起始时间',
  `END_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '生效结束时间',
  `ENABLED_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Y' COMMENT '启用标识',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`INVENTORY_ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8 COMMENT='物料主数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hap_inv_inventory_items`
--

LOCK TABLES `hap_inv_inventory_items` WRITE;
/*!40000 ALTER TABLE `hap_inv_inventory_items` DISABLE KEYS */;
INSERT INTO `hap_inv_inventory_items` VALUES (1001,'ITEM001','EA','HFM财务管理软件','Y',NULL,NULL,'Y','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1),(1002,'ITEM002','EA','HWMS仓储管理系统','Y',NULL,NULL,'Y','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1),(1003,'ITEM003','EA','HAP应用开发平台','N',NULL,NULL,'Y','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1),(1004,'ITEM004','EA','HEC费用控制系统','Y',NULL,NULL,'Y','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1),(1005,'ITEM005','EA','HFS财务共享系统','Y','2016-10-01 00:00:00',NULL,'Y','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1);
/*!40000 ALTER TABLE `hap_inv_inventory_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hap_om_order_headers`
--

DROP TABLE IF EXISTS `hap_om_order_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hap_om_order_headers` (
  `HEADER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单头ID',
  `ORDER_NUMBER` varchar(60) NOT NULL COMMENT '订单编号',
  `COMPANY_ID` bigint(20) NOT NULL COMMENT '公司ID',
  `ORDER_DATE` datetime NOT NULL COMMENT '订单日期',
  `ORDER_STATUS` varchar(30) NOT NULL COMMENT '订单状态',
  `CUSTOMER_ID` bigint(20) NOT NULL COMMENT '客户ID',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '请求号',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`HEADER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='销售订单头表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hap_om_order_headers`
--

LOCK TABLES `hap_om_order_headers` WRITE;
/*!40000 ALTER TABLE `hap_om_order_headers` DISABLE KEYS */;
INSERT INTO `hap_om_order_headers` VALUES (8,'bjabb',104,'2017-01-14 00:00:00','new',205,1,-1,-1,'2017-01-14 16:59:51',10001,10001,'2017-01-14 16:59:51',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'113',101,'2017-01-13 00:00:01','new',201,1,-1,-1,'2017-01-14 12:55:52',10001,-1,'2017-01-14 12:55:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'111',101,'2017-01-13 00:00:00','new',201,1,-1,-1,'2017-01-13 16:54:59',10001,10001,'2017-01-13 16:54:59',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'112',101,'2017-01-13 00:00:00','new',201,1,-1,-1,'2017-01-13 16:54:34',10001,10001,'2017-01-13 16:54:34',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'ddad',101,'2017-01-15 00:00:00','new',202,1,-1,-1,'2017-01-15 17:25:39',10001,10001,'2017-01-15 17:25:39',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'ddad',101,'2017-01-15 00:00:00','new',202,1,-1,-1,'2017-01-15 17:25:53',10001,10001,'2017-01-15 17:25:53',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'AA',101,'2017-01-15 00:00:00','new',202,1,-1,-1,'2017-01-15 18:35:44',10001,10001,'2017-01-15 18:35:44',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hap_om_order_headers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hap_om_order_lines`
--

DROP TABLE IF EXISTS `hap_om_order_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hap_om_order_lines` (
  `LINE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单行ID',
  `HEADER_ID` bigint(20) NOT NULL COMMENT '订单头ID',
  `LINE_NUMBER` bigint(20) NOT NULL COMMENT '行号',
  `INVENTORY_ITEM_ID` bigint(20) NOT NULL COMMENT '产品ID',
  `ORDERD_QUANTITY` bigint(20) NOT NULL COMMENT '数量',
  `ORDER_QUANTITY_UOM` varchar(30) NOT NULL COMMENT '产品单位',
  `UNIT_SELLING_PRICE` bigint(20) NOT NULL COMMENT '销售单价',
  `DESCRIPTION` varchar(240) NOT NULL COMMENT '备注',
  `COMPANY_ID` bigint(20) NOT NULL COMMENT '公司ID',
  `ADDITION1` varchar(150) DEFAULT NULL COMMENT '附加信息1',
  `ADDITION2` varchar(150) DEFAULT NULL COMMENT '附加信息2',
  `ADDITION3` varchar(150) DEFAULT NULL COMMENT '附加信息3',
  `ADDITION4` varchar(150) DEFAULT NULL COMMENT '附加信息4',
  `ADDITION5` varchar(150) DEFAULT NULL COMMENT '附加信息5',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1' COMMENT '行版本号，用来处理锁',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '请求号',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`LINE_ID`),
  KEY `HAP_OM_ORDER_LINES _N1` (`HEADER_ID`),
  KEY `HAP_OM_ORDER_LINES _N2` (`INVENTORY_ITEM_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='销售订单行表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hap_om_order_lines`
--

LOCK TABLES `hap_om_order_lines` WRITE;
/*!40000 ALTER TABLE `hap_om_order_lines` DISABLE KEYS */;
INSERT INTO `hap_om_order_lines` VALUES (1,6,11,1001,11,'个',11,'hahah',101,NULL,NULL,NULL,NULL,NULL,1,-1,-1,'2017-01-13 18:02:49',-1,-1,'2017-01-13 18:02:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,6,12,1002,2,'个',10,'22',101,NULL,NULL,NULL,NULL,NULL,1,-1,-1,'2017-01-13 18:04:13',-1,-1,'2017-01-13 18:04:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,6,123,1003,4,'个',6,'3333',101,NULL,NULL,NULL,NULL,NULL,1,-1,-1,'2017-01-13 18:04:13',-1,-1,'2017-01-13 18:04:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,5,111,1001,9,'个',23,'hahah ',101,NULL,NULL,NULL,NULL,NULL,1,-1,-1,'2017-01-13 18:06:39',-1,-1,'2017-01-13 18:06:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,5,10777,1001,54,'个',8,'jhdfis',101,NULL,NULL,NULL,NULL,NULL,1,-1,-1,'2017-01-13 18:06:39',-1,-1,'2017-01-13 18:06:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,5,10022,1004,34,'个',76,'ddd',101,NULL,NULL,NULL,NULL,NULL,1,-1,-1,'2017-01-13 18:08:25',-1,-1,'2017-01-13 18:08:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hap_om_order_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hap_org_companys`
--

DROP TABLE IF EXISTS `hap_org_companys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hap_org_companys` (
  `COMPANY_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公司ID',
  `COMPANY_NUMBER` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公司编号',
  `COMPANY_NAME` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公司名称',
  `ENABLED_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Y' COMMENT '启用标识',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`COMPANY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='公司主数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hap_org_companys`
--

LOCK TABLES `hap_org_companys` WRITE;
/*!40000 ALTER TABLE `hap_org_companys` DISABLE KEYS */;
INSERT INTO `hap_org_companys` VALUES (101,'HAND001','汉得信息','Y','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1),(102,'HAND002','汉得教育','Y','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1),(103,'HAND003','汉得保理','Y','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1),(104,'HAND004','随身科技','Y','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1),(105,'HAND005','夏尔科技','N','2016-08-24 16:48:17',-1,-1,'2016-08-24 16:48:17',-1);
/*!40000 ALTER TABLE `hap_org_companys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hbi_demo`
--

DROP TABLE IF EXISTS `hbi_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hbi_demo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(265) DEFAULT NULL,
  `tel` varchar(265) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hbi_demo`
--

LOCK TABLES `hbi_demo` WRITE;
/*!40000 ALTER TABLE `hbi_demo` DISABLE KEYS */;
/*!40000 ALTER TABLE `hbi_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_employee`
--

DROP TABLE IF EXISTS `hr_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_employee` (
  `EMPLOYEE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_CODE` varchar(30) NOT NULL COMMENT '员工编码',
  `NAME` varchar(50) NOT NULL COMMENT '员工姓名',
  `BORN_DATE` date DEFAULT NULL COMMENT '出生日期',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `MOBIL` varchar(50) DEFAULT NULL COMMENT '移动电话',
  `JOIN_DATE` date DEFAULT NULL COMMENT '入职日期',
  `GENDER` varchar(1) DEFAULT NULL COMMENT '性别',
  `CERTIFICATE_ID` varchar(100) NOT NULL COMMENT 'ID',
  `STATUS` varchar(50) NOT NULL COMMENT '状态',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `HR_EMPLOYEE_U1` (`EMPLOYEE_CODE`),
  UNIQUE KEY `HR_EMPLOYEE_U2` (`CERTIFICATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_employee`
--

LOCK TABLES `hr_employee` WRITE;
/*!40000 ALTER TABLE `hr_employee` DISABLE KEYS */;
INSERT INTO `hr_employee` VALUES (10001,'ADMIN','管理员','2000-01-01','shengyang.zhou@hand-china.com','13764784777','2016-06-15','M','1','NORMAL','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10002,'Rodgers','罗杰斯','2000-01-02','shengyang.zhou@hand-china.com','139','2016-06-16','M','37132502','NORMAL','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10003,'Hailen','林海伦','2000-01-03','shengyang.zhou@hand-china.com','189','2016-06-17','F','37132503','NORMAL','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10004,'Jessen','周杰森','2000-01-04','shengyang.zhou@hand-china.com','13764784776','2016-06-18','M','37132511','NORMAL','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10005,'Eric','刘丹','2000-01-05','eric.hap@126.com','13876499','2016-06-19','M','5675453','NORMAL','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10006,'Tony','辰东','2000-01-06','tony.hap@126.com','1889343','2016-06-20','M','3445562','NORMAL','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1);
/*!40000 ALTER TABLE `hr_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_employee_assign`
--

DROP TABLE IF EXISTS `hr_employee_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_employee_assign` (
  `ASSIGN_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_ID` bigint(20) NOT NULL COMMENT '员工ID',
  `POSITION_ID` bigint(20) NOT NULL COMMENT '岗位ID',
  `PRIMARY_POSITION_FLAG` varchar(1) DEFAULT NULL COMMENT '主岗位标示',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`ASSIGN_ID`),
  UNIQUE KEY `HR_EMPLOYEE_ASSIGN_U1` (`EMPLOYEE_ID`,`POSITION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_employee_assign`
--

LOCK TABLES `hr_employee_assign` WRITE;
/*!40000 ALTER TABLE `hr_employee_assign` DISABLE KEYS */;
INSERT INTO `hr_employee_assign` VALUES (10001,10001,10001,'Y','Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10002,10006,10003,'Y','Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10003,10002,10011,'Y','Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10004,10002,10012,'N','Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10005,10004,10012,'Y','Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10006,10003,10010,'Y','Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10007,10005,10009,'Y','Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1);
/*!40000 ALTER TABLE `hr_employee_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_org_position_b`
--

DROP TABLE IF EXISTS `hr_org_position_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_org_position_b` (
  `POSITION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UNIT_ID` bigint(20) NOT NULL COMMENT '组织ID',
  `POSITION_CODE` varchar(50) DEFAULT NULL COMMENT '岗位编码',
  `NAME` varchar(100) DEFAULT NULL COMMENT '岗位名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '岗位描述',
  `PARENT_POSITION_ID` bigint(20) DEFAULT NULL COMMENT '父岗位ID',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`POSITION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10013 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_org_position_b`
--

LOCK TABLES `hr_org_position_b` WRITE;
/*!40000 ALTER TABLE `hr_org_position_b` DISABLE KEYS */;
INSERT INTO `hr_org_position_b` VALUES (10001,10002,'ADMIN','管理员','管理员',NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10002,10002,'CEO','首席执行官','首席执行官',10001,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10003,10003,'TECT_INSPECTOR','技术总监','技术总监',10002,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10004,10007,'SALE_INSPECTOR','销售总监','销售部门总监',10002,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10005,10008,'FIN_INSPECTOR','财务总监','财务部总监',10002,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10006,10006,'MARKET_INSPECTOR','市场部总监','市场部总监',10002,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10007,10005,'111428','人事总监','人力资源部总监',10002,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10008,10005,'101662','人事经理','人力资源部经理',10007,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10009,10005,'115189','人事主管','人事主管',10008,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10010,10005,'110143','人事专员','人事专员',10009,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10011,10004,'115769','研发总监','研发部门总监',10003,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10012,10004,'115731','研发工程师','研发工程师',10011,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1);
/*!40000 ALTER TABLE `hr_org_position_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_org_position_tl`
--

DROP TABLE IF EXISTS `hr_org_position_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_org_position_tl` (
  `POSITION_ID` bigint(20) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL COMMENT '组织名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '组织描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`POSITION_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_org_position_tl`
--

LOCK TABLES `hr_org_position_tl` WRITE;
/*!40000 ALTER TABLE `hr_org_position_tl` DISABLE KEYS */;
INSERT INTO `hr_org_position_tl` VALUES (10001,'en_GB','ADMIN','ADMIN',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10001,'zh_CN','管理员','管理员',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10002,'en_GB','CEO','CEO',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10002,'zh_CN','首席执行官','首席执行官',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10003,'en_GB','TECH','Technical Director',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10003,'zh_CN','技术总监','技术总监',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10004,'en_GB','Sales Director','Sales Director',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10004,'zh_CN','销售总监','销售部门总监',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10005,'en_GB','Financial Controller','Financial Controller',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10005,'zh_CN','财务总监','财务部总监',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10006,'en_GB','Marketing Director','Marketing Director',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10006,'zh_CN','市场部总监','市场部总监',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10007,'en_GB','Human Resources Director','Human Resources Director',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10007,'zh_CN','人事总监','人力资源部总监',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10008,'en_GB','HR Manager','HR Manager',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10008,'zh_CN','人事经理','人力资源部经理',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10009,'en_GB','Human Resources Supervisor','Human Resources Supervisor',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10009,'zh_CN','人事主管','人事主管',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10010,'en_GB','HR Consultant','HR Consultant',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10010,'zh_CN','人事专员','人事专员',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10011,'en_GB','R & D Director','Research & Development Director',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10011,'zh_CN','研发总监','研发部门总监',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10012,'en_GB','R & D Engineer','R & D Engineer',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10012,'zh_CN','研发工程师','研发工程师',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1);
/*!40000 ALTER TABLE `hr_org_position_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_org_unit_b`
--

DROP TABLE IF EXISTS `hr_org_unit_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_org_unit_b` (
  `UNIT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '父组织',
  `UNIT_CODE` varchar(50) DEFAULT NULL COMMENT '组织编码',
  `NAME` varchar(100) DEFAULT NULL COMMENT '组织名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '组织描述',
  `MANAGER_POSITION` bigint(20) DEFAULT NULL COMMENT '组织管理岗位',
  `COMPANY_ID` bigint(20) DEFAULT NULL COMMENT '公司ID',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`UNIT_ID`),
  UNIQUE KEY `HR_ORG_UNIT_U1` (`UNIT_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_org_unit_b`
--

LOCK TABLES `hr_org_unit_b` WRITE;
/*!40000 ALTER TABLE `hr_org_unit_b` DISABLE KEYS */;
INSERT INTO `hr_org_unit_b` VALUES (10001,NULL,'1000','汉得信息技术股份有限公司','汉得信息技术股份有限公司',10002,NULL,'Y',2,-1,-1,-1,'2017-01-07 11:50:10',10001,'2017-01-11 17:14:37',10001),(10002,10001,'100000','汉得信息','汉得信息',10002,NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10003,10002,'100020','技术部','技术服务中心',10003,NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10004,10003,'100040','基础研发部','基础研发部',10011,NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10005,10002,'100050','人力资源部','人力资源部',10007,NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10006,10002,'100060','市场部','市场部',10006,NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10007,10002,'100070','销售部','销售部门',10004,NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10008,10002,'100080','财务部','财务部门',10005,NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1);
/*!40000 ALTER TABLE `hr_org_unit_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_org_unit_tl`
--

DROP TABLE IF EXISTS `hr_org_unit_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_org_unit_tl` (
  `UNIT_ID` bigint(20) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL COMMENT '组织名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '组织描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`UNIT_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_org_unit_tl`
--

LOCK TABLES `hr_org_unit_tl` WRITE;
/*!40000 ALTER TABLE `hr_org_unit_tl` DISABLE KEYS */;
INSERT INTO `hr_org_unit_tl` VALUES (10001,'en_GB','Hand China Co.,Ltd','Hand China Co.,Ltd',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10001,'zh_CN','汉得信息技术股份有限公司','汉得信息技术股份有限公司',1,-1,-1,-1,'2017-01-07 11:50:10',10001,'2017-01-11 17:14:37',-1),(10002,'en_GB','Hand','Hand',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10002,'zh_CN','汉得信息','汉得信息',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10003,'en_GB','TECH','TECH',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10003,'zh_CN','技术部','技术服务中心',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10004,'en_GB','R&D','Research & Developement',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10004,'zh_CN','基础研发部','基础研发部',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10005,'en_GB','HR','HR',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10005,'zh_CN','人力资源部','人力资源部',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10006,'en_GB','Marketing Department','Marketing Department',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10006,'zh_CN','市场部','市场部',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10007,'en_GB','Sales Department','Sales Department',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10007,'zh_CN','销售部','销售部门',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10008,'en_GB','Financial','Financial Management Department）',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10008,'zh_CN','财务部','财务部门',1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1);
/*!40000 ALTER TABLE `hr_org_unit_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler','STATE_ACCESS'),('quartzScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `qrtz_scheduler_state` VALUES ('quartzScheduler','LAPTOP-KV16HPC41484476412588',1484476577323,20000),('quartzScheduler','LAPTOP-KV16HPC41484476459011',1484476582321,20000);
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_account_retrieve`
--

DROP TABLE IF EXISTS `sys_account_retrieve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_account_retrieve` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RETRIEVE_TYPE` varchar(30) DEFAULT NULL COMMENT '类型:NAME/PWD',
  `RETRIEVE_DATE` datetime DEFAULT NULL COMMENT '时间',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_account_retrieve`
--

LOCK TABLES `sys_account_retrieve` WRITE;
/*!40000 ALTER TABLE `sys_account_retrieve` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_account_retrieve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_attach_category_b`
--

DROP TABLE IF EXISTS `sys_attach_category_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_attach_category_b` (
  `CATEGORY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(40) DEFAULT NULL,
  `LEAF_FLAG` varchar(1) DEFAULT NULL,
  `DESCRIPTION` varchar(240) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT NULL,
  `PARENT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PATH` varchar(200) DEFAULT NULL COMMENT '层级路径',
  `SOURCE_TYPE` varchar(30) DEFAULT NULL,
  `ALLOWED_FILE_TYPE` varchar(30) DEFAULT NULL,
  `ALLOWED_FILE_SIZE` decimal(20,0) DEFAULT NULL,
  `IS_UNIQUE` varchar(1) DEFAULT NULL,
  `CATEGORY_PATH` varchar(255) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_attach_category_b`
--

LOCK TABLES `sys_attach_category_b` WRITE;
/*!40000 ALTER TABLE `sys_attach_category_b` DISABLE KEYS */;
INSERT INTO `sys_attach_category_b` VALUES (1,'目录1','0','目录1','1',-1,'1','FOLDER',NULL,NULL,'Y',NULL,1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'目录2','0','目录2','1',1,'1.2','FOLDER',NULL,NULL,'N',NULL,1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'目录3','0','叶节点1','1',2,'1.2.3','IMG',NULL,NULL,'Y','/Users/jessen/Pictures/hap/img',1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Leaf 1.1','1','Leaf 1.1','1',3,'1.2.3.4','IMG2','.jpg;.jpeg;.png',NULL,'N','/Users/jessen/Pictures/hap/img',1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_attach_category_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_attach_category_tl`
--

DROP TABLE IF EXISTS `sys_attach_category_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_attach_category_tl` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `CATEGORY_NAME` varchar(40) DEFAULT NULL COMMENT '类别名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '角色描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_attach_category_tl`
--

LOCK TABLES `sys_attach_category_tl` WRITE;
/*!40000 ALTER TABLE `sys_attach_category_tl` DISABLE KEYS */;
INSERT INTO `sys_attach_category_tl` VALUES (1,'en_GB','Category1','Category1',1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,'zh_CN','目录1','目录1',1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'en_GB','Category2','Category2',1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'zh_CN','目录2','目录2',1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'en_GB','Category3','Left1',1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'zh_CN','目录3','叶节点1',1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'en_GB','Leaf1.1','Leaf 1.1',1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'zh_CN','Leaf 1.1','Leaf 1.1',1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_attach_category_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_attachment`
--

DROP TABLE IF EXISTS `sys_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_attachment` (
  `ATTACHMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `NAME` varchar(40) DEFAULT NULL COMMENT '附件名称',
  `SOURCE_TYPE` varchar(30) DEFAULT NULL COMMENT '对应业务类型',
  `SOURCE_KEY` varchar(40) DEFAULT NULL COMMENT '业务主键',
  `STATUS` varchar(1) DEFAULT NULL COMMENT '状态',
  `START_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '开始生效日期',
  `END_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '失效时间',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ATTACHMENT_ID`),
  KEY `SYS_ATTACHMENT_N1` (`CATEGORY_ID`),
  KEY `SYS_ATTACHMENT_N2` (`SOURCE_TYPE`,`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_attachment`
--

LOCK TABLES `sys_attachment` WRITE;
/*!40000 ALTER TABLE `sys_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_code_b`
--

DROP TABLE IF EXISTS `sys_code_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_code_b` (
  `CODE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(30) NOT NULL COMMENT '快码类型',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '快码类型描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`),
  UNIQUE KEY `SYS_CODE_B_U1` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10015 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_code_b`
--

LOCK TABLES `sys_code_b` WRITE;
/*!40000 ALTER TABLE `sys_code_b` DISABLE KEYS */;
INSERT INTO `sys_code_b` VALUES (10001,'HR.EMPLOYEE_GENDER','性别',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'HR.EMPLOYEE_STATUS','员工状态',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'SYS.ALIGN_TYPE','对齐方式',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'SYS.CAPTCHA_POLICY','验证码策略',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,'SYS.LOV_EDITOR_TYPE','LOV 编辑器类型',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,'SYS.PRIORITY_LEVEL','模板优先级',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,'SYS.PROFILE_LEVEL_ID','配置文件级别',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10008,'SYS.RESOURCE_TYPE','资源类型',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10009,'SYS.TIME_ZONE','时区',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,'SYS.USER_STATUS','用户状态',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,'SYS.YES_NO','是否 YN',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10012,'SYS.PASSWORD_COMPLEXITY','密码复杂度要求',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10013,'SYS.IF.REQUEST_STATUS','接口调用状态',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10014,'SYS.ORDER_STATUS','订单状态',5,-1,-1,-1,'2017-01-12 19:28:25',10001,'2017-01-14 13:58:21',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_code_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_code_tl`
--

DROP TABLE IF EXISTS `sys_code_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_code_tl` (
  `CODE_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '快码描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_code_tl`
--

LOCK TABLES `sys_code_tl` WRITE;
/*!40000 ALTER TABLE `sys_code_tl` DISABLE KEYS */;
INSERT INTO `sys_code_tl` VALUES (10001,'en_GB','Gender',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10001,'zh_CN','性别',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'en_GB','Employee Status',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'zh_CN','员工状态',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'en_GB','Align Type',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'zh_CN','对齐方式',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'en_GB','Captcha Policy',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'zh_CN','验证码策略',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,'en_GB','LOV Editor Type',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,'zh_CN','LOV 编辑器类型',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,'en_GB','Template Priority',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,'zh_CN','模板优先级',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,'en_GB','Profile Level',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,'zh_CN','配置文件级别',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10008,'en_GB','Resource Type',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10008,'zh_CN','资源类型',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10009,'en_GB','Time Zone',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10009,'zh_CN','时区',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,'en_GB','User Status',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,'zh_CN','用户状态',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,'en_GB','Yes No',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,'zh_CN','是否 YN',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10012,'en_GB','Password Complexity',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10012,'zh_CN','密码复杂度要求',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10013,'en_GB','Interface Invoke State',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10013,'zh_CN','接口调用状态',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10014,'en_GB','Order Status',1,-1,-1,-1,'2017-01-12 19:29:15',-1,'2017-01-12 19:29:15',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10014,'zh_CN','订单状态',1,-1,-1,-1,'2017-01-12 19:29:15',10001,'2017-01-14 13:58:21',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_code_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_code_value_b`
--

DROP TABLE IF EXISTS `sys_code_value_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_code_value_b` (
  `CODE_VALUE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE_ID` bigint(20) DEFAULT NULL,
  `VALUE` varchar(150) DEFAULT NULL COMMENT '快码值',
  `MEANING` varchar(150) DEFAULT NULL COMMENT '快码意思',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '快码描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  `ORDER_SEQ` int(11) DEFAULT '10',
  PRIMARY KEY (`CODE_VALUE_ID`),
  UNIQUE KEY `SYS_CODE_VALUE_B_U1` (`CODE_ID`,`VALUE`)
) ENGINE=InnoDB AUTO_INCREMENT=10044 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_code_value_b`
--

LOCK TABLES `sys_code_value_b` WRITE;
/*!40000 ALTER TABLE `sys_code_value_b` DISABLE KEYS */;
INSERT INTO `sys_code_value_b` VALUES (10001,10008,'HTML','HTML页面','HTML页面',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10002,10008,'SERVICE','URL服务','URL服务',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10003,10005,'INT','数字框',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10004,10005,'POPUP','值列表',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10005,10005,'SELECT','下拉框',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10006,10005,'TEXT','文本框',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10007,10005,'DATE','日期框',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10008,10011,'N','否',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10009,10011,'Y','是',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10010,10003,'CENTER','居中',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10011,10003,'LEFT','左对齐',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10012,10003,'RIGHT','右对齐',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10013,10007,'10','全局',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10014,10007,'20','角色',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10015,10007,'30','用户',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10016,10006,'NORMAL','普通',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10017,10006,'VIP','VIP',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10018,10009,'GMT+0800','(GMT+8)北京时间',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10019,10009,'GMT-0500','(GMT-5)纽约',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10020,10009,'GMT-0800','(GMT-8)旧金山',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10021,10010,'ACTV','有效','有效',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10022,10010,'EXPR','过期','过期',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10023,10010,'LOCK','已锁定','锁定',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10024,10004,'AFTER3','登录失败3次启用验证码','登录失败3次启用验证码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10025,10004,'DISABLE','禁用验证码','禁用验证码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10026,10004,'ENABLE','启用验证码','启用验证码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10027,10001,'F','女',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10028,10001,'M','男',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10029,10002,'NORMAL','正式',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10030,10002,'OFFWORK','离职',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10031,10002,'PRAC','实习',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10032,10002,'RETIRE','退休',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10033,10002,'TRAIL','试用',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10034,10012,'no_limit','无限制',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10035,10012,'digits_and_letters','必须混合数字和字母',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10036,10012,'digits_and_case_letters','必须混合数字和大小写字母',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10037,10013,'success','成功','接口调用成功',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10038,10013,'failure','失败','接口调用失败',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10),(10039,10014,'new','新建',NULL,2,-1,-1,-1,'2017-01-12 19:33:58',10001,'2017-01-14 13:58:21',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(10040,10014,'submited','已提交',NULL,2,-1,-1,-1,'2017-01-12 19:33:58',10001,'2017-01-14 13:58:21',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(10041,10014,'approved','已审批',NULL,2,-1,-1,-1,'2017-01-12 19:33:58',10001,'2017-01-14 13:58:21',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),(10042,10014,'rejected','已拒绝',NULL,2,-1,-1,-1,'2017-01-12 19:33:58',10001,'2017-01-14 13:58:21',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5),(10043,10014,'null','请选择订单状态','',3,-1,-1,10001,'2017-01-14 13:56:46',10001,'2017-01-14 13:58:02',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `sys_code_value_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_code_value_tl`
--

DROP TABLE IF EXISTS `sys_code_value_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_code_value_tl` (
  `CODE_VALUE_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `MEANING` varchar(150) DEFAULT NULL COMMENT '快码意思',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '快码描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CODE_VALUE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_code_value_tl`
--

LOCK TABLES `sys_code_value_tl` WRITE;
/*!40000 ALTER TABLE `sys_code_value_tl` DISABLE KEYS */;
INSERT INTO `sys_code_value_tl` VALUES (10001,'en_GB','HTML页面','HTML页面',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10001,'zh_CN','HTML页面','HTML页面',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'en_GB','URL服务','URL服务',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'zh_CN','URL服务','URL服务',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'en_GB','Number',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'zh_CN','数字框',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'en_GB','Popup',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'zh_CN','值列表',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,'en_GB','Select',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,'zh_CN','下拉框',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,'en_GB','Text',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,'zh_CN','文本框',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,'en_GB','Date',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,'zh_CN','日期框',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10008,'en_GB','No',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10008,'zh_CN','否',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10009,'en_GB','Yes',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10009,'zh_CN','是',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,'en_GB','Center',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,'zh_CN','居中',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,'en_GB','Left',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,'zh_CN','左对齐',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10012,'en_GB','Right',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10012,'zh_CN','右对齐',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10013,'en_GB','Global',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10013,'zh_CN','全局',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10014,'en_GB','Role',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10014,'zh_CN','角色',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10015,'en_GB','User',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10015,'zh_CN','用户',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10016,'en_GB','Normal',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10016,'zh_CN','普通',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10017,'en_GB','VIP',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10017,'zh_CN','VIP',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10018,'en_GB','(GMT+8)Beijing',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10018,'zh_CN','(GMT+8)北京时间',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10019,'en_GB','(GMT-5)New York',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10019,'zh_CN','(GMT-5)纽约',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10020,'en_GB','(GMT-8)San Francisco',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10020,'zh_CN','(GMT-8)旧金山',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10021,'en_GB','Active','Active',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10021,'zh_CN','有效','有效',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10022,'en_GB','Expired','Expired',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10022,'zh_CN','过期','过期',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10023,'en_GB','Locked','Locked',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10023,'zh_CN','已锁定','锁定',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10024,'en_GB','Enable captcha after 3 failure','Enable captcha after login failed 3 times.',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10024,'zh_CN','登录失败3次启用验证码','登录失败3次启用验证码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10025,'en_GB','Disable captcha','Disable captcha',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10025,'zh_CN','禁用验证码','禁用验证码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10026,'en_GB','Enable captcha','Enable captcha',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10026,'zh_CN','启用验证码','启用验证码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10027,'en_GB','Female',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10027,'zh_CN','女',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10028,'en_GB','Male',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10028,'zh_CN','男',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10029,'en_GB','正式',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10029,'zh_CN','正式',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10030,'en_GB','Off Work',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10030,'zh_CN','离职',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10031,'en_GB','Practice',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10031,'zh_CN','实习',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10032,'en_GB','Retired',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10032,'zh_CN','退休',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10033,'en_GB','Trail',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10033,'zh_CN','试用',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10034,'en_GB','No Limit',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10034,'zh_CN','无限制',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10035,'en_GB','Contains Digits And Letters',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10035,'zh_CN','必须混合数字和字母',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10036,'en_GB','Contains Digits And Case Letters',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10036,'zh_CN','必须混合数字和大小写字母',NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10037,'en_GB','SUCCESS','Successful Interface Invoke',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10037,'zh_CN','成功','接口调用成功',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10038,'en_GB','FAILURE','Fails Interface Invoke',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10038,'zh_CN','失败','接口调用失败',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10039,'en_GB','NEW',NULL,1,-1,-1,-1,'2017-01-12 19:36:53',-1,'2017-01-12 19:36:53',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10039,'zh_CN','新建',NULL,1,-1,-1,-1,'2017-01-12 19:36:53',10001,'2017-01-14 13:58:21',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10040,'en_GB','SUBMITED',NULL,1,-1,-1,-1,'2017-01-12 19:36:53',-1,'2017-01-12 19:36:53',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10040,'zh_CN','已提交',NULL,1,-1,-1,-1,'2017-01-12 19:36:53',10001,'2017-01-14 13:58:21',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10041,'en_GB','APPROVED',NULL,1,-1,-1,-1,'2017-01-12 19:36:53',-1,'2017-01-12 19:36:53',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10041,'zh_CN','已审批',NULL,1,-1,-1,-1,'2017-01-12 19:36:53',10001,'2017-01-14 13:58:21',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10042,'en_GB','REJECTED',NULL,1,-1,-1,-1,'2017-01-12 19:36:53',-1,'2017-01-12 19:36:53',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10042,'zh_CN','已拒绝',NULL,1,-1,-1,-1,'2017-01-12 19:36:53',10001,'2017-01-14 13:58:21',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10043,'en_GB','Please Choose...','',1,-1,-1,10001,'2017-01-14 13:56:46',10001,'2017-01-14 13:56:46',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10043,'zh_CN','请选择订单状态','',1,-1,-1,10001,'2017-01-14 13:56:46',10001,'2017-01-14 13:58:02',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_code_value_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `CONFIG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONFIG_CODE` varchar(240) NOT NULL COMMENT '配置编码',
  `CONFIG_VALUE` varchar(240) DEFAULT NULL COMMENT '配置值',
  `CATEGORY` varchar(240) DEFAULT NULL COMMENT '配置分类',
  `ENABLED_FLAG` varchar(1) DEFAULT 'Y' COMMENT '启用标记',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`CONFIG_ID`),
  UNIQUE KEY `SYS_CONFIG_U1` (`CONFIG_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (10001,'SYS_TITLE','HAND Application Platform',NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10002,'CAPTCHA','AFTER3',NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10003,'DEFAULT_PASSWORD','123456',NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10004,'PASSWORD_MIN_LENGTH','8',NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10005,'PASSWORD_COMPLEXITY','no_limit',NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10006,'PASSWORD_INVALID_TIME','0',NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10007,'USER_ROLE_MERGE','Y',NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10008,'DEFAULT_TARGET_URL','/index',NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dashboard_b`
--

DROP TABLE IF EXISTS `sys_dashboard_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dashboard_b` (
  `DASHBOARD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DASHBOARD_CODE` varchar(100) NOT NULL COMMENT '仪表盘编码',
  `TITLE` varchar(100) DEFAULT NULL COMMENT '仪表盘标题',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '仪表盘描述',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源ID',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`DASHBOARD_ID`),
  UNIQUE KEY `SYS_DASHBOARD_B_U1` (`DASHBOARD_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dashboard_b`
--

LOCK TABLES `sys_dashboard_b` WRITE;
/*!40000 ALTER TABLE `sys_dashboard_b` DISABLE KEYS */;
INSERT INTO `sys_dashboard_b` VALUES (10001,'DB_WFL_TODO','代办事项11','代办事项',10174,'Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10002,'DB_WFL_TODO2','代办事项22','代办事项',10174,'Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10003,'DB_SYS_JVM_METRICS','系统指标','系统指标',10175,'Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1);
/*!40000 ALTER TABLE `sys_dashboard_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dashboard_tl`
--

DROP TABLE IF EXISTS `sys_dashboard_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dashboard_tl` (
  `DASHBOARD_ID` bigint(20) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL COMMENT '仪表盘标题',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '仪表盘描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`DASHBOARD_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dashboard_tl`
--

LOCK TABLES `sys_dashboard_tl` WRITE;
/*!40000 ALTER TABLE `sys_dashboard_tl` DISABLE KEYS */;
INSERT INTO `sys_dashboard_tl` VALUES (10001,'en_GB','代办事项11','代办事项',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10001,'zh_CN','代办事项11','代办事项',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10002,'en_GB','代办事项22','代办事项',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10002,'zh_CN','代办事项22','代办事项',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10003,'en_GB','system metrics','系统指标',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1),(10003,'zh_CN','系统指标','系统指标',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1);
/*!40000 ALTER TABLE `sys_dashboard_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `FILE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ATTACHMENT_ID` bigint(20) DEFAULT NULL COMMENT '附件ID',
  `FILE_NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `FILE_PATH` varchar(255) DEFAULT NULL COMMENT '文件虚拟路径',
  `FILE_SIZE` decimal(20,0) DEFAULT NULL COMMENT '文件大小',
  `FILE_TYPE` varchar(240) DEFAULT NULL COMMENT '文件类型',
  `UPLOAD_DATE` datetime DEFAULT NULL COMMENT '上传时间',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `SYS_FILE_N1` (`ATTACHMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_function_b`
--

DROP TABLE IF EXISTS `sys_function_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_function_b` (
  `FUNCTION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODULE_CODE` varchar(30) DEFAULT NULL COMMENT '模块编码',
  `FUNCTION_ICON` varchar(100) DEFAULT NULL COMMENT '功能图标',
  `FUNCTION_CODE` varchar(30) NOT NULL COMMENT '功能编码',
  `FUNCTION_NAME` varchar(150) DEFAULT NULL COMMENT '功能名称',
  `FUNCTION_DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `RESOURCE_ID` bigint(20) DEFAULT NULL COMMENT '功能入口',
  `TYPE` varchar(30) DEFAULT NULL COMMENT '功能类型',
  `PARENT_FUNCTION_ID` bigint(20) DEFAULT NULL COMMENT '父功能',
  `ENABLED_FLAG` varchar(1) DEFAULT 'Y' COMMENT '是否启用',
  `FUNCTION_SEQUENCE` decimal(20,0) DEFAULT '1' COMMENT '排序号',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FUNCTION_ID`),
  UNIQUE KEY `SYS_FUNCTION_B_U1` (`FUNCTION_CODE`),
  KEY `SYS_FUNCTION_B_N1` (`PARENT_FUNCTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10046 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_function_b`
--

LOCK TABLES `sys_function_b` WRITE;
/*!40000 ALTER TABLE `sys_function_b` DISABLE KEYS */;
INSERT INTO `sys_function_b` VALUES (10001,'SYS','fa fa-gears','SYSTEM','系统管理','系统管理',NULL,'PAGE',NULL,'Y',99,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'SYS','fa fa-edit','PROMPT','描述维护','维护描述',10139,'PAGE',10001,'Y',20,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'SYS','fa fa-code','CODE','代码维护','代码维护',10130,'PAGE',10001,'Y',30,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'SYS','fa fa-search','LOV','LOV定义','LOV定义',10133,'PAGE',10001,'Y',40,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,'SYS','fa fa-flag','LANGUAGE','语言维护','语言维护',10075,'PAGE',10001,'Y',50,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,'SYS','fa fa-cogs','PROFILE','配置维护','配置维护',10137,'PAGE',10001,'Y',50,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,'SYSCONFIG','fa fa-cog','SYS_CONFIG','系统配置','系统配置',10132,'PAGE',10001,'Y',6,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10008,'ACCOUNT','fa fa-user','ACCOUNT','账户管理','账户管理',NULL,'PAGE',10001,'Y',10,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10009,'ACCOUNT','fa fa-user-plus','ACCOUNT_USER','用户管理','用户管理',10144,'PAGE',10008,'Y',10,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,'ACCOUNT','fa fa-users','ACCOUNT_ROLE','角色管理','角色管理',10140,'PAGE',10008,'Y',20,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,'FUNCTION','fa fa-plug','FUNCTION','功能管理','功能管理',NULL,'PAGE',10001,'Y',10,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10012,'FUNCTION','fa fa-puzzle-piece','FUNCTION_ADD','功能维护','功能定义',10065,'PAGE',10011,'Y',10,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10013,'FUNCTION','fa fa-share-alt-square','SYS_RESOURCE','资源管理','资源管理',10115,'PAGE',10011,'Y',20,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10014,'FUNCTION','fa fa-list','FUNCTION_ASSIGN','功能分配','功能分配',10125,'PAGE',10011,'Y',90,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10015,'JOB','fa fa-clock-o','JOB','计划任务','计划任务',NULL,'PAGE',NULL,'Y',40,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10016,'JOB','fa fa-tasks','JOB_DETAIL','任务明细','任务明细',10023,'PAGE',10015,'Y',10,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10017,'JOB','fa fa-list-ul','JOB_RUNNING_INFO','执行记录','执行记录',10033,'PAGE',10015,'Y',20,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10018,'ATTACH','fa fa-cloud-upload','ATTACH','附件管理','附件管理',NULL,'PAGE',NULL,'Y',30,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10019,'ATTACH','fa fa-file','ATTACH_FILE','文件管理','文件管理',10049,'PAGE',10018,'Y',20,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10020,'ATTACH','fa fa-file','ATTACH_TEST','上传测试','上传测试',10058,'PAGE',10018,'Y',30,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10021,'ATTACH','fa fa-folder-open','ATTACH_CATEGORY','目录管理','目录管理',10045,'PAGE',10018,'Y',10,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10022,'EMAIL','fa fa-envelope','EMAIL','邮件','邮件',NULL,'PAGE',10001,'Y',80,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10023,'EMAIL','fa fa-envelope','EMAIL_ACCOUNT','邮件账户','邮件账户',10085,'PAGE',10022,'Y',10,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10024,'EMAIL','fa fa-envelope','EMAIL_TEMPLATE','邮件模板','邮件模板',10096,'PAGE',10022,'Y',20,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10025,'EMAIL','fa fa-envelope','EMAIL_TEST','邮件测试','邮件测试',10102,'PAGE',10022,'Y',30,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10026,'WFL','fa fa-sitemap','WFL','工作流','工作流',NULL,'PAGE',NULL,'Y',40,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10027,'WFL','fa fa-check-square-o','WFL_MY_TASK','我的待办','个人待办列表',10005,'PAGE',10026,'Y',10,1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10028,'WFL','fa fa-check-square-o','WFL_TASK','待办事项(管理员)','待办事项',10009,'PAGE',10026,'Y',20,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10029,'WFL','fa fa-history','WFL_HISROTY','历史流程','历史流程',10007,'PAGE',10026,'Y',30,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10030,'WFL','fa fa-object-group','WFL_MODEL','流程设计','模型管理',10004,'PAGE',10026,'Y',40,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10031,'WFL','fa fa-wrench','WFL_TEST','工作流测试','工作流测试',10008,'PAGE',10026,'Y',10,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10032,'WFL','fa fa-share-alt','WFL_DEFINITION','流程部署','流程部署',10006,'PAGE',10026,'Y',50,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10033,'HR','fa fa-cubes','HR','组织架构','组织架构',NULL,'PAGE',NULL,'Y',10,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10034,'HR','fa fa-cube','HR_UNIT','组织管理','组织管理',10018,'PAGE',10033,'Y',10,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10035,'HR','fa fa-user','HR_EMPLOYEE','员工管理','员工管理',10011,'PAGE',10033,'Y',30,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10036,'HR','fa fa-user-secret','HR_POSITION','岗位管理','岗位管理',10014,'PAGE',10033,'Y',20,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10037,'FND','fa fa-cube','FND_COMPANY','公司管理','公司管理',10165,'PAGE',10033,'Y',40,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10038,'SYS','fa fa-dashboard','SYS_DASHBOARD','仪表盘配置','仪表盘配置',10170,'PAGE',10001,'Y',15,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10039,'EMAIL','fa fa-envelope','EMAIL_STATUS','邮件状态查询','邮件状态查询',10176,'PAGE',10022,'Y',40,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10040,'IF','fa fa-plug','IF','接口管理','接口管理',NULL,'PAGE',NULL,'Y',80,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10041,'IF','fa fa-share-alt-square','IF_CONFIG','接口定义','接口定义',10178,'PAGE',10040,'Y',10,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10042,'IF','fa fa-bar-chart','IF_INVOKE','调用记录','调用记录',10177,'PAGE',10040,'Y',20,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10043,'SYS','fa fa-heartbeat','SYS_METRICS','系统指标','系统指标',10181,'PAGE',10001,'Y',10,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10044,'SALES','','SALES_MANAGE','销售订单管理','销售订单管理',10192,'PAGE',NULL,'Y',10,9,-1,-1,10001,'2017-01-10 18:58:23',10001,'2017-01-14 18:08:29',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_function_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_function_resource`
--

DROP TABLE IF EXISTS `sys_function_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_function_resource` (
  `FUNC_SRC_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FUNCTION_ID` bigint(20) DEFAULT NULL COMMENT '外键，功能 ID',
  `RESOURCE_ID` bigint(20) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FUNC_SRC_ID`),
  UNIQUE KEY `SYS_FUNCTION_RESOURCE_U1` (`FUNCTION_ID`,`RESOURCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_function_resource`
--

LOCK TABLES `sys_function_resource` WRITE;
/*!40000 ALTER TABLE `sys_function_resource` DISABLE KEYS */;
INSERT INTO `sys_function_resource` VALUES (10001,10002,10139,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,10002,10112,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,10002,10113,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,10002,10114,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,10003,10130,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,10003,10131,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,10003,10060,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10008,10003,10061,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10009,10003,10062,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,10003,10063,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,10003,10064,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10012,10004,10133,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10013,10004,10134,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10014,10004,10135,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10015,10004,10079,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10016,10004,10080,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10017,10004,10081,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10018,10004,10082,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10019,10004,10083,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10020,10004,10084,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10021,10006,10137,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10022,10006,10138,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10023,10006,10106,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10024,10006,10107,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10025,10006,10108,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10026,10006,10109,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10027,10006,10110,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10028,10006,10111,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10029,10012,10065,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10030,10012,10066,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10031,10012,10067,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10032,10012,10068,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10033,10012,10069,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10034,10012,10070,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10035,10012,10071,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10036,10012,10072,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10037,10012,10073,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10038,10012,10074,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10039,10016,10023,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10040,10016,10024,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10041,10016,10025,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10042,10016,10026,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10043,10016,10027,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10044,10016,10028,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10045,10016,10029,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10046,10016,10030,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10047,10016,10031,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10048,10016,10032,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10049,10013,10115,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10050,10013,10116,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10051,10013,10117,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10052,10013,10118,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10053,10013,10119,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10054,10013,10120,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10055,10013,10121,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10056,10013,10122,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10057,10013,10123,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10058,10014,10125,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10059,10014,10126,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10060,10014,10127,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10061,10014,10128,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10062,10014,10129,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10063,10014,10117,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10064,10009,10144,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10065,10009,10145,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10066,10009,10146,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10067,10009,10147,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10068,10009,10148,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10069,10009,10149,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10070,10009,10150,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10071,10009,10151,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10072,10009,10124,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10073,10009,10152,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10074,10010,10140,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10075,10010,10141,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10076,10010,10142,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10077,10010,10143,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10078,10017,10033,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10079,10017,10034,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10080,10005,10075,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10081,10005,10076,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10082,10005,10077,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10083,10005,10078,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10084,10023,10085,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10085,10023,10086,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10086,10023,10087,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10087,10023,10088,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10088,10023,10089,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10089,10023,10090,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10090,10023,10091,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10091,10023,10092,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10092,10023,10093,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10093,10023,10094,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10094,10023,10095,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10095,10024,10096,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10096,10024,10097,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10097,10024,10098,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10098,10024,10099,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10099,10024,10100,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10100,10024,10101,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10101,10025,10102,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10102,10025,10103,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10103,10021,10044,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10104,10021,10045,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10105,10021,10046,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10106,10021,10047,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10107,10021,10048,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10108,10019,10049,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10109,10019,10050,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10110,10019,10051,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10111,10019,10052,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10112,10019,10053,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10113,10019,10054,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10114,10019,10055,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10115,10019,10056,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10116,10019,10057,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10117,10020,10058,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10118,10020,10059,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10119,10031,10008,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10120,10032,10006,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10121,10028,10009,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10122,10029,10007,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10123,10030,10004,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10124,10027,10005,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10125,10007,10132,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10126,10034,10018,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10127,10034,10019,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10128,10034,10020,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10129,10034,10021,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10130,10035,10011,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10131,10035,10012,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10132,10035,10013,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10133,10036,10014,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10134,10036,10015,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10135,10036,10016,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10136,10036,10017,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10137,10037,10165,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10138,10037,10166,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10139,10037,10167,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10140,10037,10168,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10141,10037,10169,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10142,10038,10170,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10143,10038,10171,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10144,10038,10172,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10145,10038,10173,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10146,10041,10178,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10147,10041,10179,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10148,10041,10180,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10149,10042,10177,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10150,10043,10181,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10151,10039,10183,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10152,10039,10182,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10153,10039,10176,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10154,10044,10193,1,-1,-1,10001,'2017-01-14 15:45:49',10001,'2017-01-14 15:45:49',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10157,10044,10196,1,-1,-1,10001,'2017-01-14 17:55:57',10001,'2017-01-14 17:55:57',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10158,10044,10194,1,-1,-1,10001,'2017-01-14 17:55:57',10001,'2017-01-14 17:55:57',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10161,10044,10195,1,-1,-1,10001,'2017-01-14 18:14:12',10001,'2017-01-14 18:14:12',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10162,10044,10192,1,-1,-1,10001,'2017-01-14 18:18:01',10001,'2017-01-14 18:18:01',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_function_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_function_tl`
--

DROP TABLE IF EXISTS `sys_function_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_function_tl` (
  `FUNCTION_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `FUNCTION_NAME` varchar(150) DEFAULT NULL COMMENT '功能名',
  `FUNCTION_DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '功能描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FUNCTION_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_function_tl`
--

LOCK TABLES `sys_function_tl` WRITE;
/*!40000 ALTER TABLE `sys_function_tl` DISABLE KEYS */;
INSERT INTO `sys_function_tl` VALUES (10001,'en_GB','System','System',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10001,'zh_CN','系统管理','系统管理',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'en_GB','Prompt','Prompts',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'zh_CN','描述维护','维护描述',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'en_GB','Code','Lookup Code',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'zh_CN','代码维护','代码维护',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'en_GB','LOV','LOV',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'zh_CN','LOV定义','LOV定义',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,'en_GB','Languages','Language',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,'zh_CN','语言维护','语言维护',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,'en_GB','Profile','Profiles',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,'zh_CN','配置维护','配置维护',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,'en_GB','System Config','System Config',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,'zh_CN','系统配置','系统配置',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10008,'en_GB','Account','Account',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10008,'zh_CN','账户管理','账户管理',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10009,'en_GB','User','Users',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10009,'zh_CN','用户管理','用户管理',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,'en_GB','Role','Roles',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,'zh_CN','角色管理','角色管理',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,'en_GB','Function','Functions',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,'zh_CN','功能管理','功能管理',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10012,'en_GB','Function Definition','Function Define',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10012,'zh_CN','功能维护','功能定义',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10013,'en_GB','Resource','Resources',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10013,'zh_CN','资源管理','资源管理',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10014,'en_GB','Function Assign','Function',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10014,'zh_CN','功能分配','功能分配',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10015,'en_GB','Task','Job',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10015,'zh_CN','计划任务','计划任务',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10016,'en_GB','Task Detail','Job Detail',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10016,'zh_CN','任务明细','任务明细',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10017,'en_GB','Execution Log','Execution Log',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10017,'zh_CN','执行记录','执行记录',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10018,'en_GB','Attachment','Attachment',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10018,'zh_CN','附件管理','附件管理',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10019,'en_GB','Files','Files',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10019,'zh_CN','文件管理','文件管理',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10020,'en_GB','Upload Test','Upload Test',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10020,'zh_CN','上传测试','上传测试',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10021,'en_GB','Category','Category',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10021,'zh_CN','目录管理','目录管理',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10022,'en_GB','Email','Email',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10022,'zh_CN','邮件','邮件',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10023,'en_GB','Email Account','Email Account',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10023,'zh_CN','邮件账户','邮件账户',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10024,'en_GB','Email Template','Email Template',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10024,'zh_CN','邮件模板','邮件模板',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10025,'en_GB','Email Test','Email Test',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10025,'zh_CN','邮件测试','邮件测试',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10026,'en_GB','Workflow','Workflow',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10026,'zh_CN','工作流','工作流',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10027,'en_GB','My Tasks','Personal Task List',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10027,'zh_CN','我的待办','个人待办列表',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10028,'en_GB','Tasks (ADMIN)','Task',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10028,'zh_CN','待办事项(管理员)','待办事项',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10029,'en_GB','Process History','Process History',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10029,'zh_CN','历史流程','历史流程',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10030,'en_GB','Model Design','Models',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10030,'zh_CN','流程设计','模型管理',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10031,'en_GB','Test','Test',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10031,'zh_CN','工作流测试','工作流测试',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10032,'en_GB','Definition','Definition',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10032,'zh_CN','流程部署','流程部署',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10033,'en_GB','组织架构','组织架构',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10033,'zh_CN','组织架构','组织架构',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10034,'en_GB','unit manage','unit manage',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10034,'zh_CN','组织管理','组织管理',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10035,'en_GB','Employee Mgr','Employee Management',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10035,'zh_CN','员工管理','员工管理',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10036,'en_GB','Position Mgr','Management',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10036,'zh_CN','岗位管理','岗位管理',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10037,'en_GB','Company Mgr','Company Management',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10037,'zh_CN','公司管理','公司管理',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10038,'en_GB','Dashboard Config','Dashboard Config',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10038,'zh_CN','仪表盘配置','仪表盘配置',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10039,'en_GB','Email Status','Email Status',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10039,'zh_CN','邮件状态查询','邮件状态查询',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10040,'en_GB','Interface Management','Interface Management',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10040,'zh_CN','接口管理','接口管理',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10041,'en_GB','Interface Definition','Interface Definition',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10041,'zh_CN','接口定义','接口定义',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10042,'en_GB','Invoke Records','Invoke Records',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10042,'zh_CN','调用记录','调用记录',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10043,'en_GB','System Metrics','System Metrics',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10043,'zh_CN','系统指标','系统指标',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10044,'en_GB','销售订单管理','销售订单管理',1,-1,-1,10001,'2017-01-10 18:58:22',10001,'2017-01-10 18:58:22',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10044,'zh_CN','销售订单管理','销售订单管理',1,-1,-1,10001,'2017-01-10 18:58:23',10001,'2017-01-14 18:08:29',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_function_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_if_config_header_b`
--

DROP TABLE IF EXISTS `sys_if_config_header_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_if_config_header_b` (
  `HEADER_ID` varchar(255) NOT NULL,
  `INTERFACE_CODE` varchar(30) NOT NULL COMMENT '系统代码',
  `INTERFACE_TYPE` varchar(10) NOT NULL COMMENT '接口类型',
  `DOMAIN_URL` varchar(200) NOT NULL COMMENT '系统地址',
  `BODY_HEADER` varchar(2000) DEFAULT NULL COMMENT 'SOAP报文前缀',
  `BODY_TAIL` varchar(2000) DEFAULT NULL COMMENT 'SOAP报文后缀',
  `NAMESPACE` varchar(30) DEFAULT NULL COMMENT 'SOAP命名空间',
  `REQUEST_METHOD` varchar(10) NOT NULL COMMENT '请求方法',
  `REQUEST_FORMAT` varchar(30) NOT NULL COMMENT '请求形式',
  `REQUEST_CONTENTTYPE` varchar(80) DEFAULT NULL COMMENT '请求报文格式',
  `REQUEST_ACCEPT` varchar(80) DEFAULT NULL COMMENT '请求接收类型',
  `AUTH_FLAG` varchar(1) NOT NULL COMMENT '是否需要验证',
  `AUTH_USERNAME` varchar(80) DEFAULT NULL COMMENT '校验用户名',
  `AUTH_PASSWORD` varchar(200) DEFAULT NULL COMMENT '校验密码',
  `ENABLE_FLAG` varchar(1) NOT NULL COMMENT '是否有效',
  `NAME` varchar(200) NOT NULL COMMENT '系统名称',
  `DESCRIPTION` varchar(255) NOT NULL COMMENT '系统描述',
  `SYSTEM_TYPE` varchar(10) DEFAULT NULL COMMENT '系统类型',
  `MAPPER_CLASS` varchar(255) DEFAULT NULL COMMENT '包装类',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`HEADER_ID`),
  UNIQUE KEY `SYS_IF_CONFIG_HEADER_U1` (`INTERFACE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_if_config_header_b`
--

LOCK TABLES `sys_if_config_header_b` WRITE;
/*!40000 ALTER TABLE `sys_if_config_header_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_if_config_header_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_if_config_header_tl`
--

DROP TABLE IF EXISTS `sys_if_config_header_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_if_config_header_tl` (
  `HEADER_ID` varchar(255) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL COMMENT '系统名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '系统描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`HEADER_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_if_config_header_tl`
--

LOCK TABLES `sys_if_config_header_tl` WRITE;
/*!40000 ALTER TABLE `sys_if_config_header_tl` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_if_config_header_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_if_config_line_b`
--

DROP TABLE IF EXISTS `sys_if_config_line_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_if_config_line_b` (
  `LINE_ID` varchar(255) NOT NULL,
  `HEADER_ID` varchar(255) NOT NULL COMMENT '行Id',
  `LINE_CODE` varchar(30) NOT NULL COMMENT '接口代码',
  `IFT_URL` varchar(200) NOT NULL COMMENT '接口地址',
  `ENABLE_FLAG` varchar(1) NOT NULL COMMENT '是否有效',
  `LINE_NAME` varchar(50) DEFAULT NULL COMMENT '接口名称',
  `LINE_DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '接口描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`LINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_if_config_line_b`
--

LOCK TABLES `sys_if_config_line_b` WRITE;
/*!40000 ALTER TABLE `sys_if_config_line_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_if_config_line_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_if_config_line_tl`
--

DROP TABLE IF EXISTS `sys_if_config_line_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_if_config_line_tl` (
  `LINE_ID` varchar(255) NOT NULL DEFAULT '',
  `LANG` varchar(50) NOT NULL,
  `LINE_NAME` varchar(50) DEFAULT NULL COMMENT '接口名称',
  `LINE_DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '接口描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`LINE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_if_config_line_tl`
--

LOCK TABLES `sys_if_config_line_tl` WRITE;
/*!40000 ALTER TABLE `sys_if_config_line_tl` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_if_config_line_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_if_invoke_inbound`
--

DROP TABLE IF EXISTS `sys_if_invoke_inbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_if_invoke_inbound` (
  `INBOUND_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `INTERFACE_NAME` varchar(255) NOT NULL COMMENT '接口名称',
  `INTERFACE_URL` varchar(200) NOT NULL COMMENT '接口地址',
  `REQUEST_TIME` datetime NOT NULL COMMENT '请求时间',
  `REQUEST_HEADER_PARAMETER` varchar(2000) DEFAULT NULL COMMENT '请求header参数',
  `REQUEST_BODY_PARAMETER` longtext COMMENT '请求body参数',
  `REQUEST_METHOD` varchar(10) DEFAULT NULL COMMENT '请求方式',
  `REQUEST_STATUS` varchar(10) DEFAULT NULL COMMENT '请求状态',
  `RESPONSE_CONTENT` longtext COMMENT '响应内容',
  `RESPONSE_TIME` bigint(20) DEFAULT NULL COMMENT '响应时间',
  `STACKTRACE` longtext COMMENT '错误堆栈',
  `IP` varchar(40) DEFAULT NULL COMMENT 'ip地址',
  `REFERER` varchar(240) DEFAULT NULL,
  `USER_AGENT` varchar(240) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`INBOUND_ID`),
  KEY `SYS_IF_INVOKE_INBOUND_N1` (`INTERFACE_NAME`),
  KEY `SYS_IF_INVOKE_INBOUND_N2` (`INTERFACE_URL`),
  KEY `SYS_IF_INVOKE_INBOUND_N3` (`REQUEST_TIME`),
  KEY `SYS_IF_INVOKE_INBOUND_N4` (`REQUEST_STATUS`)
) ENGINE=InnoDB AUTO_INCREMENT=10204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_if_invoke_inbound`
--

LOCK TABLES `sys_if_invoke_inbound` WRITE;
/*!40000 ALTER TABLE `sys_if_invoke_inbound` DISABLE KEYS */;
INSERT INTO `sys_if_invoke_inbound` VALUES (10001,'Login','/login','2017-01-07 14:39:52',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',61,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-07 14:39:52',-1,'2017-01-07 14:39:52',-1),(10002,'Login','/login','2017-01-08 15:10:52',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',38,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-08 15:10:52',-1,'2017-01-08 15:10:52',-1),(10003,'Login','/login','2017-01-08 15:10:53',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',2,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-08 15:10:52',-1,'2017-01-08 15:10:52',-1),(10004,'Login','/login','2017-01-08 15:12:27',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-08 15:12:26',-1,'2017-01-08 15:12:26',-1),(10005,'Login','/login','2017-01-08 15:22:22',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-08 15:22:21',-1,'2017-01-08 15:22:21',-1),(10006,'Login','/login','2017-01-08 15:27:46',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'redirect:index\'; model is {SYS_TITLE=HAND Application Platform}',1,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-08 15:27:45',-1,'2017-01-08 15:27:45',-1),(10007,'Login','/login','2017-01-08 17:39:47',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',54,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-08 17:39:47',-1,'2017-01-08 17:39:47',-1),(10008,'Login','/login','2017-01-08 17:39:48',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-08 17:39:48',-1,'2017-01-08 17:39:48',-1),(10009,'Login','/login','2017-01-09 19:17:41',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',44,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-09 19:17:41',-1,'2017-01-09 19:17:41',-1),(10010,'Login','/login','2017-01-09 19:17:42',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-09 19:17:42',-1,'2017-01-09 19:17:42',-1),(10011,'Login','/login','2017-01-09 19:17:43',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-09 19:17:43',-1,'2017-01-09 19:17:43',-1),(10012,'Login','/login','2017-01-09 19:18:40',NULL,NULL,'POST','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false, msg=用户名或密码错误}',2,NULL,'192.168.86.1','http://localhost:8080/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-09 19:18:40',-1,'2017-01-09 19:18:40',-1),(10013,'Login','/login','2017-01-09 20:46:12',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',38,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-09 20:46:11',-1,'2017-01-09 20:46:11',-1),(10014,'Login','/login','2017-01-09 20:46:13',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-09 20:46:12',-1,'2017-01-09 20:46:12',-1),(10015,'Login','/login','2017-01-09 22:31:19',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',46,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-09 22:31:19',-1,'2017-01-09 22:31:19',-1),(10016,'Login','/login','2017-01-09 22:31:20',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-09 22:31:19',-1,'2017-01-09 22:31:19',-1),(10017,'Login','/login','2017-01-10 11:09:42',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',44,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-10 11:09:42',-1,'2017-01-10 11:09:42',-1),(10018,'Login','/login','2017-01-10 11:09:43',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-10 11:09:42',-1,'2017-01-10 11:09:42',-1),(10019,'Login','/login','2017-01-10 11:09:44',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:09:43',-1,'2017-01-10 11:09:43',-1),(10020,'Login','/login.html','2017-01-10 11:25:43',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'redirect:index\'; model is {SYS_TITLE=HAND Application Platform}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:25:42',-1,'2017-01-10 11:25:42',-1),(10021,'Login','/login','2017-01-10 11:44:08',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',60,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-10 11:44:07',-1,'2017-01-10 11:44:07',-1),(10022,'Login','/login','2017-01-10 11:44:09',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',0,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-10 11:44:08',-1,'2017-01-10 11:44:08',-1),(10023,'Login','/login','2017-01-10 11:47:42',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1','http://passport.csdn.net/content/loginbox/style.css?r=1484020060942','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:47:41',-1,'2017-01-10 11:47:41',-1),(10024,'Login','/login','2017-01-10 11:55:04',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:55:03',-1,'2017-01-10 11:55:03',-1),(10025,'Login','/login','2017-01-10 11:56:23',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:56:23',-1,'2017-01-10 11:56:23',-1),(10026,'Login','/login','2017-01-10 11:57:30',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:57:30',-1,'2017-01-10 11:57:30',-1),(10027,'Login','/login','2017-01-10 11:57:54',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:57:53',-1,'2017-01-10 11:57:53',-1),(10028,'Login','/login','2017-01-10 11:58:11',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:58:10',-1,'2017-01-10 11:58:10',-1),(10029,'Login','/login','2017-01-10 11:59:18',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:59:18',-1,'2017-01-10 11:59:18',-1),(10030,'Login','/login','2017-01-10 11:59:30',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:59:29',-1,'2017-01-10 11:59:29',-1),(10031,'Login','/login','2017-01-10 11:59:31',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:59:30',-1,'2017-01-10 11:59:30',-1),(10032,'Login','/login','2017-01-10 11:59:31',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:59:30',-1,'2017-01-10 11:59:30',-1),(10033,'Login','/login','2017-01-10 11:59:31',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:59:31',-1,'2017-01-10 11:59:31',-1),(10034,'Login','/login','2017-01-10 11:59:31',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:59:31',-1,'2017-01-10 11:59:31',-1),(10035,'Login','/login','2017-01-10 11:59:40','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:59:40',-1,'2017-01-10 11:59:40',-1),(10036,'Login','/login','2017-01-10 11:59:47',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:59:46',-1,'2017-01-10 11:59:46',-1),(10037,'Login','/login','2017-01-10 11:59:52',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:59:52',-1,'2017-01-10 11:59:52',-1),(10038,'Login','/login','2017-01-10 12:02:59','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 12:02:58',-1,'2017-01-10 12:02:58',-1),(10039,'Login','/login','2017-01-10 12:03:03',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 12:03:03',-1,'2017-01-10 12:03:03',-1),(10040,'Login','/login','2017-01-10 12:03:09',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 12:03:08',-1,'2017-01-10 12:03:08',-1),(10041,'Login','/login','2017-01-10 12:04:02',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 12:04:01',-1,'2017-01-10 12:04:01',-1),(10042,'Login','/login','2017-01-10 12:08:46',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 12:08:45',-1,'2017-01-10 12:08:45',-1),(10043,'Login','/login','2017-01-10 13:57:58','logout',NULL,'GET','success','ModelAndView: reference to view with name \'redirect:index\'; model is {SYS_TITLE=HAND Application Platform}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 13:57:58',-1,'2017-01-10 13:57:58',-1),(10044,'Login','/login','2017-01-10 14:01:32',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 14:01:31',-1,'2017-01-10 14:01:31',-1),(10045,'Login','/login','2017-01-10 14:17:54','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 14:17:54',-1,'2017-01-10 14:17:54',-1),(10046,'Login','/login','2017-01-10 14:21:26',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',51,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-10 14:21:25',-1,'2017-01-10 14:21:25',-1),(10047,'Login','/login','2017-01-10 14:21:26',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-10 14:21:26',-1,'2017-01-10 14:21:26',-1),(10048,'Login','/login','2017-01-10 14:36:31',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',67,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-10 14:36:30',-1,'2017-01-10 14:36:30',-1),(10049,'Login','/login','2017-01-10 14:36:32',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',0,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-10 14:36:31',-1,'2017-01-10 14:36:31',-1),(10050,'Login','/login','2017-01-10 18:54:33',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',51,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-10 18:54:33',-1,'2017-01-10 18:54:33',-1),(10051,'Login','/login','2017-01-10 18:54:34',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-10 18:54:33',-1,'2017-01-10 18:54:33',-1),(10052,'Login','/login','2017-01-10 18:54:35',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 18:54:34',-1,'2017-01-10 18:54:34',-1),(10053,'Login','/login','2017-01-10 19:00:51','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 19:00:51',-1,'2017-01-10 19:00:51',-1),(10054,'Login','/login','2017-01-10 19:05:28','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 19:05:28',-1,'2017-01-10 19:05:28',-1),(10055,'Login','/login','2017-01-10 19:12:25','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 19:12:24',-1,'2017-01-10 19:12:24',-1),(10056,'Login','/login','2017-01-10 19:53:45','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 19:53:44',-1,'2017-01-10 19:53:44',-1),(10057,'Login','/login','2017-01-10 20:10:57','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 20:10:57',-1,'2017-01-10 20:10:57',-1),(10058,'Login','/login','2017-01-10 20:18:38','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/index.html','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 20:18:37',-1,'2017-01-10 20:18:37',-1),(10059,'Login','/login','2017-01-10 20:27:49',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',48,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-10 20:27:49',-1,'2017-01-10 20:27:49',-1),(10060,'Login','/login','2017-01-10 20:27:50',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',2,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-10 20:27:50',-1,'2017-01-10 20:27:50',-1),(10061,'Login','/login','2017-01-10 20:29:58','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 20:29:57',-1,'2017-01-10 20:29:57',-1),(10062,'Login','/login','2017-01-10 21:05:55',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',40,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-10 21:05:55',-1,'2017-01-10 21:05:55',-1),(10063,'Login','/login','2017-01-10 21:05:56',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-10 21:05:55',-1,'2017-01-10 21:05:55',-1),(10064,'Login','/login','2017-01-11 09:46:52',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',43,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 09:46:51',-1,'2017-01-11 09:46:51',-1),(10065,'Login','/login','2017-01-11 09:46:53',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 09:46:52',-1,'2017-01-11 09:46:52',-1),(10066,'Login','/login','2017-01-11 09:46:53',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-11 09:46:53',-1,'2017-01-11 09:46:53',-1),(10067,'Login','/login','2017-01-11 11:26:14',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',38,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 11:26:14',-1,'2017-01-11 11:26:14',-1),(10068,'Login','/login','2017-01-11 11:26:15',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',3,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 11:26:15',-1,'2017-01-11 11:26:15',-1),(10069,'Login','/login','2017-01-11 13:42:28',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',66,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 13:42:27',-1,'2017-01-11 13:42:27',-1),(10070,'Login','/login','2017-01-11 13:42:28',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 13:42:28',-1,'2017-01-11 13:42:28',-1),(10071,'Login','/login','2017-01-11 13:56:50',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',39,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 13:56:49',-1,'2017-01-11 13:56:49',-1),(10072,'Login','/login','2017-01-11 13:56:50',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 13:56:50',-1,'2017-01-11 13:56:50',-1),(10073,'Login','/login','2017-01-11 13:57:38','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-11 13:57:38',-1,'2017-01-11 13:57:38',-1),(10074,'Login','/login','2017-01-11 13:57:40',NULL,NULL,'POST','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false, msg=用户名或密码错误}',0,NULL,'192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-11 13:57:39',-1,'2017-01-11 13:57:39',-1),(10075,'Login','/login','2017-01-11 14:08:07',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',40,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 14:08:06',-1,'2017-01-11 14:08:06',-1),(10076,'Login','/login','2017-01-11 14:08:08',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 14:08:07',-1,'2017-01-11 14:08:07',-1),(10077,'Login','/login','2017-01-11 14:11:44',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',67,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 14:11:44',-1,'2017-01-11 14:11:44',-1),(10078,'Login','/login','2017-01-11 14:11:45',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 14:11:44',-1,'2017-01-11 14:11:44',-1),(10079,'Login','/login','2017-01-11 14:39:14',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',66,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 14:39:14',-1,'2017-01-11 14:39:14',-1),(10080,'Login','/login','2017-01-11 14:39:15',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 14:39:15',-1,'2017-01-11 14:39:15',-1),(10081,'Login','/login','2017-01-11 14:58:58','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-11 14:58:58',-1,'2017-01-11 14:58:58',-1),(10082,'Login','/login','2017-01-11 15:35:44',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',49,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 15:35:43',-1,'2017-01-11 15:35:43',-1),(10083,'Login','/login','2017-01-11 15:35:44',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 15:35:44',-1,'2017-01-11 15:35:44',-1),(10084,'Login','/login','2017-01-11 19:05:43',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',40,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 19:05:43',-1,'2017-01-11 19:05:43',-1),(10085,'Login','/login','2017-01-11 19:05:44',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 19:05:43',-1,'2017-01-11 19:05:43',-1),(10086,'Login','/login','2017-01-11 19:57:27',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',44,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 19:57:26',-1,'2017-01-11 19:57:26',-1),(10087,'Login','/login','2017-01-11 19:57:27',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',2,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 19:57:27',-1,'2017-01-11 19:57:27',-1),(10088,'Login','/login','2017-01-11 20:13:58',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',40,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 20:13:57',-1,'2017-01-11 20:13:57',-1),(10089,'Login','/login','2017-01-11 20:13:58',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 20:13:58',-1,'2017-01-11 20:13:58',-1),(10090,'Login','/login','2017-01-11 20:41:02',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',42,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 20:41:01',-1,'2017-01-11 20:41:01',-1),(10091,'Login','/login','2017-01-11 20:41:02',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 20:41:02',-1,'2017-01-11 20:41:02',-1),(10092,'Login','/login','2017-01-11 20:46:18','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-11 20:46:18',-1,'2017-01-11 20:46:18',-1),(10093,'Login','/login','2017-01-11 20:47:03','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-11 20:47:03',-1,'2017-01-11 20:47:03',-1),(10094,'Login','/login','2017-01-11 20:56:04',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',45,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 20:56:03',-1,'2017-01-11 20:56:03',-1),(10095,'Login','/login','2017-01-11 20:56:05',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',2,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 20:56:04',-1,'2017-01-11 20:56:04',-1),(10096,'Login','/login','2017-01-11 21:11:32',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',49,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 21:11:31',-1,'2017-01-11 21:11:31',-1),(10097,'Login','/login','2017-01-11 21:11:32',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 21:11:32',-1,'2017-01-11 21:11:32',-1),(10098,'Login','/login','2017-01-11 21:23:27',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',42,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 21:23:27',-1,'2017-01-11 21:23:27',-1),(10099,'Login','/login','2017-01-11 21:23:28',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 21:23:27',-1,'2017-01-11 21:23:27',-1),(10100,'Login','/login','2017-01-11 21:30:50',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',44,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 21:30:50',-1,'2017-01-11 21:30:50',-1),(10101,'Login','/login','2017-01-11 21:30:51',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 21:30:50',-1,'2017-01-11 21:30:50',-1),(10102,'Login','/login','2017-01-11 22:18:35',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',124,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 22:18:35',-1,'2017-01-11 22:18:35',-1),(10103,'Login','/login','2017-01-11 22:18:36',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 22:18:36',-1,'2017-01-11 22:18:36',-1),(10104,'Login','/login','2017-01-11 22:22:43',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',44,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 22:22:42',-1,'2017-01-11 22:22:42',-1),(10105,'Login','/login','2017-01-11 22:22:43',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-11 22:22:43',-1,'2017-01-11 22:22:43',-1),(10106,'Login','/login','2017-01-12 15:45:56',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',39,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 15:45:55',-1,'2017-01-12 15:45:55',-1),(10107,'Login','/login','2017-01-12 15:45:56',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 15:45:56',-1,'2017-01-12 15:45:56',-1),(10108,'Login','/login','2017-01-12 15:45:57',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-12 15:45:56',-1,'2017-01-12 15:45:56',-1),(10109,'Login','/login','2017-01-12 16:08:30',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',45,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 16:08:29',-1,'2017-01-12 16:08:29',-1),(10110,'Login','/login','2017-01-12 16:08:30',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 16:08:30',-1,'2017-01-12 16:08:30',-1),(10111,'Login','/login','2017-01-12 16:41:05',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',42,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 16:41:04',-1,'2017-01-12 16:41:04',-1),(10112,'Login','/login','2017-01-12 16:41:06',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 16:41:05',-1,'2017-01-12 16:41:05',-1),(10113,'Login','/login','2017-01-12 17:07:07',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',44,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 17:07:07',-1,'2017-01-12 17:07:07',-1),(10114,'Login','/login','2017-01-12 17:07:08',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 17:07:07',-1,'2017-01-12 17:07:07',-1),(10115,'Login','/login','2017-01-12 17:10:57',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',39,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 17:10:57',-1,'2017-01-12 17:10:57',-1),(10116,'Login','/login','2017-01-12 17:10:58',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 17:10:58',-1,'2017-01-12 17:10:58',-1),(10117,'Login','/login','2017-01-12 17:18:12',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',60,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 17:18:12',-1,'2017-01-12 17:18:12',-1),(10118,'Login','/login','2017-01-12 17:18:13',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 17:18:13',-1,'2017-01-12 17:18:13',-1),(10119,'Login','/login','2017-01-12 17:50:20',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',44,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 17:50:19',-1,'2017-01-12 17:50:19',-1),(10120,'Login','/login','2017-01-12 17:50:20',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 17:50:20',-1,'2017-01-12 17:50:20',-1),(10121,'Login','/login','2017-01-12 18:37:05',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',52,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 18:37:04',-1,'2017-01-12 18:37:04',-1),(10122,'Login','/login','2017-01-12 18:37:05',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',2,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 18:37:05',-1,'2017-01-12 18:37:05',-1),(10123,'Login','/login','2017-01-12 20:13:56',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',37,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 20:13:55',-1,'2017-01-12 20:13:55',-1),(10124,'Login','/login','2017-01-12 20:13:57',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 20:13:56',-1,'2017-01-12 20:13:56',-1),(10125,'Login','/login','2017-01-12 20:42:07',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',51,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 20:42:07',-1,'2017-01-12 20:42:07',-1),(10126,'Login','/login','2017-01-12 20:42:08',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-12 20:42:08',-1,'2017-01-12 20:42:08',-1),(10127,'Login','/login','2017-01-13 09:31:34',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',58,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 09:31:34',-1,'2017-01-13 09:31:34',-1),(10128,'Login','/login','2017-01-13 09:31:35',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 09:31:35',-1,'2017-01-13 09:31:35',-1),(10129,'Login','/login','2017-01-13 09:31:36',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-13 09:31:36',-1,'2017-01-13 09:31:36',-1),(10130,'Login','/login','2017-01-13 09:39:07','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-13 09:39:07',-1,'2017-01-13 09:39:07',-1),(10131,'Login','/login','2017-01-13 11:34:13',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',56,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 11:34:13',-1,'2017-01-13 11:34:13',-1),(10132,'Login','/login','2017-01-13 11:34:14',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 11:34:13',-1,'2017-01-13 11:34:13',-1),(10133,'Login','/login','2017-01-13 14:41:39',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',47,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 14:41:38',-1,'2017-01-13 14:41:38',-1),(10134,'Login','/login','2017-01-13 14:41:39',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 14:41:39',-1,'2017-01-13 14:41:39',-1),(10135,'Login','/login','2017-01-13 14:56:33',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',40,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 14:56:32',-1,'2017-01-13 14:56:32',-1),(10136,'Login','/login','2017-01-13 14:56:33',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 14:56:33',-1,'2017-01-13 14:56:33',-1),(10137,'Login','/login','2017-01-13 15:03:44',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',74,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 15:03:44',-1,'2017-01-13 15:03:44',-1),(10138,'Login','/login','2017-01-13 15:03:45',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 15:03:45',-1,'2017-01-13 15:03:45',-1),(10139,'Login','/login','2017-01-13 15:21:40','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-13 15:21:39',-1,'2017-01-13 15:21:39',-1),(10140,'Login','/login','2017-01-13 15:25:46',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',39,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 15:25:46',-1,'2017-01-13 15:25:46',-1),(10141,'Login','/login','2017-01-13 15:25:47',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 15:25:46',-1,'2017-01-13 15:25:46',-1),(10142,'Login','/login','2017-01-13 15:34:41','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-13 15:34:41',-1,'2017-01-13 15:34:41',-1),(10143,'Login','/login','2017-01-13 15:47:04','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-13 15:47:03',-1,'2017-01-13 15:47:03',-1),(10144,'Login','/login','2017-01-13 16:37:57',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',69,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 16:37:56',-1,'2017-01-13 16:37:56',-1),(10145,'Login','/login','2017-01-13 16:37:58',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',11,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 16:37:58',-1,'2017-01-13 16:37:58',-1),(10146,'Login','/login','2017-01-13 16:54:09',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',60,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 16:54:08',-1,'2017-01-13 16:54:08',-1),(10147,'Login','/login','2017-01-13 16:54:09',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 16:54:09',-1,'2017-01-13 16:54:09',-1),(10148,'Login','/login','2017-01-13 17:19:35',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',72,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 17:19:35',-1,'2017-01-13 17:19:35',-1),(10149,'Login','/login','2017-01-13 17:19:36',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 17:19:36',-1,'2017-01-13 17:19:36',-1),(10150,'Login','/login','2017-01-13 17:30:36','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-13 17:30:35',-1,'2017-01-13 17:30:35',-1),(10151,'Login','/login','2017-01-13 17:49:34',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',60,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 17:49:34',-1,'2017-01-13 17:49:34',-1),(10152,'Login','/login','2017-01-13 17:49:35',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 17:49:34',-1,'2017-01-13 17:49:34',-1),(10153,'Login','/login','2017-01-13 20:12:05',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',44,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 20:12:04',-1,'2017-01-13 20:12:04',-1),(10154,'Login','/login','2017-01-13 20:12:05',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',0,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-13 20:12:05',-1,'2017-01-13 20:12:05',-1),(10155,'Login','/login','2017-01-14 10:16:51',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',36,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 10:16:51',-1,'2017-01-14 10:16:51',-1),(10156,'Login','/login','2017-01-14 10:16:52',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',0,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 10:16:52',-1,'2017-01-14 10:16:52',-1),(10157,'Login','/login','2017-01-14 10:16:53',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 10:16:52',-1,'2017-01-14 10:16:52',-1),(10158,'Login','/login','2017-01-14 11:40:45',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',34,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 11:40:45',-1,'2017-01-14 11:40:45',-1),(10159,'Login','/login','2017-01-14 11:40:46',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 11:40:45',-1,'2017-01-14 11:40:45',-1),(10160,'Login','/login','2017-01-14 12:10:46',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',64,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 12:10:46',-1,'2017-01-14 12:10:46',-1),(10161,'Login','/login','2017-01-14 12:10:48',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 12:10:47',-1,'2017-01-14 12:10:47',-1),(10162,'Login','/login','2017-01-14 12:22:21',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',84,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 12:22:21',-1,'2017-01-14 12:22:21',-1),(10163,'Login','/login','2017-01-14 12:22:22',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',2,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 12:22:22',-1,'2017-01-14 12:22:22',-1),(10164,'Login','/login','2017-01-14 12:29:51',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',42,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 12:29:50',-1,'2017-01-14 12:29:50',-1),(10165,'Login','/login','2017-01-14 12:29:51',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 12:29:51',-1,'2017-01-14 12:29:51',-1),(10166,'Login','/login','2017-01-14 13:13:09',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',50,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 13:13:09',-1,'2017-01-14 13:13:09',-1),(10167,'Login','/login','2017-01-14 13:13:10',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 13:13:09',-1,'2017-01-14 13:13:09',-1),(10168,'Login','/login','2017-01-14 13:18:47',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',49,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 13:18:46',-1,'2017-01-14 13:18:46',-1),(10169,'Login','/login','2017-01-14 13:18:48',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',2,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 13:18:47',-1,'2017-01-14 13:18:47',-1),(10170,'Login','/login','2017-01-14 13:25:48',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',93,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 13:25:48',-1,'2017-01-14 13:25:48',-1),(10171,'Login','/login','2017-01-14 13:25:49',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 13:25:48',-1,'2017-01-14 13:25:48',-1),(10172,'Login','/login','2017-01-14 13:36:32',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',52,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 13:36:32',-1,'2017-01-14 13:36:32',-1),(10173,'Login','/login','2017-01-14 13:36:34',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',2,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 13:36:33',-1,'2017-01-14 13:36:33',-1),(10174,'Login','/login','2017-01-14 13:41:15',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',45,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 13:41:14',-1,'2017-01-14 13:41:14',-1),(10175,'Login','/login','2017-01-14 13:41:16',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',0,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 13:41:15',-1,'2017-01-14 13:41:15',-1),(10176,'Login','/login','2017-01-14 13:43:55',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',65,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 13:43:54',-1,'2017-01-14 13:43:54',-1),(10177,'Login','/login','2017-01-14 13:43:56',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',2,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-14 13:43:55',-1,'2017-01-14 13:43:55',-1),(10178,'Login','/login','2017-01-14 18:05:07','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:05:06',-1,'2017-01-14 18:05:06',-1),(10179,'Login','/login','2017-01-14 18:05:30','logout',NULL,'GET','success','ModelAndView: reference to view with name \'redirect:index\'; model is {SYS_TITLE=HAND Application Platform}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:05:30',-1,'2017-01-14 18:05:30',-1),(10180,'Login','/login','2017-01-14 18:05:34','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:05:34',-1,'2017-01-14 18:05:34',-1),(10181,'Login','/login','2017-01-14 18:07:40','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:07:39',-1,'2017-01-14 18:07:39',-1),(10182,'Login','/login','2017-01-14 18:08:12','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:08:11',-1,'2017-01-14 18:08:11',-1),(10183,'Login','/login','2017-01-14 18:09:59','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:09:58',-1,'2017-01-14 18:09:58',-1),(10184,'Login','/login','2017-01-14 18:10:27','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:10:27',-1,'2017-01-14 18:10:27',-1),(10185,'Login','/login','2017-01-14 18:11:26','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:11:25',-1,'2017-01-14 18:11:25',-1),(10186,'Login','/login','2017-01-14 18:12:17','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:12:16',-1,'2017-01-14 18:12:16',-1),(10187,'Login','/login','2017-01-14 18:14:55','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:14:54',-1,'2017-01-14 18:14:54',-1),(10188,'Login','/login','2017-01-14 18:15:31','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:15:30',-1,'2017-01-14 18:15:30',-1),(10189,'Login','/login','2017-01-14 18:19:54','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:19:54',-1,'2017-01-14 18:19:54',-1),(10190,'Login','/login','2017-01-14 18:24:16','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:24:16',-1,'2017-01-14 18:24:16',-1),(10191,'Login','/login','2017-01-14 18:27:12','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:27:11',-1,'2017-01-14 18:27:11',-1),(10192,'Login','/login','2017-01-15 11:32:23',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',55,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-15 11:32:22',-1,'2017-01-15 11:32:22',-1),(10193,'Login','/login','2017-01-15 11:32:24',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-15 11:32:23',-1,'2017-01-15 11:32:23',-1),(10194,'Login','/login','2017-01-15 11:32:24',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-15 11:32:24',-1,'2017-01-15 11:32:24',-1),(10195,'Login','/login','2017-01-15 11:49:34',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1',NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-15 11:49:34',-1,'2017-01-15 11:49:34',-1),(10196,'Login','/login','2017-01-15 12:53:04','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-15 12:53:04',-1,'2017-01-15 12:53:04',-1),(10197,'Login','/login','2017-01-15 13:01:40',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',54,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-15 13:01:40',-1,'2017-01-15 13:01:40',-1),(10198,'Login','/login','2017-01-15 13:01:41',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-15 13:01:40',-1,'2017-01-15 13:01:40',-1),(10199,'Login','/login','2017-01-15 13:02:08','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-15 13:02:08',-1,'2017-01-15 13:02:08',-1),(10200,'Login','/login','2017-01-15 13:48:37','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',1,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-15 13:48:37',-1,'2017-01-15 13:48:37',-1),(10201,'Login','/login','2017-01-15 15:23:21','logout',NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}',0,NULL,'192.168.86.1','http://localhost:8080/','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-15 15:23:21',-1,'2017-01-15 15:23:21',-1),(10202,'Login','/login','2017-01-15 18:03:28',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',49,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-15 18:03:27',-1,'2017-01-15 18:03:27',-1),(10203,'Login','/login','2017-01-15 18:03:29',NULL,NULL,'GET','success','ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}',1,NULL,'192.168.86.1',NULL,'IntelliJ IDEA/163.10154.41',1,-1,-1,-1,'2017-01-15 18:03:28',-1,'2017-01-15 18:03:28',-1);
/*!40000 ALTER TABLE `sys_if_invoke_inbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_if_invoke_outbound`
--

DROP TABLE IF EXISTS `sys_if_invoke_outbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_if_invoke_outbound` (
  `OUTBOUND_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `INTERFACE_NAME` varchar(255) NOT NULL COMMENT '接口名称',
  `INTERFACE_URL` varchar(200) NOT NULL COMMENT '接口地址',
  `REQUEST_TIME` datetime NOT NULL COMMENT '请求时间',
  `REQUEST_PARAMETER` longtext COMMENT '请求参数',
  `REQUEST_STATUS` varchar(10) DEFAULT NULL COMMENT '请求状态',
  `RESPONSE_CONTENT` longtext COMMENT '响应内容',
  `RESPONSE_TIME` bigint(20) DEFAULT NULL COMMENT '响应时间',
  `RESPONSE_CODE` varchar(30) DEFAULT NULL COMMENT 'httpCode',
  `STACKTRACE` longtext COMMENT '错误堆栈',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`OUTBOUND_ID`),
  KEY `SYS_IF_INVOKE_OUTBOUND_N1` (`INTERFACE_NAME`),
  KEY `SYS_IF_INVOKE_OUTBOUND_N2` (`INTERFACE_URL`),
  KEY `SYS_IF_INVOKE_OUTBOUND_N3` (`REQUEST_TIME`),
  KEY `SYS_IF_INVOKE_OUTBOUND_N4` (`REQUEST_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_if_invoke_outbound`
--

LOCK TABLES `sys_if_invoke_outbound` WRITE;
/*!40000 ALTER TABLE `sys_if_invoke_outbound` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_if_invoke_outbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_running_info`
--

DROP TABLE IF EXISTS `sys_job_running_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_running_info` (
  `JOB_RUNNING_INFO_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `JOB_NAME` varchar(225) DEFAULT NULL,
  `JOB_GROUP` varchar(225) DEFAULT NULL,
  `JOB_RESULT` varchar(225) DEFAULT NULL,
  `JOB_STATUS` varchar(225) DEFAULT NULL,
  `JOB_STATUS_MESSAGE` varchar(225) DEFAULT NULL,
  `TRIGGER_NAME` varchar(225) DEFAULT NULL,
  `TRIGGER_GROUP` varchar(225) DEFAULT NULL,
  `PREVIOUS_FIRE_TIME` datetime DEFAULT NULL,
  `FIRE_TIME` datetime DEFAULT NULL,
  `NEXT_FIRE_TIME` datetime DEFAULT NULL,
  `REFIRE_COUNT` bigint(20) DEFAULT '0',
  `FIRE_INSTANCE_ID` varchar(225) DEFAULT NULL,
  `SCHEDULER_INSTANCE_ID` varchar(225) DEFAULT NULL,
  `SCHEDULED_FIRE_TIME` datetime DEFAULT NULL,
  `EXECUTION_SUMMARY` varchar(225) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`JOB_RUNNING_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_running_info`
--

LOCK TABLES `sys_job_running_info` WRITE;
/*!40000 ALTER TABLE `sys_job_running_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_running_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_lang_b`
--

DROP TABLE IF EXISTS `sys_lang_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_lang_b` (
  `LANG_CODE` varchar(10) NOT NULL,
  `BASE_LANG` varchar(10) DEFAULT NULL COMMENT '基语言',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `JOB_RESULT` varchar(225) DEFAULT NULL,
  `JOB_STATUS` varchar(225) DEFAULT NULL,
  `JOB_STATUS_MESSAGE` varchar(225) DEFAULT NULL,
  `TRIGGER_NAME` varchar(225) DEFAULT NULL,
  `TRIGGER_GROUP` varchar(225) DEFAULT NULL,
  `PREVIOUS_FIRE_TIME` datetime DEFAULT NULL,
  `FIRE_TIME` datetime DEFAULT NULL,
  `NEXT_FIRE_TIME` datetime DEFAULT NULL,
  `REFIRE_COUNT` bigint(20) DEFAULT '0',
  `FIRE_INSTANCE_ID` varchar(225) DEFAULT NULL,
  `SCHEDULER_INSTANCE_ID` varchar(225) DEFAULT NULL,
  `SCHEDULED_FIRE_TIME` datetime DEFAULT NULL,
  `EXECUTION_SUMMARY` varchar(225) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`LANG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_lang_b`
--

LOCK TABLES `sys_lang_b` WRITE;
/*!40000 ALTER TABLE `sys_lang_b` DISABLE KEYS */;
INSERT INTO `sys_lang_b` VALUES ('en_GB','zh_CN','English',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('zh_CN','zh_CN','简体中文',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_lang_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_lov`
--

DROP TABLE IF EXISTS `sys_lov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_lov` (
  `LOV_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(80) NOT NULL COMMENT 'LOV的code',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `SQL_ID` varchar(225) DEFAULT NULL COMMENT 'SQL ID',
  `VALUE_FIELD` varchar(80) DEFAULT NULL COMMENT ' VALUE_FIELD',
  `TEXT_FIELD` varchar(80) DEFAULT NULL COMMENT 'TEXT_FIELD',
  `TITLE` varchar(225) DEFAULT NULL COMMENT '标题',
  `WIDTH` decimal(20,0) DEFAULT NULL COMMENT '宽度',
  `HEIGHT` decimal(20,0) DEFAULT NULL COMMENT '高度',
  `PLACEHOLDER` varchar(80) DEFAULT NULL COMMENT '提示',
  `DELAY_LOAD` varchar(1) DEFAULT 'N' COMMENT '是否延迟加载',
  `NEED_QUERY_PARAM` varchar(1) DEFAULT 'N' COMMENT '是否需要查询条件',
  `EDITABLE` varchar(1) DEFAULT 'N' COMMENT '是否可编辑',
  `CAN_POPUP` varchar(1) DEFAULT 'Y' COMMENT '是否可弹出',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  `CUSTOM_SQL` longtext COMMENT '自定义sql',
  `QUERY_COLUMNS` int(11) DEFAULT '1' COMMENT '查询框列数',
  PRIMARY KEY (`LOV_ID`),
  UNIQUE KEY `SYS_LOV_U1` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10019 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_lov`
--

LOCK TABLES `sys_lov` WRITE;
/*!40000 ALTER TABLE `sys_lov` DISABLE KEYS */;
INSERT INTO `sys_lov` VALUES (10001,'user_lov','查询用户','UserMapper.select','userId','userName','查询用户',400,400,NULL,'N','N','N','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(10002,'ATTACH_SOURCE_TYPE','附件来源类型选择','AttachCategoryMapper.selectAllLeafCategory','sourceType','sourceType','attachcategory.sourcetype',450,200,'attachcategory.sourcetype','N','N','N','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(10003,'LOV_PARENTFUNCTION',NULL,'FunctionMapper.select','functionId','functionName','function.parentfunctionid',550,350,'function.parentfunctionid','N','N','N','N',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(10004,'LOV_ROLE','选择角色','RoleMapper.select','roleId','roleName',NULL,450,300,NULL,'N','N','N','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(10005,'LOV_RESOURCE','选择资源','ResourceMapper.select','resourceId','name',NULL,500,300,NULL,'N','N','N','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(10006,'LOV_PARENTPOSITION','上级岗位','PositionMapper.selectParentPositionName','positionId','name','position.parentpositionname',500,400,'position.parentpositionname','N','N','N','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(10007,'LOV_UNIT','部门','OrgUnitMapper.select','unitId','name','hrorgunit.parentname',500,400,'hrorgunit.parentname','N','N','N','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(10008,'LOV_POSITION','选择岗位','PositionMapper.select','positionId','name','position.name',500,200,'position.name','N','N','N','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(10009,'LOV_COMPANY','选择公司','CompanyMapper.select','companyId','companyFullName',NULL,500,200,NULL,'N','N','N','Y',4,-1,-1,-1,'2017-01-07 11:50:09',10001,'2017-01-11 14:58:10',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1),(10010,'MESSAGE_TEMPLATE','选择模板','MessageTemplateMapper.select','templateCode','templateCode',NULL,500,200,NULL,'N','N','N','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(10011,'MESSAGE_ACCOUNT','邮件账户','MessageEmailAccountMapper.selectMessageEmailAccounts','accountCode','userName',NULL,500,200,NULL,'N','N','N','Y',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(10012,'Test_LOV_COMPANY','显示公司名称，基于公司ID进行关联查询','TestCompanyMapper.select','companyNumber','companyName',NULL,500,200,NULL,'N','N','N','Y',19,-1,-1,10001,'2017-01-11 14:57:42',10001,'2017-01-11 21:42:16',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1),(10013,'Test_LOV_CUSTOMER','根据主人ID、客户编码查询客户信息','TestCustom01Mapper.selectCustomer','customerNumber','customerName',NULL,500,200,NULL,'N','N','N','Y',22,-1,-1,10001,'2017-01-11 18:59:24',10001,'2017-01-11 22:15:36',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1),(10014,'TEST_LOV_INVENTORY_ITEM','显示物料DESCRIPTION，基于物料ID进行关联查询','TestInventoryItemMapper.select','itemCode','itemDescription',NULL,500,200,NULL,'N','N','N','Y',17,-1,-1,10001,'2017-01-12 15:54:37',10001,'2017-01-15 15:15:09',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1),(10015,'TEST_LOV_COMPANY2','根据公司ID查询公司Name','TestCompanyMapper.select','companyId','companyName','根据公司ID查询公司Name',500,200,NULL,'N','N','N','Y',19,-1,-1,10001,'2017-01-13 15:17:50',10001,'2017-01-15 12:54:22',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1),(10016,'Test_LOV_CUSTOMER02','根据客户ID和主人ID查询客户','TestCustomerMapper.select','customerId','customerName',NULL,500,200,NULL,'N','N','N','Y',4,-1,-1,10001,'2017-01-13 15:46:29',10001,'2017-01-13 15:47:42',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1),(10017,'TEST_LOV_ITEM_CODE','选择物料编码','TestInventoryItemMapper.select','inventoryItemId','itemCode',NULL,500,200,NULL,'N','N','N','Y',11,-1,-1,10001,'2017-01-15 13:45:28',10001,'2017-01-15 13:46:18',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1),(10018,'TEST_LOV_ITEM3','查询物料Id、物料编码、物料描述、产品单位','TestInventoryItemMapper.select','inventoryItemId','itemCode',NULL,400,500,NULL,'N','N','N','Y',6,-1,-1,10001,'2017-01-15 15:51:09',10001,'2017-01-15 15:51:32',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',1);
/*!40000 ALTER TABLE `sys_lov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_lov_item`
--

DROP TABLE IF EXISTS `sys_lov_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_lov_item` (
  `LOV_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LOV_ID` bigint(20) DEFAULT NULL COMMENT '头表ID',
  `DISPLAY` varchar(255) DEFAULT NULL COMMENT '描述字段',
  `IS_AUTOCOMPLETE` varchar(1) DEFAULT 'N' COMMENT '是否autocomplete',
  `CONDITION_FIELD` varchar(80) DEFAULT 'N' COMMENT ' 是否查询字段',
  `CONDITION_FIELD_WIDTH` decimal(20,0) DEFAULT NULL COMMENT '查询字段宽度',
  `CONDITION_FIELD_TYPE` varchar(30) DEFAULT NULL COMMENT '查询字段组件类型',
  `CONDITION_FIELD_NAME` varchar(80) DEFAULT NULL COMMENT '查询字段名',
  `CONDITION_FIELD_NEWLINE` varchar(1) DEFAULT NULL COMMENT '查询字段新一行',
  `CONDITION_FIELD_SELECT_CODE` varchar(80) DEFAULT NULL COMMENT '查询字段combobox对应的快码值',
  `CONDITION_FIELD_LOV_CODE` varchar(80) DEFAULT NULL COMMENT '查询字段lov对应的通用lov编码',
  `CONDITION_FIELD_SEQUENCE` decimal(20,0) DEFAULT NULL COMMENT '查询字段排序号',
  `CONDITION_FIELD_SELECT_URL` varchar(255) DEFAULT NULL COMMENT '查询字段combobox对应的URL',
  `CONDITION_FIELD_SELECT_VF` varchar(80) DEFAULT NULL COMMENT '查询字段combobox对应的valueField',
  `CONDITION_FIELD_SELECT_TF` varchar(80) DEFAULT NULL COMMENT '查询字段combobox对应的textField',
  `CONDITION_FIELD_TEXTFIELD` varchar(80) DEFAULT NULL COMMENT '查询字段对应的textField',
  `AUTOCOMPLETE_FIELD` varchar(1) DEFAULT 'Y' COMMENT 'autocomplete显示列',
  `GRID_FIELD` varchar(1) DEFAULT 'Y' COMMENT '是否显示表格列',
  `GRID_FIELD_NAME` varchar(80) DEFAULT NULL COMMENT '表格列字段名',
  `GRID_FIELD_SEQUENCE` decimal(20,0) DEFAULT '1' COMMENT '表格列排序号',
  `GRID_FIELD_WIDTH` decimal(20,0) DEFAULT NULL COMMENT '表格列宽',
  `GRID_FIELD_ALIGN` varchar(10) DEFAULT 'center' COMMENT '表格列布局',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`LOV_ITEM_ID`),
  KEY `SYS_LOV_ITEM_N1` (`LOV_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10039 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_lov_item`
--

LOCK TABLES `sys_lov_item` WRITE;
/*!40000 ALTER TABLE `sys_lov_item` DISABLE KEYS */;
INSERT INTO `sys_lov_item` VALUES (10001,10001,'userName','Y','Y',NULL,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','userName',10,100,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,10002,'attachcategory.categoryname','N','Y',NULL,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','categoryName',10,100,'left',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,10002,'attachcategory.sourcetype','N','Y',NULL,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','sourceType',20,80,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,10002,'attachcategory.categorypath','N','N',NULL,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','categoryPath',30,200,'left',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,10003,'function.functionCode','N','Y',NULL,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','functionCode',1,100,'left',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,10003,'function.functionName','N','Y',NULL,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','functionName',1,120,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,10004,'role.roleCode','N','Y',NULL,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','roleCode',1,80,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10008,10004,'role.roleName','N','Y',NULL,NULL,NULL,'N',NULL,NULL,2,NULL,NULL,NULL,NULL,'Y','Y','roleName',2,120,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10009,10004,'role.roleDescription','N','N',NULL,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','roleDescription',3,200,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,10005,'resource.name','N','Y',NULL,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','name',1,160,NULL,1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,10005,'resource.url','N','Y',NULL,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','url',2,220,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10012,10006,'position.name','N','Y',NULL,NULL,NULL,'N',NULL,NULL,2,NULL,NULL,NULL,NULL,'Y','Y','name',2,200,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10013,10006,'position.description','N','Y',NULL,NULL,NULL,'N',NULL,NULL,3,NULL,NULL,NULL,NULL,'Y','Y','description',3,200,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10014,10007,'hrorgunit.name','N','Y',NULL,NULL,NULL,'N',NULL,NULL,2,NULL,NULL,NULL,NULL,'Y','Y','name',2,200,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10015,10007,'hrorgunit.description','N','Y',NULL,NULL,NULL,'N',NULL,NULL,3,NULL,NULL,NULL,NULL,'Y','Y','description',3,200,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10016,10008,'position.name','N','Y',200,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','name',1,200,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10017,10008,'position.positionCode','N','Y',200,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','positionCode',2,200,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10018,10009,'company.companycode','N','Y',200,NULL,NULL,'N','',NULL,1,'','','',NULL,'Y','Y','companyCode',1,200,'center',3,-1,-1,-1,'2017-01-07 11:50:09',10001,'2017-01-11 11:31:38',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10019,10009,'company.companyfullname','N','Y',200,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','companyFullName',2,200,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10020,10007,'hrorgunit.unitcode','N','Y',200,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','unitCode',1,200,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10021,10010,'messagetemplate.templatecode','N','Y',200,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','templateCode',1,200,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10022,10011,'messageemailconfig.accountcode','N','Y',200,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','accountCode',1,200,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10023,10011,'messageaccount.name','N','Y',200,NULL,NULL,'N',NULL,NULL,1,NULL,NULL,NULL,NULL,'Y','Y','userName',2,200,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10024,10010,'messagetemplate.name','N','Y',200,NULL,NULL,'N',NULL,NULL,2,NULL,NULL,NULL,NULL,'Y','Y','description',2,200,'center',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10025,10012,'test.company_number','N','Y',200,'','','N','','',1,'','','','','Y','Y','companyNumber',1,200,'',9,-1,-1,10001,'2017-01-11 14:57:42',10001,'2017-01-11 21:42:16',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10026,10012,'test.company_name','N','Y',200,'','','N','','',1,'','','','','Y','Y','companyName',2,200,'',15,-1,-1,10001,'2017-01-11 14:57:42',10001,'2017-01-11 20:49:48',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10027,10013,'test.customernumber','N','Y',200,'','','N','','',1,'','','','','Y','Y','customerNumber',1,200,'',12,-1,-1,10001,'2017-01-11 18:59:24',10001,'2017-01-11 20:42:54',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10028,10013,'test.customername','N','Y',200,'','','N','','',1,'','','','','Y','Y','customerName',2,200,'',9,-1,-1,10001,'2017-01-11 18:59:24',10001,'2017-01-11 20:47:00',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10029,10014,'test.item_code','N','Y',200,'','','N','','',1,'','','','','Y','Y','itemCode',1,200,'',3,-1,-1,10001,'2017-01-12 15:58:20',10001,'2017-01-12 15:58:33',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10030,10014,'test.item_description','N','Y',200,'','','N','','',1,'','','','','Y','Y','itemDescription',2,200,'',3,-1,-1,10001,'2017-01-12 15:58:20',10001,'2017-01-12 15:58:33',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10031,10015,'test.company_number','N','Y',200,'','','N','','',1,'','','','','Y','Y','companyNumber',1,200,'center',4,-1,-1,10001,'2017-01-13 15:17:50',10001,'2017-01-13 15:29:40',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10032,10015,'test.company_name','N','Y',200,'','','N','','',1,'','','','','Y','Y','companyName',2,200,'center',3,-1,-1,10001,'2017-01-13 15:17:50',10001,'2017-01-13 15:29:40',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10033,10016,'test.customernumber','N','Y',200,'','','N','','',1,'','','','','Y','Y','customerNumber',1,200,'',3,-1,-1,10001,'2017-01-13 15:46:29',10001,'2017-01-13 15:46:30',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10034,10016,'test.customername','N','Y',200,'','','N','','',1,'','','','','Y','Y','customerName',2,200,'',3,-1,-1,10001,'2017-01-13 15:46:29',10001,'2017-01-13 15:46:30',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10035,10017,'test.item_code','N','Y',200,'','','N','','',1,'','','','','Y','Y','itemCode',1,200,'',8,-1,-1,10001,'2017-01-15 13:45:28',10001,'2017-01-15 13:45:30',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10036,10018,'test.item_uom','N','Y',200,'','','N','','',1,'','','','','Y','Y','itemUom',3,200,'',6,-1,-1,10001,'2017-01-15 15:51:09',10001,'2017-01-15 15:51:32',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10037,10018,'test.item_description','N','Y',200,'','','N','','',1,'','','','','Y','Y','itemDescription',2,200,'',6,-1,-1,10001,'2017-01-15 15:51:09',10001,'2017-01-15 15:51:33',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10038,10018,'test.item_code','N','Y',200,'','','N','','',1,'','','','','Y','Y','itemCode',1,200,'',6,-1,-1,10001,'2017-01-15 15:51:09',10001,'2017-01-15 15:51:33',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_lov_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_message`
--

DROP TABLE IF EXISTS `sys_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_message` (
  `MESSAGE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_TYPE` varchar(10) DEFAULT NULL COMMENT '信息类型,email/sms',
  `MESSAGE_HOST` varchar(255) DEFAULT NULL COMMENT '消息服务器',
  `MESSAGE_FROM` varchar(255) DEFAULT NULL COMMENT '消息发出人',
  `SUBJECT` varchar(255) DEFAULT NULL COMMENT ' 标题',
  `CONTENT` longtext COMMENT '内容',
  `PRIORITY_LEVEL` varchar(25) DEFAULT NULL COMMENT '优先级',
  `SEND_FLAG` varchar(1) DEFAULT 'N' COMMENT '发送标记',
  `MESSAGE_SOURCE` varchar(255) DEFAULT NULL COMMENT '消息来源',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`MESSAGE_ID`),
  KEY `SYS_MESSAGE_N1` (`MESSAGE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message`
--

LOCK TABLES `sys_message` WRITE;
/*!40000 ALTER TABLE `sys_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_message_account`
--

DROP TABLE IF EXISTS `sys_message_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_message_account` (
  `ACCOUNT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_TYPE` varchar(50) DEFAULT NULL COMMENT '账号类型',
  `ACCOUNT_CODE` varchar(50) DEFAULT NULL COMMENT '编号',
  `USER_NAME` varchar(240) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(240) DEFAULT NULL COMMENT ' 密码',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message_account`
--

LOCK TABLES `sys_message_account` WRITE;
/*!40000 ALTER TABLE `sys_message_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_message_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_message_attachment`
--

DROP TABLE IF EXISTS `sys_message_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_message_attachment` (
  `ATTACHMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` bigint(20) DEFAULT NULL COMMENT '消息id',
  `FILE_ID` bigint(20) DEFAULT NULL COMMENT '附件id',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ATTACHMENT_ID`),
  KEY `SYS_MESSAGE_ATTACHMENT_N1` (`FILE_ID`),
  KEY `SYS_MESSAGE_ATTACHMENT_N2` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message_attachment`
--

LOCK TABLES `sys_message_attachment` WRITE;
/*!40000 ALTER TABLE `sys_message_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_message_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_message_email_account`
--

DROP TABLE IF EXISTS `sys_message_email_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_message_email_account` (
  `ACCOUNT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_CODE` varchar(50) NOT NULL,
  `CONFIG_ID` bigint(20) DEFAULT NULL,
  `USER_NAME` varchar(240) DEFAULT NULL,
  `PASSWORD` varchar(240) DEFAULT NULL,
  `DESCRIPTION` varchar(240) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_ID`),
  UNIQUE KEY `SYS_MESSAGE_EMAIL_ACCOUNT_U1` (`ACCOUNT_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message_email_account`
--

LOCK TABLES `sys_message_email_account` WRITE;
/*!40000 ALTER TABLE `sys_message_email_account` DISABLE KEYS */;
INSERT INTO `sys_message_email_account` VALUES (1,'TEST',5,'hap_dev@126.com',NULL,NULL,1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_message_email_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_message_email_config`
--

DROP TABLE IF EXISTS `sys_message_email_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_message_email_config` (
  `CONFIG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONFIG_CODE` varchar(50) NOT NULL COMMENT '编号',
  `HOST` varchar(50) DEFAULT NULL COMMENT '服务器',
  `PORT` varchar(10) DEFAULT NULL COMMENT '端口',
  `TRY_TIMES` decimal(20,0) DEFAULT '3' COMMENT '重试次数',
  `DESCRIPTION` varchar(20) DEFAULT NULL COMMENT '描述',
  `USE_WHITE_LIST` varchar(1) DEFAULT 'N' COMMENT '是否使用白名单',
  `USER_NAME` varchar(240) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(240) DEFAULT NULL COMMENT '密码',
  `ENABLE` varchar(1) DEFAULT 'N',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CONFIG_ID`),
  UNIQUE KEY `SYS_MESSAGE_EMAIL_CONFIG_U1` (`CONFIG_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message_email_config`
--

LOCK TABLES `sys_message_email_config` WRITE;
/*!40000 ALTER TABLE `sys_message_email_config` DISABLE KEYS */;
INSERT INTO `sys_message_email_config` VALUES (5,'TEST126','smtp.126.com','25',1,'hap_dev on 126','N','hap_dev','hapdev11',NULL,1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_message_email_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_message_email_white_lt`
--

DROP TABLE IF EXISTS `sys_message_email_white_lt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_message_email_white_lt` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ADDRESS` varchar(240) DEFAULT NULL COMMENT '白名单地址',
  `CONFIG_ID` bigint(20) DEFAULT NULL COMMENT '邮箱配置id',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message_email_white_lt`
--

LOCK TABLES `sys_message_email_white_lt` WRITE;
/*!40000 ALTER TABLE `sys_message_email_white_lt` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_message_email_white_lt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_message_receiver`
--

DROP TABLE IF EXISTS `sys_message_receiver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_message_receiver` (
  `RECEIVER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` bigint(20) DEFAULT NULL COMMENT '消息id',
  `MESSAGE_TYPE` varchar(25) DEFAULT NULL COMMENT '消息类型,抄送/普通',
  `MESSAGE_ADDRESS` varchar(255) DEFAULT NULL COMMENT '消息地址,邮箱/手机号',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RECEIVER_ID`),
  KEY `SYS_MESSAGE_RECEIVER_N1` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message_receiver`
--

LOCK TABLES `sys_message_receiver` WRITE;
/*!40000 ALTER TABLE `sys_message_receiver` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_message_receiver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_message_template`
--

DROP TABLE IF EXISTS `sys_message_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_message_template` (
  `TEMPLATE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SUBJECT` longtext COMMENT '模板标题',
  `CONTENT` longtext COMMENT '模板内容',
  `ACCOUNT_ID` bigint(20) DEFAULT NULL COMMENT '账号id',
  `TEMPLATE_CODE` varchar(50) NOT NULL COMMENT '模板编号',
  `TEMPLATE_TYPE` varchar(50) DEFAULT NULL COMMENT '模板类型,邮件/SMS',
  `PRIORITY_LEVEL` varchar(50) DEFAULT NULL COMMENT '优先级',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`TEMPLATE_ID`),
  UNIQUE KEY `SYS_MESSAGE_TEMPLATE_U1` (`TEMPLATE_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message_template`
--

LOCK TABLES `sys_message_template` WRITE;
/*!40000 ALTER TABLE `sys_message_template` DISABLE KEYS */;
INSERT INTO `sys_message_template` VALUES (1,'THis is a test email','test mail send by hap',NULL,'TEST',NULL,'NORMAL','Test Template',1,-1,-1,-1,'2017-01-07 11:50:04',-1,'2017-01-07 11:50:04',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_message_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_message_transaction`
--

DROP TABLE IF EXISTS `sys_message_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_message_transaction` (
  `TRANSACTION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` bigint(20) DEFAULT NULL COMMENT '消息id',
  `TRANSACTION_STATUS` varchar(25) DEFAULT NULL COMMENT '发送状态',
  `TRANSACTION_MESSAGE` longtext COMMENT '返回信息',
  `MESSAGE_ADDRESS` varchar(255) DEFAULT NULL COMMENT '消息地址,邮箱/手机号/会员/用户',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`TRANSACTION_ID`),
  KEY `SYS_MESSAGE_TRANSACTION_N1` (`MESSAGE_ID`),
  KEY `SYS_MESSAGE_TRANSACTION_N2` (`TRANSACTION_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message_transaction`
--

LOCK TABLES `sys_message_transaction` WRITE;
/*!40000 ALTER TABLE `sys_message_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_message_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_preferences`
--

DROP TABLE IF EXISTS `sys_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_preferences` (
  `PREFERENCES_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PREFERENCES` varchar(30) DEFAULT NULL COMMENT '首选项名',
  `PREFERENCES_VALUE` varchar(80) DEFAULT NULL COMMENT '首选项值',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '账号ID',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PREFERENCES_ID`),
  UNIQUE KEY `SYS_PREFERENCES_U1` (`PREFERENCES`,`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_preferences`
--

LOCK TABLES `sys_preferences` WRITE;
/*!40000 ALTER TABLE `sys_preferences` DISABLE KEYS */;
INSERT INTO `sys_preferences` VALUES (1,'locale','zh_CN',10001,4,-1,-1,10001,'2017-01-12 19:37:42',10001,'2017-01-12 20:48:32',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'locale','zh_CN',10008,2,-1,-1,10008,'2017-01-14 18:26:03',10008,'2017-01-14 18:27:04',10008,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_profile`
--

DROP TABLE IF EXISTS `sys_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_profile` (
  `PROFILE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROFILE_NAME` varchar(40) NOT NULL COMMENT '配置文件名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PROFILE_ID`),
  UNIQUE KEY `SYS_PROFILE_U1` (`PROFILE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_profile`
--

LOCK TABLES `sys_profile` WRITE;
/*!40000 ALTER TABLE `sys_profile` DISABLE KEYS */;
INSERT INTO `sys_profile` VALUES (1,'HAP_ OM_ORDER_SUBMIT_CTL','销售订单提交按钮控制',1,-1,-1,10001,'2017-01-15 17:13:09',10001,'2017-01-15 17:13:09',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'HAP_ OM_ORDER_APPROVE_CTL','销售订单审批、拒绝按钮控制',1,-1,-1,10001,'2017-01-15 17:14:01',10001,'2017-01-15 17:14:01',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_profile_value`
--

DROP TABLE IF EXISTS `sys_profile_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_profile_value` (
  `PROFILE_VALUE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROFILE_ID` varchar(32) DEFAULT NULL COMMENT '配置文件ID',
  `LEVEL_ID` varchar(32) DEFAULT NULL COMMENT '层次ID',
  `LEVEL_VALUE` varchar(40) DEFAULT NULL COMMENT '层次值',
  `PROFILE_VALUE` varchar(80) DEFAULT NULL COMMENT '配置文件值',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PROFILE_VALUE_ID`),
  UNIQUE KEY `SYS_PROFILE_VALUE_U1` (`PROFILE_ID`,`LEVEL_ID`,`LEVEL_VALUE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_profile_value`
--

LOCK TABLES `sys_profile_value` WRITE;
/*!40000 ALTER TABLE `sys_profile_value` DISABLE KEYS */;
INSERT INTO `sys_profile_value` VALUES (1,'1','20','10003','Y',1,-1,-1,10001,'2017-01-15 17:13:09',10001,'2017-01-15 17:13:09',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'2','20','10004','Y',1,-1,-1,10001,'2017-01-15 17:14:01',10001,'2017-01-15 17:14:01',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_profile_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_prompts`
--

DROP TABLE IF EXISTS `sys_prompts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_prompts` (
  `PROMPT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROMPT_CODE` varchar(255) DEFAULT NULL COMMENT '文本编码',
  `LANG` varchar(10) DEFAULT NULL COMMENT '语言',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PROMPT_ID`),
  UNIQUE KEY `SYS_PROMPTS_U1` (`PROMPT_CODE`,`LANG`)
) ENGINE=InnoDB AUTO_INCREMENT=10781 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_prompts`
--

LOCK TABLES `sys_prompts` WRITE;
/*!40000 ALTER TABLE `sys_prompts` DISABLE KEYS */;
INSERT INTO `sys_prompts` VALUES (10001,'hap.main_menu','zh_CN','主菜单',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'hap.main_menu','en_GB','Main Menu',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'hap.home','zh_CN','首页',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'hap.hone','en_GB','Home',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,'hap.query','zh_CN','查询',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,'hap.query','en_GB','Query',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,'hap.cancel','zh_CN','取消',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10008,'hap.cancel','en_GB','Cancel',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10009,'hap.new','zh_CN','新建',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,'hap.new','en_GB','New',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,'hap.delete','zh_CN','删除',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10012,'hap.delete','en_GB','Delete',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10013,'hap.save','zh_CN','保存',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10014,'hap.save','en_GB','Save',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10015,'hap.reset','zh_CN','重置',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10016,'hap.reset','en_GB','Reset',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10017,'hap.edit','zh_CN','编辑',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10018,'hap.edit','en_GB','Edit',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10019,'hap.prompt','zh_CN','提示',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10020,'hap.prompt','en_GB','Prompt',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10021,'hap.error','zh_CN','错误',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10022,'hap.error','en_GB','Error',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10023,'hap.warning','zh_CN','警告',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10024,'hap.warning','en_GB','Warning',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10025,'hap.description','zh_CN','描述',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10026,'hap.description','en_GB','Description',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10027,'hap.validation.notempty','zh_CN','{0}不能为空！',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10028,'hap.validation.notempty','en_GB','{0} can not be empty!',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10029,'hap.validation.notnull','zh_CN','{0}不能为空！',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10030,'hap.validation.notnull','en_GB','{0} can not be null!',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10031,'hap.validation.email','zh_CN','{0}不是有效的邮件地址。',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10032,'hap.validation.email','en_GB','{0} is not a email address.',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10033,'hap.submit','zh_CN','提交',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10034,'hap.submit','en_GB','submit',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10035,'hap.logout','zh_CN','退出',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10036,'hap.logout','en_GB','Logout',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10037,'hap.preferences','zh_CN','首选项',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10038,'hap.preferences','en_GB','Preference',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10039,'hap.ok','zh_CN','确定',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10040,'hap.ok','en_GB','OK',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10041,'lov.placeholder','zh_CN','提示',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10042,'lov.placeholder','en_GB','tips',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10043,'lov.dropdown','zh_CN','自动完成',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10044,'lov.dropdown','en_GB','autocomplete',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10045,'lov.code','zh_CN','代码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10046,'lov.code','en_GB','Code',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10047,'lov.description','en_GB','Description',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10048,'lov.description','zh_CN','描述',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10049,'lov.height','zh_CN','高度',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10050,'lov.height','en_GB','Height',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10051,'lov.lovid','zh_CN','Lov Id',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10052,'lov.lovid','en_GB','Lov Id',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10053,'lov.lovitems','zh_CN','Lov Items',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10054,'lov.lovitems','en_GB','Lov Items',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10055,'lov.customsql','zh_CN','自定义sql',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10056,'lov.customsql','en_GB','Custom sql',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10057,'lov.sqltype','zh_CN','Sql类型',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10058,'ov.sqltype','en_GB','Sql Type',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10059,'lov.sqlid','zh_CN','Sql Id',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10060,'lov.sqlid','en_GB','Sql Id',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10061,'lov.textfield','zh_CN','TextField',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10062,'lov.textfield','en_GB','TextField',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10063,'lov.title','zh_CN','标题',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10064,'lov.title','en_GB','Title',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10065,'lov.valuefield','zh_CN','ValueField',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10066,'lov.valuefield','en_GB','ValueField',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10067,'lov.width','en_GB','Width',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10068,'lov.width','zh_CN','宽度',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10069,'lov.querycolumns','zh_CN','列数',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10070,'lov.columns','en_GB','Columns',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10071,'lovitem.display','zh_CN','显示',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10072,'lovitem.display','en_GB','Display',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10073,'lovitem.name','zh_CN','字段名',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10074,'lovitem.name','en_GB','Name',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10075,'lovitem.gridfieldwidth','zh_CN','列宽度',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10076,'lovitem.gridfieldwidth','en_GB','ColumnWidth',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10077,'lovitem.conditionfield','zh_CN','查询字段',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10078,'lovitem.conditionfield','en_GB','Conditions',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10079,'lovitem.newline','zh_CN','新行',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10080,'lovitem.newline','en_GB','Newline',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10081,'lovitem.type','zh_CN','查询配置',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10082,'lovitem.type','en_GB','Type',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10083,'lovitem.opts','zh_CN','参数',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10084,'lovitem.opts','en_GB','Opts',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10085,'lovitem.dropdown','zh_CN','Dropdown',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10086,'lovitem.dropdown','en_GB','Dropdown',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10087,'lovitem.gridcolumn','zh_CN','表格列',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10088,'lovitem.gridcolumn','en_GB','GridColumn',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10089,'lov.delayload','zh_CN','延迟加载',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10090,'lov.delayload','en_GB','DelayLoad',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10091,'lov.needqueryparam','zh_CN','查询条件必输',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10092,'lov.needqueryparam','en_GB','NeedQueryParam',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10093,'lovitem.conditionfieldwidth','zh_CN','查询字段宽度',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10094,'lovitem.conditionfieldwidth','en_GB','Width',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10095,'lovitem.conditionfieldsequence','zh_CN','查询字段序号',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10096,'lovitem.conditionfieldsequence','en_GB','Sequence',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10097,'lovitem.conditionfieldname','zh_CN','查询字段名',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10098,'lovitem.conditionfieldname','en_GB','Name',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10099,'lovitem.conditionfieldselectcode','zh_CN','快速编码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10100,'lovitem.conditionfieldselectcode','en_GB','Code',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10101,'lovitem.conditionfieldlovcode','zh_CN','通用lov编码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10102,'lovitem.conditionfieldlovcode','en_GB','LovCode',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10103,'lovitem.gridfieldsequence','zh_CN','列序号',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10104,'lovitem.gridfieldsequence','en_GB','Sequence',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10105,'lovitem.gridcolumnalign','zh_CN','列对齐方式',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10106,'lovitem.gridcolumnalign','en_GB','Column Align',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10107,'lov.autocompletefield','zh_CN','自动完成显示列',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10108,'lov.autocompletefield','en_GB','AutoCompleteColumn',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10109,'lov.canpopup','zh_CN','弹出选择框',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10110,'lov.canpopup','en_GB','popup',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10111,'lov.editable','zh_CN','可编辑',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10112,'lov.editable','en_GB','editable',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10113,'lovitem.field_type','zh_CN','字段类型',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10114,'lovitem.field_type','en_GB','field type',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10115,'lovitem.ds_type','zh_CN','数据来源',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10116,'lovitem.ds_type','en_GB','数据来源',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10117,'lovitem.ds_type.url','zh_CN','URL',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10118,'lovitem.ds_type.url','en_GB','URL',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10119,'lovitem.ds_type.code','zh_CN','快速编码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10120,'lovitem.ds_type.code','en_GB','Sys Code',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10121,'user.username','zh_CN','用户名',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10122,'user.username','en_GB','User Name',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10123,'user.password','zh_CN','密码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10124,'user.password','en_GB','Password',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10125,'user.email','zh_CN','邮件',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10126,'user.email','en_GB','Email',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10127,'user.phone','zh_CN','电话',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10128,'user.phone','en_GB','Phone',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10129,'role.rolecode','zh_CN','角色代码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10130,'role.rolecode','en_GB','Role Code',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10131,'role.rolename','zh_CN','角色名称',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10132,'role.rolename','en_GB','Role Name',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10133,'role.roledescription','zh_CN','角色描述',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10134,'role.roledescription','en_GB','Description',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10135,'user.allocationrole','zh_CN','角色分配',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10136,'user.allocationrole','en_GB','Role Allocate',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10137,'code.code','zh_CN','代码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10138,'code.code','en_GB','Code',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10139,'code.description','zh_CN','描述',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10140,'code.description','en_GB','Description',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10141,'hap.action','zh_CN','操作',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10142,'hap.action','en_GB','Operation',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10143,'codevalue.value','zh_CN','值',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10144,'codevalue.value','en_GB','Value',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10145,'codevalue.meaning','zh_CN','含义',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10146,'codevalue.meaning','en_GB','Meaning',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10147,'codevalue.description','zh_CN','描述',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10148,'codevalue.description','en_GB','Description',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10149,'profile.profilename','zh_CN','名称',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10150,'profile.profilename','en_GB','Name',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10151,'profile.description','zh_CN','描述',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10152,'profile.description','en_GB','Description',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10153,'language.langcode','zh_CN','语言代码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10154,'language.langcode','en_GB','Lang Code',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10155,'language.baselang','zh_CN','基准语言',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10156,'language.baselang','en_GB','Base Lang',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10157,'language.description','zh_CN','描述',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10158,'language.description','en_GB','Description',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10159,'jobdetaildto.jobname','zh_CN','任务名称',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10160,'jobdetaildto.jobname','en_GB','Job Name',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10161,'jobdetaildto.jobgroup','zh_CN','任务组',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10162,'jobdetaildto.jobgroup','en_GB','Job Group',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10163,'jobdetaildto.jobclassname','zh_CN','任务类名',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10164,'jobdetaildto.jobclassname','en_GB','Job Class',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10165,'jobdetaildto.description','zh_CN','任务描述',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10166,'jobdetaildto.description','en_GB','Job Description',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10167,'jobrunninginfodto.previousfiretime','zh_CN','上次执行时间',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10168,'jobrunninginfodto.previousfiretime','en_GB','Pre Fire Time',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10169,'jobrunninginfodto.scheduledfiretime','zh_CN','计划执行时间',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10170,'jobrunninginfodto.scheduledfiretime','en_GB','Sched Fire Time',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10171,'jobrunninginfodto.nextfiretime','zh_CN','下次执行时间',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10172,'jobrunninginfodto.nextfiretime','en_GB','Next Fire Time',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10173,'jobrunninginfodto.firetime','zh_CN','实际执行时间',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10174,'jobrunninginfodto.firetime','en_GB','Accurate Fire Time',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10175,'jobrunninginfodto.jobstatus','zh_CN','任务状态',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10176,'jobrunninginfodto.jobstatus','en_GB','Job Status',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10177,'jobrunninginfodto.executionsummary','zh_CN','执行概要',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10178,'jobrunninginfodto.executionsummary','en_GB','Execution Summary',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10179,'hap.pause','zh_CN','暂停',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10180,'hap.pause','en_GB','Pause',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10181,'hap.resume','zh_CN','恢复',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10182,'hap.resume','en_GB','Resume',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10183,'job.newcronjob','zh_CN','新建 CRON 任务',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10184,'job.newcronjob','en_GB','New Cron Job',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10185,'job.newsimplejob','zh_CN','新建简单任务',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10186,'job.newsimplejob','en_GB','New Simple Job',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10187,'prompt.promptcode','zh_CN','代码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10188,'prompt.promptcode','en_GB','Prompt Code',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10189,'prompt.sourcelang','zh_CN','语言',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10190,'prompt.sourcelang','en_GB','Language',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10191,'prompt.description','zh_CN','描述',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10192,'prompt.description','en_GB','Description',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10193,'function.modulecode','zh_CN','模块代码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10194,'function.modulecode','en_GB','Module Code',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10195,'function.functioncode','zh_CN','功能代码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10196,'funciton.functioncode','en_GB','Function Code',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10197,'function.functionname','zh_CN','功能名称',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10198,'function.functionname','en_GB','Function Name',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10199,'function.parentfunctionid','zh_CN','父级功能',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10200,'function.parentfunctionid','en_GB','Parent Function',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10201,'function.functionicon','zh_CN','功能图标',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10202,'function.functionicon','en_GB','Function Icon',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10203,'function.functionsequence','zh_CN','功能序号',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10204,'function.functionsequence','en_GB','Function Seq',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10205,'function.functiondescription','zh_CN','功能描述',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10206,'function.functiondescription','en_GB','Description',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10207,'function.mainpage','zh_CN','入口页面',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10208,'function.mainpage','en_GB','Entry Page',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10209,'function.functionresource','zh_CN','功能资源',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10210,'function.functionresource','en_GB','Resources',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10211,'function.resourceallocation','zh_CN','分配资源',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10212,'function.resourceallocation','en_GB','Resource Allocation',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10213,'resource.url','zh_CN','URL',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10214,'resource.url','en_GB','URL',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10215,'resource.type','zh_CN','类型',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10216,'resource.type','en_GB','Type',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10217,'resource.name','zh_CN','名称',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10218,'resource.name','en_GB','Name',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10219,'resource.loginrequire','zh_CN','需要登录',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10220,'resource.loginrequire','en_GB','Login Require',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10221,'resource.accesscheck','zh_CN','权限控制',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10222,'resource.accesscheck','en_GB','Access Check',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10223,'resource.description','zh_CN','描述',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10224,'resource.description','en_GB','Description',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10225,'resource.resourceitem','zh_CN','资源组件',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10226,'resource.resourceitem','en_GB','Resource Item',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10227,'resource.itemallocation','zh_CN','组件定义',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10228,'resource.itemallocation','en_GB','Items',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10229,'resourceitem.itemid','zh_CN','组件标识',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10230,'resourceitem.itemid','en_GB','Item ID',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10231,'resourceitem.itemname','zh_CN','组件名称',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10232,'resourceitem.itemname','en_GB','Item Name',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10233,'resourceitem.description','zh_CN','描述',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10234,'resourceitem.description','en_GB','Description',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10235,'resourceitem.resource','zh_CN','目标资源',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10236,'resourceitem.resource','en_GB','Target Resource',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10237,'hap.expand','zh_CN','展开',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10238,'hap.expand','en_GB','Expand',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10239,'hap.collapse','zh_CN','合并',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10240,'hap.collapse','en_GB','Collapse',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10241,'hap.comment','zh_CN','备注',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10242,'hap.comment','en_GB','Comment',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10243,'messageemailconfig.configcode','zh_CN','配置代码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10244,'messageemailconfig.configcode','en_GB','Config Code',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10245,'messageemailconfig.introduction','zh_CN','简介',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10246,'messageemailconfig.introduction','en_GB','Introduction',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10247,'messageemailconfig.host','zh_CN','发送服务器',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10248,'messageemailconfig.host','en_GB','SMTP Host',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10249,'messageemailconfig.port','zh_CN','端口',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10250,'messageemailconfig.port','en_GB','Port',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10251,'messageemailconfig.trytimes','zh_CN','重试次数',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10252,'messageemailconfig.trytimes','en_GB','Try Times',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10253,'messageemailconfig.usewhitelist','zh_CN','启用白名单',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10254,'messageemailconfig.usewhitelist','en_GB','Use White List',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10255,'messageemailconfig.username','zh_CN','用户名',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10256,'messageemailconfig.username','en_GB','User Name',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10257,'messageemailconfig.password','zh_CN','密码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10258,'messageemailconfig.password','en_GB','Password',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10259,'messageemailconfig.accountcode','zh_CN','账户代码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10260,'messageemailconfig.accountcode','en_GB','Account Code',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10261,'messageemailconfig.account','zh_CN','账户',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10262,'messageemailconfig.account','en_GB','Account',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10263,'messageemailconfig.whitelist','zh_CN','白名单',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10264,'messageemailconfig.whitelist','en_GB','White List',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10265,'messageemailconfig.address','zh_CN','地址',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10266,'messageemailconfig.address','en_GB','Address',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10267,'messagetemplate.templatecode','zh_CN','模板代码',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10268,'messagetemplate.templatecode','en_GB','Template Code',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10269,'messagetemplate.name','zh_CN','模板名称',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10270,'messagetemplate.name','en_GB','Template Name',1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10271,'messagetemplate.prioritylevel','zh_CN','优先级',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10272,'messagetemplate.prioritylevel','en_GB','Priority',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10273,'messagetemplate.subject','zh_CN','主题',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10274,'messagetemplate.subject','en_GB','Subject',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10275,'messagetemplate.content','zh_CN','内容',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10276,'messagetemplate.content','en_GB','Content',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10277,'message.subject','zh_CN','主题',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10278,'message.subject','en_GB','Subject',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10279,'message.content','zh_CN','内容',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10280,'message.content','en_GB','Content',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10281,'message.receivers','zh_CN','收件人',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10282,'message.receivers','en_GB','Receivers',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10283,'user.info','zh_CN','用户信息',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10284,'user.info','en_GB','User Info',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10285,'user.status','zh_CN','状态',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10286,'user.status','en_GB','Status',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10287,'user.updatepassword','zh_CN','修改密码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10288,'user.updatepassword','en_GB','Update Password',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10289,'user.current_password','zh_CN','当前密码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10290,'user.current_password','en_GB','Current Password',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10291,'user.new_password','zh_CN','新密码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10292,'user.new_password','en_GB','New Password',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10293,'user.again_new_password','zh_CN','确认新密码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10294,'user.again_new_password','en_GB','New Password Again',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10295,'preference.timezone','zh_CN','时区',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10296,'preference.timezone','en_GB','TimeZone',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10297,'profilevalue.levelid','zh_CN','层级',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10298,'profilevalue.levelid','en_GB','Level',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10299,'profilevalue.levelvalue','zh_CN','层级值',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10300,'profilevalue.levelvalue','en_GB','Level Value',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10301,'profilevalue.profilevalue','zh_CN','配置值',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10302,'profilevalue.profilevalue','en_GB','Profile Value',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10303,'attachcategory.categoryname','zh_CN','目录名称',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10304,'attachcategory.categoryname','en_GB','Category Name',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10305,'attachcategory.categorypath','zh_CN','存储路径',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10306,'attachcategory.categorypath','en_GB','Save Path',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10307,'attachcategory.description','zh_CN','描述',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10308,'attachcategory.description','en_GB','Description',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10309,'attachcategory.allowedfiletype','zh_CN','文件类型',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10310,'attachcategory.allowedfiletype','en_GB','File Type',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10311,'attachcategory.allowedfilesize','zh_CN','最大文件长度',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10312,'attachcategory.allowedfilesize','en_GB','Allow File Size',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10313,'attachcategory.sourcetype','zh_CN','来源类型',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10314,'attachcategory.sourcetype','en_GB','Source Type',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10315,'attachcategory.isunique','zh_CN','唯一',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10316,'attachcategory.isunique','en_GB','Unique',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10317,'attachcategory.statusname','zh_CN','状态',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10318,'attachcategory.statusname','en_GB','Status',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10319,'attachcategory.statusname.normal','zh_CN','普通',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10320,'attachcategory.statusname.normal','en_GB','Normal',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10321,'attachcategory.statusname.archived','zh_CN','压缩',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10322,'attachcategory.statusname.archived','en_GB','Archived',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10323,'attachcategory.archive','zh_CN','压缩',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10324,'attachcategory.archive','en_GB','Archive',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10325,'sysfile.filename','zh_CN','文件名',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10326,'sysfile.filename','en_GB','File Name',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10327,'sysfile.filesize','zh_CN','文件大小',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10328,'sysfile.filesize','en_GB','File Size',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10329,'sysfile.uploaddate','zh_CN','上传日期',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10330,'sysfile.uploaddate','en_GB','Upload Date',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10331,'sysfile.filetype','zh_CN','文件类型',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10332,'sysfile.filetype','en_GB','File Type',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10333,'hap.view','zh_CN','查看',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10334,'hap.view','en_GB','View',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10335,'sysfile.upload','zh_CN','上传',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10336,'sysfile.upload','en_GB','Upload',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10337,'hap.tip.info','zh_CN','提示',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10338,'hap.tip.info','en_GB','Information',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10339,'hap.tip.success','zh_CN','成功',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10340,'hap.tip.success','en_GB','Success',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10341,'function.resourcechoose','zh_CN','选择资源',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10342,'function.resourcechoose','en_GB','Choose Resource',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10343,'hap.tip.delete_confirm','zh_CN','确定删除？',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10344,'hap.tip.delete_confirm','en_GB','Confirm Delete?',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10345,'hap.confirm','zh_CN','确认',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10346,'hap.confirm','en_GB','Confirm',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10347,'role.changerole','zh_CN','切换角色',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10348,'role.changerole','en_GB','Change Role',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10349,'user.verificode','zh_CN','验证码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10350,'user.verificode','en_GB','Verify Code',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10351,'account.common.logintip','zh_CN','请登录',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10352,'account.common.logintip','en_GB','Please Login',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10353,'hap.confirm_exit','zh_CN','确定退出？',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10354,'hap.confirm_exit','en_GB','Quit?',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10355,'rolefunction.select_role','zh_CN','选择角色',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10356,'rolefunction.select_role','en_GB','Select Role',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10357,'hap.login','zh_CN','登录',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10358,'hap.login','en_GB','Login',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10359,'hap.multilanguage_editor','zh_CN','多语言编辑',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10360,'hap.multilanguage_editor','en_GB','MultiLangauge Edit',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10361,'error.login.verification_code_error','zh_CN','验证码错误',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10362,'error.login.verification_code_error','en_GB','Verification Code Error',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10363,'error.login.name_password_not_match','zh_CN','用户名或密码错误',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10364,'error.login.name_password_not_match','en_GB','Wrong user name or password',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10365,'job.attributename','zh_CN','参数名称',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10366,'job.attributename','en_GB','Attribute Name',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10367,'job.attributevalue','zh_CN','参数值',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10368,'job.attributevalue','en_GB','Attribute Value',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10369,'crontriggerdto.cronexpression','zh_CN','Cron 表达式',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10370,'crontriggerdto.cronexpression','en_GB','Cron Expression',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10371,'triggerdto.starttime','zh_CN','开始时间',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10372,'triggerdto.starttime','en_GB','Start Time',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10373,'triggerdto.endtime','zh_CN','结束时间',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10374,'triggerdto.endtime','en_GB','End Time',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10375,'error.user.two_password_not_match','zh_CN','两次密码不匹配',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10376,'error.user.two_password_not_match','en_GB','Two Password Not Match',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10377,'error.user.accout_locked','zh_CN','账户已锁定',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10378,'error.user.accout_locked','en_GB','Account Locked',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10379,'error.user.account_not_active','zh_CN','用户未激活',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10380,'error.user.account_not_active','en_GB','User Not Active',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10381,'error.user.account_expired','zh_CN','用户已过期',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10382,'error.user.account_expired','en_GB','User Expired',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10383,'user.startactivedate','zh_CN','开始有效日期',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10384,'user.startactivedate','en_GB','Start Active Date',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10385,'user.endactivedate','zh_CN','失效日期',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10386,'user.endactivedate','en_GB','End Active Date',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10387,'error.record_not_exists_or_version_not_match','zh_CN','记录不存在或版本不一致.',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10388,'error.record_not_exists_or_version_not_match','en_GB','Record not exists or version NOT MATCH.',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10389,'sys.config.configuration','en_GB','System Configuration',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10390,'sys.config.configuration','zh_CN','系统配置',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10391,'sys.config.style','en_GB','Style',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10392,'sys.config.style','zh_CN','样式',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10393,'sys.config.safety','en_GB','Safety Policy',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10394,'sys.config.safety','zh_CN','安全策略',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10395,'sys.config.other','en_GB','PassWord Policy',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10396,'sys.config.other','zh_CN','密码策略',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10397,'sys.config.system_title','en_GB','system title',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10398,'sys.config.system_title','zh_CN','系统标题',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10399,'sys.config.systemlogo','en_GB','system logo',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10400,'sys.config.systemlogo','zh_CN','系统图标',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10401,'sys.config.favicon','en_GB','favicon',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10402,'sys.config.favicon','zh_CN','favicon',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10403,'sys.config.captcha','en_GB','captcha',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10404,'sys.config.captcha','zh_CN','验证码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10405,'sys.config.default_password','en_GB','new user default password',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10406,'sys.config.default_password','zh_CN','新用户默认密码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10407,'sys.config.systemlogo.desciption','en_GB','Please upload so. jpg, jpeg, png, gifsuffix, such as pictures, a ratio of 70 * 30',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10408,'sys.config.systemlogo.desciption','zh_CN','只能上传.png,.jpg,.jpeg,.gif等后缀的图片,比例为70*30',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10409,'sys.config.favicon.desciption','en_GB','Please upload so. jpg, jpeg, png, gifsuffix, such as pictures, a ratio of 32*32',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10410,'sys.config.favicon.desciption','zh_CN','只能上传.png,.jpg,.jpeg,.gif等后缀的图片,比例为32*32',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10411,'hap.enableflag','zh_CN','是否启用',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10412,'hap.enableflag','en_GB','Enabled',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10413,'role.isexpired','zh_CN','是否过期',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10414,'role.isexpired','en_GB','Expired',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10415,'employee.employeelevelcode','en_GB','Level Code',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10416,'employee.employeelevelcode','zh_CN','员工等级代码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10417,'preference.locale','en_GB','Select Language',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10418,'preference.locale','zh_CN','选择语言',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10419,'preference.timezone.description','en_GB','Select your time zone',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10420,'preference.timezone.description','zh_CN','请选择您所在的区域的时区',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10421,'preference.locale.description','en_GB','Select your language',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10422,'preference.locale.description','zh_CN','请选择语言种类',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10423,'preference.theme','en_GB','Select Theme',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10424,'preference.theme','zh_CN','选择皮肤',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10425,'position.name','en_GB','Position Name',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10426,'position.name','zh_CN','岗位名称',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10427,'position.description','en_GB','Description',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10428,'position.description','zh_CN','岗位描述',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10429,'position.positioncode','en_GB','PositionCode',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10430,'position.positioncode','zh_CN','岗位编码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10431,'position.parentpositionname','en_GB','Parent Position',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10432,'position.parentpositionname','zh_CN','上级岗位',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10433,'hrorgunit.name','en_GB','Unit Name',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10434,'hrorgunit.name','zh_CN','组织名称',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10435,'hrorgunit.description','en_GB','Unit Description',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10436,'hrorgunit.description','zh_CN','组织描述',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10437,'hrorgunit.unitcode','en_GB','Unit Code',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10438,'hrorgunit.unitcode','zh_CN','组织编码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10439,'hrorgunit.parentname','en_GB','Superior Unit',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10440,'hrorgunit.parentname','zh_CN','上级组织',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10441,'hap.tip.noselect','en_GB','You did not select any item!',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10442,'hap.tip.noselect','zh_CN','您未选中任何项！',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10443,'employee.employeecode','en_GB','Employee Code',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10444,'employee.employeecode','zh_CN','员工编码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10445,'employee.name','en_GB','Employee Name',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10446,'employee.name','zh_CN','员工姓名',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10447,'employee.positionallocation','en_GB','Position Allocation',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10448,'employee.positionallocation','zh_CN','岗位分配',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10449,'employee.borndate','en_GB','Born Date',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10450,'employee.borndate','zh_CN','出生日期',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10451,'employee.mobile','en_GB','Phone Number',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10452,'employee.mobile','zh_CN','移动电话',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10453,'employee.joindate','en_GB','Join Date',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10454,'employee.joindate','zh_CN','入职日期',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10455,'employee.gender','en_GB','Gender',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10456,'employee.gender','zh_CN','性别',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10457,'employee.status','en_GB','Status',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10458,'employee.status','zh_CN','状态',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10459,'employee.enabledflag','en_GB','Enabled Flag',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10460,'employee.enabledflag','zh_CN','启用状态',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10461,'employee.certificateid','en_GB','ID',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10462,'employee.certificateid','zh_CN','证件号',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10463,'employee.companyinfo','en_GB','Company Info',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10464,'employee.companyinfo','zh_CN','公司信息',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10465,'employee.otherinfo','en_GB','Other Info',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10466,'employee.otherinfo','zh_CN','其他信息',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10467,'employee.personalinfo','en_GB','Personal Info',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10468,'employee.personalinfo','zh_CN','个人信息',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10469,'employee.ismainposition','en_GB','Main Position',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10470,'employee.ismainposition','zh_CN','是否主岗位',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10471,'position.selectposition','en_GB','Select Position',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10472,'position.selectposition','zh_CN','选择岗位',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10473,'hrorgunit.unittreelist','zh_CN','查看组织结构',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10474,'hrorgunit.unittreelist','en_GB','Unit Structure',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10475,'hrorgunit.unitinfo','zh_CN','组织信息',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10476,'hrorgunit.unitinfo','en_GB','Unit Info',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10477,'sys.config.password_policy','en_GB','PassWord Policy',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10478,'sys.config.password_policy','zh_CN','密码策略',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10479,'sys.config.password_min_length','en_GB','Password Min Length',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10480,'sys.config.password_min_length','zh_CN','密码最小长度',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10481,'sys.config.password_complexity','en_GB','Password Complexity',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10482,'sys.config.password_complexity','zh_CN','密码复杂度要求',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10483,'error.user.update_password','zh_CN','用户密码失效，重新设置密码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10484,'error.user.update_password','en_GB','password expire ,reset your password',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10485,'error.user.current_password_notempty','zh_CN','当前密码不能为空',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10486,'error.user.current_password_notempty','en_GB','current password can not be empty',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10487,'error.user.new_password_notempty','zh_CN','新密码不能为空',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10488,'error.user.new_password_notempty','en_GB','new password can not be empty',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10489,'error.user.new_password_again','zh_CN','请再次输入新密码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10490,'error.user.new_password_again','en_GB','please input new password again',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10491,'sys.config.password_invalid_time','zh_CN','密码失效时间',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10492,'sys.config.password_invalid_time','en_GB','password invalid time',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10493,'user.passwordlength.insufficient','zh_CN','密码长度不能小于',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10494,'user.passwordlength.insufficient','en_GB','Password length cannot be less than',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10495,'user.password.discord','zh_CN','密码输入不一致',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10496,'user.password.discord','en_GB','Do not match the password input',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10497,'company.companycode','zh_CN','公司代码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10498,'company.companycode','en_GB','company code',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10499,'company.companyshortname','zh_CN','公司简称',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10500,'company.companyshortname','en_GB','company short name',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10501,'company.companyfullname','en_GB','company full name',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10502,'company.companyfullname','zh_CN','公司全称',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10503,'company.companytype','zh_CN','公司类型',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10504,'company.companytype','en_GB','company type',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10505,'company.address','zh_CN','公司地址',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10506,'company.address','en_GB','company address',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10507,'company.companylevelid','zh_CN','公司等级',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10508,'company.companylevelid','en_GB','company level id',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10509,'company.positionname','zh_CN','公司岗位',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10510,'company.positionname','en_GB','position',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10511,'company.parentcompanyname','zh_CN','上级公司',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10512,'company.parentcompanyname','en_GB','Superior Company',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10513,'company.zipcode','zh_CN','邮政编码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10514,'company.zipcode','en_GB','zipcode',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10515,'company.phone','zh_CN','联系电话',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10516,'company.phone','en_GB','phone',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10517,'company.contactperson','zh_CN','联系人',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10518,'company.contactperson','en_GB','contact person',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10519,'company.fax','zh_CN','传真',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10520,'company.fax','en_GB','fax',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10521,'sys.config.select_file','zh_CN','选择文件',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10522,'sys.config.select_file','en_GB','Select File',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10523,'sys.config.upload_file','zh_CN','上传',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10524,'sys.config.upload_file','en_GB','Upload',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10525,'error.user.email','zh_CN','请输入正确的Email信息',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10526,'error.user.email','en_GB','Please enter the correct Email information',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10527,'error.user.phone','zh_CN','请输入正确的电话信息',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10528,'error.user.phone','en_GB','Please enter the correct Phone information',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10529,'hap.quicknavigation','zh_CN','输入功能代码或功能名称',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10530,'hap.quicknavigation','en_GB','Please input function code or name',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10531,'error.account_no_role','zh_CN','该账户下无有效角色',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10532,'error.account_no_role','en_GB','this account has no valid role',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10533,'sys.config.password_invalid_describe','zh_CN','单位:天 ,0表示密码不过期',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10534,'sys.config.password_invalid_describe','en_GB','Unit: day, 0 means password not expired',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10535,'sys.dashboard.dashboardtitle','zh_CN','标题',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10536,'sys.dashboard.dashboardtitle','en_GB','Title',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10537,'sys.dashboard.dashboardcode','zh_CN','代码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10538,'sys.dashboard.dashboardcode','en_GB','Code',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10539,'sys.dashboard.dashboardmainpage','zh_CN','入口页面',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10540,'sys.dashboard.dashboardmainpage','en_GB','Mainpage',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10541,'sys.dashboard.dashboarddescription','zh_CN','描述',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10542,'sys.dashboard.dashboarddescription','en_GB','Description',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10543,'job.infodetail.jobinfo','zh_CN','任务参数',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10544,'job.infodetail.jobinfo','en_GB','Job Info',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10545,'job.infodetail.notification','zh_CN','结束通知',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10546,'job.infodetail.notification','en_GB','Notification',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10547,'job.infodetail.enable_notification','zh_CN','启用通知',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10548,'job.infodetail.enable_notification','en_GB','Enable Nofitication',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10549,'job.infodetail.email_address','zh_CN','邮件地址',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10550,'job.infodetail.email_address','en_GB','Email Address',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10551,'job.jobdetail','zh_CN','任务明细',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10552,'job.jobdetail','en_GB','Job Details',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10553,'simpletriggerdto.repeatinterval','zh_CN','重复间隔',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10554,'simpletriggerdto.repeatinterval','en_GB','Repeat Interval',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10555,'simpletriggerdto.repeatcount','zh_CN','重复次数',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10556,'simpletriggerdto.repeatcount','en_GB','Repeat Count',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10557,'generator.projectpath','zh_CN','项目路径',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10558,'generator.projectpath','en_GB','Project path',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10559,'generator.parentpackagepath','zh_CN','包父路径',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10560,'generator.parentpackagepath','en_GB','Parent Package Path',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10561,'generator.packagepath','zh_CN','包路径',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10562,'generator.packagepath','en_GB','Package Path',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10563,'generator.choosetable','zh_CN','选择表',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10564,'generator.choosetable','en_GB','choose table',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10565,'generator.filetype','zh_CN','文件类型',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10566,'generator.filetype','en_GB','File Type',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10567,'generator.filename','zh_CN','文件名',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10568,'generator.filename','en_GB','File Name',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10569,'generator.iscreate','zh_CN','是否创建',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10570,'generator.iscreate','en_GB','is Created',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10571,'generator.iscover','zh_CN','是否覆盖',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10572,'generator.iscover','en_GB','is Cover',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10573,'generator.htmlmodel','zh_CN','选则ftl模板',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10574,'generator.htmlmodel','en_GB','Choose FTL Template',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10575,'generator.submit','zh_CN','创建文件',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10576,'generator.submit','en_GB','Create File',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10577,'generator.needchoosetable','zh_CN','请选择一个表',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10578,'generator.needchoosetable','en_GB','Please Choose a Table',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10579,'hrorgunit.companyname','zh_CN','公司',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10580,'hrorgunit.companyname','en_GB','Company',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10581,'hap.copy','zh_CN','复制',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10582,'hap.copy','en_GB','Copy',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10583,'hap.tip.selectrow','zh_CN','请选择一行',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10584,'hap.tip.selectrow','en_GB','Please Select One',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10585,'hap.tip.selectrows','zh_CN','请至少选择一行',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10586,'hap.tip.selectrows','en_GB','Please Select At Least One',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10587,'hap.typeorkey_empty','zh_CN','参数附件类型或者附件索引值为空',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10588,'hap.typeorkey_empty','en_GB','Type Or Key Empty',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10589,'hap.type_error','zh_CN','主目录中没有对应的附件类型',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10590,'hap.type_error','en_GB','Type Error',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10591,'hap.database_error','zh_CN','数据库错误',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10592,'hap.database_error','en_GB','Database Error',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10593,'hap.mesg_unique','zh_CN','该文件目录只允许上传一个文件',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10594,'hap.mesg_unique','en_GB','Category Unique',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10595,'hap.download','zh_CN','下载',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10596,'hap.download','en_GB','Download',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10597,'hap.mesg_delete','zh_CN','删除成功',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10598,'hap.mesg_delete','en_GB','Deleted',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10599,'message.sendflag','zh_CN','发送状态',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10600,'message.sendflag','en_GB','Send Status',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10601,'message.templatetest','zh_CN','模板邮件定义',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10602,'message.templatetest','en_GB','Template Message',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10603,'message.customtest','zh_CN','自定义邮件定义',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10604,'message.customtest','en_GB','Custom Message',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10605,'message.rensend','zh_CN','重新发送',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10606,'message.rensend','en_GB','ReSend Message',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10607,'messagetemplate.creationdate','zh_CN','邮件创建时间',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10608,'messagetemplate.creationdate','en_GB','Message Create Time',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10609,'messagetemplate.lastupdatedate','zh_CN','邮件更新时间',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10610,'messagetemplate.lastupdatedate','en_GB','Message Update Time',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10611,'hap.upload_success','zh_CN','上传成功',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10612,'hap.upload_success','en_GB','Upload Success',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10613,'codevalue.orderseq','zh_CN','排序号',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10614,'codevalue.orderseq','en_GB','Order Seq',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10615,'sys.login.safety','zh_CN','登录策略',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10616,'sys.login.safety','en_GB','Login Policy',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10617,'sys.config.rolemerge','zh_CN','角色合并',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10618,'sys.config.rolemerge','en_GB','Role Merge',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10619,'sys.config.user_role_merge.describe','zh_CN','合并后，登录不在需要选择角色，菜单、权限都是合并后的',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10620,'sys.config.user_role_merge.describe','en_GB','After the merger, the login is not need to select roles, menus, permissions are combined',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10621,'sys.config.default_target_url','zh_CN','跳转URL',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10622,'sys.config.default_target_url','en_GB','Target URL',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10623,'sys.config.default_target_url.describe','zh_CN','登录成功以后跳转的URL',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10624,'sys.config.default_target_url.describe','en_GB','Login successful redirect URL',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10625,'interface.systemname','zh_CN','系统名称',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10626,'interface.systemname','en_GB','System Name',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10627,'interface.interfacetype','zh_CN','接口类型',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10628,'interface.interfacetype','en_GB','Interface Type',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10629,'interface.systemurl','zh_CN','系统地址',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10630,'interface.systemurl','en_GB','System URL',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10631,'interface.requestmethod','zh_CN','请求方式',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10632,'interface.requestmethod','en_GB','Request Method',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10633,'interface.requestformat','zh_CN','请求形式',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10634,'interface.requestformat','en_GB','Request Format',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10635,'interface.mapperclass','zh_CN','映射类',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10636,'interface.mapperclass','en_GB','Mapper Class',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10637,'interface.namespace','zh_CN','命名空间',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10638,'interface.namespace','en_GB','Namespace',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10639,'interface.enableflag','zh_CN','是否有效',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10640,'interface.enableflag','en_GB','Enable Flag',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10641,'interface.authflag','zh_CN','是否校验',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10642,'interface.authflag','en_GB','Auth Flag',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10643,'interface.requestcontenttype','zh_CN','请求报文格式',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10644,'interface.requestcontenttype','en_GB','Request Content Type',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10645,'interface.requestaccept','zh_CN','请求接受类型',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10646,'interface.requestaccept','en_GB','Request Accept',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10647,'interface.checkusername','zh_CN','校验用户名',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10648,'interface.checkusername','en_GB','Check User Name',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10649,'interface.checkpassword','zh_CN','校验密码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10650,'interface.checkpassword','en_GB','Check Password',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10651,'interface.soapheader','zh_CN','SOAP报文前缀',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10652,'interface.soapheader','en_GB','SOAP Header',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10653,'interface.soaptail','zh_CN','SOAP报文后缀',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10654,'interface.soaptail','en_GB','SOAP Tail',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10655,'interface.headeredit','zh_CN','编辑接口信息',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10656,'interface.headeredit','en_GB','Interface Header Edit',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10657,'interface.lineedit','zh_CN','查看接口信息',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10658,'interface.lineedit','en_GB','View Interface',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10659,'interface.line.interfacecode','zh_CN','接口代码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10660,'interface.line.interfacecode','en_GB','Interface Code',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10661,'interface.systemcode','zh_CN','系统代码',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10662,'interface.systemcode','en_GB','System Code',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10663,'interface.line.interfacename','zh_CN','接口名称',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10664,'interface.line.interfacename','en_GB','Interface Name',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10665,'interface.lind.interfaceurl','zh_CN','接口地址',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10666,'interface.lind.interfaceurl','en_GB','Interface URL',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10667,'interface.invoke.inbound','zh_CN','入站请求',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10668,'interface.invoke.inbound','en_GB','Inbound Request',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10669,'interface.invoke.outbound','zh_CN','出站请求',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10670,'interface.invoke.outbound','en_GB','Outbound Request',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10671,'interface.invoke.requeststatus','zh_CN','请求状态',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10672,'interface.invoke.requeststatus','en_GB','Request Status',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10673,'interface.invoke.requesttime','zh_CN','请求日期',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10674,'interface.invoke.requesttime','en_GB','Request Date',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10675,'interface.invoke.requestip','zh_CN','用户IP',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10676,'interface.invoke.requestip','en_GB','User IP',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10677,'interface.invoke.responsetime','zh_CN','响应时间',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10678,'interface.invoke.responsetime','en_GB','Response Time',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10679,'interface.invoke.detail','zh_CN','详细信息',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10680,'interface.invoke.detail','en_GB','Invoke Detail',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10681,'interface.invoke.requestparameter','zh_CN','请求参数',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10682,'interface.invoke.requestparameter','en_GB','Request Parameter',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10683,'interface.invoke.responsecode','zh_CN','HTTP CODE',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10684,'interface.invoke.responsecode','en_GB','HTTP CODE',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10685,'interface.invoke.requestbodyprm','zh_CN','请求body',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10686,'interface.invoke.requestbodyprm','en_GB','Body Parameter',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10687,'interface.invoke.responsecontent','zh_CN','响应内容',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10688,'interface.invoke.responsecontent','en_GB','Response Date',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10689,'interface.invoke.stacktrace','zh_CN','错误堆栈',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10690,'interface.invoke.stacktrace','en_GB','Stack Trace',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10691,'interface.invoke.userreferer','zh_CN','Referer',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10692,'interface.invoke.userreferer','en_GB','Referer',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10693,'interface.invoke.useragent','zh_CN','User-Agent',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10694,'interface.invoke.useragent','en_GB','User-Agent',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10695,'interface.invoke.statsenddate','zh_CN','开始日期',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10696,'interface.invoke.statsenddate','en_GB','Begin Date',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10697,'hap.error.uniqueexception','zh_CN','数据重复',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10698,'hap.error.uniqueexception','en_GB','Data Duplicated',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10699,'hap.error.nullexception','zh_CN','字段不能为空',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10700,'hap.error.nullexception','en_GB','Field can not be null',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10701,'hap.exportexcel','zh_CN','导出Excel',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10702,'hap.exportexcel','en_GB','Export Excel',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10703,'interface.invoke.endsenddate','zh_CN','截止日期',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10704,'interface.invoke.endsenddate','en_GB','End Date',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10705,'hap.invoke.apiname.interfacetranspond','zh_CN','接口透传',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10706,'hap.invoke.apiname.interfacetranspond','en_GB','Interface Transpond',1,-1,-1,-1,'2017-01-07 11:50:09',-1,'2017-01-07 11:50:09',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10707,'test.company_name','en_GB','Company Name',2,-1,-1,10001,'2017-01-11 10:51:13',10001,'2017-01-11 10:57:03',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10708,'test.company_name','zh_CN','公司名称',2,-1,-1,10001,'2017-01-11 10:51:13',10001,'2017-01-11 10:57:03',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10709,'test.customer_name','en_GB','Customer Name',1,-1,-1,10001,'2017-01-11 10:52:19',10001,'2017-01-11 10:52:19',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10710,'test.customername','zh_CN','客户名称',2,-1,-1,10001,'2017-01-11 10:52:19',10001,'2017-01-11 19:00:31',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10711,'test.item','en_GB','Item',1,-1,-1,10001,'2017-01-11 10:57:04',10001,'2017-01-11 10:57:04',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10712,'test.item','zh_CN','物料',1,-1,-1,10001,'2017-01-11 10:57:04',10001,'2017-01-11 10:57:04',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10713,'test.order_number','en_GB','Order Number',1,-1,-1,10001,'2017-01-11 10:57:04',10001,'2017-01-11 10:57:04',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10714,'test.order_number','zh_CN','销售订单号',1,-1,-1,10001,'2017-01-11 10:57:04',10001,'2017-01-11 10:57:04',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10715,'test.order_state','en_GB','Order State',1,-1,-1,10001,'2017-01-11 10:58:20',10001,'2017-01-11 10:58:20',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10716,'test.order_state','zh_CN','订单状态',1,-1,-1,10001,'2017-01-11 10:58:20',10001,'2017-01-11 10:58:20',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10717,'test.company_id','zh_CN','公司ID',1,-1,-1,10001,'2017-01-11 14:56:10',10001,'2017-01-11 14:56:10',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10718,'test.company_id','en_GB','Company Id',1,-1,-1,10001,'2017-01-11 14:56:10',10001,'2017-01-11 14:56:10',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10719,'test.customername','en_GB','Customer Name',1,-1,-1,10001,'2017-01-11 19:00:32',10001,'2017-01-11 19:00:32',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10720,'test.customernumber','en_GB','Customer Number',1,-1,-1,10001,'2017-01-11 19:01:21',10001,'2017-01-11 19:01:21',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10721,'test.customernumber','zh_CN','客户编码',1,-1,-1,10001,'2017-01-11 19:01:21',10001,'2017-01-11 19:01:21',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10722,'test.company_number','zh_CN','公司代码',1,-1,-1,10001,'2017-01-11 21:43:33',10001,'2017-01-11 21:43:33',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10723,'test.company_number','en_GB','Company Number',1,-1,-1,10001,'2017-01-11 21:43:33',10001,'2017-01-11 21:43:33',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10724,'test.item_description','zh_CN','物料描述',1,-1,-1,10001,'2017-01-12 15:57:30',10001,'2017-01-12 15:57:30',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10725,'test.item_description','en_GB','Item Description',1,-1,-1,10001,'2017-01-12 15:57:30',10001,'2017-01-12 15:57:30',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10726,'test.item_code','en_GB','Item Code',1,-1,-1,10001,'2017-01-12 15:57:30',10001,'2017-01-12 15:57:30',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10727,'test.item_code','zh_CN','物料编码',1,-1,-1,10001,'2017-01-12 15:57:30',10001,'2017-01-12 15:57:30',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10728,'test.query','en_GB','Query',1,-1,-1,10001,'2017-01-12 18:19:20',10001,'2017-01-12 18:19:20',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10729,'test.query','zh_CN','查询',1,-1,-1,10001,'2017-01-12 18:19:20',10001,'2017-01-12 18:19:20',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10730,'test.reset','en_GB','Reset',1,-1,-1,10001,'2017-01-12 18:20:20',10001,'2017-01-12 18:20:20',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10731,'test.reset','zh_CN','重置',1,-1,-1,10001,'2017-01-12 18:20:20',10001,'2017-01-12 18:20:20',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10732,'test.exportexcel','en_GB','Export Excel',1,-1,-1,10001,'2017-01-12 18:25:05',10001,'2017-01-12 18:25:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10733,'test.exportexcel','zh_CN','导出Excel',1,-1,-1,10001,'2017-01-12 18:25:05',10001,'2017-01-12 18:25:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10734,'test.order_date','zh_CN','订单日期',1,-1,-1,10001,'2017-01-12 22:00:08',10001,'2017-01-12 22:00:08',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10735,'test.order_date','en_GB','Order Date',1,-1,-1,10001,'2017-01-12 22:00:08',10001,'2017-01-12 22:00:08',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10736,'test.order_price','zh_CN','订单金额',1,-1,-1,10001,'2017-01-12 22:01:06',10001,'2017-01-12 22:01:06',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10737,'test.order_price','en_GB','Order Price',1,-1,-1,10001,'2017-01-12 22:01:06',10001,'2017-01-12 22:01:06',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10738,'test.orderdate','en_GB','Order Date',1,-1,-1,10001,'2017-01-13 09:58:44',10001,'2017-01-13 09:58:44',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10739,'test.orderdate','zh_CN','订单日期',1,-1,-1,10001,'2017-01-13 09:58:44',10001,'2017-01-13 09:58:44',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10740,'test.order_sum_price','en_GB','Order Total Price',1,-1,-1,10001,'2017-01-13 10:04:47',10001,'2017-01-13 10:04:47',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10741,'test.order_sum_price','zh_CN','订单总金额',1,-1,-1,10001,'2017-01-13 10:04:47',10001,'2017-01-13 10:04:47',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10742,'test.return','zh_CN','返回',1,-1,-1,10001,'2017-01-13 10:25:13',10001,'2017-01-13 10:25:13',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10743,'test.return','en_GB','Return',1,-1,-1,10001,'2017-01-13 10:25:13',10001,'2017-01-13 10:25:13',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10744,'test.bill_print','en_GB','Bill Print',1,-1,-1,10001,'2017-01-13 10:25:13',10001,'2017-01-13 10:25:13',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10745,'test.bill_print','zh_CN','单据打印',1,-1,-1,10001,'2017-01-13 10:25:13',10001,'2017-01-13 10:25:13',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10746,'test.entire_delete','zh_CN','整单删除',1,-1,-1,10001,'2017-01-13 10:25:13',10001,'2017-01-13 10:25:13',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10747,'test.entire_delete','en_GB','Entirely Delete',1,-1,-1,10001,'2017-01-13 10:25:13',10001,'2017-01-13 10:25:13',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10748,'test.reject','zh_CN','拒绝',1,-1,-1,10001,'2017-01-13 10:25:13',10001,'2017-01-13 10:25:13',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10749,'test.reject','en_GB','Reject',1,-1,-1,10001,'2017-01-13 10:25:13',10001,'2017-01-13 10:25:13',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10750,'test.approve','en_GB','Approve',1,-1,-1,10001,'2017-01-13 10:25:13',10001,'2017-01-13 10:25:13',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10751,'test.approve','zh_CN','审批',1,-1,-1,10001,'2017-01-13 10:25:13',10001,'2017-01-13 10:25:13',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10752,'test.submit','en_GB','Submit',1,-1,-1,10001,'2017-01-13 10:25:13',10001,'2017-01-13 10:25:13',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10753,'test.submit','zh_CN','提交',1,-1,-1,10001,'2017-01-13 10:25:13',10001,'2017-01-13 10:25:13',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10754,'test.save','en_GB','Save',1,-1,-1,10001,'2017-01-13 10:25:13',10001,'2017-01-13 10:25:13',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10755,'test.save','zh_CN','保存',1,-1,-1,10001,'2017-01-13 10:25:13',10001,'2017-01-13 10:25:13',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10756,'test.other','en_GB','Other',1,-1,-1,10001,'2017-01-13 10:39:07',10001,'2017-01-13 10:39:07',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10757,'test.other','zh_CN','其他',1,-1,-1,10001,'2017-01-13 10:39:07',10001,'2017-01-13 10:39:07',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10758,'test.main','en_GB','Main',1,-1,-1,10001,'2017-01-13 10:39:07',10001,'2017-01-13 10:39:07',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10759,'test.main','zh_CN','主要',1,-1,-1,10001,'2017-01-13 10:39:07',10001,'2017-01-13 10:39:07',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10760,'test.line_number','en_GB','Line Number',1,-1,-1,10001,'2017-01-13 11:03:10',10001,'2017-01-13 11:03:10',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10761,'test.line_number','zh_CN','行号',1,-1,-1,10001,'2017-01-13 11:03:10',10001,'2017-01-13 11:03:10',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10762,'test.quantity_unit','en_GB','Quantity Unit',1,-1,-1,10001,'2017-01-13 11:06:09',10001,'2017-01-13 11:06:09',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10763,'test.quantity_unit','zh_CN','产品单位',1,-1,-1,10001,'2017-01-13 11:06:09',10001,'2017-01-13 11:06:09',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10764,'test.quantity','en_GB','Quantity',1,-1,-1,10001,'2017-01-13 11:07:24',10001,'2017-01-13 11:07:24',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10765,'test.quantity','zh_CN','数量',1,-1,-1,10001,'2017-01-13 11:07:24',10001,'2017-01-13 11:07:24',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10766,'test.sale_price','en_GB','Sale Price',1,-1,-1,10001,'2017-01-13 11:08:21',10001,'2017-01-13 11:08:21',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10767,'test.sale_price','zh_CN','销售价格',1,-1,-1,10001,'2017-01-13 11:08:21',10001,'2017-01-13 11:08:21',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10768,'test.price','en_GB','money',1,-1,-1,10001,'2017-01-13 11:09:39',10001,'2017-01-13 11:09:39',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10769,'test.price','zh_CN','金额',1,-1,-1,10001,'2017-01-13 11:09:39',10001,'2017-01-13 11:09:39',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10770,'test.remark','en_GB','Remark',1,-1,-1,10001,'2017-01-13 11:10:03',10001,'2017-01-13 11:10:03',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10771,'test.remark','zh_CN','备注',1,-1,-1,10001,'2017-01-13 11:10:03',10001,'2017-01-13 11:10:03',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10772,'test.overhead4','en_GB','Overhead4',1,-1,-1,10001,'2017-01-13 12:01:11',10001,'2017-01-13 12:01:11',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10773,'test.overhead4','zh_CN','附加信息4',1,-1,-1,10001,'2017-01-13 12:01:11',10001,'2017-01-13 12:01:11',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10774,'test.overhead3','zh_CN','附加信息3',1,-1,-1,10001,'2017-01-13 12:01:11',10001,'2017-01-13 12:01:11',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10775,'test.overhead2','en_GB','Overhead2',1,-1,-1,10001,'2017-01-13 12:01:11',10001,'2017-01-13 12:01:11',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10776,'test.overhead2','zh_CN','附加信息2',1,-1,-1,10001,'2017-01-13 12:01:11',10001,'2017-01-13 12:01:11',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10777,'test.overhead1','en_GB','Overhead1',1,-1,-1,10001,'2017-01-13 12:01:11',10001,'2017-01-13 12:01:11',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10778,'test.overhead1','zh_CN','附加信息1',1,-1,-1,10001,'2017-01-13 12:01:11',10001,'2017-01-13 12:01:11',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10779,'test.item_uom','zh_CN','产品单位',1,-1,-1,10001,'2017-01-15 15:50:09',10001,'2017-01-15 15:50:09',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10780,'test.item_uom','en_GB','Item Uom',1,-1,-1,10001,'2017-01-15 15:50:09',10001,'2017-01-15 15:50:09',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_prompts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_resource_b`
--

DROP TABLE IF EXISTS `sys_resource_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_resource_b` (
  `RESOURCE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `URL` varchar(255) NOT NULL COMMENT 'URL',
  `TYPE` varchar(15) DEFAULT NULL COMMENT '资源类型',
  `NAME` varchar(40) DEFAULT NULL COMMENT '资源名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `LOGIN_REQUIRE` varchar(1) DEFAULT 'Y' COMMENT '是否需要登录',
  `ACCESS_CHECK` varchar(1) DEFAULT 'Y' COMMENT '是否权限校验',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`),
  UNIQUE KEY `SYS_RESOURCE_B_U1` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=10197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_resource_b`
--

LOCK TABLES `sys_resource_b` WRITE;
/*!40000 ALTER TABLE `sys_resource_b` DISABLE KEYS */;
INSERT INTO `sys_resource_b` VALUES (10001,'403.html','HTML','403','403','N','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'404.html','HTML','404','404','N','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'500.html','HTML','500','500','N','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'activiti/models.html','HTML','流程设计',NULL,'Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,'activiti/my_task.html','HTML','我的代办',NULL,'Y','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,'activiti/process_definitions.html','HTML','部署管理',NULL,'Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,'activiti/process_history.html','HTML','流程历史',NULL,'Y','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10008,'activiti/start_process_test.html','HTML','流程测试',NULL,'Y','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10009,'activiti/task_list.html','HTML','代办事项(管理员)',NULL,'Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,'home.html','HTML','首页','首页','Y','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,'hr/employee.html','HTML','员工','员工','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10012,'hr/employee/query','SERVICE','员工查询','员工查询','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10013,'hr/employee/submit','SERVICE','员工更新','员工更新','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10014,'hr/position.html','HTML','岗位','部门岗位','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10015,'hr/position/query','SERVICE','岗位查询','岗位查询','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10016,'hr/position/remove','SERVICE','删除岗位','删除岗位','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10017,'hr/position/submit','SERVICE','岗位修改','岗位修改','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10018,'hr/org_unit.html','HTML','组织','组织部门','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10019,'hr/unit/query','SERVICE','部门查询','部门查询','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10020,'hr/unit/remove','SERVICE','删除部门','删除部门','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10021,'hr/unit/submit','SERVICE','部门修改','部门修改','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10023,'job/job_detail.html','HTML','任务明细','任务明细','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10024,'job/job_cron_add.html','HTML','新建 CRON 任务','新建CRON 任务','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10025,'job/job_simple_add.html','HTML','新建简单任务','新建简单任务','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10026,'job/job_infodetail.html','HTML','任务详细','任务详细','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10027,'job/create','SERVICE','新建任务','新建任务','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10028,'job/deletejob','SERVICE','删除任务','删除任务','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10029,'job/pausejob','SERVICE','暂停任务','暂停任务','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10030,'job/query','SERVICE','查询任务','查询任务','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10031,'job/queryInfo','SERVICE','查询任务列表','查询任务列表','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10032,'job/resumejob','SERVICE','恢复任务','恢复任务','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10033,'job/job_running_info.html','HTML','执行记录','执行记录','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10034,'job/jobinfo/query','SERVICE','查询任务日志','查询任务日志','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10035,'job/scheduler.html','HTML','调度器','调度器','Y','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10036,'job/scheduler/info','SERVICE','调度器信息','调度器信息','Y','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10037,'job/scheduler/pauseall','SERVICE','暂停所有任务','暂停所有任务','Y','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10038,'job/scheduler/query','SERVICE','查询调度器','查询调度器','Y','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10039,'job/scheduler/resumeall','SERVICE','恢复所有任务','恢复所有任务','Y','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10040,'job/scheduler/standby','SERVICE','暂停调度器','暂停调度器','Y','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10041,'job/scheduler/start','SERVICE','启动调度器','启动调度器','Y','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10042,'login.html','HTML','登录','登录','N','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10043,'role.html','HTML','角色选择','角色选择','Y','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10044,'attach/sys_attach_category_edit.html','HTML','目录编辑','目录编辑','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10045,'attach/sys_attach_category_manage.html','HTML','目录管理','目录管理','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10046,'sys/attachcategory/query','SERVICE','查询目录','查询目录','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10047,'sys/attachcategory/remove','SERVICE','删除目录','删除目录','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10048,'sys/attachcategory/submit','SERVICE','更新目录','更新目录','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10049,'attach/sys_file_manage.html','HTML','文件管理','文件管理','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10050,'sys/attachcategory/tree','SERVICE','查询目录树','查询目录树','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10051,'sys/attach/file/queryFiles','SERVICE','查询文件','查询目录','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10052,'sys/attach/file/remove','SERVICE','删除附件','删除附件','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10053,'sys/attach/file/detail','SERVICE','查看附件内容','查看附件内容','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10054,'sys/attach/file/view','SERVICE','查看附件','查看附件','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10055,'sys/attach/remove','SERVICE','删除附件','删除附件','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10056,'sys/attach/file/query','SERVICE','查询目录文件','查询目录文件','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10057,'sys/attach/manage','SERVICE','附件列表','附件列表','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10058,'attach/sys_attachment_create.html','HTML','上传测试','上传测试','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10059,'sys/attach/upload','SERVICE','附件上传','附件上传','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10060,'sys/code/query','SERVICE','查询快码','查询快码','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10061,'sys/code/remove','SERVICE','删除快码','删除快码','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10062,'sys/code/submit','SERVICE','更新快码','更新快码','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10063,'sys/codevalue/query','SERVICE','查询快码值','查询快码值','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10064,'sys/codevalue/remove','SERVICE','删除快码值','删除快码值','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10065,'sys/sys_function.html','HTML','功能管理','功能管理','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10066,'sys_function_resource.html','HTML','功能资源','功能资源','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10067,'sys/sys_function_addresource.html','HTML','添加资源','添加资源','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10068,'sys/function/fetchNotResource','SERVICE','获取未分配资源','获取未分配资源','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10069,'sys/function/fetchResource','SERVICE','获取已分配资源','获取已分配资源','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10070,'sys/function/menus','SERVICE','获取菜单','获取菜单','Y','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10071,'sys/function/query','SERVICE','查询功能','查询功能','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10072,'sys/function/remove','SERVICE','删除功能','删除功能','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10073,'sys/function/submit','SERVICE','更新功能','更新功能','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10074,'sys/function/updateFunctionResource','SERVICE','更新功能资源','更新功能资源','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10075,'sys/sys_language.html','HTML','语言维护','语言维护','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10076,'sys/language/delete','SERVICE','删除语言','删除语言','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10077,'sys/language/query','SERVICE','查询语言','查询语言','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10078,'sys/language/submit','SERVICE','更新语言','更新语言','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10079,'sys/lov/load','SERVICE','加载 LOV','加载 LOV','Y','N',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10080,'sys/lov/query','SERVICE','查询 LOV','查询 LOV','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10081,'sys/lov/remove','SERVICE','删除 LOV','删除 LOV','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10082,'sys/lov/submit','SERVICE','更新 LOV','更新 LOV','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10083,'sys/lovitem/query','SERVICE','查询 LOV 列','查询 LOV 列','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10084,'sys/lovitem/remove','SERVICE','删除 LOV 列','删除 LOV 列','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10085,'mail/sys_message_email_config.html','HTML','邮件账户','邮件账户','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10086,'mail/sys_message_email_config_edit.html','HTML','编辑邮件配置','编辑邮件配置','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10087,'sys/messageEmailAccount/query','SERVICE','查询邮件账户','查询邮件账户','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10088,'sys/messageEmailAccount/remove','SERVICE','删除邮件账户','删除邮件账户','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10089,'sys/messageEmailConfig/load','SERVICE','加载邮件配置','加载邮件配置','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10090,'sys/messageEmailConfig/query','SERVICE','查询邮件配置','查询邮件配置','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10091,'sys/messageEmailConfig/queryMsgConfigQuanties','SERVICE','查询邮件配置数量','查询配置数量','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10092,'sys/messageEmailConfig/remove','SERVICE','删除邮件配置','删除邮件配置','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10093,'sys/messageEmailConfig/submit','SERVICE','更新邮件配置','更新邮件配置','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10094,'sys/messageEmailWhiteList/query','SERVICE','查询邮件白名单','查询邮件白名单','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10095,'sys/messageEmailWhiteList/remove','SERVICE','删除邮件白名单','删除邮件白名单','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10096,'mail/sys_message_template.html','HTML','邮件模板','邮件模板','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10097,'mail/sys_message_template_edit.html','HTML','编辑模板','编辑模板','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10098,'sys/messageTemplate/add','SERVICE','新建模板','新建模板','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10099,'sys/messageTemplate/query','SERVICE','查询模板','查询模板','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10100,'sys/messageTemplate/remove','SERVICE','删除模板','删除模板','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10101,'sys/messageTemplate/update','SERVICE','更新模板','更新模板','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10102,'mail/sys_message_test.html','HTML','邮件测试','邮件测试','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10103,'sys/message/sendTest','SERVICE','邮件发送测试','邮件发送测试','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10104,'sys/preferences/queryPreferences','SERVICE','查询首选项','查询首选项','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10105,'sys/preferences/savePreferences','SERVICE','保存首选项','保存首选项','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10106,'sys/profile/query','SERVICE','查询配置','查询配置','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10107,'sys/profile/remove','SERVICE','删除配置','删除配置','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10108,'sys/profile/submit','SERVICE','更新配置','更新配置','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10109,'sys/profilevalue/query','SERVICE','查询配置值','查询配置值','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10110,'sys/profilevalue/querylevelvalues','SERVICE','查询指定级别的配置值','查询指定级别的配置值','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10111,'sys/profilevalue/remove','SERVICE','删除配置值','删除配置值','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10112,'sys/prompt/query','SERVICE','查询描述','查询描述','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10113,'sys/prompt/remove','SERVICE','删除描述','删除描述','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10114,'sys/prompt/submit','SERVICE','更改描述','更改描述','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10115,'sys/sys_resource.html','HTML','资源注册','资源注册','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10116,'sys/sys_resource_item.html','HTML','资源组件','资源组件','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10117,'sys/sys_role_resource_item.html','HTML','分配资源组件','分配资源组件','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10118,'sys/resource/query','SERVICE','查询资源','查询资源','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10119,'sys/resource/remove','SERVICE','删除资源','删除资源','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10120,'sys/resource/submit','SERVICE','更新资源','更新资源','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10121,'sys/resourceItem/query','SERVICE','查询资源组件','查询资源组件','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10122,'sys/resourceItem/remove','SERVICE','删除资源组件','删除资源组件','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10123,'sys/resourceItem/submit','SERVICE','更新资源组件','更新资源组件','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10124,'sys/role/queryRoleNotUserRole','SERVICE','选择非当前角色','选择非当前角色','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10125,'sys/sys_role_function.html','HTML','功能分配','功能分配','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10126,'sys/rolefunction/query','SERVICE','查询角色功能','查询角色功能','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10127,'sys/rolefunction/queryResourceItems','SERVICE','查询功能资源组件','查询功能资源组件','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10128,'sys/rolefunction/submit','SERVICE','更新角色功能','更新角色功能','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10129,'sys/rolefunction/submitResourceItems','SERVICE','更新功能资源组件','更新资源组件','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10130,'sys/sys_code.html','HTML','代码维护','代码维护','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10131,'sys/sys_code_edit.html','HTML','编辑快码','编辑快码','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10132,'sys/sys_config.html','HTML','系统配置','系统配置','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10133,'sys/sys_lov.html','HTML','LOV维护','LOV维护','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10134,'sys/sys_lov_edit.html','HTML','编辑 LOV','编辑 LOV','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10135,'sys/sys_lov_preview.html','HTML','LOV 预览','LOV 预览','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10136,'sys/sys_multilanguage_editor.html','HTML','多语言编辑器','多语言编辑器','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10137,'sys/sys_profile.html','HTML','配置维护','配置维护','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10138,'sys/sys_profile_edit.html','HTML','编辑配置文件','编辑配置文件','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10139,'sys/sys_prompt.html','HTML','描述维护','描述维护','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10140,'sys/sys_role.html','HTML','角色管理','角色管理','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10141,'sys/role/delete','SERVICE','角色删除','角色删除','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10142,'sys/role/query','SERVICE','角色查询','角色查询','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10143,'sys/role/submit','SERVICE','角色更新','角色更新','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10144,'sys/sys_user.html','HTML','用户管理','用户管理','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10145,'sys/sys_user_role.html','HTML','角色分配','角色分配','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10146,'sys/sys_user_chooserole.html','HTML','选择角色','选择角色','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10147,'sys/user/query','SERVICE','用户查询','用户查询','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10148,'sys/user/remove','SERVICE','删除用户','删除用户','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10149,'sys/user/submit','SERVICE','更新用户','更新用户','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10150,'sys/userrole/queryUserRoles','SERVICE','查询用户角色','查询用户角色','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10151,'sys/userrole/submit','SERVICE','保存用户角色','保存用户角色','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10152,'sys/um/getSingleUser','SERVICE','单条用户信息','单条用户信息','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10153,'sys/um/isExistsEmail','SERVICE','用户邮件检查','用户邮件检查','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10154,'sys/um/isExistsPhone','SERVICE','电话号码检查','电话号码检查','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10155,'sys/um/isExistsUser','SERVICE','用户是否存在','用户是否存在','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10156,'sys/um/query','SERVICE','用户信息查询','用户信息查询','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10157,'sys/um/sys_login_success.html','HTML','登录成功','登录成功','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10158,'sys/um/sys_update_password.html','HTML','更改密码','更改密码','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10159,'sys/um/sys_user_info.html','HTML','用户信息','用户信息','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10160,'sys/um/updatePassword','SERVICE','更改密码','更改密码','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10161,'sys/um/updateUserInfo','SERVICE','更新个人信息','更新个人信息','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10162,'sys_icon.html','HTML','图标选择','图标选择','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10163,'timeout.html','HTML','超时','超时','N','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10164,'verifiCode','SERVICE','验证码服务','验证码服务','N','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10165,'fnd/company.html','HTML','公司维护','公司信息维护','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10166,'fnd/company/update','SERVICE','公司信息修改','公司信息修改','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10167,'fnd/company/query','SERVICE','公司信息查询','公司信息查询','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10168,'fnd/company/remove','SERVICE','公司信息删除','公司信息删除','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10169,'fnd/company_edit.html','HTML','公司编辑界面','公司编辑界面','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10170,'sys/sys_dashboard.html','HTML','仪表盘配置界面','仪表盘配置','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10171,'sys/sys_dashboard/query','SERVICE','查询仪表盘','查询仪表盘','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10172,'sys/sys_dashboard/submit','SERVICE','更新仪表盘','更新仪表盘','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10173,'sys/sys_dashboard/remove','SERVICE','删除仪表盘','删除仪表盘','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10174,'dashboard/task.html','SERVICE','代办事项','代办事项','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10175,'sys/sys_jvm_metrics.html','HTML','系统JVM指标','系统JVM指标','Y','N',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10176,'mail/message_status.html','HTML','邮件状态查询','邮件状态查询','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10177,'intergration/sys_interface_invoke.html','HTML','接口调用记录','接口调用记录','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10178,'intergration/sys_interface_header.html','HTML','接口定义界面','接口定义界面','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10179,'intergration/sys_interface_header_edit.html','HTML','接口系统信息','接口系统信息','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10180,'intergration/sys_interface_line_edit.html','HTML','接口修改页面','接口修改页面','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10181,'sys/sys_detail_metrics.html','HTML','系统指标详情页','系统指标详情页','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10182,'sys/message/query','SERVICE','邮件状态查询','邮件状态查询','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10183,'message/error_mess','SERVICE','邮件错误信息查询','邮件错误信息查询','Y','Y',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10188,'demo/insert','SERVICE','demo/insert',NULL,'N','N',1,-1,-1,10001,'2017-01-10 14:06:39',10001,'2017-01-10 14:06:39',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10189,'demo/delete','SERVICE','demo/delete',NULL,'N','N',1,-1,-1,10001,'2017-01-10 14:07:27',10001,'2017-01-10 14:07:27',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10190,'demo/update','SERVICE','demo/update',NULL,'N','N',1,-1,-1,10001,'2017-01-10 14:07:27',10001,'2017-01-10 14:07:27',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10191,'demo/select','SERVICE','demo/select',NULL,'N','N',1,-1,-1,10001,'2017-01-10 14:07:27',10001,'2017-01-10 14:07:27',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10192,'sales_index.html','HTML','销售订单管理主页','销售订单管理主页','Y','Y',3,-1,-1,10001,'2017-01-10 20:23:58',10001,'2017-01-14 17:49:19',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10193,'sales_order_detail.html','HTML','订单明细界面','订单明细界面','Y','N',4,-1,-1,10001,'2017-01-13 09:37:50',10001,'2017-01-14 18:19:35',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10194,'testCompany/selectByPrimaryKey','SERVICE','公司查询','基于COMPANY_ID进行关联查询','Y','Y',1,-1,-1,10001,'2017-01-14 17:52:06',10001,'2017-01-14 17:52:06',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10195,'testOrderHeader/insert','SERVICE','订单头插入','订单头插入','Y','Y',2,-1,-1,10001,'2017-01-14 17:52:48',10001,'2017-01-14 17:53:25',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10196,'TestOrderTotal/queryOrderTotal','SERVICE','订单汇总查询','订单汇总查询','Y','Y',1,-1,-1,10001,'2017-01-14 17:53:26',10001,'2017-01-14 17:53:26',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_resource_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_resource_item_b`
--

DROP TABLE IF EXISTS `sys_resource_item_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_resource_item_b` (
  `RESOURCE_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OWNER_RESOURCE_ID` bigint(20) DEFAULT NULL COMMENT '功能资源ID',
  `TARGET_RESOURCE_ID` bigint(20) DEFAULT NULL COMMENT '目标资源ID',
  `ITEM_ID` varchar(50) DEFAULT NULL COMMENT 'HTML中控件ID',
  `ITEM_NAME` varchar(50) DEFAULT NULL COMMENT '控件名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `ITEM_TYPE` varchar(10) DEFAULT NULL COMMENT '控件类型',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ITEM_ID`),
  UNIQUE KEY `SYS_RESOURCE_ITEM_B_U1` (`ITEM_ID`,`OWNER_RESOURCE_ID`),
  KEY `SYS_RESOURCE_ITEM_B_N1` (`OWNER_RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_resource_item_b`
--

LOCK TABLES `sys_resource_item_b` WRITE;
/*!40000 ALTER TABLE `sys_resource_item_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_resource_item_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_resource_item_tl`
--

DROP TABLE IF EXISTS `sys_resource_item_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_resource_item_tl` (
  `RESOURCE_ITEM_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `ITEM_NAME` varchar(150) DEFAULT NULL COMMENT '控件名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ITEM_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_resource_item_tl`
--

LOCK TABLES `sys_resource_item_tl` WRITE;
/*!40000 ALTER TABLE `sys_resource_item_tl` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_resource_item_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_resource_tl`
--

DROP TABLE IF EXISTS `sys_resource_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_resource_tl` (
  `RESOURCE_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL COMMENT '资源名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_resource_tl`
--

LOCK TABLES `sys_resource_tl` WRITE;
/*!40000 ALTER TABLE `sys_resource_tl` DISABLE KEYS */;
INSERT INTO `sys_resource_tl` VALUES (10001,'en_GB','403','403',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10001,'zh_CN','403','403',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'en_GB','404','404',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'zh_CN','404','404',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'en_GB','500','500',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'zh_CN','500','500',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'en_GB','Process Design',NULL,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'zh_CN','流程设计',NULL,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,'en_GB','My Tasks',NULL,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,'zh_CN','我的代办',NULL,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,'en_GB','Deployments',NULL,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,'zh_CN','部署管理',NULL,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,'en_GB','Process History',NULL,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,'zh_CN','流程历史',NULL,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10008,'en_GB','Process Test',NULL,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10008,'zh_CN','流程测试',NULL,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10009,'en_GB','Tasks (ADMIN)',NULL,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10009,'zh_CN','代办事项(管理员)',NULL,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,'en_GB','Home','Home',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,'zh_CN','首页','首页',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,'en_GB','Employee','Employee',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,'zh_CN','员工','员工',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10012,'en_GB','Query Employee','Query Employee',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10012,'zh_CN','员工查询','员工查询',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10013,'en_GB','Update Employee','Update Employee',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10013,'zh_CN','员工更新','员工更新',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10014,'en_GB','Position','Unit Position',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10014,'zh_CN','岗位','部门岗位',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10015,'en_GB','Query Position','Query Position',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10015,'zh_CN','岗位查询','岗位查询',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10016,'en_GB','Remove Position','Remove Position',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10016,'zh_CN','删除岗位','删除岗位',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10017,'en_GB','Modify Position','Modify Position',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10017,'zh_CN','岗位修改','岗位修改',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10018,'en_GB','unit','unit',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10018,'zh_CN','组织','组织部门',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10019,'en_GB','query unit','query unit',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10019,'zh_CN','部门查询','部门查询',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10020,'en_GB','remove unit','remove unit',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10020,'zh_CN','删除部门','删除部门',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10021,'en_GB','submit unit change','submit unit change',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10021,'zh_CN','部门修改','部门修改',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10023,'en_GB','Job Details','Job Details',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10023,'zh_CN','任务明细','任务明细',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10024,'en_GB','Add Cron Job','Add Cron Job',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10024,'zh_CN','新建 CRON 任务','新建CRON 任务',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10025,'en_GB','Add Simple Job','Add Simple Job',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10025,'zh_CN','新建简单任务','新建简单任务',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10026,'en_GB','Job Detail Info','Job Detail Info',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10026,'zh_CN','任务详细','任务详细',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10027,'en_GB','Create Job','Create Job',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10027,'zh_CN','新建任务','新建任务',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10028,'en_GB','Delete Job','Delete Job',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10028,'zh_CN','删除任务','删除任务',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10029,'en_GB','Pause Job','Pause Job',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10029,'zh_CN','暂停任务','暂停任务',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10030,'en_GB','Query Job','Query Job',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10030,'zh_CN','查询任务','查询任务',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10031,'en_GB','Query Job Info','Query Job Info',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10031,'zh_CN','查询任务列表','查询任务列表',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10032,'en_GB','Resume Job','Resume Job',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10032,'zh_CN','恢复任务','恢复任务',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10033,'en_GB','Execution Summary','Execution Summary',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10033,'zh_CN','执行记录','执行记录',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10034,'en_GB','Query Job Log','Query Job Log',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10034,'zh_CN','查询任务日志','查询任务日志',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10035,'en_GB','Scheduler','Scheduler',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10035,'zh_CN','调度器','调度器',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10036,'en_GB','Scheduler Info','Scheduler Info',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10036,'zh_CN','调度器信息','调度器信息',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10037,'en_GB','Pause All Jobs','Pause All Jobs',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10037,'zh_CN','暂停所有任务','暂停所有任务',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10038,'en_GB','Query Scheduler','Query Schedulers',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10038,'zh_CN','查询调度器','查询调度器',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10039,'en_GB','Resume All Jobs','Resume All Jobs',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10039,'zh_CN','恢复所有任务','恢复所有任务',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10040,'en_GB','Standby Scheduler','Standby Scheduler',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10040,'zh_CN','暂停调度器','暂停调度器',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10041,'en_GB','Start Scheduler','Start Scheduler',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10041,'zh_CN','启动调度器','启动调度器',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10042,'en_GB','Login','Login',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10042,'zh_CN','登录','登录',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10043,'en_GB','Role Select','Role Select',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10043,'zh_CN','角色选择','角色选择',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10044,'en_GB','Category Edit','Category Edit',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10044,'zh_CN','目录编辑','目录编辑',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10045,'en_GB','Category','Category',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10045,'zh_CN','目录管理','目录管理',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10046,'en_GB','Query Category','Query Category',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10046,'zh_CN','查询目录','查询目录',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10047,'en_GB','Delete Category','Delete Category',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10047,'zh_CN','删除目录','删除目录',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10048,'en_GB','Update Category','Update Category',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10048,'zh_CN','更新目录','更新目录',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10049,'en_GB','Files','Files',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10049,'zh_CN','文件管理','文件管理',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10050,'en_GB','Query Category Tree','Query Category Tree',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10050,'zh_CN','查询目录树','查询目录树',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10051,'en_GB','Query Files','Query Files',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10051,'zh_CN','查询文件','查询目录',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10052,'en_GB','Delete File','Delete Files',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10052,'zh_CN','删除附件','删除附件',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10053,'en_GB','Attachment Detail','Attachment Detail',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10053,'zh_CN','查看附件内容','查看附件内容',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10054,'en_GB','View Attachment','View Attachment',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10054,'zh_CN','查看附件','查看附件',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10055,'en_GB','Delete Attachment','Delete Attachment',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10055,'zh_CN','删除附件','删除附件',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10056,'en_GB','Query Category Files','Query Category Files',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10056,'zh_CN','查询目录文件','查询目录文件',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10057,'en_GB','Attachment List','Attachment List',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10057,'zh_CN','附件列表','附件列表',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10058,'en_GB','Upload Test','Upload Test',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10058,'zh_CN','上传测试','上传测试',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10059,'en_GB','Attachment Upload','Attachment Upload',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10059,'zh_CN','附件上传','附件上传',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10060,'en_GB','Query Code','Query Code',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10060,'zh_CN','查询快码','查询快码',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10061,'en_GB','Delete Code','Delete Code',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10061,'zh_CN','删除快码','删除快码',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10062,'en_GB','Update Code','Update Code',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10062,'zh_CN','更新快码','更新快码',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10063,'en_GB','Query Code Value','Query Code Value',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10063,'zh_CN','查询快码值','查询快码值',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10064,'en_GB','Delete Code Value','Query Code Value',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10064,'zh_CN','删除快码值','删除快码值',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10065,'en_GB','Function','Function',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10065,'zh_CN','功能管理','功能管理',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10066,'en_GB','Function Resource','Function Resource',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10066,'zh_CN','功能资源','功能资源',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10067,'en_GB','Add Resource','Add Resource',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10067,'zh_CN','添加资源','添加资源',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10068,'en_GB','Fetch Unassigned Resource','Fetch Unassigned Resource',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10068,'zh_CN','获取未分配资源','获取未分配资源',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10069,'en_GB','Fetch Assigned Resource','Fetch Assigned Resouce',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10069,'zh_CN','获取已分配资源','获取已分配资源',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10070,'en_GB','Menus','Get Menus',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10070,'zh_CN','获取菜单','获取菜单',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10071,'en_GB','Query Funcitons','Query Functions',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10071,'zh_CN','查询功能','查询功能',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10072,'en_GB','Delete Function','Delete Functions',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10072,'zh_CN','删除功能','删除功能',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10073,'en_GB','Update Fuction','Update Function',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10073,'zh_CN','更新功能','更新功能',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10074,'en_GB','Update Function Resource','Update Function Resource',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10074,'zh_CN','更新功能资源','更新功能资源',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10075,'en_GB','Language','Language',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10075,'zh_CN','语言维护','语言维护',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10076,'en_GB','Delete Language','Delete Language',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10076,'zh_CN','删除语言','删除语言',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10077,'en_GB','Query Language','Query Language',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10077,'zh_CN','查询语言','查询语言',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10078,'en_GB','Update Language','Update Language',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10078,'zh_CN','更新语言','更新语言',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10079,'en_GB','Load Lov','Load Lov',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10079,'zh_CN','加载 LOV','加载 LOV',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10080,'en_GB','Query Lov','Query Lov',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10080,'zh_CN','查询 LOV','查询 LOV',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10081,'en_GB','Delete Lov','Delete Lov',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10081,'zh_CN','删除 LOV','删除 LOV',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10082,'en_GB','Update Lov','Update Lov',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10082,'zh_CN','更新 LOV','更新 LOV',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10083,'en_GB','Query Lov Item','Query Lov Item',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10083,'zh_CN','查询 LOV 列','查询 LOV 列',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10084,'en_GB','Delete Lov Item','Delete Lov Item',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10084,'zh_CN','删除 LOV 列','删除 LOV 列',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10085,'en_GB','Email Account','Email Account',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10085,'zh_CN','邮件账户','邮件账户',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10086,'en_GB','Edit Email Config','Edit Email Config',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10086,'zh_CN','编辑邮件配置','编辑邮件配置',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10087,'en_GB','Query Email Account','Query Email Acount',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10087,'zh_CN','查询邮件账户','查询邮件账户',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10088,'en_GB','Delete Email Account','Delete Email Account',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10088,'zh_CN','删除邮件账户','删除邮件账户',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10089,'en_GB','Load Email Config','Load Email Config',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10089,'zh_CN','加载邮件配置','加载邮件配置',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10090,'en_GB','Query Email Config','Query Email Config',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10090,'zh_CN','查询邮件配置','查询邮件配置',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10091,'en_GB','Query Config Count','Query Config Count',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10091,'zh_CN','查询邮件配置数量','查询配置数量',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10092,'en_GB','Delete Email Config','Delete Email Config',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10092,'zh_CN','删除邮件配置','删除邮件配置',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10093,'en_GB','Update Email Config','Update Email Config',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10093,'zh_CN','更新邮件配置','更新邮件配置',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10094,'en_GB','Query White List','Query Email White List',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10094,'zh_CN','查询邮件白名单','查询邮件白名单',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10095,'en_GB','Delete White List','Delete White List',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10095,'zh_CN','删除邮件白名单','删除邮件白名单',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10096,'en_GB','Email Template','Email Template',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10096,'zh_CN','邮件模板','邮件模板',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10097,'en_GB','Edit Template','Edit Template',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10097,'zh_CN','编辑模板','编辑模板',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10098,'en_GB','Add Template','Add Template',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10098,'zh_CN','新建模板','新建模板',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10099,'en_GB','Query Template','Query Template',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10099,'zh_CN','查询模板','查询模板',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10100,'en_GB','Delete Template','Delete Template',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10100,'zh_CN','删除模板','删除模板',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10101,'en_GB','Update Tempate','Update Template',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10101,'zh_CN','更新模板','更新模板',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10102,'en_GB','Email Test','Email Test',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10102,'zh_CN','邮件测试','邮件测试',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10103,'en_GB','Email Send Test','Email Send Test',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10103,'zh_CN','邮件发送测试','邮件发送测试',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10104,'en_GB','Query Preference','Query Preference',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10104,'zh_CN','查询首选项','查询首选项',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10105,'en_GB','Save Preference','Save Preference',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10105,'zh_CN','保存首选项','保存首选项',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10106,'en_GB','Query Profile','Query Profile',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10106,'zh_CN','查询配置','查询配置',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10107,'en_GB','Delete Profile','Delete Profile',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10107,'zh_CN','删除配置','删除配置',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10108,'en_GB','Update Profile','Update Profile',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10108,'zh_CN','更新配置','更新配置',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10109,'en_GB','Query Profile Value','Query Profile Value',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10109,'zh_CN','查询配置值','查询配置值',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10110,'en_GB','Query Profile Level Value','Query Profile Level Value',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10110,'zh_CN','查询指定级别的配置值','查询指定级别的配置值',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10111,'en_GB','Delete Profile Value','Delete Profile Value',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10111,'zh_CN','删除配置值','删除配置值',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10112,'en_GB','Query Prompt','Query Prompt',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10112,'zh_CN','查询描述','查询描述',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10113,'en_GB','Delete Prompt','Delete Prompt',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10113,'zh_CN','删除描述','删除描述',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10114,'en_GB','Update Prompt','Update Prompt',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10114,'zh_CN','更改描述','更改描述',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10115,'en_GB','Resource','Resource',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10115,'zh_CN','资源注册','资源注册',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10116,'en_GB','Resource Item','Resource Item',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10116,'zh_CN','资源组件','资源组件',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10117,'en_GB','Role Resource Item','Role Resource Item',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10117,'zh_CN','分配资源组件','分配资源组件',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10118,'en_GB','Query Resource','Query Resource',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10118,'zh_CN','查询资源','查询资源',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10119,'en_GB','Delete Resource','Delete Resource',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10119,'zh_CN','删除资源','删除资源',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10120,'en_GB','Update Resource','Update Resource',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10120,'zh_CN','更新资源','更新资源',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10121,'en_GB','Query Resource Item','Query Resource Item',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10121,'zh_CN','查询资源组件','查询资源组件',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10122,'en_GB','Delete Resource Item','Delete Resource Item',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10122,'zh_CN','删除资源组件','删除资源组件',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10123,'en_GB','Update Resoruce Item','Update Resource Item',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10123,'zh_CN','更新资源组件','更新资源组件',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10124,'en_GB','Select Role','Select role not present',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10124,'zh_CN','选择非当前角色','选择非当前角色',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10125,'en_GB','Function Assign','Function Assign',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10125,'zh_CN','功能分配','功能分配',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10126,'en_GB','Query Role Function','Query Role Function',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10126,'zh_CN','查询角色功能','查询角色功能',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10127,'en_GB','Query Function Resource Item','Query Function Resource Items',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10127,'zh_CN','查询功能资源组件','查询功能资源组件',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10128,'en_GB','Update Role Function','Update Role Function',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10128,'zh_CN','更新角色功能','更新角色功能',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10129,'en_GB','Update Function Resource Items','Update Function Resource Items',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10129,'zh_CN','更新功能资源组件','更新资源组件',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10130,'en_GB','Code','Code',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10130,'zh_CN','代码维护','代码维护',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10131,'en_GB','Edit Code','Edit Code',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10131,'zh_CN','编辑快码','编辑快码',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10132,'en_GB','System Config','System Config',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10132,'zh_CN','系统配置','系统配置',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10133,'en_GB','LOV','LOV',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10133,'zh_CN','LOV维护','LOV维护',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10134,'en_GB','Edit Lov','Edit Lov',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10134,'zh_CN','编辑 LOV','编辑 LOV',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10135,'en_GB','Lov Preview','Lov Preview',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10135,'zh_CN','LOV 预览','LOV 预览',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10136,'en_GB','MultiLanguage Editor','MultiLangauge Editor',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10136,'zh_CN','多语言编辑器','多语言编辑器',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10137,'en_GB','Profile','Profile',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10137,'zh_CN','配置维护','配置维护',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10138,'en_GB','Edit Profile','Edit Profile',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10138,'zh_CN','编辑配置文件','编辑配置文件',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10139,'en_GB','Prompt','Prompt',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10139,'zh_CN','描述维护','描述维护',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10140,'en_GB','Role','Role',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10140,'zh_CN','角色管理','角色管理',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10141,'en_GB','Delete Role','Delete Role',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10141,'zh_CN','角色删除','角色删除',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10142,'en_GB','Query Role','Query Role',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10142,'zh_CN','角色查询','角色查询',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10143,'en_GB','Update Role','Update Role',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10143,'zh_CN','角色更新','角色更新',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10144,'en_GB','User','User',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10144,'zh_CN','用户管理','用户管理',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10145,'en_GB','Role Assign','Role Assign',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10145,'zh_CN','角色分配','角色分配',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10146,'en_GB','Select Role','Role Select',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10146,'zh_CN','选择角色','选择角色',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10147,'en_GB','Query User','Query User',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10147,'zh_CN','用户查询','用户查询',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10148,'en_GB','Delete User','Delete User',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10148,'zh_CN','删除用户','删除用户',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10149,'en_GB','Update User','Update User',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10149,'zh_CN','更新用户','更新用户',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10150,'en_GB','Query User Role','Query User Role',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10150,'zh_CN','查询用户角色','查询用户角色',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10151,'en_GB','Update User Role','Update User Role',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10151,'zh_CN','保存用户角色','保存用户角色',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10152,'en_GB','Single User Info','Single User Info',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10152,'zh_CN','单条用户信息','单条用户信息',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10153,'en_GB','User email Check','User Email Check',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10153,'zh_CN','用户邮件检查','用户邮件检查',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10154,'en_GB','User Phone Check','User Phone Check',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10154,'zh_CN','电话号码检查','电话号码检查',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10155,'en_GB','User Exists check','User Exists check',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10155,'zh_CN','用户是否存在','用户是否存在',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10156,'en_GB','Query User Info','Query User Info',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10156,'zh_CN','用户信息查询','用户信息查询',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10157,'en_GB','Login Success','Login Success',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10157,'zh_CN','登录成功','登录成功',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10158,'en_GB','Update Password','Update Password',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10158,'zh_CN','更改密码','更改密码',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10159,'en_GB','User Info','User Info',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10159,'zh_CN','用户信息','用户信息',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10160,'en_GB','Update Password','Update Password',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10160,'zh_CN','更改密码','更改密码',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10161,'en_GB','Update User Info','Update User Info',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10161,'zh_CN','更新个人信息','更新个人信息',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10162,'en_GB','Icon Select','Icon Select',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10162,'zh_CN','图标选择','图标选择',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10163,'en_GB','Timeout','Timeout',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10163,'zh_CN','超时','超时',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10164,'en_GB','Captcha Service','Captcha Service',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10164,'zh_CN','验证码服务','验证码服务',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10165,'en_GB','company','company',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10165,'zh_CN','公司维护','公司信息维护',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10166,'en_GB','company info update','company info update',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10166,'zh_CN','公司信息修改','公司信息修改',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10167,'en_GB','company info query','company info query',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10167,'zh_CN','公司信息查询','公司信息查询',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10168,'en_GB','company info delete','company info delete',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10168,'zh_CN','公司信息删除','公司信息删除',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10169,'en_GB','company edit page','company edit page',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10169,'zh_CN','公司编辑界面','公司编辑界面',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10170,'en_GB','Dashboard Config Page','Dashboard Config Page',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10170,'zh_CN','仪表盘配置界面','仪表盘配置',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10171,'en_GB','Query dashboard info','Query dashboard info',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10171,'zh_CN','查询仪表盘','查询仪表盘',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10172,'en_GB','Update dashboard info','Update dashboard info',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10172,'zh_CN','更新仪表盘','更新仪表盘',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10173,'en_GB','Delete dashboard info','Delete dashboard info',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10173,'zh_CN','删除仪表盘','删除仪表盘',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10174,'en_GB','User Task','User Task',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10174,'zh_CN','代办事项','代办事项',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10175,'en_GB','system JVM metrics','system JVM metrics',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10175,'zh_CN','系统JVM指标','系统JVM指标',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10176,'en_GB','mail status search','mail status search',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10176,'zh_CN','邮件状态查询','邮件状态查询',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10177,'en_GB','Interface invoke records','Interface invoke records',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10177,'zh_CN','接口调用记录','接口调用记录',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10178,'en_GB','The interface definition interface','The interface definition interface',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10178,'zh_CN','接口定义界面','接口定义界面',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10179,'en_GB','Interface system information','Interface system information',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10179,'zh_CN','接口系统信息','接口系统信息',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10180,'en_GB','Interface to modify the page','Interface to modify the page',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10180,'zh_CN','接口修改页面','接口修改页面',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10181,'en_GB','System index page for details','System index page for details',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10181,'zh_CN','系统指标详情页','系统指标详情页',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10182,'en_GB','Email Status','Email Status',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10182,'zh_CN','邮件状态查询','邮件状态查询',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10183,'en_GB','Email Error','Email Error',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10183,'zh_CN','邮件错误信息查询','邮件错误信息查询',1,-1,-1,-1,'2017-01-07 11:50:07',-1,'2017-01-07 11:50:07',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10188,'en_GB','demo/insert',NULL,1,-1,-1,10001,'2017-01-10 14:06:38',10001,'2017-01-10 14:06:38',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10188,'zh_CN','demo/insert',NULL,1,-1,-1,10001,'2017-01-10 14:06:38',10001,'2017-01-10 14:06:38',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10189,'en_GB','demo/delete',NULL,1,-1,-1,10001,'2017-01-10 14:07:27',10001,'2017-01-10 14:07:27',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10189,'zh_CN','demo/delete',NULL,1,-1,-1,10001,'2017-01-10 14:07:27',10001,'2017-01-10 14:07:27',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10190,'en_GB','demo/update',NULL,1,-1,-1,10001,'2017-01-10 14:07:27',10001,'2017-01-10 14:07:27',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10190,'zh_CN','demo/update',NULL,1,-1,-1,10001,'2017-01-10 14:07:27',10001,'2017-01-10 14:07:27',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10191,'en_GB','demo/select',NULL,1,-1,-1,10001,'2017-01-10 14:07:27',10001,'2017-01-10 14:07:27',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10191,'zh_CN','demo/select',NULL,1,-1,-1,10001,'2017-01-10 14:07:27',10001,'2017-01-10 14:07:27',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10192,'en_GB','销售订单管理主页','销售订单管理主页',1,-1,-1,10001,'2017-01-10 20:23:57',10001,'2017-01-10 20:23:57',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10192,'zh_CN','销售订单管理主页','销售订单管理主页',1,-1,-1,10001,'2017-01-10 20:23:57',10001,'2017-01-14 17:49:19',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10193,'en_GB','订单明细界面',NULL,1,-1,-1,10001,'2017-01-13 09:37:49',10001,'2017-01-13 09:37:49',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10193,'zh_CN','订单明细界面','订单明细界面',1,-1,-1,10001,'2017-01-13 09:37:49',10001,'2017-01-14 18:19:35',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10194,'en_GB','公司查询','基于COMPANY_ID进行关联查询',1,-1,-1,10001,'2017-01-14 17:52:05',10001,'2017-01-14 17:52:05',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10194,'zh_CN','公司查询','基于COMPANY_ID进行关联查询',1,-1,-1,10001,'2017-01-14 17:52:05',10001,'2017-01-14 17:52:05',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10195,'en_GB','订单插入','订单插入',1,-1,-1,10001,'2017-01-14 17:52:47',10001,'2017-01-14 17:52:47',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10195,'zh_CN','订单头插入','订单头插入',1,-1,-1,10001,'2017-01-14 17:52:47',10001,'2017-01-14 17:53:25',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10196,'en_GB','订单汇总查询','订单汇总查询',1,-1,-1,10001,'2017-01-14 17:53:25',10001,'2017-01-14 17:53:25',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10196,'zh_CN','订单汇总查询','订单汇总查询',1,-1,-1,10001,'2017-01-14 17:53:25',10001,'2017-01-14 17:53:25',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_resource_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_b`
--

DROP TABLE IF EXISTS `sys_role_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_b` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_CODE` varchar(40) NOT NULL COMMENT '角色编码',
  `ROLE_NAME` varchar(150) NOT NULL COMMENT '角色名称',
  `ROLE_DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '角色描述',
  `START_ACTIVE_DATE` date DEFAULT NULL COMMENT '开始生效日期',
  `END_ACTIVE_DATE` date DEFAULT NULL COMMENT '截至生效日期',
  `ENABLE_FLAG` varchar(1) DEFAULT 'Y' COMMENT '启用标记',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `SYS_ROLE_B_U1` (`ROLE_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_b`
--

LOCK TABLES `sys_role_b` WRITE;
/*!40000 ALTER TABLE `sys_role_b` DISABLE KEYS */;
INSERT INTO `sys_role_b` VALUES (10001,'ADMIN','管理员','系统管理员','2016-06-15',NULL,'Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'EMPLOYEE','员工','员工',NULL,'2020-12-31','Y',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'SALESMAN','销售员','销售员','2017-01-10',NULL,'Y',2,-1,-1,10001,'2017-01-10 18:06:18',10001,'2017-01-14 17:41:50',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'SALESMANAGER','销售经理','销售经理','2017-01-10',NULL,'Y',2,-1,-1,10001,'2017-01-10 18:07:31',10001,'2017-01-14 17:41:50',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_role_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_function`
--

DROP TABLE IF EXISTS `sys_role_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_function` (
  `SRF_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '功能ID',
  `FUNCTION_ID` bigint(20) DEFAULT NULL COMMENT '功能ID',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`SRF_ID`),
  UNIQUE KEY `SYS_ROLE_FUNCTION_U1` (`ROLE_ID`,`FUNCTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10709 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_function`
--

LOCK TABLES `sys_role_function` WRITE;
/*!40000 ALTER TABLE `sys_role_function` DISABLE KEYS */;
INSERT INTO `sys_role_function` VALUES (10038,10002,10003,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10039,10002,10022,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10040,10002,10023,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10041,10002,10024,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10042,10002,10025,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10043,10002,10015,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10044,10002,10016,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10045,10002,10017,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10046,10002,10004,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10047,10002,10006,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10048,10002,10002,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10049,10002,10027,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10050,10002,10029,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10051,10002,10031,1,-1,-1,-1,'2017-01-07 11:50:08',-1,'2017-01-07 11:50:08',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10572,10004,10044,1,-1,-1,10001,'2017-01-14 18:14:53',10001,'2017-01-14 18:14:53',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10576,10003,10044,1,-1,-1,10001,'2017-01-14 18:19:06',10001,'2017-01-14 18:19:06',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10665,10001,10033,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10666,10001,10034,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10667,10001,10036,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10668,10001,10035,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10669,10001,10037,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10670,10001,10044,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10671,10001,10018,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10672,10001,10021,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10673,10001,10019,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10674,10001,10020,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10675,10001,10015,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10676,10001,10016,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10677,10001,10017,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10678,10001,10026,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10679,10001,10031,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10680,10001,10027,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10681,10001,10028,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10682,10001,10029,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10683,10001,10030,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10684,10001,10032,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10685,10001,10040,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10686,10001,10041,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10687,10001,10042,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10688,10001,10001,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10689,10001,10007,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10690,10001,10008,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10691,10001,10009,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10692,10001,10010,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10693,10001,10043,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10694,10001,10011,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10695,10001,10012,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10696,10001,10013,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10697,10001,10014,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10698,10001,10038,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10699,10001,10002,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10700,10001,10003,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10701,10001,10004,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10702,10001,10005,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10703,10001,10006,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10704,10001,10022,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10705,10001,10023,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10706,10001,10024,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10707,10001,10025,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10708,10001,10039,1,-1,-1,10001,'2017-01-15 13:02:05',10001,'2017-01-15 13:02:05',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_role_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_resource_item`
--

DROP TABLE IF EXISTS `sys_role_resource_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_resource_item` (
  `RSI_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `RESOURCE_ITEM_ID` bigint(20) DEFAULT NULL COMMENT '功能控件ID',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RSI_ID`),
  UNIQUE KEY `SYS_ROLE_RESOURCE_ITEM_U1` (`ROLE_ID`,`RESOURCE_ITEM_ID`),
  KEY `SYS_ROLE_RESOURCE_ITEM_N1` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_resource_item`
--

LOCK TABLES `sys_role_resource_item` WRITE;
/*!40000 ALTER TABLE `sys_role_resource_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_resource_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_tl`
--

DROP TABLE IF EXISTS `sys_role_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_tl` (
  `ROLE_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `ROLE_NAME` varchar(150) DEFAULT NULL COMMENT '角色名称',
  `ROLE_DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '角色描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_tl`
--

LOCK TABLES `sys_role_tl` WRITE;
/*!40000 ALTER TABLE `sys_role_tl` DISABLE KEYS */;
INSERT INTO `sys_role_tl` VALUES (10001,'en_GB','ADMIN','Administrator',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10001,'zh_CN','管理员','系统管理员',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'en_GB','Employee','Employee',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,'zh_CN','员工','员工',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'en_GB','Sales Man','销售员',1,-1,-1,10001,'2017-01-10 18:06:18',10001,'2017-01-14 17:41:50',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,'zh_CN','销售员','销售员',1,-1,-1,10001,'2017-01-10 18:06:18',10001,'2017-01-14 17:41:50',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'en_GB','Sales Manager','销售经理',1,-1,-1,10001,'2017-01-10 18:07:31',10001,'2017-01-14 17:41:50',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,'zh_CN','销售经理','销售经理',1,-1,-1,10001,'2017-01-10 18:07:31',10001,'2017-01-14 17:41:50',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_role_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_TYPE` varchar(30) DEFAULT NULL COMMENT '用户类型',
  `USER_NAME` varchar(40) NOT NULL COMMENT '用户名',
  `PASSWORD_ENCRYPTED` varchar(80) DEFAULT NULL COMMENT '加密过的密码',
  `EMAIL` varchar(150) DEFAULT NULL COMMENT '邮箱地址',
  `PHONE` varchar(40) DEFAULT NULL COMMENT '电话号码',
  `START_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '有效期从',
  `END_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '有效期至',
  `STATUS` varchar(30) DEFAULT NULL COMMENT '状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  `LAST_LOGIN_DATE` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `LAST_PASSWORD_UPDATE_DATE` datetime DEFAULT NULL COMMENT '最后一次修改密码时间',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `SYS_USER_U1` (`USER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (10001,NULL,'ADMIN','59baed859597b69548f28654af4125736915ea870252f8db664e3187dcfc298ead2b761e2acb576a','hap_dev@126.com','13763784776','2016-01-01 00:00:00',NULL,'ACTV',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,NULL,'JESSEN','6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2','shengyang.zhou@hand-china.com','13764784776',NULL,NULL,'ACTV',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,NULL,'HAILEN','6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2','hailen.hap@126.com','186',NULL,NULL,'ACTV',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,NULL,'ERIC','6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2','eric.hap@126.com','1893',NULL,NULL,'ACTV',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,NULL,'TONY','6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2','tony.hap@126.com','1891',NULL,NULL,'ACTV',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,NULL,'RODGERS','6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2','Rodgers.hap@126.com','1892',NULL,NULL,'ACTV',1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,NULL,'SALESMAN','836dd011029eddd0afb2ffad0f0ea94e82caf02cc7262154703b9fbe8408571219ac302aa489583f','124@qq.com','110','2017-01-14 00:00:00',NULL,'ACTV',1,-1,-1,10001,'2017-01-14 17:42:54',10001,'2017-01-14 17:42:54',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-01-14 17:46:32'),(10008,NULL,'MANAGER','7546d487b3cf1e13705634cb932f25cba270c203ede1056aa0d4ab6c9cc0c65c1e1cc0ca67691bf2','1111@qq.com','1110','2017-01-14 00:00:00',NULL,'ACTV',1,-1,-1,10001,'2017-01-14 17:44:00',10001,'2017-01-14 17:44:00',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-01-14 17:46:24');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_dashboard`
--

DROP TABLE IF EXISTS `sys_user_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_dashboard` (
  `USER_DASHBOARD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `DASHBOARD_ID` bigint(20) NOT NULL COMMENT '仪表盘ID',
  `DASHBOARD_SEQUENCE` decimal(20,0) DEFAULT '1' COMMENT '仪表盘排序号',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`USER_DASHBOARD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_dashboard`
--

LOCK TABLES `sys_user_dashboard` WRITE;
/*!40000 ALTER TABLE `sys_user_dashboard` DISABLE KEYS */;
INSERT INTO `sys_user_dashboard` VALUES (10001,10001,10001,1,1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10002,10001,10002,2,1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1),(10003,10001,10003,3,1,-1,-1,-1,'2017-01-07 11:50:10',-1,'2017-01-07 11:50:10',-1);
/*!40000 ALTER TABLE `sys_user_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_demo_b`
--

DROP TABLE IF EXISTS `sys_user_demo_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_demo_b` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_CODE` varchar(255) NOT NULL COMMENT '编码',
  `USER_NAME` varchar(255) NOT NULL COMMENT '姓名',
  `USER_AGE` bigint(20) DEFAULT NULL COMMENT '年龄',
  `USER_SEX` varchar(50) DEFAULT NULL COMMENT '性别',
  `USER_BIRTH` date DEFAULT NULL COMMENT '生日',
  `USER_EMAIL` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `USER_PHONE` bigint(20) DEFAULT NULL COMMENT '电话',
  `ENABLE_FLAG` varchar(1) DEFAULT NULL COMMENT '是否启用',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `ROLE_NAME` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `START_ACTIVE_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_ACTIVE_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `SYS_USER_DEMO_B_U1` (`USER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_demo_b`
--

LOCK TABLES `sys_user_demo_b` WRITE;
/*!40000 ALTER TABLE `sys_user_demo_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_demo_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_demo_tl`
--

DROP TABLE IF EXISTS `sys_user_demo_tl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_demo_tl` (
  `USER_ID` bigint(20) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL COMMENT '姓名',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`USER_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_demo_tl`
--

LOCK TABLES `sys_user_demo_tl` WRITE;
/*!40000 ALTER TABLE `sys_user_demo_tl` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_demo_tl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_login`
--

DROP TABLE IF EXISTS `sys_user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_login` (
  `login_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(40) DEFAULT NULL COMMENT 'ip地址',
  `referer` varchar(240) DEFAULT NULL,
  `user_agent` varchar(240) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10049 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_login`
--

LOCK TABLES `sys_user_login` WRITE;
/*!40000 ALTER TABLE `sys_user_login` DISABLE KEYS */;
INSERT INTO `sys_user_login` VALUES (10001,10001,'2017-01-07 14:40:06','192.168.86.1','http://localhost:8080/core/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-07 14:40:06',-1,'2017-01-07 14:40:06',-1),(10002,10001,'2017-01-08 15:23:20','192.168.86.1','http://localhost:8080/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-08 15:23:20',-1,'2017-01-08 15:23:20',-1),(10003,10001,'2017-01-09 19:18:47','192.168.86.1','http://localhost:8080/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-09 19:18:46',-1,'2017-01-09 19:18:46',-1),(10004,10001,'2017-01-10 11:10:13','192.168.86.1','http://localhost:8080/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:10:12',-1,'2017-01-10 11:10:12',-1),(10005,10001,'2017-01-10 11:58:00','192.168.86.1','http://localhost:8080/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:57:59',-1,'2017-01-10 11:57:59',-1),(10006,10001,'2017-01-10 11:59:58','192.168.86.1','http://localhost:8080/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 11:59:57',-1,'2017-01-10 11:59:57',-1),(10007,10001,'2017-01-10 12:03:15','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 12:03:14',-1,'2017-01-10 12:03:14',-1),(10008,10001,'2017-01-10 14:01:38','192.168.86.1','http://localhost:8080/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 14:01:38',-1,'2017-01-10 14:01:38',-1),(10009,10001,'2017-01-10 14:18:08','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 14:18:07',-1,'2017-01-10 14:18:07',-1),(10010,10001,'2017-01-10 18:54:42','192.168.86.1','http://localhost:8080/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 18:54:41',-1,'2017-01-10 18:54:41',-1),(10011,10001,'2017-01-10 19:00:56','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 19:00:56',-1,'2017-01-10 19:00:56',-1),(10012,10001,'2017-01-10 19:05:33','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 19:05:33',-1,'2017-01-10 19:05:33',-1),(10013,10001,'2017-01-10 19:12:31','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 19:12:31',-1,'2017-01-10 19:12:31',-1),(10014,10001,'2017-01-10 19:53:50','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 19:53:50',-1,'2017-01-10 19:53:50',-1),(10015,10001,'2017-01-10 20:11:02','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 20:11:02',-1,'2017-01-10 20:11:02',-1),(10016,10001,'2017-01-10 20:18:43','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 20:18:42',-1,'2017-01-10 20:18:42',-1),(10017,10001,'2017-01-10 20:30:03','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-10 20:30:02',-1,'2017-01-10 20:30:02',-1),(10018,10001,'2017-01-11 09:47:01','192.168.86.1','http://localhost:8080/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-11 09:47:00',-1,'2017-01-11 09:47:00',-1),(10019,10001,'2017-01-11 13:57:44','192.168.86.1','http://localhost:8080/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-11 13:57:44',-1,'2017-01-11 13:57:44',-1),(10020,10001,'2017-01-11 14:59:08','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-11 14:59:08',-1,'2017-01-11 14:59:08',-1),(10021,10001,'2017-01-11 20:46:23','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-11 20:46:22',-1,'2017-01-11 20:46:22',-1),(10022,10001,'2017-01-11 20:47:09','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-11 20:47:09',-1,'2017-01-11 20:47:09',-1),(10023,10001,'2017-01-12 15:53:10','192.168.86.1','http://localhost:8080/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-12 15:53:10',-1,'2017-01-12 15:53:10',-1),(10024,10001,'2017-01-13 09:31:41','192.168.86.1','http://localhost:8080/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-13 09:31:40',-1,'2017-01-13 09:31:40',-1),(10025,10001,'2017-01-13 09:39:13','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-13 09:39:12',-1,'2017-01-13 09:39:12',-1),(10026,10001,'2017-01-13 15:21:45','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-13 15:21:44',-1,'2017-01-13 15:21:44',-1),(10027,10001,'2017-01-13 15:34:46','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-13 15:34:46',-1,'2017-01-13 15:34:46',-1),(10028,10001,'2017-01-13 15:47:08','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-13 15:47:08',-1,'2017-01-13 15:47:08',-1),(10029,10001,'2017-01-13 17:30:40','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-13 17:30:39',-1,'2017-01-13 17:30:39',-1),(10030,10001,'2017-01-14 10:29:09','192.168.86.1','http://localhost:8080/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 10:29:08',-1,'2017-01-14 10:29:08',-1),(10031,10007,'2017-01-14 18:05:24','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:05:23',-1,'2017-01-14 18:05:23',-1),(10032,10001,'2017-01-14 18:05:45','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:05:45',-1,'2017-01-14 18:05:45',-1),(10033,10007,'2017-01-14 18:07:58','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:07:57',-1,'2017-01-14 18:07:57',-1),(10034,10001,'2017-01-14 18:08:16','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:08:15',-1,'2017-01-14 18:08:15',-1),(10035,10007,'2017-01-14 18:10:11','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:10:11',-1,'2017-01-14 18:10:11',-1),(10036,10001,'2017-01-14 18:10:34','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:10:33',-1,'2017-01-14 18:10:33',-1),(10037,10007,'2017-01-14 18:11:38','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:11:37',-1,'2017-01-14 18:11:37',-1),(10038,10001,'2017-01-14 18:12:22','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:12:22',-1,'2017-01-14 18:12:22',-1),(10039,10007,'2017-01-14 18:15:05','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:15:05',-1,'2017-01-14 18:15:05',-1),(10040,10001,'2017-01-14 18:15:36','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:15:35',-1,'2017-01-14 18:15:35',-1),(10041,10007,'2017-01-14 18:20:07','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:20:06',-1,'2017-01-14 18:20:06',-1),(10042,10008,'2017-01-14 18:24:32','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:24:31',-1,'2017-01-14 18:24:31',-1),(10043,10001,'2017-01-14 18:27:19','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-14 18:27:18',-1,'2017-01-14 18:27:18',-1),(10044,10007,'2017-01-15 11:49:46','192.168.86.1','http://localhost:8080/login','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-15 11:49:46',-1,'2017-01-15 11:49:46',-1),(10045,10001,'2017-01-15 12:53:09','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-15 12:53:09',-1,'2017-01-15 12:53:09',-1),(10046,10001,'2017-01-15 13:02:18','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-15 13:02:17',-1,'2017-01-15 13:02:17',-1),(10047,10001,'2017-01-15 13:48:44','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-15 13:48:43',-1,'2017-01-15 13:48:43',-1),(10048,10001,'2017-01-15 15:23:26','192.168.86.1','http://localhost:8080/login?logout','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',1,-1,-1,-1,'2017-01-15 15:23:26',-1,'2017-01-15 15:23:26',-1);
/*!40000 ALTER TABLE `sys_user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `SUR_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`SUR_ID`),
  UNIQUE KEY `SYS_USER_ROLE_U1` (`ROLE_ID`,`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10014 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (10001,10001,10001,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10002,10001,10002,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10003,10002,10002,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10004,10003,10002,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10005,10004,10002,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10006,10005,10002,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10007,10006,10002,1,-1,-1,-1,'2017-01-07 11:50:06',-1,'2017-01-07 11:50:06',-1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10010,10007,10003,1,-1,-1,10001,'2017-01-14 17:43:06',10001,'2017-01-14 17:43:06',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10011,10008,10004,1,-1,-1,10001,'2017-01-14 17:44:11',10001,'2017-01-14 17:44:11',10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-15 18:37:23
