CREATE DATABASE  IF NOT EXISTS `sakai` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sakai`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sakai
-- ------------------------------------------------------
-- Server version	5.5.62-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcement_channel`
--

DROP TABLE IF EXISTS `announcement_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `announcement_channel` (
  `CHANNEL_ID` varchar(255) NOT NULL,
  `NEXT_ID` int(11) DEFAULT NULL,
  `XML` longtext,
  UNIQUE KEY `ANNOUNCEMENT_CHANNEL_INDEX` (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_channel`
--

LOCK TABLES `announcement_channel` WRITE;
/*!40000 ALTER TABLE `announcement_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_message`
--

DROP TABLE IF EXISTS `announcement_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `announcement_message` (
  `CHANNEL_ID` varchar(255) NOT NULL,
  `MESSAGE_ID` varchar(36) NOT NULL,
  `DRAFT` char(1) DEFAULT NULL,
  `PUBVIEW` char(1) DEFAULT NULL,
  `OWNER` varchar(99) DEFAULT NULL,
  `MESSAGE_DATE` datetime NOT NULL,
  `XML` longtext,
  `MESSAGE_ORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`CHANNEL_ID`,`MESSAGE_ID`),
  KEY `IE_ANNC_MSG_CHANNEL` (`CHANNEL_ID`),
  KEY `IE_ANNC_MSG_ATTRIB` (`DRAFT`,`PUBVIEW`,`OWNER`,`MESSAGE_ORDER`),
  KEY `IE_ANNC_MSG_DATE` (`MESSAGE_DATE`),
  KEY `ANNOUNCEMENT_MESSAGE_CDD` (`CHANNEL_ID`,`MESSAGE_DATE`,`MESSAGE_ORDER`,`DRAFT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_message`
--

LOCK TABLES `announcement_message` WRITE;
/*!40000 ALTER TABLE `announcement_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_ap_item_access_t`
--

DROP TABLE IF EXISTS `asn_ap_item_access_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_ap_item_access_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEM_ACCESS` varchar(255) NOT NULL,
  `ASN_AP_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniqueAccessItem` (`ITEM_ACCESS`,`ASN_AP_ITEM_ID`),
  KEY `ASN_AP_ITEM_I` (`ASN_AP_ITEM_ID`),
  CONSTRAINT `FK_gmc6a94c4joonmrmpudresk1j` FOREIGN KEY (`ASN_AP_ITEM_ID`) REFERENCES `asn_ap_item_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_ap_item_access_t`
--

LOCK TABLES `asn_ap_item_access_t` WRITE;
/*!40000 ALTER TABLE `asn_ap_item_access_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_ap_item_access_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_ap_item_t`
--

DROP TABLE IF EXISTS `asn_ap_item_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_ap_item_t` (
  `ASSIGNMENT_ID` varchar(255) NOT NULL,
  `HIDE` bit(1) NOT NULL,
  `RELEASE_DATE` datetime DEFAULT NULL,
  `RETRACT_DATE` datetime DEFAULT NULL,
  `TEXT` longtext,
  `TITLE` varchar(255) DEFAULT NULL,
  `ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_m0je4rvw8arp24uywiw64ix95` FOREIGN KEY (`ID`) REFERENCES `asn_sup_item_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_ap_item_t`
--

LOCK TABLES `asn_ap_item_t` WRITE;
/*!40000 ALTER TABLE `asn_ap_item_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_ap_item_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_assignment`
--

DROP TABLE IF EXISTS `asn_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_assignment` (
  `ASSIGNMENT_ID` varchar(36) NOT NULL,
  `ALLOW_ATTACHMENTS` bit(1) DEFAULT NULL,
  `ALLOW_PEER_ASSESSMENT` bit(1) DEFAULT NULL,
  `AUTHOR` varchar(99) DEFAULT NULL,
  `CLOSE_DATE` datetime DEFAULT NULL,
  `CONTENT_REVIEW` bit(1) DEFAULT NULL,
  `CONTEXT` varchar(99) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `DELETED` bit(1) DEFAULT NULL,
  `DRAFT` bit(1) NOT NULL,
  `DROP_DEAD_DATE` datetime DEFAULT NULL,
  `DUE_DATE` datetime DEFAULT NULL,
  `HIDE_DUE_DATE` bit(1) DEFAULT NULL,
  `HONOR_PLEDGE` bit(1) DEFAULT NULL,
  `INDIVIDUALLY_GRADED` bit(1) DEFAULT NULL,
  `INSTRUCTIONS` longtext,
  `IS_GROUP` bit(1) DEFAULT NULL,
  `MAX_GRADE_POINT` int(11) DEFAULT NULL,
  `MODIFIER` varchar(99) DEFAULT NULL,
  `OPEN_DATE` datetime DEFAULT NULL,
  `PEER_ASSESSMENT_ANON_EVAL` bit(1) DEFAULT NULL,
  `PEER_ASSESSMENT_INSTRUCTIONS` longtext,
  `PEER_ASSESSMENT_NUMBER_REVIEW` int(11) DEFAULT NULL,
  `PEER_ASSESSMENT_PERIOD_DATE` datetime DEFAULT NULL,
  `PEER_ASSESSMENT_STUDENT_REVIEW` bit(1) DEFAULT NULL,
  `POSITION` int(11) DEFAULT NULL,
  `RELEASE_GRADES` bit(1) DEFAULT NULL,
  `SCALE_FACTOR` int(11) DEFAULT NULL,
  `SECTION` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `ACCESS_TYPE` varchar(255) NOT NULL,
  `GRADE_TYPE` int(11) DEFAULT NULL,
  `SUBMISSION_TYPE` int(11) DEFAULT NULL,
  `VISIBLE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ASSIGNMENT_ID`),
  KEY `IDX_ASN_ASSIGNMENT_CONTEXT` (`CONTEXT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_assignment`
--

LOCK TABLES `asn_assignment` WRITE;
/*!40000 ALTER TABLE `asn_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_assignment_attachments`
--

DROP TABLE IF EXISTS `asn_assignment_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_assignment_attachments` (
  `ASSIGNMENT_ID` varchar(36) NOT NULL,
  `ATTACHMENT` varchar(1024) DEFAULT NULL,
  KEY `FK_hyk73ocki8gwvm3ajf8ls08ac` (`ASSIGNMENT_ID`),
  CONSTRAINT `FK_hyk73ocki8gwvm3ajf8ls08ac` FOREIGN KEY (`ASSIGNMENT_ID`) REFERENCES `asn_assignment` (`ASSIGNMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_assignment_attachments`
--

LOCK TABLES `asn_assignment_attachments` WRITE;
/*!40000 ALTER TABLE `asn_assignment_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_assignment_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_assignment_groups`
--

DROP TABLE IF EXISTS `asn_assignment_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_assignment_groups` (
  `ASSIGNMENT_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(255) DEFAULT NULL,
  KEY `FK_8ewbxsplke3c487h0tjujvtm` (`ASSIGNMENT_ID`),
  CONSTRAINT `FK_8ewbxsplke3c487h0tjujvtm` FOREIGN KEY (`ASSIGNMENT_ID`) REFERENCES `asn_assignment` (`ASSIGNMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_assignment_groups`
--

LOCK TABLES `asn_assignment_groups` WRITE;
/*!40000 ALTER TABLE `asn_assignment_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_assignment_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_assignment_properties`
--

DROP TABLE IF EXISTS `asn_assignment_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_assignment_properties` (
  `ASSIGNMENT_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ASSIGNMENT_ID`,`NAME`),
  CONSTRAINT `FK_gdat1b6uqiui9mxdktd6m5ig1` FOREIGN KEY (`ASSIGNMENT_ID`) REFERENCES `asn_assignment` (`ASSIGNMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_assignment_properties`
--

LOCK TABLES `asn_assignment_properties` WRITE;
/*!40000 ALTER TABLE `asn_assignment_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_assignment_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_ma_item_t`
--

DROP TABLE IF EXISTS `asn_ma_item_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_ma_item_t` (
  `ASSIGNMENT_ID` varchar(255) NOT NULL,
  `SHOW_TO` int(11) DEFAULT NULL,
  `TEXT` longtext,
  `ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_7595d9ul4p5603ylobqeufh3x` FOREIGN KEY (`ID`) REFERENCES `asn_sup_item_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_ma_item_t`
--

LOCK TABLES `asn_ma_item_t` WRITE;
/*!40000 ALTER TABLE `asn_ma_item_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_ma_item_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_note_item_t`
--

DROP TABLE IF EXISTS `asn_note_item_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_note_item_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ASSIGNMENT_ID` varchar(255) NOT NULL,
  `CREATOR_ID` varchar(255) DEFAULT NULL,
  `NOTE` longtext,
  `SHARE_WITH` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_note_item_t`
--

LOCK TABLES `asn_note_item_t` WRITE;
/*!40000 ALTER TABLE `asn_note_item_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_note_item_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_peer_assessment_attach_t`
--

DROP TABLE IF EXISTS `asn_peer_assessment_attach_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_peer_assessment_attach_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ASSESSOR_USER_ID` varchar(255) NOT NULL,
  `RESOURCE_ID` varchar(255) NOT NULL,
  `SUBMISSION_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PEER_ASSESSOR_I` (`SUBMISSION_ID`,`ASSESSOR_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_peer_assessment_attach_t`
--

LOCK TABLES `asn_peer_assessment_attach_t` WRITE;
/*!40000 ALTER TABLE `asn_peer_assessment_attach_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_peer_assessment_attach_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_peer_assessment_item_t`
--

DROP TABLE IF EXISTS `asn_peer_assessment_item_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_peer_assessment_item_t` (
  `ASSESSOR_USER_ID` varchar(255) NOT NULL,
  `SUBMISSION_ID` varchar(255) NOT NULL,
  `ASSIGNMENT_ID` varchar(255) NOT NULL,
  `REVIEW_COMMENT` longtext,
  `REMOVED` bit(1) NOT NULL,
  `SCORE` int(11) DEFAULT NULL,
  `SUBMITTED` bit(1) NOT NULL,
  PRIMARY KEY (`ASSESSOR_USER_ID`,`SUBMISSION_ID`),
  KEY `PEER_ASSESSOR2_I` (`ASSIGNMENT_ID`,`ASSESSOR_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_peer_assessment_item_t`
--

LOCK TABLES `asn_peer_assessment_item_t` WRITE;
/*!40000 ALTER TABLE `asn_peer_assessment_item_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_peer_assessment_item_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_submission`
--

DROP TABLE IF EXISTS `asn_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_submission` (
  `SUBMISSION_ID` varchar(36) NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `RETURNED_DATE` datetime DEFAULT NULL,
  `SUBMITTED_DATE` datetime DEFAULT NULL,
  `FACTOR` int(11) DEFAULT NULL,
  `FEEDBACK_COMMENT` longtext,
  `FEEDBACK_TEXT` longtext,
  `GRADE` varchar(32) DEFAULT NULL,
  `GRADE_RELEASED` bit(1) DEFAULT NULL,
  `GRADED` bit(1) DEFAULT NULL,
  `GRADED_BY` varchar(99) DEFAULT NULL,
  `GROUP_ID` varchar(36) DEFAULT NULL,
  `HIDDEN_DUE_DATE` bit(1) DEFAULT NULL,
  `HONOR_PLEDGE` bit(1) DEFAULT NULL,
  `RETURNED` bit(1) DEFAULT NULL,
  `SUBMITTED` bit(1) DEFAULT NULL,
  `TEXT` longtext,
  `USER_SUBMISSION` bit(1) DEFAULT NULL,
  `ASSIGNMENT_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`SUBMISSION_ID`),
  KEY `FK_6a25a0bxifpyeij72pdk7xrlr` (`ASSIGNMENT_ID`),
  CONSTRAINT `FK_6a25a0bxifpyeij72pdk7xrlr` FOREIGN KEY (`ASSIGNMENT_ID`) REFERENCES `asn_assignment` (`ASSIGNMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_submission`
--

LOCK TABLES `asn_submission` WRITE;
/*!40000 ALTER TABLE `asn_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_submission_attachments`
--

DROP TABLE IF EXISTS `asn_submission_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_submission_attachments` (
  `SUBMISSION_ID` varchar(36) NOT NULL,
  `ATTACHMENT` varchar(1024) DEFAULT NULL,
  KEY `FK_jg017qxc4pv3mdf07c1xpytb8` (`SUBMISSION_ID`),
  CONSTRAINT `FK_jg017qxc4pv3mdf07c1xpytb8` FOREIGN KEY (`SUBMISSION_ID`) REFERENCES `asn_submission` (`SUBMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_submission_attachments`
--

LOCK TABLES `asn_submission_attachments` WRITE;
/*!40000 ALTER TABLE `asn_submission_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_submission_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_submission_feedback_attach`
--

DROP TABLE IF EXISTS `asn_submission_feedback_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_submission_feedback_attach` (
  `SUBMISSION_ID` varchar(36) NOT NULL,
  `FEEDBACK_ATTACHMENT` varchar(1024) DEFAULT NULL,
  KEY `FK_3dou5gsqcya4rwwy99l91fofb` (`SUBMISSION_ID`),
  CONSTRAINT `FK_3dou5gsqcya4rwwy99l91fofb` FOREIGN KEY (`SUBMISSION_ID`) REFERENCES `asn_submission` (`SUBMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_submission_feedback_attach`
--

LOCK TABLES `asn_submission_feedback_attach` WRITE;
/*!40000 ALTER TABLE `asn_submission_feedback_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_submission_feedback_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_submission_properties`
--

DROP TABLE IF EXISTS `asn_submission_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_submission_properties` (
  `SUBMISSION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SUBMISSION_ID`,`NAME`),
  CONSTRAINT `FK_2k0jat40wap5ekwkpsn201eau` FOREIGN KEY (`SUBMISSION_ID`) REFERENCES `asn_submission` (`SUBMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_submission_properties`
--

LOCK TABLES `asn_submission_properties` WRITE;
/*!40000 ALTER TABLE `asn_submission_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_submission_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_submission_submitter`
--

DROP TABLE IF EXISTS `asn_submission_submitter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_submission_submitter` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FEEDBACK` longtext,
  `GRADE` varchar(32) DEFAULT NULL,
  `SUBMITTEE` bit(1) NOT NULL,
  `SUBMITTER` varchar(99) NOT NULL,
  `SUBMISSION_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_fhl15ynesbctbus4859j78d8f` (`SUBMISSION_ID`,`SUBMITTER`),
  CONSTRAINT `FK_tkkcy78p5g4xrykriuimojwv5` FOREIGN KEY (`SUBMISSION_ID`) REFERENCES `asn_submission` (`SUBMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_submission_submitter`
--

LOCK TABLES `asn_submission_submitter` WRITE;
/*!40000 ALTER TABLE `asn_submission_submitter` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_submission_submitter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_sup_attach_t`
--

DROP TABLE IF EXISTS `asn_sup_attach_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_sup_attach_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ATTACHMENT_ID` varchar(255) NOT NULL,
  `ASN_SUP_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniqueAttachmentItem` (`ATTACHMENT_ID`,`ASN_SUP_ITEM_ID`),
  KEY `ASN_SUP_ITEM_I` (`ASN_SUP_ITEM_ID`),
  CONSTRAINT `FK_l5e47qvqww2jr9mf5e249wvkm` FOREIGN KEY (`ASN_SUP_ITEM_ID`) REFERENCES `asn_sup_item_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_sup_attach_t`
--

LOCK TABLES `asn_sup_attach_t` WRITE;
/*!40000 ALTER TABLE `asn_sup_attach_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_sup_attach_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_sup_item_t`
--

DROP TABLE IF EXISTS `asn_sup_item_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asn_sup_item_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_sup_item_t`
--

LOCK TABLES `asn_sup_item_t` WRITE;
/*!40000 ALTER TABLE `asn_sup_item_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_sup_item_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bullhorn_alerts`
--

DROP TABLE IF EXISTS `bullhorn_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bullhorn_alerts` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ALERT_TYPE` varchar(8) NOT NULL,
  `FROM_USER` varchar(99) NOT NULL,
  `TO_USER` varchar(99) NOT NULL,
  `EVENT` varchar(32) NOT NULL,
  `REF` varchar(255) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `SITE_ID` varchar(99) DEFAULT NULL,
  `URL` text NOT NULL,
  `EVENT_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bullhorn_alerts`
--

LOCK TABLES `bullhorn_alerts` WRITE;
/*!40000 ALTER TABLE `bullhorn_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bullhorn_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_calendar`
--

DROP TABLE IF EXISTS `calendar_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `calendar_calendar` (
  `CALENDAR_ID` varchar(99) NOT NULL,
  `NEXT_ID` int(11) DEFAULT NULL,
  `XML` longtext,
  UNIQUE KEY `CALENDAR_CALENDAR_INDEX` (`CALENDAR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_calendar`
--

LOCK TABLES `calendar_calendar` WRITE;
/*!40000 ALTER TABLE `calendar_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_event`
--

DROP TABLE IF EXISTS `calendar_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `calendar_event` (
  `CALENDAR_ID` varchar(99) NOT NULL,
  `EVENT_ID` varchar(36) NOT NULL,
  `EVENT_START` datetime NOT NULL,
  `EVENT_END` datetime NOT NULL,
  `RANGE_START` int(11) NOT NULL,
  `RANGE_END` int(11) NOT NULL,
  `XML` longtext,
  UNIQUE KEY `EVENT_INDEX` (`EVENT_ID`),
  KEY `CALENDAR_EVENT_INDEX` (`CALENDAR_ID`),
  KEY `CALENDAR_EVENT_RSTART` (`RANGE_START`),
  KEY `CALENDAR_EVENT_REND` (`RANGE_END`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_event`
--

LOCK TABLES `calendar_event` WRITE;
/*!40000 ALTER TABLE `calendar_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_opaqueurl`
--

DROP TABLE IF EXISTS `calendar_opaqueurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `calendar_opaqueurl` (
  `ID` varchar(36) NOT NULL,
  `userUUID` varchar(99) DEFAULT NULL,
  `calendarRef` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `calendar_opaqueurl_idx` (`userUUID`,`calendarRef`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_opaqueurl`
--

LOCK TABLES `calendar_opaqueurl` WRITE;
/*!40000 ALTER TABLE `calendar_opaqueurl` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_opaqueurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat2_channel`
--

DROP TABLE IF EXISTS `chat2_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chat2_channel` (
  `CHANNEL_ID` varchar(36) NOT NULL,
  `CONTEXT` varchar(99) NOT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ENABLE_USER_OVERRIDE` bit(1) NOT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `filterParam` int(11) DEFAULT NULL,
  `filterType` varchar(25) DEFAULT NULL,
  `migratedChannelId` varchar(99) DEFAULT NULL,
  `numberParam` int(11) NOT NULL,
  `PLACEMENT_ID` varchar(99) DEFAULT NULL,
  `placementDefaultChannel` bit(1) NOT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `timeParam` int(11) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat2_channel`
--

LOCK TABLES `chat2_channel` WRITE;
/*!40000 ALTER TABLE `chat2_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat2_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat2_message`
--

DROP TABLE IF EXISTS `chat2_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chat2_message` (
  `MESSAGE_ID` varchar(36) NOT NULL,
  `BODY` longtext NOT NULL,
  `MESSAGE_DATE` datetime DEFAULT NULL,
  `migratedMessageId` varchar(99) DEFAULT NULL,
  `OWNER` varchar(96) NOT NULL,
  `CHANNEL_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`MESSAGE_ID`),
  KEY `FK_m326p0677sjbn2qwdsgl4tdmo` (`CHANNEL_ID`),
  CONSTRAINT `FK_m326p0677sjbn2qwdsgl4tdmo` FOREIGN KEY (`CHANNEL_ID`) REFERENCES `chat2_channel` (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat2_message`
--

LOCK TABLES `chat2_message` WRITE;
/*!40000 ALTER TABLE `chat2_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat2_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_citation`
--

DROP TABLE IF EXISTS `citation_citation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `citation_citation` (
  `CITATION_ID` varchar(36) NOT NULL,
  `PROPERTY_NAME` varchar(255) DEFAULT NULL,
  `PROPERTY_VALUE` longtext,
  KEY `CITATION_CITATION_INDEX` (`CITATION_ID`),
  KEY `CITATION_CITATION_INDEX2` (`CITATION_ID`,`PROPERTY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_citation`
--

LOCK TABLES `citation_citation` WRITE;
/*!40000 ALTER TABLE `citation_citation` DISABLE KEYS */;
/*!40000 ALTER TABLE `citation_citation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_collection`
--

DROP TABLE IF EXISTS `citation_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `citation_collection` (
  `COLLECTION_ID` varchar(36) NOT NULL,
  `PROPERTY_NAME` varchar(255) DEFAULT NULL,
  `PROPERTY_VALUE` longtext,
  KEY `CITATION_COLLECTION_INDEX` (`COLLECTION_ID`),
  KEY `CITATION_COLLECTION_INDEX2` (`COLLECTION_ID`,`PROPERTY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_collection`
--

LOCK TABLES `citation_collection` WRITE;
/*!40000 ALTER TABLE `citation_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `citation_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_collection_order`
--

DROP TABLE IF EXISTS `citation_collection_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `citation_collection_order` (
  `COLLECTION_ID` varchar(36) NOT NULL,
  `CITATION_ID` varchar(36) DEFAULT NULL,
  `SECTION_TYPE` enum('HEADING1','HEADING2','HEADING3','DESCRIPTION','CITATION') DEFAULT NULL,
  `VALUE` text,
  `LOCATION` int(11) NOT NULL,
  KEY `CITATION_COLLECTION_ORDER_INDEX` (`COLLECTION_ID`,`CITATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_collection_order`
--

LOCK TABLES `citation_collection_order` WRITE;
/*!40000 ALTER TABLE `citation_collection_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `citation_collection_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_schema`
--

DROP TABLE IF EXISTS `citation_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `citation_schema` (
  `SCHEMA_ID` varchar(36) NOT NULL,
  `PROPERTY_NAME` varchar(255) DEFAULT NULL,
  `PROPERTY_VALUE` longtext,
  KEY `CITATION_SCHEMA_INDEX` (`SCHEMA_ID`),
  KEY `CITATION_SCHEMA_INDEX2` (`SCHEMA_ID`,`PROPERTY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_schema`
--

LOCK TABLES `citation_schema` WRITE;
/*!40000 ALTER TABLE `citation_schema` DISABLE KEYS */;
INSERT INTO `citation_schema` VALUES ('unknown','sakai:hasField','creator'),('unknown','sakai:hasField','title'),('unknown','sakai:hasField','year'),('unknown','sakai:hasField','date'),('unknown','sakai:hasField','publisher'),('unknown','sakai:hasField','publicationLocation'),('unknown','sakai:hasField','volume'),('unknown','sakai:hasField','issue'),('unknown','sakai:hasField','pages'),('unknown','sakai:hasField','startPage'),('unknown','sakai:hasField','endPage'),('unknown','sakai:hasField','edition'),('unknown','sakai:hasField','editor'),('unknown','sakai:hasField','sourceTitle'),('unknown','sakai:hasField','Language'),('unknown','sakai:hasField','abstract'),('unknown','sakai:hasField','note'),('unknown','sakai:hasField','isnIdentifier'),('unknown','sakai:hasField','subject'),('unknown','sakai:hasField','locIdentifier'),('unknown','sakai:hasField','dateRetrieved'),('unknown','sakai:hasField','openURL'),('unknown','sakai:hasField','doi'),('unknown','sakai:hasField','rights'),('article','sakai:hasField','creator'),('article','sakai:hasField','title'),('article','sakai:hasField','sourceTitle'),('article','sakai:hasField','year'),('article','sakai:hasField','date'),('article','sakai:hasField','volume'),('article','sakai:hasField','issue'),('article','sakai:hasField','pages'),('article','sakai:hasField','startPage'),('article','sakai:hasField','endPage'),('article','sakai:hasField','abstract'),('article','sakai:hasField','note'),('article','sakai:hasField','isnIdentifier'),('article','sakai:hasField','subject'),('article','sakai:hasField','Language'),('article','sakai:hasField','locIdentifier'),('article','sakai:hasField','dateRetrieved'),('article','sakai:hasField','openURL'),('article','sakai:hasField','doi'),('article','sakai:hasField','rights'),('book','sakai:hasField','creator'),('book','sakai:hasField','title'),('book','sakai:hasField','year'),('book','sakai:hasField','date'),('book','sakai:hasField','publisher'),('book','sakai:hasField','publicationLocation'),('book','sakai:hasField','edition'),('book','sakai:hasField','editor'),('book','sakai:hasField','sourceTitle'),('book','sakai:hasField','abstract'),('book','sakai:hasField','note'),('book','sakai:hasField','isnIdentifier'),('book','sakai:hasField','subject'),('book','sakai:hasField','Language'),('book','sakai:hasField','locIdentifier'),('book','sakai:hasField','dateRetrieved'),('book','sakai:hasField','openURL'),('book','sakai:hasField','doi'),('book','sakai:hasField','rights'),('chapter','sakai:hasField','creator'),('chapter','sakai:hasField','title'),('chapter','sakai:hasField','year'),('chapter','sakai:hasField','date'),('chapter','sakai:hasField','publisher'),('chapter','sakai:hasField','publicationLocation'),('chapter','sakai:hasField','edition'),('chapter','sakai:hasField','editor'),('chapter','sakai:hasField','sourceTitle'),('chapter','sakai:hasField','pages'),('chapter','sakai:hasField','startPage'),('chapter','sakai:hasField','endPage'),('chapter','sakai:hasField','abstract'),('chapter','sakai:hasField','note'),('chapter','sakai:hasField','isnIdentifier'),('chapter','sakai:hasField','subject'),('chapter','sakai:hasField','Language'),('chapter','sakai:hasField','locIdentifier'),('chapter','sakai:hasField','dateRetrieved'),('chapter','sakai:hasField','openURL'),('chapter','sakai:hasField','doi'),('chapter','sakai:hasField','rights'),('report','sakai:hasField','creator'),('report','sakai:hasField','title'),('report','sakai:hasField','year'),('report','sakai:hasField','date'),('report','sakai:hasField','publisher'),('report','sakai:hasField','publicationLocation'),('report','sakai:hasField','editor'),('report','sakai:hasField','edition'),('report','sakai:hasField','sourceTitle'),('report','sakai:hasField','pages'),('report','sakai:hasField','abstract'),('report','sakai:hasField','isnIdentifier'),('report','sakai:hasField','note'),('report','sakai:hasField','subject'),('report','sakai:hasField','Language'),('report','sakai:hasField','locIdentifier'),('report','sakai:hasField','dateRetrieved'),('report','sakai:hasField','openURL'),('report','sakai:hasField','doi'),('report','sakai:hasField','rights'),('proceed','sakai:hasField','creator'),('proceed','sakai:hasField','title'),('proceed','sakai:hasField','year'),('proceed','sakai:hasField','volume'),('proceed','sakai:hasField','pages'),('proceed','sakai:hasField','sourceTitle'),('proceed','sakai:hasField','note'),('electronic','sakai:hasField','title'),('electronic','sakai:hasField','year'),('electronic','sakai:hasField','sourceTitle'),('electronic','sakai:hasField','abstract'),('electronic','sakai:hasField','subject'),('thesis','sakai:hasField','creator'),('thesis','sakai:hasField','title'),('thesis','sakai:hasField','year'),('thesis','sakai:hasField','publisher'),('thesis','sakai:hasField','pages'),('thesis','sakai:hasField','note'),('thesis','sakai:hasField','subject');
/*!40000 ALTER TABLE `citation_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_schema_field`
--

DROP TABLE IF EXISTS `citation_schema_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `citation_schema_field` (
  `SCHEMA_ID` varchar(36) NOT NULL,
  `FIELD_ID` varchar(36) NOT NULL,
  `PROPERTY_NAME` varchar(255) DEFAULT NULL,
  `PROPERTY_VALUE` longtext,
  KEY `CITATION_SCHEMA_FIELD_INDEX` (`SCHEMA_ID`,`FIELD_ID`),
  KEY `CITATION_SCHEMA_FIELD_INDEX2` (`SCHEMA_ID`,`FIELD_ID`,`PROPERTY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_schema_field`
--

LOCK TABLES `citation_schema_field` WRITE;
/*!40000 ALTER TABLE `citation_schema_field` DISABLE KEYS */;
INSERT INTO `citation_schema_field` VALUES ('unknown','creator','sakai:hasOrder','0'),('unknown','creator','sakai:required','false'),('unknown','creator','sakai:minCardinality','0'),('unknown','creator','sakai:maxCardinality','2147483647'),('unknown','creator','sakai:valueType','shorttext'),('unknown','creator','sakai:ris_identifier','A1,AU'),('unknown','title','sakai:hasOrder','1'),('unknown','title','sakai:required','true'),('unknown','title','sakai:minCardinality','1'),('unknown','title','sakai:maxCardinality','1'),('unknown','title','sakai:valueType','shorttext'),('unknown','title','sakai:ris_identifier','T1,TI,CT,BT'),('unknown','year','sakai:hasOrder','2'),('unknown','year','sakai:required','false'),('unknown','year','sakai:minCardinality','0'),('unknown','year','sakai:maxCardinality','1'),('unknown','year','sakai:valueType','number'),('unknown','date','sakai:hasOrder','3'),('unknown','date','sakai:required','false'),('unknown','date','sakai:minCardinality','0'),('unknown','date','sakai:maxCardinality','1'),('unknown','date','sakai:valueType','number'),('unknown','date','sakai:ris_identifier','Y1,PY'),('unknown','publisher','sakai:hasOrder','4'),('unknown','publisher','sakai:required','false'),('unknown','publisher','sakai:minCardinality','0'),('unknown','publisher','sakai:maxCardinality','1'),('unknown','publisher','sakai:valueType','shorttext'),('unknown','publisher','sakai:ris_identifier','PB'),('unknown','publicationLocation','sakai:hasOrder','5'),('unknown','publicationLocation','sakai:required','false'),('unknown','publicationLocation','sakai:minCardinality','0'),('unknown','publicationLocation','sakai:maxCardinality','1'),('unknown','publicationLocation','sakai:valueType','shorttext'),('unknown','publicationLocation','sakai:ris_identifier','CY'),('unknown','volume','sakai:hasOrder','6'),('unknown','volume','sakai:required','false'),('unknown','volume','sakai:minCardinality','0'),('unknown','volume','sakai:maxCardinality','1'),('unknown','volume','sakai:valueType','number'),('unknown','volume','sakai:ris_identifier','VL'),('unknown','issue','sakai:hasOrder','7'),('unknown','issue','sakai:required','false'),('unknown','issue','sakai:minCardinality','0'),('unknown','issue','sakai:maxCardinality','1'),('unknown','issue','sakai:valueType','number'),('unknown','issue','sakai:ris_identifier','IS'),('unknown','pages','sakai:hasOrder','8'),('unknown','pages','sakai:required','false'),('unknown','pages','sakai:minCardinality','0'),('unknown','pages','sakai:maxCardinality','1'),('unknown','pages','sakai:valueType','number'),('unknown','pages','sakai:ris_identifier','SP'),('unknown','startPage','sakai:hasOrder','9'),('unknown','startPage','sakai:required','false'),('unknown','startPage','sakai:minCardinality','0'),('unknown','startPage','sakai:maxCardinality','1'),('unknown','startPage','sakai:valueType','number'),('unknown','startPage','sakai:ris_identifier','SP'),('unknown','endPage','sakai:hasOrder','10'),('unknown','endPage','sakai:required','false'),('unknown','endPage','sakai:minCardinality','0'),('unknown','endPage','sakai:maxCardinality','1'),('unknown','endPage','sakai:valueType','number'),('unknown','endPage','sakai:ris_identifier','EP'),('unknown','edition','sakai:hasOrder','11'),('unknown','edition','sakai:required','false'),('unknown','edition','sakai:minCardinality','0'),('unknown','edition','sakai:maxCardinality','1'),('unknown','edition','sakai:valueType','number'),('unknown','edition','sakai:ris_identifier','VL'),('unknown','editor','sakai:hasOrder','12'),('unknown','editor','sakai:required','false'),('unknown','editor','sakai:minCardinality','0'),('unknown','editor','sakai:maxCardinality','2147483647'),('unknown','editor','sakai:valueType','shorttext'),('unknown','editor','sakai:ris_identifier','ED,A2,A3'),('unknown','sourceTitle','sakai:hasOrder','13'),('unknown','sourceTitle','sakai:required','false'),('unknown','sourceTitle','sakai:minCardinality','0'),('unknown','sourceTitle','sakai:maxCardinality','1'),('unknown','sourceTitle','sakai:valueType','shorttext'),('unknown','sourceTitle','sakai:ris_identifier','T3'),('unknown','Language','sakai:hasOrder','14'),('unknown','Language','sakai:required','false'),('unknown','Language','sakai:minCardinality','0'),('unknown','Language','sakai:maxCardinality','1'),('unknown','Language','sakai:valueType','number'),('unknown','abstract','sakai:hasOrder','15'),('unknown','abstract','sakai:required','false'),('unknown','abstract','sakai:minCardinality','0'),('unknown','abstract','sakai:maxCardinality','1'),('unknown','abstract','sakai:valueType','longtext'),('unknown','abstract','sakai:ris_identifier','N2,AB'),('unknown','note','sakai:hasOrder','16'),('unknown','note','sakai:required','false'),('unknown','note','sakai:minCardinality','0'),('unknown','note','sakai:maxCardinality','2147483647'),('unknown','note','sakai:valueType','longtext'),('unknown','note','sakai:ris_identifier','N1,AB'),('unknown','isnIdentifier','sakai:hasOrder','17'),('unknown','isnIdentifier','sakai:required','false'),('unknown','isnIdentifier','sakai:minCardinality','0'),('unknown','isnIdentifier','sakai:maxCardinality','1'),('unknown','isnIdentifier','sakai:valueType','shorttext'),('unknown','isnIdentifier','sakai:ris_identifier','SN'),('unknown','subject','sakai:hasOrder','18'),('unknown','subject','sakai:required','false'),('unknown','subject','sakai:minCardinality','0'),('unknown','subject','sakai:maxCardinality','2147483647'),('unknown','subject','sakai:valueType','shorttext'),('unknown','subject','sakai:ris_identifier','KW'),('unknown','locIdentifier','sakai:hasOrder','19'),('unknown','locIdentifier','sakai:required','false'),('unknown','locIdentifier','sakai:minCardinality','0'),('unknown','locIdentifier','sakai:maxCardinality','1'),('unknown','locIdentifier','sakai:valueType','shorttext'),('unknown','locIdentifier','sakai:ris_identifier','M1'),('unknown','dateRetrieved','sakai:hasOrder','20'),('unknown','dateRetrieved','sakai:required','false'),('unknown','dateRetrieved','sakai:minCardinality','0'),('unknown','dateRetrieved','sakai:maxCardinality','1'),('unknown','dateRetrieved','sakai:valueType','date'),('unknown','openURL','sakai:hasOrder','21'),('unknown','openURL','sakai:required','false'),('unknown','openURL','sakai:minCardinality','0'),('unknown','openURL','sakai:maxCardinality','1'),('unknown','openURL','sakai:valueType','shorttext'),('unknown','doi','sakai:hasOrder','22'),('unknown','doi','sakai:required','false'),('unknown','doi','sakai:minCardinality','0'),('unknown','doi','sakai:maxCardinality','1'),('unknown','doi','sakai:valueType','number'),('unknown','rights','sakai:hasOrder','23'),('unknown','rights','sakai:required','false'),('unknown','rights','sakai:minCardinality','0'),('unknown','rights','sakai:maxCardinality','2147483647'),('unknown','rights','sakai:valueType','shorttext'),('article','creator','sakai:hasOrder','0'),('article','creator','sakai:required','false'),('article','creator','sakai:minCardinality','0'),('article','creator','sakai:maxCardinality','2147483647'),('article','creator','sakai:valueType','shorttext'),('article','creator','sakai:ris_identifier','A1,AU'),('article','title','sakai:hasOrder','1'),('article','title','sakai:required','true'),('article','title','sakai:minCardinality','1'),('article','title','sakai:maxCardinality','1'),('article','title','sakai:valueType','shorttext'),('article','title','sakai:ris_identifier','T1,TI,CT'),('article','sourceTitle','sakai:hasOrder','2'),('article','sourceTitle','sakai:required','false'),('article','sourceTitle','sakai:minCardinality','0'),('article','sourceTitle','sakai:maxCardinality','1'),('article','sourceTitle','sakai:valueType','shorttext'),('article','sourceTitle','sakai:ris_identifier','JF,JO,JA,J1,J2,BT,T2'),('article','year','sakai:hasOrder','3'),('article','year','sakai:required','false'),('article','year','sakai:minCardinality','0'),('article','year','sakai:maxCardinality','1'),('article','year','sakai:valueType','number'),('article','date','sakai:hasOrder','4'),('article','date','sakai:required','false'),('article','date','sakai:minCardinality','0'),('article','date','sakai:maxCardinality','1'),('article','date','sakai:valueType','number'),('article','date','sakai:ris_identifier','Y1,PY'),('article','volume','sakai:hasOrder','5'),('article','volume','sakai:required','false'),('article','volume','sakai:minCardinality','0'),('article','volume','sakai:maxCardinality','1'),('article','volume','sakai:valueType','number'),('article','volume','sakai:ris_identifier','VL'),('article','issue','sakai:hasOrder','6'),('article','issue','sakai:required','false'),('article','issue','sakai:minCardinality','0'),('article','issue','sakai:maxCardinality','1'),('article','issue','sakai:valueType','number'),('article','issue','sakai:ris_identifier','IS'),('article','pages','sakai:hasOrder','7'),('article','pages','sakai:required','false'),('article','pages','sakai:minCardinality','0'),('article','pages','sakai:maxCardinality','1'),('article','pages','sakai:valueType','number'),('article','startPage','sakai:hasOrder','8'),('article','startPage','sakai:required','false'),('article','startPage','sakai:minCardinality','0'),('article','startPage','sakai:maxCardinality','1'),('article','startPage','sakai:valueType','number'),('article','startPage','sakai:ris_identifier','SP'),('article','endPage','sakai:hasOrder','9'),('article','endPage','sakai:required','false'),('article','endPage','sakai:minCardinality','0'),('article','endPage','sakai:maxCardinality','1'),('article','endPage','sakai:valueType','number'),('article','endPage','sakai:ris_identifier','EP'),('article','abstract','sakai:hasOrder','10'),('article','abstract','sakai:required','false'),('article','abstract','sakai:minCardinality','0'),('article','abstract','sakai:maxCardinality','1'),('article','abstract','sakai:valueType','longtext'),('article','abstract','sakai:ris_identifier','N2,AB'),('article','note','sakai:hasOrder','11'),('article','note','sakai:required','false'),('article','note','sakai:minCardinality','0'),('article','note','sakai:maxCardinality','2147483647'),('article','note','sakai:valueType','longtext'),('article','note','sakai:ris_identifier','N1,AB'),('article','isnIdentifier','sakai:hasOrder','12'),('article','isnIdentifier','sakai:required','false'),('article','isnIdentifier','sakai:minCardinality','0'),('article','isnIdentifier','sakai:maxCardinality','1'),('article','isnIdentifier','sakai:valueType','shorttext'),('article','isnIdentifier','sakai:ris_identifier','SN'),('article','subject','sakai:hasOrder','13'),('article','subject','sakai:required','false'),('article','subject','sakai:minCardinality','0'),('article','subject','sakai:maxCardinality','2147483647'),('article','subject','sakai:valueType','shorttext'),('article','subject','sakai:ris_identifier','KW'),('article','Language','sakai:hasOrder','14'),('article','Language','sakai:required','false'),('article','Language','sakai:minCardinality','0'),('article','Language','sakai:maxCardinality','1'),('article','Language','sakai:valueType','number'),('article','locIdentifier','sakai:hasOrder','15'),('article','locIdentifier','sakai:required','false'),('article','locIdentifier','sakai:minCardinality','0'),('article','locIdentifier','sakai:maxCardinality','1'),('article','locIdentifier','sakai:valueType','shorttext'),('article','locIdentifier','sakai:ris_identifier','M1'),('article','dateRetrieved','sakai:hasOrder','16'),('article','dateRetrieved','sakai:required','false'),('article','dateRetrieved','sakai:minCardinality','0'),('article','dateRetrieved','sakai:maxCardinality','1'),('article','dateRetrieved','sakai:valueType','date'),('article','openURL','sakai:hasOrder','17'),('article','openURL','sakai:required','false'),('article','openURL','sakai:minCardinality','0'),('article','openURL','sakai:maxCardinality','1'),('article','openURL','sakai:valueType','shorttext'),('article','doi','sakai:hasOrder','18'),('article','doi','sakai:required','false'),('article','doi','sakai:minCardinality','0'),('article','doi','sakai:maxCardinality','1'),('article','doi','sakai:valueType','number'),('article','rights','sakai:hasOrder','19'),('article','rights','sakai:required','false'),('article','rights','sakai:minCardinality','0'),('article','rights','sakai:maxCardinality','2147483647'),('article','rights','sakai:valueType','shorttext'),('book','creator','sakai:hasOrder','0'),('book','creator','sakai:required','true'),('book','creator','sakai:minCardinality','1'),('book','creator','sakai:maxCardinality','2147483647'),('book','creator','sakai:valueType','shorttext'),('book','creator','sakai:ris_identifier','A1,AU'),('book','title','sakai:hasOrder','1'),('book','title','sakai:required','true'),('book','title','sakai:minCardinality','1'),('book','title','sakai:maxCardinality','1'),('book','title','sakai:valueType','shorttext'),('book','title','sakai:ris_identifier','BT,T1,TI'),('book','year','sakai:hasOrder','2'),('book','year','sakai:required','false'),('book','year','sakai:minCardinality','0'),('book','year','sakai:maxCardinality','1'),('book','year','sakai:valueType','number'),('book','date','sakai:hasOrder','3'),('book','date','sakai:required','false'),('book','date','sakai:minCardinality','0'),('book','date','sakai:maxCardinality','1'),('book','date','sakai:valueType','number'),('book','date','sakai:ris_identifier','Y1,PY'),('book','publisher','sakai:hasOrder','4'),('book','publisher','sakai:required','false'),('book','publisher','sakai:minCardinality','0'),('book','publisher','sakai:maxCardinality','1'),('book','publisher','sakai:valueType','shorttext'),('book','publisher','sakai:ris_identifier','PB'),('book','publicationLocation','sakai:hasOrder','5'),('book','publicationLocation','sakai:required','false'),('book','publicationLocation','sakai:minCardinality','0'),('book','publicationLocation','sakai:maxCardinality','1'),('book','publicationLocation','sakai:valueType','shorttext'),('book','publicationLocation','sakai:ris_identifier','CY'),('book','edition','sakai:hasOrder','6'),('book','edition','sakai:required','false'),('book','edition','sakai:minCardinality','0'),('book','edition','sakai:maxCardinality','1'),('book','edition','sakai:valueType','number'),('book','edition','sakai:ris_identifier','VL'),('book','editor','sakai:hasOrder','7'),('book','editor','sakai:required','false'),('book','editor','sakai:minCardinality','0'),('book','editor','sakai:maxCardinality','2147483647'),('book','editor','sakai:valueType','shorttext'),('book','editor','sakai:ris_identifier','ED,A2,A3'),('book','sourceTitle','sakai:hasOrder','8'),('book','sourceTitle','sakai:required','false'),('book','sourceTitle','sakai:minCardinality','0'),('book','sourceTitle','sakai:maxCardinality','1'),('book','sourceTitle','sakai:valueType','shorttext'),('book','sourceTitle','sakai:ris_identifier','T3'),('book','abstract','sakai:hasOrder','9'),('book','abstract','sakai:required','false'),('book','abstract','sakai:minCardinality','0'),('book','abstract','sakai:maxCardinality','1'),('book','abstract','sakai:valueType','longtext'),('book','abstract','sakai:ris_identifier','N2,AB'),('book','note','sakai:hasOrder','10'),('book','note','sakai:required','false'),('book','note','sakai:minCardinality','0'),('book','note','sakai:maxCardinality','2147483647'),('book','note','sakai:valueType','longtext'),('book','note','sakai:ris_identifier','N1,AB'),('book','isnIdentifier','sakai:hasOrder','11'),('book','isnIdentifier','sakai:required','false'),('book','isnIdentifier','sakai:minCardinality','0'),('book','isnIdentifier','sakai:maxCardinality','1'),('book','isnIdentifier','sakai:valueType','shorttext'),('book','isnIdentifier','sakai:ris_identifier','SN'),('book','subject','sakai:hasOrder','12'),('book','subject','sakai:required','false'),('book','subject','sakai:minCardinality','0'),('book','subject','sakai:maxCardinality','2147483647'),('book','subject','sakai:valueType','shorttext'),('book','subject','sakai:ris_identifier','KW'),('book','Language','sakai:hasOrder','13'),('book','Language','sakai:required','false'),('book','Language','sakai:minCardinality','0'),('book','Language','sakai:maxCardinality','1'),('book','Language','sakai:valueType','number'),('book','locIdentifier','sakai:hasOrder','14'),('book','locIdentifier','sakai:required','false'),('book','locIdentifier','sakai:minCardinality','0'),('book','locIdentifier','sakai:maxCardinality','1'),('book','locIdentifier','sakai:valueType','shorttext'),('book','locIdentifier','sakai:ris_identifier','M1'),('book','dateRetrieved','sakai:hasOrder','15'),('book','dateRetrieved','sakai:required','false'),('book','dateRetrieved','sakai:minCardinality','0'),('book','dateRetrieved','sakai:maxCardinality','1'),('book','dateRetrieved','sakai:valueType','date'),('book','openURL','sakai:hasOrder','16'),('book','openURL','sakai:required','false'),('book','openURL','sakai:minCardinality','0'),('book','openURL','sakai:maxCardinality','1'),('book','openURL','sakai:valueType','shorttext'),('book','doi','sakai:hasOrder','17'),('book','doi','sakai:required','false'),('book','doi','sakai:minCardinality','0'),('book','doi','sakai:maxCardinality','1'),('book','doi','sakai:valueType','number'),('book','rights','sakai:hasOrder','18'),('book','rights','sakai:required','false'),('book','rights','sakai:minCardinality','0'),('book','rights','sakai:maxCardinality','2147483647'),('book','rights','sakai:valueType','shorttext'),('chapter','creator','sakai:hasOrder','0'),('chapter','creator','sakai:required','true'),('chapter','creator','sakai:minCardinality','1'),('chapter','creator','sakai:maxCardinality','2147483647'),('chapter','creator','sakai:valueType','shorttext'),('chapter','creator','sakai:ris_identifier','A1,AU'),('chapter','title','sakai:hasOrder','1'),('chapter','title','sakai:required','true'),('chapter','title','sakai:minCardinality','1'),('chapter','title','sakai:maxCardinality','1'),('chapter','title','sakai:valueType','shorttext'),('chapter','title','sakai:ris_identifier','CT,T1,TI'),('chapter','year','sakai:hasOrder','2'),('chapter','year','sakai:required','false'),('chapter','year','sakai:minCardinality','0'),('chapter','year','sakai:maxCardinality','1'),('chapter','year','sakai:valueType','number'),('chapter','date','sakai:hasOrder','3'),('chapter','date','sakai:required','false'),('chapter','date','sakai:minCardinality','0'),('chapter','date','sakai:maxCardinality','1'),('chapter','date','sakai:valueType','number'),('chapter','date','sakai:ris_identifier','Y1,PY'),('chapter','publisher','sakai:hasOrder','4'),('chapter','publisher','sakai:required','false'),('chapter','publisher','sakai:minCardinality','0'),('chapter','publisher','sakai:maxCardinality','1'),('chapter','publisher','sakai:valueType','shorttext'),('chapter','publisher','sakai:ris_identifier','PB'),('chapter','publicationLocation','sakai:hasOrder','5'),('chapter','publicationLocation','sakai:required','false'),('chapter','publicationLocation','sakai:minCardinality','0'),('chapter','publicationLocation','sakai:maxCardinality','1'),('chapter','publicationLocation','sakai:valueType','shorttext'),('chapter','publicationLocation','sakai:ris_identifier','CY'),('chapter','edition','sakai:hasOrder','6'),('chapter','edition','sakai:required','false'),('chapter','edition','sakai:minCardinality','0'),('chapter','edition','sakai:maxCardinality','1'),('chapter','edition','sakai:valueType','number'),('chapter','edition','sakai:ris_identifier','VL'),('chapter','editor','sakai:hasOrder','7'),('chapter','editor','sakai:required','false'),('chapter','editor','sakai:minCardinality','0'),('chapter','editor','sakai:maxCardinality','2147483647'),('chapter','editor','sakai:valueType','shorttext'),('chapter','editor','sakai:ris_identifier','ED,A2,A3'),('chapter','sourceTitle','sakai:hasOrder','8'),('chapter','sourceTitle','sakai:required','false'),('chapter','sourceTitle','sakai:minCardinality','0'),('chapter','sourceTitle','sakai:maxCardinality','1'),('chapter','sourceTitle','sakai:valueType','shorttext'),('chapter','sourceTitle','sakai:ris_identifier','BT,T2'),('chapter','pages','sakai:hasOrder','9'),('chapter','pages','sakai:required','false'),('chapter','pages','sakai:minCardinality','0'),('chapter','pages','sakai:maxCardinality','1'),('chapter','pages','sakai:valueType','number'),('chapter','pages','sakai:ris_identifier','SP'),('chapter','startPage','sakai:hasOrder','10'),('chapter','startPage','sakai:required','false'),('chapter','startPage','sakai:minCardinality','0'),('chapter','startPage','sakai:maxCardinality','1'),('chapter','startPage','sakai:valueType','number'),('chapter','startPage','sakai:ris_identifier','SP'),('chapter','endPage','sakai:hasOrder','11'),('chapter','endPage','sakai:required','false'),('chapter','endPage','sakai:minCardinality','0'),('chapter','endPage','sakai:maxCardinality','1'),('chapter','endPage','sakai:valueType','number'),('chapter','endPage','sakai:ris_identifier','EP'),('chapter','abstract','sakai:hasOrder','12'),('chapter','abstract','sakai:required','false'),('chapter','abstract','sakai:minCardinality','0'),('chapter','abstract','sakai:maxCardinality','1'),('chapter','abstract','sakai:valueType','longtext'),('chapter','abstract','sakai:ris_identifier','N2,AB'),('chapter','note','sakai:hasOrder','13'),('chapter','note','sakai:required','false'),('chapter','note','sakai:minCardinality','0'),('chapter','note','sakai:maxCardinality','2147483647'),('chapter','note','sakai:valueType','longtext'),('chapter','note','sakai:ris_identifier','N1,AB'),('chapter','isnIdentifier','sakai:hasOrder','14'),('chapter','isnIdentifier','sakai:required','false'),('chapter','isnIdentifier','sakai:minCardinality','0'),('chapter','isnIdentifier','sakai:maxCardinality','1'),('chapter','isnIdentifier','sakai:valueType','shorttext'),('chapter','isnIdentifier','sakai:ris_identifier','SN'),('chapter','subject','sakai:hasOrder','15'),('chapter','subject','sakai:required','false'),('chapter','subject','sakai:minCardinality','0'),('chapter','subject','sakai:maxCardinality','2147483647'),('chapter','subject','sakai:valueType','shorttext'),('chapter','subject','sakai:ris_identifier','KW'),('chapter','Language','sakai:hasOrder','16'),('chapter','Language','sakai:required','false'),('chapter','Language','sakai:minCardinality','0'),('chapter','Language','sakai:maxCardinality','1'),('chapter','Language','sakai:valueType','number'),('chapter','locIdentifier','sakai:hasOrder','17'),('chapter','locIdentifier','sakai:required','false'),('chapter','locIdentifier','sakai:minCardinality','0'),('chapter','locIdentifier','sakai:maxCardinality','1'),('chapter','locIdentifier','sakai:valueType','shorttext'),('chapter','locIdentifier','sakai:ris_identifier','M1'),('chapter','dateRetrieved','sakai:hasOrder','18'),('chapter','dateRetrieved','sakai:required','false'),('chapter','dateRetrieved','sakai:minCardinality','0'),('chapter','dateRetrieved','sakai:maxCardinality','1'),('chapter','dateRetrieved','sakai:valueType','date'),('chapter','openURL','sakai:hasOrder','19'),('chapter','openURL','sakai:required','false'),('chapter','openURL','sakai:minCardinality','0'),('chapter','openURL','sakai:maxCardinality','1'),('chapter','openURL','sakai:valueType','shorttext'),('chapter','doi','sakai:hasOrder','20'),('chapter','doi','sakai:required','false'),('chapter','doi','sakai:minCardinality','0'),('chapter','doi','sakai:maxCardinality','1'),('chapter','doi','sakai:valueType','number'),('chapter','rights','sakai:hasOrder','21'),('chapter','rights','sakai:required','false'),('chapter','rights','sakai:minCardinality','0'),('chapter','rights','sakai:maxCardinality','2147483647'),('chapter','rights','sakai:valueType','shorttext'),('report','creator','sakai:hasOrder','0'),('report','creator','sakai:required','true'),('report','creator','sakai:minCardinality','1'),('report','creator','sakai:maxCardinality','2147483647'),('report','creator','sakai:valueType','shorttext'),('report','creator','sakai:ris_identifier','A1,AU'),('report','title','sakai:hasOrder','1'),('report','title','sakai:required','true'),('report','title','sakai:minCardinality','1'),('report','title','sakai:maxCardinality','1'),('report','title','sakai:valueType','shorttext'),('report','title','sakai:ris_identifier','T1,TI'),('report','year','sakai:hasOrder','2'),('report','year','sakai:required','false'),('report','year','sakai:minCardinality','0'),('report','year','sakai:maxCardinality','1'),('report','year','sakai:valueType','number'),('report','date','sakai:hasOrder','3'),('report','date','sakai:required','false'),('report','date','sakai:minCardinality','0'),('report','date','sakai:maxCardinality','1'),('report','date','sakai:valueType','number'),('report','date','sakai:ris_identifier','Y1,PY'),('report','publisher','sakai:hasOrder','4'),('report','publisher','sakai:required','false'),('report','publisher','sakai:minCardinality','0'),('report','publisher','sakai:maxCardinality','1'),('report','publisher','sakai:valueType','shorttext'),('report','publisher','sakai:ris_identifier','PB'),('report','publicationLocation','sakai:hasOrder','5'),('report','publicationLocation','sakai:required','false'),('report','publicationLocation','sakai:minCardinality','0'),('report','publicationLocation','sakai:maxCardinality','1'),('report','publicationLocation','sakai:valueType','shorttext'),('report','publicationLocation','sakai:ris_identifier','CY'),('report','editor','sakai:hasOrder','6'),('report','editor','sakai:required','false'),('report','editor','sakai:minCardinality','0'),('report','editor','sakai:maxCardinality','2147483647'),('report','editor','sakai:valueType','shorttext'),('report','editor','sakai:ris_identifier','ED,A2,A3'),('report','edition','sakai:hasOrder','7'),('report','edition','sakai:required','false'),('report','edition','sakai:minCardinality','0'),('report','edition','sakai:maxCardinality','1'),('report','edition','sakai:valueType','number'),('report','edition','sakai:ris_identifier','VL'),('report','sourceTitle','sakai:hasOrder','8'),('report','sourceTitle','sakai:required','false'),('report','sourceTitle','sakai:minCardinality','0'),('report','sourceTitle','sakai:maxCardinality','1'),('report','sourceTitle','sakai:valueType','shorttext'),('report','sourceTitle','sakai:ris_identifier','T3'),('report','pages','sakai:hasOrder','9'),('report','pages','sakai:required','false'),('report','pages','sakai:minCardinality','0'),('report','pages','sakai:maxCardinality','1'),('report','pages','sakai:valueType','number'),('report','pages','sakai:ris_identifier','SP'),('report','abstract','sakai:hasOrder','10'),('report','abstract','sakai:required','false'),('report','abstract','sakai:minCardinality','0'),('report','abstract','sakai:maxCardinality','1'),('report','abstract','sakai:valueType','longtext'),('report','abstract','sakai:ris_identifier','N2,AB'),('report','isnIdentifier','sakai:hasOrder','11'),('report','isnIdentifier','sakai:required','false'),('report','isnIdentifier','sakai:minCardinality','0'),('report','isnIdentifier','sakai:maxCardinality','1'),('report','isnIdentifier','sakai:valueType','shorttext'),('report','isnIdentifier','sakai:ris_identifier','SN'),('report','note','sakai:hasOrder','12'),('report','note','sakai:required','false'),('report','note','sakai:minCardinality','0'),('report','note','sakai:maxCardinality','2147483647'),('report','note','sakai:valueType','longtext'),('report','note','sakai:ris_identifier','N1,AB'),('report','subject','sakai:hasOrder','13'),('report','subject','sakai:required','false'),('report','subject','sakai:minCardinality','0'),('report','subject','sakai:maxCardinality','2147483647'),('report','subject','sakai:valueType','shorttext'),('report','subject','sakai:ris_identifier','KW'),('report','Language','sakai:hasOrder','14'),('report','Language','sakai:required','false'),('report','Language','sakai:minCardinality','0'),('report','Language','sakai:maxCardinality','1'),('report','Language','sakai:valueType','number'),('report','locIdentifier','sakai:hasOrder','15'),('report','locIdentifier','sakai:required','false'),('report','locIdentifier','sakai:minCardinality','0'),('report','locIdentifier','sakai:maxCardinality','1'),('report','locIdentifier','sakai:valueType','shorttext'),('report','locIdentifier','sakai:ris_identifier','M1'),('report','dateRetrieved','sakai:hasOrder','16'),('report','dateRetrieved','sakai:required','false'),('report','dateRetrieved','sakai:minCardinality','0'),('report','dateRetrieved','sakai:maxCardinality','1'),('report','dateRetrieved','sakai:valueType','date'),('report','openURL','sakai:hasOrder','17'),('report','openURL','sakai:required','false'),('report','openURL','sakai:minCardinality','0'),('report','openURL','sakai:maxCardinality','1'),('report','openURL','sakai:valueType','shorttext'),('report','doi','sakai:hasOrder','18'),('report','doi','sakai:required','false'),('report','doi','sakai:minCardinality','0'),('report','doi','sakai:maxCardinality','1'),('report','doi','sakai:valueType','number'),('report','rights','sakai:hasOrder','19'),('report','rights','sakai:required','false'),('report','rights','sakai:minCardinality','0'),('report','rights','sakai:maxCardinality','2147483647'),('report','rights','sakai:valueType','shorttext'),('proceed','creator','sakai:hasOrder','0'),('proceed','creator','sakai:required','false'),('proceed','creator','sakai:minCardinality','0'),('proceed','creator','sakai:maxCardinality','2147483647'),('proceed','creator','sakai:valueType','shorttext'),('proceed','creator','sakai:ris_identifier','AU'),('proceed','title','sakai:hasOrder','1'),('proceed','title','sakai:required','true'),('proceed','title','sakai:minCardinality','1'),('proceed','title','sakai:maxCardinality','1'),('proceed','title','sakai:valueType','shorttext'),('proceed','title','sakai:ris_identifier','CT'),('proceed','year','sakai:hasOrder','2'),('proceed','year','sakai:required','false'),('proceed','year','sakai:minCardinality','0'),('proceed','year','sakai:maxCardinality','1'),('proceed','year','sakai:valueType','number'),('proceed','year','sakai:ris_identifier','PY'),('proceed','volume','sakai:hasOrder','3'),('proceed','volume','sakai:required','false'),('proceed','volume','sakai:minCardinality','0'),('proceed','volume','sakai:maxCardinality','1'),('proceed','volume','sakai:valueType','number'),('proceed','volume','sakai:ris_identifier','VL'),('proceed','pages','sakai:hasOrder','4'),('proceed','pages','sakai:required','false'),('proceed','pages','sakai:minCardinality','0'),('proceed','pages','sakai:maxCardinality','1'),('proceed','pages','sakai:valueType','number'),('proceed','pages','sakai:ris_identifier','SP'),('proceed','sourceTitle','sakai:hasOrder','5'),('proceed','sourceTitle','sakai:required','false'),('proceed','sourceTitle','sakai:minCardinality','0'),('proceed','sourceTitle','sakai:maxCardinality','1'),('proceed','sourceTitle','sakai:valueType','shorttext'),('proceed','sourceTitle','sakai:ris_identifier','BT,T2'),('proceed','note','sakai:hasOrder','6'),('proceed','note','sakai:required','false'),('proceed','note','sakai:minCardinality','0'),('proceed','note','sakai:maxCardinality','2147483647'),('proceed','note','sakai:valueType','longtext'),('proceed','note','sakai:ris_identifier','N1,AB'),('electronic','title','sakai:hasOrder','0'),('electronic','title','sakai:required','true'),('electronic','title','sakai:minCardinality','1'),('electronic','title','sakai:maxCardinality','1'),('electronic','title','sakai:valueType','shorttext'),('electronic','title','sakai:ris_identifier','CT'),('electronic','year','sakai:hasOrder','1'),('electronic','year','sakai:required','false'),('electronic','year','sakai:minCardinality','0'),('electronic','year','sakai:maxCardinality','1'),('electronic','year','sakai:valueType','number'),('electronic','year','sakai:ris_identifier','PY'),('electronic','sourceTitle','sakai:hasOrder','2'),('electronic','sourceTitle','sakai:required','false'),('electronic','sourceTitle','sakai:minCardinality','0'),('electronic','sourceTitle','sakai:maxCardinality','1'),('electronic','sourceTitle','sakai:valueType','shorttext'),('electronic','sourceTitle','sakai:ris_identifier','T3'),('electronic','abstract','sakai:hasOrder','3'),('electronic','abstract','sakai:required','false'),('electronic','abstract','sakai:minCardinality','0'),('electronic','abstract','sakai:maxCardinality','1'),('electronic','abstract','sakai:valueType','longtext'),('electronic','abstract','sakai:ris_identifier','N2,AB'),('electronic','subject','sakai:hasOrder','4'),('electronic','subject','sakai:required','false'),('electronic','subject','sakai:minCardinality','0'),('electronic','subject','sakai:maxCardinality','2147483647'),('electronic','subject','sakai:valueType','shorttext'),('electronic','subject','sakai:ris_identifier','KW'),('thesis','creator','sakai:hasOrder','0'),('thesis','creator','sakai:required','false'),('thesis','creator','sakai:minCardinality','0'),('thesis','creator','sakai:maxCardinality','2147483647'),('thesis','creator','sakai:valueType','shorttext'),('thesis','creator','sakai:ris_identifier','AU'),('thesis','title','sakai:hasOrder','1'),('thesis','title','sakai:required','true'),('thesis','title','sakai:minCardinality','1'),('thesis','title','sakai:maxCardinality','1'),('thesis','title','sakai:valueType','shorttext'),('thesis','title','sakai:ris_identifier','CT'),('thesis','year','sakai:hasOrder','2'),('thesis','year','sakai:required','false'),('thesis','year','sakai:minCardinality','0'),('thesis','year','sakai:maxCardinality','1'),('thesis','year','sakai:valueType','number'),('thesis','year','sakai:ris_identifier','PY'),('thesis','publisher','sakai:hasOrder','3'),('thesis','publisher','sakai:required','false'),('thesis','publisher','sakai:minCardinality','0'),('thesis','publisher','sakai:maxCardinality','1'),('thesis','publisher','sakai:valueType','shorttext'),('thesis','publisher','sakai:ris_identifier','PB'),('thesis','pages','sakai:hasOrder','4'),('thesis','pages','sakai:required','false'),('thesis','pages','sakai:minCardinality','0'),('thesis','pages','sakai:maxCardinality','1'),('thesis','pages','sakai:valueType','number'),('thesis','pages','sakai:ris_identifier','SP'),('thesis','note','sakai:hasOrder','5'),('thesis','note','sakai:required','false'),('thesis','note','sakai:minCardinality','0'),('thesis','note','sakai:maxCardinality','2147483647'),('thesis','note','sakai:valueType','longtext'),('thesis','note','sakai:ris_identifier','N1,AB'),('thesis','subject','sakai:hasOrder','6'),('thesis','subject','sakai:required','false'),('thesis','subject','sakai:minCardinality','0'),('thesis','subject','sakai:maxCardinality','2147483647'),('thesis','subject','sakai:valueType','shorttext'),('thesis','subject','sakai:ris_identifier','KW');
/*!40000 ALTER TABLE `citation_schema_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_academic_session_t`
--

DROP TABLE IF EXISTS `cm_academic_session_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cm_academic_session_t` (
  `ACADEMIC_SESSION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `LAST_MODIFIED_BY` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED_DATE` date DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `CREATED_DATE` date DEFAULT NULL,
  `ENTERPRISE_ID` varchar(255) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `IS_CURRENT` bit(1) NOT NULL,
  PRIMARY KEY (`ACADEMIC_SESSION_ID`),
  UNIQUE KEY `UK_8tedjqij6wdhbusfq1s8u73qv` (`ENTERPRISE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_academic_session_t`
--

LOCK TABLES `cm_academic_session_t` WRITE;
/*!40000 ALTER TABLE `cm_academic_session_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_academic_session_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_course_set_canon_assoc_t`
--

DROP TABLE IF EXISTS `cm_course_set_canon_assoc_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cm_course_set_canon_assoc_t` (
  `CANON_COURSE` bigint(20) NOT NULL,
  `COURSE_SET` bigint(20) NOT NULL,
  PRIMARY KEY (`COURSE_SET`,`CANON_COURSE`),
  KEY `FK_a4c1jqoj4ot93jkr1g7vdict3` (`CANON_COURSE`),
  CONSTRAINT `FK_a4c1jqoj4ot93jkr1g7vdict3` FOREIGN KEY (`CANON_COURSE`) REFERENCES `cm_member_container_t` (`MEMBER_CONTAINER_ID`),
  CONSTRAINT `FK_8m3u06fbj6v9ulwhruxj1ihd7` FOREIGN KEY (`COURSE_SET`) REFERENCES `cm_member_container_t` (`MEMBER_CONTAINER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_course_set_canon_assoc_t`
--

LOCK TABLES `cm_course_set_canon_assoc_t` WRITE;
/*!40000 ALTER TABLE `cm_course_set_canon_assoc_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_course_set_canon_assoc_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_course_set_offering_assoc_t`
--

DROP TABLE IF EXISTS `cm_course_set_offering_assoc_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cm_course_set_offering_assoc_t` (
  `COURSE_OFFERING` bigint(20) NOT NULL,
  `COURSE_SET` bigint(20) NOT NULL,
  PRIMARY KEY (`COURSE_SET`,`COURSE_OFFERING`),
  KEY `FK_oi0fi8gi9nwdbh1rykgwb4y16` (`COURSE_OFFERING`),
  CONSTRAINT `FK_oi0fi8gi9nwdbh1rykgwb4y16` FOREIGN KEY (`COURSE_OFFERING`) REFERENCES `cm_member_container_t` (`MEMBER_CONTAINER_ID`),
  CONSTRAINT `FK_6o31qid5fbvki5t4idmtagik2` FOREIGN KEY (`COURSE_SET`) REFERENCES `cm_member_container_t` (`MEMBER_CONTAINER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_course_set_offering_assoc_t`
--

LOCK TABLES `cm_course_set_offering_assoc_t` WRITE;
/*!40000 ALTER TABLE `cm_course_set_offering_assoc_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_course_set_offering_assoc_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_cross_listing_t`
--

DROP TABLE IF EXISTS `cm_cross_listing_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cm_cross_listing_t` (
  `CROSS_LISTING_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `LAST_MODIFIED_BY` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED_DATE` date DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `CREATED_DATE` date DEFAULT NULL,
  PRIMARY KEY (`CROSS_LISTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_cross_listing_t`
--

LOCK TABLES `cm_cross_listing_t` WRITE;
/*!40000 ALTER TABLE `cm_cross_listing_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_cross_listing_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_enrollment_set_t`
--

DROP TABLE IF EXISTS `cm_enrollment_set_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cm_enrollment_set_t` (
  `ENROLLMENT_SET_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `LAST_MODIFIED_BY` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED_DATE` date DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `CREATED_DATE` date DEFAULT NULL,
  `ENTERPRISE_ID` varchar(255) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `CATEGORY` varchar(255) NOT NULL,
  `DEFAULT_CREDITS` varchar(255) NOT NULL,
  `COURSE_OFFERING` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ENROLLMENT_SET_ID`),
  UNIQUE KEY `UK_b5uvnlltlu7do85daxg1y8eaj` (`ENTERPRISE_ID`),
  KEY `CM_ENR_SET_CO_IDX` (`COURSE_OFFERING`),
  CONSTRAINT `FK_dgy7vhqacafcxvc7qtawqyyqh` FOREIGN KEY (`COURSE_OFFERING`) REFERENCES `cm_member_container_t` (`MEMBER_CONTAINER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_enrollment_set_t`
--

LOCK TABLES `cm_enrollment_set_t` WRITE;
/*!40000 ALTER TABLE `cm_enrollment_set_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_enrollment_set_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_enrollment_t`
--

DROP TABLE IF EXISTS `cm_enrollment_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cm_enrollment_t` (
  `ENROLLMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `LAST_MODIFIED_BY` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED_DATE` date DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `CREATED_DATE` date DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `STATUS` varchar(255) NOT NULL,
  `CREDITS` varchar(255) NOT NULL,
  `GRADING_SCHEME` varchar(255) NOT NULL,
  `DROPPED` bit(1) DEFAULT NULL,
  `DROP_DATE` date DEFAULT NULL,
  `ENROLLMENT_SET` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ENROLLMENT_ID`),
  UNIQUE KEY `CM_ENR` (`USER_ID`,`ENROLLMENT_SET`),
  KEY `CM_ENR_USER` (`USER_ID`),
  KEY `CM_ENR_ENR_SET_IDX` (`ENROLLMENT_SET`),
  CONSTRAINT `FK_278m722w54cv8jod0p9blhbjk` FOREIGN KEY (`ENROLLMENT_SET`) REFERENCES `cm_enrollment_set_t` (`ENROLLMENT_SET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_enrollment_t`
--

LOCK TABLES `cm_enrollment_t` WRITE;
/*!40000 ALTER TABLE `cm_enrollment_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_enrollment_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_meeting_t`
--

DROP TABLE IF EXISTS `cm_meeting_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cm_meeting_t` (
  `MEETING_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LOCATION` varchar(255) DEFAULT NULL,
  `START_TIME` time DEFAULT NULL,
  `FINISH_TIME` time DEFAULT NULL,
  `NOTES` varchar(255) DEFAULT NULL,
  `MONDAY` bit(1) DEFAULT NULL,
  `TUESDAY` bit(1) DEFAULT NULL,
  `WEDNESDAY` bit(1) DEFAULT NULL,
  `THURSDAY` bit(1) DEFAULT NULL,
  `FRIDAY` bit(1) DEFAULT NULL,
  `SATURDAY` bit(1) DEFAULT NULL,
  `SUNDAY` bit(1) DEFAULT NULL,
  `SECTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`MEETING_ID`),
  KEY `FK_ffjd8qtfikjfpovmjvmrbeh5s` (`SECTION_ID`),
  CONSTRAINT `FK_ffjd8qtfikjfpovmjvmrbeh5s` FOREIGN KEY (`SECTION_ID`) REFERENCES `cm_member_container_t` (`MEMBER_CONTAINER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_meeting_t`
--

LOCK TABLES `cm_meeting_t` WRITE;
/*!40000 ALTER TABLE `cm_meeting_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_meeting_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_member_container_t`
--

DROP TABLE IF EXISTS `cm_member_container_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cm_member_container_t` (
  `MEMBER_CONTAINER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_DISCR` varchar(100) NOT NULL,
  `VERSION` int(11) NOT NULL,
  `LAST_MODIFIED_BY` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED_DATE` date DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `CREATED_DATE` date DEFAULT NULL,
  `ENTERPRISE_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `CROSS_LISTING` bigint(20) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `CANONICAL_COURSE` bigint(20) DEFAULT NULL,
  `ACADEMIC_SESSION` bigint(20) DEFAULT NULL,
  `CATEGORY` varchar(255) DEFAULT NULL,
  `PARENT_COURSE_SET` bigint(20) DEFAULT NULL,
  `COURSE_OFFERING` bigint(20) DEFAULT NULL,
  `ENROLLMENT_SET` bigint(20) DEFAULT NULL,
  `PARENT_SECTION` bigint(20) DEFAULT NULL,
  `MAXSIZE` int(11) DEFAULT NULL,
  PRIMARY KEY (`MEMBER_CONTAINER_ID`),
  UNIQUE KEY `CM_EID_IDX` (`CLASS_DISCR`,`ENTERPRISE_ID`),
  KEY `CM_CO_CANON_COURSE_IDX` (`CANONICAL_COURSE`),
  KEY `CM_CO_ACADEMIC_SESS_IDX` (`ACADEMIC_SESSION`),
  KEY `CM_COURSE_SET_PARENT_IDX` (`PARENT_COURSE_SET`),
  KEY `CM_SECTION_COURSE_IDX` (`COURSE_OFFERING`),
  KEY `CM_SECTION_ENR_SET_IDX` (`ENROLLMENT_SET`),
  KEY `CM_SECTION_PARENT_IDX` (`PARENT_SECTION`),
  KEY `FK_8du4i7b4xshoib203tnvdx7do` (`CROSS_LISTING`),
  CONSTRAINT `FK_gj14xhtoo27t2nafshudneg2d` FOREIGN KEY (`PARENT_SECTION`) REFERENCES `cm_member_container_t` (`MEMBER_CONTAINER_ID`),
  CONSTRAINT `FK_1sd6ij4812mrc9xe1dmvbrhur` FOREIGN KEY (`ENROLLMENT_SET`) REFERENCES `cm_enrollment_set_t` (`ENROLLMENT_SET_ID`),
  CONSTRAINT `FK_4pjq8hn1re3le3su32383ghb0` FOREIGN KEY (`COURSE_OFFERING`) REFERENCES `cm_member_container_t` (`MEMBER_CONTAINER_ID`),
  CONSTRAINT `FK_8du4i7b4xshoib203tnvdx7do` FOREIGN KEY (`CROSS_LISTING`) REFERENCES `cm_cross_listing_t` (`CROSS_LISTING_ID`),
  CONSTRAINT `FK_lkt4rrac7cd3wtp4tv1sia8ds` FOREIGN KEY (`PARENT_COURSE_SET`) REFERENCES `cm_member_container_t` (`MEMBER_CONTAINER_ID`),
  CONSTRAINT `FK_ny54bo8hado25uw76tikm94qr` FOREIGN KEY (`CANONICAL_COURSE`) REFERENCES `cm_member_container_t` (`MEMBER_CONTAINER_ID`),
  CONSTRAINT `FK_rdkbv2bq9sp8cyyu8shpgbq4q` FOREIGN KEY (`ACADEMIC_SESSION`) REFERENCES `cm_academic_session_t` (`ACADEMIC_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_member_container_t`
--

LOCK TABLES `cm_member_container_t` WRITE;
/*!40000 ALTER TABLE `cm_member_container_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_member_container_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_membership_t`
--

DROP TABLE IF EXISTS `cm_membership_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cm_membership_t` (
  `MEMBER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `ROLE` varchar(255) NOT NULL,
  `MEMBER_CONTAINER_ID` bigint(20) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MEMBER_ID`),
  UNIQUE KEY `CM_MBR` (`USER_ID`,`MEMBER_CONTAINER_ID`),
  KEY `CM_MBR_USER` (`USER_ID`),
  KEY `CM_MBR_CTR` (`MEMBER_CONTAINER_ID`),
  CONSTRAINT `FK_fcpglc865uvmrvmlb6uchhrss` FOREIGN KEY (`MEMBER_CONTAINER_ID`) REFERENCES `cm_member_container_t` (`MEMBER_CONTAINER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_membership_t`
--

LOCK TABLES `cm_membership_t` WRITE;
/*!40000 ALTER TABLE `cm_membership_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_membership_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_official_instructors_t`
--

DROP TABLE IF EXISTS `cm_official_instructors_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cm_official_instructors_t` (
  `ENROLLMENT_SET_ID` bigint(20) NOT NULL,
  `INSTRUCTOR_ID` varchar(255) DEFAULT NULL,
  UNIQUE KEY `ES_INSTR` (`ENROLLMENT_SET_ID`,`INSTRUCTOR_ID`),
  KEY `CM_INSTR_IDX` (`INSTRUCTOR_ID`),
  KEY `CM_ENR_SET_INSTR_IDX` (`INSTRUCTOR_ID`),
  CONSTRAINT `FK_6y2ae14cpau9in0e9klih90n2` FOREIGN KEY (`ENROLLMENT_SET_ID`) REFERENCES `cm_enrollment_set_t` (`ENROLLMENT_SET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_official_instructors_t`
--

LOCK TABLES `cm_official_instructors_t` WRITE;
/*!40000 ALTER TABLE `cm_official_instructors_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_official_instructors_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_sec_category_t`
--

DROP TABLE IF EXISTS `cm_sec_category_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cm_sec_category_t` (
  `CAT_CODE` varchar(255) NOT NULL,
  `CAT_DESCR` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CAT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_sec_category_t`
--

LOCK TABLES `cm_sec_category_t` WRITE;
/*!40000 ALTER TABLE `cm_sec_category_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_sec_category_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmn_type_t`
--

DROP TABLE IF EXISTS `cmn_type_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cmn_type_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `LAST_MODIFIED_BY` varchar(36) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(36) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `AUTHORITY` varchar(100) NOT NULL,
  `DOMAIN` varchar(100) NOT NULL,
  `KEYWORD` varchar(100) NOT NULL,
  `DISPLAY_NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CMN_TYPE_T_TUPLE_I` (`AUTHORITY`,`DOMAIN`,`KEYWORD`),
  UNIQUE KEY `UK_2p0cjpjwgndvs41lhrpof8qqu` (`UUID`),
  KEY `CMN_TYPE_T_AUTHORITY_I` (`AUTHORITY`),
  KEY `CMN_TYPE_T_DOMAIN_I` (`DOMAIN`),
  KEY `CMN_TYPE_T_KEYWORD_I` (`KEYWORD`),
  KEY `CMN_TYPE_T_DISPLAY_NAME_I` (`DISPLAY_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmn_type_t`
--

LOCK TABLES `cmn_type_t` WRITE;
/*!40000 ALTER TABLE `cmn_type_t` DISABLE KEYS */;
INSERT INTO `cmn_type_t` VALUES (1,0,'d7f6f20a-5267-49ad-81dc-17ec83bae3ff','SYSTEM','2019-05-16 09:43:10','SYSTEM','2019-05-16 09:43:10','org.sakaiproject','api.common.edu.person','SakaiPerson.recordType.systemMutable','System Mutable SakaiPerson','System Mutable SakaiPerson'),(2,0,'0f3e9a10-b353-4079-a9ab-d2207bfb37d2','SYSTEM','2019-05-16 09:43:10','SYSTEM','2019-05-16 09:43:10','org.sakaiproject','api.common.edu.person','SakaiPerson.recordType.userMutable','User Mutable SakaiPerson','User Mutable SakaiPerson'),(3,0,'08d526e6-5489-4100-8e12-2f2c4acf6ee5','SYSTEM','2019-05-16 09:43:11','SYSTEM','2019-05-16 09:43:11','org.sakaiproject.component.app.messageforums','sakai_messageforums','Owner Permission Level','Owner Permission Level','Owner Permission Level'),(4,0,'50428c58-b445-4d38-a062-872344357557','SYSTEM','2019-05-16 09:43:12','SYSTEM','2019-05-16 09:43:12','org.sakaiproject.component.app.messageforums','sakai_messageforums','Author Permission Level','Author Permission Level','Author Permission Level'),(5,0,'482c5e44-6b30-42de-922f-aa06ff968a41','SYSTEM','2019-05-16 09:43:12','SYSTEM','2019-05-16 09:43:12','org.sakaiproject.component.app.messageforums','sakai_messageforums','Nonediting Author Permission Level','Nonediting Author Permission Level','Nonediting Author Permission Level'),(6,0,'6c914874-3c21-482b-a2f7-197279568279','SYSTEM','2019-05-16 09:43:12','SYSTEM','2019-05-16 09:43:12','org.sakaiproject.component.app.messageforums','sakai_messageforums','Reviewer Permission Level','Reviewer Permission Level','Reviewer Permission Level'),(7,0,'49901e76-abc3-44ff-8d29-1437af3ce03f','SYSTEM','2019-05-16 09:43:12','SYSTEM','2019-05-16 09:43:12','org.sakaiproject.component.app.messageforums','sakai_messageforums','Contributor Permission Level','Contributor Permission Level','Contributor Permission Level'),(8,0,'890b2302-516a-4c38-a2e2-517296a0ada5','SYSTEM','2019-05-16 09:43:12','SYSTEM','2019-05-16 09:43:12','org.sakaiproject.component.app.messageforums','sakai_messageforums','None Permission Level','None Permission Level','None Permission Level'),(9,0,'7d35fb70-841a-48eb-a413-47fc786338d5','SYSTEM','2019-05-16 09:43:12','SYSTEM','2019-05-16 09:43:12','org.sakaiproject.component.app.messageforums','sakai_messageforums','Custom Permission Level','Custom Permission Level','Custom Permission Level');
/*!40000 ALTER TABLE `cmn_type_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commons_comment`
--

DROP TABLE IF EXISTS `commons_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commons_comment` (
  `ID` char(36) NOT NULL,
  `POST_ID` char(36) DEFAULT NULL,
  `CONTENT` mediumtext NOT NULL,
  `CREATOR_ID` varchar(99) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `creator_id` (`CREATOR_ID`),
  KEY `post_id` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commons_comment`
--

LOCK TABLES `commons_comment` WRITE;
/*!40000 ALTER TABLE `commons_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `commons_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commons_commons`
--

DROP TABLE IF EXISTS `commons_commons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commons_commons` (
  `ID` char(36) NOT NULL,
  `SITE_ID` varchar(99) NOT NULL,
  `EMBEDDER` varchar(24) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commons_commons`
--

LOCK TABLES `commons_commons` WRITE;
/*!40000 ALTER TABLE `commons_commons` DISABLE KEYS */;
/*!40000 ALTER TABLE `commons_commons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commons_commons_post`
--

DROP TABLE IF EXISTS `commons_commons_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commons_commons_post` (
  `COMMONS_ID` char(36) DEFAULT NULL,
  `POST_ID` char(36) DEFAULT NULL,
  UNIQUE KEY `commons_id_post_id` (`COMMONS_ID`,`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commons_commons_post`
--

LOCK TABLES `commons_commons_post` WRITE;
/*!40000 ALTER TABLE `commons_commons_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `commons_commons_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commons_post`
--

DROP TABLE IF EXISTS `commons_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commons_post` (
  `ID` char(36) NOT NULL,
  `CONTENT` mediumtext NOT NULL,
  `CREATOR_ID` varchar(99) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` datetime NOT NULL,
  `RELEASE_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `creator_id` (`CREATOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commons_post`
--

LOCK TABLES `commons_post` WRITE;
/*!40000 ALTER TABLE `commons_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `commons_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_collection`
--

DROP TABLE IF EXISTS `content_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `content_collection` (
  `COLLECTION_ID` varchar(255) NOT NULL,
  `IN_COLLECTION` varchar(255) DEFAULT NULL,
  `XML` longtext,
  `BINARY_ENTITY` blob,
  UNIQUE KEY `CONTENT_COLLECTION_INDEX` (`COLLECTION_ID`),
  KEY `CONTENT_IN_COLLECTION_INDEX` (`IN_COLLECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_collection`
--

LOCK TABLES `content_collection` WRITE;
/*!40000 ALTER TABLE `content_collection` DISABLE KEYS */;
INSERT INTO `content_collection` VALUES ('/','',NULL,_binary 'CHSBCE\0\0\0\0\0\0\n\0/\0%org.sakaiproject.content.types.folder\0	inherited\0\0\0\0����������������\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0d\0\0\0\0\0\0e\0CHEF:is-collection\0true\0\0\0e\0CHEF:modifiedby\0admin\0\0\0e\0DAV:displayname\0root\0\0\0e\0DAV:creationdate\020020401000000000\0\0\0e\0CHEF:creator\0admin\0\0\0e\0DAV:getlastmodified\020020401000000000\0\0\0'),('/attachment/','/',NULL,_binary 'CHSBCE\0\0\0\0\0\0\n\0/attachment/\0%org.sakaiproject.content.types.folder\0	inherited\0\0\0\0����������������\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0d\0\0\0\0\0\0e\0CHEF:is-collection\0true\0\0\0e\0CHEF:modifiedby\0admin\0\0\0e\0DAV:displayname\0\nattachment\0\0\0e\0DAV:creationdate\020020401000000000\0\0\0e\0CHEF:creator\0admin\0\0\0e\0DAV:getlastmodified\020020401000000000\0\0\0'),('/group-user/','/',NULL,_binary 'CHSBCE\0\0\0\0\0\0\n\0/group-user/\0%org.sakaiproject.content.types.folder\0	inherited\0\0\0\0����������������\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0d\0\0\0\0\0\0e\0CHEF:is-collection\0true\0\0\0e\0CHEF:modifiedby\0admin\0\0\0e\0DAV:displayname\0\ngroup-user\0\0\0e\0DAV:creationdate\020020401000000000\0\0\0e\0CHEF:creator\0admin\0\0\0e\0DAV:getlastmodified\020020401000000000\0\0\0'),('/group/','/',NULL,_binary 'CHSBCE\0\0\0\0\0\0\n\0/group/\0%org.sakaiproject.content.types.folder\0	inherited\0\0\0\0����������������\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0d\0\0\0\0\0\0e\0CHEF:is-collection\0true\0\0\0e\0CHEF:modifiedby\0admin\0\0\0e\0DAV:displayname\0group\0\0\0e\0DAV:creationdate\020020401000000000\0\0\0e\0CHEF:creator\0admin\0\0\0e\0DAV:getlastmodified\020020401000000000\0\0\0'),('/private/','/',NULL,_binary 'CHSBCE\0\0\0\0\0\0\n\0	/private/\0%org.sakaiproject.content.types.folder\0	inherited\0\0\0\0����������������\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0d\0\0\0\0\0\0e\0CHEF:is-collection\0true\0\0\0e\0CHEF:modifiedby\0admin\0\0\0e\0DAV:displayname\0private\0\0\0e\0DAV:creationdate\020020401000000000\0\0\0e\0CHEF:creator\0admin\0\0\0e\0DAV:getlastmodified\020020401000000000\0\0\0'),('/public/','/',NULL,_binary 'CHSBCE\0\0\0\0\0\0\n\0/public/\0%org.sakaiproject.content.types.folder\0	inherited\0\0\0\0����������������\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0d\0\0\0\0\0\0e\0CHEF:is-collection\0true\0\0\0e\0CHEF:modifiedby\0admin\0\0\0e\0DAV:displayname\0public\0\0\0e\0DAV:creationdate\020020401000000000\0\0\0e\0CHEF:creator\0admin\0\0\0e\0DAV:getlastmodified\020020401000000000\0\0\0'),('/user/','/',NULL,_binary 'CHSBCE\0\0\0\0\0\0\n\0/user/\0%org.sakaiproject.content.types.folder\0	inherited\0\0\0\0����������������\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0d\0\0\0\0\0\0e\0CHEF:is-collection\0true\0\0\0e\0CHEF:modifiedby\0admin\0\0\0e\0DAV:displayname\0user\0\0\0e\0DAV:creationdate\020020401000000000\0\0\0e\0CHEF:creator\0admin\0\0\0e\0DAV:getlastmodified\020020401000000000\0\0\0');
/*!40000 ALTER TABLE `content_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_dropbox_changes`
--

DROP TABLE IF EXISTS `content_dropbox_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `content_dropbox_changes` (
  `DROPBOX_ID` varchar(255) NOT NULL,
  `IN_COLLECTION` varchar(255) DEFAULT NULL,
  `LAST_UPDATE` varchar(24) DEFAULT NULL,
  UNIQUE KEY `CONTENT_DROPBOX_CI` (`DROPBOX_ID`),
  KEY `CONTENT_DROPBOX_II` (`IN_COLLECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_dropbox_changes`
--

LOCK TABLES `content_dropbox_changes` WRITE;
/*!40000 ALTER TABLE `content_dropbox_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_dropbox_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_resource`
--

DROP TABLE IF EXISTS `content_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `content_resource` (
  `RESOURCE_ID` varchar(255) NOT NULL,
  `RESOURCE_UUID` varchar(36) DEFAULT NULL,
  `IN_COLLECTION` varchar(255) DEFAULT NULL,
  `CONTEXT` varchar(99) DEFAULT NULL,
  `FILE_PATH` varchar(128) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `RESOURCE_TYPE_ID` varchar(255) DEFAULT NULL,
  `XML` longtext,
  `BINARY_ENTITY` blob,
  UNIQUE KEY `CONTENT_RESOURCE_INDEX` (`RESOURCE_ID`),
  KEY `CONTENT_IN_RESOURCE_INDEX` (`IN_COLLECTION`),
  KEY `CONTENT_RESOURCE_CI` (`CONTEXT`),
  KEY `CONTENT_UUID_RESOURCE_INDEX` (`RESOURCE_UUID`),
  KEY `CONTENT_RESOURCE_RTI` (`RESOURCE_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_resource`
--

LOCK TABLES `content_resource` WRITE;
/*!40000 ALTER TABLE `content_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_resource_bb_delete`
--

DROP TABLE IF EXISTS `content_resource_bb_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `content_resource_bb_delete` (
  `RESOURCE_ID` varchar(255) NOT NULL,
  `BODY` longblob,
  UNIQUE KEY `CONTENT_RESOURCE_BB_DEL_INDEX` (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_resource_bb_delete`
--

LOCK TABLES `content_resource_bb_delete` WRITE;
/*!40000 ALTER TABLE `content_resource_bb_delete` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_resource_bb_delete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_resource_body_binary`
--

DROP TABLE IF EXISTS `content_resource_body_binary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `content_resource_body_binary` (
  `RESOURCE_ID` varchar(255) NOT NULL,
  `BODY` longblob,
  UNIQUE KEY `CONTENT_RESOURCE_BB_INDEX` (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_resource_body_binary`
--

LOCK TABLES `content_resource_body_binary` WRITE;
/*!40000 ALTER TABLE `content_resource_body_binary` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_resource_body_binary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_resource_delete`
--

DROP TABLE IF EXISTS `content_resource_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `content_resource_delete` (
  `RESOURCE_ID` varchar(255) NOT NULL,
  `RESOURCE_UUID` varchar(36) DEFAULT NULL,
  `IN_COLLECTION` varchar(255) DEFAULT NULL,
  `CONTEXT` varchar(99) DEFAULT NULL,
  `FILE_PATH` varchar(128) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `RESOURCE_TYPE_ID` varchar(255) DEFAULT NULL,
  `DELETE_DATE` datetime DEFAULT NULL,
  `DELETE_USERID` varchar(36) DEFAULT NULL,
  `XML` longtext,
  `BINARY_ENTITY` blob,
  UNIQUE KEY `CONTENT_RESOURCE_UUID_DELETE_I` (`RESOURCE_UUID`),
  KEY `CONTENT_RESOURCE_DELETE_INDEX` (`RESOURCE_ID`),
  KEY `CONTENT_RESOURCE_DELETE_COLLECTION` (`IN_COLLECTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_resource_delete`
--

LOCK TABLES `content_resource_delete` WRITE;
/*!40000 ALTER TABLE `content_resource_delete` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_resource_delete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_resource_lock`
--

DROP TABLE IF EXISTS `content_resource_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `content_resource_lock` (
  `id` varchar(36) NOT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `asset_id` varchar(36) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_removed` datetime DEFAULT NULL,
  `qualifier_id` varchar(36) DEFAULT NULL,
  `reason` varchar(36) DEFAULT NULL,
  `is_system` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_resource_lock`
--

LOCK TABLES `content_resource_lock` WRITE;
/*!40000 ALTER TABLE `content_resource_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_resource_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_type_registry`
--

DROP TABLE IF EXISTS `content_type_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `content_type_registry` (
  `CONTEXT_ID` varchar(99) NOT NULL,
  `RESOURCE_TYPE_ID` varchar(255) DEFAULT NULL,
  `ENABLED` varchar(1) DEFAULT NULL,
  KEY `content_type_registry_idx` (`CONTEXT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_type_registry`
--

LOCK TABLES `content_type_registry` WRITE;
/*!40000 ALTER TABLE `content_type_registry` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_type_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentreview_item`
--

DROP TABLE IF EXISTS `contentreview_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contentreview_item` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `PROVIDERID` int(11) NOT NULL,
  `CONTENTID` varchar(255) NOT NULL,
  `USERID` varchar(255) DEFAULT NULL,
  `SITEID` varchar(255) DEFAULT NULL,
  `TASKID` varchar(255) DEFAULT NULL,
  `EXTERNALID` varchar(255) DEFAULT NULL,
  `DATEQUEUED` datetime NOT NULL,
  `DATESUBMITTED` datetime DEFAULT NULL,
  `DATEREPORTRECEIVED` datetime DEFAULT NULL,
  `STATUS` bigint(20) DEFAULT NULL,
  `REVIEWSCORE` int(11) DEFAULT NULL,
  `LASTERROR` longtext,
  `RETRYCOUNT` bigint(20) DEFAULT NULL,
  `NEXTRETRYTIME` datetime NOT NULL,
  `ERRORCODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_8dngr1v68kkv4u11c1nvrjj1l` (`PROVIDERID`,`CONTENTID`),
  KEY `contentreview_provider_id_idx` (`PROVIDERID`,`EXTERNALID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentreview_item`
--

LOCK TABLES `contentreview_item` WRITE;
/*!40000 ALTER TABLE `contentreview_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentreview_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentreview_item_properties`
--

DROP TABLE IF EXISTS `contentreview_item_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contentreview_item_properties` (
  `CONTENTREVIEW_ITEM_ID` bigint(20) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `PROPERTY` varchar(255) NOT NULL,
  PRIMARY KEY (`CONTENTREVIEW_ITEM_ID`,`PROPERTY`),
  CONSTRAINT `FK_ruimjpe6ye7gth3b569i3bww7` FOREIGN KEY (`CONTENTREVIEW_ITEM_ID`) REFERENCES `contentreview_item` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentreview_item_properties`
--

LOCK TABLES `contentreview_item_properties` WRITE;
/*!40000 ALTER TABLE `contentreview_item_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentreview_item_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `context_mapping`
--

DROP TABLE IF EXISTS `context_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `context_mapping` (
  `uuid` varchar(255) NOT NULL,
  `componentId` varchar(255) DEFAULT NULL,
  `contextId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `UK_6251goqeqi0wrlavx0jdpsq5r` (`componentId`,`contextId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `context_mapping`
--

LOCK TABLES `context_mapping` WRITE;
/*!40000 ALTER TABLE `context_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `context_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_template_item`
--

DROP TABLE IF EXISTS `email_template_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `email_template_item` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LAST_MODIFIED` datetime NOT NULL,
  `OWNER` varchar(255) NOT NULL,
  `SUBJECT` longtext NOT NULL,
  `emailfrom` varchar(255) DEFAULT NULL,
  `MESSAGE` longtext NOT NULL,
  `HTMLMESSAGE` longtext,
  `TEMPLATE_KEY` varchar(255) NOT NULL,
  `TEMPLATE_LOCALE` varchar(255) DEFAULT NULL,
  `defaultType` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EMAIL_TEMPLATE_ITEM_KEY_LOCALE_KEY` (`TEMPLATE_KEY`,`TEMPLATE_LOCALE`),
  KEY `email_templ_owner` (`OWNER`),
  KEY `email_templ_key` (`TEMPLATE_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template_item`
--

LOCK TABLES `email_template_item` WRITE;
/*!40000 ALTER TABLE `email_template_item` DISABLE KEYS */;
INSERT INTO `email_template_item` VALUES (1,'2019-05-16 09:43:07','admin','Welcome To ${localSakaiName}!',NULL,'You have been invited to one or more sites in ${localSakaiName}.\n\nAccept this invitation:\n\n${url}\n\nWhat is ${localSakaiName}?\n${localSakaiName} is the ${institution}\'s web-based learning management system. It is home to many course sites, \nas well as a host of other sites including those used for administration, research and project groups, libraries, \nand student societies. As a guest user, you have been invited to join a ${localSakaiName} site. On the site, you \nwill have rights to read content. You may also be able to create and/or edit content (depending on your assigned role).\n\nWhat if I already have a ${localSakaiName} account?\nIf you have used ${localSakaiName} in the past, then you already have an account on ${localSakaiName}.\nWe strongly suggest that you accept the above invitation and then\ntransfer your memberships to your existing ${localSakaiName} account. This\nwill help prevent you from having multiple accounts, each with a different set of\nassociated sites.\n\nIf you do not choose to associate this site with an existing account, \na new guest account will be activated for you, and its login ID will be ${userEid}. \nAfterwards, you may log in to ${localSakaiName} using ${userEid} as your login ID and its associated password. ','<p>You have been invited to one or more sites in ${localSakaiName}.</p>\n\n<p><a href=\"${url}\">Accept this invitation</a></p>\n\n<h2>What is ${localSakaiName}?</h2>\n<p>${localSakaiName} is the ${institution}\'s web-based learning management system. It is home to many course sites, \nas well as a host of other sites including those used for administration, research and project groups, libraries, \nand student societies. As a guest user, you have been invited to join a ${localSakaiName} site. On the site, you will \nhave rights to read content but you also may be able to create and/or edit content (depending on your assigned role).</p>\n\n<h2>What if I already have a ${localSakaiName} account?</h2>\n<p>If you have used ${localSakaiName} in the past, then you already have an account on ${localSakaiName}.\nWe strongly suggest that you accept the above invitation and then\ntransfer your memberships to your existing ${localSakaiName} account. This\nwill help prevent you from having multiple accounts, each with a different set of\nassociated sites. </p>\n\n<p>If you do not choose to associate this site with an existing account, \na new guest account will be activated for you, and its login ID will be ${userEid}. \nAfterwards you may log in to ${localSakaiName} using ${userEid} as your login ID and its associated password. </p>','validate.newUser','default',NULL,1),(2,'2019-05-16 09:43:07','admin','Please Validate your ${localSakaiName} Account',NULL,'Dear ${displayName},\n\nYou currently have a guest account on ${localSakaiName} with access to the following sites:\n\n${memberSites}\n\nIf you still require access to these sites using your current login details ${userEid}, \nor if you would like to access these sites through your staff/student account or another guest, please follow this link to: ${url}\n\nIf you no longer require access to ${localSakaiName} using this login, simply ignore this email and your account will be deactivated. \nIf you wish to reactivate your account, please contact ${localSupportMail}.\n\n*Please note*: Accounts that have been deactivated for longer than 90 days will be deleted.\n\n		','<p>Dear ${displayName}<p>\n\n<p>You currently have a guest account on ${localSakaiName} with access to the following sites: <br/>\n\n${memberSites}\n</p>\n\n<p>If you still require access to these sites using your current login details ${userEid}, or if you would like to access these sites through your staff/student account or another guest, please follow this <a href=\"${url}\">link</a></p>\n\n</p>If you no longer require access to ${localSakaiName} using this login, simply ignore this email and your account will be deactivated. If you wish to reactivate your account, please contact ${supportemail} </p>\n\n<p><strong>Please note</strong>: Accounts that have been deactivated for longer than 90 days will be deleted.</p>','validate.existinguser','default',NULL,1),(3,'2019-05-16 09:43:07','admin','Please verify your details for ${localSakaiName}',NULL,'\nDear ${displayName},	\n\n${addedBy} (${addedByEmail}) invited you to join ${localSakaiName}.\n\nPlease confirm your details on ${url}\n\nWhat is ${localSakaiName}?\n${localSakaiName} is the ${institution}\'s web-based learning management system. It is home to many course sites, as well as a host of other sites including those \nused for administration, research and project groups, libraries, and student societies. As a guest user, you have been invited to join a ${localSakaiName} site. \nOn the site you will have rights to read content but you also may be able to create and/or edit content (depending on your assigned role).\n\nWhat if I already have another ${localSakaiName} account?\nIf you have used ${localSakaiName} with another ${localSakaiName} account, we strongly suggest that you accept the above invitation and then\nindicate which existing ${localSakaiName} account you wish to use to access this site. This will avoid you having multiple accounts, each with a different set of\nassociated sites. If you do not choose to associate this site with an existing account, a new guest account will be created for you using this email\naddress. In the future, login to ${localSakaiName} using the guest account username and its associated password.\n		','','validate.legacyuser','default',NULL,1),(4,'2019-05-16 09:43:07','admin','${localSakaiName}: Password Reset Request',NULL,'\n		You have requested to reset the password for your ${localSakaiName} account (${userEid}).\n		\n		Please use the following link to reset your password on ${localSakaiName}:\n		\n		${url}\n		\n		For security purposes, this link is only valid for ${expireTime} from the time of request.\n\n		If you did not request this change, please ignore this message.\n		\n		Regards,\n		\n		The ${localSakaiName} Administrators\n		${institution}\n		','','validate.passwordreset','default',NULL,1),(5,'2019-05-16 09:43:07','admin','Please Validate your ${localSakaiName} Account',NULL,'Dear ${displayName},\n\n			You have an account on ${localSakaiName} and have recently updated your Email address to ${newUserId}.\n\n			In order to make accessing  ${localSakaiName} as easy possible, your username will be updated to match this new email address. If you are happy with the change then please follow this ${url} to complete the process.\n			If you do not wish to change your username to match your email address then simply ignore this email, however, we would *strongly* recommend that you do *not* follow this course of action.\n\n			If you have any questions about this then please contact ${localSupportMail}.\n			*Please note*: Accounts that have been deactivated for longer than 90 days will be deleted.\n\n		','<p>Dear ${displayName}<p>\n\n<p>You have an account on ${localSakaiName} and have recently updated your Email address to ${newUserId} <br/>\n			\n</p>\n\n<p>In order to make accessing  ${localSakaiName} as easy possible, your username will be updated to match this new email address. If you are happy with the change then please follow this <a href=\"${url}\">link</a></p> to complete the process.\n\n</p>If you do not wish to change your username to match your email address then simply ignore this email, however, we would *strongly* recommend that you do *not* follow this course of action.If you have any questions about this then please contact ${localSupportMail} </p>\n\n<p><strong>Please note</strong>: Accounts that have been deactivated for longer than 90 days will be deleted.</p>','validate.userId.update','default',NULL,1),(6,'2019-05-16 09:43:07','admin','${localSakaiName}: Deleted accounts',NULL,'\nDear ${creatorName},\n\nThe following accounts that you have invited to join ${localSakaiName} have not been validated after ${deleteDays} days.\n\n${userList}\n\nThe expired accounts have been removed from ${localSakaiName}. If you still wish for these individuals to access ${localSakaiName}, please invite them again. \n\nRegards,\n\nThe ${localSakaiName} Administrators\n${institution}\n        ','','validate.deleted','default',NULL,1),(7,'2019-05-16 09:43:07','admin','Welcome To ${localSakaiName}!',NULL,'Thank you for requesting an account for ${localSakaiName}, ${institution}\'s learning management system. You\'re almost done!\n\nTo create an account, click on the following link or paste it into your favourite web browser, and fill in the form.\n${url}\n\nIf you haven\'t requested this account, you can safely ignore this message.\n        ','','validate.requestAccount','default',NULL,1),(8,'2019-05-16 09:43:07','admin','${localSakaiName}: Your password has been changed successfully',NULL,'Your password for ${localSakaiName} has been changed successfully. If you did not change your password, please contact ${emailSupport}\n','','acknowledge.passwordReset','default',NULL,1),(9,'2019-05-16 09:43:11','admin','${senderDisplayName} sent you a message on ${localSakaiName}',NULL,'${senderDisplayName} sent you a message on ${localSakaiName}\n\n--------------------\n${messageSubject}\n\n${messageBody}\n--------------------\n\nTo view this message, follow the link below:\n${messageLink}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\nControl what email notifications you receive from connections at Home > ${toolName} > Preferences\n	','${senderDisplayName} sent you a message on ${localSakaiName}\n<p>\n--------------------\n<br />${messageSubject}\n<br />\n<br />${messageBody}\n<br />--------------------\n</p>\n\n<p>To view this message, follow the link below:\n<br /><a href=\"${messageLink}\">${messageLink}</a>\n</p>\n\n<p>\n---\n<br />This automatic notification message was sent by <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Control what email notifications you receive from connections at Home > ${toolName} > Preferences\n</p>\n	','profile2.messageNew','default',NULL,3),(10,'2019-05-16 09:43:11','admin','${senderDisplayName} replied to your message on ${localSakaiName}',NULL,'${senderDisplayName} replied to your message on ${localSakaiName}\n\n--------------------\n${messageSubject}\n\n${messageBody}\n--------------------\n\nTo view this message, follow the link below:\n${messageLink}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\nControl what email notifications you receive from connections at Home > ${toolName} > Preferences\n	','${senderDisplayName} replied to your message on ${localSakaiName}\n<p>\n--------------------\n<br />${messageSubject}\n<br />\n<br />${messageBody}\n<br />--------------------\n</p>\n\n<p>To view this message, follow the link below:\n<br /><a href=\"${messageLink}\">${messageLink}</a>\n</p>\n\n<p>\n---\n<br />This automatic notification message was sent by <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Control what email notifications you receive from connections at Home > ${toolName} > Preferences\n</p>\n	','profile2.messageReply','default',NULL,3),(11,'2019-05-16 09:43:11','admin','${senderDisplayName} added you as a connection on ${localSakaiName}',NULL,'${senderDisplayName} added you as a connection on ${localSakaiName}\n\nTo confirm ${senderDisplayName}\'s connection request, follow the url below:\n${connectionLink}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\nControl what email notifications you receive from connections at Home > ${toolName} > Preferences\n	','${senderDisplayName} added you as a connection on ${localSakaiName}\n<p>\nTo confirm ${senderDisplayName}\'s connection request, follow the url below:\n<br /><a href=\"${connectionLink}\">${connectionLink}</a>\n</p>\n<p>\n---\n<br />This automatic notification message was sent by <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Control what email notifications you receive from connections at Home > ${toolName} > Preferences\n</p>\n	','profile2.connectionRequest','default',NULL,2),(12,'2019-05-16 09:43:11','admin','${senderDisplayName} confirmed your connection request on ${localSakaiName}',NULL,'${senderDisplayName} confirmed your connection request on ${localSakaiName}\n\nTo view ${senderDisplayName}\'s profile, follow the url below:\n${connectionLink}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\nControl what email notifications you receive from connections at Home > ${toolName} > Preferences\n	','${senderDisplayName} confirmed your connection request on ${localSakaiName}\n<p>\nTo view ${senderDisplayName}\'s profile, follow the url below:\n<br /><a href=\"${connectionLink}\">${connectionLink}</a>\n</p>\n<p>\n---\n<br />This automatic notification message was sent by <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Control what email notifications you receive from connections at Home > ${toolName} > Preferences\n</p>\n	','profile2.connectionConfirm','default',NULL,2),(13,'2019-05-16 09:43:11','admin','${senderDisplayName} added activity to their profile wall on ${localSakaiName}',NULL,'${senderDisplayName} added activity to their profile wall on ${localSakaiName}\n\nTo view their wall, follow the link below:\n${senderWallLink}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\nControl what email notifications you receive from connections at Home > ${toolName} > Preferences\n	','${senderDisplayName} added activity to their profile wall on ${localSakaiName}\n<p>\nTo view their wall, follow the link below:\n<br /><a href=\"${senderWallLink}\">${senderWallLink}</a>\n</p>\n<p>\n---\n<br />This automatic notification message was sent by <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Control what email notifications you receive from connections at Home > ${toolName} > Preferences\n</p>\n	','profile2.wallEventNew','default',NULL,2),(14,'2019-05-16 09:43:11','admin','${senderDisplayName} has just posted to your profile wall on ${localSakaiName}',NULL,'${senderDisplayName} has just posted to your profile wall on ${localSakaiName}\n\nTo view your wall, follow the link below:\n${wallLink}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\nControl what email notifications you receive from connections at Home > ${toolName} > Preferences\n	','${senderDisplayName} has just posted to your profile wall on ${localSakaiName}\n<p>\nTo view your wall, follow the link below:\n<br /><a href=\"${wallLink}\">${wallLink}</a>\n</p>\n<p>\n---\n<br />This automatic notification message was sent by <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Control what email notifications you receive from connections at Home > ${toolName} > Preferences\n</p>\n	','profile2.wallPostMyWallNew','default',NULL,2),(15,'2019-05-16 09:43:11','admin','${senderDisplayName} has just posted to their profile wall on ${localSakaiName}',NULL,'${senderDisplayName} has just posted to their profile wall on ${localSakaiName}\n\nTo view ${senderDisplayName}\'s wall, follow the link below:\n${senderWallLink}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\nControl what email notifications you receive from connections at Home > ${toolName} > Preferences\n	','${senderDisplayName} has just posted to their profile wall on ${localSakaiName}\n<p>\nTo view ${senderDisplayName}\'s wall, follow the link below:\n<br /><a href=\"${senderWallLink}\">${senderWallLink}</a>\n</p>\n<p>\n---\n<br />This automatic notification message was sent by <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Control what email notifications you receive from connections at Home > ${toolName} > Preferences\n</p>\n	','profile2.wallPostConnectionWallNew','default',NULL,2),(16,'2019-05-16 09:43:11','admin','${senderDisplayName}\'s new status was posted on their profile wall on ${localSakaiName}',NULL,'${senderDisplayName}\'s new status was posted on their profile wall on ${localSakaiName}\n\nTo view their wall, follow the link below:\n${senderWallLink}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\nControl what email notifications you receive from connections at Home > ${toolName} > Preferences\n	','${senderDisplayName}\'s new status was posted on their profile wall on ${localSakaiName}\n<p>\nTo view their wall, follow the link below:\n<br /><a href=\"${senderWallLink}\">${senderWallLink}</a>\n</p>\n<p>\n---\n<br />This automatic notification message was sent by <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Control what email notifications you receive from connections at Home > ${toolName} > Preferences\n</p>\n	','profile2.wallStatusNew','default',NULL,2),(17,'2019-05-16 09:43:11','admin','${senderDisplayName} has created the new \'${worksiteTitle}\' worksite',NULL,'${senderDisplayName} has created the new \'${worksiteTitle}\' worksite for you to collaborate on ${localSakaiName}\n\nTo access the worksite, follow the link below:\n${worksiteLink}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\nControl what email notifications you receive from connections at Home > ${toolName} > Preferences\n	','${senderDisplayName} has created the new \'${worksiteTitle}\' worksite for you to collaborate on ${localSakaiName}\n<p>\nTo access the worksite, follow the link below:\n<br /><a href=\"${worksiteLink}\">${worksiteLink}</a>\n</p>\n<p>\n---\n<br />This automatic notification message was sent by <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Control what email notifications you receive from connections at Home > ${toolName} > Preferences\n</p>\n	','profile2.worksiteNew','default',NULL,2),(18,'2019-05-16 09:43:11','admin','${userDisplayName} changed their profile on ${localSakaiName}',NULL,'${userDisplayName} changed their profile on ${localSakaiName}\n\nTo view ${userDisplayName}\'s profile, follow the url below:\n${profileLink}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\n	','${userDisplayName} changed their profile on ${localSakaiName}\n<p>\nTo view ${userDisplayName}\'s profile, follow the url below:\n<br /><a href=\"${profileLink}\">${profileLink}</a>\n</p>\n<p>\n---\n<br />This automatic notification message was sent by <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n</p>\n	','profile2.profileChangeNotification','default',NULL,1),(19,'2019-05-16 09:43:11','admin','${senderDisplayName} 从${localSakaiName}给您发送了一条消息',NULL,'${senderDisplayName} 从${localSakaiName}给您发送了一条消息\n\n--------------------\n${messageSubject}\n\n${messageBody}\n--------------------\n\n您可以通过下面的链接查看此消息：\n${messageLink}\n\n---\n此邮件由 ${localSakaiName} (${localSakaiUrl})自动发送。\n您可以在“我的工作空间” > “${toolName}” > “偏好设置” 中设定您希望接收的邮件类型。\n	','${senderDisplayName} 从${localSakaiName}给您发送了一条消息\n<p>\n--------------------\n<br />${messageSubject}\n<br />\n<br />${messageBody}\n<br />--------------------\n</p>\n\n<p>您可以通过下面的链接查看此消息：\n<br />${messageLink}\n</p>\n\n<p>\n---\n<br />此邮件由 ${localSakaiName} (${localSakaiUrl})自动发送。\n<br />您可以在“我的工作空间” > “${toolName}” > “偏好设置” 中设定您希望接收的邮件类型。\n</p>\n	','profile2.messageNew','zh_CN',NULL,1),(20,'2019-05-16 09:43:11','admin','${senderDisplayName} 在 ${localSakaiName} 回复了您的消息',NULL,'${senderDisplayName} 在 ${localSakaiName} 回复了您的消息\n\n--------------------\n${messageSubject}\n\n${messageBody}\n--------------------\n\n您可以通过下面的链接查看此消息：\n${messageLink}\n\n---\n此邮件由 ${localSakaiName} (${localSakaiUrl})自动发送。\n您可以在“我的工作空间” > “${toolName}” > “偏好设置” 中设定您希望接收的邮件类型。\n	','${senderDisplayName} 在 ${localSakaiName} 回复了您的消息\n<p>\n--------------------\n<br />${messageSubject}\n<br />\n<br />${messageBody}\n<br />--------------------\n</p>\n\n<p>您可以通过下面的链接查看此消息：\n<br />${messageLink}\n</p>\n\n<p>\n---\n<br />此邮件由 ${localSakaiName} (${localSakaiUrl})自动发送。\n<br />您可以在“我的工作空间” > “${toolName}” > “偏好设置” 中设定您希望接收的邮件类型。\n</p>\n	','profile2.messageReply','zh_CN',NULL,1),(21,'2019-05-16 09:43:11','admin','${senderDisplayName} 请求在 ${localSakaiName} 加您为好友',NULL,'${senderDisplayName} 请求在 ${localSakaiName} 加您为好友\n\n您可以通过下面的链接来确认 ${senderDisplayName} 的好友请求：\n${connectionLink}\n\n---\n此邮件由 ${localSakaiName} (${localSakaiUrl})自动发送。\n您可以在“我的工作空间” > “${toolName}” > “偏好设置” 中设定您希望接收的邮件类型。\n	','${senderDisplayName} 请求在 ${localSakaiName} 加您为好友\n<p>\n您可以通过下面的链接来确认 ${senderDisplayName} 的好友请求：\n<br />${connectionLink}\n</p>\n<p>\n---\n<br />此邮件由 ${localSakaiName} (${localSakaiUrl})自动发送。\n<br />您可以在“我的工作空间” > “${toolName}” > “偏好设置” 中设定您希望接收的邮件类型。\n</p>\n	','profile2.connectionRequest','zh_CN',NULL,1),(22,'2019-05-16 09:43:11','admin','${senderDisplayName} 同意了您在 ${localSakaiName} 的好友请求',NULL,'${senderDisplayName} 同意了您在 ${localSakaiName} 的好友请求\n\n您可以通过下面的链接查看 ${senderDisplayName} 的基本信息：\n${connectionLink}\n\n---\n此邮件由 ${localSakaiName} (${localSakaiUrl})自动发送。\n您可以在“我的工作空间” > “${toolName}” > “偏好设置” 中设定您希望接收的邮件类型。\n	','${senderDisplayName} 同意了您在 ${localSakaiName} 的好友请求\n<p>\n您可以通过下面的链接查看 ${senderDisplayName} 的基本信息：\n<br />${connectionLink}\n</p>\n<p>\n---\n<br />此邮件由 ${localSakaiName} (${localSakaiUrl})自动发送。\n<br />您可以在“我的工作空间” > “${toolName}” > “偏好设置” 中设定您希望接收的邮件类型。\n</p>\n	','profile2.connectionConfirm','zh_CN',NULL,1),(23,'2019-05-16 09:43:11','admin','${senderDisplayName} har skickat ett meddelande till dig i ${localSakaiName}',NULL,'${senderDisplayName} har skickat ett meddelande till dig i ${localSakaiName}\n\n--------------------\n${messageSubject}\n\n${messageBody}\n--------------------\n\nFör att visa detta meddelande, följ länken nedan:\n${messageLink}\n\n---\nDetta är ett automatiskt meddelande som skickades från ${localSakaiName} (${localSakaiUrl})\nÄndra dina inställningar för dessa meddelanden på Min arbetsyta > ${toolName} > Inställningar\n	','${senderDisplayName} har skickat ett meddelande till dig i ${localSakaiName}\n<p>\n--------------------\n<br />${messageSubject}\n<br />\n<br />${messageBody}\n<br />--------------------\n</p>\n\n<p>För att visa detta meddelande, följ länken nedan:\n<br />${messageLink}\n</p>\n\n<p>\n---\n<br />Detta är ett automatiskt meddelande som skickades från ${localSakaiName} (${localSakaiUrl})\n<br />Ändra dina inställningar för dessa meddelanden på Min arbetsyta > ${toolName} > Inställningar\n</p>\n	','profile2.messageNew','sv_SE',NULL,1),(24,'2019-05-16 09:43:11','admin','${senderDisplayName} har svarat på ditt meddelande i ${localSakaiName}',NULL,'${senderDisplayName} har svarat på ditt meddelande i ${localSakaiName}\n\n--------------------\n${messageSubject}\n\n${messageBody}\n--------------------\n\nFör att visa meddelandet, följ länken nedan:\n${messageLink}\n\n---\nDetta är ett automatiskt meddelande som skickades från ${localSakaiName} (${localSakaiUrl})\nÄndra dina inställningar för dessa meddelanden på Min arbetsyta > ${toolName} > Inställningar\n	','${senderDisplayName} har svarat på ditt meddelande i ${localSakaiName}\n<p>\n--------------------\n<br />${messageSubject}\n<br />\n<br />${messageBody}\n<br />--------------------\n</p>\n\n<p>För att visa meddelandet, följ länken nedan:\n<br />${messageLink}\n</p>\n\n<p>\n---\n<br />Detta är ett automatiskt meddelande som skickades från ${localSakaiName} (${localSakaiUrl})\n<br />Ändra dina inställningar för dessa meddelanden på Min arbetsyta > ${toolName} > Inställningar\n</p>\n	','profile2.messageReply','sv_SE',NULL,1),(25,'2019-05-16 09:43:11','admin','${senderDisplayName} har lagt till dig som kontakt i ${localSakaiName}',NULL,'${senderDisplayName} har lagt till dig som kontakt i ${localSakaiName}\n\nFör att godkänna förfrågan från ${senderDisplayName}, följ länken nedan:\n${connectionLink}\n\n---\nDetta är ett automatiskt meddelande som skickades från ${localSakaiName} (${localSakaiUrl})\nÄndra dina inställningar för dessa meddelanden på Min arbetsyta > ${toolName} > Inställningar\n	','${senderDisplayName} har lagt till dig som kontakt i ${localSakaiName}\n<p>\nFör att godkänna förfrågan från ${senderDisplayName}, följ länken nedan:\n<br />${connectionLink}\n</p>\n<p>\n---\n<br />Detta är ett automatiskt meddelande som skickades från ${localSakaiName} (${localSakaiUrl})\n<br />Ändra dina inställningar för dessa meddelanden på Min arbetsyta > ${toolName} > Inställningar\n</p>\n	','profile2.connectionRequest','sv_SE',NULL,1),(26,'2019-05-16 09:43:11','admin','${senderDisplayName} godkände din kontaktförfrågan i ${localSakaiName}',NULL,'${senderDisplayName} godkände din kontaktförfrågan i ${localSakaiName}\n\nFör att se profilen för ${senderDisplayName}, följ länken nedan:\n${connectionLink}\n\n---\nDetta är ett automatiskt meddelande som skickades från ${localSakaiName} (${localSakaiUrl})\nÄndra dina inställningar för dessa meddelanden på Min arbetsyta > ${toolName} > Inställningar\n	','${senderDisplayName} godkände din kontaktförfrågan i ${localSakaiName}\n<p>\nFör att se profilen för ${senderDisplayName}, följ länken nedan:\n<br />${connectionLink}\n</p>\n<p>\n---\n<br />Detta är ett automatiskt meddelande som skickades från ${localSakaiName} (${localSakaiUrl})\n<br />Ändra dina inställningar för dessa meddelanden på Min arbetsyta > ${toolName} > Inställningar\n</p>\n	','profile2.connectionConfirm','sv_SE',NULL,1),(27,'2019-05-16 09:43:11','admin','${senderDisplayName} le ha enviado un mensaje en ${localSakaiName}',NULL,'${senderDisplayName} le ha enviado un mensaje en ${localSakaiName}\n\n--------------------\n${messageSubject}\n\n${messageBody}\n--------------------\n\nPara acceder al mensaje completo, puede hacer clic en el siguiente enlace:\n${messageLink}\n\n---\nEste mensaje de notificación automática ha sido enviado por ${localSakaiName} (${localSakaiUrl})\nSi desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n	','${senderDisplayName} le ha enviado un mensaje en ${localSakaiName}\n<p>\n--------------------\n<br />${messageSubject}\n<br />\n<br />${messageBody}\n<br />--------------------\n</p>\n\n<p>Para acceder al mensaje completo, puede hacer clic en el siguiente enlace:\n<br /><a href=\"${messageLink}\">${messageLink}</a>\n</p>\n\n<p>\n---\n<br />Este mensaje de notificación automática ha sido enviado por <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Si desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n</p>\n	','profile2.messageNew','es_ES',NULL,3),(28,'2019-05-16 09:43:11','admin','${senderDisplayName} ha contestado a su mensaje en ${localSakaiName}',NULL,'${senderDisplayName} ha contestado a su mensaje en ${localSakaiName}\n\n--------------------\n${messageSubject}\n\n${messageBody}\n--------------------\n\nPara acceder al mensaje completo, puede hacer clic en el siguiente enlace:\n${messageLink}\n\n---\nEste mensaje de notificación automática ha sido enviado por ${localSakaiName} (${localSakaiUrl})\nSi desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n	','${senderDisplayName} ha contestado a su mensaje en ${localSakaiName}\n<p>\n--------------------\n<br />${messageSubject}\n<br />\n<br />${messageBody}\n<br />--------------------\n</p>\n\n<p>Para acceder al mensaje completo, puede hacer clic en el siguiente enlace:\n<br /><a href=\"${messageLink}\">${messageLink}</a>\n</p>\n\n<p>\n---\n<br />Este mensaje de notificación automática ha sido enviado por <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Si desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n</p>\n	','profile2.messageReply','es_ES',NULL,3),(29,'2019-05-16 09:43:11','admin','${senderDisplayName} ha solicitado ser su contacto en ${localSakaiName}',NULL,'${senderDisplayName} ha solicitado ser su contacto en ${localSakaiName}\n\nPara confirmar la petición de contacto de ${senderDisplayName}, puede hacer clic en el siguiente enlace:\n${connectionLink}\n\n---\nEste mensaje de notificación automática ha sido enviado por ${localSakaiName} (${localSakaiUrl})\nSi desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n	','${senderDisplayName} ha solicitado ser su contacto en ${localSakaiName}\n<p>\nPara confirmar la petición de contacto de ${senderDisplayName}, puede hacer clic en el siguiente enlace:\n<br /><a href=\"${connectionLink}\">${connectionLink}</a>\n</p>\n<p>\n---\n<br />Este mensaje de notificación automática ha sido enviado por <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Si desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n</p>\n	','profile2.connectionRequest','es_ES',NULL,2),(30,'2019-05-16 09:43:11','admin','${senderDisplayName} ha confirmado su petición de contacto en ${localSakaiName}',NULL,'${senderDisplayName} ha confirmado su petición de contacto en ${localSakaiName}\n\nPara acceder al perfil del usuario ${senderDisplayName}, puede hacer clic en el siguiente enlace:\n${connectionLink}\n\n---\nEste mensaje de notificación automática ha sido enviado por ${localSakaiName} (${localSakaiUrl})\nSi desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n	','${senderDisplayName} ha confirmado su petición de contacto en ${localSakaiName}\n<p>\nPara acceder al perfil del usuario ${senderDisplayName}, puede hacer clic en el siguiente enlace:\n<br /><a href=\"${connectionLink}\">${connectionLink}</a>\n</p>\n<p>\n---\n<br />Este mensaje de notificación automática ha sido enviado por <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Si desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n</p>\n	','profile2.connectionConfirm','es_ES',NULL,2),(31,'2019-05-16 09:43:11','admin','${senderDisplayName} ha actualizado información de su perfil en ${localSakaiName}',NULL,'${senderDisplayName} ha actualizado información de su perfil en ${localSakaiName}\n\nPara acceder a su muro puede hacer clic en el siguiente enlace:\n${senderWallLink}\n\n---\nEste mensaje de notificación automática ha sido enviado por ${localSakaiName} (${localSakaiUrl})\nSi desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n	','${senderDisplayName} ha actualizado información de su perfil en ${localSakaiName}\n<p>\nPara acceder a su muro puede hacer clic en el siguiente enlace:\n<br /><a href=\"${senderWallLink}\">${senderWallLink}</a>\n</p>\n<p>\n---\n<br />Este mensaje de notificación automática ha sido enviado por <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Si desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n</p>\n	','profile2.wallEventNew','es_ES',NULL,2),(32,'2019-05-16 09:43:11','admin','${senderDisplayName} ha publicado un comentario en tu muro en ${localSakaiName}',NULL,'${senderDisplayName} ha publicado un comentario en tu muro en ${localSakaiName}\n\nPara acceder a tu muro puede hacer clic en el siguiente enlace:\n${wallLink}\n\n---\nEste mensaje de notificación automática ha sido enviado por ${localSakaiName} (${localSakaiUrl})\nSi desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n	','${senderDisplayName} ha publicado un comentario en tu muro en ${localSakaiName}\n<p>\nPara acceder a tu muro puede hacer clic en el siguiente enlace:\n<br /><a href=\"${wallLink}\">${wallLink}</a>\n</p>\n<p>\n---\n<br />Este mensaje de notificación automática ha sido enviado por <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Si desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n</p>\n	','profile2.wallPostMyWallNew','es_ES',NULL,2),(33,'2019-05-16 09:43:11','admin','${senderDisplayName} ha escrito en su muro en ${localSakaiName}',NULL,'${senderDisplayName} ha escrito en su muro en ${localSakaiName}\n\nPara acceder al muro de ${senderDisplayName}, puede hacer clic en el siguiente enlace:\n${senderWallLink}\n\n---\nEste mensaje de notificación automática ha sido enviado por ${localSakaiName} (${localSakaiUrl})\nSi desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n	','${senderDisplayName} ha escrito en su muro en ${localSakaiName}\n<p>\nPara acceder al muro de ${senderDisplayName}, puede hacer clic en el siguiente enlace:\n<br /><a href=\"${senderWallLink}\">${senderWallLink}</a>\n</p>\n<p>\n---\n<br />Este mensaje de notificación automática ha sido enviado por <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Si desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n</p>\n	','profile2.wallPostConnectionWallNew','es_ES',NULL,2),(34,'2019-05-16 09:43:11','admin','${senderDisplayName} ha publicado una nueva actualización en su muro en ${localSakaiName}',NULL,'${senderDisplayName}ha publicado una nueva actualización en su muro en ${localSakaiName}\n\nPara acceder a su muro puede hacer clic en el siguiente enlace:\n${senderWallLink}\n\n---\nEste mensaje de notificación automática ha sido enviado por ${localSakaiName} (${localSakaiUrl})\nSi desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n	','${senderDisplayName} ha publicado una nueva actualización en su muro en ${localSakaiName}\n<p>\nPara acceder a su muro puede hacer clic en el siguiente enlace:\n<br /><a href=\"${senderWallLink}\">${senderWallLink}</a>\n</p>\n<p>\n---\n<br />Este mensaje de notificación automática ha sido enviado por <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Si desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n</p>\n	','profile2.wallStatusNew','es_ES',NULL,2),(35,'2019-05-16 09:43:11','admin','${senderDisplayName} ha creado el nuevo sitio de trabajo: \'${worksiteTitle}\'',NULL,'${senderDisplayName} ha creado el nuevo sitio de trabajo \'${worksiteTitle}\' para que colaboréis en ${localSakaiName}\n\nPara acceder al nuevo sitio de trabajo puedes hacer clic en el siguiente enlace:\n${worksiteLink}\n\n---\nEste mensaje de notificación automática ha sido enviado por ${localSakaiName} (${localSakaiUrl})\nSi desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n	','${senderDisplayName} ha creado el nuevo sitio de trabajo \'${worksiteTitle}\' para que colaboréis en ${localSakaiName}\n<p>\nPara acceder al nuevo sitio de trabajo puedes hacer clic en el siguiente enlace:\n<br /><a href=\"${worksiteLink}\">${worksiteLink}</a>\n</p>\n<p>\n---\n<br />Este mensaje de notificación automática ha sido enviado por <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Si desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n</p>\n	','profile2.worksiteNew','es_ES',NULL,2),(36,'2019-05-16 09:43:11','admin','${userDisplayName} ha modificado su perfil en ${localSakaiName}',NULL,'${userDisplayName} ha modificado su perfil en ${localSakaiName}\n\nPara acceder al perfil de ${userDisplayName} puede hacer clic en el siguiente enlace:\n${profileLink}\n\n---\nEste mensaje de notificación automática ha sido enviado por ${localSakaiName} (${localSakaiUrl})\nSi desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n	','${userDisplayName} ha modificado su perfil en ${localSakaiName}\n<p>\nPara acceder al perfil de ${userDisplayName} puede hacer clic en el siguiente enlace:\n<br /><a href=\"${profileLink}\">${profileLink}</a>\n</p>\n<p>\n---\n<br />Este mensaje de notificación automática ha sido enviado por <a href=\"${localSakaiUrl}\">${localSakaiName}</a>\n<br />Si desea modificar las opciones de notificación, acceda a Mi Sitio > ${toolName} > Preferencias\n</p>\n	','profile2.profileChangeNotification','es_ES',NULL,1),(37,'2019-05-16 09:43:19','admin','[${localSakaiName}] A poll option you voted for has been deleted',NULL,'Dear ${recipientFirstName},\n\n		The poll option you voted for in the site \'${siteTitle}\' has been deleted\n		by a poll maintainer. The poll question is:\n\n		${pollQuestion}\n\n		Please log in to ${localSakaiName} and place a new vote for the poll.\n	','Dear ${recipientFirstName},\n<br />\n<br />\n		The poll option you voted for in the site \'${siteTitle}\' has been deleted\n		by a poll maintainer. The poll question is:\n<br />\n<br />\n		${pollQuestion}\n<br />\n<br />\n		Please log in to ${localSakaiName} and place a new vote for the poll.\n<br />\n	','polls.notifyDeletedOption','default',NULL,2),(38,'2019-05-16 09:43:19','admin','[${localSakaiName}] 您所参与的调查中，您选择的选项被删除了',NULL,'${recipientDisplayName}，您好：\n\n此前您在 “${siteTitle}” 参与的调查 “${pollQuestion}” 中所选择的选项已被删除。\n\n请您登录 ${localSakaiName} 重新选择。\n	','${recipientDisplayName}，您好：\n<br />\n<br />\n此前您在 “${siteTitle}” 参与的调查 “${pollQuestion}” 中所选择的选项已被删除。\n<br />\n<br />\n请您登录 ${localSakaiName} 重新选择。\n	','polls.notifyDeletedOption','zh_CN',NULL,2),(39,'2019-05-16 09:43:23','admin','${localSakaiName} Site Notification',NULL,'\n			Dear ${userName},\n\n				${currentUserName} added you to the following ${localSakaiName} site:\n					${siteName}\n\n			<#if newNonOfficialAccount == \"true\" >\n			<#if hasNonOfficialAccountUrl == \"true\" >\n				To get a guest account, follow the steps on ${nonOfficialAccountUrl}\n\n			</#if>\n				Once you have your guest account, you can log into ${localSakaiName}:\n\n					1. Visit ${localSakaiName}: ${localSakaiURL}\n					2. In the top right corner of the page, type your guest account user id and password into the login fields, and click the \"Log In\" button.\n					3. Once you\'re logged in, find this site using these steps:\n						a. click the \"Sites\" link in the top right corner, then\n						b. type the site name in the provided search field\n					4. Click on the name of the site that appears to visit it\n\n			<#else>\n				To log in:\n\n					1. Open ${localSakaiName}: ${localSakaiURL}\n					2. In the top right corner of the page, type your user id and password into the login fields, and click the \"Log In\" button.\n					3. Once you\'re logged in, find this site using these steps:\n						a. click the \"Sites\" link in the top right corner, then\n						b. type the site name in the provided search field\n					4. Click on the name of the site that appears to visit it\n			</#if>\n		','','sitemange.notifyAddedParticipant','default',NULL,1),(40,'2019-05-16 09:43:23','admin','${localSakaiName} New User Notification ',NULL,'Dear ${userName},\n\n An account on ${localSakaiName} (${localSakaiURL}) has been created for you by ${currentUserDisplayName}. To access your account:\n\n	1) Go to:\n		${localSakaiURL}\n	\n	2) Login using:\n		User Id: 	${userEid}\n		password: 	${newPassword} \n You can change your password after you have logged in, using the Account tool in your Home.\n \n (This is an automated message from ${localSakaiName}.)\n','','sitemanage.notifyNewUserEmail','default',NULL,1),(41,'2019-05-16 09:43:23','admin','${templateSiteId}: copied by ${currentUserDisplayName}',NULL,'Dear Template Maintainer:\n \nCongratulations!\n \nThe following user just created a new site based on your template.\n \nTemplate Name: ${templateSiteTitle}\nUser:          ${currentUserDisplayName} (${currentUserDisplayId})\nDate:          ${currentDate}\nNew Site Id:   ${newSiteId}\nNew Site Title: ${newSiteTitle}\n \nCheers,\n \nAlliance Team\n\n','','sitemanage.notifyTemplateUse','default',NULL,1),(42,'2019-05-16 09:43:23','admin','Site Request from ${currentUserDisplayName} for ${termTitle} ',NULL,'\nHello, \n\nYou are receiving this message at the recommendation of ${currentUserDisplayName}, who has requested an official course website for the following class(es):\n\n${termTitle}\n\n${requestSectionInfo}\n\nSite title:	${siteTitle}\nSite id:	${siteId}\n\nSpecial Instruction:\n${specialInstruction}\n\nAccording to our data sources, ${currentUserDisplayName} is not the instructor of record. Can you verify that ${currentUserDisplayName} is associated with the class(es) listed above?\n\nPlease respond to this message with information about ${currentUserDisplayName}\'s appointment and the legitimacy of this site request. If you feel unable to respond, please forward this message to a departmental contact with the authority to approve or deny the request.\n\nThank you,\n${serverName} Support Team\n\n','','sitemanage.notifyCourseRequestAuthorizer','default',NULL,1),(43,'2019-05-16 09:43:23','admin','Site Request from ${currentUserDisplayName} for ${termTitle}',NULL,'\n \nYour request is being processed. You will receive email when the class roster has been added to your site. In the meantime, you can continue with the site setup process and add course materials to your site.\n\nThis is a copy of the Course Site request that you made.\n\n${supportEmailContent}\n\nIf you wish to provide additional information, please send email to ${requestEmail}.\n\n','','sitemanage.notifyCourseRequestRequester','default',NULL,1),(44,'2019-05-16 09:43:23','admin','Site Request from ${currentUserDisplayName} for ${termTitle} ',NULL,'\nTo:		${serverName} Support\n\nFrom:	${currentUserDisplayName}\nSubj:	Site Request\nDate:	${dateDisplay}\n\nI am requesting approval of a ${serverName} Course Site for  ${termTitle} for this section:\n\n${requestSectionInfo}\n\nName:	${currentUserDisplayName} (uniqname ${currentUserDisplayId})\nEmail:	${currentUserEmail}\n\nSite title:	${siteTitle}\nSite id:	${siteId}\n\nSpecial Instruction:\n${specialInstruction}\n\n<#if requireAuthorizer=\"true\">\n	<#if authorizerNotified !=\"\">\n		The site request authorization email has been sent successfully to username ${authorizerNotified} as requested.\n	</#if>\n	<#if authorizerNotNotified !=\"\">\n		The site request authorization email could not be sent to username ${authorizerNotNotified} as requested.\n	</#if>\n</#if>\n','','sitemanage.notifyCourseRequestSupport','default',NULL,1),(45,'2019-05-16 09:43:23','admin','Site Created by ${currentUserDisplayName}',NULL,'\n \nFrom Worksite Setup to ${serviceName} support:\n\n<#if courseSite =\"true\">Official Course Site<#else>Site </#if> ${siteTitle} (ID ${siteId}) was set up by ${currentUserDisplayName} (${currentUserDisplayId}, email ${currentUserEmail}) on ${dateDisplay} <#if courseSite =\"true\">for ${termTitle} </#if>\n<#if numSections = \"1\">with access to the roster for this section:<#elseif numSections != \"0\">with access to rosters for these ${numSections} sections:</#if>\n\n${sections}\n\n','','sitemanage.notifySiteCreation','default',NULL,1),(46,'2019-05-16 09:43:23','admin','Site \"${siteTitle}\" was successfully created by ${currentUserDisplayName}',NULL,'\n \nHi, ${currentUserDisplayName}:\n\nYour site \"${siteTitle}\" has been successfully created. The following is a copy of the site creation notification email sent to ${serviceName} support:\n\n\nFrom Worksite Setup to ${serviceName} support:\n\n<#if courseSite =\"true\">Official Course Site<#else>Site </#if> ${siteTitle} (ID ${siteId}) was set up by ${currentUserDisplayName} (${currentUserDisplayId}, email ${currentUserEmail}) on ${dateDisplay} <#if courseSite =\"true\">for ${termTitle} </#if>\n<#if numSections = \"1\">with access to the roster for this section:<#elseif numSections != \"0\">with access to rosters for these ${numSections} sections:</#if>\n\n${sections}\n\n','','sitemanage.notifySiteCreation.confirmation','default',NULL,1),(47,'2019-05-16 09:43:23','admin','${localSakaiName} Site import completed for \"${worksiteName}\"',NULL,'The import process you started for \"${worksiteName}\" has completed.\n\nVisit the site to view the imported materials:\n\n${linkToWorksite}\n		\nRegards,\n		\nThe ${localSakaiName} Administrators\n${institution}\n','','sitemanage.siteImport.Confirmation','en',NULL,1),(48,'2019-05-16 09:43:23','admin','${localSakaiName} Importación del sitio completada para \"${worksiteName}\"',NULL,'El proceso de importación que usted comenzó para el sitio \"${worksiteName}\" ha sido completado.\n\nPor favor, visite el sitio para ver los materiales importados:\n\n${linkToWorksite}\n		\nAtentamente,\n		\nLos Administradores de ${localSakaiName}\n${institution}\n','','sitemanage.siteImport.Confirmation','es',NULL,1),(49,'2019-05-16 09:43:24','admin','Notification for assessment submission: ${siteName} - ${assessmentTitle}',NULL,'The following assessment submission was recorded by ${localSakaiName}:\n\n    Site Title          : ${siteName}\n    Assessment          : ${assessmentTitle}\n\n    Student             : ${userName} (${userDisplayID})\n    Submission ID       : ${assessmentGradingID}\n    Submitted on        : ${submissionDate}\n    Confirmation Number : ${confirmationNumber}\n\n    Assessment Due Date : ${assessmentDueDate}\n    Site ID             : ${siteID}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\n${changeSettingInstructions}\n        ','<pre>\nThe following assessment submission was recorded by ${localSakaiName}:\n\n    Site Title          : ${siteName}\n    Assessment          : ${assessmentTitle}\n\n    Student             : ${userName} (${userDisplayID})\n    Submission ID       : ${assessmentGradingID}\n    Submitted Date      : ${submissionDate}\n    Confirmation Number : ${confirmationNumber}\n\n    Assessment Due Date : ${assessmentDueDate}\n    Site ID             : ${siteID}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\n${changeSettingInstructions}\n</pre>','sam.assessmentSubmitted','default',NULL,1),(50,'2019-05-16 09:43:24','admin','Notification for assessment auto submission: ${siteName} - ${assessmentTitle}',NULL,'The following assessment auto submission was recorded by ${localSakaiName}:\n\n    Site Title          : ${siteName}\n    Assessment          : ${assessmentTitle}\n\n    Student             : ${userName} (${userDisplayID})\n    Submission ID       : ${assessmentGradingID}\n    Submitted on        : ${submissionDate}\n    Confirmation Number : ${confirmationNumber}\n\n    Assessment Due Date : ${assessmentDueDate}\n    Site ID             : ${siteID}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\n${changeSettingInstructions}\n        ','<pre>\nThe following assessment auto submission was recorded by ${localSakaiName}:\n\n    Site Title          : ${siteName}\n    Assessment          : ${assessmentTitle}\n\n    Student             : ${userName} (${userDisplayID})\n    Submission ID       : ${assessmentGradingID}\n    Submitted Date      : ${submissionDate}\n    Confirmation Number : ${confirmationNumber}\n\n    Assessment Due Date : ${assessmentDueDate}\n    Site ID             : ${siteID}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\n${changeSettingInstructions}\n</pre>','sam.assessmentAutoSubmitted','default',NULL,1),(51,'2019-05-16 09:43:24','admin','Notification for timed assessment submission: ${siteName} - ${assessmentTitle}',NULL,'The timer has expired and the following timed assessment has been automatically submitted:\n\n    Site Title          : ${siteName}\n    Assessment          : ${assessmentTitle}\n\n    Student             : ${userName} (${userDisplayID})\n    Submission ID       : ${assessmentGradingID}\n    Submitted on        : ${submissionDate}\n    Confirmation Number : ${confirmationNumber}\n\n    Assessment Due Date : ${assessmentDueDate}\n    Site ID             : ${siteID}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\n${changeSettingInstructions}\n        ','<pre>\nThe timer has expired and the following timed assessment has been automatically submitted:\n\n    Site Title          : ${siteName}\n    Assessment          : ${assessmentTitle}\n\n    Student             : ${userName} (${userDisplayID})\n    Submission ID       : ${assessmentGradingID}\n    Submitted Date      : ${submissionDate}\n    Confirmation Number : ${confirmationNumber}\n\n    Assessment Due Date : ${assessmentDueDate}\n    Site ID             : ${siteID}\n\n---\nThis automatic notification message was sent by ${localSakaiName} (${localSakaiUrl})\n${changeSettingInstructions}\n</pre>','sam.assessmentTimedSubmitted','default',NULL,1),(52,'2019-05-16 09:43:24','admin','AutoSubmit Job Failure Notice',NULL,'The AutoSubmit job encountered errors during processing and had to skip ${failureCount} attempts/submissions. The remaining attempts/submissions were processed successfully.\n\nManual intervention may be required to correct these issues. For further details, see the logs.\n        ','<p>The AutoSubmit job encountered errors during processing and had to skip ${failureCount} attempts/submissions. The remaining attempts/submissions were processed successfully.</p>\n			\n<p>Manual intervention may be required to correct these issues. For further details, see the logs.</p>','sam.assessmentAutoSubmitErrors','default',NULL,1);
/*!40000 ALTER TABLE `email_template_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_properties`
--

DROP TABLE IF EXISTS `entity_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entityRef` varchar(255) NOT NULL,
  `entityPrefix` varchar(255) NOT NULL,
  `propertyName` varchar(255) NOT NULL,
  `propertyValue` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entityRef` (`entityRef`,`entityPrefix`,`propertyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_properties`
--

LOCK TABLES `entity_properties` WRITE;
/*!40000 ALTER TABLE `entity_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_tag_applications`
--

DROP TABLE IF EXISTS `entity_tag_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_tag_applications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entityRef` varchar(255) NOT NULL,
  `entityPrefix` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entityRef` (`entityRef`,`entityPrefix`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_tag_applications`
--

LOCK TABLES `entity_tag_applications` WRITE;
/*!40000 ALTER TABLE `entity_tag_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_tag_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_category_t`
--

DROP TABLE IF EXISTS `gb_category_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_category_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `GRADEBOOK_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `WEIGHT` double DEFAULT NULL,
  `DROP_LOWEST` int(11) DEFAULT NULL,
  `REMOVED` bit(1) DEFAULT NULL,
  `IS_EXTRA_CREDIT` bit(1) DEFAULT NULL,
  `IS_EQUAL_WEIGHT_ASSNS` bit(1) DEFAULT NULL,
  `IS_UNWEIGHTED` bit(1) DEFAULT NULL,
  `CATEGORY_ORDER` int(11) DEFAULT NULL,
  `ENFORCE_POINT_WEIGHTING` bit(1) DEFAULT NULL,
  `DROP_HIGHEST` int(11) DEFAULT NULL,
  `KEEP_HIGHEST` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_4v5nb30ku00m6vrcud7x2wlo2` (`GRADEBOOK_ID`),
  CONSTRAINT `FK_4v5nb30ku00m6vrcud7x2wlo2` FOREIGN KEY (`GRADEBOOK_ID`) REFERENCES `gb_gradebook_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_category_t`
--

LOCK TABLES `gb_category_t` WRITE;
/*!40000 ALTER TABLE `gb_category_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_category_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_comment_t`
--

DROP TABLE IF EXISTS `gb_comment_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_comment_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `GRADER_ID` varchar(255) NOT NULL,
  `STUDENT_ID` varchar(255) NOT NULL,
  `COMMENT_TEXT` longtext,
  `DATE_RECORDED` datetime NOT NULL,
  `GRADABLE_OBJECT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `G_O_STUDENT` (`STUDENT_ID`,`GRADABLE_OBJECT_ID`),
  KEY `FK_qgwt5tqaic6kfql5i9ycpxl1x` (`GRADABLE_OBJECT_ID`),
  CONSTRAINT `FK_qgwt5tqaic6kfql5i9ycpxl1x` FOREIGN KEY (`GRADABLE_OBJECT_ID`) REFERENCES `gb_gradable_object_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_comment_t`
--

LOCK TABLES `gb_comment_t` WRITE;
/*!40000 ALTER TABLE `gb_comment_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_comment_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_gradable_object_t`
--

DROP TABLE IF EXISTS `gb_gradable_object_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_gradable_object_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OBJECT_TYPE_ID` int(11) NOT NULL,
  `VERSION` int(11) NOT NULL,
  `GRADEBOOK_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `REMOVED` bit(1) DEFAULT NULL,
  `SORT_ORDER` int(11) DEFAULT NULL,
  `CATEGORIZED_SORT_ORDER` int(11) DEFAULT NULL,
  `POINTS_POSSIBLE` double DEFAULT NULL,
  `DUE_DATE` datetime DEFAULT NULL,
  `NOT_COUNTED` bit(1) DEFAULT NULL,
  `EXTERNALLY_MAINTAINED` bit(1) DEFAULT NULL,
  `EXTERNAL_STUDENT_LINK` varchar(255) DEFAULT NULL,
  `EXTERNAL_INSTRUCTOR_LINK` varchar(255) DEFAULT NULL,
  `EXTERNAL_ID` varchar(255) DEFAULT NULL,
  `EXTERNAL_APP_NAME` varchar(255) DEFAULT NULL,
  `IS_EXTRA_CREDIT` bit(1) DEFAULT NULL,
  `ASSIGNMENT_WEIGHTING` double DEFAULT NULL,
  `RELEASED` bit(1) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `UNGRADED` bit(1) DEFAULT NULL,
  `IS_NULL_ZERO` bit(1) DEFAULT NULL,
  `HIDE_IN_ALL_GRADES_TABLE` bit(1) DEFAULT NULL,
  `EXTERNAL_DATA` longtext,
  PRIMARY KEY (`ID`),
  KEY `FK_slm6lcuewr0mc4rovjgfe7u11` (`GRADEBOOK_ID`),
  KEY `FK_a2e0gwdyhfb8gapqdxriy8l08` (`CATEGORY_ID`),
  CONSTRAINT `FK_a2e0gwdyhfb8gapqdxriy8l08` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `gb_category_t` (`ID`),
  CONSTRAINT `FK_slm6lcuewr0mc4rovjgfe7u11` FOREIGN KEY (`GRADEBOOK_ID`) REFERENCES `gb_gradebook_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_gradable_object_t`
--

LOCK TABLES `gb_gradable_object_t` WRITE;
/*!40000 ALTER TABLE `gb_gradable_object_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_gradable_object_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_grade_map_t`
--

DROP TABLE IF EXISTS `gb_grade_map_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_grade_map_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OBJECT_TYPE_ID` int(11) NOT NULL,
  `VERSION` int(11) NOT NULL,
  `GRADEBOOK_ID` bigint(20) NOT NULL,
  `GB_GRADING_SCALE_T` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_eic3n99qys5el2eu9huhn4a9y` (`GRADEBOOK_ID`),
  KEY `FK_qwpr6la33riojd63uflk4f6fk` (`GB_GRADING_SCALE_T`),
  CONSTRAINT `FK_qwpr6la33riojd63uflk4f6fk` FOREIGN KEY (`GB_GRADING_SCALE_T`) REFERENCES `gb_grading_scale_t` (`ID`),
  CONSTRAINT `FK_eic3n99qys5el2eu9huhn4a9y` FOREIGN KEY (`GRADEBOOK_ID`) REFERENCES `gb_gradebook_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_grade_map_t`
--

LOCK TABLES `gb_grade_map_t` WRITE;
/*!40000 ALTER TABLE `gb_grade_map_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_grade_map_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_grade_record_t`
--

DROP TABLE IF EXISTS `gb_grade_record_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_grade_record_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OBJECT_TYPE_ID` int(11) NOT NULL,
  `VERSION` int(11) NOT NULL,
  `GRADABLE_OBJECT_ID` bigint(20) NOT NULL,
  `STUDENT_ID` varchar(255) NOT NULL,
  `GRADER_ID` varchar(255) NOT NULL,
  `DATE_RECORDED` datetime NOT NULL,
  `POINTS_EARNED` double DEFAULT NULL,
  `IS_EXCLUDED_FROM_GRADE` bit(1) DEFAULT NULL,
  `ENTERED_GRADE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `gradeRecordKey` (`GRADABLE_OBJECT_ID`,`STUDENT_ID`),
  KEY `GB_GRADE_RECORD_STUDENT_ID_IDX` (`STUDENT_ID`),
  CONSTRAINT `FK_2eble7j4ipoqos86p31ocp0y9` FOREIGN KEY (`GRADABLE_OBJECT_ID`) REFERENCES `gb_gradable_object_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_grade_record_t`
--

LOCK TABLES `gb_grade_record_t` WRITE;
/*!40000 ALTER TABLE `gb_grade_record_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_grade_record_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_grade_to_percent_mapping_t`
--

DROP TABLE IF EXISTS `gb_grade_to_percent_mapping_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_grade_to_percent_mapping_t` (
  `GRADE_MAP_ID` bigint(20) NOT NULL,
  `PERCENT` double DEFAULT NULL,
  `LETTER_GRADE` varchar(255) NOT NULL,
  PRIMARY KEY (`GRADE_MAP_ID`,`LETTER_GRADE`),
  CONSTRAINT `FK_m75pp6hrnu781rt2c09pn68h1` FOREIGN KEY (`GRADE_MAP_ID`) REFERENCES `gb_grade_map_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_grade_to_percent_mapping_t`
--

LOCK TABLES `gb_grade_to_percent_mapping_t` WRITE;
/*!40000 ALTER TABLE `gb_grade_to_percent_mapping_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_grade_to_percent_mapping_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_gradebook_t`
--

DROP TABLE IF EXISTS `gb_gradebook_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_gradebook_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `GRADEBOOK_UID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SELECTED_GRADE_MAPPING_ID` bigint(20) DEFAULT NULL,
  `ASSIGNMENTS_DISPLAYED` bit(1) NOT NULL,
  `COURSE_GRADE_DISPLAYED` bit(1) NOT NULL,
  `COURSE_POINTS_DISPLAYED` bit(1) NOT NULL,
  `TOTAL_POINTS_DISPLAYED` bit(1) NOT NULL,
  `COURSE_AVERAGE_DISPLAYED` bit(1) NOT NULL,
  `ALL_ASSIGNMENTS_ENTERED` bit(1) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `GRADE_TYPE` int(11) NOT NULL,
  `CATEGORY_TYPE` int(11) NOT NULL,
  `IS_EQUAL_WEIGHT_CATS` bit(1) DEFAULT NULL,
  `IS_SCALED_EXTRA_CREDIT` bit(1) DEFAULT NULL,
  `DO_SHOW_MEAN` bit(1) DEFAULT NULL,
  `DO_SHOW_MEDIAN` bit(1) DEFAULT NULL,
  `DO_SHOW_MODE` bit(1) DEFAULT NULL,
  `DO_SHOW_RANK` bit(1) DEFAULT NULL,
  `DO_SHOW_ITEM_STATS` bit(1) DEFAULT NULL,
  `DO_SHOW_STATISTICS_CHART` bit(1) DEFAULT NULL,
  `COURSE_LETTER_GRADE_DISPLAYED` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ru3o66mhmaf4no3xt2tv4n8e5` (`GRADEBOOK_UID`),
  KEY `FK_hbuy2bndrimkelk3ifj0h62h1` (`SELECTED_GRADE_MAPPING_ID`),
  CONSTRAINT `FK_hbuy2bndrimkelk3ifj0h62h1` FOREIGN KEY (`SELECTED_GRADE_MAPPING_ID`) REFERENCES `gb_grade_map_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_gradebook_t`
--

LOCK TABLES `gb_gradebook_t` WRITE;
/*!40000 ALTER TABLE `gb_gradebook_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_gradebook_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_grading_event_t`
--

DROP TABLE IF EXISTS `gb_grading_event_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_grading_event_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `GRADABLE_OBJECT_ID` bigint(20) NOT NULL,
  `GRADER_ID` varchar(255) NOT NULL,
  `STUDENT_ID` varchar(255) NOT NULL,
  `DATE_GRADED` datetime NOT NULL,
  `GRADE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_q60la6e22o9d1827w60lkn2wo` (`GRADABLE_OBJECT_ID`),
  CONSTRAINT `FK_q60la6e22o9d1827w60lkn2wo` FOREIGN KEY (`GRADABLE_OBJECT_ID`) REFERENCES `gb_gradable_object_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_grading_event_t`
--

LOCK TABLES `gb_grading_event_t` WRITE;
/*!40000 ALTER TABLE `gb_grading_event_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_grading_event_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_grading_scale_grades_t`
--

DROP TABLE IF EXISTS `gb_grading_scale_grades_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_grading_scale_grades_t` (
  `GRADING_SCALE_ID` bigint(20) NOT NULL,
  `LETTER_GRADE` varchar(255) DEFAULT NULL,
  `GRADE_IDX` int(11) NOT NULL,
  PRIMARY KEY (`GRADING_SCALE_ID`,`GRADE_IDX`),
  CONSTRAINT `FK_998q3mh96ommuoptyhoet9vo7` FOREIGN KEY (`GRADING_SCALE_ID`) REFERENCES `gb_grading_scale_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_grading_scale_grades_t`
--

LOCK TABLES `gb_grading_scale_grades_t` WRITE;
/*!40000 ALTER TABLE `gb_grading_scale_grades_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_grading_scale_grades_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_grading_scale_percents_t`
--

DROP TABLE IF EXISTS `gb_grading_scale_percents_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_grading_scale_percents_t` (
  `GRADING_SCALE_ID` bigint(20) NOT NULL,
  `PERCENT` double DEFAULT NULL,
  `LETTER_GRADE` varchar(255) NOT NULL,
  PRIMARY KEY (`GRADING_SCALE_ID`,`LETTER_GRADE`),
  CONSTRAINT `FK_nnxgq9jlal0mrt24f3wpjdjyc` FOREIGN KEY (`GRADING_SCALE_ID`) REFERENCES `gb_grading_scale_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_grading_scale_percents_t`
--

LOCK TABLES `gb_grading_scale_percents_t` WRITE;
/*!40000 ALTER TABLE `gb_grading_scale_percents_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_grading_scale_percents_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_grading_scale_t`
--

DROP TABLE IF EXISTS `gb_grading_scale_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_grading_scale_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OBJECT_TYPE_ID` int(11) NOT NULL,
  `VERSION` int(11) NOT NULL,
  `SCALE_UID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `UNAVAILABLE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_rtwe2scsusdlt5ky2h0rnx08v` (`SCALE_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_grading_scale_t`
--

LOCK TABLES `gb_grading_scale_t` WRITE;
/*!40000 ALTER TABLE `gb_grading_scale_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_grading_scale_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_lettergrade_mapping`
--

DROP TABLE IF EXISTS `gb_lettergrade_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_lettergrade_mapping` (
  `LG_MAPPING_ID` bigint(20) NOT NULL,
  `value` double DEFAULT NULL,
  `grade` varchar(255) NOT NULL,
  PRIMARY KEY (`LG_MAPPING_ID`,`grade`),
  CONSTRAINT `FK_8a7dhp3c9or27xkulnelyg0el` FOREIGN KEY (`LG_MAPPING_ID`) REFERENCES `gb_lettergrade_percent_mapping` (`LGP_MAPPING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_lettergrade_mapping`
--

LOCK TABLES `gb_lettergrade_mapping` WRITE;
/*!40000 ALTER TABLE `gb_lettergrade_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_lettergrade_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_lettergrade_percent_mapping`
--

DROP TABLE IF EXISTS `gb_lettergrade_percent_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_lettergrade_percent_mapping` (
  `LGP_MAPPING_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `MAPPING_TYPE` int(11) NOT NULL,
  `GRADEBOOK_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`LGP_MAPPING_ID`),
  UNIQUE KEY `uniqueTypeGradebook` (`MAPPING_TYPE`,`GRADEBOOK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_lettergrade_percent_mapping`
--

LOCK TABLES `gb_lettergrade_percent_mapping` WRITE;
/*!40000 ALTER TABLE `gb_lettergrade_percent_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_lettergrade_percent_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_permission_t`
--

DROP TABLE IF EXISTS `gb_permission_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_permission_t` (
  `GB_PERMISSION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `GRADEBOOK_ID` bigint(20) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `FUNCTION_NAME` varchar(255) NOT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `GROUP_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`GB_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_permission_t`
--

LOCK TABLES `gb_permission_t` WRITE;
/*!40000 ALTER TABLE `gb_permission_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_permission_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_property_t`
--

DROP TABLE IF EXISTS `gb_property_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_property_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_kvs819b0osay1jus54sly941w` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_property_t`
--

LOCK TABLES `gb_property_t` WRITE;
/*!40000 ALTER TABLE `gb_property_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_property_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_spreadsheet_t`
--

DROP TABLE IF EXISTS `gb_spreadsheet_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gb_spreadsheet_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `CREATOR` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `CONTENT` longtext NOT NULL,
  `DATE_CREATED` datetime NOT NULL,
  `GRADEBOOK_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_1e5wm1tl7k7xd4o2g60sjw6v1` (`GRADEBOOK_ID`),
  CONSTRAINT `FK_1e5wm1tl7k7xd4o2g60sjw6v1` FOREIGN KEY (`GRADEBOOK_ID`) REFERENCES `gb_gradebook_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_spreadsheet_t`
--

LOCK TABLES `gb_spreadsheet_t` WRITE;
/*!40000 ALTER TABLE `gb_spreadsheet_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `gb_spreadsheet_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_node`
--

DROP TABLE IF EXISTS `hierarchy_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hierarchy_node` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `directParentIds` varchar(2000) DEFAULT NULL,
  `parentIds` varchar(4000) DEFAULT NULL,
  `directChildIds` longtext,
  `childIds` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_node`
--

LOCK TABLES `hierarchy_node` WRITE;
/*!40000 ALTER TABLE `hierarchy_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchy_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_node_meta`
--

DROP TABLE IF EXISTS `hierarchy_node_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hierarchy_node_meta` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `hierarchyId` varchar(255) DEFAULT NULL,
  `isRootNode` bit(1) NOT NULL,
  `ownerId` varchar(99) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `permToken` varchar(255) DEFAULT NULL,
  `isDisabled` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `HIERARCHY_HID` (`hierarchyId`),
  KEY `HIERARCHY_PERMTOKEN` (`permToken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_node_meta`
--

LOCK TABLES `hierarchy_node_meta` WRITE;
/*!40000 ALTER TABLE `hierarchy_node_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchy_node_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_perms`
--

DROP TABLE IF EXISTS `hierarchy_perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hierarchy_perms` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdOn` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  `userId` varchar(99) NOT NULL,
  `nodeId` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `HIER_PERM_USER` (`userId`),
  KEY `HIER_PERM_NODE` (`nodeId`),
  KEY `HIER_PERM_PERM` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_perms`
--

LOCK TABLES `hierarchy_perms` WRITE;
/*!40000 ALTER TABLE `hierarchy_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchy_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_builder_ch_status`
--

DROP TABLE IF EXISTS `lesson_builder_ch_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lesson_builder_ch_status` (
  `checklistId` bigint(20) NOT NULL,
  `checklistItemId` bigint(20) NOT NULL,
  `owner` varchar(99) NOT NULL,
  `done` bit(1) DEFAULT NULL,
  PRIMARY KEY (`checklistId`,`checklistItemId`,`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_builder_ch_status`
--

LOCK TABLES `lesson_builder_ch_status` WRITE;
/*!40000 ALTER TABLE `lesson_builder_ch_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_builder_ch_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_builder_comments`
--

DROP TABLE IF EXISTS `lesson_builder_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lesson_builder_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemId` bigint(20) NOT NULL,
  `pageId` bigint(20) NOT NULL,
  `timePosted` datetime NOT NULL,
  `author` varchar(99) NOT NULL,
  `commenttext` longtext,
  `UUID` varchar(36) NOT NULL,
  `html` bit(1) NOT NULL,
  `points` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lesson_builder_comments_itemid_author` (`itemId`,`author`),
  KEY `lesson_builder_comments_uuid` (`UUID`),
  KEY `lesson_builder_comments_author` (`pageId`,`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_builder_comments`
--

LOCK TABLES `lesson_builder_comments` WRITE;
/*!40000 ALTER TABLE `lesson_builder_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_builder_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_builder_groups`
--

DROP TABLE IF EXISTS `lesson_builder_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lesson_builder_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemId` varchar(255) NOT NULL,
  `groupId` varchar(99) NOT NULL,
  `groups` longtext,
  `siteId` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lesson_builder_group_site` (`siteId`),
  KEY `lesson_builder_groups_itemid` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_builder_groups`
--

LOCK TABLES `lesson_builder_groups` WRITE;
/*!40000 ALTER TABLE `lesson_builder_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_builder_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_builder_items`
--

DROP TABLE IF EXISTS `lesson_builder_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lesson_builder_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pageId` bigint(20) NOT NULL,
  `sequence` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `sakaiId` varchar(250) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `html` longtext,
  `description` longtext,
  `height` varchar(8) DEFAULT NULL,
  `width` varchar(8) DEFAULT NULL,
  `alt` varchar(500) DEFAULT NULL,
  `nextPage` bit(1) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `required` bit(1) DEFAULT NULL,
  `alternate` bit(1) DEFAULT NULL,
  `prerequisite` bit(1) DEFAULT NULL,
  `subrequirement` bit(1) DEFAULT NULL,
  `requirementText` varchar(20) DEFAULT NULL,
  `sameWindow` bit(1) DEFAULT NULL,
  `groups` longtext,
  `anonymous` bit(1) DEFAULT NULL,
  `showComments` bit(1) DEFAULT NULL,
  `forcedCommentsAnonymous` bit(1) DEFAULT NULL,
  `showPeerEval` bit(1) DEFAULT NULL,
  `gradebookId` varchar(100) DEFAULT NULL,
  `gradebookPoints` int(11) DEFAULT NULL,
  `gradebookTitle` varchar(200) DEFAULT NULL,
  `altGradebook` varchar(100) DEFAULT NULL,
  `altPoints` int(11) DEFAULT NULL,
  `altGradebookTitle` varchar(200) DEFAULT NULL,
  `groupOwned` bit(1) DEFAULT NULL,
  `ownerGroups` longtext,
  `attributeString` longtext,
  PRIMARY KEY (`id`),
  KEY `lesson_builder_item_gb` (`gradebookId`),
  KEY `lesson_builder_item_altgb` (`altGradebook`),
  KEY `lesson_builder_items_pageid` (`pageId`),
  KEY `lesson_builder_items_sakaiid` (`sakaiId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_builder_items`
--

LOCK TABLES `lesson_builder_items` WRITE;
/*!40000 ALTER TABLE `lesson_builder_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_builder_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_builder_log`
--

DROP TABLE IF EXISTS `lesson_builder_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lesson_builder_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lastViewed` datetime NOT NULL,
  `itemId` bigint(20) NOT NULL,
  `userId` varchar(99) NOT NULL,
  `firstViewed` datetime NOT NULL,
  `complete` bit(1) NOT NULL,
  `dummy` bit(1) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `toolId` varchar(99) DEFAULT NULL,
  `studentPageId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lesson_builder_log_index` (`userId`,`itemId`,`studentPageId`),
  KEY `lesson_builder_log_index3` (`itemId`),
  KEY `lesson_builder_log_index2` (`userId`,`toolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_builder_log`
--

LOCK TABLES `lesson_builder_log` WRITE;
/*!40000 ALTER TABLE `lesson_builder_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_builder_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_builder_p_eval_results`
--

DROP TABLE IF EXISTS `lesson_builder_p_eval_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lesson_builder_p_eval_results` (
  `PEER_EVAL_RESULT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PAGE_ID` bigint(20) NOT NULL,
  `TIME_POSTED` datetime DEFAULT NULL,
  `GRADER` varchar(99) NOT NULL,
  `gradee` varchar(99) DEFAULT NULL,
  `GRADEE_GROUP` varchar(99) DEFAULT NULL,
  `row_text` varchar(255) DEFAULT NULL,
  `ROW_ID` bigint(20) DEFAULT '0',
  `COLUMN_VALUE` int(11) NOT NULL,
  `SELECTED` bit(1) DEFAULT NULL,
  PRIMARY KEY (`PEER_EVAL_RESULT_ID`),
  KEY `lesson_builder_p_eval_res_row` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_builder_p_eval_results`
--

LOCK TABLES `lesson_builder_p_eval_results` WRITE;
/*!40000 ALTER TABLE `lesson_builder_p_eval_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_builder_p_eval_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_builder_pages`
--

DROP TABLE IF EXISTS `lesson_builder_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lesson_builder_pages` (
  `pageId` bigint(20) NOT NULL AUTO_INCREMENT,
  `toolId` varchar(99) NOT NULL,
  `siteId` varchar(99) NOT NULL,
  `title` varchar(255) NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `topParent` bigint(20) DEFAULT NULL,
  `hidden` bit(1) DEFAULT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `gradebookPoints` double DEFAULT NULL,
  `owner` varchar(99) DEFAULT NULL,
  `groupOwned` bit(1) DEFAULT NULL,
  `groupid` varchar(99) DEFAULT NULL,
  `cssSheet` varchar(250) DEFAULT NULL,
  `folder` varchar(250) DEFAULT NULL,
  `owned` bit(1) DEFAULT NULL,
  PRIMARY KEY (`pageId`),
  KEY `lesson_builder_page_folder` (`siteId`,`folder`),
  KEY `lesson_builder_pages_pageid` (`pageId`),
  KEY `lesson_builder_pages_toolid` (`toolId`,`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_builder_pages`
--

LOCK TABLES `lesson_builder_pages` WRITE;
/*!40000 ALTER TABLE `lesson_builder_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_builder_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_builder_properties`
--

DROP TABLE IF EXISTS `lesson_builder_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lesson_builder_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute` varchar(255) NOT NULL,
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ou4hrxide8o0v88o2efdakrqx` (`attribute`),
  KEY `lesson_builder_prop_idx` (`attribute`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_builder_properties`
--

LOCK TABLES `lesson_builder_properties` WRITE;
/*!40000 ALTER TABLE `lesson_builder_properties` DISABLE KEYS */;
INSERT INTO `lesson_builder_properties` VALUES (1,'accessCryptoKey','A4A01412FDA5237B507158067AC3AD1A');
/*!40000 ALTER TABLE `lesson_builder_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_builder_q_responses`
--

DROP TABLE IF EXISTS `lesson_builder_q_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lesson_builder_q_responses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timeAnswered` datetime NOT NULL,
  `questionId` bigint(20) NOT NULL,
  `userId` varchar(99) NOT NULL,
  `correct` bit(1) NOT NULL,
  `shortanswer` longtext,
  `multipleChoiceId` bigint(20) DEFAULT NULL,
  `originalText` longtext,
  `overridden` bit(1) NOT NULL,
  `points` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lesson_builder_qr_questionId_userId` (`questionId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_builder_q_responses`
--

LOCK TABLES `lesson_builder_q_responses` WRITE;
/*!40000 ALTER TABLE `lesson_builder_q_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_builder_q_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_builder_qr_totals`
--

DROP TABLE IF EXISTS `lesson_builder_qr_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lesson_builder_qr_totals` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `questionId` bigint(20) DEFAULT NULL,
  `responseId` bigint(20) DEFAULT NULL,
  `respcount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lesson_builder_qr_total_qi` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_builder_qr_totals`
--

LOCK TABLES `lesson_builder_qr_totals` WRITE;
/*!40000 ALTER TABLE `lesson_builder_qr_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_builder_qr_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_builder_student_pages`
--

DROP TABLE IF EXISTS `lesson_builder_student_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lesson_builder_student_pages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lastUpdated` datetime NOT NULL,
  `itemId` bigint(20) NOT NULL,
  `pageId` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `owner` varchar(99) NOT NULL,
  `groupOwned` bit(1) NOT NULL,
  `groupid` varchar(99) DEFAULT NULL,
  `commentsSection` bigint(20) DEFAULT NULL,
  `lastCommentChange` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `points` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lesson_builder_student_pages_pageId` (`pageId`),
  KEY `lesson_builder_student_pages_itemId` (`itemId`),
  KEY `lesson_builder_student_pages_index` (`itemId`,`owner`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_builder_student_pages`
--

LOCK TABLES `lesson_builder_student_pages` WRITE;
/*!40000 ALTER TABLE `lesson_builder_student_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_builder_student_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_binding`
--

DROP TABLE IF EXISTS `lti_binding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lti_binding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) DEFAULT NULL,
  `SITE_ID` varchar(99) DEFAULT NULL,
  `settings` mediumtext,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_binding`
--

LOCK TABLES `lti_binding` WRITE;
/*!40000 ALTER TABLE `lti_binding` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_binding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_content`
--

DROP TABLE IF EXISTS `lti_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lti_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) DEFAULT NULL,
  `SITE_ID` varchar(99) DEFAULT NULL,
  `title` varchar(1024) DEFAULT NULL,
  `pagetitle` varchar(1024) DEFAULT NULL,
  `fa_icon` varchar(1024) DEFAULT NULL,
  `frameheight` int(11) DEFAULT NULL,
  `toolorder` int(11) DEFAULT NULL,
  `newpage` tinyint(4) DEFAULT '0',
  `debug` tinyint(4) DEFAULT '0',
  `custom` mediumtext,
  `launch` varchar(1024) DEFAULT NULL,
  `consumerkey` varchar(1024) DEFAULT NULL,
  `secret` varchar(1024) DEFAULT NULL,
  `resource_handler` varchar(1024) DEFAULT NULL,
  `xmlimport` mediumtext,
  `settings` mediumtext,
  `settings_ext` mediumtext,
  `contentitem` mediumtext,
  `placement` varchar(256) DEFAULT NULL,
  `placementsecret` varchar(512) DEFAULT NULL,
  `oldplacementsecret` varchar(512) DEFAULT NULL,
  `sha256` tinyint(4) DEFAULT '0',
  `lti13` tinyint(4) DEFAULT '0',
  `lti13_settings` mediumtext,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_content`
--

LOCK TABLES `lti_content` WRITE;
/*!40000 ALTER TABLE `lti_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_deploy`
--

DROP TABLE IF EXISTS `lti_deploy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lti_deploy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_state` tinyint(4) DEFAULT '0',
  `title` varchar(1024) DEFAULT NULL,
  `pagetitle` varchar(1024) DEFAULT NULL,
  `description` mediumtext,
  `status` tinyint(4) DEFAULT '0',
  `visible` tinyint(4) DEFAULT '0',
  `sendname` tinyint(4) DEFAULT '0',
  `sendemailaddr` tinyint(4) DEFAULT '0',
  `allowoutcomes` tinyint(4) DEFAULT '0',
  `allowroster` tinyint(4) DEFAULT '0',
  `allowsettings` tinyint(4) DEFAULT '0',
  `allowcontentitem` tinyint(4) DEFAULT '0',
  `reg_launch` varchar(1024) DEFAULT NULL,
  `reg_key` varchar(1024) DEFAULT NULL,
  `reg_password` varchar(1024) DEFAULT NULL,
  `reg_ack` mediumtext,
  `consumerkey` varchar(1024) DEFAULT NULL,
  `secret` varchar(1024) DEFAULT NULL,
  `new_secret` varchar(1024) DEFAULT NULL,
  `reg_profile` mediumtext,
  `settings` mediumtext,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_deploy`
--

LOCK TABLES `lti_deploy` WRITE;
/*!40000 ALTER TABLE `lti_deploy` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_deploy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_memberships_jobs`
--

DROP TABLE IF EXISTS `lti_memberships_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lti_memberships_jobs` (
  `SITE_ID` varchar(99) DEFAULT NULL,
  `memberships_id` varchar(256) DEFAULT NULL,
  `memberships_url` mediumtext,
  `consumerkey` varchar(1024) DEFAULT NULL,
  `lti_version` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_memberships_jobs`
--

LOCK TABLES `lti_memberships_jobs` WRITE;
/*!40000 ALTER TABLE `lti_memberships_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_memberships_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_tools`
--

DROP TABLE IF EXISTS `lti_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lti_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` tinyint(4) DEFAULT '0',
  `SITE_ID` varchar(99) DEFAULT NULL,
  `title` varchar(1024) DEFAULT NULL,
  `allowtitle` tinyint(4) DEFAULT '0',
  `fa_icon` varchar(1024) DEFAULT NULL,
  `pagetitle` varchar(1024) DEFAULT NULL,
  `allowpagetitle` tinyint(4) DEFAULT '0',
  `description` mediumtext,
  `status` tinyint(4) DEFAULT '0',
  `visible` tinyint(4) DEFAULT '0',
  `resource_handler` varchar(1024) DEFAULT NULL,
  `deployment_id` int(11) DEFAULT NULL,
  `launch` varchar(1024) DEFAULT NULL,
  `allowlaunch` tinyint(4) DEFAULT '0',
  `consumerkey` varchar(1024) DEFAULT NULL,
  `allowconsumerkey` tinyint(4) DEFAULT '0',
  `secret` varchar(1024) DEFAULT NULL,
  `allowsecret` tinyint(4) DEFAULT '0',
  `frameheight` int(11) DEFAULT NULL,
  `toolorder` int(11) DEFAULT NULL,
  `allowframeheight` tinyint(4) DEFAULT '0',
  `siteinfoconfig` tinyint(4) DEFAULT '0',
  `sendname` tinyint(4) DEFAULT '0',
  `sendemailaddr` tinyint(4) DEFAULT '0',
  `allowoutcomes` tinyint(4) DEFAULT '0',
  `allowroster` tinyint(4) DEFAULT '0',
  `allowsettings` tinyint(4) DEFAULT '0',
  `pl_launch` tinyint(4) DEFAULT '0',
  `pl_linkselection` tinyint(4) DEFAULT '0',
  `pl_contenteditor` tinyint(4) DEFAULT '0',
  `pl_importitem` tinyint(4) DEFAULT '0',
  `pl_fileitem` tinyint(4) DEFAULT '0',
  `pl_assessmentselection` tinyint(4) DEFAULT '0',
  `newpage` tinyint(4) DEFAULT '0',
  `debug` tinyint(4) DEFAULT '0',
  `custom` mediumtext,
  `settings` mediumtext,
  `parameter` mediumtext,
  `tool_proxy_binding` mediumtext,
  `allowcustom` tinyint(4) DEFAULT '0',
  `sha256` tinyint(4) DEFAULT '0',
  `lti13` tinyint(4) DEFAULT '0',
  `lti13_settings` mediumtext,
  `xmlimport` mediumtext,
  `splash` mediumtext,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_tools`
--

LOCK TABLES `lti_tools` WRITE;
/*!40000 ALTER TABLE `lti_tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailarchive_channel`
--

DROP TABLE IF EXISTS `mailarchive_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mailarchive_channel` (
  `CHANNEL_ID` varchar(99) NOT NULL,
  `NEXT_ID` int(11) DEFAULT NULL,
  `XML` longtext,
  UNIQUE KEY `MAILARCHIVE_CHANNEL_INDEX` (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailarchive_channel`
--

LOCK TABLES `mailarchive_channel` WRITE;
/*!40000 ALTER TABLE `mailarchive_channel` DISABLE KEYS */;
INSERT INTO `mailarchive_channel` VALUES ('/mailarchive/channel/!site/postmaster',1,'<?xml version=\"1.0\" encoding=\"UTF-8\"?> <channel context=\"!site\" id=\"postmaster\" next-message-id=\"1\"> <properties/> </channel> ');
/*!40000 ALTER TABLE `mailarchive_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailarchive_message`
--

DROP TABLE IF EXISTS `mailarchive_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mailarchive_message` (
  `CHANNEL_ID` varchar(99) NOT NULL,
  `MESSAGE_ID` varchar(36) NOT NULL,
  `DRAFT` char(1) DEFAULT NULL,
  `PUBVIEW` char(1) DEFAULT NULL,
  `OWNER` varchar(99) DEFAULT NULL,
  `MESSAGE_DATE` datetime NOT NULL,
  `XML` longtext,
  `SUBJECT` varchar(255) DEFAULT NULL,
  `BODY` longtext,
  PRIMARY KEY (`CHANNEL_ID`,`MESSAGE_ID`),
  KEY `IE_MAILARC_MSG_CHAN` (`CHANNEL_ID`),
  KEY `IE_MAILARC_MSG_ATTRIB` (`DRAFT`,`PUBVIEW`,`OWNER`),
  KEY `IE_MAILARC_MSG_DATE` (`MESSAGE_DATE`),
  KEY `MAILARC_MSG_CDD` (`CHANNEL_ID`,`MESSAGE_DATE`,`DRAFT`),
  KEY `IE_MAILARC_SUBJECT` (`SUBJECT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailarchive_message`
--

LOCK TABLES `mailarchive_message` WRITE;
/*!40000 ALTER TABLE `mailarchive_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailarchive_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_anonymous_mapping_t`
--

DROP TABLE IF EXISTS `mfr_anonymous_mapping_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_anonymous_mapping_t` (
  `SITE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `ANON_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`SITE_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_anonymous_mapping_t`
--

LOCK TABLES `mfr_anonymous_mapping_t` WRITE;
/*!40000 ALTER TABLE `mfr_anonymous_mapping_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_anonymous_mapping_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_area_t`
--

DROP TABLE IF EXISTS `mfr_area_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_area_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(36) NOT NULL,
  `MODIFIED` datetime NOT NULL,
  `MODIFIED_BY` varchar(36) NOT NULL,
  `CONTEXT_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `HIDDEN` bit(1) NOT NULL,
  `TYPE_UUID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL,
  `SENDEMAILOUT` bit(1) NOT NULL,
  `SEND_TO_EMAIL` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `MODERATED` bit(1) NOT NULL,
  `POST_FIRST` bit(1) NOT NULL,
  `AUTO_MARK_THREADS_READ` bit(1) NOT NULL,
  `AVAILABILITY_RESTRICTED` bit(1) NOT NULL DEFAULT b'0',
  `AVAILABILITY` bit(1) NOT NULL DEFAULT b'1',
  `OPEN_DATE` datetime DEFAULT NULL,
  `CLOSE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `MFR_AREA_CONTEXT_UUID_UNIQUE` (`CONTEXT_ID`,`TYPE_UUID`),
  KEY `MFR_AREA_CONTEXT_I` (`CONTEXT_ID`),
  KEY `MFR_AREA_TYPE_I` (`TYPE_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_area_t`
--

LOCK TABLES `mfr_area_t` WRITE;
/*!40000 ALTER TABLE `mfr_area_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_area_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_attachment_t`
--

DROP TABLE IF EXISTS `mfr_attachment_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_attachment_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(255) NOT NULL,
  `MODIFIED` datetime NOT NULL,
  `MODIFIED_BY` varchar(255) NOT NULL,
  `ATTACHMENT_ID` varchar(255) NOT NULL,
  `ATTACHMENT_URL` varchar(255) NOT NULL,
  `ATTACHMENT_NAME` varchar(255) NOT NULL,
  `ATTACHMENT_SIZE` varchar(255) NOT NULL,
  `ATTACHMENT_TYPE` varchar(255) NOT NULL,
  `m_surrogateKey` bigint(20) DEFAULT NULL,
  `of_surrogateKey` bigint(20) DEFAULT NULL,
  `pf_surrogateKey` bigint(20) DEFAULT NULL,
  `t_surrogateKey` bigint(20) DEFAULT NULL,
  `of_urrogateKey` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MFR_ATTACHMENT_PARENT_I` (`m_surrogateKey`),
  KEY `MFR_ATTACHMENT_PARENT_I2` (`of_surrogateKey`),
  KEY `MFR_ATTACHMENT_PARENT_I3` (`pf_surrogateKey`),
  KEY `MFR_ATTACHMENT_PARENT_I4` (`t_surrogateKey`),
  KEY `FK_aurdye3v1t0lhd1jjcjn7xmf8` (`of_urrogateKey`),
  CONSTRAINT `FK_aurdye3v1t0lhd1jjcjn7xmf8` FOREIGN KEY (`of_urrogateKey`) REFERENCES `mfr_open_forum_t` (`ID`),
  CONSTRAINT `FK_8b18nbwdcqfea30tuhv3j008q` FOREIGN KEY (`of_surrogateKey`) REFERENCES `mfr_open_forum_t` (`ID`),
  CONSTRAINT `FK_jokul2j4lmnvmhsvl1kbjot2o` FOREIGN KEY (`m_surrogateKey`) REFERENCES `mfr_message_t` (`ID`),
  CONSTRAINT `FK_o7gkrm7qjfwj33s2t065h2d92` FOREIGN KEY (`t_surrogateKey`) REFERENCES `mfr_topic_t` (`ID`),
  CONSTRAINT `FK_pkcpyilbgcwd8gjr8jli1d806` FOREIGN KEY (`pf_surrogateKey`) REFERENCES `mfr_private_forum_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_attachment_t`
--

LOCK TABLES `mfr_attachment_t` WRITE;
/*!40000 ALTER TABLE `mfr_attachment_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_attachment_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_date_restrictions_t`
--

DROP TABLE IF EXISTS `mfr_date_restrictions_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_date_restrictions_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `VISIBLE` datetime NOT NULL,
  `VISIBLE_POST_ON_SCHEDULE` bit(1) NOT NULL,
  `POSTING_ALLOWED` datetime NOT NULL,
  `PSTNG_ALLWD_PST_ON_SCHD` bit(1) NOT NULL,
  `READ_ONLY` datetime NOT NULL,
  `READ_ONLY_POST_ON_SCHEDULE` bit(1) NOT NULL,
  `HIDDEN` datetime NOT NULL,
  `HIDDEN_POST_ON_SCHEDULE` bit(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_date_restrictions_t`
--

LOCK TABLES `mfr_date_restrictions_t` WRITE;
/*!40000 ALTER TABLE `mfr_date_restrictions_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_date_restrictions_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_email_notification_t`
--

DROP TABLE IF EXISTS `mfr_email_notification_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_email_notification_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `CONTEXT_ID` varchar(255) NOT NULL,
  `NOTIFICATION_LEVEL` varchar(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `MFR_EMAIL_USER_ID_I` (`USER_ID`),
  KEY `MFR_EMAIL_CONTEXT_ID_I` (`CONTEXT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_email_notification_t`
--

LOCK TABLES `mfr_email_notification_t` WRITE;
/*!40000 ALTER TABLE `mfr_email_notification_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_email_notification_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_hidden_groups_t`
--

DROP TABLE IF EXISTS `mfr_hidden_groups_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_hidden_groups_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `a_surrogateKey` bigint(20) DEFAULT NULL,
  `GROUP_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `MFR_HIDDEN_GROUPS_PARENT_I` (`a_surrogateKey`),
  CONSTRAINT `FK_g1tlbiy7no254q71mun8blr2a` FOREIGN KEY (`a_surrogateKey`) REFERENCES `mfr_area_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_hidden_groups_t`
--

LOCK TABLES `mfr_hidden_groups_t` WRITE;
/*!40000 ALTER TABLE `mfr_hidden_groups_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_hidden_groups_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_label_t`
--

DROP TABLE IF EXISTS `mfr_label_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_label_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(36) NOT NULL,
  `MODIFIED` datetime NOT NULL,
  `MODIFIED_BY` varchar(36) NOT NULL,
  `KEY_C` varchar(255) NOT NULL,
  `VALUE_C` varchar(255) NOT NULL,
  `df_surrogateKey` bigint(20) DEFAULT NULL,
  `df_index_col` int(11) DEFAULT NULL,
  `dt_surrogateKey` bigint(20) DEFAULT NULL,
  `dt_index_col` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MFR_LABEL_PARENT_I1` (`df_surrogateKey`),
  KEY `MFR_LABEL_PARENT_I2` (`dt_surrogateKey`),
  CONSTRAINT `FK_fmmkq6s18osyhdotoql59uvcr` FOREIGN KEY (`dt_surrogateKey`) REFERENCES `mfr_topic_t` (`ID`),
  CONSTRAINT `FK_teio19x0udkotto4v1idqhp7y` FOREIGN KEY (`df_surrogateKey`) REFERENCES `mfr_open_forum_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_label_t`
--

LOCK TABLES `mfr_label_t` WRITE;
/*!40000 ALTER TABLE `mfr_label_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_label_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_membership_item_t`
--

DROP TABLE IF EXISTS `mfr_membership_item_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_membership_item_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(255) NOT NULL,
  `MODIFIED` datetime NOT NULL,
  `MODIFIED_BY` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `PERMISSION_LEVEL_NAME` varchar(255) NOT NULL,
  `PERMISSION_LEVEL` bigint(20) DEFAULT NULL,
  `t_surrogateKey` bigint(20) DEFAULT NULL,
  `of_surrogateKey` bigint(20) DEFAULT NULL,
  `a_surrogateKey` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_hlhcuxr02f24pibu9vhwoi7as` (`PERMISSION_LEVEL`),
  KEY `MFR_MEMBERSHIP_ITEM_I01_I` (`t_surrogateKey`),
  KEY `MFR_MEMBERSHIP_ITEM_I02_I` (`a_surrogateKey`),
  KEY `FK_9mjtal4lq50xiy8fly13oid4x` (`of_surrogateKey`),
  CONSTRAINT `FK_mquu3iydw7d9wbkc8dj9wmn37` FOREIGN KEY (`a_surrogateKey`) REFERENCES `mfr_area_t` (`ID`),
  CONSTRAINT `FK_9mjtal4lq50xiy8fly13oid4x` FOREIGN KEY (`of_surrogateKey`) REFERENCES `mfr_open_forum_t` (`ID`),
  CONSTRAINT `FK_hlhcuxr02f24pibu9vhwoi7as` FOREIGN KEY (`PERMISSION_LEVEL`) REFERENCES `mfr_permission_level_t` (`ID`),
  CONSTRAINT `FK_pn1xeckeimu0l5nu17inairys` FOREIGN KEY (`t_surrogateKey`) REFERENCES `mfr_topic_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_membership_item_t`
--

LOCK TABLES `mfr_membership_item_t` WRITE;
/*!40000 ALTER TABLE `mfr_membership_item_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_membership_item_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_message_t`
--

DROP TABLE IF EXISTS `mfr_message_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_message_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_DTYPE` varchar(2) NOT NULL,
  `VERSION` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(36) NOT NULL,
  `MODIFIED` datetime NOT NULL,
  `MODIFIED_BY` varchar(36) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `BODY` longtext,
  `AUTHOR` varchar(255) NOT NULL,
  `HAS_ATTACHMENTS` bit(1) NOT NULL,
  `GRADEASSIGNMENTNAME` varchar(255) DEFAULT NULL,
  `NUM_READERS` int(11) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `IN_REPLY_TO` bigint(20) DEFAULT NULL,
  `THREADID` bigint(20) DEFAULT NULL,
  `LASTTHREADATE` datetime DEFAULT NULL,
  `LASTTHREAPOST` bigint(20) DEFAULT NULL,
  `TYPE_UUID` varchar(36) NOT NULL,
  `APPROVED` bit(1) DEFAULT NULL,
  `DRAFT` bit(1) NOT NULL,
  `DELETED` bit(1) NOT NULL,
  `surrogateKey` bigint(20) DEFAULT NULL,
  `EXTERNAL_EMAIL` bit(1) DEFAULT NULL,
  `EXTERNAL_EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `RECIPIENTS_AS_TEXT` longtext,
  `RECIPIENTS_AS_TEXT_BCC` longtext,
  PRIMARY KEY (`ID`),
  KEY `MFR_MESSAGE_DTYPE_I` (`MESSAGE_DTYPE`),
  KEY `MFR_MESSAGE_CREATED_I` (`CREATED`),
  KEY `MFR_MESSAGE_TITLE_I` (`TITLE`),
  KEY `MFR_MESSAGE_AUTHOR_I` (`AUTHOR`),
  KEY `MFR_MESSAGE_HAS_ATTACHMENTS_I` (`HAS_ATTACHMENTS`),
  KEY `MFR_MESSAGE_LABEL_I` (`LABEL`),
  KEY `MFR_MESSAGE_T_IN_REPLY_TO_I` (`IN_REPLY_TO`),
  KEY `MFR_MESSAGE_PARENT_TOPIC_I` (`surrogateKey`),
  CONSTRAINT `FK_gqfbgj1tp58t8v03jjckl2y7m` FOREIGN KEY (`surrogateKey`) REFERENCES `mfr_topic_t` (`ID`),
  CONSTRAINT `FK_own67iww9r8vv4no2ty59j3sh` FOREIGN KEY (`IN_REPLY_TO`) REFERENCES `mfr_message_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_message_t`
--

LOCK TABLES `mfr_message_t` WRITE;
/*!40000 ALTER TABLE `mfr_message_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_message_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_move_history_t`
--

DROP TABLE IF EXISTS `mfr_move_history_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_move_history_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(36) NOT NULL,
  `MODIFIED` datetime NOT NULL,
  `MODIFIED_BY` varchar(36) NOT NULL,
  `MESSAGE_ID` bigint(20) NOT NULL,
  `REMINDER` bit(1) DEFAULT NULL,
  `FROM_TOPIC_ID` bigint(20) NOT NULL,
  `TO_TOPIC_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_move_history_t`
--

LOCK TABLES `mfr_move_history_t` WRITE;
/*!40000 ALTER TABLE `mfr_move_history_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_move_history_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_open_forum_t`
--

DROP TABLE IF EXISTS `mfr_open_forum_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_open_forum_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_DTYPE` varchar(2) NOT NULL,
  `VERSION` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(36) NOT NULL,
  `MODIFIED` datetime NOT NULL,
  `MODIFIED_BY` varchar(36) NOT NULL,
  `DEFAULTASSIGNNAME` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) NOT NULL,
  `SHORT_DESCRIPTION` varchar(255) DEFAULT NULL,
  `EXTENDED_DESCRIPTION` longtext,
  `TYPE_UUID` varchar(36) NOT NULL,
  `SORT_INDEX` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `DRAFT` bit(1) DEFAULT NULL,
  `AVAILABILITY_RESTRICTED` bit(1) NOT NULL DEFAULT b'0',
  `AVAILABILITY` bit(1) NOT NULL DEFAULT b'1',
  `OPEN_DATE` datetime DEFAULT NULL,
  `CLOSE_DATE` datetime DEFAULT NULL,
  `surrogateKey` bigint(20) DEFAULT NULL,
  `MODERATED` bit(1) NOT NULL,
  `AUTO_MARK_THREADS_READ` bit(1) NOT NULL,
  `POST_FIRST` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `MFR_OPEN_FORUM_DTYPE_I` (`FORUM_DTYPE`),
  KEY `MFR_OPEN_FORUM_TYPE_I` (`TYPE_UUID`),
  KEY `MFR_OF_PARENT_BASEFORUM_I` (`surrogateKey`),
  CONSTRAINT `FK_s932gwshjb0t0fxu1ak5tqgp4` FOREIGN KEY (`surrogateKey`) REFERENCES `mfr_area_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_open_forum_t`
--

LOCK TABLES `mfr_open_forum_t` WRITE;
/*!40000 ALTER TABLE `mfr_open_forum_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_open_forum_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_permission_level_t`
--

DROP TABLE IF EXISTS `mfr_permission_level_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_permission_level_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(255) NOT NULL,
  `MODIFIED` datetime NOT NULL,
  `MODIFIED_BY` varchar(255) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `TYPE_UUID` varchar(36) NOT NULL,
  `CHANGE_SETTINGS` bit(1) NOT NULL,
  `DELETE_ANY` bit(1) NOT NULL,
  `DELETE_OWN` bit(1) NOT NULL,
  `MARK_AS_READ` bit(1) NOT NULL,
  `MOVE_POSTING` bit(1) NOT NULL,
  `NEW_FORUM` bit(1) NOT NULL,
  `NEW_RESPONSE` bit(1) NOT NULL,
  `NEW_RESPONSE_TO_RESPONSE` bit(1) NOT NULL,
  `NEW_TOPIC` bit(1) NOT NULL,
  `POST_TO_GRADEBOOK` bit(1) NOT NULL,
  `X_READ` bit(1) NOT NULL,
  `REVISE_ANY` bit(1) NOT NULL,
  `REVISE_OWN` bit(1) NOT NULL,
  `MODERATE_POSTINGS` bit(1) NOT NULL,
  `IDENTIFY_ANON_AUTHORS` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `MFR_COMPOSITE_PERM` (`NAME`,`TYPE_UUID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_permission_level_t`
--

LOCK TABLES `mfr_permission_level_t` WRITE;
/*!40000 ALTER TABLE `mfr_permission_level_t` DISABLE KEYS */;
INSERT INTO `mfr_permission_level_t` VALUES (1,0,'927fd32e-e98c-41f4-9fe9-2db2c4dd8373','2019-05-16 09:43:12','test-user','2019-05-16 09:43:12','test-user','Owner','08d526e6-5489-4100-8e12-2f2c4acf6ee5',_binary '',_binary '',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0',_binary '',_binary ''),(2,0,'17385b38-e120-4f4c-8087-10272cc681d1','2019-05-16 09:43:12','test-user','2019-05-16 09:43:12','test-user','Author','50428c58-b445-4d38-a062-872344357557',_binary '',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0'),(3,0,'fd0887b1-55d1-4699-abff-c84dbfab24a1','2019-05-16 09:43:12','test-user','2019-05-16 09:43:12','test-user','Contributor','49901e76-abc3-44ff-8d29-1437af3ce03f',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '',_binary '',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(4,0,'13fd6514-13ef-4c8e-a308-9e903c17e0bf','2019-05-16 09:43:12','test-user','2019-05-16 09:43:12','test-user','Reviewer','6c914874-3c21-482b-a2f7-197279568279',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(5,0,'3c9d97f7-5c04-4b9a-b732-6a84110f5d91','2019-05-16 09:43:12','test-user','2019-05-16 09:43:12','test-user','Nonediting Author','482c5e44-6b30-42de-922f-aa06ff968a41',_binary '',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0'),(6,0,'4ab6e779-a7c3-4b52-87de-b19fe2810ff4','2019-05-16 09:43:12','test-user','2019-05-16 09:43:12','test-user','None','890b2302-516a-4c38-a2e2-517296a0ada5',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `mfr_permission_level_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_private_forum_t`
--

DROP TABLE IF EXISTS `mfr_private_forum_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_private_forum_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(36) NOT NULL,
  `MODIFIED` datetime NOT NULL,
  `MODIFIED_BY` varchar(36) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `SHORT_DESCRIPTION` varchar(255) DEFAULT NULL,
  `EXTENDED_DESCRIPTION` longtext,
  `TYPE_UUID` varchar(36) NOT NULL,
  `SORT_INDEX` int(11) NOT NULL,
  `OWNER` varchar(255) NOT NULL,
  `AUTO_FORWARD` bit(1) DEFAULT NULL,
  `AUTO_FORWARD_EMAIL` varchar(255) DEFAULT NULL,
  `PREVIEW_PANE_ENABLED` bit(1) DEFAULT NULL,
  `surrogateKey` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniquePFOwnerContext` (`OWNER`,`surrogateKey`),
  KEY `MFR_PRIVATE_FORUM_CREATED_I` (`CREATED`),
  KEY `MFR_PRIVATE_FORUM_OWNER_I` (`OWNER`),
  KEY `MFR_PF_PARENT_BASEFORUM_I` (`surrogateKey`),
  CONSTRAINT `FK_98p97jk2v9u07aiyg4qncccwa` FOREIGN KEY (`surrogateKey`) REFERENCES `mfr_area_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_private_forum_t`
--

LOCK TABLES `mfr_private_forum_t` WRITE;
/*!40000 ALTER TABLE `mfr_private_forum_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_private_forum_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_pvt_msg_usr_t`
--

DROP TABLE IF EXISTS `mfr_pvt_msg_usr_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_pvt_msg_usr_t` (
  `messageSurrogateKey` bigint(20) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `TYPE_UUID` varchar(255) NOT NULL,
  `CONTEXT_ID` varchar(255) NOT NULL,
  `READ_STATUS` bit(1) NOT NULL,
  `BCC` bit(1) NOT NULL DEFAULT b'0',
  `REPLIED` bit(1) NOT NULL,
  `user_index_col` int(11) NOT NULL,
  PRIMARY KEY (`messageSurrogateKey`,`user_index_col`),
  KEY `MFR_PVT_MSG_USR_I1` (`USER_ID`,`TYPE_UUID`,`CONTEXT_ID`,`READ_STATUS`),
  CONSTRAINT `FK_7bcanjqp5ve3t12gfywc0rvlk` FOREIGN KEY (`messageSurrogateKey`) REFERENCES `mfr_message_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_pvt_msg_usr_t`
--

LOCK TABLES `mfr_pvt_msg_usr_t` WRITE;
/*!40000 ALTER TABLE `mfr_pvt_msg_usr_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_pvt_msg_usr_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_rank_individual_t`
--

DROP TABLE IF EXISTS `mfr_rank_individual_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_rank_individual_t` (
  `RANK_ID` bigint(20) NOT NULL,
  `USER_ID` varchar(99) NOT NULL,
  PRIMARY KEY (`RANK_ID`,`USER_ID`),
  CONSTRAINT `FK_3cq6mnwb1a4vm7ce6c4x2gts8` FOREIGN KEY (`RANK_ID`) REFERENCES `mfr_rank_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_rank_individual_t`
--

LOCK TABLES `mfr_rank_individual_t` WRITE;
/*!40000 ALTER TABLE `mfr_rank_individual_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_rank_individual_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_rank_t`
--

DROP TABLE IF EXISTS `mfr_rank_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_rank_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(99) NOT NULL,
  `MODIFIED` datetime NOT NULL,
  `MODIFIED_BY` varchar(99) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `RANKTYPE` varchar(19) NOT NULL,
  `MIN_POST` bigint(20) DEFAULT NULL,
  `CONTEXT_ID` varchar(99) NOT NULL,
  `rankImage` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MFR_RANK_CONTEXT_ID_I` (`CONTEXT_ID`),
  KEY `FK_hc5f5hv7omiayciv9gruey6ve` (`rankImage`),
  CONSTRAINT `FK_hc5f5hv7omiayciv9gruey6ve` FOREIGN KEY (`rankImage`) REFERENCES `mfr_rankimage_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_rank_t`
--

LOCK TABLES `mfr_rank_t` WRITE;
/*!40000 ALTER TABLE `mfr_rank_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_rank_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_rankimage_t`
--

DROP TABLE IF EXISTS `mfr_rankimage_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_rankimage_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(255) NOT NULL,
  `MODIFIED` datetime NOT NULL,
  `MODIFIED_BY` varchar(255) NOT NULL,
  `ATTACHMENT_ID` varchar(255) NOT NULL,
  `ATTACHMENT_URL` varchar(255) NOT NULL,
  `ATTACHMENT_NAME` varchar(255) NOT NULL,
  `ATTACHMENT_SIZE` varchar(255) NOT NULL,
  `ATTACHMENT_TYPE` varchar(255) NOT NULL,
  `RANKID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_f4bvnhltogjqx1pvne23094bg` (`RANKID`),
  CONSTRAINT `FK_f4bvnhltogjqx1pvne23094bg` FOREIGN KEY (`RANKID`) REFERENCES `mfr_rank_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_rankimage_t`
--

LOCK TABLES `mfr_rankimage_t` WRITE;
/*!40000 ALTER TABLE `mfr_rankimage_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_rankimage_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_synoptic_item`
--

DROP TABLE IF EXISTS `mfr_synoptic_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_synoptic_item` (
  `SYNOPTIC_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `SITE_ID` varchar(99) NOT NULL,
  `SITE_TITLE` varchar(255) DEFAULT NULL,
  `NEW_MESSAGES_COUNT` int(11) DEFAULT NULL,
  `MESSAGES_LAST_VISIT_DT` datetime DEFAULT NULL,
  `NEW_FORUM_COUNT` int(11) DEFAULT NULL,
  `FORUM_LAST_VISIT_DT` datetime DEFAULT NULL,
  `HIDE_ITEM` bit(1) DEFAULT NULL,
  PRIMARY KEY (`SYNOPTIC_ITEM_ID`),
  UNIQUE KEY `MRF_SYN_UNIQUE` (`USER_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_synoptic_item`
--

LOCK TABLES `mfr_synoptic_item` WRITE;
/*!40000 ALTER TABLE `mfr_synoptic_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_synoptic_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_topic_t`
--

DROP TABLE IF EXISTS `mfr_topic_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_topic_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TOPIC_DTYPE` varchar(2) NOT NULL,
  `VERSION` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(36) NOT NULL,
  `MODIFIED` datetime NOT NULL,
  `MODIFIED_BY` varchar(36) NOT NULL,
  `DEFAULTASSIGNNAME` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) NOT NULL,
  `SHORT_DESCRIPTION` varchar(255) DEFAULT NULL,
  `EXTENDED_DESCRIPTION` longtext,
  `MODERATED` bit(1) NOT NULL,
  `POST_FIRST` bit(1) NOT NULL,
  `POST_ANONYMOUS` bit(1) NOT NULL,
  `REVEAL_IDS_TO_ROLES` bit(1) NOT NULL,
  `AUTO_MARK_THREADS_READ` bit(1) NOT NULL,
  `MUTABLE` bit(1) NOT NULL,
  `SORT_INDEX` int(11) NOT NULL,
  `TYPE_UUID` varchar(36) NOT NULL,
  `AVAILABILITY_RESTRICTED` bit(1) NOT NULL DEFAULT b'0',
  `AVAILABILITY` bit(1) NOT NULL DEFAULT b'1',
  `OPEN_DATE` datetime DEFAULT NULL,
  `CLOSE_DATE` datetime DEFAULT NULL,
  `of_surrogateKey` bigint(20) DEFAULT NULL,
  `pf_surrogateKey` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `CONTEXT_ID` varchar(255) DEFAULT NULL,
  `pt_surrogateKey` bigint(20) DEFAULT NULL,
  `LOCKED` bit(1) DEFAULT NULL,
  `DRAFT` bit(1) DEFAULT NULL,
  `CONFIDENTIAL_RESPONSES` bit(1) DEFAULT NULL,
  `MUST_RESPOND_BEFORE_READING` bit(1) DEFAULT NULL,
  `HOUR_BEFORE_RESPONSES_VISIBLE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MRF_TOPIC_DTYPE_I` (`TOPIC_DTYPE`),
  KEY `MFR_TOPIC_T_UUID_I` (`UUID`),
  KEY `MFR_TOPIC_CREATED_I` (`CREATED`),
  KEY `MFR_TOPIC_PARENT_I1` (`of_surrogateKey`),
  KEY `MFR_TOPIC_PARENT_I2` (`pf_surrogateKey`),
  KEY `MFR_PT_CONTEXT_I` (`CONTEXT_ID`),
  KEY `MFR_TOPIC_PRI_PARENT_I` (`pt_surrogateKey`),
  CONSTRAINT `FK_dbvudjm46quajsdag0e5ekuvf` FOREIGN KEY (`pt_surrogateKey`) REFERENCES `mfr_topic_t` (`ID`),
  CONSTRAINT `FK_6f5mdobfm1348050qpbf8w06j` FOREIGN KEY (`pf_surrogateKey`) REFERENCES `mfr_private_forum_t` (`ID`),
  CONSTRAINT `FK_hbpoytuof1ckyc87m36hkq1qj` FOREIGN KEY (`of_surrogateKey`) REFERENCES `mfr_open_forum_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_topic_t`
--

LOCK TABLES `mfr_topic_t` WRITE;
/*!40000 ALTER TABLE `mfr_topic_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_topic_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr_unread_status_t`
--

DROP TABLE IF EXISTS `mfr_unread_status_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mfr_unread_status_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `TOPIC_C` bigint(20) NOT NULL,
  `MESSAGE_C` bigint(20) NOT NULL,
  `USER_C` varchar(255) NOT NULL,
  `READ_C` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniqueUserTopicMessage` (`TOPIC_C`,`MESSAGE_C`,`USER_C`),
  KEY `MFR_UNREAD_STATUS_I1` (`TOPIC_C`,`MESSAGE_C`,`USER_C`,`READ_C`),
  KEY `MFR_UNREAD_STATUS_I2` (`MESSAGE_C`,`USER_C`,`READ_C`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr_unread_status_t`
--

LOCK TABLES `mfr_unread_status_t` WRITE;
/*!40000 ALTER TABLE `mfr_unread_status_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfr_unread_status_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_accessors`
--

DROP TABLE IF EXISTS `oauth_accessors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_accessors` (
  `token` varchar(255) NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `consumerId` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `callbackUrl` varchar(255) DEFAULT NULL,
  `verifier` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `accessorSecret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `user_idx` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_accessors`
--

LOCK TABLES `oauth_accessors` WRITE;
/*!40000 ALTER TABLE `oauth_accessors` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_accessors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_consumers`
--

DROP TABLE IF EXISTS `oauth_consumers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_consumers` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `callbackUrl` varchar(255) DEFAULT NULL,
  `secret` varchar(255) NOT NULL,
  `accessorSecret` varchar(255) DEFAULT NULL,
  `recordModeEnabled` bit(1) DEFAULT NULL,
  `defaultValidity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_consumers`
--

LOCK TABLES `oauth_consumers` WRITE;
/*!40000 ALTER TABLE `oauth_consumers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_consumers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_rights`
--

DROP TABLE IF EXISTS `oauth_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_rights` (
  `id` varchar(255) NOT NULL,
  `accessright` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`accessright`),
  CONSTRAINT `FK_98rb5gqd1cegti2y9vc8md8n6` FOREIGN KEY (`id`) REFERENCES `oauth_consumers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_rights`
--

LOCK TABLES `oauth_rights` WRITE;
/*!40000 ALTER TABLE `oauth_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasystem_banner_alert`
--

DROP TABLE IF EXISTS `pasystem_banner_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pasystem_banner_alert` (
  `uuid` char(36) NOT NULL,
  `message` varchar(4000) NOT NULL,
  `hosts` varchar(512) DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  `start_time` bigint(20) DEFAULT NULL,
  `end_time` bigint(20) DEFAULT NULL,
  `banner_type` varchar(255) DEFAULT 'warning',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasystem_banner_alert`
--

LOCK TABLES `pasystem_banner_alert` WRITE;
/*!40000 ALTER TABLE `pasystem_banner_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasystem_banner_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasystem_banner_dismissed`
--

DROP TABLE IF EXISTS `pasystem_banner_dismissed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pasystem_banner_dismissed` (
  `uuid` char(36) DEFAULT NULL,
  `user_id` varchar(99) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `dismiss_time` bigint(20) DEFAULT NULL,
  UNIQUE KEY `unique_banner_dismissed` (`user_id`,`state`,`uuid`),
  KEY `uuid` (`uuid`),
  KEY `user_id` (`user_id`),
  KEY `state` (`state`),
  CONSTRAINT `pasystem_banner_dismissed_ibfk_1` FOREIGN KEY (`uuid`) REFERENCES `pasystem_banner_alert` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasystem_banner_dismissed`
--

LOCK TABLES `pasystem_banner_dismissed` WRITE;
/*!40000 ALTER TABLE `pasystem_banner_dismissed` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasystem_banner_dismissed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasystem_popup_assign`
--

DROP TABLE IF EXISTS `pasystem_popup_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pasystem_popup_assign` (
  `uuid` char(36) DEFAULT NULL,
  `user_id` varchar(99) DEFAULT NULL,
  KEY `uuid` (`uuid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pasystem_popup_assign_ibfk_1` FOREIGN KEY (`uuid`) REFERENCES `pasystem_popup_screens` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasystem_popup_assign`
--

LOCK TABLES `pasystem_popup_assign` WRITE;
/*!40000 ALTER TABLE `pasystem_popup_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasystem_popup_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasystem_popup_content`
--

DROP TABLE IF EXISTS `pasystem_popup_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pasystem_popup_content` (
  `uuid` char(36) NOT NULL,
  `template_content` mediumtext,
  PRIMARY KEY (`uuid`),
  CONSTRAINT `pasystem_popup_content_ibfk_1` FOREIGN KEY (`uuid`) REFERENCES `pasystem_popup_screens` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasystem_popup_content`
--

LOCK TABLES `pasystem_popup_content` WRITE;
/*!40000 ALTER TABLE `pasystem_popup_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasystem_popup_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasystem_popup_dismissed`
--

DROP TABLE IF EXISTS `pasystem_popup_dismissed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pasystem_popup_dismissed` (
  `uuid` char(36) DEFAULT NULL,
  `user_id` varchar(99) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `dismiss_time` bigint(20) DEFAULT NULL,
  UNIQUE KEY `unique_popup_dismissed` (`user_id`,`state`,`uuid`),
  KEY `uuid` (`uuid`),
  KEY `user_id` (`user_id`),
  KEY `state` (`state`),
  CONSTRAINT `pasystem_popup_dismissed_ibfk_1` FOREIGN KEY (`uuid`) REFERENCES `pasystem_popup_screens` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasystem_popup_dismissed`
--

LOCK TABLES `pasystem_popup_dismissed` WRITE;
/*!40000 ALTER TABLE `pasystem_popup_dismissed` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasystem_popup_dismissed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasystem_popup_screens`
--

DROP TABLE IF EXISTS `pasystem_popup_screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pasystem_popup_screens` (
  `uuid` char(36) NOT NULL,
  `descriptor` varchar(255) DEFAULT NULL,
  `start_time` bigint(20) DEFAULT NULL,
  `end_time` bigint(20) DEFAULT NULL,
  `open_campaign` int(1) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `start_time` (`start_time`),
  KEY `descriptor` (`descriptor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasystem_popup_screens`
--

LOCK TABLES `pasystem_popup_screens` WRITE;
/*!40000 ALTER TABLE `pasystem_popup_screens` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasystem_popup_screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_option`
--

DROP TABLE IF EXISTS `poll_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `poll_option` (
  `OPTION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OPTION_POLL_ID` bigint(20) DEFAULT NULL,
  `OPTION_TEXT` longtext,
  `OPTION_UUID` varchar(255) DEFAULT NULL,
  `DELETED` bit(1) DEFAULT NULL,
  PRIMARY KEY (`OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_option`
--

LOCK TABLES `poll_option` WRITE;
/*!40000 ALTER TABLE `poll_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_poll`
--

DROP TABLE IF EXISTS `poll_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `poll_poll` (
  `POLL_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `POLL_OWNER` varchar(255) DEFAULT NULL,
  `POLL_SITE_ID` varchar(255) DEFAULT NULL,
  `POLL_DETAILS` longtext,
  `POLL_CREATION_DATE` datetime DEFAULT NULL,
  `POLL_TEXT` longtext,
  `POLL_VOTE_OPEN` datetime DEFAULT NULL,
  `POLL_VOTE_CLOSE` datetime DEFAULT NULL,
  `POLL_MIN_OPTIONS` int(11) DEFAULT NULL,
  `POLL_MAX_OPTIONS` int(11) DEFAULT NULL,
  `POLL_DISPLAY_RESULT` varchar(255) DEFAULT NULL,
  `POLL_LIMIT_VOTE` bit(1) DEFAULT NULL,
  `POLL_UUID` varchar(255) DEFAULT NULL,
  `POLL_IS_PUBLIC` bit(1) DEFAULT NULL,
  PRIMARY KEY (`POLL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_poll`
--

LOCK TABLES `poll_poll` WRITE;
/*!40000 ALTER TABLE `poll_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_vote`
--

DROP TABLE IF EXISTS `poll_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `poll_vote` (
  `VOTE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(255) DEFAULT NULL,
  `VOTE_IP` varchar(255) DEFAULT NULL,
  `VOTE_DATE` datetime DEFAULT NULL,
  `VOTE_POLL_ID` bigint(20) DEFAULT NULL,
  `VOTE_OPTION` bigint(20) DEFAULT NULL,
  `VOTE_SUBMISSION_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`VOTE_ID`),
  KEY `POLLTOOL_VOTE_USERID_IDX` (`USER_ID`),
  KEY `POLLTOOL_VOTE_POLLID_IDX` (`VOTE_POLL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_vote`
--

LOCK TABLES `poll_vote` WRITE;
/*!40000 ALTER TABLE `poll_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_company_profiles_t`
--

DROP TABLE IF EXISTS `profile_company_profiles_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_company_profiles_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_UUID` varchar(99) NOT NULL,
  `COMPANY_NAME` varchar(255) DEFAULT NULL,
  `COMPANY_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `COMPANY_WEB_ADDRESS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PROFILE_CP_USER_UUID_I` (`USER_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_company_profiles_t`
--

LOCK TABLES `profile_company_profiles_t` WRITE;
/*!40000 ALTER TABLE `profile_company_profiles_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_company_profiles_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_external_integration_t`
--

DROP TABLE IF EXISTS `profile_external_integration_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_external_integration_t` (
  `USER_UUID` varchar(99) NOT NULL,
  `TWITTER_TOKEN` varchar(255) DEFAULT NULL,
  `TWITTER_SECRET` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_external_integration_t`
--

LOCK TABLES `profile_external_integration_t` WRITE;
/*!40000 ALTER TABLE `profile_external_integration_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_external_integration_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_friends_t`
--

DROP TABLE IF EXISTS `profile_friends_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_friends_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_UUID` varchar(99) NOT NULL,
  `FRIEND_UUID` varchar(99) NOT NULL,
  `RELATIONSHIP` int(11) NOT NULL,
  `REQUESTED_DATE` datetime NOT NULL,
  `CONFIRMED` bit(1) NOT NULL,
  `CONFIRMED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PROFILE_FRIENDS_USER_UUID_I` (`USER_UUID`),
  KEY `PROFILE_FRIENDS_FRIEND_UUID_I` (`FRIEND_UUID`),
  KEY `PROFILE_FRIENDS_CONFIRMED_I` (`CONFIRMED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_friends_t`
--

LOCK TABLES `profile_friends_t` WRITE;
/*!40000 ALTER TABLE `profile_friends_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_friends_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_gallery_images_t`
--

DROP TABLE IF EXISTS `profile_gallery_images_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_gallery_images_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_UUID` varchar(99) NOT NULL,
  `RESOURCE_MAIN` varchar(4000) NOT NULL,
  `RESOURCE_THUMB` varchar(4000) NOT NULL,
  `DISPLAY_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PROFILE_GI_USER_UUID_I` (`USER_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_gallery_images_t`
--

LOCK TABLES `profile_gallery_images_t` WRITE;
/*!40000 ALTER TABLE `profile_gallery_images_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_gallery_images_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_images_external_t`
--

DROP TABLE IF EXISTS `profile_images_external_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_images_external_t` (
  `USER_UUID` varchar(99) NOT NULL,
  `URL_MAIN` varchar(4000) NOT NULL,
  `URL_THUMB` varchar(4000) DEFAULT NULL,
  `URL_AVATAR` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`USER_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_images_external_t`
--

LOCK TABLES `profile_images_external_t` WRITE;
/*!40000 ALTER TABLE `profile_images_external_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_images_external_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_images_official_t`
--

DROP TABLE IF EXISTS `profile_images_official_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_images_official_t` (
  `USER_UUID` varchar(99) NOT NULL,
  `URL` varchar(4000) NOT NULL,
  PRIMARY KEY (`USER_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_images_official_t`
--

LOCK TABLES `profile_images_official_t` WRITE;
/*!40000 ALTER TABLE `profile_images_official_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_images_official_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_images_t`
--

DROP TABLE IF EXISTS `profile_images_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_images_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_UUID` varchar(99) NOT NULL,
  `RESOURCE_MAIN` varchar(4000) NOT NULL,
  `RESOURCE_THUMB` varchar(4000) NOT NULL,
  `RESOURCE_AVATAR` varchar(4000) NOT NULL,
  `IS_CURRENT` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PROFILE_IMAGES_USER_UUID_I` (`USER_UUID`),
  KEY `PROFILE_IMAGES_IS_CURRENT_I` (`IS_CURRENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_images_t`
--

LOCK TABLES `profile_images_t` WRITE;
/*!40000 ALTER TABLE `profile_images_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_images_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_kudos_t`
--

DROP TABLE IF EXISTS `profile_kudos_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_kudos_t` (
  `USER_UUID` varchar(99) NOT NULL,
  `SCORE` int(11) NOT NULL,
  `PERCENTAGE` decimal(19,2) NOT NULL,
  `DATE_ADDED` datetime NOT NULL,
  PRIMARY KEY (`USER_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_kudos_t`
--

LOCK TABLES `profile_kudos_t` WRITE;
/*!40000 ALTER TABLE `profile_kudos_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_kudos_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_message_participants_t`
--

DROP TABLE IF EXISTS `profile_message_participants_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_message_participants_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` varchar(36) NOT NULL,
  `PARTICIPANT_UUID` varchar(99) NOT NULL,
  `MESSAGE_READ` bit(1) NOT NULL,
  `MESSAGE_DELETED` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PROFILE_M_P_MESSAGE_ID_I` (`MESSAGE_ID`),
  KEY `PROFILE_M_P_UUID_I` (`PARTICIPANT_UUID`),
  KEY `PROFILE_M_P_READ_I` (`MESSAGE_READ`),
  KEY `PROFILE_M_P_DELETED_I` (`MESSAGE_DELETED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_message_participants_t`
--

LOCK TABLES `profile_message_participants_t` WRITE;
/*!40000 ALTER TABLE `profile_message_participants_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_message_participants_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_message_threads_t`
--

DROP TABLE IF EXISTS `profile_message_threads_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_message_threads_t` (
  `ID` varchar(36) NOT NULL,
  `SUBJECT` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_message_threads_t`
--

LOCK TABLES `profile_message_threads_t` WRITE;
/*!40000 ALTER TABLE `profile_message_threads_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_message_threads_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_messages_t`
--

DROP TABLE IF EXISTS `profile_messages_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_messages_t` (
  `ID` varchar(36) NOT NULL,
  `FROM_UUID` varchar(99) NOT NULL,
  `MESSAGE_BODY` varchar(4000) NOT NULL,
  `MESSAGE_THREAD` varchar(36) NOT NULL,
  `DATE_POSTED` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PROFILE_M_FROM_UUID_I` (`FROM_UUID`),
  KEY `PROFILE_M_THREAD_I` (`MESSAGE_THREAD`),
  KEY `PROFILE_M_DATE_POSTED_I` (`DATE_POSTED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_messages_t`
--

LOCK TABLES `profile_messages_t` WRITE;
/*!40000 ALTER TABLE `profile_messages_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_messages_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_preferences_t`
--

DROP TABLE IF EXISTS `profile_preferences_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_preferences_t` (
  `USER_UUID` varchar(99) NOT NULL,
  `EMAIL_REQUEST` bit(1) NOT NULL,
  `EMAIL_CONFIRM` bit(1) NOT NULL,
  `EMAIL_MESSAGE_NEW` bit(1) NOT NULL,
  `EMAIL_MESSAGE_REPLY` bit(1) NOT NULL,
  `USE_OFFICIAL_IMAGE` bit(1) NOT NULL,
  `SHOW_KUDOS` bit(1) NOT NULL,
  `SHOW_GALLERY_FEED` bit(1) NOT NULL,
  `USE_GRAVATAR` bit(1) NOT NULL,
  `EMAIL_WALL_ITEM_NEW` bit(1) NOT NULL,
  `EMAIL_WORKSITE_NEW` bit(1) NOT NULL,
  `SHOW_ONLINE_STATUS` bit(1) NOT NULL,
  PRIMARY KEY (`USER_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_preferences_t`
--

LOCK TABLES `profile_preferences_t` WRITE;
/*!40000 ALTER TABLE `profile_preferences_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_preferences_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_privacy_t`
--

DROP TABLE IF EXISTS `profile_privacy_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_privacy_t` (
  `USER_UUID` varchar(99) NOT NULL,
  `PROFILE_IMAGE` int(11) NOT NULL,
  `BASIC_INFO` int(11) NOT NULL,
  `CONTACT_INFO` int(11) NOT NULL,
  `BUSINESS_INFO` int(11) NOT NULL,
  `PERSONAL_INFO` int(11) NOT NULL,
  `BIRTH_YEAR` bit(1) NOT NULL,
  `MY_FRIENDS` int(11) NOT NULL,
  `MY_STATUS` int(11) NOT NULL,
  `MY_PICTURES` int(11) NOT NULL,
  `MESSAGES` int(11) NOT NULL,
  `STAFF_INFO` int(11) NOT NULL,
  `STUDENT_INFO` int(11) NOT NULL,
  `SOCIAL_NETWORKING_INFO` int(11) NOT NULL,
  `MY_KUDOS` int(11) NOT NULL,
  `MY_WALL` int(11) NOT NULL,
  `ONLINE_STATUS` int(11) NOT NULL,
  PRIMARY KEY (`USER_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_privacy_t`
--

LOCK TABLES `profile_privacy_t` WRITE;
/*!40000 ALTER TABLE `profile_privacy_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_privacy_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_social_info_t`
--

DROP TABLE IF EXISTS `profile_social_info_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_social_info_t` (
  `USER_UUID` varchar(99) NOT NULL,
  `FACEBOOK_URL` varchar(255) DEFAULT NULL,
  `LINKEDIN_URL` varchar(255) DEFAULT NULL,
  `MYSPACE_URL` varchar(255) DEFAULT NULL,
  `SKYPE_USERNAME` varchar(255) DEFAULT NULL,
  `TWITTER_URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_social_info_t`
--

LOCK TABLES `profile_social_info_t` WRITE;
/*!40000 ALTER TABLE `profile_social_info_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_social_info_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_status_t`
--

DROP TABLE IF EXISTS `profile_status_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_status_t` (
  `USER_UUID` varchar(99) NOT NULL,
  `MESSAGE` varchar(255) NOT NULL,
  `DATE_ADDED` datetime NOT NULL,
  PRIMARY KEY (`USER_UUID`),
  KEY `PROFILE_STATUS_DATE_ADDED_I` (`DATE_ADDED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_status_t`
--

LOCK TABLES `profile_status_t` WRITE;
/*!40000 ALTER TABLE `profile_status_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_status_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_wall_item_comments_t`
--

DROP TABLE IF EXISTS `profile_wall_item_comments_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_wall_item_comments_t` (
  `WALL_ITEM_COMMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `WALL_ITEM_ID` bigint(20) NOT NULL,
  `CREATOR_UUID` varchar(99) NOT NULL,
  `WALL_ITEM_COMMENT_TEXT` varchar(4000) NOT NULL,
  `WALL_ITEM_COMMENT_DATE` datetime NOT NULL,
  PRIMARY KEY (`WALL_ITEM_COMMENT_ID`),
  KEY `FK_dtcuqo7etspxy65sf6ki1sgn4` (`WALL_ITEM_ID`),
  CONSTRAINT `FK_dtcuqo7etspxy65sf6ki1sgn4` FOREIGN KEY (`WALL_ITEM_ID`) REFERENCES `profile_wall_items_t` (`WALL_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_wall_item_comments_t`
--

LOCK TABLES `profile_wall_item_comments_t` WRITE;
/*!40000 ALTER TABLE `profile_wall_item_comments_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_wall_item_comments_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_wall_items_t`
--

DROP TABLE IF EXISTS `profile_wall_items_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile_wall_items_t` (
  `WALL_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_UUID` varchar(99) NOT NULL,
  `CREATOR_UUID` varchar(99) NOT NULL,
  `WALL_ITEM_TYPE` int(11) NOT NULL,
  `WALL_ITEM_TEXT` varchar(4000) NOT NULL,
  `WALL_ITEM_DATE` datetime NOT NULL,
  PRIMARY KEY (`WALL_ITEM_ID`),
  KEY `PROFILE_WI_USER_UUID_I` (`USER_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_wall_items_t`
--

LOCK TABLES `profile_wall_items_t` WRITE;
/*!40000 ALTER TABLE `profile_wall_items_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_wall_items_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
INSERT INTO `qrtz_cron_triggers` VALUES ('QuartzScheduler','Nightly Log Purge Trigger','DEFAULT','0 0 0 * * ? *','Asia/Bangkok');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
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
 SET character_set_client = utf8mb4 ;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` VALUES ('QuartzScheduler','Event Log Purge','DEFAULT',NULL,'org.sakaiproject.component.app.scheduler.jobs.SpringConfigurableJobBeanWrapper','1','0','0','1',_binary '#\r\n#Thu May 16 09:43:08 ICT 2019\r\norg.sakaiproject.api.app.scheduler.JobBeanWrapper.bean=eventPurgeJob\r\norg.sakaiproject.api.app.scheduler.JobBeanWrapper.jobType=Event Log Purge\r\nnumber.days=7\r\n');
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
INSERT INTO `qrtz_locks` VALUES ('QuartzScheduler','CALENDAR_ACCESS'),('QuartzScheduler','JOB_ACCESS'),('QuartzScheduler','MISFIRE_ACCESS'),('QuartzScheduler','STATE_ACCESS'),('QuartzScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` VALUES ('QuartzScheduler','Nightly Log Purge Trigger','DEFAULT','Event Log Purge','DEFAULT',NULL,1558026000000,-1,5,'WAITING','CRON',1557974588000,0,NULL,0,'');
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rwikicurrentcontent`
--

DROP TABLE IF EXISTS `rwikicurrentcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rwikicurrentcontent` (
  `id` varchar(36) NOT NULL,
  `rwikiid` varchar(36) NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`),
  KEY `irwikicurrentcontent_rwi` (`rwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rwikicurrentcontent`
--

LOCK TABLES `rwikicurrentcontent` WRITE;
/*!40000 ALTER TABLE `rwikicurrentcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `rwikicurrentcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rwikihistory`
--

DROP TABLE IF EXISTS `rwikihistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rwikihistory` (
  `id` varchar(36) NOT NULL,
  `version` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `realm` varchar(255) DEFAULT NULL,
  `referenced` varchar(4000) DEFAULT NULL,
  `userid` varchar(64) DEFAULT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `ownerRead` bit(1) DEFAULT NULL,
  `ownerWrite` bit(1) DEFAULT NULL,
  `ownerAdmin` bit(1) DEFAULT NULL,
  `groupRead` bit(1) DEFAULT NULL,
  `groupWrite` bit(1) DEFAULT NULL,
  `groupAdmin` bit(1) DEFAULT NULL,
  `publicRead` bit(1) DEFAULT NULL,
  `publicWrite` bit(1) DEFAULT NULL,
  `sha1` varchar(64) DEFAULT NULL,
  `revision` int(11) DEFAULT NULL,
  `rwikiobjectid` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `irwikihistory_name` (`name`),
  KEY `irwikihistory_realm` (`realm`),
  KEY `irwikihistoryobj_rwid` (`rwikiobjectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rwikihistory`
--

LOCK TABLES `rwikihistory` WRITE;
/*!40000 ALTER TABLE `rwikihistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `rwikihistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rwikihistorycontent`
--

DROP TABLE IF EXISTS `rwikihistorycontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rwikihistorycontent` (
  `id` varchar(36) NOT NULL,
  `rwikiid` varchar(36) NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`),
  KEY `irwikihistorycontent_rwi` (`rwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rwikihistorycontent`
--

LOCK TABLES `rwikihistorycontent` WRITE;
/*!40000 ALTER TABLE `rwikihistorycontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `rwikihistorycontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rwikiobject`
--

DROP TABLE IF EXISTS `rwikiobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rwikiobject` (
  `id` varchar(36) NOT NULL,
  `version` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `realm` varchar(255) DEFAULT NULL,
  `referenced` varchar(4000) DEFAULT NULL,
  `userid` varchar(64) DEFAULT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `ownerRead` bit(1) DEFAULT NULL,
  `ownerWrite` bit(1) DEFAULT NULL,
  `ownerAdmin` bit(1) DEFAULT NULL,
  `groupRead` bit(1) DEFAULT NULL,
  `groupWrite` bit(1) DEFAULT NULL,
  `groupAdmin` bit(1) DEFAULT NULL,
  `publicRead` bit(1) DEFAULT NULL,
  `publicWrite` bit(1) DEFAULT NULL,
  `sha1` varchar(64) DEFAULT NULL,
  `revision` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6urtfjh5iprbjqrkv91yf66m9` (`name`),
  KEY `irwikiobject_name` (`name`),
  KEY `irwikiobject_realm` (`realm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rwikiobject`
--

LOCK TABLES `rwikiobject` WRITE;
/*!40000 ALTER TABLE `rwikiobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `rwikiobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rwikipagemessage`
--

DROP TABLE IF EXISTS `rwikipagemessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rwikipagemessage` (
  `id` varchar(36) NOT NULL,
  `sessionid` varchar(255) DEFAULT NULL,
  `userid` varchar(64) NOT NULL,
  `pagespace` varchar(255) DEFAULT NULL,
  `pagename` varchar(255) DEFAULT NULL,
  `lastseen` datetime DEFAULT NULL,
  `message` longtext,
  PRIMARY KEY (`id`),
  KEY `irwikipm_sessionid` (`sessionid`),
  KEY `irwikipm_user` (`userid`),
  KEY `irwikipm_pagespace` (`pagespace`),
  KEY `irwikipm_pagename` (`pagename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rwikipagemessage`
--

LOCK TABLES `rwikipagemessage` WRITE;
/*!40000 ALTER TABLE `rwikipagemessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `rwikipagemessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rwikipagepresence`
--

DROP TABLE IF EXISTS `rwikipagepresence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rwikipagepresence` (
  `id` varchar(36) NOT NULL,
  `sessionid` varchar(255) DEFAULT NULL,
  `userid` varchar(64) NOT NULL,
  `pagespace` varchar(255) DEFAULT NULL,
  `pagename` varchar(255) DEFAULT NULL,
  `lastseen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `irwikipp_sessionid` (`sessionid`),
  KEY `irwikipp_user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rwikipagepresence`
--

LOCK TABLES `rwikipagepresence` WRITE;
/*!40000 ALTER TABLE `rwikipagepresence` DISABLE KEYS */;
/*!40000 ALTER TABLE `rwikipagepresence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rwikipagetrigger`
--

DROP TABLE IF EXISTS `rwikipagetrigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rwikipagetrigger` (
  `id` varchar(36) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `pagespace` varchar(255) DEFAULT NULL,
  `pagename` varchar(255) DEFAULT NULL,
  `lastseen` datetime DEFAULT NULL,
  `triggerspec` longtext,
  PRIMARY KEY (`id`),
  KEY `irwikipt_user` (`userid`),
  KEY `irwikipt_pagespace` (`pagespace`),
  KEY `irwikipt_pavename` (`pagename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rwikipagetrigger`
--

LOCK TABLES `rwikipagetrigger` WRITE;
/*!40000 ALTER TABLE `rwikipagetrigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `rwikipagetrigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rwikipreference`
--

DROP TABLE IF EXISTS `rwikipreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rwikipreference` (
  `id` varchar(36) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `lastseen` datetime DEFAULT NULL,
  `prefcontext` varchar(255) DEFAULT NULL,
  `preftype` varchar(64) DEFAULT NULL,
  `preference` longtext,
  PRIMARY KEY (`id`),
  KEY `irwikipr_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rwikipreference`
--

LOCK TABLES `rwikipreference` WRITE;
/*!40000 ALTER TABLE `rwikipreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `rwikipreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rwikiproperties`
--

DROP TABLE IF EXISTS `rwikiproperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rwikiproperties` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_b07q7wfpx20hapev9ol9e35jv` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rwikiproperties`
--

LOCK TABLES `rwikiproperties` WRITE;
/*!40000 ALTER TABLE `rwikiproperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `rwikiproperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_alias`
--

DROP TABLE IF EXISTS `sakai_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_alias` (
  `ALIAS_ID` varchar(99) NOT NULL,
  `TARGET` varchar(255) DEFAULT NULL,
  `CREATEDBY` varchar(99) NOT NULL,
  `MODIFIEDBY` varchar(99) NOT NULL,
  `CREATEDON` datetime NOT NULL,
  `MODIFIEDON` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ALIAS_ID`),
  KEY `IE_SAKAI_ALIAS_CREATED` (`CREATEDBY`,`CREATEDON`),
  KEY `IE_SAKAI_ALIAS_MODDED` (`MODIFIEDBY`,`MODIFIEDON`),
  KEY `IE_SAKAI_ALIAS_TARGET` (`TARGET`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_alias`
--

LOCK TABLES `sakai_alias` WRITE;
/*!40000 ALTER TABLE `sakai_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_alias_property`
--

DROP TABLE IF EXISTS `sakai_alias_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_alias_property` (
  `ALIAS_ID` varchar(99) NOT NULL,
  `NAME` varchar(99) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`ALIAS_ID`,`NAME`),
  CONSTRAINT `sakai_alias_property_ibfk_1` FOREIGN KEY (`ALIAS_ID`) REFERENCES `sakai_alias` (`ALIAS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_alias_property`
--

LOCK TABLES `sakai_alias_property` WRITE;
/*!40000 ALTER TABLE `sakai_alias_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_alias_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_cluster`
--

DROP TABLE IF EXISTS `sakai_cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_cluster` (
  `SERVER_ID_INSTANCE` varchar(64) NOT NULL DEFAULT '',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `STATUS` enum('STARTING','RUNNING','CLOSING','STOPPING') DEFAULT NULL,
  `SERVER_ID` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`SERVER_ID_INSTANCE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_cluster`
--

LOCK TABLES `sakai_cluster` WRITE;
/*!40000 ALTER TABLE `sakai_cluster` DISABLE KEYS */;
INSERT INTO `sakai_cluster` VALUES ('DESKTOP-5KJOF7T-1557974578772','2019-05-16 02:59:25','RUNNING','DESKTOP-5KJOF7T');
/*!40000 ALTER TABLE `sakai_cluster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_config_item`
--

DROP TABLE IF EXISTS `sakai_config_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_config_item` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NODE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(3000) DEFAULT NULL,
  `RAW_VALUE` varchar(3000) DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DEFAULT_VALUE` varchar(3000) DEFAULT NULL,
  `DESCRIPTION` varchar(3000) DEFAULT NULL,
  `SOURCE` varchar(255) DEFAULT NULL,
  `DEFAULTED` bit(1) NOT NULL,
  `REGISTERED` bit(1) NOT NULL,
  `SECURED` bit(1) NOT NULL,
  `DYNAMIC` bit(1) NOT NULL,
  `CREATED` datetime NOT NULL,
  `MODIFIED` datetime NOT NULL,
  `POLL_ON` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SCI_NODE_IDX` (`NODE`),
  KEY `SCI_NAME_IDX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_config_item`
--

LOCK TABLES `sakai_config_item` WRITE;
/*!40000 ALTER TABLE `sakai_config_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_config_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_digest`
--

DROP TABLE IF EXISTS `sakai_digest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_digest` (
  `DIGEST_ID` varchar(99) NOT NULL,
  `XML` longtext,
  UNIQUE KEY `SAKAI_DIGEST_INDEX` (`DIGEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_digest`
--

LOCK TABLES `sakai_digest` WRITE;
/*!40000 ALTER TABLE `sakai_digest` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_digest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_event`
--

DROP TABLE IF EXISTS `sakai_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_event` (
  `EVENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EVENT_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EVENT` varchar(32) DEFAULT NULL,
  `REF` varchar(255) DEFAULT NULL,
  `CONTEXT` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(163) DEFAULT NULL,
  `EVENT_CODE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`EVENT_ID`),
  KEY `IE_SAKAI_EVENT_SESSION_ID` (`SESSION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_event`
--

LOCK TABLES `sakai_event` WRITE;
/*!40000 ALTER TABLE `sakai_event` DISABLE KEYS */;
INSERT INTO `sakai_event` VALUES (1,'2019-05-15 19:43:19','realm.add','/realm//site/citationsAdmin',NULL,'~DESKTOP-5KJOF7T~admin','m'),(2,'2019-05-15 19:43:19','realm.clear.cache','/realm//site/citationsAdmin',NULL,'~DESKTOP-5KJOF7T~admin','m'),(3,'2019-05-15 19:43:19','site.usersite.invalidate','citationsAdmin',NULL,'~DESKTOP-5KJOF7T~admin','m'),(4,'2019-05-15 19:43:19','realm.upd','/realm//site/citationsAdmin',NULL,'~DESKTOP-5KJOF7T~admin','m'),(5,'2019-05-15 19:43:19','realm.clear.cache','/realm//site/citationsAdmin',NULL,'~DESKTOP-5KJOF7T~admin','m'),(6,'2019-05-15 19:43:19','site.usersite.invalidate','citationsAdmin',NULL,'~DESKTOP-5KJOF7T~admin','m'),(7,'2019-05-15 19:43:19','site.add','/site/citationsAdmin',NULL,'~DESKTOP-5KJOF7T~admin','m'),(8,'2019-05-15 19:43:19','site.upd','/site/citationsAdmin',NULL,'~DESKTOP-5KJOF7T~admin','m');
/*!40000 ALTER TABLE `sakai_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_event_delay`
--

DROP TABLE IF EXISTS `sakai_event_delay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_event_delay` (
  `EVENT_DELAY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EVENT` varchar(32) DEFAULT NULL,
  `REF` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(99) DEFAULT NULL,
  `EVENT_CODE` varchar(1) DEFAULT NULL,
  `PRIORITY` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`EVENT_DELAY_ID`),
  KEY `IE_SAKAI_EVENT_DELAY_RESOURCE` (`REF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_event_delay`
--

LOCK TABLES `sakai_event_delay` WRITE;
/*!40000 ALTER TABLE `sakai_event_delay` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_event_delay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_feedback`
--

DROP TABLE IF EXISTS `sakai_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(99) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `site_id` varchar(99) NOT NULL,
  `report_type` enum('content','technical','helpdesk','suggestions','supplementala','supplementalb') NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_feedback`
--

LOCK TABLES `sakai_feedback` WRITE;
/*!40000 ALTER TABLE `sakai_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_locks`
--

DROP TABLE IF EXISTS `sakai_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_locks` (
  `TABLE_NAME` varchar(64) DEFAULT NULL,
  `RECORD_ID` varchar(512) DEFAULT NULL,
  `LOCK_TIME` datetime DEFAULT NULL,
  `USAGE_SESSION_ID` varchar(36) DEFAULT NULL,
  UNIQUE KEY `SAKAI_LOCKS_INDEX` (`TABLE_NAME`,`RECORD_ID`(128))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_locks`
--

LOCK TABLES `sakai_locks` WRITE;
/*!40000 ALTER TABLE `sakai_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_message_bundle`
--

DROP TABLE IF EXISTS `sakai_message_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_message_bundle` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BASENAME` varchar(255) NOT NULL,
  `DEFAULT_VALUE` longtext,
  `LOCALE` varchar(255) NOT NULL,
  `MODULE_NAME` varchar(255) NOT NULL,
  `PROP_NAME` varchar(255) NOT NULL,
  `PROP_VALUE` longtext,
  PRIMARY KEY (`ID`),
  KEY `SMB_BASENAME_IDX` (`BASENAME`),
  KEY `SMB_MODULE_IDX` (`MODULE_NAME`),
  KEY `SMB_LOCALE_IDX` (`LOCALE`),
  KEY `SMB_PROPNAME_IDX` (`PROP_NAME`),
  KEY `SMB_SEARCH` (`BASENAME`,`MODULE_NAME`,`LOCALE`,`PROP_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_message_bundle`
--

LOCK TABLES `sakai_message_bundle` WRITE;
/*!40000 ALTER TABLE `sakai_message_bundle` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_message_bundle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_notification`
--

DROP TABLE IF EXISTS `sakai_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_notification` (
  `NOTIFICATION_ID` varchar(99) NOT NULL,
  `XML` longtext,
  UNIQUE KEY `SAKAI_NOTIFICATION_INDEX` (`NOTIFICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_notification`
--

LOCK TABLES `sakai_notification` WRITE;
/*!40000 ALTER TABLE `sakai_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_person_meta_t`
--

DROP TABLE IF EXISTS `sakai_person_meta_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_person_meta_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_UUID` varchar(99) NOT NULL,
  `PROPERTY` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_person_meta_t`
--

LOCK TABLES `sakai_person_meta_t` WRITE;
/*!40000 ALTER TABLE `sakai_person_meta_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_person_meta_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_person_t`
--

DROP TABLE IF EXISTS `sakai_person_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_person_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PERSON_TYPE` varchar(3) NOT NULL,
  `VERSION` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `LAST_MODIFIED_BY` varchar(36) NOT NULL,
  `LAST_MODIFIED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(36) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `AGENT_UUID` varchar(99) NOT NULL,
  `TYPE_UUID` varchar(36) NOT NULL,
  `COMMON_NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SEE_ALSO` varchar(255) DEFAULT NULL,
  `STREET` varchar(255) DEFAULT NULL,
  `SURNAME` varchar(255) DEFAULT NULL,
  `TELEPHONE_NUMBER` varchar(255) DEFAULT NULL,
  `FAX_NUMBER` varchar(255) DEFAULT NULL,
  `LOCALITY_NAME` varchar(255) DEFAULT NULL,
  `OU` varchar(255) DEFAULT NULL,
  `PHYSICAL_DELIVERY_OFFICE_NAME` varchar(255) DEFAULT NULL,
  `POSTAL_ADDRESS` varchar(255) DEFAULT NULL,
  `POSTAL_CODE` varchar(255) DEFAULT NULL,
  `POST_OFFICE_BOX` varchar(255) DEFAULT NULL,
  `STATE_PROVINCE_NAME` varchar(255) DEFAULT NULL,
  `STREET_ADDRESS` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `BUSINESS_CATEGORY` varchar(255) DEFAULT NULL,
  `CAR_LICENSE` varchar(255) DEFAULT NULL,
  `DEPARTMENT_NUMBER` varchar(255) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `EMPLOYEE_NUMBER` varchar(255) DEFAULT NULL,
  `EMPLOYEE_TYPE` varchar(255) DEFAULT NULL,
  `GIVEN_NAME` varchar(255) DEFAULT NULL,
  `HOME_PHONE` varchar(255) DEFAULT NULL,
  `HOME_POSTAL_ADDRESS` varchar(255) DEFAULT NULL,
  `INITIALS` varchar(255) DEFAULT NULL,
  `JPEG_PHOTO` longblob,
  `LABELED_URI` varchar(255) DEFAULT NULL,
  `MAIL` varchar(255) DEFAULT NULL,
  `MANAGER` varchar(255) DEFAULT NULL,
  `MOBILE` varchar(255) DEFAULT NULL,
  `ORGANIZATION` varchar(255) DEFAULT NULL,
  `PAGER` varchar(255) DEFAULT NULL,
  `PREFERRED_LANGUAGE` varchar(255) DEFAULT NULL,
  `ROOM_NUMBER` varchar(255) DEFAULT NULL,
  `SECRETARY` varchar(255) DEFAULT NULL,
  `UID_C` varchar(255) DEFAULT NULL,
  `USER_CERTIFICATE` tinyblob,
  `USER_PKCS12` tinyblob,
  `USER_SMIME_CERTIFICATE` tinyblob,
  `X500_UNIQUE_ID` varchar(255) DEFAULT NULL,
  `AFFILIATION` varchar(255) DEFAULT NULL,
  `ENTITLEMENT` varchar(255) DEFAULT NULL,
  `NICKNAME` varchar(255) DEFAULT NULL,
  `ORG_DN` varchar(255) DEFAULT NULL,
  `ORG_UNIT_DN` varchar(255) DEFAULT NULL,
  `PRIMARY_AFFILIATION` varchar(255) DEFAULT NULL,
  `PRIMARY_ORG_UNIT_DN` varchar(255) DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(255) DEFAULT NULL,
  `CAMPUS` varchar(255) DEFAULT NULL,
  `HIDE_PRIVATE_INFO` bit(1) DEFAULT NULL,
  `HIDE_PUBLIC_INFO` bit(1) DEFAULT NULL,
  `NOTES` longtext,
  `PICTURE_URL` varchar(255) DEFAULT NULL,
  `SYSTEM_PICTURE_PREFERRED` bit(1) DEFAULT NULL,
  `ferpaEnabled` bit(1) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `FAVOURITE_BOOKS` longtext,
  `FAVOURITE_TV_SHOWS` longtext,
  `FAVOURITE_MOVIES` longtext,
  `FAVOURITE_QUOTES` longtext,
  `EDUCATION_COURSE` longtext,
  `EDUCATION_SUBJECTS` longtext,
  `NORMALIZEDMOBILE` varchar(255) DEFAULT NULL,
  `STAFF_PROFILE` longtext,
  `UNIVERSITY_PROFILE_URL` longtext,
  `ACADEMIC_PROFILE_URL` longtext,
  `PUBLICATIONS` longtext,
  `BUSINESS_BIOGRAPHY` longtext,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SAKAI_PERSON_BUSINESS_KEY_I` (`AGENT_UUID`,`TYPE_UUID`),
  UNIQUE KEY `UK_ludffuvbtj85siwglqklnxyo0` (`UUID`),
  KEY `SAKAI_PERSON_AGENT_UUID_I` (`AGENT_UUID`),
  KEY `SAKAI_PERSON_TYPE_UUID_I` (`TYPE_UUID`),
  KEY `SAKAI_PERSON_SURNAME_I` (`SURNAME`),
  KEY `SAKAI_PERSON_GIVEN_NAME_I` (`GIVEN_NAME`),
  KEY `SAKAI_PERSON_UID_I` (`UID_C`),
  KEY `SAKAI_PERSON_ferpaEnabled_I` (`ferpaEnabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_person_t`
--

LOCK TABLES `sakai_person_t` WRITE;
/*!40000 ALTER TABLE `sakai_person_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_person_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_postem_gradebook`
--

DROP TABLE IF EXISTS `sakai_postem_gradebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_postem_gradebook` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lockId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `context` varchar(36) NOT NULL,
  `creator` varchar(36) NOT NULL,
  `created` datetime NOT NULL,
  `last_updater` varchar(36) NOT NULL,
  `last_updated` datetime NOT NULL,
  `released` bit(1) NOT NULL,
  `stats` bit(1) NOT NULL,
  `file_reference` varchar(255) DEFAULT NULL,
  `template` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueGradebook` (`title`,`context`),
  KEY `POSTEM_GB_TITLE_I` (`title`),
  KEY `POSTEM_GB_CONTEXT_I` (`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_postem_gradebook`
--

LOCK TABLES `sakai_postem_gradebook` WRITE;
/*!40000 ALTER TABLE `sakai_postem_gradebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_postem_gradebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_postem_headings`
--

DROP TABLE IF EXISTS `sakai_postem_headings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_postem_headings` (
  `gradebook_id` bigint(20) NOT NULL,
  `heading` varchar(500) NOT NULL,
  `location` int(11) NOT NULL,
  PRIMARY KEY (`gradebook_id`,`location`),
  CONSTRAINT `FK_go5lxerpgw6uifetmpbuutrsa` FOREIGN KEY (`gradebook_id`) REFERENCES `sakai_postem_gradebook` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_postem_headings`
--

LOCK TABLES `sakai_postem_headings` WRITE;
/*!40000 ALTER TABLE `sakai_postem_headings` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_postem_headings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_postem_student`
--

DROP TABLE IF EXISTS `sakai_postem_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_postem_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lockId` int(11) NOT NULL,
  `username` varchar(99) NOT NULL,
  `last_checked` datetime DEFAULT NULL,
  `surrogate_key` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `POSTEM_USERNAME_SURROGATE` (`username`,`surrogate_key`),
  KEY `FK_2b6qkxw4wmeefujp1q72e4wjg` (`surrogate_key`),
  CONSTRAINT `FK_2b6qkxw4wmeefujp1q72e4wjg` FOREIGN KEY (`surrogate_key`) REFERENCES `sakai_postem_gradebook` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_postem_student`
--

LOCK TABLES `sakai_postem_student` WRITE;
/*!40000 ALTER TABLE `sakai_postem_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_postem_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_postem_student_grades`
--

DROP TABLE IF EXISTS `sakai_postem_student_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_postem_student_grades` (
  `student_id` bigint(20) NOT NULL,
  `grade` varchar(2000) DEFAULT NULL,
  `location` int(11) NOT NULL,
  PRIMARY KEY (`student_id`,`location`),
  CONSTRAINT `FK_e26k1ijh5wfnxev4s66lgw27y` FOREIGN KEY (`student_id`) REFERENCES `sakai_postem_student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_postem_student_grades`
--

LOCK TABLES `sakai_postem_student_grades` WRITE;
/*!40000 ALTER TABLE `sakai_postem_student_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_postem_student_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_preferences`
--

DROP TABLE IF EXISTS `sakai_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_preferences` (
  `PREFERENCES_ID` varchar(99) NOT NULL,
  `XML` longtext,
  UNIQUE KEY `SAKAI_PREFERENCES_INDEX` (`PREFERENCES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_preferences`
--

LOCK TABLES `sakai_preferences` WRITE;
/*!40000 ALTER TABLE `sakai_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_presence`
--

DROP TABLE IF EXISTS `sakai_presence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_presence` (
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `LOCATION_ID` varchar(255) DEFAULT NULL,
  KEY `SAKAI_PRESENCE_SESSION_INDEX` (`SESSION_ID`),
  KEY `SAKAI_PRESENCE_LOCATION_INDEX` (`LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_presence`
--

LOCK TABLES `sakai_presence` WRITE;
/*!40000 ALTER TABLE `sakai_presence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_presence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_privacy_record`
--

DROP TABLE IF EXISTS `sakai_privacy_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_privacy_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contextId` varchar(100) NOT NULL,
  `lockId` int(11) DEFAULT NULL,
  `recordType` varchar(100) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `viewable` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniquePrivacyRecord` (`contextId`,`recordType`,`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_privacy_record`
--

LOCK TABLES `sakai_privacy_record` WRITE;
/*!40000 ALTER TABLE `sakai_privacy_record` DISABLE KEYS */;
INSERT INTO `sakai_privacy_record` VALUES (1,'/site/citationsAdmin',0,'user_record','admin',_binary '');
/*!40000 ALTER TABLE `sakai_privacy_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_realm`
--

DROP TABLE IF EXISTS `sakai_realm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_realm` (
  `REALM_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `REALM_ID` varchar(255) NOT NULL,
  `PROVIDER_ID` varchar(4000) DEFAULT NULL,
  `MAINTAIN_ROLE` int(11) DEFAULT NULL,
  `CREATEDBY` varchar(99) DEFAULT NULL,
  `MODIFIEDBY` varchar(99) DEFAULT NULL,
  `CREATEDON` datetime DEFAULT NULL,
  `MODIFIEDON` datetime DEFAULT NULL,
  PRIMARY KEY (`REALM_KEY`),
  UNIQUE KEY `AK_SAKAI_REALM_ID` (`REALM_ID`),
  KEY `IE_SAKAI_REALM_CREATED` (`CREATEDBY`,`CREATEDON`),
  KEY `IE_SAKAI_REALM_MODDED` (`MODIFIEDBY`,`MODIFIEDON`),
  KEY `MAINTAIN_ROLE` (`MAINTAIN_ROLE`),
  CONSTRAINT `sakai_realm_ibfk_1` FOREIGN KEY (`MAINTAIN_ROLE`) REFERENCES `sakai_realm_role` (`ROLE_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_realm`
--

LOCK TABLES `sakai_realm` WRITE;
/*!40000 ALTER TABLE `sakai_realm` DISABLE KEYS */;
INSERT INTO `sakai_realm` VALUES (1,'!site.helper','',NULL,'admin','admin','2019-05-16 09:43:04','2019-05-16 09:43:04'),(2,'!site.user','',NULL,'admin','admin','2019-05-16 09:43:04','2019-05-16 09:43:04'),(3,'!user.template','',NULL,'admin','admin','2019-05-16 09:43:04','2019-05-16 09:43:04'),(4,'!user.template.guest','',NULL,'admin','admin','2019-05-16 09:43:04','2019-05-16 09:43:04'),(5,'!user.template.maintain','',NULL,'admin','admin','2019-05-16 09:43:04','2019-05-16 09:43:04'),(6,'!user.template.registered','',NULL,'admin','admin','2019-05-16 09:43:04','2019-05-16 09:43:04'),(7,'!user.template.sample','',NULL,'admin','admin','2019-05-16 09:43:04','2019-05-16 09:43:04'),(8,'!site.template','',10,'admin','admin','2019-05-16 09:43:04','2019-05-16 09:43:04'),(9,'!site.template.course','',9,'admin','admin','2019-05-16 09:43:04','2019-05-16 09:43:04'),(10,'!group.template','',NULL,'admin','admin','2019-05-16 09:43:05','2019-05-16 09:43:05'),(11,'!group.template.course','',9,'admin','admin','2019-05-16 09:43:05','2019-05-16 09:43:05'),(12,'/content/public/','',NULL,'admin','admin','2019-05-16 09:43:05','2019-05-16 09:43:05'),(13,'/content/attachment/','',NULL,'admin','admin','2019-05-16 09:43:05','2019-05-16 09:43:05'),(14,'/announcement/channel/!site/motd','',NULL,'admin','admin','2019-05-16 09:43:05','2019-05-16 09:43:05'),(15,'!pubview','',NULL,'admin','admin','2019-05-16 09:43:05','2019-05-16 09:43:05'),(16,'/site/!gateway','',NULL,'admin','admin','2019-05-16 09:43:05','2019-05-16 09:43:05'),(17,'/site/!error','',NULL,'admin','admin','2019-05-16 09:43:05','2019-05-16 09:43:05'),(18,'/site/!urlError','',NULL,'admin','admin','2019-05-16 09:43:05','2019-05-16 09:43:05'),(19,'/site/mercury','',NULL,'admin','admin','2019-05-16 09:43:05','2019-05-16 09:43:05'),(20,'/site/!admin','',5,'admin','admin','2019-05-16 09:43:05','2019-05-16 09:43:05'),(21,'!site.roles','',NULL,'admin','admin','2019-05-16 09:43:05','2019-05-16 09:43:05'),(22,'!site.template.lti','',9,'admin','admin','2019-05-16 09:43:06','2019-05-16 09:43:06'),(23,'/site/citationsAdmin',NULL,10,'admin','admin','2019-05-16 02:43:19','2019-05-16 02:43:19');
/*!40000 ALTER TABLE `sakai_realm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_realm_function`
--

DROP TABLE IF EXISTS `sakai_realm_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_realm_function` (
  `FUNCTION_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `FUNCTION_NAME` varchar(99) NOT NULL,
  PRIMARY KEY (`FUNCTION_KEY`),
  UNIQUE KEY `IE_SAKAI_REALM_FUNCTION_NAME` (`FUNCTION_NAME`),
  KEY `SAKAI_REALM_FUNCTION_KN` (`FUNCTION_KEY`,`FUNCTION_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_realm_function`
--

LOCK TABLES `sakai_realm_function` WRITE;
/*!40000 ALTER TABLE `sakai_realm_function` DISABLE KEYS */;
INSERT INTO `sakai_realm_function` VALUES (1,'annc.all.groups'),(2,'annc.delete.any'),(3,'annc.delete.own'),(4,'annc.new'),(5,'annc.read'),(6,'annc.read.drafts'),(7,'annc.revise.any'),(8,'annc.revise.own'),(16,'asn.all.groups'),(9,'asn.delete'),(10,'asn.grade'),(12,'asn.new'),(13,'asn.read'),(11,'asn.receive.notifications'),(14,'asn.revise'),(15,'asn.submit'),(17,'assessment.createAssessment'),(18,'assessment.deleteAssessment.any'),(19,'assessment.deleteAssessment.own'),(20,'assessment.editAssessment.any'),(21,'assessment.editAssessment.own'),(22,'assessment.gradeAssessment.any'),(23,'assessment.gradeAssessment.own'),(24,'assessment.publishAssessment.any'),(25,'assessment.publishAssessment.own'),(26,'assessment.questionpool.copy.own'),(27,'assessment.questionpool.create'),(28,'assessment.questionpool.delete.own'),(29,'assessment.questionpool.edit.own'),(30,'assessment.submitAssessmentForGrade'),(31,'assessment.takeAssessment'),(32,'assessment.template.create'),(33,'assessment.template.delete.own'),(34,'assessment.template.edit.own'),(43,'calendar.all.groups'),(35,'calendar.delete.any'),(36,'calendar.delete.own'),(37,'calendar.import'),(38,'calendar.new'),(148,'calendar.options'),(39,'calendar.read'),(40,'calendar.revise.any'),(41,'calendar.revise.own'),(42,'calendar.subscribe'),(44,'calendar.view.audience'),(45,'chat.delete.any'),(47,'chat.delete.channel'),(46,'chat.delete.own'),(48,'chat.new'),(49,'chat.new.channel'),(50,'chat.read'),(51,'chat.revise.channel'),(58,'content.all.groups'),(52,'content.delete.any'),(53,'content.delete.own'),(59,'content.hidden'),(54,'content.new'),(55,'content.read'),(56,'content.revise.any'),(57,'content.revise.own'),(60,'disc.delete.any'),(61,'disc.delete.own'),(62,'disc.new'),(63,'disc.new.topic'),(64,'disc.read'),(65,'disc.revise.any'),(66,'disc.revise.own'),(68,'dropbox.maintain'),(69,'dropbox.maintain.own.groups'),(67,'dropbox.own'),(70,'gradebook.editAssignments'),(71,'gradebook.gradeAll'),(72,'gradebook.gradeSection'),(73,'gradebook.viewOwnGrades'),(131,'lessonbuilder.read'),(132,'lessonbuilder.upd'),(74,'mail.delete.any'),(75,'mail.new'),(76,'mail.read'),(121,'mailtool.admin'),(122,'mailtool.send'),(77,'msg.emailout'),(78,'msg.permissions.allowToField.allParticipants'),(79,'msg.permissions.allowToField.groups'),(81,'msg.permissions.allowToField.myGroupMembers'),(82,'msg.permissions.allowToField.myGroups'),(80,'msg.permissions.allowToField.roles'),(83,'msg.permissions.allowToField.users'),(84,'msg.permissions.viewHidden.groups'),(154,'pasystem.manage'),(123,'poll.add'),(124,'poll.deleteAny'),(125,'poll.deleteOwn'),(126,'poll.editAny'),(127,'poll.editOwn'),(128,'poll.vote'),(85,'prefs.add'),(86,'prefs.del'),(87,'prefs.upd'),(88,'realm.add'),(89,'realm.del'),(90,'realm.upd'),(99,'realm.upd.own'),(91,'roster.export'),(92,'roster.viewallmembers'),(95,'roster.viewenrollmentstatus'),(97,'roster.viewgroup'),(93,'roster.viewhidden'),(94,'roster.viewofficialphoto'),(96,'roster.viewprofile'),(98,'roster.viewsitevisits'),(115,'rwiki.admin'),(116,'rwiki.create'),(117,'rwiki.delete'),(118,'rwiki.read'),(119,'rwiki.superadmin'),(120,'rwiki.update'),(100,'section.role.instructor'),(101,'section.role.student'),(102,'section.role.ta'),(142,'signup.attend'),(143,'signup.attend.all'),(133,'signup.create.group'),(134,'signup.create.group.all'),(135,'signup.create.site'),(136,'signup.delete.group'),(137,'signup.delete.group.all'),(138,'signup.delete.site'),(139,'signup.update.group'),(140,'signup.update.group.all'),(141,'signup.update.site'),(144,'signup.view'),(145,'signup.view.all'),(103,'site.add'),(104,'site.add.course'),(129,'site.add.project'),(105,'site.add.usersite'),(106,'site.del'),(130,'site.import.archive'),(147,'site.roleswap'),(107,'site.upd'),(109,'site.upd.grp.mbrshp'),(108,'site.upd.site.mbrshp'),(110,'site.viewRoster'),(111,'site.visit'),(112,'site.visit.unp'),(146,'sitestats.view'),(149,'syllabus.add.item'),(150,'syllabus.bulk.add.item'),(151,'syllabus.bulk.edit.item'),(152,'syllabus.redirect'),(113,'user.add'),(114,'user.upd.own');
/*!40000 ALTER TABLE `sakai_realm_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_realm_property`
--

DROP TABLE IF EXISTS `sakai_realm_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_realm_property` (
  `REALM_KEY` int(11) NOT NULL,
  `NAME` varchar(99) NOT NULL,
  `VALUE` mediumtext,
  PRIMARY KEY (`REALM_KEY`,`NAME`),
  KEY `FK_SAKAI_REALM_PROPERTY` (`REALM_KEY`),
  CONSTRAINT `sakai_realm_property_ibfk_1` FOREIGN KEY (`REALM_KEY`) REFERENCES `sakai_realm` (`REALM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_realm_property`
--

LOCK TABLES `sakai_realm_property` WRITE;
/*!40000 ALTER TABLE `sakai_realm_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_realm_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_realm_provider`
--

DROP TABLE IF EXISTS `sakai_realm_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_realm_provider` (
  `REALM_KEY` int(11) NOT NULL,
  `PROVIDER_ID` varchar(200) NOT NULL,
  PRIMARY KEY (`REALM_KEY`,`PROVIDER_ID`),
  KEY `FK_SAKAI_REALM_PROVIDER` (`REALM_KEY`),
  KEY `IE_SAKAI_REALM_PROVIDER_ID` (`PROVIDER_ID`),
  CONSTRAINT `sakai_realm_provider_ibfk_1` FOREIGN KEY (`REALM_KEY`) REFERENCES `sakai_realm` (`REALM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_realm_provider`
--

LOCK TABLES `sakai_realm_provider` WRITE;
/*!40000 ALTER TABLE `sakai_realm_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_realm_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_realm_rl_fn`
--

DROP TABLE IF EXISTS `sakai_realm_rl_fn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_realm_rl_fn` (
  `REALM_KEY` int(11) NOT NULL,
  `ROLE_KEY` int(11) NOT NULL,
  `FUNCTION_KEY` int(11) NOT NULL,
  PRIMARY KEY (`REALM_KEY`,`ROLE_KEY`,`FUNCTION_KEY`),
  KEY `FK_SAKAI_REALM_RL_FN_REALM` (`REALM_KEY`),
  KEY `FK_SAKAI_REALM_RL_FN_FUNC` (`FUNCTION_KEY`),
  KEY `FJ_SAKAI_REALM_RL_FN_ROLE` (`ROLE_KEY`),
  CONSTRAINT `sakai_realm_rl_fn_ibfk_3` FOREIGN KEY (`FUNCTION_KEY`) REFERENCES `sakai_realm_function` (`FUNCTION_KEY`),
  CONSTRAINT `sakai_realm_rl_fn_ibfk_1` FOREIGN KEY (`REALM_KEY`) REFERENCES `sakai_realm` (`REALM_KEY`),
  CONSTRAINT `sakai_realm_rl_fn_ibfk_2` FOREIGN KEY (`ROLE_KEY`) REFERENCES `sakai_realm_role` (`ROLE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_realm_rl_fn`
--

LOCK TABLES `sakai_realm_rl_fn` WRITE;
/*!40000 ALTER TABLE `sakai_realm_rl_fn` DISABLE KEYS */;
INSERT INTO `sakai_realm_rl_fn` VALUES (1,10,89),(1,10,90),(2,4,5),(2,4,39),(2,4,48),(2,4,50),(2,4,55),(2,4,62),(2,4,64),(2,4,66),(2,4,73),(2,4,76),(2,4,78),(2,4,79),(2,4,80),(2,4,81),(2,4,82),(2,4,83),(2,4,111),(2,4,116),(2,4,118),(2,4,120),(2,4,122),(2,10,2),(2,10,3),(2,10,4),(2,10,5),(2,10,6),(2,10,7),(2,10,8),(2,10,35),(2,10,36),(2,10,37),(2,10,38),(2,10,39),(2,10,40),(2,10,41),(2,10,42),(2,10,44),(2,10,45),(2,10,46),(2,10,47),(2,10,48),(2,10,49),(2,10,50),(2,10,51),(2,10,52),(2,10,53),(2,10,54),(2,10,55),(2,10,56),(2,10,57),(2,10,59),(2,10,60),(2,10,61),(2,10,62),(2,10,63),(2,10,64),(2,10,65),(2,10,66),(2,10,68),(2,10,70),(2,10,71),(2,10,74),(2,10,75),(2,10,76),(2,10,78),(2,10,79),(2,10,80),(2,10,81),(2,10,82),(2,10,83),(2,10,84),(2,10,89),(2,10,90),(2,10,107),(2,10,108),(2,10,109),(2,10,110),(2,10,111),(2,10,112),(2,10,115),(2,10,116),(2,10,118),(2,10,120),(2,10,121),(2,10,122),(2,10,148),(2,10,149),(2,10,150),(2,10,151),(2,10,152),(3,1,113),(3,2,85),(3,2,86),(3,2,87),(3,2,88),(3,2,99),(3,2,105),(3,2,113),(3,2,114),(4,1,113),(4,2,85),(4,2,86),(4,2,87),(4,2,88),(4,2,99),(4,2,105),(4,2,113),(4,2,114),(5,1,113),(5,2,85),(5,2,86),(5,2,87),(5,2,88),(5,2,99),(5,2,103),(5,2,104),(5,2,105),(5,2,113),(5,2,114),(5,2,129),(6,1,113),(6,2,85),(6,2,86),(6,2,87),(6,2,88),(6,2,99),(6,2,103),(6,2,104),(6,2,105),(6,2,113),(6,2,114),(6,2,129),(7,1,113),(7,2,85),(7,2,86),(7,2,87),(7,2,88),(7,2,99),(7,2,103),(7,2,104),(7,2,105),(7,2,113),(7,2,114),(7,2,129),(8,4,5),(8,4,13),(8,4,15),(8,4,30),(8,4,31),(8,4,39),(8,4,48),(8,4,50),(8,4,55),(8,4,62),(8,4,64),(8,4,66),(8,4,67),(8,4,73),(8,4,75),(8,4,76),(8,4,78),(8,4,79),(8,4,80),(8,4,81),(8,4,82),(8,4,83),(8,4,91),(8,4,92),(8,4,96),(8,4,101),(8,4,111),(8,4,116),(8,4,118),(8,4,120),(8,4,122),(8,4,128),(8,4,131),(8,4,142),(8,4,144),(8,4,148),(8,10,1),(8,10,2),(8,10,3),(8,10,4),(8,10,5),(8,10,6),(8,10,7),(8,10,8),(8,10,9),(8,10,10),(8,10,11),(8,10,12),(8,10,13),(8,10,14),(8,10,15),(8,10,16),(8,10,17),(8,10,18),(8,10,19),(8,10,20),(8,10,21),(8,10,22),(8,10,23),(8,10,24),(8,10,25),(8,10,26),(8,10,27),(8,10,28),(8,10,29),(8,10,32),(8,10,33),(8,10,34),(8,10,35),(8,10,36),(8,10,37),(8,10,38),(8,10,39),(8,10,40),(8,10,41),(8,10,42),(8,10,43),(8,10,44),(8,10,45),(8,10,46),(8,10,47),(8,10,48),(8,10,49),(8,10,50),(8,10,51),(8,10,52),(8,10,53),(8,10,54),(8,10,55),(8,10,56),(8,10,57),(8,10,58),(8,10,59),(8,10,60),(8,10,61),(8,10,62),(8,10,63),(8,10,64),(8,10,65),(8,10,66),(8,10,68),(8,10,70),(8,10,71),(8,10,74),(8,10,75),(8,10,76),(8,10,77),(8,10,78),(8,10,79),(8,10,80),(8,10,81),(8,10,82),(8,10,83),(8,10,84),(8,10,89),(8,10,90),(8,10,91),(8,10,92),(8,10,96),(8,10,97),(8,10,98),(8,10,100),(8,10,106),(8,10,107),(8,10,108),(8,10,109),(8,10,110),(8,10,111),(8,10,112),(8,10,115),(8,10,116),(8,10,118),(8,10,120),(8,10,121),(8,10,122),(8,10,123),(8,10,124),(8,10,125),(8,10,126),(8,10,127),(8,10,128),(8,10,131),(8,10,132),(8,10,135),(8,10,138),(8,10,141),(8,10,145),(8,10,146),(8,10,147),(8,10,148),(8,10,149),(8,10,150),(8,10,151),(8,10,152),(9,9,1),(9,9,2),(9,9,3),(9,9,4),(9,9,5),(9,9,6),(9,9,7),(9,9,8),(9,9,9),(9,9,10),(9,9,11),(9,9,12),(9,9,13),(9,9,14),(9,9,15),(9,9,16),(9,9,17),(9,9,18),(9,9,19),(9,9,20),(9,9,21),(9,9,22),(9,9,23),(9,9,24),(9,9,25),(9,9,26),(9,9,27),(9,9,28),(9,9,29),(9,9,32),(9,9,33),(9,9,34),(9,9,35),(9,9,36),(9,9,37),(9,9,38),(9,9,39),(9,9,40),(9,9,41),(9,9,42),(9,9,43),(9,9,44),(9,9,45),(9,9,46),(9,9,47),(9,9,48),(9,9,49),(9,9,50),(9,9,51),(9,9,52),(9,9,53),(9,9,54),(9,9,55),(9,9,56),(9,9,57),(9,9,58),(9,9,59),(9,9,60),(9,9,61),(9,9,62),(9,9,63),(9,9,64),(9,9,65),(9,9,66),(9,9,68),(9,9,70),(9,9,71),(9,9,74),(9,9,75),(9,9,76),(9,9,77),(9,9,78),(9,9,79),(9,9,80),(9,9,81),(9,9,82),(9,9,83),(9,9,84),(9,9,89),(9,9,90),(9,9,91),(9,9,92),(9,9,93),(9,9,94),(9,9,95),(9,9,96),(9,9,97),(9,9,98),(9,9,100),(9,9,106),(9,9,107),(9,9,108),(9,9,109),(9,9,110),(9,9,111),(9,9,112),(9,9,115),(9,9,116),(9,9,118),(9,9,120),(9,9,121),(9,9,122),(9,9,123),(9,9,124),(9,9,125),(9,9,126),(9,9,127),(9,9,128),(9,9,131),(9,9,132),(9,9,135),(9,9,138),(9,9,141),(9,9,145),(9,9,146),(9,9,147),(9,9,148),(9,9,149),(9,9,150),(9,9,151),(9,9,152),(9,15,5),(9,15,13),(9,15,15),(9,15,30),(9,15,31),(9,15,39),(9,15,48),(9,15,50),(9,15,55),(9,15,62),(9,15,64),(9,15,66),(9,15,67),(9,15,73),(9,15,76),(9,15,78),(9,15,79),(9,15,80),(9,15,81),(9,15,82),(9,15,83),(9,15,96),(9,15,101),(9,15,111),(9,15,118),(9,15,122),(9,15,128),(9,15,131),(9,15,142),(9,15,144),(9,15,148),(9,16,5),(9,16,13),(9,16,22),(9,16,23),(9,16,39),(9,16,48),(9,16,50),(9,16,55),(9,16,59),(9,16,62),(9,16,64),(9,16,66),(9,16,67),(9,16,69),(9,16,72),(9,16,73),(9,16,76),(9,16,78),(9,16,79),(9,16,80),(9,16,81),(9,16,82),(9,16,83),(9,16,84),(9,16,91),(9,16,93),(9,16,94),(9,16,96),(9,16,102),(9,16,109),(9,16,111),(9,16,116),(9,16,118),(9,16,120),(9,16,121),(9,16,122),(9,16,128),(9,16,131),(9,16,133),(9,16,136),(9,16,139),(9,16,143),(9,16,145),(9,16,148),(9,16,149),(9,16,150),(9,16,151),(9,16,152),(10,4,5),(10,4,13),(10,4,15),(10,4,39),(10,4,55),(10,4,73),(10,4,97),(10,4,101),(10,4,111),(10,4,122),(10,4,128),(10,4,142),(10,4,144),(10,10,2),(10,10,3),(10,10,4),(10,10,5),(10,10,6),(10,10,7),(10,10,8),(10,10,9),(10,10,10),(10,10,11),(10,10,12),(10,10,13),(10,10,14),(10,10,15),(10,10,35),(10,10,36),(10,10,37),(10,10,38),(10,10,39),(10,10,40),(10,10,41),(10,10,42),(10,10,52),(10,10,53),(10,10,54),(10,10,55),(10,10,56),(10,10,57),(10,10,59),(10,10,70),(10,10,71),(10,10,89),(10,10,90),(10,10,100),(10,10,110),(10,10,111),(10,10,112),(10,10,121),(10,10,122),(10,10,123),(10,10,124),(10,10,125),(10,10,126),(10,10,127),(10,10,128),(10,10,135),(10,10,138),(10,10,141),(10,10,145),(11,9,2),(11,9,3),(11,9,4),(11,9,5),(11,9,6),(11,9,7),(11,9,8),(11,9,9),(11,9,10),(11,9,11),(11,9,12),(11,9,13),(11,9,14),(11,9,15),(11,9,35),(11,9,36),(11,9,37),(11,9,38),(11,9,39),(11,9,40),(11,9,41),(11,9,42),(11,9,52),(11,9,53),(11,9,54),(11,9,55),(11,9,56),(11,9,57),(11,9,59),(11,9,70),(11,9,71),(11,9,89),(11,9,90),(11,9,93),(11,9,100),(11,9,110),(11,9,111),(11,9,112),(11,9,121),(11,9,122),(11,9,123),(11,9,124),(11,9,125),(11,9,126),(11,9,127),(11,9,128),(11,9,135),(11,9,138),(11,9,141),(11,9,145),(11,15,5),(11,15,13),(11,15,15),(11,15,39),(11,15,55),(11,15,73),(11,15,92),(11,15,97),(11,15,101),(11,15,111),(11,15,122),(11,15,128),(11,15,142),(11,15,144),(11,16,2),(11,16,3),(11,16,4),(11,16,5),(11,16,6),(11,16,7),(11,16,8),(11,16,9),(11,16,10),(11,16,12),(11,16,13),(11,16,14),(11,16,35),(11,16,36),(11,16,37),(11,16,38),(11,16,39),(11,16,40),(11,16,41),(11,16,42),(11,16,52),(11,16,53),(11,16,54),(11,16,55),(11,16,56),(11,16,57),(11,16,59),(11,16,69),(11,16,72),(11,16,92),(11,16,93),(11,16,97),(11,16,98),(11,16,102),(11,16,111),(11,16,121),(11,16,122),(11,16,128),(11,16,133),(11,16,136),(11,16,139),(11,16,143),(11,16,145),(12,1,55),(12,2,55),(13,1,55),(13,2,52),(13,2,53),(13,2,54),(13,2,55),(13,2,56),(13,2,57),(14,1,5),(14,2,5),(15,13,5),(15,13,39),(15,13,50),(15,13,55),(15,13,64),(15,13,76),(15,13,111),(16,1,111),(16,2,111),(17,1,111),(17,2,111),(18,1,111),(18,2,111),(19,4,5),(19,4,13),(19,4,15),(19,4,39),(19,4,48),(19,4,50),(19,4,55),(19,4,62),(19,4,64),(19,4,66),(19,4,67),(19,4,73),(19,4,76),(19,4,97),(19,4,111),(19,4,116),(19,4,118),(19,4,120),(19,4,122),(19,4,128),(19,4,148),(19,10,2),(19,10,3),(19,10,4),(19,10,5),(19,10,6),(19,10,7),(19,10,8),(19,10,9),(19,10,10),(19,10,11),(19,10,12),(19,10,13),(19,10,14),(19,10,15),(19,10,35),(19,10,36),(19,10,37),(19,10,38),(19,10,39),(19,10,40),(19,10,41),(19,10,42),(19,10,45),(19,10,46),(19,10,47),(19,10,48),(19,10,49),(19,10,50),(19,10,51),(19,10,52),(19,10,53),(19,10,54),(19,10,55),(19,10,56),(19,10,57),(19,10,59),(19,10,60),(19,10,61),(19,10,62),(19,10,63),(19,10,64),(19,10,65),(19,10,66),(19,10,68),(19,10,70),(19,10,71),(19,10,74),(19,10,75),(19,10,76),(19,10,89),(19,10,90),(19,10,91),(19,10,92),(19,10,106),(19,10,107),(19,10,108),(19,10,109),(19,10,110),(19,10,111),(19,10,112),(19,10,115),(19,10,116),(19,10,118),(19,10,120),(19,10,121),(19,10,122),(19,10,123),(19,10,124),(19,10,125),(19,10,126),(19,10,127),(19,10,128),(19,10,148),(19,10,149),(19,10,150),(19,10,151),(19,10,152),(20,5,107),(21,1,5),(21,1,39),(21,1,50),(21,1,55),(21,1,76),(21,1,111),(21,1,118),(21,2,5),(21,2,39),(21,2,50),(21,2,55),(21,2,76),(21,2,111),(21,2,118),(21,3,5),(21,3,39),(21,3,50),(21,3,55),(21,3,76),(21,3,111),(21,3,118),(22,9,1),(22,9,2),(22,9,3),(22,9,4),(22,9,5),(22,9,6),(22,9,7),(22,9,8),(22,9,9),(22,9,10),(22,9,11),(22,9,12),(22,9,13),(22,9,14),(22,9,15),(22,9,16),(22,9,17),(22,9,18),(22,9,19),(22,9,20),(22,9,21),(22,9,22),(22,9,23),(22,9,24),(22,9,25),(22,9,26),(22,9,27),(22,9,28),(22,9,29),(22,9,32),(22,9,33),(22,9,34),(22,9,35),(22,9,36),(22,9,37),(22,9,38),(22,9,39),(22,9,40),(22,9,41),(22,9,42),(22,9,43),(22,9,44),(22,9,45),(22,9,46),(22,9,47),(22,9,48),(22,9,49),(22,9,50),(22,9,51),(22,9,52),(22,9,53),(22,9,54),(22,9,55),(22,9,56),(22,9,57),(22,9,58),(22,9,59),(22,9,60),(22,9,61),(22,9,62),(22,9,63),(22,9,64),(22,9,65),(22,9,66),(22,9,68),(22,9,70),(22,9,71),(22,9,74),(22,9,75),(22,9,76),(22,9,77),(22,9,78),(22,9,79),(22,9,80),(22,9,81),(22,9,82),(22,9,83),(22,9,84),(22,9,89),(22,9,90),(22,9,91),(22,9,92),(22,9,96),(22,9,97),(22,9,98),(22,9,100),(22,9,106),(22,9,107),(22,9,108),(22,9,109),(22,9,110),(22,9,111),(22,9,112),(22,9,115),(22,9,116),(22,9,118),(22,9,120),(22,9,121),(22,9,122),(22,9,131),(22,9,132),(22,9,146),(22,9,147),(22,15,5),(22,15,13),(22,15,15),(22,15,30),(22,15,31),(22,15,39),(22,15,48),(22,15,50),(22,15,55),(22,15,62),(22,15,64),(22,15,66),(22,15,67),(22,15,73),(22,15,75),(22,15,76),(22,15,78),(22,15,79),(22,15,80),(22,15,81),(22,15,82),(22,15,83),(22,15,91),(22,15,92),(22,15,96),(22,15,101),(22,15,111),(22,15,116),(22,15,118),(22,15,120),(22,15,122),(22,15,131),(22,17,5),(22,17,13),(22,17,15),(22,17,30),(22,17,31),(22,17,39),(22,17,48),(22,17,50),(22,17,55),(22,17,62),(22,17,64),(22,17,66),(22,17,67),(22,17,73),(22,17,75),(22,17,76),(22,17,78),(22,17,79),(22,17,80),(22,17,81),(22,17,82),(22,17,83),(22,17,84),(22,17,91),(22,17,92),(22,17,96),(22,17,101),(22,17,111),(22,17,116),(22,17,118),(22,17,120),(22,17,122),(22,17,131),(22,17,132),(22,17,146),(22,17,147),(22,18,5),(22,18,13),(22,18,15),(22,18,30),(22,18,31),(22,18,39),(22,18,48),(22,18,50),(22,18,55),(22,18,62),(22,18,64),(22,18,66),(22,18,67),(22,18,73),(22,18,75),(22,18,76),(22,18,78),(22,18,79),(22,18,80),(22,18,81),(22,18,82),(22,18,83),(22,18,91),(22,18,92),(22,18,96),(22,18,101),(22,18,111),(22,18,116),(22,18,118),(22,18,120),(22,18,122),(22,18,131),(22,19,5),(22,19,13),(22,19,15),(22,19,30),(22,19,31),(22,19,39),(22,19,48),(22,19,50),(22,19,55),(22,19,62),(22,19,64),(22,19,66),(22,19,67),(22,19,73),(22,19,75),(22,19,76),(22,19,78),(22,19,79),(22,19,80),(22,19,81),(22,19,82),(22,19,83),(22,19,91),(22,19,92),(22,19,96),(22,19,101),(22,19,111),(22,19,116),(22,19,118),(22,19,120),(22,19,122),(22,19,131),(22,20,5),(22,20,13),(22,20,15),(22,20,30),(22,20,31),(22,20,39),(22,20,48),(22,20,50),(22,20,55),(22,20,62),(22,20,64),(22,20,66),(22,20,67),(22,20,73),(22,20,75),(22,20,76),(22,20,78),(22,20,79),(22,20,80),(22,20,81),(22,20,82),(22,20,83),(22,20,84),(22,20,91),(22,20,92),(22,20,96),(22,20,101),(22,20,111),(22,20,116),(22,20,118),(22,20,120),(22,20,122),(22,20,131),(22,21,5),(22,21,13),(22,21,15),(22,21,30),(22,21,31),(22,21,39),(22,21,48),(22,21,50),(22,21,55),(22,21,62),(22,21,64),(22,21,66),(22,21,67),(22,21,73),(22,21,75),(22,21,76),(22,21,78),(22,21,79),(22,21,80),(22,21,81),(22,21,82),(22,21,83),(22,21,84),(22,21,91),(22,21,92),(22,21,96),(22,21,101),(22,21,111),(22,21,116),(22,21,118),(22,21,120),(22,21,122),(22,21,131),(22,22,5),(22,22,13),(22,22,15),(22,22,30),(22,22,31),(22,22,39),(22,22,48),(22,22,50),(22,22,55),(22,22,62),(22,22,64),(22,22,66),(22,22,67),(22,22,73),(22,22,75),(22,22,76),(22,22,78),(22,22,79),(22,22,80),(22,22,81),(22,22,82),(22,22,83),(22,22,91),(22,22,92),(22,22,96),(22,22,101),(22,22,111),(22,22,116),(22,22,118),(22,22,120),(22,22,122),(22,22,131),(22,23,5),(22,23,13),(22,23,15),(22,23,30),(22,23,31),(22,23,39),(22,23,48),(22,23,50),(22,23,55),(22,23,62),(22,23,64),(22,23,66),(22,23,67),(22,23,73),(22,23,75),(22,23,76),(22,23,78),(22,23,79),(22,23,80),(22,23,81),(22,23,82),(22,23,83),(22,23,91),(22,23,92),(22,23,96),(22,23,101),(22,23,111),(22,23,116),(22,23,118),(22,23,120),(22,23,122),(22,23,131),(22,24,5),(22,24,13),(22,24,39),(22,24,50),(22,24,55),(22,24,64),(22,24,67),(22,24,73),(22,24,76),(22,24,78),(22,24,79),(22,24,80),(22,24,81),(22,24,82),(22,24,83),(22,24,92),(22,24,96),(22,24,101),(22,24,111),(22,24,118),(22,24,131),(22,25,5),(22,25,13),(22,25,15),(22,25,30),(22,25,31),(22,25,39),(22,25,48),(22,25,50),(22,25,55),(22,25,62),(22,25,64),(22,25,66),(22,25,67),(22,25,73),(22,25,75),(22,25,76),(22,25,78),(22,25,79),(22,25,80),(22,25,81),(22,25,82),(22,25,83),(22,25,91),(22,25,92),(22,25,96),(22,25,101),(22,25,111),(22,25,116),(22,25,118),(22,25,120),(22,25,122),(22,25,131),(22,26,1),(22,26,2),(22,26,3),(22,26,4),(22,26,5),(22,26,6),(22,26,7),(22,26,8),(22,26,9),(22,26,10),(22,26,11),(22,26,12),(22,26,13),(22,26,14),(22,26,15),(22,26,16),(22,26,17),(22,26,18),(22,26,19),(22,26,20),(22,26,21),(22,26,22),(22,26,23),(22,26,24),(22,26,25),(22,26,26),(22,26,27),(22,26,28),(22,26,29),(22,26,32),(22,26,33),(22,26,34),(22,26,35),(22,26,36),(22,26,37),(22,26,38),(22,26,39),(22,26,40),(22,26,41),(22,26,42),(22,26,43),(22,26,45),(22,26,46),(22,26,47),(22,26,48),(22,26,49),(22,26,50),(22,26,51),(22,26,52),(22,26,53),(22,26,54),(22,26,55),(22,26,56),(22,26,57),(22,26,58),(22,26,59),(22,26,60),(22,26,61),(22,26,62),(22,26,63),(22,26,64),(22,26,65),(22,26,66),(22,26,68),(22,26,70),(22,26,71),(22,26,74),(22,26,75),(22,26,76),(22,26,77),(22,26,78),(22,26,79),(22,26,80),(22,26,81),(22,26,82),(22,26,83),(22,26,84),(22,26,89),(22,26,90),(22,26,91),(22,26,92),(22,26,96),(22,26,97),(22,26,98),(22,26,100),(22,26,106),(22,26,107),(22,26,108),(22,26,109),(22,26,110),(22,26,111),(22,26,112),(22,26,115),(22,26,116),(22,26,118),(22,26,120),(22,26,121),(22,26,122),(22,26,131),(22,26,132),(22,26,146),(22,26,147),(22,27,5),(22,27,13),(22,27,39),(22,27,50),(22,27,55),(22,27,64),(22,27,67),(22,27,73),(22,27,76),(22,27,78),(22,27,79),(22,27,80),(22,27,81),(22,27,82),(22,27,83),(22,27,84),(22,27,92),(22,27,96),(22,27,101),(22,27,111),(22,27,118),(22,27,131),(23,4,5),(23,4,13),(23,4,15),(23,4,30),(23,4,31),(23,4,39),(23,4,48),(23,4,50),(23,4,55),(23,4,62),(23,4,64),(23,4,66),(23,4,67),(23,4,73),(23,4,75),(23,4,76),(23,4,78),(23,4,79),(23,4,80),(23,4,81),(23,4,82),(23,4,83),(23,4,91),(23,4,92),(23,4,96),(23,4,101),(23,4,111),(23,4,116),(23,4,118),(23,4,120),(23,4,122),(23,4,128),(23,4,131),(23,4,142),(23,4,144),(23,4,148),(23,10,1),(23,10,2),(23,10,3),(23,10,4),(23,10,5),(23,10,6),(23,10,7),(23,10,8),(23,10,9),(23,10,10),(23,10,11),(23,10,12),(23,10,13),(23,10,14),(23,10,15),(23,10,16),(23,10,17),(23,10,18),(23,10,19),(23,10,20),(23,10,21),(23,10,22),(23,10,23),(23,10,24),(23,10,25),(23,10,26),(23,10,27),(23,10,28),(23,10,29),(23,10,32),(23,10,33),(23,10,34),(23,10,35),(23,10,36),(23,10,37),(23,10,38),(23,10,39),(23,10,40),(23,10,41),(23,10,42),(23,10,43),(23,10,44),(23,10,45),(23,10,46),(23,10,47),(23,10,48),(23,10,49),(23,10,50),(23,10,51),(23,10,52),(23,10,53),(23,10,54),(23,10,55),(23,10,56),(23,10,57),(23,10,58),(23,10,59),(23,10,60),(23,10,61),(23,10,62),(23,10,63),(23,10,64),(23,10,65),(23,10,66),(23,10,68),(23,10,70),(23,10,71),(23,10,74),(23,10,75),(23,10,76),(23,10,77),(23,10,78),(23,10,79),(23,10,80),(23,10,81),(23,10,82),(23,10,83),(23,10,84),(23,10,89),(23,10,90),(23,10,91),(23,10,92),(23,10,96),(23,10,97),(23,10,98),(23,10,100),(23,10,106),(23,10,107),(23,10,108),(23,10,109),(23,10,110),(23,10,111),(23,10,112),(23,10,115),(23,10,116),(23,10,118),(23,10,120),(23,10,121),(23,10,122),(23,10,123),(23,10,124),(23,10,125),(23,10,126),(23,10,127),(23,10,128),(23,10,131),(23,10,132),(23,10,135),(23,10,138),(23,10,141),(23,10,145),(23,10,146),(23,10,147),(23,10,148),(23,10,149),(23,10,150),(23,10,151),(23,10,152);
/*!40000 ALTER TABLE `sakai_realm_rl_fn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_realm_rl_gr`
--

DROP TABLE IF EXISTS `sakai_realm_rl_gr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_realm_rl_gr` (
  `REALM_KEY` int(11) NOT NULL,
  `USER_ID` varchar(99) NOT NULL,
  `ROLE_KEY` int(11) NOT NULL,
  `ACTIVE` char(1) DEFAULT NULL,
  `PROVIDED` char(1) DEFAULT NULL,
  PRIMARY KEY (`REALM_KEY`,`USER_ID`),
  KEY `FK_SAKAI_REALM_RL_GR_REALM` (`REALM_KEY`),
  KEY `FK_SAKAI_REALM_RL_GR_ROLE` (`ROLE_KEY`),
  KEY `IE_SAKAI_REALM_RL_GR_ACT` (`ACTIVE`),
  KEY `IE_SAKAI_REALM_RL_GR_USR` (`USER_ID`),
  KEY `IE_SAKAI_REALM_RL_GR_PRV` (`PROVIDED`),
  KEY `SAKAI_REALM_RL_GR_RAU` (`ROLE_KEY`,`ACTIVE`,`USER_ID`),
  CONSTRAINT `sakai_realm_rl_gr_ibfk_2` FOREIGN KEY (`ROLE_KEY`) REFERENCES `sakai_realm_role` (`ROLE_KEY`),
  CONSTRAINT `sakai_realm_rl_gr_ibfk_1` FOREIGN KEY (`REALM_KEY`) REFERENCES `sakai_realm` (`REALM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_realm_rl_gr`
--

LOCK TABLES `sakai_realm_rl_gr` WRITE;
/*!40000 ALTER TABLE `sakai_realm_rl_gr` DISABLE KEYS */;
INSERT INTO `sakai_realm_rl_gr` VALUES (19,'admin',10,'1','0'),(20,'admin',5,'1','0'),(23,'admin',10,'1','0');
/*!40000 ALTER TABLE `sakai_realm_rl_gr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_realm_role`
--

DROP TABLE IF EXISTS `sakai_realm_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_realm_role` (
  `ROLE_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(99) NOT NULL,
  PRIMARY KEY (`ROLE_KEY`),
  UNIQUE KEY `IE_SAKAI_REALM_ROLE_NAME` (`ROLE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_realm_role`
--

LOCK TABLES `sakai_realm_role` WRITE;
/*!40000 ALTER TABLE `sakai_realm_role` DISABLE KEYS */;
INSERT INTO `sakai_realm_role` VALUES (1,'.anon'),(2,'.auth'),(3,'.default'),(4,'access'),(5,'admin'),(26,'Administrator'),(22,'Alumni'),(6,'CIG Coordinator'),(7,'CIG Participant'),(8,'Evaluator'),(17,'Faculty'),(24,'Guest'),(9,'Instructor'),(19,'Learner'),(10,'maintain'),(18,'Member'),(20,'Mentor'),(27,'Observer'),(25,'Other'),(11,'Program Admin'),(12,'Program Coordinator'),(23,'ProspectiveStudent'),(13,'pubview'),(14,'Reviewer'),(21,'Staff'),(15,'Student'),(16,'Teaching Assistant');
/*!40000 ALTER TABLE `sakai_realm_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_realm_role_desc`
--

DROP TABLE IF EXISTS `sakai_realm_role_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_realm_role_desc` (
  `REALM_KEY` int(11) NOT NULL,
  `ROLE_KEY` int(11) NOT NULL,
  `DESCRIPTION` mediumtext,
  `PROVIDER_ONLY` char(1) DEFAULT NULL,
  PRIMARY KEY (`REALM_KEY`,`ROLE_KEY`),
  KEY `FK_SAKAI_REALM_ROLE_DESC_REALM` (`REALM_KEY`),
  KEY `ROLE_KEY` (`ROLE_KEY`),
  CONSTRAINT `sakai_realm_role_desc_ibfk_2` FOREIGN KEY (`ROLE_KEY`) REFERENCES `sakai_realm_role` (`ROLE_KEY`),
  CONSTRAINT `sakai_realm_role_desc_ibfk_1` FOREIGN KEY (`REALM_KEY`) REFERENCES `sakai_realm` (`REALM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_realm_role_desc`
--

LOCK TABLES `sakai_realm_role_desc` WRITE;
/*!40000 ALTER TABLE `sakai_realm_role_desc` DISABLE KEYS */;
INSERT INTO `sakai_realm_role_desc` VALUES (9,9,'Can read, revise, delete and add both content and participants to a site.','0'),(9,15,'Can read content, and add content to a site where appropriate.','0'),(9,16,'Can read, add, and revise most content in their sections.','0'),(11,9,'Can read, revise, delete and add both content and participants to a site.','0'),(11,15,'Can read content, and add content to a site where appropriate.','0'),(11,16,'Can read, add, and revise most content in their sections.','0'),(23,4,NULL,'0'),(23,10,NULL,'0');
/*!40000 ALTER TABLE `sakai_realm_role_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_session`
--

DROP TABLE IF EXISTS `sakai_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_session` (
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `SESSION_SERVER` varchar(255) DEFAULT NULL,
  `SESSION_USER` varchar(99) DEFAULT NULL,
  `SESSION_IP` varchar(128) DEFAULT NULL,
  `SESSION_HOSTNAME` varchar(255) DEFAULT NULL,
  `SESSION_USER_AGENT` varchar(255) DEFAULT NULL,
  `SESSION_START` timestamp NULL DEFAULT NULL,
  `SESSION_END` timestamp NULL DEFAULT NULL,
  `SESSION_ACTIVE` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `SAKAI_SESSION_INDEX` (`SESSION_ID`),
  KEY `SAKAI_SESSION_SERVER_INDEX` (`SESSION_SERVER`),
  KEY `SAKAI_SESSION_START_END_IE` (`SESSION_START`,`SESSION_END`,`SESSION_ID`),
  KEY `SESSION_ACTIVE_IE` (`SESSION_ACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_session`
--

LOCK TABLES `sakai_session` WRITE;
/*!40000 ALTER TABLE `sakai_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_site`
--

DROP TABLE IF EXISTS `sakai_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_site` (
  `SITE_ID` varchar(99) NOT NULL,
  `TITLE` varchar(99) DEFAULT NULL,
  `TYPE` varchar(99) DEFAULT NULL,
  `SHORT_DESC` longtext,
  `DESCRIPTION` longtext,
  `ICON_URL` varchar(255) DEFAULT NULL,
  `INFO_URL` varchar(255) DEFAULT NULL,
  `SKIN` varchar(255) DEFAULT NULL,
  `PUBLISHED` int(11) DEFAULT NULL,
  `JOINABLE` char(1) DEFAULT NULL,
  `PUBVIEW` char(1) DEFAULT NULL,
  `JOIN_ROLE` varchar(99) DEFAULT NULL,
  `CREATEDBY` varchar(99) DEFAULT NULL,
  `MODIFIEDBY` varchar(99) DEFAULT NULL,
  `CREATEDON` datetime DEFAULT NULL,
  `MODIFIEDON` datetime DEFAULT NULL,
  `IS_SPECIAL` char(1) DEFAULT NULL,
  `IS_USER` char(1) DEFAULT NULL,
  `CUSTOM_PAGE_ORDERED` char(1) DEFAULT NULL,
  `IS_SOFTLY_DELETED` char(1) NOT NULL DEFAULT '0',
  `SOFTLY_DELETED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`SITE_ID`),
  KEY `IE_SAKAI_SITE_CREATED` (`CREATEDBY`,`CREATEDON`),
  KEY `IE_SAKAI_SITE_MODDED` (`MODIFIEDBY`,`MODIFIEDON`),
  KEY `IE_SAKAI_SITE_FLAGS` (`SITE_ID`,`IS_SPECIAL`,`IS_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_site`
--

LOCK TABLES `sakai_site` WRITE;
/*!40000 ALTER TABLE `sakai_site` DISABLE KEYS */;
INSERT INTO `sakai_site` VALUES ('!admin','Administration Workspace',NULL,NULL,'Administration Workspace',NULL,NULL,NULL,1,'0','0','','admin','admin','2019-05-16 09:43:01','2019-05-16 09:43:01','0','0','0','0',NULL),('!contact-us','Contact Us',NULL,NULL,NULL,'','',NULL,1,'0','0','','admin','admin','2019-05-16 09:43:54','2019-05-16 09:43:54','1','0','0','0',NULL),('!error','Site Unavailable',NULL,NULL,'The site you requested is not available.',NULL,NULL,NULL,1,'0','0','','admin','admin','2019-05-16 09:43:01','2019-05-16 09:43:01','1','0','0','0',NULL),('!gateway','Gateway',NULL,NULL,'The Gateway Site',NULL,NULL,NULL,1,'0','0','','admin','admin','2019-05-16 09:43:01','2019-05-16 09:43:01','1','0','0','0',NULL),('!urlError','Invalid URL',NULL,NULL,'The URL you entered is invalid.  SOLUTIONS: Please check for spelling errors or typos.  Make sure you are using the right URL.  Type a URL to try again.',NULL,NULL,NULL,1,'0','0','','admin','admin','2019-05-16 09:43:01','2019-05-16 09:43:01','1','0','0','0',NULL),('!user','Home',NULL,NULL,'Home Site',NULL,NULL,NULL,1,'0','0','','admin','admin','2019-05-16 09:43:01','2019-05-16 09:43:01','1','0','0','0',NULL),('!worksite','worksite',NULL,NULL,NULL,'','',NULL,0,'0','0','access','admin','admin','2019-05-16 09:43:01','2019-05-16 09:43:01','1','0','0','0',NULL),('citationsAdmin','Citations Admin','project',NULL,NULL,NULL,NULL,NULL,1,'0','0',NULL,'admin','admin','2019-05-16 02:43:19','2019-05-16 02:43:19','0','0','0','0',NULL),('mercury','mercury site',NULL,NULL,NULL,'','',NULL,1,'0','0',NULL,'admin','admin','2019-05-16 09:43:01','2019-05-16 09:43:01','0','0','0','0',NULL),('~admin','Administration Workspace',NULL,NULL,'Administration Workspace',NULL,NULL,NULL,1,'0','0','','admin','admin','2019-05-16 09:43:01','2019-05-16 09:43:01','0','1','0','0',NULL);
/*!40000 ALTER TABLE `sakai_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_site_group`
--

DROP TABLE IF EXISTS `sakai_site_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_site_group` (
  `GROUP_ID` varchar(99) NOT NULL,
  `SITE_ID` varchar(99) NOT NULL,
  `TITLE` varchar(99) DEFAULT NULL,
  `DESCRIPTION` longtext,
  PRIMARY KEY (`GROUP_ID`),
  KEY `IE_SAKAI_SITE_GRP_SITE` (`SITE_ID`),
  CONSTRAINT `sakai_site_group_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `sakai_site` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_site_group`
--

LOCK TABLES `sakai_site_group` WRITE;
/*!40000 ALTER TABLE `sakai_site_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_site_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_site_group_property`
--

DROP TABLE IF EXISTS `sakai_site_group_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_site_group_property` (
  `SITE_ID` varchar(99) NOT NULL,
  `GROUP_ID` varchar(99) NOT NULL,
  `NAME` varchar(99) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`GROUP_ID`,`NAME`),
  KEY `IE_SAKAI_SITE_GRP_PROP_SITE` (`SITE_ID`),
  CONSTRAINT `sakai_site_group_property_ibfk_2` FOREIGN KEY (`SITE_ID`) REFERENCES `sakai_site` (`SITE_ID`),
  CONSTRAINT `sakai_site_group_property_ibfk_1` FOREIGN KEY (`GROUP_ID`) REFERENCES `sakai_site_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_site_group_property`
--

LOCK TABLES `sakai_site_group_property` WRITE;
/*!40000 ALTER TABLE `sakai_site_group_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_site_group_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_site_page`
--

DROP TABLE IF EXISTS `sakai_site_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_site_page` (
  `PAGE_ID` varchar(99) NOT NULL,
  `SITE_ID` varchar(99) NOT NULL,
  `TITLE` varchar(99) DEFAULT NULL,
  `LAYOUT` char(1) DEFAULT NULL,
  `SITE_ORDER` int(11) NOT NULL,
  `POPUP` char(1) DEFAULT NULL,
  PRIMARY KEY (`PAGE_ID`),
  KEY `SITE_ID` (`SITE_ID`),
  CONSTRAINT `sakai_site_page_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `sakai_site` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_site_page`
--

LOCK TABLES `sakai_site_page` WRITE;
/*!40000 ALTER TABLE `sakai_site_page` DISABLE KEYS */;
INSERT INTO `sakai_site_page` VALUES ('!admin-100','!admin','Home','0',1,'0'),('!admin-1000','!admin','Job Scheduler','0',12,'0'),('!admin-1100','!admin','Become User','0',13,'0'),('!admin-1200','!admin','User Membership','0',14,'0'),('!admin-1205','!admin','Email Templates','0',15,'0'),('!admin-1220','!admin','Sitestats Admin','0',16,'0'),('!admin-1230','!admin','External Tools','0',17,'0'),('!admin-1300','!admin','Delegated Access','0',18,'0'),('!admin-1400','!admin','Admin Site Perms','0',19,'0'),('!admin-1500','!admin','PA System','0',20,'0'),('!admin-1575','!admin','Message Bundle Manager','0',21,'0'),('!admin-200','!admin','Users','0',2,'0'),('!admin-250','!admin','Aliases','0',3,'0'),('!admin-300','!admin','Sites','0',4,'0'),('!admin-350','!admin','Realms','0',5,'0'),('!admin-360','!admin','Worksite Setup','0',6,'0'),('!admin-400','!admin','MOTD','0',7,'0'),('!admin-500','!admin','Resources','0',8,'0'),('!admin-600','!admin','On-Line','0',9,'0'),('!admin-700','!admin','Memory','0',10,'0'),('!admin-900','!admin','Site Archive','0',11,'0'),('!contact-us','!contact-us','Contact Us','0',1,'0'),('!error-100','!error','Site Unavailable','1',1,'0'),('!gateway-100','!gateway','Welcome','0',1,'0'),('!gateway-200','!gateway','About','0',2,'0'),('!gateway-300','!gateway','Features','0',3,'0'),('!gateway-400','!gateway','Sites','0',4,'0'),('!gateway-500','!gateway','Training','0',5,'0'),('!gateway-600','!gateway','Acknowledgements','0',6,'0'),('!gateway-700','!gateway','New Account','0',7,'0'),('!gateway-800','!gateway','Reset Password','0',8,'0'),('!urlError-100','!urlError','Invalid URL','1',1,'0'),('!user-100','!user','Home','1',1,'0'),('!user-150','!user','Profile','0',2,'0'),('!user-200','!user','Membership','0',3,'0'),('!user-300','!user','Calendar','0',4,'0'),('!user-400','!user','Resources','0',5,'0'),('!user-450','!user','Announcements','0',6,'0'),('!user-500','!user','Worksite Setup','0',7,'0'),('!user-600','!user','Preferences','0',8,'0'),('!user-700','!user','Account','0',9,'0'),('!worksite-100','!worksite','Home','1',1,'0'),('!worksite-200','!worksite','Calendar','0',2,'0'),('!worksite-300','!worksite','Announcements','0',3,'0'),('!worksite-400','!worksite','Resources','0',4,'0'),('!worksite-500','!worksite','Forums','0',5,'0'),('!worksite-600','!worksite','Assignments','0',6,'0'),('!worksite-700','!worksite','Drop Box','0',7,'0'),('!worksite-800','!worksite','Chat','0',8,'0'),('!worksite-900','!worksite','Email Archive','0',9,'0'),('055d7249-0e58-4432-8d0b-a44ec586b298','citationsAdmin','Resources','0',1,'0'),('mercury-100','mercury','Home','1',1,'0'),('mercury-1000','mercury','Site Info','0',10,'0'),('mercury-200','mercury','Calendar','0',2,'0'),('mercury-300','mercury','Announcements','0',3,'0'),('mercury-350','mercury','Lessons','0',3,'0'),('mercury-400','mercury','Resources','0',4,'0'),('mercury-500','mercury','Forums','0',5,'0'),('mercury-600','mercury','Assignments','0',6,'0'),('mercury-700','mercury','Drop Box','0',7,'0'),('mercury-800','mercury','Chat','0',8,'0'),('mercury-900','mercury','Email Archive','0',9,'0'),('~admin-100','~admin','Home','0',1,'0'),('~admin-1000','~admin','Job Scheduler','0',12,'0'),('~admin-1100','~admin','Become User','0',13,'0'),('~admin-1120','~admin','Preferences','0',13,'0'),('~admin-1200','~admin','User Membership','0',14,'0'),('~admin-200','~admin','Users','0',2,'0'),('~admin-250','~admin','Aliases','0',3,'0'),('~admin-300','~admin','Sites','0',4,'0'),('~admin-350','~admin','Realms','0',5,'0'),('~admin-360','~admin','Worksite Setup','0',6,'0'),('~admin-400','~admin','MOTD','0',7,'0'),('~admin-500','~admin','Resources','0',8,'0'),('~admin-600','~admin','On-Line','0',9,'0'),('~admin-700','~admin','Memory','0',10,'0'),('~admin-900','~admin','Site Archive','0',11,'0');
/*!40000 ALTER TABLE `sakai_site_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_site_page_property`
--

DROP TABLE IF EXISTS `sakai_site_page_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_site_page_property` (
  `SITE_ID` varchar(99) NOT NULL,
  `PAGE_ID` varchar(99) NOT NULL,
  `NAME` varchar(99) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`PAGE_ID`,`NAME`),
  KEY `IE_SAKAI_SITE_PAGE_PROP_SITE` (`SITE_ID`),
  CONSTRAINT `sakai_site_page_property_ibfk_2` FOREIGN KEY (`SITE_ID`) REFERENCES `sakai_site` (`SITE_ID`),
  CONSTRAINT `sakai_site_page_property_ibfk_1` FOREIGN KEY (`PAGE_ID`) REFERENCES `sakai_site_page` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_site_page_property`
--

LOCK TABLES `sakai_site_page_property` WRITE;
/*!40000 ALTER TABLE `sakai_site_page_property` DISABLE KEYS */;
INSERT INTO `sakai_site_page_property` VALUES ('!admin','!admin-100','is_home_page','true'),('!admin','!admin-1205','sitePage.customTitle','true'),('!admin','!admin-1220','sitePage.customTitle','true'),('!admin','!admin-1230','sitePage.customTitle','true'),('!admin','!admin-1300','sitePage.customTitle','true'),('!admin','!admin-1400','sitePage.customTitle','true'),('!admin','!admin-1500','sitePage.customTitle','true'),('!admin','!admin-1575','sitePage.customTitle','true'),('!gateway','!gateway-200','sitePage.customTitle','true'),('!gateway','!gateway-300','sitePage.customTitle','true'),('!gateway','!gateway-500','sitePage.customTitle','true'),('!gateway','!gateway-600','sitePage.customTitle','true'),('!user','!user-100','is_home_page','true'),('!worksite','!worksite-100','is_home_page','true'),('mercury','mercury-100','is_home_page','true'),('~admin','~admin-100','is_home_page','true'),('~admin','~admin-400','sitePage.customTitle','true');
/*!40000 ALTER TABLE `sakai_site_page_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_site_property`
--

DROP TABLE IF EXISTS `sakai_site_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_site_property` (
  `SITE_ID` varchar(99) NOT NULL,
  `NAME` varchar(99) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`SITE_ID`,`NAME`),
  CONSTRAINT `sakai_site_property_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `sakai_site` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_site_property`
--

LOCK TABLES `sakai_site_property` WRITE;
/*!40000 ALTER TABLE `sakai_site_property` DISABLE KEYS */;
INSERT INTO `sakai_site_property` VALUES ('!error','display-users-present','false');
/*!40000 ALTER TABLE `sakai_site_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_site_tool`
--

DROP TABLE IF EXISTS `sakai_site_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_site_tool` (
  `TOOL_ID` varchar(99) NOT NULL,
  `PAGE_ID` varchar(99) NOT NULL,
  `SITE_ID` varchar(99) NOT NULL,
  `REGISTRATION` varchar(99) NOT NULL,
  `PAGE_ORDER` int(11) NOT NULL,
  `TITLE` varchar(99) DEFAULT NULL,
  `LAYOUT_HINTS` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`TOOL_ID`),
  KEY `PAGE_ID` (`PAGE_ID`),
  KEY `SITE_ID` (`SITE_ID`),
  CONSTRAINT `sakai_site_tool_ibfk_2` FOREIGN KEY (`SITE_ID`) REFERENCES `sakai_site` (`SITE_ID`),
  CONSTRAINT `sakai_site_tool_ibfk_1` FOREIGN KEY (`PAGE_ID`) REFERENCES `sakai_site_page` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_site_tool`
--

LOCK TABLES `sakai_site_tool` WRITE;
/*!40000 ALTER TABLE `sakai_site_tool` DISABLE KEYS */;
INSERT INTO `sakai_site_tool` VALUES ('!admin-1010','!admin-1000','!admin','sakai.scheduler',1,'Job Scheduler',NULL),('!admin-110','!admin-100','!admin','sakai.motd',1,'Message of the Day',NULL),('!admin-1110','!admin-1100','!admin','sakai.su',1,'Become User',NULL),('!admin-120','!admin-100','!admin','sakai.iframe.myworkspace',2,'Home Information',NULL),('!admin-1210','!admin-1200','!admin','sakai.usermembership',1,'User Membership',NULL),('!admin-1211','!admin-1205','!admin','sakai.emailtemplateservice',1,'Email Templates',NULL),('!admin-1225','!admin-1220','!admin','sakai.sitestats.admin',1,'Sitestats Admin',NULL),('!admin-1235','!admin-1230','!admin','sakai.basiclti.admin',1,'External Tools',NULL),('!admin-1350','!admin-1300','!admin','sakai.delegatedaccess',1,'Delegated Access',NULL),('!admin-1450','!admin-1400','!admin','sakai.adminsiteperms',1,'Admin Site Perms',NULL),('!admin-1550','!admin-1500','!admin','sakai.pasystem',1,'PA System',NULL),('!admin-1575','!admin-1575','!admin','sakai.message.bundle.manager',1,'Message Bundle Manager',NULL),('!admin-210','!admin-200','!admin','sakai.users',1,'Users',NULL),('!admin-260','!admin-250','!admin','sakai.aliases',1,'Aliases',NULL),('!admin-310','!admin-300','!admin','sakai.sites',1,'Sites',NULL),('!admin-355','!admin-350','!admin','sakai.realms',1,'Realms',NULL),('!admin-365','!admin-360','!admin','sakai.sitesetup',1,'Worksite Setup',NULL),('!admin-410','!admin-400','!admin','sakai.announcements',1,'MOTD',NULL),('!admin-510','!admin-500','!admin','sakai.resources',1,'Resources',NULL),('!admin-610','!admin-600','!admin','sakai.online',1,'On-Line',NULL),('!admin-710','!admin-700','!admin','sakai.memory',1,'Memory',NULL),('!admin-910','!admin-900','!admin','sakai.archive',1,'Site Archive / Import',NULL),('!contact-us','!contact-us','!contact-us','sakai.feedback',1,'Contact Us',NULL),('!error-110','!error-100','!error','sakai.iframe.site',1,'Site Unavailable',NULL),('!gateway-110','!gateway-100','!gateway','sakai.motd',1,'Message of the day',NULL),('!gateway-120','!gateway-100','!gateway','sakai.iframe.service',2,'Welcome!',NULL),('!gateway-210','!gateway-200','!gateway','sakai.iframe',1,'About',NULL),('!gateway-310','!gateway-300','!gateway','sakai.iframe',1,'Features',NULL),('!gateway-410','!gateway-400','!gateway','sakai.sitebrowser',1,'Sites',NULL),('!gateway-510','!gateway-500','!gateway','sakai.iframe',1,'Training',NULL),('!gateway-610','!gateway-600','!gateway','sakai.iframe',1,'Acknowledgments',NULL),('!gateway-710','!gateway-700','!gateway','sakai.createuser',1,'New Account',NULL),('!gateway-810','!gateway-800','!gateway','sakai.resetpass',1,'Reset Password',NULL),('!urlError-110','!urlError-100','!urlError','sakai.iframe.site',1,'Invalid URL',NULL),('!user-110','!user-100','!user','sakai.motd',1,'Message of the Day','0,0'),('!user-120','!user-100','!user','sakai.iframe.myworkspace',2,'Home Information','1,0'),('!user-130','!user-100','!user','sakai.summary.calendar',2,'Calendar','0,1'),('!user-140','!user-100','!user','sakai.synoptic.announcement',2,'Recent Announcements','1,1'),('!user-145','!user-100','!user','sakai.synoptic.messagecenter',2,'Unread Messages and Forums','1,1'),('!user-165','!user-150','!user','sakai.profile2',1,'Profile',NULL),('!user-210','!user-200','!user','sakai.membership',1,'Membership',NULL),('!user-310','!user-300','!user','sakai.schedule',1,'Calendar',NULL),('!user-410','!user-400','!user','sakai.resources',1,'Resources',NULL),('!user-455','!user-450','!user','sakai.announcements',1,'Announcements',NULL),('!user-510','!user-500','!user','sakai.sitesetup',1,'Worksite Setup',NULL),('!user-610','!user-600','!user','sakai.preferences',1,'Preferences',NULL),('!user-710','!user-700','!user','sakai.singleuser',1,'Account',NULL),('!worksite-110','!worksite-100','!worksite','sakai.iframe.site',1,'Home Information',NULL),('!worksite-120','!worksite-100','!worksite','sakai.synoptic.announcement',2,'Recent Announcements',NULL),('!worksite-130','!worksite-100','!worksite','sakai.synoptic.messagecenter',3,'Recent Forums Items',NULL),('!worksite-140','!worksite-100','!worksite','sakai.synoptic.chat',4,'Recent Chat Messages',NULL),('!worksite-210','!worksite-200','!worksite','sakai.schedule',1,'Calendar',NULL),('!worksite-310','!worksite-300','!worksite','sakai.announcements',1,'Announcements',NULL),('!worksite-410','!worksite-400','!worksite','sakai.resources',1,'Resources',NULL),('!worksite-510','!worksite-500','!worksite','sakai.forums',1,'Forums',NULL),('!worksite-610','!worksite-600','!worksite','sakai.assignment.grades',1,'Assignments',NULL),('!worksite-710','!worksite-700','!worksite','sakai.dropbox',1,'Drop Box',NULL),('!worksite-810','!worksite-800','!worksite','sakai.chat',1,'Chat',NULL),('!worksite-910','!worksite-900','!worksite','sakai.mailbox',1,'Email Archive',NULL),('2902dbc4-a934-4c5e-a745-a19afb65d434','055d7249-0e58-4432-8d0b-a44ec586b298','citationsAdmin','sakai.resources',1,NULL,NULL),('mercury-1010','mercury-1000','mercury','sakai.siteinfo',1,'Site Info',NULL),('mercury-110','mercury-100','mercury','sakai.iframe.site',1,'Home Information',NULL),('mercury-120','mercury-100','mercury','sakai.synoptic.announcement',2,'Recent Announcements',NULL),('mercury-130','mercury-100','mercury','sakai.synoptic.messagecenter',3,'Recent Forums Items',NULL),('mercury-140','mercury-100','mercury','sakai.synoptic.chat',4,'Recent Chat Messages',NULL),('mercury-210','mercury-200','mercury','sakai.schedule',1,'Calendar',NULL),('mercury-310','mercury-300','mercury','sakai.announcements',1,'Announcements',NULL),('mercury-360','mercury-350','mercury','sakai.lessonbuildertool',1,'Lessons',NULL),('mercury-410','mercury-400','mercury','sakai.resources',1,'Resources',NULL),('mercury-510','mercury-500','mercury','sakai.forums',1,'Forums',NULL),('mercury-610','mercury-600','mercury','sakai.assignment.grades',1,'Assignments',NULL),('mercury-710','mercury-700','mercury','sakai.dropbox',1,'Drop Box',NULL),('mercury-810','mercury-800','mercury','sakai.chat',1,'Chat',NULL),('mercury-910','mercury-900','mercury','sakai.mailbox',1,'Email Archive',NULL),('~admin-1010','~admin-1000','~admin','sakai.scheduler',1,'Job Scheduler',NULL),('~admin-110','~admin-100','~admin','sakai.motd',1,'Message of the Day',NULL),('~admin-1110','~admin-1100','~admin','sakai.su',1,'Become User',NULL),('~admin-1125','~admin-1120','~admin','sakai.preferences',1,'Preferences',NULL),('~admin-120','~admin-100','~admin','sakai.iframe.myworkspace',2,'Home Information',NULL),('~admin-1210','~admin-1200','~admin','sakai.usermembership',1,'User Membership',NULL),('~admin-210','~admin-200','~admin','sakai.users',1,'Users',NULL),('~admin-260','~admin-250','~admin','sakai.aliases',1,'Aliases',NULL),('~admin-310','~admin-300','~admin','sakai.sites',1,'Sites',NULL),('~admin-355','~admin-350','~admin','sakai.realms',1,'Realms',NULL),('~admin-365','~admin-360','~admin','sakai.sitesetup',1,'Worksite Setup',NULL),('~admin-410','~admin-400','~admin','sakai.announcements',1,'MOTD',NULL),('~admin-510','~admin-500','~admin','sakai.resources',1,'Resources',NULL),('~admin-610','~admin-600','~admin','sakai.online',1,'On-Line',NULL),('~admin-710','~admin-700','~admin','sakai.memory',1,'Memory',NULL),('~admin-910','~admin-900','~admin','sakai.archive',1,'Site Archive / Import',NULL);
/*!40000 ALTER TABLE `sakai_site_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_site_tool_property`
--

DROP TABLE IF EXISTS `sakai_site_tool_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_site_tool_property` (
  `SITE_ID` varchar(99) NOT NULL,
  `TOOL_ID` varchar(99) NOT NULL,
  `NAME` varchar(99) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`TOOL_ID`,`NAME`),
  KEY `IE_SAKAI_SITE_TOOL_PROP_SITE` (`SITE_ID`),
  CONSTRAINT `sakai_site_tool_property_ibfk_2` FOREIGN KEY (`SITE_ID`) REFERENCES `sakai_site` (`SITE_ID`),
  CONSTRAINT `sakai_site_tool_property_ibfk_1` FOREIGN KEY (`TOOL_ID`) REFERENCES `sakai_site_tool` (`TOOL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_site_tool_property`
--

LOCK TABLES `sakai_site_tool_property` WRITE;
/*!40000 ALTER TABLE `sakai_site_tool_property` DISABLE KEYS */;
INSERT INTO `sakai_site_tool_property` VALUES ('!admin','!admin-410','channel','/announcement/channel/!site/motd'),('!admin','!admin-510','home','/'),('!error','!error-110','height','400px'),('!gateway','!gateway-210','height','500px'),('!gateway','!gateway-210','source','/library/content/gateway/about.html'),('!gateway','!gateway-310','height','500px'),('!gateway','!gateway-310','source','/library/content/gateway/features.html'),('!gateway','!gateway-510','height','500px'),('!gateway','!gateway-510','source','/library/content/gateway/training.html'),('!gateway','!gateway-610','height','500px'),('!gateway','!gateway-610','source','/library/content/gateway/acknowledgments.html'),('!urlError','!urlError-110','height','400px'),('!user','!user-710','include-password','true'),('!worksite','!worksite-110','height','100px'),('!worksite','!worksite-510','category','false'),('!worksite','!worksite-710','resources_mode','dropbox'),('!worksite','!worksite-810','display-date','true'),('!worksite','!worksite-810','display-time','true'),('!worksite','!worksite-810','display-user','true'),('!worksite','!worksite-810','filter-param','3'),('!worksite','!worksite-810','filter-type','SelectMessagesByTime'),('!worksite','!worksite-810','sound-alert','true'),('mercury','mercury-510','category','false'),('mercury','mercury-710','resources_mode','dropbox'),('mercury','mercury-810','display-date','true'),('mercury','mercury-810','display-time','true'),('mercury','mercury-810','display-user','true'),('mercury','mercury-810','filter-param','3'),('mercury','mercury-810','filter-type','SelectMessagesByTime'),('mercury','mercury-810','sound-alert','true'),('~admin','~admin-410','channel','/announcement/channel/!site/motd'),('~admin','~admin-510','home','/');
/*!40000 ALTER TABLE `sakai_site_tool_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_site_user`
--

DROP TABLE IF EXISTS `sakai_site_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_site_user` (
  `SITE_ID` varchar(99) NOT NULL,
  `USER_ID` varchar(99) NOT NULL,
  `PERMISSION` int(11) NOT NULL,
  PRIMARY KEY (`SITE_ID`,`USER_ID`),
  KEY `IE_SAKAI_SITE_USER_USER` (`USER_ID`),
  CONSTRAINT `sakai_site_user_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `sakai_site` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_site_user`
--

LOCK TABLES `sakai_site_user` WRITE;
/*!40000 ALTER TABLE `sakai_site_user` DISABLE KEYS */;
INSERT INTO `sakai_site_user` VALUES ('!admin','admin',-1),('citationsAdmin','admin',-1);
/*!40000 ALTER TABLE `sakai_site_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_syllabus_attach`
--

DROP TABLE IF EXISTS `sakai_syllabus_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_syllabus_attach` (
  `syllabusAttachId` bigint(20) NOT NULL AUTO_INCREMENT,
  `lockId` int(11) NOT NULL,
  `attachmentId` varchar(256) NOT NULL,
  `syllabusAttachName` varchar(256) NOT NULL,
  `syllabusAttachSize` varchar(256) DEFAULT NULL,
  `syllabusAttachType` varchar(256) DEFAULT NULL,
  `createdBy` varchar(256) DEFAULT NULL,
  `syllabusAttachUrl` varchar(256) NOT NULL,
  `lastModifiedBy` varchar(256) DEFAULT NULL,
  `syllabusId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`syllabusAttachId`),
  KEY `SYLLABUS_ATTACH_ID_I` (`syllabusId`),
  CONSTRAINT `FK_dfrx5ilpaiqtqvl4tnt8ict2l` FOREIGN KEY (`syllabusId`) REFERENCES `sakai_syllabus_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_syllabus_attach`
--

LOCK TABLES `sakai_syllabus_attach` WRITE;
/*!40000 ALTER TABLE `sakai_syllabus_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_syllabus_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_syllabus_data`
--

DROP TABLE IF EXISTS `sakai_syllabus_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_syllabus_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lockId` int(11) NOT NULL,
  `asset` longtext,
  `position_c` int(11) NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `xview` varchar(16) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `emailNotification` varchar(128) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `LINK_CALENDAR` bit(1) DEFAULT NULL,
  `CALENDAR_EVENT_ID_START` varchar(99) DEFAULT NULL,
  `CALENDAR_EVENT_ID_END` varchar(99) DEFAULT NULL,
  `surrogateKey` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `syllabus_position` (`position_c`),
  KEY `SYLLABUS_DATA_SURRO_I` (`surrogateKey`),
  CONSTRAINT `FK_8exibgv013xresxmidjumv3ki` FOREIGN KEY (`surrogateKey`) REFERENCES `sakai_syllabus_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_syllabus_data`
--

LOCK TABLES `sakai_syllabus_data` WRITE;
/*!40000 ALTER TABLE `sakai_syllabus_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_syllabus_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_syllabus_item`
--

DROP TABLE IF EXISTS `sakai_syllabus_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_syllabus_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lockId` int(11) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `contextId` varchar(255) NOT NULL,
  `redirectURL` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueSyllabus` (`userId`,`contextId`),
  KEY `syllabus_userId` (`userId`),
  KEY `syllabus_contextId` (`contextId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_syllabus_item`
--

LOCK TABLES `sakai_syllabus_item` WRITE;
/*!40000 ALTER TABLE `sakai_syllabus_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_syllabus_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_user`
--

DROP TABLE IF EXISTS `sakai_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_user` (
  `USER_ID` varchar(99) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_LC` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `PW` varchar(255) DEFAULT NULL,
  `CREATEDBY` varchar(99) NOT NULL,
  `MODIFIEDBY` varchar(99) NOT NULL,
  `CREATEDON` datetime NOT NULL,
  `MODIFIEDON` datetime NOT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `IE_SAKAI_USER_CREATED` (`CREATEDBY`,`CREATEDON`),
  KEY `IE_SAKAI_USER_MODDED` (`MODIFIEDBY`,`MODIFIEDON`),
  KEY `IE_SAKAI_USER_EMAIL` (`EMAIL_LC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_user`
--

LOCK TABLES `sakai_user` WRITE;
/*!40000 ALTER TABLE `sakai_user` DISABLE KEYS */;
INSERT INTO `sakai_user` VALUES ('admin','','','Sakai','Administrator','','ISMvKXpXpadDiUoOSoAfww==','admin','admin','2019-05-16 09:42:59','2019-05-16 09:42:59'),('postmaster','','','Sakai','Postmaster','','','postmaster','postmaster','2019-05-16 09:42:59','2019-05-16 09:42:59');
/*!40000 ALTER TABLE `sakai_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_user_id_map`
--

DROP TABLE IF EXISTS `sakai_user_id_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_user_id_map` (
  `USER_ID` varchar(99) NOT NULL,
  `EID` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `AK_SAKAI_USER_ID_MAP_EID` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_user_id_map`
--

LOCK TABLES `sakai_user_id_map` WRITE;
/*!40000 ALTER TABLE `sakai_user_id_map` DISABLE KEYS */;
INSERT INTO `sakai_user_id_map` VALUES ('admin','admin'),('postmaster','postmaster');
/*!40000 ALTER TABLE `sakai_user_id_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sakai_user_property`
--

DROP TABLE IF EXISTS `sakai_user_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sakai_user_property` (
  `USER_ID` varchar(99) NOT NULL,
  `NAME` varchar(99) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`USER_ID`,`NAME`),
  CONSTRAINT `sakai_user_property_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `sakai_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sakai_user_property`
--

LOCK TABLES `sakai_user_property` WRITE;
/*!40000 ALTER TABLE `sakai_user_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `sakai_user_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_answer_t`
--

DROP TABLE IF EXISTS `sam_answer_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_answer_t` (
  `ANSWERID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEMTEXTID` bigint(20) NOT NULL,
  `ITEMID` bigint(20) NOT NULL,
  `TEXT` longtext,
  `SEQUENCE` bigint(20) NOT NULL,
  `LABEL` varchar(20) DEFAULT NULL,
  `ISCORRECT` bit(1) DEFAULT NULL,
  `GRADE` varchar(80) DEFAULT NULL,
  `SCORE` double DEFAULT NULL,
  `DISCOUNT` double DEFAULT NULL,
  `PARTIAL_CREDIT` double DEFAULT NULL,
  PRIMARY KEY (`ANSWERID`),
  KEY `FK_6gciva717mr610kehfqkyn2m8` (`ITEMTEXTID`),
  KEY `FK_nrc51r8ecaun5ycwd31566kws` (`ITEMID`),
  CONSTRAINT `FK_nrc51r8ecaun5ycwd31566kws` FOREIGN KEY (`ITEMID`) REFERENCES `sam_item_t` (`ITEMID`),
  CONSTRAINT `FK_6gciva717mr610kehfqkyn2m8` FOREIGN KEY (`ITEMTEXTID`) REFERENCES `sam_itemtext_t` (`ITEMTEXTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_answer_t`
--

LOCK TABLES `sam_answer_t` WRITE;
/*!40000 ALTER TABLE `sam_answer_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_answer_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_answerfeedback_t`
--

DROP TABLE IF EXISTS `sam_answerfeedback_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_answerfeedback_t` (
  `ANSWERFEEDBACKID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ANSWERID` bigint(20) NOT NULL,
  `TYPEID` varchar(255) DEFAULT NULL,
  `TEXT` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ANSWERFEEDBACKID`),
  KEY `FK_58un3udad8cwpman6vx2h7v0v` (`ANSWERID`),
  CONSTRAINT `FK_58un3udad8cwpman6vx2h7v0v` FOREIGN KEY (`ANSWERID`) REFERENCES `sam_answer_t` (`ANSWERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_answerfeedback_t`
--

LOCK TABLES `sam_answerfeedback_t` WRITE;
/*!40000 ALTER TABLE `sam_answerfeedback_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_answerfeedback_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_assessaccesscontrol_t`
--

DROP TABLE IF EXISTS `sam_assessaccesscontrol_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_assessaccesscontrol_t` (
  `ASSESSMENTID` bigint(20) NOT NULL,
  `SUBMISSIONSALLOWED` int(11) DEFAULT NULL,
  `UNLIMITEDSUBMISSIONS` bit(1) DEFAULT NULL,
  `SUBMISSIONSSAVED` int(11) DEFAULT NULL,
  `ASSESSMENTFORMAT` int(11) DEFAULT NULL,
  `BOOKMARKINGITEM` int(11) DEFAULT NULL,
  `TIMELIMIT` int(11) DEFAULT NULL,
  `TIMEDASSESSMENT` int(11) DEFAULT NULL,
  `RETRYALLOWED` int(11) DEFAULT NULL,
  `LATEHANDLING` int(11) DEFAULT NULL,
  `INSTRUCTORNOTIFICATION` int(11) DEFAULT NULL,
  `STARTDATE` datetime DEFAULT NULL,
  `DUEDATE` datetime DEFAULT NULL,
  `SCOREDATE` datetime DEFAULT NULL,
  `FEEDBACKDATE` datetime DEFAULT NULL,
  `RETRACTDATE` datetime DEFAULT NULL,
  `AUTOSUBMIT` int(11) DEFAULT NULL,
  `ITEMNAVIGATION` int(11) DEFAULT NULL,
  `ITEMNUMBERING` int(11) DEFAULT NULL,
  `DISPLAYSCORE` int(11) DEFAULT NULL,
  `SUBMISSIONMESSAGE` varchar(4000) DEFAULT NULL,
  `RELEASETO` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `FINALPAGEURL` varchar(1023) DEFAULT NULL,
  `MARKFORREVIEW` int(11) DEFAULT NULL,
  `HONORPLEDGE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ASSESSMENTID`),
  CONSTRAINT `FK_802pcpixvjjtt2v94xsqnrcr5` FOREIGN KEY (`ASSESSMENTID`) REFERENCES `sam_assessmentbase_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_assessaccesscontrol_t`
--

LOCK TABLES `sam_assessaccesscontrol_t` WRITE;
/*!40000 ALTER TABLE `sam_assessaccesscontrol_t` DISABLE KEYS */;
INSERT INTO `sam_assessaccesscontrol_t` VALUES (1,NULL,_binary '',1,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,2,1,1,'','','','',NULL,NULL),(2,NULL,_binary '',1,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,2,1,1,'','','','',1,NULL),(3,1,_binary '\0',1,3,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,1,'','','','',NULL,NULL),(4,NULL,_binary '',1,2,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,2,1,1,'','','','',NULL,NULL),(5,1,_binary '\0',1,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,2,1,1,'','','','',NULL,NULL),(6,1,_binary '\0',1,1,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,1,'','','','',NULL,NULL),(7,1,_binary '\0',1,1,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,1,'','','','',NULL,NULL);
/*!40000 ALTER TABLE `sam_assessaccesscontrol_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_assessevaluation_t`
--

DROP TABLE IF EXISTS `sam_assessevaluation_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_assessevaluation_t` (
  `ASSESSMENTID` bigint(20) NOT NULL,
  `EVALUATIONCOMPONENTS` varchar(255) DEFAULT NULL,
  `SCORINGTYPE` int(11) DEFAULT NULL,
  `NUMERICMODELID` varchar(255) DEFAULT NULL,
  `FIXEDTOTALSCORE` int(11) DEFAULT NULL,
  `GRADEAVAILABLE` int(11) DEFAULT NULL,
  `ISSTUDENTIDPUBLIC` int(11) DEFAULT NULL,
  `ANONYMOUSGRADING` int(11) DEFAULT NULL,
  `AUTOSCORING` int(11) DEFAULT NULL,
  `TOGRADEBOOK` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ASSESSMENTID`),
  CONSTRAINT `FK_tke846o13r8lrxtj0rq5khj76` FOREIGN KEY (`ASSESSMENTID`) REFERENCES `sam_assessmentbase_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_assessevaluation_t`
--

LOCK TABLES `sam_assessevaluation_t` WRITE;
/*!40000 ALTER TABLE `sam_assessevaluation_t` DISABLE KEYS */;
INSERT INTO `sam_assessevaluation_t` VALUES (1,'',1,'',NULL,NULL,NULL,2,NULL,'2'),(2,'',1,'',NULL,NULL,NULL,1,NULL,'2'),(3,'',1,'',NULL,NULL,NULL,2,NULL,'2'),(4,'',1,'',NULL,NULL,NULL,2,NULL,'2'),(5,'',1,'',NULL,NULL,NULL,1,NULL,'2'),(6,'',1,'',NULL,NULL,NULL,1,NULL,'2'),(7,'',1,'',NULL,NULL,NULL,1,NULL,'2');
/*!40000 ALTER TABLE `sam_assessevaluation_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_assessfeedback_t`
--

DROP TABLE IF EXISTS `sam_assessfeedback_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_assessfeedback_t` (
  `ASSESSMENTID` bigint(20) NOT NULL,
  `FEEDBACKDELIVERY` int(11) DEFAULT NULL,
  `FEEDBACKCOMPONENTOPTION` int(11) DEFAULT NULL,
  `FEEDBACKAUTHORING` int(11) DEFAULT NULL,
  `EDITCOMPONENTS` int(11) DEFAULT NULL,
  `SHOWQUESTIONTEXT` bit(1) DEFAULT NULL,
  `SHOWSTUDENTRESPONSE` bit(1) DEFAULT NULL,
  `SHOWCORRECTRESPONSE` bit(1) DEFAULT NULL,
  `SHOWSTUDENTSCORE` bit(1) DEFAULT NULL,
  `SHOWSTUDENTQUESTIONSCORE` bit(1) DEFAULT NULL,
  `SHOWQUESTIONLEVELFEEDBACK` bit(1) DEFAULT NULL,
  `SHOWSELECTIONLEVELFEEDBACK` bit(1) DEFAULT NULL,
  `SHOWGRADERCOMMENTS` bit(1) DEFAULT NULL,
  `SHOWSTATISTICS` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ASSESSMENTID`),
  CONSTRAINT `FK_mltq4ig7su166p0mnj1xj3q6i` FOREIGN KEY (`ASSESSMENTID`) REFERENCES `sam_assessmentbase_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_assessfeedback_t`
--

LOCK TABLES `sam_assessfeedback_t` WRITE;
/*!40000 ALTER TABLE `sam_assessfeedback_t` DISABLE KEYS */;
INSERT INTO `sam_assessfeedback_t` VALUES (1,3,2,1,1,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(2,3,2,3,1,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(3,3,2,1,1,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(4,3,2,1,1,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(5,1,2,3,1,_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary ''),(6,3,2,1,1,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0'),(7,3,2,1,1,_binary '',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `sam_assessfeedback_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_assessmentbase_t`
--

DROP TABLE IF EXISTS `sam_assessmentbase_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_assessmentbase_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `isTemplate` varchar(255) NOT NULL,
  `PARENTID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `COMMENTS` varchar(4000) DEFAULT NULL,
  `TYPEID` bigint(20) DEFAULT NULL,
  `INSTRUCTORNOTIFICATION` int(11) DEFAULT NULL,
  `TESTEENOTIFICATION` int(11) DEFAULT NULL,
  `MULTIPARTALLOWED` int(11) DEFAULT NULL,
  `STATUS` int(11) NOT NULL,
  `CREATEDBY` varchar(255) NOT NULL,
  `CREATEDDATE` datetime NOT NULL,
  `LASTMODIFIEDBY` varchar(255) NOT NULL,
  `LASTMODIFIEDDATE` datetime NOT NULL,
  `ASSESSMENTTEMPLATEID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_assessmentbase_t`
--

LOCK TABLES `sam_assessmentbase_t` WRITE;
/*!40000 ALTER TABLE `sam_assessmentbase_t` DISABLE KEYS */;
INSERT INTO `sam_assessmentbase_t` VALUES (1,'1',0,'Default Assessment Type','System Defined Assessment Type','comments',142,1,1,1,1,'admin','2005-01-01 12:00:00','admin','2005-01-01 12:00:00',NULL),(2,'1',0,'Formative Assessment','System Defined Assessment Type','',142,1,1,1,1,'admin','2006-06-01 12:00:00','admin','2006-06-01 12:00:00',NULL),(3,'1',0,'Quiz','System Defined Assessment Type','',142,1,1,1,1,'admin','2006-06-01 12:00:00','admin','2006-06-01 12:00:00',NULL),(4,'1',0,'Problem Set','System Defined Assessment Type','',142,1,1,1,1,'admin','2006-06-01 12:00:00','admin','2006-06-01 12:00:00',NULL),(5,'1',0,'Survey','System Defined Assessment Type','',142,1,1,1,1,'admin','2006-06-01 12:00:00','admin','2006-06-01 12:00:00',NULL),(6,'1',0,'Test','System Defined Assessment Type','',142,1,1,1,1,'admin','2006-06-01 12:00:00','admin','2006-06-01 12:00:00',NULL),(7,'1',0,'Timed Test','System Defined Assessment Type','',142,1,1,1,1,'admin','2006-06-01 12:00:00','admin','2006-06-01 12:00:00',NULL);
/*!40000 ALTER TABLE `sam_assessmentbase_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_assessmentgrading_t`
--

DROP TABLE IF EXISTS `sam_assessmentgrading_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_assessmentgrading_t` (
  `ASSESSMENTGRADINGID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PUBLISHEDASSESSMENTID` bigint(20) NOT NULL,
  `AGENTID` varchar(255) NOT NULL,
  `SUBMITTEDDATE` datetime DEFAULT NULL,
  `ISLATE` bit(1) NOT NULL,
  `FORGRADE` bit(1) NOT NULL,
  `TOTALAUTOSCORE` double DEFAULT NULL,
  `TOTALOVERRIDESCORE` double DEFAULT NULL,
  `FINALSCORE` double DEFAULT NULL,
  `COMMENTS` longtext,
  `GRADEDBY` varchar(255) DEFAULT NULL,
  `GRADEDDATE` datetime DEFAULT NULL,
  `STATUS` int(11) NOT NULL,
  `ATTEMPTDATE` datetime DEFAULT NULL,
  `TIMEELAPSED` int(11) DEFAULT NULL,
  `ISAUTOSUBMITTED` bit(1) DEFAULT NULL,
  `LASTVISITEDPART` int(11) DEFAULT NULL,
  `LASTVISITEDQUESTION` int(11) DEFAULT NULL,
  `HASAUTOSUBMISSIONRUN` bit(1) NOT NULL,
  PRIMARY KEY (`ASSESSMENTGRADINGID`),
  KEY `SAM_PUBLISHEDASSESSMENT_I` (`PUBLISHEDASSESSMENTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_assessmentgrading_t`
--

LOCK TABLES `sam_assessmentgrading_t` WRITE;
/*!40000 ALTER TABLE `sam_assessmentgrading_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_assessmentgrading_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_assessmetadata_t`
--

DROP TABLE IF EXISTS `sam_assessmetadata_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_assessmetadata_t` (
  `ASSESSMENTMETADATAID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ASSESSMENTID` bigint(20) NOT NULL,
  `LABEL` varchar(99) NOT NULL,
  `ENTRY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ASSESSMENTMETADATAID`),
  KEY `SAM_METADATA_IDX` (`LABEL`,`ENTRY`),
  KEY `FK_l4v89nopr0hjpbaog8wj78xqx` (`ASSESSMENTID`),
  CONSTRAINT `FK_l4v89nopr0hjpbaog8wj78xqx` FOREIGN KEY (`ASSESSMENTID`) REFERENCES `sam_assessmentbase_t` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_assessmetadata_t`
--

LOCK TABLES `sam_assessmetadata_t` WRITE;
/*!40000 ALTER TABLE `sam_assessmetadata_t` DISABLE KEYS */;
INSERT INTO `sam_assessmetadata_t` VALUES (1,1,'finalPageURL_isInstructorEditable','true'),(2,1,'anonymousRelease_isInstructorEditable','true'),(3,1,'dueDate_isInstructorEditable','true'),(4,1,'description_isInstructorEditable','true'),(5,1,'metadataQuestions_isInstructorEditable','true'),(6,1,'bgImage_isInstructorEditable','true'),(7,1,'feedbackComponents_isInstructorEditable','true'),(8,1,'retractDate_isInstructorEditable','true'),(9,1,'feedbackType_isInstructorEditable','true'),(10,1,'timedAssessmentAutoSubmit_isInstructorEditable','true'),(11,1,'toGradebook_isInstructorEditable','true'),(12,1,'displayChunking_isInstructorEditable','true'),(13,1,'recordedScore_isInstructorEditable','true'),(14,1,'authenticatedRelease_isInstructorEditable','true'),(15,1,'displayNumbering_isInstructorEditable','true'),(16,1,'submissionMessage_isInstructorEditable','true'),(17,1,'releaseDate_isInstructorEditable','true'),(18,1,'assessmentAuthor_isInstructorEditable','true'),(19,1,'passwordRequired_isInstructorEditable','true'),(20,1,'lockedBrowser_isInstructorEditable','true'),(21,1,'submissionModel_isInstructorEditable','true'),(22,1,'ipAccessType_isInstructorEditable','true'),(23,1,'timedAssessment_isInstructorEditable','true'),(24,1,'metadataAssess_isInstructorEditable','true'),(25,1,'bgColor_isInstructorEditable','true'),(26,1,'testeeIdentity_isInstructorEditable','true'),(27,1,'templateInfo_isInstructorEditable','true'),(28,1,'itemAccessType_isInstructorEditable','true'),(29,1,'lateHandling_isInstructorEditable','true'),(30,1,'feedbackAuthoring_isInstructorEditable','true'),(31,1,'releaseTo','SITE_MEMBERS'),(32,1,'displayScores_isInstructorEditable','true'),(33,1,'honorpledge_isInstructorEditable','true'),(34,2,'finalPageURL_isInstructorEditable','true'),(35,2,'anonymousRelease_isInstructorEditable','true'),(36,2,'dueDate_isInstructorEditable','true'),(37,2,'description_isInstructorEditable','true'),(38,2,'metadataQuestions_isInstructorEditable','true'),(39,2,'bgImage_isInstructorEditable','true'),(40,2,'feedbackComponents_isInstructorEditable','true'),(41,2,'retractDate_isInstructorEditable','true'),(42,2,'feedbackType_isInstructorEditable','true'),(43,2,'timedAssessmentAutoSubmit_isInstructorEditable','true'),(44,2,'toGradebook_isInstructorEditable','false'),(45,2,'displayChunking_isInstructorEditable','true'),(46,2,'recordedScore_isInstructorEditable','false'),(47,2,'authenticatedRelease_isInstructorEditable','true'),(48,2,'displayNumbering_isInstructorEditable','true'),(49,2,'displayScores_isInstructorEditable','true'),(50,2,'submissionMessage_isInstructorEditable','true'),(51,2,'releaseDate_isInstructorEditable','true'),(52,2,'assessmentAuthor_isInstructorEditable','true'),(53,2,'passwordRequired_isInstructorEditable','false'),(54,2,'author',''),(55,2,'submissionModel_isInstructorEditable','true'),(56,2,'ipAccessType_isInstructorEditable','false'),(57,2,'timedAssessment_isInstructorEditable','true'),(58,2,'metadataAssess_isInstructorEditable','true'),(59,2,'bgColor_isInstructorEditable','true'),(60,2,'testeeIdentity_isInstructorEditable','false'),(61,2,'templateInfo_isInstructorEditable','true'),(62,2,'itemAccessType_isInstructorEditable','true'),(63,2,'lateHandling_isInstructorEditable','false'),(64,2,'feedbackAuthoring_isInstructorEditable','true'),(65,2,'releaseTo','SITE_MEMBERS'),(66,2,'honorpledge_isInstructorEditable','true'),(67,3,'finalPageURL_isInstructorEditable','true'),(68,3,'anonymousRelease_isInstructorEditable','false'),(69,3,'dueDate_isInstructorEditable','true'),(70,3,'description_isInstructorEditable','true'),(71,3,'metadataQuestions_isInstructorEditable','true'),(72,3,'bgImage_isInstructorEditable','true'),(73,3,'feedbackComponents_isInstructorEditable','true'),(74,3,'retractDate_isInstructorEditable','true'),(75,3,'feedbackType_isInstructorEditable','true'),(76,3,'timedAssessmentAutoSubmit_isInstructorEditable','false'),(77,3,'toGradebook_isInstructorEditable','true'),(78,3,'displayChunking_isInstructorEditable','true'),(79,3,'recordedScore_isInstructorEditable','false'),(80,3,'authenticatedRelease_isInstructorEditable','true'),(81,3,'displayNumbering_isInstructorEditable','true'),(82,3,'displayScores_isInstructorEditable','true'),(83,3,'submissionMessage_isInstructorEditable','true'),(84,3,'releaseDate_isInstructorEditable','true'),(85,3,'assessmentAuthor_isInstructorEditable','true'),(86,3,'passwordRequired_isInstructorEditable','false'),(87,3,'author',''),(88,3,'submissionModel_isInstructorEditable','true'),(89,3,'ipAccessType_isInstructorEditable','false'),(90,3,'timedAssessment_isInstructorEditable','false'),(91,3,'metadataAssess_isInstructorEditable','true'),(92,3,'bgColor_isInstructorEditable','true'),(93,3,'testeeIdentity_isInstructorEditable','true'),(94,3,'templateInfo_isInstructorEditable','true'),(95,3,'itemAccessType_isInstructorEditable','true'),(96,3,'lateHandling_isInstructorEditable','true'),(97,3,'feedbackAuthoring_isInstructorEditable','true'),(98,3,'releaseTo','SITE_MEMBERS'),(99,3,'honorpledge_isInstructorEditable','true'),(100,4,'finalPageURL_isInstructorEditable','true'),(101,4,'anonymousRelease_isInstructorEditable','false'),(102,4,'dueDate_isInstructorEditable','true'),(103,4,'description_isInstructorEditable','true'),(104,4,'metadataQuestions_isInstructorEditable','true'),(105,4,'bgImage_isInstructorEditable','true'),(106,4,'feedbackComponents_isInstructorEditable','true'),(107,4,'retractDate_isInstructorEditable','true'),(108,4,'feedbackType_isInstructorEditable','true'),(109,4,'timedAssessmentAutoSubmit_isInstructorEditable','false'),(110,4,'toGradebook_isInstructorEditable','true'),(111,4,'displayChunking_isInstructorEditable','true'),(112,4,'recordedScore_isInstructorEditable','true'),(113,4,'authenticatedRelease_isInstructorEditable','true'),(114,4,'displayNumbering_isInstructorEditable','true'),(115,4,'displayScores_isInstructorEditable','true'),(116,4,'submissionMessage_isInstructorEditable','true'),(117,4,'releaseDate_isInstructorEditable','true'),(118,4,'assessmentAuthor_isInstructorEditable','true'),(119,4,'passwordRequired_isInstructorEditable','false'),(120,4,'author',''),(121,4,'submissionModel_isInstructorEditable','true'),(122,4,'ipAccessType_isInstructorEditable','false'),(123,4,'timedAssessment_isInstructorEditable','false'),(124,4,'metadataAssess_isInstructorEditable','true'),(125,4,'bgColor_isInstructorEditable','true'),(126,4,'testeeIdentity_isInstructorEditable','true'),(127,4,'templateInfo_isInstructorEditable','true'),(128,4,'itemAccessType_isInstructorEditable','true'),(129,4,'lateHandling_isInstructorEditable','true'),(130,4,'feedbackAuthoring_isInstructorEditable','true'),(131,4,'releaseTo','SITE_MEMBERS'),(132,4,'honorpledge_isInstructorEditable','true'),(133,5,'finalPageURL_isInstructorEditable','true'),(134,5,'anonymousRelease_isInstructorEditable','true'),(135,5,'dueDate_isInstructorEditable','true'),(136,5,'description_isInstructorEditable','true'),(137,5,'metadataQuestions_isInstructorEditable','true'),(138,5,'bgImage_isInstructorEditable','true'),(139,5,'feedbackComponents_isInstructorEditable','true'),(140,5,'retractDate_isInstructorEditable','true'),(141,5,'feedbackType_isInstructorEditable','true'),(142,5,'timedAssessmentAutoSubmit_isInstructorEditable','false'),(143,5,'toGradebook_isInstructorEditable','true'),(144,5,'displayChunking_isInstructorEditable','true'),(145,5,'recordedScore_isInstructorEditable','false'),(146,5,'authenticatedRelease_isInstructorEditable','false'),(147,5,'displayNumbering_isInstructorEditable','true'),(148,5,'displayScores_isInstructorEditable','true'),(149,5,'submissionMessage_isInstructorEditable','true'),(150,5,'releaseDate_isInstructorEditable','true'),(151,5,'assessmentAuthor_isInstructorEditable','true'),(152,5,'passwordRequired_isInstructorEditable','false'),(153,5,'author',''),(154,5,'submissionModel_isInstructorEditable','true'),(155,5,'ipAccessType_isInstructorEditable','false'),(156,5,'timedAssessment_isInstructorEditable','false'),(157,5,'metadataAssess_isInstructorEditable','true'),(158,5,'bgColor_isInstructorEditable','true'),(159,5,'testeeIdentity_isInstructorEditable','true'),(160,5,'templateInfo_isInstructorEditable','true'),(161,5,'itemAccessType_isInstructorEditable','true'),(162,5,'lateHandling_isInstructorEditable','false'),(163,5,'feedbackAuthoring_isInstructorEditable','false'),(164,5,'releaseTo','SITE_MEMBERS'),(165,5,'honorpledge_isInstructorEditable','true'),(166,6,'finalPageURL_isInstructorEditable','true'),(167,6,'anonymousRelease_isInstructorEditable','false'),(168,6,'dueDate_isInstructorEditable','true'),(169,6,'description_isInstructorEditable','true'),(170,6,'metadataQuestions_isInstructorEditable','true'),(171,6,'bgImage_isInstructorEditable','true'),(172,6,'feedbackComponents_isInstructorEditable','true'),(173,6,'retractDate_isInstructorEditable','true'),(174,6,'feedbackType_isInstructorEditable','true'),(175,6,'timedAssessmentAutoSubmit_isInstructorEditable','false'),(176,6,'toGradebook_isInstructorEditable','true'),(177,6,'displayChunking_isInstructorEditable','true'),(178,6,'recordedScore_isInstructorEditable','false'),(179,6,'authenticatedRelease_isInstructorEditable','false'),(180,6,'displayNumbering_isInstructorEditable','true'),(181,6,'displayScores_isInstructorEditable','true'),(182,6,'submissionMessage_isInstructorEditable','true'),(183,6,'releaseDate_isInstructorEditable','true'),(184,6,'assessmentAuthor_isInstructorEditable','true'),(185,6,'passwordRequired_isInstructorEditable','true'),(186,6,'lockedBrowser_isInstructorEditable','true'),(187,6,'author',''),(188,6,'submissionModel_isInstructorEditable','true'),(189,6,'ipAccessType_isInstructorEditable','false'),(190,6,'timedAssessment_isInstructorEditable','false'),(191,6,'metadataAssess_isInstructorEditable','true'),(192,6,'bgColor_isInstructorEditable','true'),(193,6,'testeeIdentity_isInstructorEditable','true'),(194,6,'templateInfo_isInstructorEditable','true'),(195,6,'itemAccessType_isInstructorEditable','true'),(196,6,'lateHandling_isInstructorEditable','true'),(197,6,'feedbackAuthoring_isInstructorEditable','true'),(198,6,'releaseTo','SITE_MEMBERS'),(199,6,'honorpledge_isInstructorEditable','true'),(200,7,'finalPageURL_isInstructorEditable','true'),(201,7,'anonymousRelease_isInstructorEditable','false'),(202,7,'dueDate_isInstructorEditable','true'),(203,7,'description_isInstructorEditable','true'),(204,7,'metadataQuestions_isInstructorEditable','true'),(205,7,'bgImage_isInstructorEditable','true'),(206,7,'feedbackComponents_isInstructorEditable','true'),(207,7,'retractDate_isInstructorEditable','true'),(208,7,'feedbackType_isInstructorEditable','true'),(209,7,'timedAssessmentAutoSubmit_isInstructorEditable','true'),(210,7,'toGradebook_isInstructorEditable','true'),(211,7,'displayChunking_isInstructorEditable','true'),(212,7,'recordedScore_isInstructorEditable','false'),(213,7,'authenticatedRelease_isInstructorEditable','false'),(214,7,'displayNumbering_isInstructorEditable','true'),(215,7,'displayScores_isInstructorEditable','true'),(216,7,'submissionMessage_isInstructorEditable','true'),(217,7,'releaseDate_isInstructorEditable','true'),(218,7,'assessmentAuthor_isInstructorEditable','true'),(219,7,'passwordRequired_isInstructorEditable','true'),(220,7,'lockedBrowser_isInstructorEditable','true'),(221,7,'author',''),(222,7,'submissionModel_isInstructorEditable','true'),(223,7,'ipAccessType_isInstructorEditable','false'),(224,7,'timedAssessment_isInstructorEditable','true'),(225,7,'metadataAssess_isInstructorEditable','true'),(226,7,'bgColor_isInstructorEditable','true'),(227,7,'testeeIdentity_isInstructorEditable','true'),(228,7,'templateInfo_isInstructorEditable','true'),(229,7,'itemAccessType_isInstructorEditable','true'),(230,7,'lateHandling_isInstructorEditable','true'),(231,7,'feedbackAuthoring_isInstructorEditable','true'),(232,7,'releaseTo','SITE_MEMBERS'),(233,7,'honorpledge_isInstructorEditable','true'),(234,1,'markForReview_isInstructorEditable','true'),(235,2,'markForReview_isInstructorEditable','true'),(236,3,'markForReview_isInstructorEditable','true'),(237,4,'markForReview_isInstructorEditable','true'),(238,6,'markForReview_isInstructorEditable','true'),(239,7,'markForReview_isInstructorEditable','true');
/*!40000 ALTER TABLE `sam_assessmetadata_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_attachment_t`
--

DROP TABLE IF EXISTS `sam_attachment_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_attachment_t` (
  `ATTACHMENTID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ATTACHMENTTYPE` varchar(255) NOT NULL,
  `RESOURCEID` varchar(255) DEFAULT NULL,
  `FILENAME` varchar(255) DEFAULT NULL,
  `MIMETYPE` varchar(80) DEFAULT NULL,
  `FILESIZE` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `LOCATION` varchar(4000) DEFAULT NULL,
  `ISLINK` bit(1) DEFAULT NULL,
  `STATUS` int(11) NOT NULL,
  `CREATEDBY` varchar(255) NOT NULL,
  `CREATEDDATE` datetime NOT NULL,
  `LASTMODIFIEDBY` varchar(255) NOT NULL,
  `LASTMODIFIEDDATE` datetime NOT NULL,
  `ASSESSMENTID` bigint(20) DEFAULT NULL,
  `SECTIONID` bigint(20) DEFAULT NULL,
  `ITEMID` bigint(20) DEFAULT NULL,
  `ITEMTEXTID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ATTACHMENTID`),
  KEY `FK_mbtwvj82hcbh6hncp7kerp65s` (`ASSESSMENTID`),
  KEY `FK_rbjx0f0f76ca9p64j88rts0n6` (`SECTIONID`),
  KEY `FK_fhfatoqjhp3o3n72jx9h1ob57` (`ITEMID`),
  KEY `FK_60c1vsdn6fpa5iox51wh8m68y` (`ITEMTEXTID`),
  CONSTRAINT `FK_60c1vsdn6fpa5iox51wh8m68y` FOREIGN KEY (`ITEMTEXTID`) REFERENCES `sam_itemtext_t` (`ITEMTEXTID`),
  CONSTRAINT `FK_fhfatoqjhp3o3n72jx9h1ob57` FOREIGN KEY (`ITEMID`) REFERENCES `sam_item_t` (`ITEMID`),
  CONSTRAINT `FK_mbtwvj82hcbh6hncp7kerp65s` FOREIGN KEY (`ASSESSMENTID`) REFERENCES `sam_assessmentbase_t` (`ID`),
  CONSTRAINT `FK_rbjx0f0f76ca9p64j88rts0n6` FOREIGN KEY (`SECTIONID`) REFERENCES `sam_section_t` (`SECTIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_attachment_t`
--

LOCK TABLES `sam_attachment_t` WRITE;
/*!40000 ALTER TABLE `sam_attachment_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_attachment_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_authzdata_t`
--

DROP TABLE IF EXISTS `sam_authzdata_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_authzdata_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `lockId` int(11) NOT NULL,
  `AGENTID` varchar(99) NOT NULL,
  `FUNCTIONID` varchar(36) NOT NULL,
  `QUALIFIERID` varchar(36) NOT NULL,
  `EFFECTIVEDATE` date DEFAULT NULL,
  `EXPIRATIONDATE` date DEFAULT NULL,
  `LASTMODIFIEDBY` varchar(99) NOT NULL,
  `LASTMODIFIEDDATE` date NOT NULL,
  `ISEXPLICIT` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uniqueAuthz` (`AGENTID`,`FUNCTIONID`,`QUALIFIERID`),
  KEY `SAM_IDX_FUNC_QUAL` (`FUNCTIONID`,`QUALIFIERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_authzdata_t`
--

LOCK TABLES `sam_authzdata_t` WRITE;
/*!40000 ALTER TABLE `sam_authzdata_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_authzdata_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_eventlog_t`
--

DROP TABLE IF EXISTS `sam_eventlog_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_eventlog_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ASSESSMENTID` bigint(20) NOT NULL,
  `PROCESSID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(255) NOT NULL,
  `USEREID` varchar(99) NOT NULL,
  `SITEID` varchar(99) NOT NULL,
  `STARTDATE` datetime DEFAULT NULL,
  `ENDDATE` datetime DEFAULT NULL,
  `ECLIPSETIME` int(11) DEFAULT NULL,
  `ERRORMSG` varchar(255) DEFAULT NULL,
  `IPADDRESS` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SAM_EVENTLOG_PROCESSID_I` (`PROCESSID`),
  KEY `SAM_EVENTLOG_SITEID_I` (`SITEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_eventlog_t`
--

LOCK TABLES `sam_eventlog_t` WRITE;
/*!40000 ALTER TABLE `sam_eventlog_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_eventlog_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_extendedtime_t`
--

DROP TABLE IF EXISTS `sam_extendedtime_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_extendedtime_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ASSESSMENT_ID` bigint(20) DEFAULT NULL,
  `PUB_ASSESSMENT_ID` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `GROUP_ID` varchar(255) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `DUE_DATE` datetime DEFAULT NULL,
  `RETRACT_DATE` datetime DEFAULT NULL,
  `TIME_HOURS` int(11) DEFAULT NULL,
  `TIME_MINUTES` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_k6y738tearlq0h24tyy994oj0` (`ASSESSMENT_ID`),
  KEY `FK_2ccxqfvg121trmtrkeyvm642j` (`PUB_ASSESSMENT_ID`),
  CONSTRAINT `FK_2ccxqfvg121trmtrkeyvm642j` FOREIGN KEY (`PUB_ASSESSMENT_ID`) REFERENCES `sam_publishedassessment_t` (`ID`),
  CONSTRAINT `FK_k6y738tearlq0h24tyy994oj0` FOREIGN KEY (`ASSESSMENT_ID`) REFERENCES `sam_assessmentbase_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_extendedtime_t`
--

LOCK TABLES `sam_extendedtime_t` WRITE;
/*!40000 ALTER TABLE `sam_extendedtime_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_extendedtime_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_favoritecolchoices_t`
--

DROP TABLE IF EXISTS `sam_favoritecolchoices_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_favoritecolchoices_t` (
  `FAVORITEID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FAVORITENAME` varchar(255) DEFAULT NULL,
  `OWNERID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FAVORITEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_favoritecolchoices_t`
--

LOCK TABLES `sam_favoritecolchoices_t` WRITE;
/*!40000 ALTER TABLE `sam_favoritecolchoices_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_favoritecolchoices_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_favoritecolchoicesitem_t`
--

DROP TABLE IF EXISTS `sam_favoritecolchoicesitem_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_favoritecolchoicesitem_t` (
  `FAVORITEITEMID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FAVORITEID` bigint(20) NOT NULL,
  `SEQUENCE` int(11) NOT NULL,
  `TEXT` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`FAVORITEITEMID`),
  KEY `FK_awakcqf2hfviapurogsvgug5h` (`FAVORITEID`),
  CONSTRAINT `FK_awakcqf2hfviapurogsvgug5h` FOREIGN KEY (`FAVORITEID`) REFERENCES `sam_favoritecolchoices_t` (`FAVORITEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_favoritecolchoicesitem_t`
--

LOCK TABLES `sam_favoritecolchoicesitem_t` WRITE;
/*!40000 ALTER TABLE `sam_favoritecolchoicesitem_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_favoritecolchoicesitem_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_functiondata_t`
--

DROP TABLE IF EXISTS `sam_functiondata_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_functiondata_t` (
  `FUNCTIONID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REFERENCENAME` varchar(255) NOT NULL,
  `DISPLAYNAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `FUNCTIONTYPEID` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`FUNCTIONID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_functiondata_t`
--

LOCK TABLES `sam_functiondata_t` WRITE;
/*!40000 ALTER TABLE `sam_functiondata_t` DISABLE KEYS */;
INSERT INTO `sam_functiondata_t` VALUES (1,'take.published.assessment','Take Assessment','Take Assessment','81'),(2,'view.published.assessment','View Assessment','View Assessment','81'),(3,'submit.assessment','Submit Assessment','Submit Assessment','81'),(4,'submit.assessment.forgrade','Submit Assessment For Grade','Submit Assessment For Grade','81');
/*!40000 ALTER TABLE `sam_functiondata_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_gradingattachment_t`
--

DROP TABLE IF EXISTS `sam_gradingattachment_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_gradingattachment_t` (
  `ATTACHMENTID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ATTACHMENTTYPE` varchar(255) NOT NULL,
  `RESOURCEID` varchar(255) DEFAULT NULL,
  `FILENAME` varchar(255) DEFAULT NULL,
  `MIMETYPE` varchar(80) DEFAULT NULL,
  `FILESIZE` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `LOCATION` varchar(4000) DEFAULT NULL,
  `ISLINK` bit(1) DEFAULT NULL,
  `STATUS` int(11) NOT NULL,
  `CREATEDBY` varchar(255) NOT NULL,
  `CREATEDDATE` datetime NOT NULL,
  `LASTMODIFIEDBY` varchar(255) NOT NULL,
  `LASTMODIFIEDDATE` datetime NOT NULL,
  `ITEMGRADINGID` bigint(20) DEFAULT NULL,
  `ASSESSMENTGRADINGID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ATTACHMENTID`),
  KEY `FK_9j8csxkhsgd6299leyqar0lni` (`ITEMGRADINGID`),
  KEY `FK_oi19e21odlbi7oqmqr638860q` (`ASSESSMENTGRADINGID`),
  CONSTRAINT `FK_oi19e21odlbi7oqmqr638860q` FOREIGN KEY (`ASSESSMENTGRADINGID`) REFERENCES `sam_assessmentgrading_t` (`ASSESSMENTGRADINGID`),
  CONSTRAINT `FK_9j8csxkhsgd6299leyqar0lni` FOREIGN KEY (`ITEMGRADINGID`) REFERENCES `sam_itemgrading_t` (`ITEMGRADINGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_gradingattachment_t`
--

LOCK TABLES `sam_gradingattachment_t` WRITE;
/*!40000 ALTER TABLE `sam_gradingattachment_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_gradingattachment_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_gradingsummary_t`
--

DROP TABLE IF EXISTS `sam_gradingsummary_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_gradingsummary_t` (
  `ASSESSMENTGRADINGSUMMARYID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PUBLISHEDASSESSMENTID` bigint(20) NOT NULL,
  `AGENTID` varchar(255) NOT NULL,
  `TOTALSUBMITTED` int(11) DEFAULT NULL,
  `TOTALSUBMITTEDFORGRADE` int(11) DEFAULT NULL,
  `LASTSUBMITTEDDATE` datetime DEFAULT NULL,
  `LASTSUBMITTEDASSESSMENTISLATE` bit(1) NOT NULL,
  `SUMOF_AUTOSCOREFORGRADE` double DEFAULT NULL,
  `AVERAGE_AUTOSCOREFORGRADE` double DEFAULT NULL,
  `HIGHEST_AUTOSCOREFORGRADE` double DEFAULT NULL,
  `LOWEST_AUTOSCOREFORGRADE` double DEFAULT NULL,
  `LAST_AUTOSCOREFORGRADE` double DEFAULT NULL,
  `SUMOF_OVERRIDESCOREFORGRADE` double DEFAULT NULL,
  `AVERAGE_OVERRIDESCOREFORGRADE` double DEFAULT NULL,
  `HIGHEST_OVERRIDESCOREFORGRADE` double DEFAULT NULL,
  `LOWEST_OVERRIDESCOREFORGRADE` double DEFAULT NULL,
  `LAST_OVERRIDESCOREFORGRADE` double DEFAULT NULL,
  `SCORINGTYPE` int(11) DEFAULT NULL,
  `ACCEPTEDASSESSMENTISLATE` bit(1) DEFAULT NULL,
  `FINALASSESSMENTSCORE` double DEFAULT NULL,
  `FEEDTOGRADEBOOK` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ASSESSMENTGRADINGSUMMARYID`),
  KEY `FK_ki78j1icglcu6nprp3mx80ym` (`PUBLISHEDASSESSMENTID`),
  CONSTRAINT `FK_ki78j1icglcu6nprp3mx80ym` FOREIGN KEY (`PUBLISHEDASSESSMENTID`) REFERENCES `sam_publishedassessment_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_gradingsummary_t`
--

LOCK TABLES `sam_gradingsummary_t` WRITE;
/*!40000 ALTER TABLE `sam_gradingsummary_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_gradingsummary_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_item_t`
--

DROP TABLE IF EXISTS `sam_item_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_item_t` (
  `ITEMID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SECTIONID` bigint(20) DEFAULT NULL,
  `ITEMIDSTRING` varchar(255) DEFAULT NULL,
  `SEQUENCE` int(11) DEFAULT NULL,
  `DURATION` int(11) DEFAULT NULL,
  `TRIESALLOWED` int(11) DEFAULT NULL,
  `INSTRUCTION` longtext,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `TYPEID` bigint(20) NOT NULL,
  `GRADE` varchar(80) DEFAULT NULL,
  `SCORE` double DEFAULT NULL,
  `MIN_SCORE` double DEFAULT NULL,
  `SCORE_DISPLAY_FLAG` bit(1) DEFAULT NULL,
  `PARTIAL_CREDIT_FLAG` bit(1) DEFAULT NULL,
  `DISCOUNT` double DEFAULT NULL,
  `ANSWER_OPTIONS_RICH_COUNT` int(11) DEFAULT NULL,
  `ANSWER_OPTIONS_SIMPLE_OR_RICH` int(11) DEFAULT NULL,
  `HINT` varchar(4000) DEFAULT NULL,
  `HASRATIONALE` bit(1) DEFAULT NULL,
  `STATUS` int(11) NOT NULL,
  `CREATEDBY` varchar(255) NOT NULL,
  `CREATEDDATE` datetime NOT NULL,
  `LASTMODIFIEDBY` varchar(255) NOT NULL,
  `LASTMODIFIEDDATE` datetime NOT NULL,
  `HASH` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ITEMID`),
  KEY `FK_pms5ukgp0lemc4ws733dfvls5` (`SECTIONID`),
  CONSTRAINT `FK_pms5ukgp0lemc4ws733dfvls5` FOREIGN KEY (`SECTIONID`) REFERENCES `sam_section_t` (`SECTIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_item_t`
--

LOCK TABLES `sam_item_t` WRITE;
/*!40000 ALTER TABLE `sam_item_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_item_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_itemfeedback_t`
--

DROP TABLE IF EXISTS `sam_itemfeedback_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_itemfeedback_t` (
  `ITEMFEEDBACKID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEMID` bigint(20) NOT NULL,
  `TYPEID` varchar(255) NOT NULL,
  `TEXT` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ITEMFEEDBACKID`),
  KEY `FK_xax2vqu9i5qa2bt8j684arua` (`ITEMID`),
  CONSTRAINT `FK_xax2vqu9i5qa2bt8j684arua` FOREIGN KEY (`ITEMID`) REFERENCES `sam_item_t` (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_itemfeedback_t`
--

LOCK TABLES `sam_itemfeedback_t` WRITE;
/*!40000 ALTER TABLE `sam_itemfeedback_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_itemfeedback_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_itemgrading_t`
--

DROP TABLE IF EXISTS `sam_itemgrading_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_itemgrading_t` (
  `ITEMGRADINGID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ASSESSMENTGRADINGID` bigint(20) NOT NULL,
  `PUBLISHEDITEMID` bigint(20) NOT NULL,
  `PUBLISHEDITEMTEXTID` bigint(20) NOT NULL,
  `AGENTID` varchar(255) NOT NULL,
  `SUBMITTEDDATE` datetime DEFAULT NULL,
  `PUBLISHEDANSWERID` bigint(20) DEFAULT NULL,
  `RATIONALE` varchar(4000) DEFAULT NULL,
  `ANSWERTEXT` longtext,
  `AUTOSCORE` double DEFAULT NULL,
  `OVERRIDESCORE` double DEFAULT NULL,
  `COMMENTS` longtext,
  `GRADEDBY` varchar(255) DEFAULT NULL,
  `GRADEDDATE` datetime DEFAULT NULL,
  `REVIEW` bit(1) DEFAULT NULL,
  `ATTEMPTSREMAINING` int(11) DEFAULT NULL,
  `LASTDURATION` varchar(36) DEFAULT NULL,
  `ISCORRECT` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ITEMGRADINGID`),
  UNIQUE KEY `uniqueStudentResponse` (`ASSESSMENTGRADINGID`,`PUBLISHEDITEMID`,`PUBLISHEDITEMTEXTID`,`AGENTID`,`PUBLISHEDANSWERID`),
  KEY `SAM_ITEMGRADING_ITEM_I` (`PUBLISHEDITEMID`),
  KEY `SAM_ITEMGRADING_ITEMTEXT_I` (`PUBLISHEDITEMTEXTID`),
  KEY `SAM_ITEMGRADING_PUBANS_I` (`PUBLISHEDANSWERID`),
  CONSTRAINT `FK_cvabhdqff9lmlir6c8lmuveke` FOREIGN KEY (`ASSESSMENTGRADINGID`) REFERENCES `sam_assessmentgrading_t` (`ASSESSMENTGRADINGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_itemgrading_t`
--

LOCK TABLES `sam_itemgrading_t` WRITE;
/*!40000 ALTER TABLE `sam_itemgrading_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_itemgrading_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_itemmetadata_t`
--

DROP TABLE IF EXISTS `sam_itemmetadata_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_itemmetadata_t` (
  `ITEMMETADATAID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEMID` bigint(20) NOT NULL,
  `LABEL` varchar(255) NOT NULL,
  `ENTRY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ITEMMETADATAID`),
  KEY `FK_lf62gyn062lh89q94ay76u6co` (`ITEMID`),
  CONSTRAINT `FK_lf62gyn062lh89q94ay76u6co` FOREIGN KEY (`ITEMID`) REFERENCES `sam_item_t` (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_itemmetadata_t`
--

LOCK TABLES `sam_itemmetadata_t` WRITE;
/*!40000 ALTER TABLE `sam_itemmetadata_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_itemmetadata_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_itemtag_t`
--

DROP TABLE IF EXISTS `sam_itemtag_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_itemtag_t` (
  `ITEMTAGID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEMID` bigint(20) NOT NULL,
  `TAGID` varchar(36) NOT NULL,
  `TAGLABEL` varchar(255) NOT NULL,
  `TAGCOLLECTIONID` varchar(36) NOT NULL,
  `TAGCOLLECTIONNAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ITEMTAGID`),
  KEY `SAM_ITEMTAG_ITEMID_I` (`ITEMID`),
  CONSTRAINT `FK_jkn2ihroonq5qk0sdenkrx95v` FOREIGN KEY (`ITEMID`) REFERENCES `sam_item_t` (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_itemtag_t`
--

LOCK TABLES `sam_itemtag_t` WRITE;
/*!40000 ALTER TABLE `sam_itemtag_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_itemtag_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_itemtext_t`
--

DROP TABLE IF EXISTS `sam_itemtext_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_itemtext_t` (
  `ITEMTEXTID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEMID` bigint(20) NOT NULL,
  `SEQUENCE` bigint(20) NOT NULL,
  `TEXT` longtext,
  `REQUIRED_OPTIONS_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ITEMTEXTID`),
  KEY `FK_5414votgawtyjxkxyf7uk3cxg` (`ITEMID`),
  CONSTRAINT `FK_5414votgawtyjxkxyf7uk3cxg` FOREIGN KEY (`ITEMID`) REFERENCES `sam_item_t` (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_itemtext_t`
--

LOCK TABLES `sam_itemtext_t` WRITE;
/*!40000 ALTER TABLE `sam_itemtext_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_itemtext_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_media_t`
--

DROP TABLE IF EXISTS `sam_media_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_media_t` (
  `MEDIAID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEMGRADINGID` bigint(20) DEFAULT NULL,
  `MEDIA` longblob,
  `FILESIZE` bigint(20) DEFAULT NULL,
  `MIMETYPE` varchar(80) DEFAULT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `LOCATION` varchar(255) DEFAULT NULL,
  `FILENAME` varchar(255) DEFAULT NULL,
  `ISLINK` bit(1) DEFAULT NULL,
  `ISHTMLINLINE` bit(1) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CREATEDBY` varchar(255) DEFAULT NULL,
  `CREATEDDATE` datetime DEFAULT NULL,
  `LASTMODIFIEDBY` varchar(255) DEFAULT NULL,
  `LASTMODIFIEDDATE` datetime DEFAULT NULL,
  `DURATION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`MEDIAID`),
  KEY `FK_8miqmippjt5y4au8e8u3kdlww` (`ITEMGRADINGID`),
  CONSTRAINT `FK_8miqmippjt5y4au8e8u3kdlww` FOREIGN KEY (`ITEMGRADINGID`) REFERENCES `sam_itemgrading_t` (`ITEMGRADINGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_media_t`
--

LOCK TABLES `sam_media_t` WRITE;
/*!40000 ALTER TABLE `sam_media_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_media_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publishedaccesscontrol_t`
--

DROP TABLE IF EXISTS `sam_publishedaccesscontrol_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publishedaccesscontrol_t` (
  `ASSESSMENTID` bigint(20) NOT NULL,
  `UNLIMITEDSUBMISSIONS` bit(1) DEFAULT NULL,
  `SUBMISSIONSALLOWED` int(11) DEFAULT NULL,
  `SUBMISSIONSSAVED` int(11) DEFAULT NULL,
  `ASSESSMENTFORMAT` int(11) DEFAULT NULL,
  `BOOKMARKINGITEM` int(11) DEFAULT NULL,
  `TIMELIMIT` int(11) DEFAULT NULL,
  `TIMEDASSESSMENT` int(11) DEFAULT NULL,
  `RETRYALLOWED` int(11) DEFAULT NULL,
  `LATEHANDLING` int(11) DEFAULT NULL,
  `INSTRUCTORNOTIFICATION` int(11) DEFAULT NULL,
  `STARTDATE` datetime DEFAULT NULL,
  `DUEDATE` datetime DEFAULT NULL,
  `SCOREDATE` datetime DEFAULT NULL,
  `FEEDBACKDATE` datetime DEFAULT NULL,
  `RETRACTDATE` datetime DEFAULT NULL,
  `AUTOSUBMIT` int(11) DEFAULT NULL,
  `ITEMNAVIGATION` int(11) DEFAULT NULL,
  `ITEMNUMBERING` int(11) DEFAULT NULL,
  `DISPLAYSCORE` int(11) DEFAULT NULL,
  `SUBMISSIONMESSAGE` varchar(4000) DEFAULT NULL,
  `RELEASETO` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `FINALPAGEURL` varchar(1023) DEFAULT NULL,
  `MARKFORREVIEW` int(11) DEFAULT NULL,
  `HONORPLEDGE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ASSESSMENTID`),
  CONSTRAINT `FK_kryeyv21ejg82bkaig0sf7a93` FOREIGN KEY (`ASSESSMENTID`) REFERENCES `sam_publishedassessment_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publishedaccesscontrol_t`
--

LOCK TABLES `sam_publishedaccesscontrol_t` WRITE;
/*!40000 ALTER TABLE `sam_publishedaccesscontrol_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publishedaccesscontrol_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publishedanswer_t`
--

DROP TABLE IF EXISTS `sam_publishedanswer_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publishedanswer_t` (
  `ANSWERID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEMTEXTID` bigint(20) NOT NULL,
  `ITEMID` bigint(20) NOT NULL,
  `TEXT` longtext,
  `SEQUENCE` bigint(20) NOT NULL,
  `LABEL` varchar(20) DEFAULT NULL,
  `ISCORRECT` bit(1) DEFAULT NULL,
  `GRADE` varchar(80) DEFAULT NULL,
  `SCORE` double DEFAULT NULL,
  `PARTIAL_CREDIT` double DEFAULT NULL,
  `DISCOUNT` double DEFAULT NULL,
  PRIMARY KEY (`ANSWERID`),
  KEY `FK_oueeu8pqnk8h4225nadprikss` (`ITEMTEXTID`),
  KEY `FK_k07fn2ih34ib9888yhvcx29fl` (`ITEMID`),
  CONSTRAINT `FK_k07fn2ih34ib9888yhvcx29fl` FOREIGN KEY (`ITEMID`) REFERENCES `sam_publisheditem_t` (`ITEMID`),
  CONSTRAINT `FK_oueeu8pqnk8h4225nadprikss` FOREIGN KEY (`ITEMTEXTID`) REFERENCES `sam_publisheditemtext_t` (`ITEMTEXTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publishedanswer_t`
--

LOCK TABLES `sam_publishedanswer_t` WRITE;
/*!40000 ALTER TABLE `sam_publishedanswer_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publishedanswer_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publishedanswerfeedback_t`
--

DROP TABLE IF EXISTS `sam_publishedanswerfeedback_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publishedanswerfeedback_t` (
  `ANSWERFEEDBACKID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ANSWERID` bigint(20) NOT NULL,
  `TYPEID` varchar(255) DEFAULT NULL,
  `TEXT` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ANSWERFEEDBACKID`),
  KEY `FK_ksvwgdt6ofq06o0g4nnxou31t` (`ANSWERID`),
  CONSTRAINT `FK_ksvwgdt6ofq06o0g4nnxou31t` FOREIGN KEY (`ANSWERID`) REFERENCES `sam_publishedanswer_t` (`ANSWERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publishedanswerfeedback_t`
--

LOCK TABLES `sam_publishedanswerfeedback_t` WRITE;
/*!40000 ALTER TABLE `sam_publishedanswerfeedback_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publishedanswerfeedback_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publishedassessment_t`
--

DROP TABLE IF EXISTS `sam_publishedassessment_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publishedassessment_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) DEFAULT NULL,
  `ASSESSMENTID` bigint(20) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TYPEID` bigint(20) DEFAULT NULL,
  `INSTRUCTORNOTIFICATION` int(11) DEFAULT NULL,
  `TESTEENOTIFICATION` int(11) DEFAULT NULL,
  `MULTIPARTALLOWED` int(11) DEFAULT NULL,
  `STATUS` int(11) NOT NULL,
  `CREATEDBY` varchar(255) NOT NULL,
  `CREATEDDATE` datetime NOT NULL,
  `LASTMODIFIEDBY` varchar(255) NOT NULL,
  `LASTMODIFIEDDATE` datetime NOT NULL,
  `LASTNEEDRESUBMITDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SAM_PUBA_ASSESSMENT_I` (`ASSESSMENTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publishedassessment_t`
--

LOCK TABLES `sam_publishedassessment_t` WRITE;
/*!40000 ALTER TABLE `sam_publishedassessment_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publishedassessment_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publishedattachment_t`
--

DROP TABLE IF EXISTS `sam_publishedattachment_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publishedattachment_t` (
  `ATTACHMENTID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ATTACHMENTTYPE` varchar(255) NOT NULL,
  `RESOURCEID` varchar(255) DEFAULT NULL,
  `FILENAME` varchar(255) DEFAULT NULL,
  `MIMETYPE` varchar(80) DEFAULT NULL,
  `FILESIZE` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `LOCATION` varchar(4000) DEFAULT NULL,
  `ISLINK` bit(1) DEFAULT NULL,
  `STATUS` int(11) NOT NULL,
  `CREATEDBY` varchar(255) NOT NULL,
  `CREATEDDATE` datetime NOT NULL,
  `LASTMODIFIEDBY` varchar(255) NOT NULL,
  `LASTMODIFIEDDATE` datetime NOT NULL,
  `ASSESSMENTID` bigint(20) DEFAULT NULL,
  `SECTIONID` bigint(20) DEFAULT NULL,
  `ITEMID` bigint(20) DEFAULT NULL,
  `ITEMTEXTID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ATTACHMENTID`),
  KEY `FK_2h5bh009jjkmh7xyfy7ht3lr` (`ASSESSMENTID`),
  KEY `FK_b8cqstmbnq876oulqcbee8bn3` (`SECTIONID`),
  KEY `FK_hs0t803yxickgtmgsm0f1i5w0` (`ITEMID`),
  KEY `FK_r153ncynqq5dh0rgr2idd9678` (`ITEMTEXTID`),
  CONSTRAINT `FK_r153ncynqq5dh0rgr2idd9678` FOREIGN KEY (`ITEMTEXTID`) REFERENCES `sam_publisheditemtext_t` (`ITEMTEXTID`),
  CONSTRAINT `FK_2h5bh009jjkmh7xyfy7ht3lr` FOREIGN KEY (`ASSESSMENTID`) REFERENCES `sam_publishedassessment_t` (`ID`),
  CONSTRAINT `FK_b8cqstmbnq876oulqcbee8bn3` FOREIGN KEY (`SECTIONID`) REFERENCES `sam_publishedsection_t` (`SECTIONID`),
  CONSTRAINT `FK_hs0t803yxickgtmgsm0f1i5w0` FOREIGN KEY (`ITEMID`) REFERENCES `sam_publisheditem_t` (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publishedattachment_t`
--

LOCK TABLES `sam_publishedattachment_t` WRITE;
/*!40000 ALTER TABLE `sam_publishedattachment_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publishedattachment_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publishedevaluation_t`
--

DROP TABLE IF EXISTS `sam_publishedevaluation_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publishedevaluation_t` (
  `ASSESSMENTID` bigint(20) NOT NULL,
  `EVALUATIONCOMPONENTS` varchar(255) DEFAULT NULL,
  `SCORINGTYPE` int(11) DEFAULT NULL,
  `NUMERICMODELID` varchar(255) DEFAULT NULL,
  `FIXEDTOTALSCORE` int(11) DEFAULT NULL,
  `GRADEAVAILABLE` int(11) DEFAULT NULL,
  `ISSTUDENTIDPUBLIC` int(11) DEFAULT NULL,
  `ANONYMOUSGRADING` int(11) DEFAULT NULL,
  `AUTOSCORING` int(11) DEFAULT NULL,
  `TOGRADEBOOK` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ASSESSMENTID`),
  CONSTRAINT `FK_fjg5vujql6feqdsop9g05i3yv` FOREIGN KEY (`ASSESSMENTID`) REFERENCES `sam_publishedassessment_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publishedevaluation_t`
--

LOCK TABLES `sam_publishedevaluation_t` WRITE;
/*!40000 ALTER TABLE `sam_publishedevaluation_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publishedevaluation_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publishedfeedback_t`
--

DROP TABLE IF EXISTS `sam_publishedfeedback_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publishedfeedback_t` (
  `ASSESSMENTID` bigint(20) NOT NULL,
  `FEEDBACKDELIVERY` int(11) DEFAULT NULL,
  `FEEDBACKCOMPONENTOPTION` int(11) DEFAULT NULL,
  `FEEDBACKAUTHORING` int(11) DEFAULT NULL,
  `EDITCOMPONENTS` int(11) DEFAULT NULL,
  `SHOWQUESTIONTEXT` bit(1) DEFAULT NULL,
  `SHOWSTUDENTRESPONSE` bit(1) DEFAULT NULL,
  `SHOWCORRECTRESPONSE` bit(1) DEFAULT NULL,
  `SHOWSTUDENTSCORE` bit(1) DEFAULT NULL,
  `SHOWSTUDENTQUESTIONSCORE` bit(1) DEFAULT NULL,
  `SHOWQUESTIONLEVELFEEDBACK` bit(1) DEFAULT NULL,
  `SHOWSELECTIONLEVELFEEDBACK` bit(1) DEFAULT NULL,
  `SHOWGRADERCOMMENTS` bit(1) DEFAULT NULL,
  `SHOWSTATISTICS` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ASSESSMENTID`),
  CONSTRAINT `FK_9sryf0wx31oih482tew1pamfi` FOREIGN KEY (`ASSESSMENTID`) REFERENCES `sam_publishedassessment_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publishedfeedback_t`
--

LOCK TABLES `sam_publishedfeedback_t` WRITE;
/*!40000 ALTER TABLE `sam_publishedfeedback_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publishedfeedback_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publisheditem_t`
--

DROP TABLE IF EXISTS `sam_publisheditem_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publisheditem_t` (
  `ITEMID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SECTIONID` bigint(20) NOT NULL,
  `ITEMIDSTRING` varchar(255) DEFAULT NULL,
  `SEQUENCE` int(11) DEFAULT NULL,
  `DURATION` int(11) DEFAULT NULL,
  `TRIESALLOWED` int(11) DEFAULT NULL,
  `INSTRUCTION` longtext,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `TYPEID` bigint(20) NOT NULL,
  `GRADE` varchar(80) DEFAULT NULL,
  `SCORE` double DEFAULT NULL,
  `DISCOUNT` double DEFAULT NULL,
  `ANSWER_OPTIONS_RICH_COUNT` int(11) DEFAULT NULL,
  `ANSWER_OPTIONS_SIMPLE_OR_RICH` int(11) DEFAULT NULL,
  `SCORE_DISPLAY_FLAG` bit(1) DEFAULT NULL,
  `MIN_SCORE` double DEFAULT NULL,
  `HINT` varchar(4000) DEFAULT NULL,
  `HASRATIONALE` bit(1) DEFAULT NULL,
  `PARTIAL_CREDIT_FLAG` bit(1) DEFAULT NULL,
  `STATUS` int(11) NOT NULL,
  `CREATEDBY` varchar(255) NOT NULL,
  `CREATEDDATE` datetime NOT NULL,
  `LASTMODIFIEDBY` varchar(255) NOT NULL,
  `LASTMODIFIEDDATE` datetime NOT NULL,
  `HASH` varchar(255) DEFAULT NULL,
  `ITEMHASH` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ITEMID`),
  KEY `FK_q962n4jsvbl9nyemnfkhe7ohu` (`SECTIONID`),
  CONSTRAINT `FK_q962n4jsvbl9nyemnfkhe7ohu` FOREIGN KEY (`SECTIONID`) REFERENCES `sam_publishedsection_t` (`SECTIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publisheditem_t`
--

LOCK TABLES `sam_publisheditem_t` WRITE;
/*!40000 ALTER TABLE `sam_publisheditem_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publisheditem_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publisheditemfeedback_t`
--

DROP TABLE IF EXISTS `sam_publisheditemfeedback_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publisheditemfeedback_t` (
  `ITEMFEEDBACKID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEMID` bigint(20) NOT NULL,
  `TYPEID` varchar(255) NOT NULL,
  `TEXT` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ITEMFEEDBACKID`),
  KEY `FK_1pbi72cc9gt9eed9t85n88y96` (`ITEMID`),
  CONSTRAINT `FK_1pbi72cc9gt9eed9t85n88y96` FOREIGN KEY (`ITEMID`) REFERENCES `sam_publisheditem_t` (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publisheditemfeedback_t`
--

LOCK TABLES `sam_publisheditemfeedback_t` WRITE;
/*!40000 ALTER TABLE `sam_publisheditemfeedback_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publisheditemfeedback_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publisheditemmetadata_t`
--

DROP TABLE IF EXISTS `sam_publisheditemmetadata_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publisheditemmetadata_t` (
  `ITEMMETADATAID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEMID` bigint(20) NOT NULL,
  `LABEL` varchar(255) NOT NULL,
  `ENTRY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ITEMMETADATAID`),
  KEY `FK_a8ulwin15rjjphuttctix1516` (`ITEMID`),
  CONSTRAINT `FK_a8ulwin15rjjphuttctix1516` FOREIGN KEY (`ITEMID`) REFERENCES `sam_publisheditem_t` (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publisheditemmetadata_t`
--

LOCK TABLES `sam_publisheditemmetadata_t` WRITE;
/*!40000 ALTER TABLE `sam_publisheditemmetadata_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publisheditemmetadata_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publisheditemtag_t`
--

DROP TABLE IF EXISTS `sam_publisheditemtag_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publisheditemtag_t` (
  `ITEMTAGID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEMID` bigint(20) NOT NULL,
  `TAGID` varchar(36) NOT NULL,
  `TAGLABEL` varchar(255) NOT NULL,
  `TAGCOLLECTIONID` varchar(36) NOT NULL,
  `TAGCOLLECTIONNAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ITEMTAGID`),
  KEY `SAM_PUBLISHEDITEMTAG_ITEMID_I` (`ITEMID`),
  CONSTRAINT `FK_lbgpwaj78tpio75fy1u8q1wbt` FOREIGN KEY (`ITEMID`) REFERENCES `sam_publisheditem_t` (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publisheditemtag_t`
--

LOCK TABLES `sam_publisheditemtag_t` WRITE;
/*!40000 ALTER TABLE `sam_publisheditemtag_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publisheditemtag_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publisheditemtext_t`
--

DROP TABLE IF EXISTS `sam_publisheditemtext_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publisheditemtext_t` (
  `ITEMTEXTID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEMID` bigint(20) NOT NULL,
  `SEQUENCE` bigint(20) NOT NULL,
  `TEXT` longtext,
  `REQUIRED_OPTIONS_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ITEMTEXTID`),
  KEY `FK_ep8yjvs137lf24oasnqy1ll5c` (`ITEMID`),
  CONSTRAINT `FK_ep8yjvs137lf24oasnqy1ll5c` FOREIGN KEY (`ITEMID`) REFERENCES `sam_publisheditem_t` (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publisheditemtext_t`
--

LOCK TABLES `sam_publisheditemtext_t` WRITE;
/*!40000 ALTER TABLE `sam_publisheditemtext_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publisheditemtext_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publishedmetadata_t`
--

DROP TABLE IF EXISTS `sam_publishedmetadata_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publishedmetadata_t` (
  `ASSESSMENTMETADATAID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ASSESSMENTID` bigint(20) NOT NULL,
  `LABEL` varchar(99) NOT NULL,
  `ENTRY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ASSESSMENTMETADATAID`),
  KEY `SAM_PUBMETADATA_IDX` (`LABEL`,`ENTRY`),
  KEY `FK_9w4cju93l7w1fc0vf57i9lodw` (`ASSESSMENTID`),
  CONSTRAINT `FK_9w4cju93l7w1fc0vf57i9lodw` FOREIGN KEY (`ASSESSMENTID`) REFERENCES `sam_publishedassessment_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publishedmetadata_t`
--

LOCK TABLES `sam_publishedmetadata_t` WRITE;
/*!40000 ALTER TABLE `sam_publishedmetadata_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publishedmetadata_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publishedsection_t`
--

DROP TABLE IF EXISTS `sam_publishedsection_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publishedsection_t` (
  `SECTIONID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ASSESSMENTID` bigint(20) NOT NULL,
  `DURATION` int(11) DEFAULT NULL,
  `SEQUENCE` int(11) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `TYPEID` bigint(20) NOT NULL,
  `STATUS` int(11) NOT NULL,
  `CREATEDBY` varchar(255) NOT NULL,
  `CREATEDDATE` datetime NOT NULL,
  `LASTMODIFIEDBY` varchar(255) NOT NULL,
  `LASTMODIFIEDDATE` datetime NOT NULL,
  PRIMARY KEY (`SECTIONID`),
  KEY `FK_a71l6v3ke9vqfdqj1gahqume1` (`ASSESSMENTID`),
  CONSTRAINT `FK_a71l6v3ke9vqfdqj1gahqume1` FOREIGN KEY (`ASSESSMENTID`) REFERENCES `sam_publishedassessment_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publishedsection_t`
--

LOCK TABLES `sam_publishedsection_t` WRITE;
/*!40000 ALTER TABLE `sam_publishedsection_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publishedsection_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publishedsectionmetadata_t`
--

DROP TABLE IF EXISTS `sam_publishedsectionmetadata_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publishedsectionmetadata_t` (
  `PUBLISHEDSECTIONMETADATAID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SECTIONID` bigint(20) NOT NULL,
  `LABEL` varchar(255) NOT NULL,
  `ENTRY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PUBLISHEDSECTIONMETADATAID`),
  KEY `FK_coeassrfrvwl3lqnhyvceam84` (`SECTIONID`),
  CONSTRAINT `FK_coeassrfrvwl3lqnhyvceam84` FOREIGN KEY (`SECTIONID`) REFERENCES `sam_publishedsection_t` (`SECTIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publishedsectionmetadata_t`
--

LOCK TABLES `sam_publishedsectionmetadata_t` WRITE;
/*!40000 ALTER TABLE `sam_publishedsectionmetadata_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publishedsectionmetadata_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_publishedsecuredip_t`
--

DROP TABLE IF EXISTS `sam_publishedsecuredip_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_publishedsecuredip_t` (
  `IPADDRESSID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ASSESSMENTID` bigint(20) NOT NULL,
  `HOSTNAME` varchar(255) DEFAULT NULL,
  `IPADDRESS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IPADDRESSID`),
  KEY `FK_j6qspdgtnf821fusb9agl6c7g` (`ASSESSMENTID`),
  CONSTRAINT `FK_j6qspdgtnf821fusb9agl6c7g` FOREIGN KEY (`ASSESSMENTID`) REFERENCES `sam_publishedassessment_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_publishedsecuredip_t`
--

LOCK TABLES `sam_publishedsecuredip_t` WRITE;
/*!40000 ALTER TABLE `sam_publishedsecuredip_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_publishedsecuredip_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_qualifierdata_t`
--

DROP TABLE IF EXISTS `sam_qualifierdata_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_qualifierdata_t` (
  `QUALIFIERID` bigint(20) NOT NULL,
  `REFERENCENAME` varchar(255) NOT NULL,
  `DISPLAYNAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `QUALIFIERTYPEID` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`QUALIFIERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_qualifierdata_t`
--

LOCK TABLES `sam_qualifierdata_t` WRITE;
/*!40000 ALTER TABLE `sam_qualifierdata_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_qualifierdata_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_questionpool_t`
--

DROP TABLE IF EXISTS `sam_questionpool_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_questionpool_t` (
  `QUESTIONPOOLID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `PARENTPOOLID` bigint(20) DEFAULT NULL,
  `OWNERID` varchar(255) DEFAULT NULL,
  `ORGANIZATIONNAME` varchar(255) DEFAULT NULL,
  `DATECREATED` datetime DEFAULT NULL,
  `LASTMODIFIEDDATE` datetime DEFAULT NULL,
  `LASTMODIFIEDBY` varchar(255) DEFAULT NULL,
  `DEFAULTACCESSTYPEID` bigint(20) DEFAULT NULL,
  `OBJECTIVE` varchar(255) DEFAULT NULL,
  `KEYWORDS` varchar(255) DEFAULT NULL,
  `RUBRIC` varchar(4000) DEFAULT NULL,
  `TYPEID` bigint(20) DEFAULT NULL,
  `INTELLECTUALPROPERTYID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`QUESTIONPOOLID`),
  KEY `SAM_QPOOL_OWNER_I` (`OWNERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_questionpool_t`
--

LOCK TABLES `sam_questionpool_t` WRITE;
/*!40000 ALTER TABLE `sam_questionpool_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_questionpool_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_questionpoolaccess_t`
--

DROP TABLE IF EXISTS `sam_questionpoolaccess_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_questionpoolaccess_t` (
  `QUESTIONPOOLID` bigint(20) NOT NULL,
  `AGENTID` varchar(255) NOT NULL,
  `ACCESSTYPEID` bigint(20) NOT NULL,
  PRIMARY KEY (`QUESTIONPOOLID`,`AGENTID`,`ACCESSTYPEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_questionpoolaccess_t`
--

LOCK TABLES `sam_questionpoolaccess_t` WRITE;
/*!40000 ALTER TABLE `sam_questionpoolaccess_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_questionpoolaccess_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_questionpoolitem_t`
--

DROP TABLE IF EXISTS `sam_questionpoolitem_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_questionpoolitem_t` (
  `QUESTIONPOOLID` bigint(20) NOT NULL,
  `ITEMID` bigint(20) NOT NULL,
  PRIMARY KEY (`QUESTIONPOOLID`,`ITEMID`),
  CONSTRAINT `FK_sxd9s0jkytwf5011wuu4v5krc` FOREIGN KEY (`QUESTIONPOOLID`) REFERENCES `sam_questionpool_t` (`QUESTIONPOOLID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_questionpoolitem_t`
--

LOCK TABLES `sam_questionpoolitem_t` WRITE;
/*!40000 ALTER TABLE `sam_questionpoolitem_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_questionpoolitem_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_section_t`
--

DROP TABLE IF EXISTS `sam_section_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_section_t` (
  `SECTIONID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ASSESSMENTID` bigint(20) NOT NULL,
  `DURATION` int(11) DEFAULT NULL,
  `SEQUENCE` int(11) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `TYPEID` bigint(20) DEFAULT NULL,
  `STATUS` int(11) NOT NULL,
  `CREATEDBY` varchar(255) NOT NULL,
  `CREATEDDATE` datetime NOT NULL,
  `LASTMODIFIEDBY` varchar(255) NOT NULL,
  `LASTMODIFIEDDATE` datetime NOT NULL,
  PRIMARY KEY (`SECTIONID`),
  KEY `FK_gag1fk3rp54yk3tevufidxqkd` (`ASSESSMENTID`),
  CONSTRAINT `FK_gag1fk3rp54yk3tevufidxqkd` FOREIGN KEY (`ASSESSMENTID`) REFERENCES `sam_assessmentbase_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_section_t`
--

LOCK TABLES `sam_section_t` WRITE;
/*!40000 ALTER TABLE `sam_section_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_section_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_sectionmetadata_t`
--

DROP TABLE IF EXISTS `sam_sectionmetadata_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_sectionmetadata_t` (
  `SECTIONMETADATAID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SECTIONID` bigint(20) NOT NULL,
  `LABEL` varchar(255) NOT NULL,
  `ENTRY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SECTIONMETADATAID`),
  KEY `FK_eiooimulfm0gc6r1316ettpx2` (`SECTIONID`),
  CONSTRAINT `FK_eiooimulfm0gc6r1316ettpx2` FOREIGN KEY (`SECTIONID`) REFERENCES `sam_section_t` (`SECTIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_sectionmetadata_t`
--

LOCK TABLES `sam_sectionmetadata_t` WRITE;
/*!40000 ALTER TABLE `sam_sectionmetadata_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_sectionmetadata_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_securedip_t`
--

DROP TABLE IF EXISTS `sam_securedip_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_securedip_t` (
  `IPADDRESSID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ASSESSMENTID` bigint(20) NOT NULL,
  `HOSTNAME` varchar(255) DEFAULT NULL,
  `IPADDRESS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IPADDRESSID`),
  KEY `FK_r34wht41yc6umesf5n2qpvuwl` (`ASSESSMENTID`),
  CONSTRAINT `FK_r34wht41yc6umesf5n2qpvuwl` FOREIGN KEY (`ASSESSMENTID`) REFERENCES `sam_assessmentbase_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_securedip_t`
--

LOCK TABLES `sam_securedip_t` WRITE;
/*!40000 ALTER TABLE `sam_securedip_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_securedip_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_studentgradingsummary_t`
--

DROP TABLE IF EXISTS `sam_studentgradingsummary_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_studentgradingsummary_t` (
  `STUDENTGRADINGSUMMARYID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PUBLISHEDASSESSMENTID` bigint(20) NOT NULL,
  `AGENTID` varchar(255) NOT NULL,
  `NUMBERRETAKE` int(11) DEFAULT NULL,
  `CREATEDBY` varchar(255) NOT NULL,
  `CREATEDDATE` datetime NOT NULL,
  `LASTMODIFIEDBY` varchar(255) NOT NULL,
  `LASTMODIFIEDDATE` datetime NOT NULL,
  PRIMARY KEY (`STUDENTGRADINGSUMMARYID`),
  KEY `SAM_PUBLISHEDASSESSMENT2_I` (`PUBLISHEDASSESSMENTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_studentgradingsummary_t`
--

LOCK TABLES `sam_studentgradingsummary_t` WRITE;
/*!40000 ALTER TABLE `sam_studentgradingsummary_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `sam_studentgradingsummary_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sam_type_t`
--

DROP TABLE IF EXISTS `sam_type_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sam_type_t` (
  `TYPEID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AUTHORITY` varchar(255) DEFAULT NULL,
  `DOMAIN` varchar(255) DEFAULT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `STATUS` int(11) NOT NULL,
  `CREATEDBY` varchar(255) NOT NULL,
  `CREATEDDATE` datetime NOT NULL,
  `LASTMODIFIEDBY` varchar(255) NOT NULL,
  `LASTMODIFIEDDATE` datetime NOT NULL,
  PRIMARY KEY (`TYPEID`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sam_type_t`
--

LOCK TABLES `sam_type_t` WRITE;
/*!40000 ALTER TABLE `sam_type_t` DISABLE KEYS */;
INSERT INTO `sam_type_t` VALUES (1,'stanford.edu','assessment.item','Multiple Choice',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(2,'stanford.edu','assessment.item','Multiple Correct',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(3,'stanford.edu','assessment.item','Multiple Choice Survey',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(4,'stanford.edu','assessment.item','True - False',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(5,'stanford.edu','assessment.item','Short Answer/Essay',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(6,'stanford.edu','assessment.item','File Upload',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(7,'stanford.edu','assessment.item','Audio Recording',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(8,'stanford.edu','assessment.item','Fill in Blank',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(9,'stanford.edu','assessment.item','Matching',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(11,'stanford.edu','assessment.item','Numeric Response',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(12,'stanford.edu','assessment.item','Multiple Correct Single Selection',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(13,'stanford.edu','assessment.item','Matrix Choices Survey',NULL,1,'1','2010-01-01 12:00:00','1','2010-01-01 12:00:00'),(14,'stanford.edu','assessment.item','Extended Matching Items',NULL,1,'1','2009-11-23 12:00:00','1','2009-11-23 12:00:00'),(15,'stanford.edu','assessment.item','Calculated Question',NULL,1,'1','2019-05-16 09:43:24','1','2019-05-16 09:43:24'),(16,'stanford.edu','assessment.item','Image Map Question',NULL,1,'1','2019-05-16 09:43:24','1','2019-05-16 09:43:24'),(21,'stanford.edu','assessment.section','Default',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(22,'stanford.edu','assessment.section','Normal',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(30,'stanford.edu','assessment.questionpool.access','Access Denied','Access Denied',1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(31,'stanford.edu','assessment.questionpool.access','Read Only','Read Only',1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(32,'stanford.edu','assessment.questionpool.access','Read and Copy','Read and Copy',1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(33,'stanford.edu','assessment.questionpool.access','Read/Write','Read/Write',1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(34,'stanford.edu','assessment.questionpool.access','Administration','Adminstration',1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(41,'stanford.edu','assessment.template','Quiz',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(42,'stanford.edu','assessment.template','Homework',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(43,'stanford.edu','assessment.template','Mid Term',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(44,'stanford.edu','assessment.template','Final',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(61,'stanford.edu','assessment','Quiz',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(62,'stanford.edu','assessment','Homework',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(63,'stanford.edu','assessment','Mid Term',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(64,'stanford.edu','assessment','Final',NULL,1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(65,'stanford.edu','assessment.questionpool','Default','Stanford Question Pool',1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(81,'stanford.edu','assessment.taking','Taking Assessment','Taking Assessment',1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(101,'stanford.edu','assessment.published','A Published Assessment','A Published Assessment',1,'1','2005-01-01 12:00:00','1','2005-01-01 12:00:00'),(142,'stanford.edu','assessment.template.system','System Defined',NULL,1,'1','2006-01-01 12:00:00','1','2005-06-01 12:00:00');
/*!40000 ALTER TABLE `sam_type_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_delayed_invocation`
--

DROP TABLE IF EXISTS `scheduler_delayed_invocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `scheduler_delayed_invocation` (
  `INVOCATION_ID` varchar(36) NOT NULL,
  `COMPONENT` varchar(2000) NOT NULL,
  `CONTEXT` varchar(2000) NOT NULL,
  `INVOCATION_TIME` datetime NOT NULL,
  PRIMARY KEY (`INVOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_delayed_invocation`
--

LOCK TABLES `scheduler_delayed_invocation` WRITE;
/*!40000 ALTER TABLE `scheduler_delayed_invocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduler_delayed_invocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_trigger_events`
--

DROP TABLE IF EXISTS `scheduler_trigger_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `scheduler_trigger_events` (
  `uuid` varchar(36) NOT NULL,
  `eventType` varchar(255) NOT NULL,
  `jobName` varchar(255) NOT NULL,
  `message` longtext,
  `serverId` varchar(255) DEFAULT NULL,
  `eventTime` datetime NOT NULL,
  `triggerName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_trigger_events`
--

LOCK TABLES `scheduler_trigger_events` WRITE;
/*!40000 ALTER TABLE `scheduler_trigger_events` DISABLE KEYS */;
INSERT INTO `scheduler_trigger_events` VALUES ('772df8f8-038f-435d-a86a-111ea860d36e','FIRED','Get Archives','Trigger fired','DESKTOP-5KJOF7T','2019-05-16 09:43:24','MT_5a3ff4m5k0o65'),('d37468b3-399a-43e5-9732-ca2e6528c0c0','COMPLETE','Get Archives','Trigger complete','DESKTOP-5KJOF7T','2019-05-16 09:43:24','MT_5a3ff4m5k0o65');
/*!40000 ALTER TABLE `scheduler_trigger_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup_attachments`
--

DROP TABLE IF EXISTS `signup_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `signup_attachments` (
  `meeting_id` bigint(20) NOT NULL,
  `resource_Id` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `mime_type` varchar(80) DEFAULT NULL,
  `fileSize` bigint(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `isLink` bit(1) DEFAULT NULL,
  `timeslot_id` bigint(20) DEFAULT NULL,
  `view_by_all` bit(1) DEFAULT b'1',
  `created_by` varchar(99) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_modified_by` varchar(99) NOT NULL,
  `last_modified_date` datetime NOT NULL,
  `list_index` int(11) NOT NULL,
  PRIMARY KEY (`meeting_id`,`list_index`),
  CONSTRAINT `FK_9phulwbkun7736r7fcukjaaok` FOREIGN KEY (`meeting_id`) REFERENCES `signup_meetings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_attachments`
--

LOCK TABLES `signup_attachments` WRITE;
/*!40000 ALTER TABLE `signup_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `signup_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup_meetings`
--

DROP TABLE IF EXISTS `signup_meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `signup_meetings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext,
  `location` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `meeting_type` varchar(50) NOT NULL,
  `creator_user_id` varchar(99) NOT NULL,
  `coordinators_user_Ids` varchar(1000) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `signup_begins` datetime DEFAULT NULL,
  `signup_deadline` datetime DEFAULT NULL,
  `canceled` bit(1) DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `allow_waitList` bit(1) DEFAULT b'1',
  `allow_comment` bit(1) DEFAULT b'1',
  `auto_reminder` bit(1) DEFAULT b'0',
  `eid_input_mode` bit(1) DEFAULT b'0',
  `receive_email_owner` bit(1) DEFAULT b'0',
  `default_send_email_by_owner` bit(1) DEFAULT b'0',
  `allow_attendance` bit(1) DEFAULT b'0',
  `recurrence_id` bigint(20) DEFAULT NULL,
  `repeat_type` varchar(20) DEFAULT NULL,
  `maxnumof_slot` int(11) DEFAULT '1',
  `create_groups` bit(1) DEFAULT b'0',
  `vevent_uuid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_meetings`
--

LOCK TABLES `signup_meetings` WRITE;
/*!40000 ALTER TABLE `signup_meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `signup_meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup_site_groups`
--

DROP TABLE IF EXISTS `signup_site_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `signup_site_groups` (
  `signup_site_id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `group_id` varchar(99) NOT NULL,
  `calendar_event_id` varchar(2000) DEFAULT NULL,
  `calendar_id` varchar(99) DEFAULT NULL,
  `list_index` int(11) NOT NULL,
  PRIMARY KEY (`signup_site_id`,`list_index`),
  CONSTRAINT `FK_nmtkp8wsoc9xlf4yoqu1yq2su` FOREIGN KEY (`signup_site_id`) REFERENCES `signup_sites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_site_groups`
--

LOCK TABLES `signup_site_groups` WRITE;
/*!40000 ALTER TABLE `signup_site_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `signup_site_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup_sites`
--

DROP TABLE IF EXISTS `signup_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `signup_sites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `site_id` varchar(99) NOT NULL,
  `calendar_event_id` varchar(2000) DEFAULT NULL,
  `calendar_id` varchar(99) DEFAULT NULL,
  `meeting_id` bigint(20) NOT NULL,
  `list_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_SITE_ID` (`site_id`),
  KEY `FK_ju3pcd1e21e5mdubueu6mkwnm` (`meeting_id`),
  CONSTRAINT `FK_ju3pcd1e21e5mdubueu6mkwnm` FOREIGN KEY (`meeting_id`) REFERENCES `signup_meetings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_sites`
--

LOCK TABLES `signup_sites` WRITE;
/*!40000 ALTER TABLE `signup_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `signup_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup_ts`
--

DROP TABLE IF EXISTS `signup_ts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `signup_ts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `max_no_of_attendees` int(11) DEFAULT NULL,
  `display_attendees` bit(1) DEFAULT NULL,
  `canceled` bit(1) DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `group_id` varchar(99) DEFAULT NULL,
  `vevent_uuid` varchar(36) DEFAULT NULL,
  `meeting_id` bigint(20) NOT NULL,
  `list_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1vx6wg5a9cl9g99mhda0yuwt9` (`meeting_id`),
  CONSTRAINT `FK_1vx6wg5a9cl9g99mhda0yuwt9` FOREIGN KEY (`meeting_id`) REFERENCES `signup_meetings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_ts`
--

LOCK TABLES `signup_ts` WRITE;
/*!40000 ALTER TABLE `signup_ts` DISABLE KEYS */;
/*!40000 ALTER TABLE `signup_ts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup_ts_attendees`
--

DROP TABLE IF EXISTS `signup_ts_attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `signup_ts_attendees` (
  `timeslot_id` bigint(20) NOT NULL,
  `attendee_user_id` varchar(99) NOT NULL,
  `comments` longtext,
  `signup_site_id` varchar(99) NOT NULL,
  `calendar_event_id` varchar(2000) DEFAULT NULL,
  `calendar_id` varchar(99) DEFAULT NULL,
  `attended` bit(1) DEFAULT b'0',
  `list_index` int(11) NOT NULL,
  PRIMARY KEY (`timeslot_id`,`list_index`),
  CONSTRAINT `FK_1lnn8yo8ttkny37hb458rdydj` FOREIGN KEY (`timeslot_id`) REFERENCES `signup_ts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_ts_attendees`
--

LOCK TABLES `signup_ts_attendees` WRITE;
/*!40000 ALTER TABLE `signup_ts_attendees` DISABLE KEYS */;
/*!40000 ALTER TABLE `signup_ts_attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup_ts_waitinglist`
--

DROP TABLE IF EXISTS `signup_ts_waitinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `signup_ts_waitinglist` (
  `timeslot_id` bigint(20) NOT NULL,
  `attendee_user_id` varchar(99) NOT NULL,
  `comments` longtext,
  `signup_site_id` varchar(99) NOT NULL,
  `calendar_event_id` varchar(2000) DEFAULT NULL,
  `calendar_id` varchar(99) DEFAULT NULL,
  `attended` bit(1) DEFAULT b'0',
  `list_index` int(11) NOT NULL,
  PRIMARY KEY (`timeslot_id`,`list_index`),
  CONSTRAINT `FK_f9yvwba74mugrm393iy2vioh` FOREIGN KEY (`timeslot_id`) REFERENCES `signup_ts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_ts_waitinglist`
--

LOCK TABLES `signup_ts_waitinglist` WRITE;
/*!40000 ALTER TABLE `signup_ts_waitinglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `signup_ts_waitinglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ssq_answer`
--

DROP TABLE IF EXISTS `ssq_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ssq_answer` (
  `ID` varchar(99) NOT NULL,
  `ANSWER` varchar(255) DEFAULT NULL,
  `ANSWER_STRING` varchar(255) DEFAULT NULL,
  `FILL_IN_BLANK` bit(1) DEFAULT NULL,
  `ORDER_NUM` int(11) DEFAULT NULL,
  `QUESTION_ID` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SSQ_ANSWER_QUESTION_I` (`QUESTION_ID`),
  CONSTRAINT `FK_t3swplfx8h5v41rhbio3c2x9t` FOREIGN KEY (`QUESTION_ID`) REFERENCES `ssq_question` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ssq_answer`
--

LOCK TABLES `ssq_answer` WRITE;
/*!40000 ALTER TABLE `ssq_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `ssq_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ssq_question`
--

DROP TABLE IF EXISTS `ssq_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ssq_question` (
  `ID` varchar(99) NOT NULL,
  `QUESTION` varchar(255) DEFAULT NULL,
  `REQUIRED` bit(1) DEFAULT NULL,
  `MULTIPLE_ANSWERS` bit(1) DEFAULT NULL,
  `ORDER_NUM` int(11) DEFAULT NULL,
  `IS_CURRENT` varchar(255) DEFAULT NULL,
  `SITETYPE_ID` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SSQ_QUESTION_SITETYPE_I` (`SITETYPE_ID`),
  CONSTRAINT `FK_97bx4saaluvertjf8w3nsu9f3` FOREIGN KEY (`SITETYPE_ID`) REFERENCES `ssq_sitetype_questions` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table stores site setup questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ssq_question`
--

LOCK TABLES `ssq_question` WRITE;
/*!40000 ALTER TABLE `ssq_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `ssq_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ssq_sitetype_questions`
--

DROP TABLE IF EXISTS `ssq_sitetype_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ssq_sitetype_questions` (
  `ID` varchar(99) NOT NULL,
  `SITE_TYPE` varchar(255) DEFAULT NULL,
  `INSTRUCTION` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `URL_LABEL` varchar(255) DEFAULT NULL,
  `URL_Target` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ssq_sitetype_questions`
--

LOCK TABLES `ssq_sitetype_questions` WRITE;
/*!40000 ALTER TABLE `ssq_sitetype_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ssq_sitetype_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ssq_user_answer`
--

DROP TABLE IF EXISTS `ssq_user_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ssq_user_answer` (
  `ID` varchar(99) NOT NULL,
  `SITE_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `ANSWER_STRING` varchar(255) DEFAULT NULL,
  `ANSWER_ID` varchar(255) DEFAULT NULL,
  `QUESTION_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ssq_user_answer`
--

LOCK TABLES `ssq_user_answer` WRITE;
/*!40000 ALTER TABLE `ssq_user_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `ssq_user_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sst_events`
--

DROP TABLE IF EXISTS `sst_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sst_events` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(99) NOT NULL,
  `SITE_ID` varchar(99) NOT NULL,
  `EVENT_ID` varchar(32) NOT NULL,
  `EVENT_DATE` date NOT NULL,
  `EVENT_COUNT` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SST_EVENTS_SITEEVENTUSER_ID_IX` (`USER_ID`,`SITE_ID`,`EVENT_ID`),
  KEY `SST_EVENTS_SITE_ID_IX` (`SITE_ID`),
  KEY `SST_EVENTS_EVENT_ID_IX` (`EVENT_ID`),
  KEY `SST_EVENTS_DATE_IX` (`EVENT_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sst_events`
--

LOCK TABLES `sst_events` WRITE;
/*!40000 ALTER TABLE `sst_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `sst_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sst_job_run`
--

DROP TABLE IF EXISTS `sst_job_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sst_job_run` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `JOB_START_DATE` datetime DEFAULT NULL,
  `JOB_END_DATE` datetime DEFAULT NULL,
  `START_EVENT_ID` bigint(20) DEFAULT NULL,
  `END_EVENT_ID` bigint(20) DEFAULT NULL,
  `LAST_EVENT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sst_job_run`
--

LOCK TABLES `sst_job_run` WRITE;
/*!40000 ALTER TABLE `sst_job_run` DISABLE KEYS */;
/*!40000 ALTER TABLE `sst_job_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sst_lessonbuilder`
--

DROP TABLE IF EXISTS `sst_lessonbuilder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sst_lessonbuilder` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(99) NOT NULL,
  `SITE_ID` varchar(99) NOT NULL,
  `PAGE_REF` varchar(255) NOT NULL,
  `PAGE_ID` bigint(20) NOT NULL,
  `PAGE_ACTION` varchar(12) NOT NULL,
  `PAGE_DATE` date NOT NULL,
  `PAGE_COUNT` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SST_LESSONBUILDER_USER_ID_IX` (`USER_ID`),
  KEY `SST_LESSONBUILDER_SITE_ID_IX` (`SITE_ID`),
  KEY `SST_LESSONBUILDER_PAGE_ACT_IDX` (`PAGE_ACTION`),
  KEY `SST_LESSONBUILDER_DATE_IX` (`PAGE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sst_lessonbuilder`
--

LOCK TABLES `sst_lessonbuilder` WRITE;
/*!40000 ALTER TABLE `sst_lessonbuilder` DISABLE KEYS */;
/*!40000 ALTER TABLE `sst_lessonbuilder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sst_preferences`
--

DROP TABLE IF EXISTS `sst_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sst_preferences` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SITE_ID` varchar(99) NOT NULL,
  `PREFS` longtext NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SST_PREFERENCES_SITE_ID_IX` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sst_preferences`
--

LOCK TABLES `sst_preferences` WRITE;
/*!40000 ALTER TABLE `sst_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sst_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sst_presence_totals`
--

DROP TABLE IF EXISTS `sst_presence_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sst_presence_totals` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SITE_ID` varchar(99) NOT NULL,
  `USER_ID` varchar(99) NOT NULL,
  `TOTAL_VISITS` int(11) NOT NULL,
  `LAST_VISIT_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `spt_site_user_key` (`SITE_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sst_presence_totals`
--

LOCK TABLES `sst_presence_totals` WRITE;
/*!40000 ALTER TABLE `sst_presence_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `sst_presence_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sst_presences`
--

DROP TABLE IF EXISTS `sst_presences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sst_presences` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SITE_ID` varchar(99) NOT NULL,
  `USER_ID` varchar(99) NOT NULL,
  `P_DATE` date NOT NULL,
  `DURATION` bigint(20) NOT NULL DEFAULT '0',
  `LAST_VISIT_START_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SST_PRESENCE_SUD_ID_IX` (`SITE_ID`,`USER_ID`,`P_DATE`),
  KEY `SST_PRESENCE_USER_ID_IX` (`USER_ID`),
  KEY `SST_PRESENCE_DATE_IX` (`P_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sst_presences`
--

LOCK TABLES `sst_presences` WRITE;
/*!40000 ALTER TABLE `sst_presences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sst_presences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sst_reports`
--

DROP TABLE IF EXISTS `sst_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sst_reports` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SITE_ID` varchar(99) DEFAULT NULL,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` longtext,
  `HIDDEN` bit(1) DEFAULT NULL,
  `REPORT_DEF` longtext NOT NULL,
  `CREATED_BY` varchar(99) NOT NULL,
  `CREATED_ON` datetime NOT NULL,
  `MODIFIED_BY` varchar(99) DEFAULT NULL,
  `MODIFIED_ON` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SST_REPORTS_SITE_ID_IX` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sst_reports`
--

LOCK TABLES `sst_reports` WRITE;
/*!40000 ALTER TABLE `sst_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `sst_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sst_resources`
--

DROP TABLE IF EXISTS `sst_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sst_resources` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(99) NOT NULL,
  `SITE_ID` varchar(99) NOT NULL,
  `RESOURCE_REF` varchar(255) NOT NULL,
  `RESOURCE_ACTION` varchar(12) NOT NULL,
  `RESOURCE_DATE` date NOT NULL,
  `RESOURCE_COUNT` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SST_RESOURCES_USER_ID_IX` (`USER_ID`),
  KEY `SST_RESOURCES_SITE_ID_IX` (`SITE_ID`),
  KEY `SST_RESOURCES_RES_ACT_IDX` (`RESOURCE_ACTION`),
  KEY `SST_RESOURCES_DATE_IX` (`RESOURCE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sst_resources`
--

LOCK TABLES `sst_resources` WRITE;
/*!40000 ALTER TABLE `sst_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `sst_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sst_serverstats`
--

DROP TABLE IF EXISTS `sst_serverstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sst_serverstats` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTIVITY_DATE` date NOT NULL,
  `EVENT_ID` varchar(32) NOT NULL,
  `ACTIVITY_COUNT` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SST_SERVERSTATS_DATE_IX` (`ACTIVITY_DATE`),
  KEY `SST_SERVERSTATS_EVENT_ID_IX` (`EVENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sst_serverstats`
--

LOCK TABLES `sst_serverstats` WRITE;
/*!40000 ALTER TABLE `sst_serverstats` DISABLE KEYS */;
INSERT INTO `sst_serverstats` VALUES (1,'2019-05-16','site.add',1);
/*!40000 ALTER TABLE `sst_serverstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sst_siteactivity`
--

DROP TABLE IF EXISTS `sst_siteactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sst_siteactivity` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SITE_ID` varchar(99) NOT NULL,
  `ACTIVITY_DATE` date NOT NULL,
  `EVENT_ID` varchar(32) NOT NULL,
  `ACTIVITY_COUNT` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SST_SITEACTIVITY_SITE_ID_IX` (`SITE_ID`),
  KEY `SST_SITEACTIVITY_DATE_IX` (`ACTIVITY_DATE`),
  KEY `SST_SITEACTIVITY_EVENT_ID_IX` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sst_siteactivity`
--

LOCK TABLES `sst_siteactivity` WRITE;
/*!40000 ALTER TABLE `sst_siteactivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `sst_siteactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sst_sitevisits`
--

DROP TABLE IF EXISTS `sst_sitevisits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sst_sitevisits` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SITE_ID` varchar(99) NOT NULL,
  `VISITS_DATE` date NOT NULL,
  `TOTAL_VISITS` bigint(20) NOT NULL,
  `TOTAL_UNIQUE` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SST_SITEVISITS_SITE_ID_IX` (`SITE_ID`),
  KEY `SST_SITEVISITS_DATE_IX` (`VISITS_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sst_sitevisits`
--

LOCK TABLES `sst_sitevisits` WRITE;
/*!40000 ALTER TABLE `sst_sitevisits` DISABLE KEYS */;
/*!40000 ALTER TABLE `sst_sitevisits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sst_userstats`
--

DROP TABLE IF EXISTS `sst_userstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sst_userstats` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LOGIN_DATE` date NOT NULL,
  `USER_ID` varchar(99) NOT NULL,
  `LOGIN_COUNT` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SST_USERSTATS_DATE_IX` (`LOGIN_DATE`),
  KEY `SST_USERSTATS_USER_ID_IX` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sst_userstats`
--

LOCK TABLES `sst_userstats` WRITE;
/*!40000 ALTER TABLE `sst_userstats` DISABLE KEYS */;
/*!40000 ALTER TABLE `sst_userstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggable_link`
--

DROP TABLE IF EXISTS `taggable_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `taggable_link` (
  `LINK_ID` varchar(36) NOT NULL,
  `VERSION` int(11) NOT NULL,
  `ACTIVITY_REF` varchar(255) NOT NULL,
  `TAG_CRITERIA_REF` varchar(255) NOT NULL,
  `RUBRIC` longtext,
  `RATIONALE` longtext,
  `EXPORT_STRING` int(11) NOT NULL,
  `VISIBLE` bit(1) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  PRIMARY KEY (`LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggable_link`
--

LOCK TABLES `taggable_link` WRITE;
/*!40000 ALTER TABLE `taggable_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggable_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagservice_collection`
--

DROP TABLE IF EXISTS `tagservice_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tagservice_collection` (
  `tagcollectionid` char(36) NOT NULL,
  `description` text,
  `externalsourcename` varchar(255) DEFAULT NULL,
  `externalsourcedescription` text,
  `name` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `creationdate` bigint(20) DEFAULT NULL,
  `lastmodifiedby` varchar(255) DEFAULT NULL,
  `lastmodificationdate` bigint(20) DEFAULT NULL,
  `lastsynchronizationdate` bigint(20) DEFAULT NULL,
  `externalupdate` tinyint(1) DEFAULT NULL,
  `externalcreation` tinyint(1) DEFAULT NULL,
  `lastupdatedateinexternalsystem` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`tagcollectionid`),
  UNIQUE KEY `externalsourcename` (`externalsourcename`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagservice_collection`
--

LOCK TABLES `tagservice_collection` WRITE;
/*!40000 ALTER TABLE `tagservice_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagservice_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagservice_tag`
--

DROP TABLE IF EXISTS `tagservice_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tagservice_tag` (
  `tagid` char(36) NOT NULL,
  `tagcollectionid` char(36) NOT NULL,
  `externalid` varchar(255) DEFAULT NULL,
  `taglabel` varchar(255) DEFAULT NULL,
  `description` text,
  `alternativelabels` text,
  `createdby` varchar(255) DEFAULT NULL,
  `creationdate` bigint(20) DEFAULT NULL,
  `externalcreation` tinyint(1) DEFAULT NULL,
  `externalcreationDate` bigint(20) DEFAULT NULL,
  `externalupdate` tinyint(1) DEFAULT NULL,
  `lastmodifiedby` varchar(255) DEFAULT NULL,
  `lastmodificationdate` bigint(20) DEFAULT NULL,
  `lastupdatedateinexternalsystem` bigint(20) DEFAULT NULL,
  `parentid` varchar(255) DEFAULT NULL,
  `externalhierarchycode` text,
  `externaltype` varchar(255) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`tagid`),
  KEY `tagservice_tag_taglabel` (`taglabel`),
  KEY `tagservice_tag_tagcollectionid` (`tagcollectionid`),
  KEY `tagservice_tag_externalid` (`externalid`),
  CONSTRAINT `tagservice_tag_ibfk_1` FOREIGN KEY (`tagcollectionid`) REFERENCES `tagservice_collection` (`tagcollectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagservice_tag`
--

LOCK TABLES `tagservice_tag` WRITE;
/*!40000 ALTER TABLE `tagservice_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagservice_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_randomised_mappings_t`
--

DROP TABLE IF EXISTS `url_randomised_mappings_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `url_randomised_mappings_t` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TINY` varchar(255) NOT NULL,
  `URL` varchar(4000) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `KEY_INDEX` (`TINY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_randomised_mappings_t`
--

LOCK TABLES `url_randomised_mappings_t` WRITE;
/*!40000 ALTER TABLE `url_randomised_mappings_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_randomised_mappings_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_audits_log`
--

DROP TABLE IF EXISTS `user_audits_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_audits_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_id` varchar(99) NOT NULL,
  `user_id` varchar(99) NOT NULL,
  `role_name` varchar(99) NOT NULL,
  `action_taken` varchar(1) NOT NULL,
  `audit_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `source` varchar(1) DEFAULT NULL,
  `action_user_id` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_audits_log_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_audits_log`
--

LOCK TABLES `user_audits_log` WRITE;
/*!40000 ALTER TABLE `user_audits_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_audits_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validationaccount_item`
--

DROP TABLE IF EXISTS `validationaccount_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `validationaccount_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(255) NOT NULL,
  `EID` varchar(255) DEFAULT NULL,
  `VALIDATION_TOKEN` varchar(255) NOT NULL,
  `VALIDATION_SENT` datetime DEFAULT NULL,
  `VALIDATION_RECEIVED` datetime DEFAULT NULL,
  `VALIDATIONS_SENT` int(11) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `SURNAME` varchar(255) DEFAULT NULL,
  `ACCOUNT_STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validationaccount_item`
--

LOCK TABLES `validationaccount_item` WRITE;
/*!40000 ALTER TABLE `validationaccount_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `validationaccount_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-16 10:27:01
