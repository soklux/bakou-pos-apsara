-- MySQL dump 10.13  Distrib 5.6.22, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bakou_pos_apsara
-- ------------------------------------------------------
-- Server version	5.6.22-1+deb.sury.org~trusty+1

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
-- Table structure for table `AuthAssignment`
--

DROP TABLE IF EXISTS `AuthAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthAssignment` (
  `itemname` varchar(64) CHARACTER SET latin1 NOT NULL,
  `userid` varchar(64) CHARACTER SET latin1 NOT NULL,
  `bizrule` text CHARACTER SET latin1,
  `data` text CHARACTER SET latin1,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `FK_AuthAssignment` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthAssignment`
--

LOCK TABLES `AuthAssignment` WRITE;
/*!40000 ALTER TABLE `AuthAssignment` DISABLE KEYS */;
INSERT INTO `AuthAssignment` VALUES ('client.create','3',NULL,NULL),('client.delete','3',NULL,NULL),('client.index','3',NULL,NULL),('client.update','3',NULL,NULL),('employee.create','3',NULL,NULL),('employee.delete','3',NULL,NULL),('employee.index','3',NULL,NULL),('employee.update','3',NULL,NULL),('invoice.delete','3',NULL,NULL),('invoice.index','3',NULL,NULL),('invoice.print','3',NULL,NULL),('invoice.update','3',NULL,NULL),('item.create','3',NULL,NULL),('item.delete','3',NULL,NULL),('item.index','3',NULL,NULL),('item.update','3',NULL,NULL),('payment.index','3',NULL,NULL),('report.index','3',NULL,NULL),('sale.discount','3',NULL,NULL),('sale.edit','3',NULL,NULL),('sale.editprice','3',NULL,NULL),('store.update','3',NULL,NULL),('supplier.create','3',NULL,NULL),('supplier.delete','3',NULL,NULL),('supplier.index','3',NULL,NULL),('supplier.update','3',NULL,NULL),('transaction.adjustin','3',NULL,NULL),('transaction.adjustout','3',NULL,NULL),('transaction.count','3',NULL,NULL),('transaction.receive','3',NULL,NULL),('transaction.return','3',NULL,NULL),('transaction.transfer','3',NULL,NULL);
/*!40000 ALTER TABLE `AuthAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthItem`
--

DROP TABLE IF EXISTS `AuthItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthItem` (
  `name` varchar(64) CHARACTER SET latin1 NOT NULL,
  `type` int(11) NOT NULL,
  `description` text CHARACTER SET latin1,
  `bizrule` text CHARACTER SET latin1,
  `data` text CHARACTER SET latin1,
  `sort_order` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthItem`
--

LOCK TABLES `AuthItem` WRITE;
/*!40000 ALTER TABLE `AuthItem` DISABLE KEYS */;
INSERT INTO `AuthItem` VALUES ('client.create',0,'Create',NULL,'N;',2),('client.delete',0,'Delete',NULL,'N;',4),('client.index',0,'View',NULL,'N;',1),('client.update',0,'Update',NULL,'N;',3),('employee.create',0,'Create',NULL,NULL,2),('employee.delete',0,'Delete',NULL,NULL,4),('employee.index',0,'View',NULL,NULL,1),('employee.update',0,'Update',NULL,NULL,3),('invoice.delete',0,'Cancel',NULL,'N;',4),('invoice.index',0,'View',NULL,'N;',1),('invoice.print',0,'Re-print',NULL,'N;',2),('invoice.update',0,'Edit',NULL,'N;',3),('item.create',0,'Create',NULL,NULL,2),('item.delete',0,'Delete',NULL,NULL,4),('item.index',0,'View',NULL,NULL,1),('item.update',0,'Update',NULL,NULL,3),('itemAdmin',1,'Administer Item',NULL,'N;',NULL),('payment.index',0,'Invoice Payment (Debt)',NULL,NULL,NULL),('receiving.edit',0,'Process Purchase orders',NULL,'N;',NULL),('report.index',0,'View and generate reports',NULL,'N;',NULL),('sale.discount',0,'Discount',NULL,'N;',NULL),('sale.edit',0,'Normal Sale',NULL,'N;',NULL),('sale.editprice',0,'Edit Price',NULL,'N;',NULL),('setting.exchangerate',0,'Exchange Rate',NULL,NULL,NULL),('setting.receipt',0,'Receipt Setting',NULL,NULL,NULL),('setting.sale',0,'Sale Setting',NULL,NULL,NULL),('setting.site',0,'Shop Setting',NULL,NULL,NULL),('setting.system',0,'System Setting',NULL,NULL,NULL),('store.update',0,'Change the store\'s configuration',NULL,'N;',NULL),('supplier.create',0,'Create',NULL,NULL,2),('supplier.delete',0,'Delete',NULL,NULL,4),('supplier.index',0,'View',NULL,NULL,1),('supplier.update',0,'Update',NULL,NULL,3),('transaction.adjustin',0,'Adjustment In',NULL,NULL,3),('transaction.adjustout',0,'Adjustment Out',NULL,NULL,4),('transaction.count',0,'Physical Count',NULL,NULL,5),('transaction.receive',0,'Receive from Supplier',NULL,NULL,1),('transaction.return',0,'Return to Supplier',NULL,NULL,2),('transaction.transfer',0,'Transfer to (Another Branch)',NULL,NULL,6);
/*!40000 ALTER TABLE `AuthItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthItemChild`
--

DROP TABLE IF EXISTS `AuthItemChild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthItemChild` (
  `parent` varchar(64) CHARACTER SET latin1 NOT NULL,
  `child` varchar(64) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthItemChild`
--

LOCK TABLES `AuthItemChild` WRITE;
/*!40000 ALTER TABLE `AuthItemChild` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuthItemChild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `currency_code` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `current_balance` decimal(15,4) DEFAULT '0.0000',
  `status` varchar(1) DEFAULT '1',
  `date_created` datetime DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `FK_account_client_id` (`client_id`),
  KEY `FK_account_cur_code` (`currency_code`),
  CONSTRAINT `FK_account` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_account_cur_code` FOREIGN KEY (`currency_code`) REFERENCES `currency_type` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (2,3,3,'Jhon Doe',0.0000,'1','2015-03-04 22:49:04',NULL),(3,3,2,'Jhon Doe',0.0000,'1','2015-03-04 22:49:04',NULL),(4,4,3,'Lux Sok',10.0000,'1','2015-03-04 22:57:41',NULL),(5,4,2,'Lux Sok',60.0000,'1','2015-03-04 22:57:41',NULL),(6,4,1,'Lux Sok',2.0000,'1','2015-03-19 07:55:42',NULL),(7,5,2,'Apsara E',11.0000,'1','2015-03-19 07:57:39',NULL),(8,5,3,'Apsara E',171.0000,'1','2015-03-19 07:57:39',NULL),(9,5,1,'Apsara E',103.5000,'1','2015-03-19 07:57:39',NULL),(10,6,2,'CMHO ',0.0000,'1','2015-03-23 19:54:11',NULL),(11,6,3,'CMHO ',0.0000,'1','2015-03-23 19:54:11',NULL),(12,6,1,'CMHO ',0.0000,'1','2015-03-23 19:54:11',NULL),(13,7,2,'Opa ',0.0000,'1','2015-03-23 19:55:23',NULL),(14,7,3,'Opa ',0.0000,'1','2015-03-23 19:55:23',NULL),(15,7,1,'Opa ',0.0000,'1','2015-03-23 19:55:23',NULL),(16,8,2,'oxfam ',0.0000,'1','2015-03-23 19:56:23',NULL),(17,8,3,'oxfam ',0.0000,'1','2015-03-23 19:56:23',NULL),(18,8,1,'oxfam ',0.0000,'1','2015-03-23 19:56:23',NULL),(19,9,2,'test ',0.0000,'1','2015-03-23 19:57:38',NULL),(20,9,3,'test ',13.0000,'1','2015-03-23 19:57:38',NULL),(21,9,1,'test ',0.0000,'1','2015-03-23 19:57:38',NULL),(22,10,2,'Kaka ',0.0000,'1','2015-03-23 19:58:19',NULL),(23,10,3,'Kaka ',0.0000,'1','2015-03-23 19:58:19',NULL),(24,10,1,'Kaka ',0.0000,'1','2015-03-23 19:58:19',NULL),(25,11,2,'test ',0.0000,'1','2015-04-17 12:01:36',NULL),(26,11,3,'test ',0.0000,'1','2015-04-17 12:01:36',NULL),(27,11,1,'test ',0.0000,'1','2015-04-17 12:01:36',NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_receivable`
--

DROP TABLE IF EXISTS `account_receivable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_receivable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `trans_amount` decimal(15,4) DEFAULT NULL,
  `trans_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_datetime` datetime DEFAULT NULL,
  `trans_status` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `note` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `FK_transactions_account_id` (`account_id`),
  KEY `FK_transactions_employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_receivable`
--

LOCK TABLES `account_receivable` WRITE;
/*!40000 ALTER TABLE `account_receivable` DISABLE KEYS */;
INSERT INTO `account_receivable` VALUES (1,5,2,1,32.0000,'CHSALE','2015-03-13 21:39:48','N',NULL),(2,4,2,1,15.0000,'CHSALE','2015-03-13 21:39:48','N',NULL),(4,4,2,1,5.0000,'PAY','2015-03-13 21:39:48','N',NULL),(5,5,2,1,12.0000,'PAY','2015-03-13 21:39:48','N',NULL),(6,5,2,2,30.0000,'CHSALE','2015-03-13 21:44:43','N',NULL),(7,4,2,2,15.0000,'CHSALE','2015-03-13 21:44:43','N',NULL),(9,4,2,1,10.0000,'PAY','2015-03-13 21:44:43','N',NULL),(10,4,2,2,10.0000,'PAY','2015-03-13 21:44:43','N',NULL),(11,5,2,1,20.0000,'PAY','2015-03-13 21:44:43','N',NULL),(12,5,2,2,20.0000,'PAY','2015-03-13 21:44:43','N',NULL),(13,6,2,3,4.0000,'CHSALE','2015-03-19 12:48:52','N',NULL),(14,5,2,3,20.0000,'CHSALE','2015-03-19 12:48:52','N',NULL),(15,4,2,3,15.0000,'CHSALE','2015-03-19 12:48:52','N',NULL),(16,6,2,3,2.0000,'PAY','2015-03-19 12:48:53','N',NULL),(17,6,2,4,2.0000,'CHSALE','2015-03-19 12:50:40','N',NULL),(18,5,2,4,30.0000,'CHSALE','2015-03-19 12:50:40','N',NULL),(19,4,2,4,10.0000,'CHSALE','2015-03-19 12:50:40','N',NULL),(20,6,2,3,2.0000,'PAY','2015-03-19 12:50:40','N',NULL),(21,4,2,2,5.0000,'PAY','2015-03-19 12:50:40','N',NULL),(22,4,2,3,15.0000,'PAY','2015-03-19 12:50:40','N',NULL),(23,20,2,13,16.0000,'CHSALE','2015-03-23 20:44:36','N',NULL),(24,20,2,13,3.0000,'PAY','2015-03-23 20:44:37','N',NULL),(25,9,2,15,103.5000,'CHSALE','2015-04-17 11:26:28','N',NULL),(26,7,2,15,11.0000,'CHSALE','2015-04-17 11:26:28','N',NULL),(27,8,2,15,171.0000,'CHSALE','2015-04-17 11:26:28','N',NULL),(28,7,2,11,0.0000,'PAY','2015-04-17 11:26:28','N',NULL);
/*!40000 ALTER TABLE `account_receivable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_receivable_supplier`
--

DROP TABLE IF EXISTS `account_receivable_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_receivable_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `trans_amount` decimal(15,4) DEFAULT NULL,
  `trans_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_datetime` datetime DEFAULT NULL,
  `trans_status` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `note` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_receivable_supplier`
--

LOCK TABLES `account_receivable_supplier` WRITE;
/*!40000 ALTER TABLE `account_receivable_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_receivable_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_supplier`
--

DROP TABLE IF EXISTS `account_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `current_balance` decimal(15,4) DEFAULT '0.0000',
  `status` varchar(1) DEFAULT '1',
  `date_created` datetime DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `FK_account_supplier_supplier_id` (`supplier_id`),
  CONSTRAINT `FK_account_supplier_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_supplier`
--

LOCK TABLES `account_supplier` WRITE;
/*!40000 ALTER TABLE `account_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `mobile_no` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'lux',NULL,NULL,NULL,NULL),(2,'Min Ly Ngan',NULL,NULL,NULL,NULL),(3,'មោនោ',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_register_balance`
--

DROP TABLE IF EXISTS `cash_register_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_register_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `begin_cash` double(15,2) DEFAULT NULL,
  `sale_cash` double(15,2) DEFAULT NULL,
  `sale_credit_card` double(15,2) DEFAULT NULL,
  `sale_on_credit` double(15,2) DEFAULT NULL,
  `cash_received` double(15,2) DEFAULT NULL,
  `cash_total` double(15,2) DEFAULT NULL,
  `counted_total` double(15,2) DEFAULT NULL,
  `over_short` double(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_register_balance`
--

LOCK TABLES `cash_register_balance` WRITE;
/*!40000 ALTER TABLE `cash_register_balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_register_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'tale book','2015-03-31 00:00:00',NULL),(2,'rubber','2015-03-31 00:00:00',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price_tier_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `mobile_no` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `address1` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `address2` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `country_code` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `notes` text CHARACTER SET utf8,
  `status` varchar(1) CHARACTER SET utf8 DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (3,NULL,'Jhon','Doe','012812812','','',NULL,NULL,NULL,'','1'),(4,1,'Lux','Sok','012797008','','',NULL,NULL,NULL,'','1'),(5,2,'Apsara','E','077837783','','',NULL,NULL,NULL,'','1'),(6,2,'CMHO','','01296906','','',NULL,NULL,NULL,'','1'),(7,1,'Opa','','012900900','','',NULL,NULL,NULL,'','1'),(8,2,'oxfam','','01299889','','',NULL,NULL,NULL,'','1'),(9,1,'test','','012989989','','',NULL,NULL,NULL,'','1'),(10,2,'Kaka','','012888989','','',NULL,NULL,NULL,'','1'),(11,1,'test','','99999','','',NULL,NULL,NULL,'','1');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_price_tier`
--

DROP TABLE IF EXISTS `client_price_tier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_price_tier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `price_tier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_price_tier`
--

LOCK TABLES `client_price_tier` WRITE;
/*!40000 ALTER TABLE `client_price_tier` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_price_tier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_type`
--

DROP TABLE IF EXISTS `currency_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_type` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id` char(3) CHARACTER SET utf8 NOT NULL,
  `currency_name` varchar(70) CHARACTER SET utf8 NOT NULL,
  `currency_symbol` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_type`
--

LOCK TABLES `currency_type` WRITE;
/*!40000 ALTER TABLE `currency_type` DISABLE KEYS */;
INSERT INTO `currency_type` VALUES (1,'USD','United States Dollar','$',3,'1'),(2,'KHR','Kampuchea Riel','៛',1,'1'),(3,'THB','Thai Baht','฿',2,'1');
/*!40000 ALTER TABLE `currency_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `mobile_no` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `adddress1` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `address2` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `country_code` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `notes` text CHARACTER SET utf8,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Owner','System','012812812','','',NULL,'','','','1'),(2,'Super','Super','012123456','super addresss1','super address',NULL,'','','','1');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_image`
--

DROP TABLE IF EXISTS `employee_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `photo` blob NOT NULL,
  `thumbnail` blob,
  `filename` varchar(30) CHARACTER SET latin1 NOT NULL,
  `filetype` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `path` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `width` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `height` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_employee_image_emp_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_image`
--

LOCK TABLES `employee_image` WRITE;
/*!40000 ALTER TABLE `employee_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_rate`
--

DROP TABLE IF EXISTS `exchange_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exchange_rate` (
  `base_currency` int(11) NOT NULL,
  `to_currency` int(11) NOT NULL,
  `base_cur_val` double(15,2) NOT NULL DEFAULT '1.00',
  `to_cur_val` double(15,2) NOT NULL,
  PRIMARY KEY (`base_currency`,`to_currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_rate`
--

LOCK TABLES `exchange_rate` WRITE;
/*!40000 ALTER TABLE `exchange_rate` DISABLE KEYS */;
INSERT INTO `exchange_rate` VALUES (1,3,1.00,32.00),(2,3,1.00,100.00),(3,3,1.00,1.00);
/*!40000 ALTER TABLE `exchange_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_items` int(11) NOT NULL,
  `trans_user` int(11) NOT NULL,
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text CHARACTER SET utf8 NOT NULL,
  `trans_inventory` double(15,2) NOT NULL DEFAULT '0.00',
  `trans_qty` double(15,2) DEFAULT NULL,
  `qty_b4_trans` double(15,2) DEFAULT NULL,
  `qty_af_trans` double(15,2) DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `FK_inventory_item_id` (`trans_items`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (3,1376,2,'2015-03-06 00:46:53','POS 2',-2.00,2.00,0.00,-2.00),(4,1374,2,'2015-03-06 00:46:53','POS 2',-1.00,1.00,0.00,-1.00),(5,1373,2,'2015-03-06 00:46:53','POS 2',-1.00,1.00,0.00,-1.00),(6,1376,2,'2015-03-06 01:03:36','POS 3',-2.00,2.00,-2.00,-4.00),(7,1374,2,'2015-03-06 01:03:36','POS 3',-1.00,1.00,-1.00,-2.00),(8,1373,2,'2015-03-06 01:03:36','POS 3',-1.00,1.00,-1.00,-2.00),(21,1374,2,'2015-03-06 12:45:05','POS 7',-2.00,2.00,-2.00,-4.00),(22,1372,2,'2015-03-06 12:45:05','POS 7',-4.00,4.00,0.00,-4.00),(23,1376,2,'2015-03-06 12:45:05','POS 7',-1.00,1.00,-4.00,-5.00),(24,1373,2,'2015-03-06 12:45:05','POS 7',-1.00,1.00,-2.00,-3.00),(25,1374,2,'2015-03-06 12:45:23','POS 8',-2.00,2.00,-4.00,-6.00),(26,1372,2,'2015-03-06 12:45:23','POS 8',-4.00,4.00,-4.00,-8.00),(27,1376,2,'2015-03-06 12:45:23','POS 8',-1.00,1.00,-5.00,-6.00),(28,1373,2,'2015-03-06 12:45:23','POS 8',-1.00,1.00,-3.00,-4.00),(29,1374,2,'2015-03-06 12:46:50','POS 9',-2.00,2.00,-6.00,-8.00),(30,1372,2,'2015-03-06 12:46:50','POS 9',-4.00,4.00,-8.00,-12.00),(31,1376,2,'2015-03-06 12:46:50','POS 9',-1.00,1.00,-6.00,-7.00),(32,1373,2,'2015-03-06 12:46:50','POS 9',-1.00,1.00,-4.00,-5.00),(33,1374,2,'2015-03-06 12:47:19','POS 10',-2.00,2.00,-8.00,-10.00),(34,1372,2,'2015-03-06 12:47:19','POS 10',-4.00,4.00,-12.00,-16.00),(35,1376,2,'2015-03-06 12:47:19','POS 10',-1.00,1.00,-7.00,-8.00),(36,1373,2,'2015-03-06 12:47:19','POS 10',-1.00,1.00,-5.00,-6.00),(37,1374,2,'2015-03-06 12:47:30','POS 11',-2.00,2.00,-10.00,-12.00),(38,1372,2,'2015-03-06 12:47:30','POS 11',-4.00,4.00,-16.00,-20.00),(39,1376,2,'2015-03-06 12:47:30','POS 11',-1.00,1.00,-8.00,-9.00),(40,1373,2,'2015-03-06 12:47:30','POS 11',-1.00,1.00,-6.00,-7.00),(41,1374,2,'2015-03-06 12:47:33','POS 12',-2.00,2.00,-12.00,-14.00),(42,1372,2,'2015-03-06 12:47:33','POS 12',-4.00,4.00,-20.00,-24.00),(43,1376,2,'2015-03-06 12:47:33','POS 12',-1.00,1.00,-9.00,-10.00),(44,1373,2,'2015-03-06 12:47:33','POS 12',-1.00,1.00,-7.00,-8.00),(45,1374,2,'2015-03-06 12:47:49','POS 13',-2.00,2.00,-14.00,-16.00),(46,1372,2,'2015-03-06 12:47:49','POS 13',-4.00,4.00,-24.00,-28.00),(47,1376,2,'2015-03-06 12:47:49','POS 13',-1.00,1.00,-10.00,-11.00),(48,1373,2,'2015-03-06 12:47:49','POS 13',-1.00,1.00,-8.00,-9.00),(49,1374,2,'2015-03-06 12:48:04','POS 14',-2.00,2.00,-16.00,-18.00),(50,1372,2,'2015-03-06 12:48:04','POS 14',-4.00,4.00,-28.00,-32.00),(51,1376,2,'2015-03-06 12:48:04','POS 14',-1.00,1.00,-11.00,-12.00),(52,1373,2,'2015-03-06 12:48:04','POS 14',-1.00,1.00,-9.00,-10.00),(53,1374,2,'2015-03-06 12:48:43','POS 15',-2.00,2.00,-18.00,-20.00),(54,1372,2,'2015-03-06 12:48:43','POS 15',-4.00,4.00,-32.00,-36.00),(55,1376,2,'2015-03-06 12:48:43','POS 15',-1.00,1.00,-12.00,-13.00),(56,1373,2,'2015-03-06 12:48:43','POS 15',-1.00,1.00,-10.00,-11.00),(57,1374,2,'2015-03-06 12:50:08','POS 16',-2.00,2.00,-20.00,-22.00),(58,1372,2,'2015-03-06 12:50:08','POS 16',-4.00,4.00,-36.00,-40.00),(59,1376,2,'2015-03-06 12:50:08','POS 16',-1.00,1.00,-13.00,-14.00),(60,1373,2,'2015-03-06 12:50:08','POS 16',-1.00,1.00,-11.00,-12.00),(61,1374,2,'2015-03-06 12:50:09','POS 17',-2.00,2.00,-22.00,-24.00),(62,1372,2,'2015-03-06 12:50:09','POS 17',-4.00,4.00,-40.00,-44.00),(63,1376,2,'2015-03-06 12:50:09','POS 17',-1.00,1.00,-14.00,-15.00),(64,1373,2,'2015-03-06 12:50:09','POS 17',-1.00,1.00,-12.00,-13.00),(65,1374,2,'2015-03-06 12:50:10','POS 18',-2.00,2.00,-24.00,-26.00),(66,1372,2,'2015-03-06 12:50:10','POS 18',-4.00,4.00,-44.00,-48.00),(67,1376,2,'2015-03-06 12:50:10','POS 18',-1.00,1.00,-15.00,-16.00),(68,1373,2,'2015-03-06 12:50:10','POS 18',-1.00,1.00,-13.00,-14.00),(69,1374,2,'2015-03-06 12:50:46','POS 19',-2.00,2.00,-26.00,-28.00),(70,1372,2,'2015-03-06 12:50:46','POS 19',-4.00,4.00,-48.00,-52.00),(71,1376,2,'2015-03-06 12:50:46','POS 19',-1.00,1.00,-16.00,-17.00),(72,1373,2,'2015-03-06 12:50:46','POS 19',-1.00,1.00,-14.00,-15.00),(73,1374,2,'2015-03-06 12:52:02','POS 20',-2.00,2.00,-28.00,-30.00),(74,1372,2,'2015-03-06 12:52:02','POS 20',-4.00,4.00,-52.00,-56.00),(75,1376,2,'2015-03-06 12:52:02','POS 20',-1.00,1.00,-17.00,-18.00),(76,1373,2,'2015-03-06 12:52:02','POS 20',-1.00,1.00,-15.00,-16.00),(77,1374,2,'2015-03-06 12:52:34','POS 21',-2.00,2.00,-30.00,-32.00),(78,1372,2,'2015-03-06 12:52:34','POS 21',-4.00,4.00,-56.00,-60.00),(79,1376,2,'2015-03-06 12:52:34','POS 21',-1.00,1.00,-18.00,-19.00),(80,1373,2,'2015-03-06 12:52:34','POS 21',-1.00,1.00,-16.00,-17.00),(81,1374,2,'2015-03-06 12:55:54','POS 22',-2.00,2.00,-32.00,-34.00),(82,1372,2,'2015-03-06 12:55:54','POS 22',-4.00,4.00,-60.00,-64.00),(83,1376,2,'2015-03-06 12:55:54','POS 22',-1.00,1.00,-19.00,-20.00),(84,1373,2,'2015-03-06 12:55:54','POS 22',-1.00,1.00,-17.00,-18.00),(85,1374,2,'2015-03-06 12:55:55','POS 23',-2.00,2.00,-34.00,-36.00),(86,1372,2,'2015-03-06 12:55:55','POS 23',-4.00,4.00,-64.00,-68.00),(87,1376,2,'2015-03-06 12:55:55','POS 23',-1.00,1.00,-20.00,-21.00),(88,1373,2,'2015-03-06 12:55:55','POS 23',-1.00,1.00,-18.00,-19.00),(89,1374,2,'2015-03-06 12:55:57','POS 24',-2.00,2.00,-36.00,-38.00),(90,1372,2,'2015-03-06 12:55:57','POS 24',-4.00,4.00,-68.00,-72.00),(91,1376,2,'2015-03-06 12:55:57','POS 24',-1.00,1.00,-21.00,-22.00),(92,1373,2,'2015-03-06 12:55:57','POS 24',-1.00,1.00,-19.00,-20.00),(93,1374,2,'2015-03-06 12:56:34','POS 25',-2.00,2.00,-38.00,-40.00),(94,1372,2,'2015-03-06 12:56:34','POS 25',-4.00,4.00,-72.00,-76.00),(95,1376,2,'2015-03-06 12:56:34','POS 25',-1.00,1.00,-22.00,-23.00),(96,1373,2,'2015-03-06 12:56:34','POS 25',-1.00,1.00,-20.00,-21.00),(97,1374,2,'2015-03-06 12:57:36','POS 26',-2.00,2.00,-40.00,-42.00),(98,1372,2,'2015-03-06 12:57:36','POS 26',-4.00,4.00,-76.00,-80.00),(99,1376,2,'2015-03-06 12:57:36','POS 26',-1.00,1.00,-23.00,-24.00),(100,1373,2,'2015-03-06 12:57:36','POS 26',-1.00,1.00,-21.00,-22.00),(101,1374,2,'2015-03-06 12:58:01','POS 27',-1.00,1.00,-42.00,-43.00),(102,1372,2,'2015-03-06 12:58:01','POS 27',-2.00,2.00,-80.00,-82.00),(103,1376,2,'2015-03-06 12:58:01','POS 27',-1.00,1.00,-24.00,-25.00),(104,1374,2,'2015-03-06 13:01:56','POS 28',-1.00,1.00,-43.00,-44.00),(105,1376,2,'2015-03-06 13:01:56','POS 28',-1.00,1.00,-25.00,-26.00),(106,1372,2,'2015-03-06 13:01:56','POS 28',-1.00,1.00,-82.00,-83.00),(107,1374,2,'2015-03-06 13:46:55','POS 29',-1.00,1.00,-44.00,-45.00),(108,1376,2,'2015-03-06 13:46:55','POS 29',-1.00,1.00,-26.00,-27.00),(109,1372,2,'2015-03-06 13:46:55','POS 29',-1.00,1.00,-83.00,-84.00),(110,1374,2,'2015-03-06 13:47:56','POS 30',-1.00,1.00,-45.00,-46.00),(111,1376,2,'2015-03-06 13:47:56','POS 30',-1.00,1.00,-27.00,-28.00),(112,1372,2,'2015-03-06 13:47:56','POS 30',-1.00,1.00,-84.00,-85.00),(113,1374,2,'2015-03-06 13:49:19','POS 31',-1.00,1.00,-46.00,-47.00),(114,1376,2,'2015-03-06 13:49:19','POS 31',-1.00,1.00,-28.00,-29.00),(115,1372,2,'2015-03-06 13:49:19','POS 31',-1.00,1.00,-85.00,-86.00),(116,1374,2,'2015-03-06 13:49:20','POS 32',-1.00,1.00,-47.00,-48.00),(117,1376,2,'2015-03-06 13:49:20','POS 32',-1.00,1.00,-29.00,-30.00),(118,1372,2,'2015-03-06 13:49:20','POS 32',-1.00,1.00,-86.00,-87.00),(119,1374,2,'2015-03-06 13:49:22','POS 33',-1.00,1.00,-48.00,-49.00),(120,1376,2,'2015-03-06 13:49:22','POS 33',-1.00,1.00,-30.00,-31.00),(121,1372,2,'2015-03-06 13:49:22','POS 33',-1.00,1.00,-87.00,-88.00),(122,1374,2,'2015-03-06 13:49:34','POS 34',-1.00,1.00,-49.00,-50.00),(123,1376,2,'2015-03-06 13:49:34','POS 34',-1.00,1.00,-31.00,-32.00),(124,1372,2,'2015-03-06 13:49:34','POS 34',-1.00,1.00,-88.00,-89.00),(125,1374,2,'2015-03-06 13:50:08','POS 35',-1.00,1.00,-50.00,-51.00),(126,1376,2,'2015-03-06 13:50:08','POS 35',-1.00,1.00,-32.00,-33.00),(127,1372,2,'2015-03-06 13:50:08','POS 35',-1.00,1.00,-89.00,-90.00),(128,1374,2,'2015-03-06 13:50:10','POS 36',-1.00,1.00,-51.00,-52.00),(129,1376,2,'2015-03-06 13:50:10','POS 36',-1.00,1.00,-33.00,-34.00),(130,1372,2,'2015-03-06 13:50:10','POS 36',-1.00,1.00,-90.00,-91.00),(131,1374,2,'2015-03-06 13:50:57','POS 37',-1.00,1.00,-52.00,-53.00),(132,1376,2,'2015-03-06 13:50:57','POS 37',-1.00,1.00,-34.00,-35.00),(133,1372,2,'2015-03-06 13:50:57','POS 37',-1.00,1.00,-91.00,-92.00),(134,1374,2,'2015-03-06 13:51:12','POS 38',-1.00,1.00,-53.00,-54.00),(135,1376,2,'2015-03-06 13:51:12','POS 38',-1.00,1.00,-35.00,-36.00),(136,1372,2,'2015-03-06 13:51:12','POS 38',-1.00,1.00,-92.00,-93.00),(137,1374,2,'2015-03-06 13:53:31','POS 39',-1.00,1.00,-54.00,-55.00),(138,1376,2,'2015-03-06 13:53:31','POS 39',-1.00,1.00,-36.00,-37.00),(139,1372,2,'2015-03-06 13:53:31','POS 39',-1.00,1.00,-93.00,-94.00),(140,1374,2,'2015-03-06 13:53:49','POS 40',-1.00,1.00,-55.00,-56.00),(141,1376,2,'2015-03-06 13:53:49','POS 40',-1.00,1.00,-37.00,-38.00),(142,1372,2,'2015-03-06 13:53:49','POS 40',-1.00,1.00,-94.00,-95.00),(143,1374,2,'2015-03-06 13:56:08','POS 41',-1.00,1.00,-56.00,-57.00),(144,1376,2,'2015-03-06 13:56:08','POS 41',-1.00,1.00,-38.00,-39.00),(145,1372,2,'2015-03-06 13:56:08','POS 41',-1.00,1.00,-95.00,-96.00),(146,1374,2,'2015-03-06 14:01:57','POS 1',-1.00,1.00,-57.00,-58.00),(147,1372,2,'2015-03-06 14:01:57','POS 1',-1.00,1.00,-96.00,-97.00),(148,1376,2,'2015-03-06 14:01:57','POS 1',-1.00,1.00,-39.00,-40.00),(149,1373,2,'2015-03-06 14:01:57','POS 1',-1.00,1.00,-22.00,-23.00),(150,1372,2,'2015-03-06 18:38:37','POS 2',-1.00,1.00,-97.00,-98.00),(151,1376,2,'2015-03-06 18:38:37','POS 2',-1.00,1.00,-40.00,-41.00),(152,1373,2,'2015-03-06 18:38:37','POS 2',-1.00,1.00,-23.00,-24.00),(165,1376,2,'2015-03-07 10:27:29','POS 9',-1.00,1.00,-41.00,-42.00),(166,1372,2,'2015-03-07 10:27:29','POS 9',-1.00,1.00,-98.00,-99.00),(167,1374,2,'2015-03-07 10:50:27','POS 10',-1.00,1.00,-58.00,-59.00),(168,1372,2,'2015-03-08 13:58:40','POS 11',-1.00,1.00,-99.00,-100.00),(169,1374,2,'2015-03-08 13:58:40','POS 11',-1.00,1.00,-59.00,-60.00),(170,1373,2,'2015-03-08 13:58:40','POS 11',-1.00,1.00,-24.00,-25.00),(171,1374,2,'2015-03-08 14:01:03','POS 1',-2.00,2.00,-60.00,-62.00),(172,1376,2,'2015-03-08 14:01:03','POS 1',-1.00,1.00,-42.00,-43.00),(173,1373,2,'2015-03-08 14:01:03','POS 1',-1.00,1.00,-25.00,-26.00),(174,1374,2,'2015-03-08 14:07:38','POS 2',-2.00,2.00,-62.00,-64.00),(175,1372,2,'2015-03-08 14:07:38','POS 2',-1.00,1.00,-100.00,-101.00),(176,1376,2,'2015-03-08 14:12:50','POS 3',-1.00,1.00,-43.00,-44.00),(177,1376,2,'2015-03-08 15:53:02','POS 4',-2.00,2.00,-44.00,-46.00),(178,1372,2,'2015-03-08 15:53:02','POS 4',-1.00,1.00,-101.00,-102.00),(179,1373,2,'2015-03-08 15:53:02','POS 4',-2.00,2.00,-26.00,-28.00),(192,1374,2,'2015-03-09 14:27:42','POS 8',-1.00,1.00,-64.00,-65.00),(193,1372,2,'2015-03-09 14:27:42','POS 8',-1.00,1.00,-102.00,-103.00),(194,1376,2,'2015-03-09 14:27:42','POS 8',-1.00,1.00,-46.00,-47.00),(195,1373,2,'2015-03-09 14:27:42','POS 8',-1.00,1.00,-28.00,-29.00),(196,1374,2,'2015-03-09 14:34:33','POS 9',-1.00,1.00,-65.00,-66.00),(197,1376,2,'2015-03-09 14:37:05','POS 10',-1.00,1.00,-47.00,-48.00),(198,1374,2,'2015-03-09 14:37:05','POS 10',-1.00,1.00,-66.00,-67.00),(199,1376,2,'2015-03-09 14:42:29','POS 1',-3.00,3.00,-48.00,-51.00),(200,1372,2,'2015-03-09 14:42:29','POS 1',-2.00,2.00,-103.00,-105.00),(201,1373,2,'2015-03-09 14:42:29','POS 1',-2.00,2.00,-29.00,-31.00),(202,1374,2,'2015-03-09 14:42:29','POS 1',-6.00,6.00,-67.00,-73.00),(203,1374,2,'2015-03-09 14:45:52','POS 1',-2.00,2.00,-73.00,-75.00),(204,1372,2,'2015-03-09 14:45:52','POS 1',-2.00,2.00,-105.00,-107.00),(205,1373,2,'2015-03-09 14:45:52','POS 1',-1.00,1.00,-31.00,-32.00),(206,1376,2,'2015-03-09 14:45:52','POS 1',-1.00,1.00,-51.00,-52.00),(231,1374,2,'2015-03-09 14:48:40','POS 7',-1.00,1.00,-75.00,-76.00),(232,1376,2,'2015-03-09 14:48:40','POS 7',-1.00,1.00,-52.00,-53.00),(233,1372,2,'2015-03-09 14:48:40','POS 7',-4.00,4.00,-107.00,-111.00),(234,1373,2,'2015-03-09 14:48:40','POS 7',-1.00,1.00,-32.00,-33.00),(235,1374,2,'2015-03-09 14:48:45','POS 8',-1.00,1.00,-76.00,-77.00),(236,1376,2,'2015-03-09 14:48:45','POS 8',-1.00,1.00,-53.00,-54.00),(237,1372,2,'2015-03-09 14:48:45','POS 8',-4.00,4.00,-111.00,-115.00),(238,1373,2,'2015-03-09 14:48:45','POS 8',-1.00,1.00,-33.00,-34.00),(239,1374,2,'2015-03-09 14:49:41','POS 1',-1.00,1.00,-77.00,-78.00),(240,1376,2,'2015-03-09 14:49:41','POS 1',-1.00,1.00,-54.00,-55.00),(241,1372,2,'2015-03-09 14:49:41','POS 1',-4.00,4.00,-115.00,-119.00),(242,1373,2,'2015-03-09 14:49:41','POS 1',-1.00,1.00,-34.00,-35.00),(243,1374,2,'2015-03-09 14:50:34','POS 2',-1.00,1.00,-78.00,-79.00),(244,1376,2,'2015-03-09 14:50:34','POS 2',-1.00,1.00,-55.00,-56.00),(245,1372,2,'2015-03-09 14:50:34','POS 2',-4.00,4.00,-119.00,-123.00),(246,1373,2,'2015-03-09 14:50:34','POS 2',-1.00,1.00,-35.00,-36.00),(247,1374,2,'2015-03-13 15:34:54','POS 3',-1.00,1.00,-79.00,-80.00),(248,1376,2,'2015-03-13 15:34:54','POS 3',-1.00,1.00,-56.00,-57.00),(249,1372,2,'2015-03-13 15:34:54','POS 3',-1.00,1.00,-123.00,-124.00),(250,1374,2,'2015-03-13 21:28:40','POS 4',-1.00,1.00,-80.00,-81.00),(251,1372,2,'2015-03-13 21:28:40','POS 4',-1.00,1.00,-124.00,-125.00),(252,1375,2,'2015-03-13 21:39:48','POS 1',-1.00,1.00,0.00,-1.00),(253,1374,2,'2015-03-13 21:39:48','POS 1',-1.00,1.00,-81.00,-82.00),(254,1372,2,'2015-03-13 21:39:48','POS 1',-1.00,1.00,-125.00,-126.00),(255,1376,2,'2015-03-13 21:39:48','POS 1',-1.00,1.00,-57.00,-58.00),(256,1373,2,'2015-03-13 21:39:48','POS 1',-1.00,1.00,-36.00,-37.00),(257,1374,2,'2015-03-13 21:44:43','POS 2',-1.00,1.00,-82.00,-83.00),(258,1376,2,'2015-03-13 21:44:43','POS 2',-1.00,1.00,-58.00,-59.00),(259,1372,2,'2015-03-13 21:44:43','POS 2',-1.00,1.00,-126.00,-127.00),(260,1373,2,'2015-03-13 21:44:43','POS 2',-1.00,1.00,-37.00,-38.00),(261,1374,2,'2015-03-19 12:48:53','POS 3',-1.00,1.00,-83.00,-84.00),(262,1373,2,'2015-03-19 12:48:53','POS 3',-1.00,1.00,-38.00,-39.00),(263,1372,2,'2015-03-19 12:48:53','POS 3',-1.00,1.00,-127.00,-128.00),(264,1377,2,'2015-03-19 12:48:53','POS 3',-2.00,2.00,0.00,-2.00),(265,1374,2,'2015-03-19 12:50:40','POS 4',-1.00,1.00,-84.00,-85.00),(266,1376,2,'2015-03-19 12:50:40','POS 4',-1.00,1.00,-59.00,-60.00),(267,1373,2,'2015-03-19 12:50:40','POS 4',-1.00,1.00,-39.00,-40.00),(268,1377,2,'2015-03-19 12:50:40','POS 4',-1.00,1.00,-2.00,-3.00),(279,1374,2,'2015-03-20 21:56:22','POS 10',-2.00,2.00,-85.00,-87.00),(280,1376,2,'2015-03-20 21:56:22','POS 10',-1.00,1.00,-60.00,-61.00),(281,1373,2,'2015-03-20 21:56:22','POS 10',-1.00,1.00,-40.00,-41.00),(282,1377,2,'2015-03-20 21:56:22','POS 10',-1.00,1.00,-3.00,-4.00),(332,1373,2,'2015-03-21 06:06:12','Change Sale 10',1.00,NULL,-41.00,-40.00),(333,1374,2,'2015-03-21 06:06:12','Change Sale 10',2.00,NULL,-87.00,-85.00),(334,1376,2,'2015-03-21 06:06:12','Change Sale 10',1.00,NULL,-61.00,-60.00),(335,1377,2,'2015-03-21 06:06:12','Change Sale 10',1.00,NULL,-4.00,-3.00),(339,1373,2,'2015-03-21 06:06:12','POS 10',-1.00,1.00,-40.00,-41.00),(340,1374,2,'2015-03-21 06:06:12','POS 10',-2.00,2.00,-85.00,-87.00),(341,1376,2,'2015-03-21 06:06:12','POS 10',-1.00,1.00,-60.00,-61.00),(342,1377,2,'2015-03-21 06:06:12','POS 10',-1.00,1.00,-3.00,-4.00),(343,1373,2,'2015-03-21 06:13:16','Change Sale 10',1.00,NULL,-41.00,-40.00),(344,1374,2,'2015-03-21 06:13:16','Change Sale 10',2.00,NULL,-87.00,-85.00),(345,1376,2,'2015-03-21 06:13:16','Change Sale 10',1.00,NULL,-61.00,-60.00),(346,1377,2,'2015-03-21 06:13:16','Change Sale 10',1.00,NULL,-4.00,-3.00),(350,1374,2,'2015-03-21 06:13:17','POS 10',-2.00,2.00,-85.00,-87.00),(351,1376,2,'2015-03-21 06:13:17','POS 10',-1.00,1.00,-60.00,-61.00),(352,1377,2,'2015-03-21 06:13:17','POS 10',-1.00,1.00,-3.00,-4.00),(353,1372,2,'2015-03-22 06:32:11','POS 11',-5.00,5.00,-128.00,-133.00),(354,1373,2,'2015-03-22 06:32:11','POS 11',-1.00,1.00,-40.00,-41.00),(355,1377,2,'2015-03-22 06:32:11','POS 11',-2.00,2.00,-4.00,-6.00),(356,1374,2,'2015-03-22 06:32:11','POS 11',-1.00,1.00,-87.00,-88.00),(357,1376,2,'2015-03-22 06:32:11','POS 11',-1.00,1.00,-61.00,-62.00),(358,1378,2,'2015-03-22 06:44:35','POS 12',-1.00,1.00,0.00,-1.00),(359,1380,2,'2015-03-22 06:44:35','POS 12',-1.00,1.00,0.00,-1.00),(360,1379,2,'2015-03-22 06:44:35','POS 12',-1.00,1.00,0.00,-1.00),(361,1374,2,'2015-03-22 06:44:35','POS 12',-1.00,1.00,-88.00,-89.00),(362,1376,2,'2015-03-22 06:44:35','POS 12',-1.00,1.00,-62.00,-63.00),(363,1372,2,'2015-03-22 06:44:35','POS 12',-1.00,1.00,-133.00,-134.00),(364,1373,2,'2015-03-22 06:44:35','POS 12',-1.00,1.00,-41.00,-42.00),(365,1377,2,'2015-03-22 06:44:35','POS 12',-1.00,1.00,-6.00,-7.00),(366,1375,2,'2015-03-22 06:44:35','POS 12',-1.00,1.00,-1.00,-2.00),(367,1381,2,'2015-03-23 20:44:37','POS 13',-1.00,1.00,0.00,-1.00),(368,1382,2,'2015-03-23 20:44:37','POS 13',-1.00,1.00,0.00,-1.00),(369,1,2,'2015-04-09 01:27:00','POS 14',-1.00,1.00,0.00,-1.00),(370,2,2,'2015-04-09 01:27:00','POS 14',-1.00,1.00,0.00,-1.00),(371,4,2,'2015-04-09 01:27:00','POS 14',-1.00,1.00,0.00,-1.00),(372,3,2,'2015-04-09 01:27:00','POS 14',-1.00,1.00,0.00,-1.00),(373,5,2,'2015-04-09 01:27:00','POS 14',-1.00,1.00,0.00,-1.00),(374,1,2,'2015-04-17 04:26:28','POS 15',-1.00,1.00,-1.00,-2.00),(375,2,2,'2015-04-17 04:26:28','POS 15',-1.00,1.00,-1.00,-2.00),(376,4,2,'2015-04-17 04:26:28','POS 15',-1.00,1.00,-1.00,-2.00),(377,5,2,'2015-04-17 04:26:28','POS 15',-1.00,1.00,-1.00,-2.00);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `item_number` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `isbn` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `cost_price` double(15,4) DEFAULT NULL,
  `unit_price` double(15,4) DEFAULT NULL,
  `quantity` double(15,2) NOT NULL,
  `reorder_level` double(15,2) DEFAULT NULL,
  `location` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `allow_alt_description` tinyint(1) DEFAULT NULL,
  `is_serialized` tinyint(1) DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `deleted` tinyint(1) DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `is_expire` tinyint(4) DEFAULT '0',
  `count_interval` smallint(6) DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_currency_code` (`currency_code`),
  KEY `FK_item_category_id` (`category_id`),
  KEY `FK_item_supplier_id` (`supplier_id`),
  KEY `FK_item_pub_id` (`publisher_id`),
  KEY `FK_item_author_id` (`author_id`),
  CONSTRAINT `FK_item` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_item_author_id` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `FK_item_c_code` FOREIGN KEY (`currency_code`) REFERENCES `currency_type` (`code`),
  CONSTRAINT `FK_item_pub_id` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'rubber abc','0001','',2,3,2,'2015-04-03',1,NULL,10.0000,11.0000,-2.00,NULL,'',NULL,NULL,'',0,'2015-03-31 12:15:17','2015-04-22 13:00:05',0,NULL,'1'),(2,'rubber def',NULL,NULL,3,NULL,1,'1970-01-01',1,NULL,100.0000,116.0000,-2.00,NULL,'',NULL,NULL,'',0,'2015-03-31 12:17:41','2015-04-17 11:26:28',0,NULL,'1'),(3,'rubber kkk',NULL,'isbn kkk',3,NULL,1,'1970-01-01',1,NULL,100.0000,115.0000,-1.00,NULL,'',NULL,NULL,'',0,'2015-03-31 12:19:28','2015-04-09 08:27:00',0,NULL,'1'),(4,'rubber kki',NULL,'isbn kki',3,NULL,2,'1970-01-01',2,NULL,50.0000,55.0000,-2.00,NULL,'',NULL,NULL,'',0,'2015-03-31 12:21:22','2015-04-17 11:26:28',0,NULL,'1'),(5,'rubbish bin',NULL,'isbn bin',1,NULL,2,'1970-01-01',2,NULL,90.0000,103.5000,-2.00,NULL,'',NULL,NULL,'',0,'2015-03-31 12:25:23','2015-04-17 11:26:28',0,NULL,'1'),(6,'abc sign',NULL,'',3,2,2,'1970-01-01',NULL,NULL,10.0000,NULL,0.00,NULL,'',NULL,NULL,'',0,'2015-04-22 08:50:54','2015-04-22 08:50:54',0,NULL,'1'),(7,'note book','000','dkkkddk',3,1,2,'1970-01-01',2,NULL,10.0000,NULL,0.00,NULL,'',NULL,NULL,'',0,'2015-04-22 12:46:05','2015-04-22 12:46:05',0,NULL,'1'),(8,'Testing ',NULL,'121212',1,NULL,NULL,'1970-01-01',NULL,NULL,11.0000,0.0000,0.00,NULL,'',NULL,NULL,'',0,'2015-06-23 18:48:51','2015-06-23 18:48:51',0,NULL,'1'),(9,'tessss',NULL,'',1,NULL,NULL,'1970-01-01',NULL,NULL,13.0000,0.0000,0.00,NULL,'',NULL,NULL,'',0,'2015-06-23 18:49:28','2015-06-23 18:49:28',0,NULL,'1');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_count_schedule`
--

DROP TABLE IF EXISTS `item_count_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_count_schedule` (
  `item_id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(15,2) DEFAULT NULL,
  `first_count_date` datetime DEFAULT NULL,
  `next_count_date` datetime DEFAULT NULL,
  `count_interval` smallint(6) DEFAULT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_id` int(11) DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_count_schedule`
--

LOCK TABLES `item_count_schedule` WRITE;
/*!40000 ALTER TABLE `item_count_schedule` DISABLE KEYS */;
INSERT INTO `item_count_schedule` VALUES (1372,'Fan Hatari Medium',0.00,'2015-01-28 21:27:09',NULL,NULL,'2015-03-01 22:38:08',2,NULL),(1373,'Kapa Viva Khmer',0.00,'2015-01-28 21:28:01',NULL,NULL,'2015-01-28 21:28:01',2,NULL),(1374,'A4 paper',-85.00,'2015-01-31 13:52:57',NULL,NULL,'2015-03-20 19:16:43',2,NULL),(1375,'Dey Sor',0.00,'2015-01-31 13:53:25',NULL,NULL,'2015-03-01 22:37:30',2,NULL),(1376,'Apirin',0.00,'2015-03-01 22:43:16',NULL,NULL,'2015-03-02 12:17:37',2,NULL),(1377,'USA Product',0.00,'2015-03-14 20:45:08',NULL,NULL,'2015-03-14 20:45:08',2,NULL),(1378,'Bath Towel',0.00,'2015-03-22 06:42:13',NULL,NULL,'2015-03-22 06:42:13',2,NULL),(1379,'Hand Towel',0.00,'2015-03-22 06:42:45',NULL,NULL,'2015-03-22 06:42:45',2,NULL),(1380,'Bathmat',0.00,'2015-03-22 06:43:09',NULL,NULL,'2015-03-22 06:43:09',2,NULL);
/*!40000 ALTER TABLE `item_count_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_count_schedule_dt`
--

DROP TABLE IF EXISTS `item_count_schedule_dt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_count_schedule_dt` (
  `item_id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(15,2) DEFAULT NULL,
  `first_count_date` datetime DEFAULT NULL,
  `next_count_date` datetime DEFAULT NULL,
  `count_interval` smallint(6) DEFAULT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_id` int(11) DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_count_schedule_dt`
--

LOCK TABLES `item_count_schedule_dt` WRITE;
/*!40000 ALTER TABLE `item_count_schedule_dt` DISABLE KEYS */;
INSERT INTO `item_count_schedule_dt` VALUES (1372,'Fan Hatari Medium',0.00,'2015-01-28 21:27:09',NULL,NULL,'2015-01-28 21:27:09',38,'CU ITEM'),(1373,'Kapa Viva Khmer',0.00,'2015-01-28 21:28:01',NULL,NULL,'2015-01-28 21:28:01',38,'CU ITEM'),(1374,'A4 paper',0.00,'2015-01-31 13:52:57',NULL,NULL,'2015-01-31 13:52:57',38,'CU ITEM'),(1375,'Dey Sor',0.00,'2015-01-31 13:53:25',NULL,NULL,'2015-01-31 13:53:25',38,'CU ITEM'),(1375,'Dey Sor',0.00,'2015-01-31 13:53:25',NULL,NULL,'2015-03-01 22:37:30',38,'CU ITEM'),(1374,'A4 paper',0.00,'2015-01-31 13:52:57',NULL,NULL,'2015-03-01 22:37:49',38,'CU ITEM'),(1372,'Fan Hatari Medium',0.00,'2015-01-28 21:27:09',NULL,NULL,'2015-03-01 22:38:08',38,'CU ITEM'),(1376,'Apirin',0.00,'2015-03-01 22:43:16',NULL,NULL,'2015-03-01 22:43:16',38,'CU ITEM'),(1376,'Apirin',0.00,'2015-03-01 22:43:16',NULL,NULL,'2015-03-02 12:17:37',38,'CU ITEM'),(1374,'A4 paper',0.00,'2015-01-31 13:52:57',NULL,NULL,'2015-03-02 21:32:10',38,'CU ITEM'),(1377,'USA Product',0.00,'2015-03-14 20:45:08',NULL,NULL,'2015-03-14 20:45:08',38,'CU ITEM'),(1374,'A4 paper',-85.00,'2015-01-31 13:52:57',NULL,NULL,'2015-03-20 19:13:25',38,'CU ITEM'),(1374,'A4 paper',-85.00,'2015-01-31 13:52:57',NULL,NULL,'2015-03-20 19:14:06',38,'CU ITEM'),(1374,'A4 paper',-85.00,'2015-01-31 13:52:57',NULL,NULL,'2015-03-20 19:16:43',38,'CU ITEM'),(1378,'Bath Towel',0.00,'2015-03-22 06:42:13',NULL,NULL,'2015-03-22 06:42:13',38,'CU ITEM'),(1379,'Hand Towel',0.00,'2015-03-22 06:42:45',NULL,NULL,'2015-03-22 06:42:45',38,'CU ITEM'),(1380,'Bathmat',0.00,'2015-03-22 06:43:09',NULL,NULL,'2015-03-22 06:43:09',38,'CU ITEM');
/*!40000 ALTER TABLE `item_count_schedule_dt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_expire`
--

DROP TABLE IF EXISTS `item_expire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_expire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `mfd_date` date DEFAULT NULL,
  `expire_date` date NOT NULL,
  `quantity` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`,`item_id`,`expire_date`),
  UNIQUE KEY `item_expire` (`item_id`,`expire_date`),
  KEY `FK_item_expire_item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_expire`
--

LOCK TABLES `item_expire` WRITE;
/*!40000 ALTER TABLE `item_expire` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_expire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_expire_dt`
--

DROP TABLE IF EXISTS `item_expire_dt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_expire_dt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_expire_id` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `trans_qty` decimal(15,2) NOT NULL,
  `trans_comment` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_item_expire_dt` (`item_expire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_expire_dt`
--

LOCK TABLES `item_expire_dt` WRITE;
/*!40000 ALTER TABLE `item_expire_dt` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_expire_dt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_image`
--

DROP TABLE IF EXISTS `item_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `photo` blob NOT NULL,
  `thumbnail` blob,
  `filename` varchar(30) CHARACTER SET latin1 NOT NULL,
  `filetype` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `path` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `width` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `height` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_item_image_item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_image`
--

LOCK TABLES `item_image` WRITE;
/*!40000 ALTER TABLE `item_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_price`
--

DROP TABLE IF EXISTS `item_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `old_price` double(15,4) DEFAULT NULL,
  `new_price` double(15,4) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_item_price_item_id` (`item_id`),
  KEY `FK_item_price_emp_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_price`
--

LOCK TABLES `item_price` WRITE;
/*!40000 ALTER TABLE `item_price` DISABLE KEYS */;
INSERT INTO `item_price` VALUES (1,1375,2,200.0000,2.0000,'2015-03-01 22:37:30'),(2,1374,2,12.0000,10.0000,'2015-03-01 22:37:49'),(3,1372,2,250.0000,5.0000,'2015-03-01 22:38:08'),(4,1383,2,10.0000,0.0000,'2015-03-31 06:42:52');
/*!40000 ALTER TABLE `item_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_price_promo`
--

DROP TABLE IF EXISTS `item_price_promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_price_promo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `unit_price` double(15,4) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id_udx` (`item_id`),
  CONSTRAINT `FK_item_price_promo_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_price_promo`
--

LOCK TABLES `item_price_promo` WRITE;
/*!40000 ALTER TABLE `item_price_promo` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_price_promo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_price_promo_dt`
--

DROP TABLE IF EXISTS `item_price_promo_dt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_price_promo_dt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_price_promo_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_price` double(15,4) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_price_promo_dt`
--

LOCK TABLES `item_price_promo_dt` WRITE;
/*!40000 ALTER TABLE `item_price_promo_dt` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_price_promo_dt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_price_tier`
--

DROP TABLE IF EXISTS `item_price_tier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_price_tier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `price_tier_id` int(11) NOT NULL,
  `price` double(15,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`item_id`,`price_tier_id`),
  KEY `FK_item_price_tier_item_id` (`item_id`),
  KEY `FK_item_price_tier_id` (`price_tier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_price_tier`
--

LOCK TABLES `item_price_tier` WRITE;
/*!40000 ALTER TABLE `item_price_tier` DISABLE KEYS */;
INSERT INTO `item_price_tier` VALUES (1,1374,1,9.5000),(2,1374,2,9.6000),(3,1382,1,14.0000),(4,1383,1,115.0000),(5,1383,2,120.0000),(6,1,1,11.0000),(7,1,2,11.5000),(8,1,3,12.0000),(9,2,1,110.0000),(10,2,2,115.0000),(11,2,3,120.0000),(12,3,1,115.0000),(13,3,2,120.0000),(14,3,3,125.0000),(15,4,1,55.0000),(16,4,2,57.5000),(17,4,3,60.0000),(18,5,1,99.0000),(19,5,2,103.5000),(20,5,3,108.0000),(21,6,1,11.5000),(22,6,2,12.0000),(23,6,3,12.5000),(24,7,1,12.0000),(25,7,2,13.0000),(26,7,3,14.0000),(27,7,4,13.0000),(28,8,1,12.6500),(29,8,2,13.2000),(30,8,3,13.7500),(31,9,1,15.6000),(32,9,2,16.9000),(33,9,3,18.2000),(34,9,4,16.9000);
/*!40000 ALTER TABLE `item_price_tier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_history`
--

DROP TABLE IF EXISTS `payment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `currency_code` int(11) DEFAULT NULL,
  `payment_amount` double(15,2) NOT NULL,
  `give_away` double DEFAULT '0',
  `date_paid` datetime DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_history`
--

LOCK TABLES `payment_history` WRITE;
/*!40000 ALTER TABLE `payment_history` DISABLE KEYS */;
INSERT INTO `payment_history` VALUES (1,4,3,10.00,0,'2015-03-09 14:50:34',NULL,2),(2,4,2,5.00,0,'2015-03-09 14:50:34',NULL,2),(3,4,3,5.00,0,'2015-03-13 15:37:53',NULL,2),(6,4,3,5.00,0,'2015-03-13 16:20:13',NULL,2),(7,4,3,5.00,0,'2015-03-13 16:20:15',NULL,2),(8,4,3,5.00,0,'2015-03-13 16:20:16',NULL,2),(9,4,3,5.00,0,'2015-03-13 16:20:16',NULL,2),(10,4,3,5.00,0,'2015-03-13 16:20:16',NULL,2),(11,4,3,5.00,0,'2015-03-13 16:20:16',NULL,2),(12,4,3,5.00,0,'2015-03-13 16:20:18',NULL,2),(13,4,3,5.00,0,'2015-03-13 16:20:19',NULL,2),(14,4,3,5.00,0,'2015-03-13 16:20:20',NULL,2),(15,4,3,5.00,0,'2015-03-13 16:20:20',NULL,2),(16,4,3,5.00,0,'2015-03-13 16:20:20',NULL,2),(17,4,3,5.00,0,'2015-03-13 16:20:20',NULL,2),(18,4,3,5.00,0,'2015-03-13 16:20:20',NULL,2),(19,4,3,5.00,0,'2015-03-13 16:20:21',NULL,2),(20,4,3,5.00,0,'2015-03-13 16:20:21',NULL,2),(21,4,3,10.00,0,'2015-03-13 21:28:40',NULL,2),(22,4,3,5.00,0,'2015-03-13 21:39:48',NULL,2),(23,4,2,12.00,0,'2015-03-13 21:39:48',NULL,2),(24,4,3,20.00,0,'2015-03-13 21:44:43',NULL,2),(25,4,2,40.00,0,'2015-03-13 21:44:43',NULL,2),(26,4,1,2.00,0,'2015-03-19 12:48:53',NULL,2),(27,4,1,2.00,0,'2015-03-19 12:50:40',NULL,2),(28,4,3,20.00,0,'2015-03-19 12:50:40',NULL,2),(29,9,2,0.00,0,'2015-03-23 20:44:37',NULL,2),(30,9,3,3.00,0,'2015-03-23 20:44:37',NULL,2),(31,5,2,0.00,0,'2015-04-17 11:26:28',NULL,2);
/*!40000 ALTER TABLE `payment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_tier`
--

DROP TABLE IF EXISTS `price_tier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_tier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tier_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_tier`
--

LOCK TABLES `price_tier` WRITE;
/*!40000 ALTER TABLE `price_tier` DISABLE KEYS */;
INSERT INTO `price_tier` VALUES (1,'លក់ដុំ','2015-03-20 13:08:53','1'),(2,'អង្គការ','2015-03-20 13:09:50','1'),(3,'ក្រុមហ៏ុន','2015-03-31 06:52:02','1'),(4,'ដេញ','2015-04-17 11:33:17','1');
/*!40000 ALTER TABLE `price_tier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profit_margin`
--

DROP TABLE IF EXISTS `profit_margin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profit_margin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profit_margin`
--

LOCK TABLES `profit_margin` WRITE;
/*!40000 ALTER TABLE `profit_margin` DISABLE KEYS */;
INSERT INTO `profit_margin` VALUES (5,'margin1',NULL,'2015-04-17 12:19:04',2),(6,'margin2','2015-03-28 06:15:57','2015-03-31 06:52:20',2);
/*!40000 ALTER TABLE `profit_margin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profit_price_tier`
--

DROP TABLE IF EXISTS `profit_price_tier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profit_price_tier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profit_margin_id` int(11) NOT NULL,
  `price_tier_id` int(11) NOT NULL,
  `profit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profit_price_tier`
--

LOCK TABLES `profit_price_tier` WRITE;
/*!40000 ALTER TABLE `profit_price_tier` DISABLE KEYS */;
INSERT INTO `profit_price_tier` VALUES (1,5,1,20),(2,5,2,30),(3,6,1,15),(4,6,2,20),(5,6,3,25),(6,5,3,40),(7,5,4,30);
/*!40000 ALTER TABLE `profit_price_tier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_tel` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Lux Sok',NULL,NULL,NULL,NULL),(2,'nana',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_user`
--

DROP TABLE IF EXISTS `rbac_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) CHARACTER SET utf8 NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `user_password` varchar(128) CHARACTER SET utf8 NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `date_entered` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_indx` (`user_name`),
  KEY `FK_rbac_user_group_id` (`group_id`),
  KEY `FK_rbac_user_employee_id` (`employee_id`),
  CONSTRAINT `FK_rbac_user_emp_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_user`
--

LOCK TABLES `rbac_user` WRITE;
/*!40000 ALTER TABLE `rbac_user` DISABLE KEYS */;
INSERT INTO `rbac_user` VALUES (2,'admin',NULL,1,'$2a$08$6Bpd5qGSPhB5dehzcrje4eYbfeTmxKI6WI8AgnamWSJyC4nAYNES6',0,1,NULL,'2014-02-15 11:31:55',NULL),(3,'super',NULL,2,'$2a$08$J7IBftBeORzk4j8mY0nk0OBykvV3iXA1DEMOhvHMhewy.93gVWPCm',0,1,'2013-10-10 09:44:04','2015-01-18 14:36:20',NULL);
/*!40000 ALTER TABLE `rbac_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiving`
--

DROP TABLE IF EXISTS `receiving`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receiving` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receive_time` datetime NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `sub_total` double(15,4) DEFAULT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `remark` text CHARACTER SET utf8,
  `discount_amount` decimal(15,4) DEFAULT NULL,
  `discount_type` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sale_emp_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiving`
--

LOCK TABLES `receiving` WRITE;
/*!40000 ALTER TABLE `receiving` DISABLE KEYS */;
/*!40000 ALTER TABLE `receiving` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiving_item`
--

DROP TABLE IF EXISTS `receiving_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receiving_item` (
  `receive_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` text CHARACTER SET utf8,
  `line` int(11) DEFAULT NULL,
  `quantity` double(15,2) DEFAULT NULL,
  `cost_price` double(15,4) DEFAULT NULL,
  `unit_price` double(15,4) DEFAULT NULL,
  `price` double(15,4) DEFAULT NULL,
  `discount_amount` double(15,2) DEFAULT NULL,
  `discount_type` varchar(2) CHARACTER SET utf8 DEFAULT '%',
  PRIMARY KEY (`receive_id`,`item_id`),
  KEY `FK_sale_item_item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiving_item`
--

LOCK TABLES `receiving_item` WRITE;
/*!40000 ALTER TABLE `receiving_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `receiving_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_time` datetime NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `sub_total` decimal(15,4) DEFAULT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `remark` text CHARACTER SET utf8,
  `discount_amount` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sale_emp_id` (`employee_id`),
  KEY `FK_sale_client_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,'2015-03-13 21:39:48',4,2,0.0000,'','1',NULL,0.00,'%'),(2,'2015-03-13 21:44:43',4,2,0.0000,'','1',NULL,0.00,'%'),(3,'2015-03-19 12:48:52',4,2,0.0000,'','1',NULL,0.00,'%'),(4,'2015-03-19 12:50:40',4,2,0.0000,'','1',NULL,0.00,'%'),(10,'2015-03-20 21:56:22',4,2,0.0000,'','2',NULL,0.00,'%'),(11,'2015-03-22 06:32:10',5,2,0.0000,'','2',NULL,0.00,'%'),(12,'2015-03-22 06:44:35',5,2,0.0000,'','2',NULL,0.00,'%'),(13,'2015-03-23 20:44:36',9,2,0.0000,'','1',NULL,0.00,'%'),(14,'2015-04-09 08:27:00',4,2,0.0000,'','2',NULL,0.00,'%'),(15,'2015-04-17 11:26:28',5,2,0.0000,'','1',NULL,0.00,'%');
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_item`
--

DROP TABLE IF EXISTS `sale_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_item` (
  `sale_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `currency_code` int(11) NOT NULL,
  `description` text CHARACTER SET utf8,
  `line` int(11) DEFAULT NULL,
  `quantity` double(15,2) DEFAULT NULL,
  `cost_price` double(15,4) DEFAULT NULL,
  `unit_price` double(15,4) DEFAULT NULL,
  `price` double(15,4) DEFAULT NULL,
  `discount_amount` double(15,2) DEFAULT NULL,
  `discount_type` varchar(2) CHARACTER SET utf8 DEFAULT '%',
  PRIMARY KEY (`sale_id`,`item_id`),
  KEY `FK_sale_item_item_id` (`item_id`),
  CONSTRAINT `FK_sale_item_sale_id` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_item`
--

LOCK TABLES `sale_item` WRITE;
/*!40000 ALTER TABLE `sale_item` DISABLE KEYS */;
INSERT INTO `sale_item` VALUES (1,1372,3,NULL,1372,1.00,4.0000,5.0000,5.0000,0.00,'%'),(1,1373,2,NULL,1373,1.00,10.0000,20.0000,20.0000,0.00,'%'),(1,1374,3,NULL,1374,1.00,9.0000,10.0000,10.0000,0.00,'%'),(1,1375,2,NULL,1375,1.00,1.0000,2.0000,2.0000,0.00,'%'),(1,1376,2,NULL,1376,1.00,5.0000,10.0000,10.0000,0.00,'%'),(2,1372,3,NULL,1372,1.00,4.0000,5.0000,5.0000,0.00,'%'),(2,1373,2,NULL,1373,1.00,10.0000,20.0000,20.0000,0.00,'%'),(2,1374,3,NULL,1374,1.00,9.0000,10.0000,10.0000,0.00,'%'),(2,1376,2,NULL,1376,1.00,5.0000,10.0000,10.0000,0.00,'%'),(3,1372,3,NULL,1372,1.00,4.0000,5.0000,5.0000,0.00,'%'),(3,1373,2,NULL,1373,1.00,10.0000,20.0000,20.0000,0.00,'%'),(3,1374,3,NULL,1374,1.00,9.0000,10.0000,10.0000,0.00,'%'),(3,1377,1,NULL,1377,2.00,1.0000,2.0000,2.0000,0.00,'%'),(4,1373,2,NULL,1373,1.00,10.0000,20.0000,20.0000,0.00,'%'),(4,1374,3,NULL,1374,1.00,9.0000,10.0000,10.0000,0.00,'%'),(4,1376,2,NULL,1376,1.00,5.0000,10.0000,10.0000,0.00,'%'),(4,1377,1,NULL,1377,1.00,1.0000,2.0000,2.0000,0.00,'%'),(10,1374,3,NULL,1374,2.00,9.0000,10.0000,9.6000,0.00,'%'),(10,1376,2,NULL,1376,1.00,5.0000,10.0000,10.0000,0.00,'%'),(10,1377,1,NULL,1377,1.00,1.0000,2.0000,2.0000,0.00,'%'),(11,1372,3,NULL,1372,5.00,4.0000,5.0000,5.0000,0.00,'%'),(11,1373,2,NULL,1373,1.00,10.0000,20.0000,20.0000,0.00,'%'),(11,1374,3,NULL,1374,1.00,9.0000,10.0000,10.0000,0.00,'%'),(11,1376,2,NULL,1376,1.00,5.0000,10.0000,10.0000,0.00,'%'),(11,1377,1,NULL,1377,2.00,1.0000,2.0000,2.0000,0.00,'%'),(12,1372,3,NULL,1372,1.00,4.0000,5.0000,5.0000,0.00,'%'),(12,1373,2,NULL,1373,1.00,10.0000,20.0000,20.0000,0.00,'%'),(12,1374,3,NULL,1374,1.00,9.0000,10.0000,10.0000,0.00,'%'),(12,1375,2,NULL,1375,1.00,1.0000,2.0000,2.0000,0.00,'%'),(12,1376,2,NULL,1376,1.00,5.0000,10.0000,10.0000,0.00,'%'),(12,1377,1,NULL,1377,1.00,1.0000,2.0000,2.0000,0.00,'%'),(12,1378,1,NULL,1378,1.00,4.0000,5.0000,5.0000,0.00,'%'),(12,1379,2,NULL,1379,1.00,2.0000,3.0000,3.0000,0.00,'%'),(12,1380,3,NULL,1380,1.00,4.0000,5.0000,5.0000,0.00,'%'),(13,1381,3,NULL,1381,1.00,1.0000,2.0000,2.0000,0.00,'%'),(13,1382,3,NULL,1382,1.00,12.0000,15.0000,14.0000,0.00,'%'),(14,1,2,NULL,1,1.00,10.0000,11.0000,11.0000,0.00,'%'),(14,2,3,NULL,2,1.00,100.0000,116.0000,116.0000,0.00,'%'),(14,3,3,NULL,3,1.00,100.0000,115.0000,115.0000,0.00,'%'),(14,4,3,NULL,4,1.00,50.0000,55.0000,55.0000,0.00,'%'),(14,5,1,NULL,5,1.00,90.0000,103.5000,103.5000,0.00,'%'),(15,1,2,NULL,1,1.00,10.0000,11.0000,11.0000,0.00,'%'),(15,2,3,NULL,2,1.00,100.0000,116.0000,116.0000,0.00,'%'),(15,4,3,NULL,4,1.00,50.0000,55.0000,55.0000,0.00,'%'),(15,5,1,NULL,5,1.00,90.0000,103.5000,103.5000,0.00,'%');
/*!40000 ALTER TABLE `sale_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_item_log`
--

DROP TABLE IF EXISTS `sale_item_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_item_log` (
  `sale_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `currency_code` int(11) NOT NULL,
  `description` text CHARACTER SET utf8,
  `line` int(11) DEFAULT NULL,
  `quantity` double(15,2) DEFAULT NULL,
  `cost_price` double(15,4) DEFAULT NULL,
  `unit_price` double(15,4) DEFAULT NULL,
  `price` double(15,4) DEFAULT NULL,
  `discount_amount` double(15,2) DEFAULT NULL,
  `discount_type` varchar(2) CHARACTER SET utf8 DEFAULT '%',
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_item_log`
--

LOCK TABLES `sale_item_log` WRITE;
/*!40000 ALTER TABLE `sale_item_log` DISABLE KEYS */;
INSERT INTO `sale_item_log` VALUES (10,1373,2,NULL,1373,1.00,10.0000,20.0000,20.0000,0.00,'%',NULL),(10,1374,3,NULL,1374,2.00,9.0000,10.0000,9.6000,0.00,'%',NULL),(10,1376,2,NULL,1376,1.00,5.0000,10.0000,10.0000,0.00,'%',NULL),(10,1377,1,NULL,1377,1.00,1.0000,2.0000,2.0000,0.00,'%',NULL),(10,1373,2,NULL,1373,1.00,10.0000,20.0000,20.0000,0.00,'%','2015-03-21 06:13:16'),(10,1374,3,NULL,1374,2.00,9.0000,10.0000,9.6000,0.00,'%','2015-03-21 06:13:16'),(10,1376,2,NULL,1376,1.00,5.0000,10.0000,10.0000,0.00,'%','2015-03-21 06:13:16'),(10,1377,1,NULL,1377,1.00,1.0000,2.0000,2.0000,0.00,'%','2015-03-21 06:13:16');
/*!40000 ALTER TABLE `sale_item_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_payment`
--

DROP TABLE IF EXISTS `sale_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `currency_code` int(11) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `payment_type` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `payment_amount` double NOT NULL,
  `give_away` double DEFAULT '0',
  `date_paid` datetime DEFAULT NULL,
  `note` text CHARACTER SET utf8,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sale_payment_sale_id` (`sale_id`),
  KEY `FK_sale_payment_id` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_payment`
--

LOCK TABLES `sale_payment` WRITE;
/*!40000 ALTER TABLE `sale_payment` DISABLE KEYS */;
INSERT INTO `sale_payment` VALUES (1,1,3,22,'cash',5,0,'2015-03-13 21:39:48',NULL,'2015-03-13 21:39:48'),(2,1,2,23,'cash',12,0,'2015-03-13 21:39:48',NULL,'2015-03-13 21:39:48'),(3,1,3,24,'cash',10,0,'2015-03-13 21:44:43',NULL,'2015-03-13 21:44:43'),(4,2,3,24,'cash',10,0,'2015-03-13 21:44:43',NULL,'2015-03-13 21:44:43'),(5,1,2,25,'cash',20,0,'2015-03-13 21:44:43',NULL,'2015-03-13 21:44:43'),(6,2,2,25,'cash',20,0,'2015-03-13 21:44:43',NULL,'2015-03-13 21:44:43'),(7,3,1,26,'cash',2,0,'2015-03-19 12:48:53',NULL,'2015-03-19 12:48:53'),(8,3,1,27,'cash',2,0,'2015-03-19 12:50:40',NULL,'2015-03-19 12:50:40'),(9,2,3,28,'cash',5,0,'2015-03-19 12:50:40',NULL,'2015-03-19 12:50:40'),(10,3,3,28,'cash',15,0,'2015-03-19 12:50:40',NULL,'2015-03-19 12:50:40'),(11,13,3,30,'cash',3,0,'2015-03-23 20:44:37',NULL,'2015-03-23 20:44:37'),(12,11,2,31,'cash',0,0,'2015-04-17 11:26:28',NULL,'2015-04-17 11:26:28');
/*!40000 ALTER TABLE `sale_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_suspended`
--

DROP TABLE IF EXISTS `sale_suspended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_suspended` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_time` datetime NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `sub_total` double(15,4) DEFAULT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `remark` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  KEY `FK_sale_suspended_client_id` (`client_id`),
  KEY `FK_sale_suspended_emp_Id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_suspended`
--

LOCK TABLES `sale_suspended` WRITE;
/*!40000 ALTER TABLE `sale_suspended` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_suspended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_suspended_item`
--

DROP TABLE IF EXISTS `sale_suspended_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_suspended_item` (
  `sale_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` text CHARACTER SET utf8,
  `line` int(11) DEFAULT NULL,
  `quantity` double(15,2) DEFAULT NULL,
  `cost_price` double(15,4) DEFAULT NULL,
  `unit_price` double(15,4) DEFAULT NULL,
  `price` double(15,4) DEFAULT NULL,
  `discount_amount` double(15,2) DEFAULT NULL,
  `discount_type` varchar(2) CHARACTER SET utf8 DEFAULT '%',
  KEY `FK_sale_suspended_item_sale_id` (`sale_id`),
  KEY `FK_sale_suspended_item_item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_suspended_item`
--

LOCK TABLES `sale_suspended_item` WRITE;
/*!40000 ALTER TABLE `sale_suspended_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_suspended_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_suspended_payment`
--

DROP TABLE IF EXISTS `sale_suspended_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_suspended_payment` (
  `sale_id` int(11) NOT NULL,
  `payment_type` varchar(40) CHARACTER SET utf8 NOT NULL,
  `payment_amount` double NOT NULL,
  PRIMARY KEY (`sale_id`,`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_suspended_payment`
--

LOCK TABLES `sale_suspended_payment` WRITE;
/*!40000 ALTER TABLE `sale_suspended_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_suspended_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('g20e38v33t7gn65cgm4nvlanp4',1435062757,'59372d2028b3b63dad0f4ae5f5e0c748__isAdmin|b:0;employeeid|s:1:\"2\";userid|s:1:\"3\";emp_fullname|s:11:\"Super Super\";unique_id|s:13:\"5589441e637c8\";59372d2028b3b63dad0f4ae5f5e0c748__id|s:1:\"3\";59372d2028b3b63dad0f4ae5f5e0c748__name|s:5:\"super\";59372d2028b3b63dad0f4ae5f5e0c748__states|a:0:{}59372d2028b3b63dad0f4ae5f5e0c748archived|s:5:\"false\";59372d2028b3b63dad0f4ae5f5e0c748pageSize|i:10;');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT 'system',
  `key` varchar(255) CHARACTER SET utf8 NOT NULL,
  `value` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_key` (`category`,`key`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (58,'exchange_rate','USD2KHR','s:0:\"\";'),(59,'site','companyName','s:0:\"\";'),(60,'site','companyAddress','s:0:\"\";'),(61,'site','companyAddress1','s:0:\"\";'),(62,'site','companyPhone','s:0:\"\";'),(63,'site','currencySymbol','s:1:\"2\";'),(64,'site','altcurrencySymbol','s:1:\"2\";'),(65,'site','email','s:0:\"\";'),(66,'site','returnPolicy','s:0:\"\";'),(67,'system','language','s:2:\"en\";'),(68,'system','decimalPlace','s:1:\"2\";'),(69,'sale','saleCookie','s:1:\"0\";'),(70,'sale','receiptPrint','s:0:\"\";'),(71,'sale','receiptPrintDraftSale','s:0:\"\";'),(72,'sale','discount','s:6:\"hidden\";'),(73,'sale','disableConfirmation','s:0:\"\";'),(74,'receipt','printcompanyLogo','s:0:\"\";'),(75,'receipt','printcompanyName','s:0:\"\";'),(76,'receipt','printcompanyAddress','s:0:\"\";'),(77,'receipt','printcompanyAddress1','s:0:\"\";'),(78,'receipt','printcompanyPhone','s:0:\"\";'),(79,'receipt','printtransactionTime','s:0:\"\";'),(80,'receipt','printSignature','s:0:\"\";'),(81,'item','itemNumberPerPage','s:0:\"\";'),(82,'item','itemExpireDate','s:0:\"\";');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(60) CHARACTER SET utf8 NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `mobile_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `address1` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `address2` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `country_code` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `notes` text CHARACTER SET utf8,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_audit_logs`
--

DROP TABLE IF EXISTS `tbl_audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_audit_logs` (
  `unique_id` varbinary(30) DEFAULT NULL,
  `username` varchar(50) CHARACTER SET latin1 NOT NULL,
  `ipaddress` varchar(50) CHARACTER SET latin1 NOT NULL,
  `logtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `controller` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `action` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `details` text COLLATE utf8mb4_unicode_ci,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_audit_logs`
--

LOCK TABLES `tbl_audit_logs` WRITE;
/*!40000 ALTER TABLE `tbl_audit_logs` DISABLE KEYS */;
INSERT INTO `tbl_audit_logs` VALUES ('','Guest','192.168.10.1','2015-03-31 18:01:44','site','index','',0),('','Guest','192.168.10.1','2015-03-31 18:01:48','site','index','',0),('551a7e9f84291','super','192.168.10.1','2015-03-31 18:01:52','dashboard','view','',2),('551a7e9f84291','super','192.168.10.1','2015-03-31 18:01:55','salePayment','index','',2),('551a7e9f84291','super','192.168.10.1','2015-03-31 18:02:03','report','SaleInvoice','',2),('551a7e9f84291','super','192.168.10.1','2015-03-31 18:02:05','report','SaleInvoice','',2),('551a7e9f84291','super','192.168.10.1','2015-03-31 18:02:33','item','admin','',2),('','Guest','192.168.10.1','2015-03-31 18:02:53','site','index','',0),('','Guest','192.168.10.1','2015-03-31 18:03:36','site','index','',0),('551a7f0b7b29f','super','192.168.10.1','2015-03-31 18:03:39','dashboard','view','',2),('551a7f0b7b29f','super','192.168.10.1','2015-03-31 18:03:42','item','admin','',2),('551a7f0b7b29f','super','192.168.10.1','2015-03-31 18:03:43','item','createImage','',2),('551a7f0b7b29f','super','192.168.10.1','2015-03-31 18:04:16','profitMargin','admin','',2),('551a7f0b7b29f','super','192.168.10.1','2015-03-31 18:04:18','profitMargin','create','',2),('551a7f0b7b29f','super','192.168.10.1','2015-03-31 18:04:32','item','admin','',2),('551a7f0b7b29f','super','192.168.10.1','2015-03-31 18:04:34','item','createImage','',2),('551a7f0b7b29f','super','192.168.10.1','2015-03-31 18:05:11','item','createImage','',2),('551a7f0b7b29f','super','192.168.10.1','2015-03-31 18:05:18','item','f5pricetier','',2),('551a7f0b7b29f','super','192.168.10.1','2015-03-31 18:05:20','item','f5pricetier','',2),('551a7f0b7b29f','super','192.168.10.1','2015-03-31 18:05:21','item','f5pricetier','',2),('551a7f0b7b29f','super','192.168.10.1','2015-03-31 18:05:22','item','f5pricetier','',2),('','Guest','192.168.10.1','2015-03-31 18:06:33','site','index','',0),('','Guest','192.168.10.1','2015-04-01 11:19:16','site','index','',0),('','Guest','192.168.10.1','2015-04-01 13:58:18','site','index','',0),('551fb27431e3b','super','192.168.10.1','2015-04-04 09:44:23','dashboard','view','',2),('551fb27431e3b','super','192.168.10.1','2015-04-04 09:44:29','item','admin','',2),('551fb27431e3b','super','192.168.10.1','2015-04-04 09:44:30','salePayment','index','',2),('','Guest','192.168.10.1','2015-04-04 16:43:15','site','index','',0),('552014b9e5825','super','192.168.10.1','2015-04-04 16:43:43','dashboard','view','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:43:48','item','admin','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:43:50','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:45:57','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:03','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:05','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:06','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:06','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:06','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:07','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:07','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:08','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:09','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:10','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:10','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:10','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:10','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:11','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:11','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:11','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:11','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:11','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:11','salePayment','index','',2),('552014b9e5825','super','192.168.10.1','2015-04-04 16:46:13','site','about','',2),('','Guest','192.168.10.1','2015-04-04 16:57:48','site','index','',0),('','Guest','192.168.10.1','2015-04-04 16:57:52','site','index','',0),('5520253ca749a','super','192.168.10.1','2015-04-04 17:54:05','dashboard','view','',2),('5520253ca749a','super','192.168.10.1','2015-04-04 17:54:17','item','admin','',2),('55254476bd463','super','192.168.10.1','2015-04-08 15:08:40','dashboard','view',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:08:43','item','admin',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:08:47','item','createImage',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:09:08','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:09:10','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:09:12','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:09:13','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:09:14','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:10:28','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:10:29','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:10:30','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:10:31','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:10:32','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:10:32','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:10:33','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:10:34','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:10:35','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:10:36','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:10:37','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:10:38','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:10:39','item','f5pricetier',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:11:47','item','createImage',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:11:47','category','initCategory',NULL,2),('55254476bd463','super','192.168.10.1','2015-04-08 15:11:47','publisher','initPublisher',NULL,2),('55254c106f7d2','super','192.168.10.1','2015-04-08 15:41:04','item','createImage',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:25:38','dashboard','view',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:25:45','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:25:50','salePayment','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:25:53','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:25:54','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:25:54','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:25:55','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:25:57','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:25:57','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:25:57','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:25:59','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:25:59','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:00','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:00','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:01','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:02','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:03','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:06','wholeSale','SetPriceTier',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:13','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:16','wholeSale','cancelSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:18','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:23','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:27','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:33','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:39','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:40','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:41','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:42','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:42','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:42','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:44','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:44','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:45','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:45','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:46','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:47','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:49','request','suggestClient',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:49','request','suggestClient',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:49','request','suggestClient',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:51','site','error',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:53','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:55','request','suggestClient',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:55','request','suggestClient',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:55','request','suggestClient',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:26:57','wholeSale','selectCustomer',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:00','wholeSale','SuspendSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:01','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:03','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:08','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:14','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:17','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:19','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:23','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:25','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:35','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:37','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:38','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:40','wholeSale','cancelSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:42','item','createImage',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:44','item','admin',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:46','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:47','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:27:48','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:28:06','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:28:16','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:28:19','wholeSale','cancelSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:28:20','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:28:21','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:28:24','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:28:25','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:30:11','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:30:38','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:30:40','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:30:41','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:30:53','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:30:55','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:30:58','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:31:00','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:31:03','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:31:14','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:31:15','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:31:18','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:31:19','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:31:22','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:31:23','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:31:29','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:31:30','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:31:34','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:32:04','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:32:25','wholeSale','cancelSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:32:38','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:32:58','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:33:00','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:33:05','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:33:06','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:33:54','wholeSale','SetPriceTier',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:33:55','wholeSale','SetPriceTier',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:33:57','wholeSale','SetPriceTier',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:33:58','wholeSale','SetPriceTier',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:33:59','wholeSale','SetPriceTier',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:34:00','wholeSale','SetPriceTier',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:34:03','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:34:11','salePayment','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:34:22','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:34:34','wholeSale','DeleteItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:34:49','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:34:51','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:00','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:01','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:02','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:03','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:05','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:07','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:08','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:09','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:10','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:12','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:13','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:13','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:18','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:19','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:20','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:22','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:22','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:24','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:25','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:27','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:28','wholeSale','setCurrencyType',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:40','wholeSale','AddPayment',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:46','wholeSale','DeletePayment',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:36:49','wholeSale','AddPayment',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:37:36','wholeSale','DeletePayment',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:46:51','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:46:53','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:46:58','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:01','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:07','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:08','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:10','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:11','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:12','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:14','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:16','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:17','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:19','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:21','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:22','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:33','wholeSale','ListSuspendedSale',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:34','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:36','request','suggestClient',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:37','request','suggestClient',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:38','wholeSale','selectCustomer',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:47','wholeSale','removeCustomer',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:57','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:57','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:58','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:58','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:47:58','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:48:00','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:48:00','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:48:01','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:48:01','request','suggestItem',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:48:02','wholeSale','add',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:48:49','wholeSale','SetPriceTier',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:59:08','client','Create',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 01:59:20','wholeSale','index',NULL,2),('5525d5126ae85','super','192.168.10.1','2015-04-09 02:00:53','request','suggestItem',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:35','wholeSale','index',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:37','request','suggestItem',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:38','wholeSale','add',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:38','request','suggestItem',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:39','wholeSale','add',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:40','request','suggestItem',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:40','wholeSale','add',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:41','request','suggestItem',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:41','wholeSale','add',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:42','request','suggestItem',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:42','wholeSale','add',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:43','request','suggestItem',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:44','wholeSale','add',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:44','request','suggestItem',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:45','request','suggestItem',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:45','wholeSale','add',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:46','request','suggestItem',NULL,2),('5525e3d3287da','super','192.168.10.1','2015-04-09 02:28:47','wholeSale','add',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:31','dashboard','view',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:34','wholeSale','index',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:37','item','admin',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:37','item','admin',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:38','item','admin',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:40','item','createImage',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:46','wholeSale','index',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:48','salePayment','index',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:50','report','SaleInvoice',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:51','report','SaleItemSummary',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:53','report','itemExpiry',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:53','report','Inventory',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:53','report','SaleReportTab',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:54','report','StockCount',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:55','report','StockCount',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:45:56','report','StockCount',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:49:06','report','StockCount',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:49:10','report','ItemAsset',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:49:11','report','SaleInvoice',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:49:12','item','admin',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:49:22','item','createImage',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:49:28','wholeSale','index',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:49:30','wholeSale','ListSuspendedSale',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:49:31','wholeSale','index',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:49:33','wholeSale','ListSuspendedSale',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:49:34','wholeSale','index',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:49:35','wholeSale','ListSuspendedSale',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:49:37','wholeSale','index',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:49:39','wholeSale','ListSuspendedSale',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 05:50:29','dashboard','view',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 06:09:27','wholeSale','index',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 06:12:42','salePayment','index',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 06:12:46','request','suggestClient',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 06:12:50','site','error',NULL,2),('552611f9caf8c','super','192.168.10.1','2015-04-09 06:12:52','site','error',NULL,2),('5526186892e92','super','192.168.10.1','2015-04-09 06:12:56','dashboard','view',NULL,2),('5526186892e92','super','192.168.10.1','2015-04-09 06:12:58','salePayment','index',NULL,2),('5526186892e92','super','192.168.10.1','2015-04-09 06:36:46','salePayment','index',NULL,2),('55288ca5124f6','super','192.168.10.1','2015-04-11 02:53:26','dashboard','view',NULL,2),('55288ca5124f6','super','192.168.10.1','2015-04-11 02:53:30','salePayment','index',NULL,2),('55288ca5124f6','super','192.168.10.1','2015-04-11 02:53:38','request','suggestClient',NULL,2),('55288ca5124f6','super','192.168.10.1','2015-04-11 02:53:38','request','suggestClient',NULL,2),('55288ca5124f6','super','192.168.10.1','2015-04-11 02:53:38','request','suggestClient',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 02:54:52','dashboard','view',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 02:55:03','salePayment','index',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 02:55:05','request','suggestClient',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 02:55:06','request','suggestClient',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 02:55:06','request','suggestClient',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 02:58:28','site','error',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 02:58:44','site','error',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 02:59:13','site','error',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 02:59:32','site','error',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 02:59:35','site','error',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 02:59:44','site','error',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 03:00:00','site','error',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 03:00:45','site','error',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 03:00:46','site','error',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 03:01:38','site','error',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 03:01:39','site','error',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 03:03:34','site','error',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 03:03:35','site','error',NULL,2),('55288cfc5f7f3','super','192.168.10.1','2015-04-11 03:04:27','site','error',NULL,2),('55288f74aee60','super','192.168.10.1','2015-04-11 03:05:24','dashboard','view',NULL,2),('55288f74aee60','super','192.168.10.1','2015-04-11 03:05:26','salePayment','index',NULL,2),('55288f74aee60','super','192.168.10.1','2015-04-11 03:05:28','request','suggestClient',NULL,2),('55288f74aee60','super','192.168.10.1','2015-04-11 03:05:28','request','suggestClient',NULL,2),('55288f74aee60','super','192.168.10.1','2015-04-11 03:05:28','request','suggestClient',NULL,2),('55288f74aee60','super','192.168.10.1','2015-04-11 03:05:36','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:05:42','dashboard','view',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:05:44','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:05:46','request','suggestClient',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:05:46','request','suggestClient',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:05:46','request','suggestClient',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:05:47','request','suggestClient',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:05:47','request','suggestClient',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:09:06','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:11:03','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:11:41','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:12:07','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:12:09','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:12:26','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:12:54','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:13:33','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:13:34','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:13:42','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:13:44','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:13:56','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:15:14','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:17:57','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:18:00','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:18:22','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:18:24','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:18:44','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:18:46','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:19:33','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:20:14','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:20:49','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:20:51','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:21:14','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:21:14','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:21:38','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:21:41','request','suggestClient',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:21:42','request','suggestClient',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:21:42','request','suggestClient',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:21:43','salePayment','SelectCustomer',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:24:38','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:24:40','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:24:43','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:25:47','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:25:49','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:26:16','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:26:38','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:26:40','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:26:45','request','suggestClient',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:26:45','request','suggestClient',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:26:45','request','suggestClient',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:26:46','salePayment','SelectCustomer',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:26:51','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:26:53','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:27:23','salePayment','index',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:27:39','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:28:06','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:28:07','site','error',NULL,2),('55288f865ee47','super','192.168.10.1','2015-04-11 03:28:26','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 03:57:20','dashboard','view',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 03:57:49','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 03:57:51','request','suggestClient',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 03:57:51','request','suggestClient',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 03:57:51','request','suggestClient',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 03:57:52','request','suggestClient',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 03:57:52','request','suggestClient',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 03:57:53','request','suggestClient',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 03:58:09','site','error',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 03:58:59','site','error',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 03:59:07','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:06:56','wholeSale','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:06:58','request','suggestClient',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:06:58','request','suggestClient',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:06:58','request','suggestClient',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:06:59','wholeSale','selectCustomer',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:07:33','wholeSale','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:07:35','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:07:38','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:07:40','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:07:55','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:08:31','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:08:53','wholeSale','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:09:24','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:09:26','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:09:30','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:09:38','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:09:41','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:10:12','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:10:33','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:10:36','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:10:42','salePayment','index',NULL,2),('55289ba03fc9b','super','192.168.10.1','2015-04-11 04:10:55','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:24:52','dashboard','view',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:24:54','wholeSale','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:24:57','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:24:59','request','suggestClient',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:24:59','request','suggestClient',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:25:00','request','suggestClient',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:25:01','salePayment','SelectCustomer',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:26:24','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:26:25','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:28:18','salePayment','removeCustomer',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:29:13','request','suggestClient',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:29:13','request','suggestClient',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:29:13','request','suggestClient',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:29:14','salePayment','SelectCustomer',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:29:15','salePayment','removeCustomer',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:29:28','request','suggestItem',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:29:29','wholeSale','add',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:31:06','wholeSale','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:31:08','site','error',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:31:29','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:33:16','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:33:49','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:34:47','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:35:08','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:35:24','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:35:42','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:35:55','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:36:49','site','error',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:36:58','site','error',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:37:00','site','error',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:37:51','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:38:18','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:38:30','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:39:07','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:39:30','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:39:47','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:40:10','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:40:17','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:40:32','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:40:44','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:40:47','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:41:15','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:42:04','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:42:12','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:42:13','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:42:27','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:42:29','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:42:37','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:42:38','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:42:49','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:42:50','salePayment','index',NULL,2),('5528b023c374e','super','192.168.10.1','2015-04-11 05:43:17','salePayment','index',NULL,2),('5528dbb4e6cec','super','192.168.10.1','2015-04-11 08:30:45','dashboard','view',NULL,2),('5528dbb4e6cec','super','192.168.10.1','2015-04-11 08:30:47','salePayment','index',NULL,2),('5528dbb4e6cec','super','192.168.10.1','2015-04-11 08:30:50','site','error',NULL,2),('5528dbb4e6cec','super','192.168.10.1','2015-04-11 08:31:00','site','error',NULL,2),('5528dbb4e6cec','super','192.168.10.1','2015-04-11 08:37:26','salePayment','setCurrencyType',NULL,2),('5528dbb4e6cec','super','192.168.10.1','2015-04-11 08:37:29','salePayment','setCurrencyType',NULL,2),('5528dbb4e6cec','super','192.168.10.1','2015-04-11 08:37:31','salePayment','setCurrencyType',NULL,2),('5528dbb4e6cec','super','192.168.10.1','2015-04-11 08:37:37','salePayment','setCurrencyType',NULL,2),('5528dbb4e6cec','super','192.168.10.1','2015-04-11 08:38:17','salePayment','index',NULL,2),('5528dbb4e6cec','super','192.168.10.1','2015-04-11 08:38:20','salePayment','setCurrencyType',NULL,2),('5528dbb4e6cec','super','192.168.10.1','2015-04-11 08:38:24','salePayment','setCurrencyType',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:50:00','dashboard','view',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:50:03','item','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:50:06','item','createImage',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:50:10','item','f5pricetier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:50:11','item','f5pricetier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:50:14','item','createImage',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:50:17','item','f5pricetier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:51:28','item','Admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:51:32','item','createImage',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:51:39','salePayment','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:51:40','item','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:51:44','item','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:51:46','item','createImage',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:52:15','item','f5pricetier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:57:30','salePayment','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:57:32','wholeSale','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:57:35','wholeSale','ListSuspendedSale',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:57:38','wholeSale','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:58:48','wholeSale','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:58:50','wholeSale','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:58:52','wholeSale','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:59:01','priceTier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:59:25','item','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 06:59:29','priceTier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:02','wholeSale','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:04','wholeSale','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:06','wholeSale','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:07','wholeSale','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:07','wholeSale','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:10','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:12','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:13','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:14','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:15','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:16','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:18','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:21','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:22','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:23','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:24','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:26','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:27','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:28','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:29','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:31','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:32','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:34','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:35','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:40','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:41','wholeSale','SetPriceTier',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:06:42','wholeSale','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:08:47','item','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:08:49','item','createImage',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:08:56','item','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:09:02','profitMargin','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:09:07','profitMargin','update',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:09:17','profitMargin','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:10:19','priceTier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:10:20','profitMargin','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:10:23','supplier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:10:24','supplier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:10:27','supplier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:12:37','supplier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:12:41','publisher','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:12:42','supplier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:12:44','priceTier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:12:46','profitMargin','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:12:48','settings','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:12:50','supplier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:12:51','publisher','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:12:55','supplier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:12:57','publisher','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:14:20','publisher','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:14:23','publisher','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:15:31','publisher','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:15:34','publisher','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:15:36','publisher','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:15:39','publisher','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:15:40','supplier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:15:42','publisher','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:10','publisher','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:13','supplier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:14','employee','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:15','client','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:17','publisher','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:25','publisher','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:34','publisher','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:44','supplier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:45','employee','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:47','client','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:50','priceTier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:51','profitMargin','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:53','settings','index',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:55','profitMargin','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:56','priceTier','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:17:58','site','about',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:18:02','item','admin',NULL,2),('552a1596294ad','super','192.168.10.1','2015-04-12 07:18:03','dashboard','view',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:20:05','dashboard','view',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:20:12','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:23:33','item','createImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:23:58','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:24:03','item','UpdateImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:24:03','category','initCategory',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:24:03','publisher','initPublisher',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:24:07','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:24:08','item','UpdateImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:24:09','category','initCategory',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:24:09','publisher','initPublisher',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:24:12','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:24:14','item','UpdateImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:24:15','category','initCategory',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:24:15','publisher','initPublisher',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:24:52','item','f5pricetier',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:25:12','wholeSale','index',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:25:15','request','suggestItem',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:25:15','request','suggestItem',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:25:17','wholeSale','add',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:25:20','request','suggestItem',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:25:21','wholeSale','add',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:25:29','request','suggestItem',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:25:31','wholeSale','add',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:25:41','request','suggestItem',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:25:42','wholeSale','add',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:01','request','suggestClient',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:03','wholeSale','selectCustomer',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:21','wholeSale','AddPayment',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:28','wholeSale','completeSale',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:42','wholeSale','index',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:46','request','suggestItem',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:46','wholeSale','add',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:48','request','suggestItem',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:49','wholeSale','add',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:50','request','suggestItem',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:51','wholeSale','add',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:52','request','suggestItem',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:53','wholeSale','add',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:57','request','suggestClient',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:59','request','suggestClient',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:59','request','suggestClient',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:59','request','suggestClient',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:26:59','request','suggestClient',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:27:00','request','suggestClient',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:27:00','request','suggestClient',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:27:01','wholeSale','selectCustomer',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:32:38','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:32:40','item','createImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:32:52','priceTier','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:33:18','priceTier','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:33:20','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:33:22','item','createImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:34:23','wholeSale','index',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:36:58','wholeSale','setCurrencyType',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:37:21','wholeSale','AddPayment',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:37:32','wholeSale','DeletePayment',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:53:44','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:53:48','item','createImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:54:40','salePayment','index',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:54:44','request','suggestClient',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:54:44','request','suggestClient',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:54:46','request','suggestClient',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:54:46','salePayment','SelectCustomer',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:54:52','wholeSale','index',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:56:54','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:56:58','item','createImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 04:59:55','wholeSale','index',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:00:07','client','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:00:10','client','create',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:00:24','wholeSale','index',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:00:38','wholeSale','removeCustomer',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:00:40','client','Create',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:00:45','wholeSale','index',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:00:49','wholeSale','cancelSale',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:01:18','client','Create',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:01:36','wholeSale','index',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:01:55','wholeSale','SetPriceTier',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:01:59','wholeSale','SetPriceTier',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:02:03','client','update',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:02:09','wholeSale','index',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:02:18','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:02:48','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:02:55','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:03:02','item','UpdateImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:03:03','category','initCategory',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:03:03','publisher','initPublisher',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:03:14','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:03:26','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:03:39','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:03:51','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:04:01','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:04:42','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:04:46','item','UpdateImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:04:46','item','UpdateImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:04:46','publisher','initPublisher',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:04:46','category','initCategory',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:04:53','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:17:06','item','createImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:17:18','profitMargin','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:17:23','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:17:25','item','createImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:17:47','profitMargin','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:17:51','profitMargin','create',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:18:06','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:18:08','item','createImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:18:29','profitMargin','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:18:32','profitMargin','create',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:18:40','profitMargin','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:18:47','profitMargin','update',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:19:04','profitMargin','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:19:18','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:19:21','item','createImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:23:00','item','f5pricetier',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:27:48','priceTier','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:30:28','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:30:31','item','createImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:30:56','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:30:58','item','createImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:31:59','priceTier','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:32:01','profitMargin','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:32:04','settings','index',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:32:10','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:32:15','item','createImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:32:39','item','f5pricetier',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:32:55','priceTier','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:32:57','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:32:59','item','createImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:33:31','profitMargin','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:33:32','priceTier','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:33:43','item','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:33:47','item','UpdateImage',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:33:48','category','initCategory',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:33:48','publisher','initPublisher',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:34:14','profitMargin','admin',NULL,2),('553089f41aacc','super','192.168.10.1','2015-04-17 05:34:17','profitMargin','create',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:12:23','dashboard','view',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:13:52','item','admin',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:16:30','item','admin',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:16:34','item','UpdateImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:16:34','category','initCategory',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:16:35','publisher','initPublisher',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:17:10','settings','index',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:17:16','settings','index',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:17:17','item','admin',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:17:19','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:18:13','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:20:20','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:20:24','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:20:53','client','admin',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:20:54','publisher','admin',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:20:55','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:21:12','author','admin',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:21:16','item','admin',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:21:20','item','admin',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:30:46','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:30:55','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:30:58','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:30:59','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:30:59','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:31:01','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:31:01','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:31:01','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:31:01','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:31:02','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:31:08','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:31:09','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:31:09','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:31:09','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:31:28','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:31:30','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:31:31','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:31:31','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:31:50','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:32:19','item','f5pricetier',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:32:21','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:33:01','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:33:33','item','f5pricetier',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:33:38','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:33:39','publisher','initPublisher',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:38:13','item','f5pricetier',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:38:14','item','f5pricetier',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:38:20','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:38:20','publisher','initPublisher',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:43:04','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:43:18','item','admin',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:43:20','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:43:33','item','f5pricetier',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:43:41','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:43:48','item','admin',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:45:59','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:46:08','item','f5pricetier',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:46:17','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:46:18','publisher','initPublisher',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:50:14','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:50:15','publisher','initPublisher',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:50:15','site','error',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:50:37','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:50:38','publisher','initPublisher',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:50:38','author','initAuthor',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:50:43','item','createImage',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:50:44','publisher','initPublisher',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:50:44','author','initAuthor',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:50:48','item','f5pricetier',NULL,2),('5536f57579cbe','super','192.168.10.1','2015-04-22 01:50:54','item','createImage',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:44:43','dashboard','view',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:44:46','item','admin',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:44:52','item','createImage',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:45:10','item','f5pricetier',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:46:05','item','createImage',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:46:42','item','admin',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:46:45','item','UpdateImage',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:46:45','category','initCategory',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:46:45','publisher','initPublisher',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:46:46','author','initAuthor',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:47:33','item','admin',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:47:38','item','admin',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:48:48','item','admin',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:56:41','item','createImage',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:58:51','item','admin',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:58:53','item','UpdateImage',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:58:54','category','initCategory',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:58:54','publisher','initPublisher',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:58:58','item','admin',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:59:01','item','UpdateImage',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:59:02','category','initCategory',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:59:02','publisher','initPublisher',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 05:59:02','author','initAuthor',NULL,2),('55373549b5eda','super','192.168.10.1','2015-04-22 06:00:05','item','admin',NULL,2),('553dc3867ab58','super','192.168.10.1','2015-04-27 05:05:12','dashboard','view',NULL,2),('553dd25d102f7','super','192.168.10.1','2015-04-27 06:08:29','dashboard','view',NULL,2),('55433befde476','super','192.168.10.1','2015-05-01 08:40:16','dashboard','view',NULL,2),('55433befde476','super','192.168.10.1','2015-05-01 08:40:20','wholeSale','index',NULL,2),('55433befde476','super','192.168.10.1','2015-05-01 08:40:21','request','suggestItem',NULL,2),('55433befde476','super','192.168.10.1','2015-05-01 08:40:22','wholeSale','add',NULL,2),('55433befde476','super','192.168.10.1','2015-05-01 08:40:25','rbacUser','Update',NULL,2),('557b9857e4fc7','super','192.168.10.1','2015-06-13 02:41:28','dashboard','view',NULL,2),('557b9857e4fc7','super','192.168.10.1','2015-06-13 02:41:32','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:33:51','dashboard','view',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:33:55','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:35:40','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:36:29','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:38:11','site','error',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:40:24','site','error',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:41:05','site','error',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:41:28','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:41:31','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:41:32','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:41:33','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:41:35','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:41:36','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:28','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:30','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:31','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:31','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:32','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:33','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:33','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:34','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:34','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:35','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:37','item','delete',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:37','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:39','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:39','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:42','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:42','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:48','item','delete',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:48','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:51','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:51','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:52','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:53','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:42:53','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:43:02','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:43:05','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:43:10','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:43:11','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:43:12','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:44:33','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:44:34','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:44:36','item','createImage',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:17','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:23','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:24','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:26','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:37','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:39','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:45','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:47','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:48','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:49','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:50','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:52','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:53','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:54','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:55','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:57','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:47:58','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:48:03','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:48:23','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:48:24','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:48:52','item','createImage',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:49:18','item','createImage',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:49:27','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 11:49:29','item','createImage',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 12:04:00','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 12:04:06','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 12:04:07','item','f5pricetier',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 12:04:46','settings','index',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 12:06:48','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 12:06:51','item','createImage',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 12:06:57','item','createImage',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 12:07:12','item','createImage',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 12:08:34','item','admin',NULL,2),('5589441e637c8','super','192.168.10.1','2015-06-23 12:08:37','item','admin',NULL,2);
/*!40000 ALTER TABLE `tbl_audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `trans_amount` decimal(15,4) DEFAULT NULL,
  `trans_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_datetime` datetime DEFAULT NULL,
  `trans_status` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `note` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `FK_transactions_account_id` (`account_id`),
  KEY `FK_transactions_employee_id` (`employee_id`),
  CONSTRAINT `FK_transactions_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `FK_transactions_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_log` (
  `unique_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sessoin_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO `user_log` VALUES ('54c8ef3a87fc3','s6etb0k6p3kkfr32iem7auku61',3,2,'2015-01-28 21:16:26',NULL,'2015-01-28 21:28:28',1,'2015-01-28 21:16:26','super'),('54c9bf28a742c','pu1d54geb2c9jfusd6k5difmk3',3,2,'2015-01-29 12:03:36',NULL,'2015-01-29 12:07:30',1,'2015-01-29 12:03:36','super'),('54c9db39bf6e7','831uqi3l0rnemutsg6mjfspsf1',3,2,'2015-01-29 14:03:21',NULL,'2015-01-29 14:50:45',1,'2015-01-29 14:03:21','super'),('54cc6d6566b03','qsq6ijushee8tnrtmvulsijgh7',3,2,'2015-01-31 12:51:33',NULL,'2015-01-31 14:34:04',1,'2015-01-31 12:51:33','super'),('54cd9c1ea168c','68a4aukemuvbuq0e85b37e7jv4',3,2,'2015-02-01 10:23:10',NULL,'2015-02-01 11:11:05',1,'2015-02-01 10:23:10','super'),('54cdc0e159e80','4v1k9g62i9diakjsn9ij6jbj36',3,2,'2015-02-01 13:00:01',NULL,'2015-02-01 13:00:08',1,'2015-02-01 13:00:01','super'),('54f271c980d6b','0akkecceo7cd00eveqr19oedv3',3,2,'2015-03-01 08:56:25','2015-03-01 09:11:37','2015-03-01 09:11:33',0,'2015-03-01 09:11:37','super'),('54f275627302e','6vke970irohb709ih4aj20pr13',2,1,'2015-03-01 09:11:46','2015-03-01 09:12:01','2015-03-01 09:12:00',0,'2015-03-01 09:12:01','admin'),('54f275742d574','01hnr20jvn4l9s7bpa9snfjv03',3,2,'2015-03-01 09:12:04',NULL,'2015-03-01 09:19:19',1,'2015-03-01 09:12:04','super'),('54f284790800f','ui09nojqbula78rqds6994sns5',3,2,'2015-03-01 10:16:09',NULL,'2015-03-01 11:22:03',1,'2015-03-01 10:16:09','super'),('54f2a16d0d651','pae0u3cis45250b3ea7qb7mgu3',3,2,'2015-03-01 12:19:41',NULL,'2015-03-01 12:53:38',1,'2015-03-01 12:19:41','super'),('54f2bdb8cc53c','qdo4r0mrdafbdipa9iulvhufr4',3,2,'2015-03-01 14:20:24','2015-03-01 15:23:18','2015-03-01 15:23:20',0,'2015-03-01 15:23:18','super'),('54f2cdf9ab83f','lhv5mmfpnalnagvns833dj0rb1',3,2,'2015-03-01 15:29:45','2015-03-01 16:22:39','2015-03-01 16:21:32',0,'2015-03-01 16:22:39','super'),('54f2da6346584','6uu1gb3ecul4fuo6hh2mahe4h5',3,2,'2015-03-01 16:22:43','2015-03-01 16:29:26','2015-03-01 16:29:22',0,'2015-03-01 16:29:26','super'),('54f2dbfa0f7a8','gm41ea7dm6empaoeq7i1co8p74',3,2,'2015-03-01 16:29:30','2015-03-01 16:35:28','2015-03-01 16:33:39',0,'2015-03-01 16:35:28','super'),('54f2dd63b7acf','4dobasmtub36uvbhsjpk9spsd6',3,2,'2015-03-01 16:35:31','2015-03-01 16:37:58','2015-03-01 16:36:13',0,'2015-03-01 16:37:58','super'),('54f2ddf9aef98','50cpe40r9vvrhpj53khgc7bh47',3,2,'2015-03-01 16:38:01','2015-03-01 16:45:37','2015-03-01 16:45:36',0,'2015-03-01 16:45:37','super'),('54f2dfc57ccde','d6qqr7q1jp3fgaieu979otnoe7',3,2,'2015-03-01 16:45:41','2015-03-01 16:48:37','2015-03-01 16:48:33',0,'2015-03-01 16:48:37','super'),('54f2e0790d487','op1r2glar9a2fj6et5p0j85lc7',3,2,'2015-03-01 16:48:41','2015-03-01 16:49:36','2015-03-01 16:49:31',0,'2015-03-01 16:49:36','super'),('54f2e0b4ef0cb','7u9kqbuvth94mmc04g86pcqhq0',3,2,'2015-03-01 16:49:40',NULL,'2015-03-01 16:56:57',1,'2015-03-01 16:49:40','super'),('54f3257aad122','31k451hn7914oac1nb0j3bh181',3,2,'2015-03-01 21:43:06',NULL,'2015-03-01 22:43:16',1,'2015-03-01 21:43:06','super'),('54f3f24389b30','6shcd87q4gejjcamu0j4mjmel0',3,2,'2015-03-02 12:16:51',NULL,'2015-03-02 13:05:25',1,'2015-03-02 12:16:51','super'),('54f4742c637a8','uqkkqsfndt74a7j5uh6j8v4p82',3,2,'2015-03-02 21:31:08',NULL,'2015-03-02 21:32:29',1,'2015-03-02 21:31:08','super'),('54f58636a4fe0','khggoism2o160lcvm3vo1v8mu5',3,2,'2015-03-03 17:00:22',NULL,'2015-03-03 17:04:14',1,'2015-03-03 17:00:22','super'),('54f59b7d20fb7','0r3ha4teo0rciapqs1arbfm521',3,2,'2015-03-03 18:31:09',NULL,'2015-03-03 18:48:32',1,'2015-03-03 18:31:09','super'),('54f5a27f158c4','ssb2o1u2tdhrmikaja02k9n500',3,2,'2015-03-03 19:01:03',NULL,'2015-03-03 19:34:44',1,'2015-03-03 19:01:03','super'),('54f5a6488ab55','p112u51cael7t00d1gt4tboic2',3,2,'2015-03-03 19:17:12',NULL,'2015-03-03 19:56:15',1,'2015-03-03 19:17:12','super'),('54f61735754c5','f6udqokolv5gsujgdjt0eqfrb1',3,2,'2015-03-04 03:19:01',NULL,'2015-03-04 03:20:04',1,'2015-03-04 03:19:01','super'),('54f717e346dbf','q66du2pkg43j8ghc57gb4317i5',3,2,'2015-03-04 21:34:11',NULL,'2015-03-04 22:25:13',1,'2015-03-04 21:34:11','super'),('54f7293285a72','kjc7pikrhphpm9eamlfr0258t3',3,2,'2015-03-04 22:48:02','2015-03-04 23:27:15','2015-03-04 23:27:13',0,'2015-03-04 23:27:15','super'),('54f7326f7d710','foa539etf3n629p5e32001fid1',3,2,'2015-03-04 23:27:27',NULL,'2015-03-04 23:38:34',1,'2015-03-04 23:27:27','super'),('54f7f998cda33','tgablhonnng29v729pcrqn7go2',3,2,'2015-03-05 13:37:12',NULL,'2015-03-05 13:38:26',1,'2015-03-05 13:37:12','super'),('54f853fa51ce5','vivlhqk3uvgsoufnccjj79pse2',3,2,'2015-03-05 20:02:50',NULL,'2015-03-05 21:01:00',1,'2015-03-05 20:02:50','super'),('54f8626c85eb6','scemd4dcjc5d3437h5ov5c48t4',3,2,'2015-03-05 21:04:28',NULL,'2015-03-05 21:28:05',1,'2015-03-05 21:04:28','super'),('54f88c2c1fc2f','bkbbuinohcjv0p2dermfkjh0f7',3,2,'2015-03-06 00:02:36','2015-03-06 00:07:57','2015-03-06 00:07:54',0,'2015-03-06 00:07:57','super'),('54f88d7687630','2f2vkhsmk2kvc2ts9mqnsbqlk4',3,2,'2015-03-06 00:08:06','2015-03-06 00:08:14','2015-03-06 00:08:10',0,'2015-03-06 00:08:14','super'),('54f88ddd98043','h4unlm6b3sv8o2393fv444hbn3',3,2,'2015-03-06 00:09:49',NULL,'2015-03-06 01:30:17',1,'2015-03-06 00:09:49','super'),('54f93b893e6fa','ijfqt3l8flbkgqno526p73j914',3,2,'2015-03-06 12:30:49',NULL,'2015-03-06 14:05:29',1,'2015-03-06 12:30:49','super'),('54f98fa9130ad','h7lq6igiminmm78u11g7k625e7',3,2,'2015-03-06 18:29:45',NULL,'2015-03-06 18:42:24',1,'2015-03-06 18:29:45','super'),('54fa6f798bd3d','kc9n2h598t525s7tep34oulk86',3,2,'2015-03-07 10:24:41',NULL,'2015-03-07 10:52:20',1,'2015-03-07 10:24:41','super'),('54fae6f90fa15','se5fmkgbsv5lgr66tb266tjia3',3,2,'2015-03-07 18:54:33',NULL,'2015-03-07 18:54:56',1,'2015-03-07 18:54:33','super'),('54fbf30509075','2bhtklrebldk7pg3bs5mbj7ue4',3,2,'2015-03-08 13:58:13','2015-03-08 15:45:47','2015-03-08 15:45:44',0,'2015-03-08 15:45:47','super'),('54fc0c4097d84','ib94er93l8hvg20k4lr49qoi23',3,2,'2015-03-08 15:45:52',NULL,'2015-03-08 16:11:18',1,'2015-03-08 15:45:52','super'),('54fc51b116f2d','quek1hgs8p1hdt8r72m44937s1',3,2,'2015-03-08 20:42:09',NULL,'2015-03-08 21:36:42',1,'2015-03-08 20:42:09','super'),('54fcfe41a1520','d9smrdf0rbb62v8f278h6d0us4',3,2,'2015-03-09 08:58:25',NULL,'2015-03-09 10:36:32',1,'2015-03-09 08:58:25','super'),('54fd4a4a322f8','02id5tl418brp2un0ufovsma51',3,2,'2015-03-09 14:22:50',NULL,'2015-03-09 14:50:44',1,'2015-03-09 14:22:50','super'),('54fd6d3ce8cc9','ue9e2d4dh0vjgvl3h9vohctdp7',3,2,'2015-03-09 16:51:56',NULL,'2015-03-09 18:44:39',1,'2015-03-09 16:51:56','super'),('54fef6ae3a1fb','266q7es6ggd3nbhcl41d4b9a35',3,2,'2015-03-10 20:50:38',NULL,'2015-03-10 20:51:55',1,'2015-03-10 20:50:38','super'),('54ffc3e1273ea','fcruhei1rlvuhvhtm432vc4h22',3,2,'2015-03-11 11:26:09',NULL,'2015-03-11 11:26:29',1,'2015-03-11 11:26:09','super'),('5502119a45805','fsk83bs2cco28vfc7lngljub80',3,2,'2015-03-13 05:22:18','2015-03-13 06:00:11','2015-03-13 06:00:02',0,'2015-03-13 06:00:11','super'),('55021a819922d','vk5pmdin96373mpucelekrdrk4',3,2,'2015-03-13 06:00:17','2015-03-13 07:05:04','2015-03-13 06:24:48',0,'2015-03-13 07:05:04','super'),('550229b42984a','pm5bitakqgc4kqr3m1cr38b8h3',3,2,'2015-03-13 07:05:08',NULL,'2015-03-13 07:26:57',1,'2015-03-13 07:05:08','super'),('55023bf2e4f67','hkc3pgu143jlh2fu8dd65fhp93',3,2,'2015-03-13 08:22:58',NULL,'2015-03-13 08:28:53',1,'2015-03-13 08:22:58','super'),('55025a8187906','9vtml7n860m6dg3disc06r0dk7',3,2,'2015-03-13 10:33:21',NULL,'2015-03-13 11:02:33',1,'2015-03-13 10:33:24','super'),('5502a096864fd','g96jdp320m2697mvkd14j0uaf0',3,2,'2015-03-13 15:32:22',NULL,NULL,1,'2015-03-13 15:32:22','super'),('5502a119448e3','8bbj99k3q3ub7tkv8gaqg0s6p1',3,2,'2015-03-13 15:34:33',NULL,'2015-03-13 16:20:42',1,'2015-03-13 15:34:33','super'),('5502f0bf3d01b','01bvt46ivgcms2i4slrh7ceuk0',3,2,'2015-03-13 21:14:23','2015-03-13 21:54:49','2015-03-13 21:54:46',0,'2015-03-13 21:54:49','super'),('550401429ef3f','7q92o1k19du28dj1qm5o27l211',3,2,'2015-03-14 16:37:06',NULL,'2015-03-14 16:37:08',1,'2015-03-14 16:37:06','super'),('55043b4759091','uff6795bd5btlbbk294vrakbl2',3,2,'2015-03-14 20:44:39','2015-03-14 20:46:02','2015-03-14 20:46:00',0,'2015-03-14 20:46:02','super'),('55043b9c56fbe','dgf9g3quplhpvolsem5eci7qb4',3,2,'2015-03-14 20:46:04',NULL,'2015-03-14 20:51:48',1,'2015-03-14 20:46:04','super'),('5505516a93e5e','23i3sa25dn0sdm4ml7ikanlt52',3,2,'2015-03-15 16:31:22',NULL,'2015-03-15 16:31:30',1,'2015-03-15 16:31:22','super'),('550a1e735bf0e','uoaa6udouuksqe16runn8t0ld7',3,2,'2015-03-19 07:55:15',NULL,'2015-03-19 07:57:43',1,'2015-03-19 07:55:15','super'),('550a63095a6a6','k496ii03u07v823j7pc072eb35',3,2,'2015-03-19 12:47:53',NULL,'2015-03-19 12:55:13',1,'2015-03-19 12:47:53','super'),('550bb8e54cccb','i9cuigum865ulvptt0jktcca14',3,2,'2015-03-20 13:06:29',NULL,'2015-03-20 13:09:51',1,'2015-03-20 13:06:29','super'),('550c046841331','bshauquj1al5887atq2vmmpck3',3,2,'2015-03-20 18:28:40','2015-03-20 19:07:42','2015-03-20 18:29:13',0,'2015-03-20 19:07:42','super'),('550c0eb693e7e','5u8ebqt0am735fcno5a41hfsq2',3,2,'2015-03-20 19:12:38',NULL,'2015-03-20 19:23:31',1,'2015-03-20 19:12:38','super'),('550c2ef505b7a','ev2dbm371su0b7q1u5pifjlem6',3,2,'2015-03-20 21:30:13',NULL,'2015-03-20 22:04:13',1,'2015-03-20 21:30:13','super'),('550c9e79024eb','cqkvfgfb0gnotmmuj731u3vac1',3,2,'2015-03-21 05:26:01',NULL,'2015-03-21 06:05:58',1,'2015-03-21 05:26:01','super'),('550ca1839874c','g3kj823k86hd96cl89p83j08t5',3,2,'2015-03-21 05:38:59',NULL,'2015-03-21 06:26:29',1,'2015-03-21 05:38:59','super'),('550df3e5a8401','rt2d0i4qpia78pbavq1opke2g5',3,2,'2015-03-22 05:42:45','2015-03-22 06:52:13','2015-03-22 06:52:03',0,'2015-03-22 06:52:13','super'),('550e071649245','g0gsb6ekm727i7ep1mg3nvs372',3,2,'2015-03-22 07:04:38',NULL,'2015-03-22 07:29:45',1,'2015-03-22 07:04:38','super'),('550fa3e48fd80','p9cevs8bs8v5cffb83m9fk6884',3,2,'2015-03-23 12:25:56',NULL,'2015-03-23 14:01:25',1,'2015-03-23 12:25:56','super'),('550fbf1859fca','8b06scac1ert0lgo0tme5tgai6',3,2,'2015-03-23 14:22:00',NULL,'2015-03-23 14:33:33',1,'2015-03-23 14:22:00','super'),('551007073235d','mn0ia2n83rumlqc3695u1jomf5',3,2,'2015-03-23 19:28:55','2015-03-23 20:44:55','2015-03-23 20:44:51',0,'2015-03-23 20:44:55','super'),('55101bfb7c861','vahhn1kn163ln9f23j3esrsmv1',3,2,'2015-03-23 20:58:19','2015-03-23 20:59:44','2015-03-23 20:59:42',0,'2015-03-23 20:59:44','super'),('55101c55f1b99','j13mojl6tt72ffokg3957ufie1',3,2,'2015-03-23 20:59:49','2015-03-23 21:24:02','2015-03-23 21:01:32',0,'2015-03-23 21:24:02','super'),('5510fcfae9ae8','gmcijqtk7ideec18dpkn4p0um7',3,2,'2015-03-24 12:58:18',NULL,'2015-03-24 12:59:01',1,'2015-03-24 12:58:19','super'),('5511afd460545','0b3ahb8jkce8esklfleeeb8mo6',3,2,'2015-03-25 01:41:24',NULL,'2015-03-25 01:55:06',1,'2015-03-25 01:41:24','super'),('5514cf6693a2f','cfveh7dc60t2io1csulvkerv04',3,2,'2015-03-27 10:32:54',NULL,'2015-03-27 10:33:10',1,'2015-03-27 10:32:54','super'),('5514f1bbd2ded','n5utqrtej92oltdiis4pm053m1',3,2,'2015-03-27 12:59:23',NULL,'2015-03-27 13:39:07',1,'2015-03-27 12:59:23','super'),('5515629d807e1','p8dr7qiq073t4emlrk1354o7k5',3,2,'2015-03-27 21:01:01',NULL,'2015-03-27 21:08:16',1,'2015-03-27 21:01:01','super'),('5515de7b71780','j3oe910laakt0faif6l048rji1',3,2,'2015-03-28 05:49:31',NULL,'2015-03-28 07:03:57',1,'2015-03-28 05:49:31','super'),('5518ebf280b80','eu1jaoagpou23dt3j685sq0ng0',3,2,'2015-03-30 13:23:46',NULL,'2015-03-30 13:30:02',1,'2015-03-30 13:23:46','super'),('55194242ce2d5','vlb3dasj5ska05i47gcoasng46',3,2,'2015-03-30 19:32:02',NULL,'2015-03-30 19:55:47',1,'2015-03-30 19:32:02','super'),('5519c47ac932d','0fiemf1i7irb0rqo0dqe80hsg3',3,2,'2015-03-31 04:47:38',NULL,'2015-03-31 05:25:38',1,'2015-03-31 04:47:38','super'),('5519cc14b9087','l0i8kkq7u1p7j899fcfu33qlo5',3,2,'2015-03-31 05:20:04',NULL,'2015-03-31 06:18:58',1,'2015-03-31 05:20:04','super'),('5519da3a12685','ai13oug53oaolp1ccug0h26kv0',3,2,'2015-03-31 06:20:26',NULL,'2015-03-31 06:53:50',1,'2015-03-31 06:20:26','super'),('551a1cbddd6e0','est8dqdro43srtv9k2a4mvtvv2',3,2,'2015-03-31 11:04:13',NULL,'2015-03-31 11:24:04',1,'2015-03-31 11:04:13','super'),('551a27ab86073','ek1ncf36dmq48ppsun1bmpbva1',3,2,'2015-03-31 11:50:51',NULL,'2015-03-31 13:34:24',1,'2015-03-31 11:50:51','super'),('551a2bca7f257','vd8401a06p33m8dh9mvokgamm2',3,2,'2015-03-31 12:08:26',NULL,'2015-03-31 12:34:48',1,'2015-03-31 12:08:26','super'),('551a7e9f84291','jqm6jd6uj8rkdvno7kf6u2sk23',3,2,'2015-03-31 18:01:51','2015-03-31 18:02:53','2015-03-31 18:02:33',0,'2015-03-31 18:02:53','super'),('551a7f0b7b29f','k70h3lf14q5fsas355lnotkt92',3,2,'2015-03-31 18:03:39','2015-03-31 18:06:33','2015-03-31 18:05:22',0,'2015-03-31 18:06:33','super'),('551fb27431e3b','ftaalu4c676atftk034norju45',3,2,'2015-04-04 16:44:20','2015-04-04 16:44:32','2015-04-04 09:44:30',0,'2015-04-04 09:44:32','super');
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_receiving`
--

DROP TABLE IF EXISTS `v_receiving`;
/*!50001 DROP VIEW IF EXISTS `v_receiving`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_receiving` AS SELECT 
 1 AS `id`,
 1 AS `receive_time`,
 1 AS `supplier_id`,
 1 AS `employee_id`,
 1 AS `sub_total`,
 1 AS `status`,
 1 AS `remark`,
 1 AS `discount_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_receiving_item_sum`
--

DROP TABLE IF EXISTS `v_receiving_item_sum`;
/*!50001 DROP VIEW IF EXISTS `v_receiving_item_sum`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_receiving_item_sum` AS SELECT 
 1 AS `receive_id`,
 1 AS `quantity`,
 1 AS `cost_price`,
 1 AS `unit_price`,
 1 AS `price`,
 1 AS `profit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_sale`
--

DROP TABLE IF EXISTS `v_sale`;
/*!50001 DROP VIEW IF EXISTS `v_sale`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sale` AS SELECT 
 1 AS `id`,
 1 AS `sale_time`,
 1 AS `client_id`,
 1 AS `employee_id`,
 1 AS `sub_total`,
 1 AS `status`,
 1 AS `status_f`,
 1 AS `remark`,
 1 AS `discount_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_sale_item_sum`
--

DROP TABLE IF EXISTS `v_sale_item_sum`;
/*!50001 DROP VIEW IF EXISTS `v_sale_item_sum`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sale_item_sum` AS SELECT 
 1 AS `sale_id`,
 1 AS `quantity`,
 1 AS `cost_price`,
 1 AS `unit_price`,
 1 AS `price`,
 1 AS `profit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_sale_payment`
--

DROP TABLE IF EXISTS `v_sale_payment`;
/*!50001 DROP VIEW IF EXISTS `v_sale_payment`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sale_payment` AS SELECT 
 1 AS `sale_id`,
 1 AS `currency_code`,
 1 AS `payment_amount`,
 1 AS `give_away`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_sale_summary`
--

DROP TABLE IF EXISTS `v_sale_summary`;
/*!50001 DROP VIEW IF EXISTS `v_sale_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sale_summary` AS SELECT 
 1 AS `sale_id`,
 1 AS `quantity`,
 1 AS `cost_price`,
 1 AS `unit_price`,
 1 AS `price`,
 1 AS `sum((price-cost_price)*quantity)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `x_authasignment_super`
--

DROP TABLE IF EXISTS `x_authasignment_super`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `x_authasignment_super` (
  `itemname` varchar(64) CHARACTER SET latin1 NOT NULL,
  `userid` varchar(64) CHARACTER SET latin1 NOT NULL,
  `bizrule` text CHARACTER SET latin1,
  `data` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_authasignment_super`
--

LOCK TABLES `x_authasignment_super` WRITE;
/*!40000 ALTER TABLE `x_authasignment_super` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_authasignment_super` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_sale_bck`
--

DROP TABLE IF EXISTS `x_sale_bck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `x_sale_bck` (
  `id` int(11) NOT NULL DEFAULT '0',
  `sale_time` datetime NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `sub_total` decimal(15,4) DEFAULT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `remark` text CHARACTER SET utf8,
  `discount_amount` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_sale_bck`
--

LOCK TABLES `x_sale_bck` WRITE;
/*!40000 ALTER TABLE `x_sale_bck` DISABLE KEYS */;
/*!40000 ALTER TABLE `x_sale_bck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `v_receiving`
--

/*!50001 DROP VIEW IF EXISTS `v_receiving`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE 
/*!50001 VIEW `v_receiving` AS select `receiving`.`id` AS `id`,`receiving`.`receive_time` AS `receive_time`,`receiving`.`supplier_id` AS `supplier_id`,`receiving`.`employee_id` AS `employee_id`,`receiving`.`sub_total` AS `sub_total`,`receiving`.`status` AS `status`,`receiving`.`remark` AS `remark`,(case when (`receiving`.`discount_type` = '%') then ((`receiving`.`sub_total` * ifnull(`receiving`.`discount_amount`,0)) / 100) else ifnull(`receiving`.`discount_amount`,0) end) AS `discount_amount` from `receiving` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_receiving_item_sum`
--

/*!50001 DROP VIEW IF EXISTS `v_receiving_item_sum`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE 
/*!50001 VIEW `v_receiving_item_sum` AS select `receiving_item`.`receive_id` AS `receive_id`,sum(`receiving_item`.`quantity`) AS `quantity`,sum(`receiving_item`.`cost_price`) AS `cost_price`,sum(`receiving_item`.`unit_price`) AS `unit_price`,sum(`receiving_item`.`price`) AS `price`,sum(((`receiving_item`.`price` - `receiving_item`.`cost_price`) * `receiving_item`.`quantity`)) AS `profit` from `receiving_item` group by `receiving_item`.`receive_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sale`
--

/*!50001 DROP VIEW IF EXISTS `v_sale`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE 
/*!50001 VIEW `v_sale` AS select `sale`.`id` AS `id`,`sale`.`sale_time` AS `sale_time`,`sale`.`client_id` AS `client_id`,`sale`.`employee_id` AS `employee_id`,`sale`.`sub_total` AS `sub_total`,`sale`.`status` AS `status`,(case when (`sale`.`status` = '1') then 'Completed' when (`sale`.`status` = '2') then 'Suspended' when (`sale`.`status` = '0') then 'Canceled' else `sale`.`status` end) AS `status_f`,`sale`.`remark` AS `remark`,(case when (`sale`.`discount_type` = '%') then ((`sale`.`sub_total` * ifnull(`sale`.`discount_amount`,0)) / 100) else ifnull(`sale`.`discount_amount`,0) end) AS `discount_amount` from `sale` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sale_item_sum`
--

/*!50001 DROP VIEW IF EXISTS `v_sale_item_sum`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE 
/*!50001 VIEW `v_sale_item_sum` AS select `sale_item`.`sale_id` AS `sale_id`,sum(`sale_item`.`quantity`) AS `quantity`,sum(`sale_item`.`cost_price`) AS `cost_price`,sum(`sale_item`.`unit_price`) AS `unit_price`,sum(`sale_item`.`price`) AS `price`,sum(((`sale_item`.`price` - `sale_item`.`cost_price`) * `sale_item`.`quantity`)) AS `profit` from `sale_item` group by `sale_item`.`sale_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sale_payment`
--

/*!50001 DROP VIEW IF EXISTS `v_sale_payment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sys`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sale_payment` AS select `sale_payment`.`sale_id` AS `sale_id`,`sale_payment`.`currency_code` AS `currency_code`,sum(`sale_payment`.`payment_amount`) AS `payment_amount`,sum(`sale_payment`.`give_away`) AS `give_away` from `sale_payment` group by `sale_payment`.`sale_id`,`sale_payment`.`currency_code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sale_summary`
--

/*!50001 DROP VIEW IF EXISTS `v_sale_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE 
/*!50001 VIEW `v_sale_summary` AS select `sale_item`.`sale_id` AS `sale_id`,sum(`sale_item`.`quantity`) AS `quantity`,sum(`sale_item`.`cost_price`) AS `cost_price`,sum(`sale_item`.`unit_price`) AS `unit_price`,sum(`sale_item`.`price`) AS `price`,sum(((`sale_item`.`price` - `sale_item`.`cost_price`) * `sale_item`.`quantity`)) AS `sum((price-cost_price)*quantity)` from `sale_item` group by `sale_item`.`sale_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-02  7:42:05
