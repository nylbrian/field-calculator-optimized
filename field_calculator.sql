-- MySQL dump 10.13  Distrib 5.6.24, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: field_calculator
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `iso_3166_2` varchar(2) DEFAULT NULL,
  `currencies_id` int(11) NOT NULL,
  `rcm` varchar(25) NOT NULL,
  `other` tinyint(4) NOT NULL DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `index6` (`iso_3166_2`),
  KEY `index3` (`iso_3166_2`),
  KEY `index4` (`currencies_id`),
  KEY `index5` (`other`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Bangladesh','BD',12,'bd/rcm',0,'2016-09-11 23:54:56','2016-09-11 23:55:20',0),(2,'Cambodia','KH',57,'nm',0,'2016-09-11 23:54:56','2016-09-11 23:55:20',0),(3,'China','CN',25,'nm',0,'2016-09-11 23:54:56','2016-09-11 23:55:20',0),(4,'India','IN',49,'bd/rcm',0,'2016-09-11 23:54:56','2016-09-11 23:55:20',0),(5,'Indonesia','ID',47,'id/lkp',0,'2016-09-11 23:54:56','2016-09-11 23:55:20',0),(6,'Laos','LA',119,'nm',0,'2016-09-11 23:54:56','2016-09-11 23:55:20',0),(7,'Malaysia','MY',75,'nm',0,'2016-09-11 23:54:56','2016-09-11 23:55:20',0),(8,'Myanmar','MM',71,'nm',0,'2016-09-11 23:54:56','2016-09-11 23:55:20',0),(9,'Nepal','NP',81,'nm',0,'2016-09-11 23:54:56','2016-09-11 23:55:20',0),(10,'Pakistan','PK',87,'nm',0,'2016-09-11 23:54:56','2016-09-11 23:55:20',0),(11,'Philippines','PH',86,'ph/rcm',0,'2016-09-11 23:54:56','2016-09-11 23:55:20',0),(12,'Sri Lanka','LK',63,'beta/sl/rcm',0,'2016-09-11 23:54:56','2016-09-11 23:55:20',0),(13,'Thailand','TH',101,'nm',0,'2016-09-11 23:54:56','2016-09-11 23:55:20',0),(14,'Vietnam','VN',113,'vn/rcm',0,'2016-09-11 23:54:56','2016-09-11 23:55:20',0),(15,'United States','US',1,'nm',1,'2016-09-19 14:20:56','2016-09-19 14:20:56',0),(16,'Belgium','BE',3,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(17,'Burkina Faso','BF',115,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(18,'Bulgaria','BG',13,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(19,'Bosnia and Herzegovina','BA',11,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(20,'Saint Barthelemy','BL',3,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(21,'Brunei','BN',16,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(22,'Bolivia','BO',17,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(23,'Bahrain','BH',14,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(24,'Burundi','BI',15,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(25,'Benin','BJ',115,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(26,'Jamaica','JM',53,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(27,'Bouvet Island','BV',80,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(28,'Botswana','BW',19,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(29,'Bonaire, Saint Eustatius and Saba ','BQ',1,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(30,'Brazil','BR',18,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(31,'Jersey','JE',38,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(32,'Belarus','BY',20,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(33,'Belize','BZ',21,'nm',1,'2016-09-26 23:25:43','2016-09-26 23:25:43',0),(34,'Russia','RU',93,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(35,'Rwanda','RW',94,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(36,'Serbia','RS',92,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(37,'East Timor','TL',1,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(38,'Reunion','RE',3,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(39,'Romania','RO',91,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(40,'Tokelau','TK',82,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(41,'Guinea-Bissau','GW',115,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(42,'Guam','GU',1,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(43,'Guatemala','GT',42,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(44,'South Georgia and the South Sandwich Islands','GS',38,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(45,'Greece','GR',3,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(46,'Equatorial Guinea','GQ',114,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(47,'Guadeloupe','GP',3,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(48,'Japan','JP',55,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(49,'Guernsey','GG',38,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(50,'French Guiana','GF',3,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(51,'Georgia','GE',39,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(52,'United Kingdom','GB',38,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(53,'Gabon','GA',114,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(54,'El Salvador','SV',1,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(55,'Guinea','GN',41,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(56,'Greenland','GL',31,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(57,'Ghana','GH',40,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(58,'Oman','OM',83,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(59,'Tunisia','TN',102,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(60,'Jordan','JO',54,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(61,'Croatia','HR',45,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(62,'Hungary','HU',46,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(63,'Hong Kong','HK',43,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(64,'Honduras','HN',44,'nm',1,'2016-09-26 23:25:44','2016-09-26 23:25:44',0),(65,'Heard Island and McDonald Islands','HM',9,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(66,'Venezuela','VE',112,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(67,'Puerto Rico','PR',1,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(68,'Palestinian Territory','PS',48,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(69,'Palau','PW',1,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(70,'Portugal','PT',3,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(71,'Svalbard and Jan Mayen','SJ',80,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(72,'Paraguay','PY',89,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(73,'Iraq','IQ',50,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(74,'Panama','PA',84,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(75,'Peru','PE',85,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(76,'Pitcairn','PN',82,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(77,'Poland','PL',88,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(78,'Saint Pierre and Miquelon','PM',3,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(79,'Zambia','ZM',118,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(80,'Western Sahara','EH',67,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(81,'Estonia','EE',3,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(82,'Egypt','EG',35,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(83,'South Africa','ZA',117,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(84,'Ecuador','EC',1,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(85,'Italy','IT',3,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(86,'Ethiopia','ET',37,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(87,'Somalia','SO',99,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(88,'Saudi Arabia','SA',95,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(89,'Spain','ES',3,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(90,'Eritrea','ER',36,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(91,'Montenegro','ME',3,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(92,'Moldova','MD',68,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(93,'Madagascar','MG',69,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(94,'Saint Martin','MF',3,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(95,'Morocco','MA',67,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(96,'Monaco','MC',3,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(97,'Uzbekistan','UZ',111,'nm',1,'2016-09-26 23:25:45','2016-09-26 23:25:45',0),(98,'Mali','ML',115,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(99,'Macao','MO',72,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(100,'Marshall Islands','MH',1,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(101,'Macedonia','MK',70,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(102,'Mauritius','MU',73,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(103,'Malta','MT',3,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(104,'Martinique','MQ',3,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(105,'Northern Mariana Islands','MP',1,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(106,'Isle of Man','IM',38,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(107,'Uganda','UG',109,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(108,'Tanzania','TZ',107,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(109,'Mexico','MX',74,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(110,'Israel','IL',48,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(111,'France','FR',3,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(112,'British Indian Ocean Territory','IO',1,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(113,'Finland','FI',3,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(114,'Micronesia','FM',1,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(115,'Faroe Islands','FO',31,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(116,'Nicaragua','NI',79,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(117,'Netherlands','NL',3,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(118,'Norway','NO',80,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(119,'Namibia','NA',77,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(120,'Niger','NE',115,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(121,'Norfolk Island','NF',9,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(122,'Nigeria','NG',78,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(123,'New Zealand','NZ',82,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(124,'Nauru','NR',9,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(125,'Niue','NU',82,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(126,'Cook Islands','CK',82,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(127,'Kosovo','XK',3,'nm',1,'2016-09-26 23:25:46','2016-09-26 23:25:46',0),(128,'Ivory Coast','CI',115,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(129,'Switzerland','CH',23,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(130,'Colombia','CO',26,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(131,'Cameroon','CM',114,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(132,'Chile','CL',24,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(133,'Cocos Islands','CC',9,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(134,'Canada','CA',2,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(135,'Republic of the Congo','CG',114,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(136,'Central African Republic','CF',114,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(137,'Democratic Republic of the Congo','CD',22,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(138,'Czech Republic','CZ',29,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(139,'Cyprus','CY',3,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(140,'Christmas Island','CX',9,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(141,'Costa Rica','CR',27,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(142,'Cape Verde','CV',28,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(143,'Syria','SY',100,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(144,'Kenya','KE',56,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(145,'Kiribati','KI',9,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(146,'Comoros','KM',58,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(147,'Slovakia','SK',3,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(148,'South Korea','KR',59,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(149,'Slovenia','SI',3,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(150,'Kuwait','KW',60,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(151,'Senegal','SN',115,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(152,'San Marino','SM',3,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(153,'Kazakhstan','KZ',61,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(154,'Singapore','SG',98,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(155,'Sweden','SE',97,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(156,'Sudan','SD',96,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(157,'Dominican Republic','DO',32,'nm',1,'2016-09-26 23:25:47','2016-09-26 23:25:47',0),(158,'Djibouti','DJ',30,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(159,'Denmark','DK',31,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(160,'British Virgin Islands','VG',1,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(161,'Germany','DE',3,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(162,'Yemen','YE',116,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(163,'Algeria','DZ',33,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(164,'Uruguay','UY',110,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(165,'Mayotte','YT',3,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(166,'United States Minor Outlying Islands','UM',1,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(167,'Lebanon','LB',62,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(168,'Tuvalu','TV',9,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(169,'Taiwan','TW',106,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(170,'Trinidad and Tobago','TT',105,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(171,'Turkey','TR',104,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(172,'Liechtenstein','LI',23,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(173,'Latvia','LV',3,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(174,'Tonga','TO',103,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(175,'Lithuania','LT',64,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(176,'Luxembourg','LU',3,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(177,'French Southern Territories','TF',3,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(178,'Togo','TG',115,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(179,'Chad','TD',114,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(180,'Turks and Caicos Islands','TC',1,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(181,'Libya','LY',66,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(182,'Vatican','VA',3,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(183,'United Arab Emirates','AE',4,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(184,'Andorra','AD',3,'nm',1,'2016-09-26 23:25:48','2016-09-26 23:25:48',0),(185,'Afghanistan','AF',5,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(186,'U.S. Virgin Islands','VI',1,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(187,'Iceland','IS',52,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(188,'Iran','IR',51,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(189,'Armenia','AM',7,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(190,'Albania','AL',6,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(191,'American Samoa','AS',1,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(192,'Argentina','AR',8,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(193,'Australia','AU',9,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(194,'Austria','AT',3,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(195,'Aland Islands','AX',3,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(196,'Azerbaijan','AZ',10,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(197,'Ireland','IE',3,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(198,'Ukraine','UA',108,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(199,'Qatar','QA',90,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0),(200,'Mozambique','MZ',76,'nm',1,'2016-09-26 23:25:49','2016-09-26 23:25:49',0);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol` varchar(45) NOT NULL,
  `symbol_native` varchar(45) NOT NULL,
  `decimal_digits` tinyint(4) NOT NULL,
  `rounding` int(11) NOT NULL,
  `name_plural` varchar(100) NOT NULL,
  `exchange_rate` float NOT NULL,
  `updatedExchangeRate` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index2` (`code`),
  KEY `index3` (`exchange_rate`,`code`),
  KEY `index4` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'US Dollar','USD','$','$',2,0,'US dollars',1,'2016-09-26 23:02:07',0),(2,'Canadian Dollar','CAD','CA$','$',2,0,'Canadian dollars',1.31619,'2016-09-26 23:47:11',0),(3,'Euro','EUR','â‚¬','â‚¬',2,0,'euros',0.888206,'2016-09-26 23:47:12',0),(4,'United Arab Emirates Dirham','AED','AED','Ø¯.Ø¥.â€',2,0,'UAE dirhams',3.6729,'2016-09-26 23:47:11',0),(5,'Afghan Afghani','AFN','Af','Ø‹',0,0,'Afghan Afghanis',66.5019,'2016-09-26 23:47:11',0),(6,'Albanian Lek','ALL','ALL','Lek',0,0,'Albanian lekÃ«',121.39,'2016-09-26 23:47:11',0),(7,'Armenian Dram','AMD','AMD','Õ¤Ö€.',0,0,'Armenian drams',472.79,'2016-09-26 23:47:11',0),(8,'Argentine Peso','ARS','AR$','$',2,0,'Argentine pesos',15.145,'2016-09-26 23:47:11',0),(9,'Australian Dollar','AUD','AU$','$',2,0,'Australian dollars',1.3083,'2016-09-26 23:47:11',0),(10,'Azerbaijani Manat','AZN','man.','Ð¼Ð°Ð½.',2,0,'Azerbaijani manats',1.6287,'2016-09-26 23:47:11',0),(11,'Bosnia-Herzegovina Convertible Mark','BAM','KM','KM',2,0,'Bosnia-Herzegovina convertible marks',1.73989,'2016-09-26 23:47:11',0),(12,'Bangladeshi Taka','BDT','Tk','à§³',2,0,'Bangladeshi takas',78.4,'2016-09-26 23:47:11',0),(13,'Bulgarian Lev','BGN','BGN','Ð»Ð².',2,0,'Bulgarian leva',1.7367,'2016-09-26 23:47:11',0),(14,'Bahraini Dinar','BHD','BD','Ø¯.Ø¨.â€',3,0,'Bahraini dinars',0.37701,'2016-09-26 23:47:11',0),(15,'Burundian Franc','BIF','FBu','FBu',0,0,'Burundian francs',1651,'2016-09-26 23:47:11',0),(16,'Brunei Dollar','BND','BN$','$',2,0,'Brunei dollars',1.3598,'2016-09-26 23:47:11',0),(17,'Bolivian Boliviano','BOB','Bs','Bs',2,0,'Bolivian bolivianos',6.86983,'2016-09-26 23:47:11',0),(18,'Brazilian Real','BRL','R$','R$',2,0,'Brazilian reals',3.2378,'2016-09-26 23:47:11',0),(19,'Botswanan Pula','BWP','BWP','P',2,0,'Botswanan pulas',10.4553,'2016-09-26 23:47:11',0),(20,'Belarusian Ruble','BYR','BYR','BYR',0,0,'Belarusian rubles',20020,'2016-09-26 23:47:11',0),(21,'Belize Dollar','BZD','BZ$','$',2,0,'Belize dollars',1.98013,'2016-09-26 23:47:11',0),(22,'Congolese Franc','CDF','CDF','FrCD',2,0,'Congolese francs',972,'2016-09-26 23:47:11',0),(23,'Swiss Franc','CHF','CHF','CHF',2,0,'Swiss francs',0.96806,'2016-09-26 23:47:11',0),(24,'Chilean Peso','CLP','CL$','$',0,0,'Chilean pesos',661.91,'2016-09-26 23:47:11',0),(25,'Chinese Yuan','CNY','CNÂ¥','CNÂ¥',2,0,'Chinese yuan',6.6683,'2016-09-26 23:47:11',0),(26,'Colombian Peso','COP','CO$','$',0,0,'Colombian pesos',2911.9,'2016-09-26 23:47:11',0),(27,'Costa Rican ColÃ³n','CRC','â‚¡','â‚¡',0,0,'Costa Rican colÃ³ns',545.94,'2016-09-26 23:47:12',0),(28,'Cape Verdean Escudo','CVE','CV$','CV$',2,0,'Cape Verdean escudos',97.0005,'2016-09-26 23:47:12',0),(29,'Czech Republic Koruna','CZK','KÄ','KÄ',2,0,'Czech Republic korunas',24.0026,'2016-09-26 23:47:12',0),(30,'Djiboutian Franc','DJF','Fdj','Fdj',0,0,'Djiboutian francs',177,'2016-09-26 23:47:12',0),(31,'Danish Krone','DKK','Dkr','kr',2,0,'Danish kroner',6.6208,'2016-09-26 23:47:12',0),(32,'Dominican Peso','DOP','RD$','RD$',2,0,'Dominican pesos',46.16,'2016-09-26 23:47:12',0),(33,'Algerian Dinar','DZD','DA','Ø¯.Ø¬.â€',2,0,'Algerian dinars',109.1,'2016-09-26 23:47:12',0),(34,'Estonian Kroon','EEK','Ekr','kr',2,0,'Estonian kroons',13.923,'2016-09-26 23:47:12',0),(35,'Egyptian Pound','EGP','EGP','Ø¬.Ù….â€',2,0,'Egyptian pounds',8.86975,'2016-09-26 23:47:12',0),(36,'Eritrean Nakfa','ERN','Nfk','Nfk',2,0,'Eritrean nakfas',15.6802,'2016-09-26 23:47:12',0),(37,'Ethiopian Birr','ETB','Br','Br',2,0,'Ethiopian birrs',22.0102,'2016-09-26 23:47:12',0),(38,'British Pound Sterling','GBP','Â£','Â£',2,0,'British pounds sterling',0.7713,'2016-09-26 23:47:12',0),(39,'Georgian Lari','GEL','GEL','GEL',2,0,'Georgian laris',2.3024,'2016-09-26 23:47:12',0),(40,'Ghanaian Cedi','GHS','GHâ‚µ','GHâ‚µ',2,0,'Ghanaian cedis',3.95972,'2016-09-26 23:47:12',0),(41,'Guinean Franc','GNF','FG','FG',0,0,'Guinean francs',8890,'2016-09-26 23:47:12',0),(42,'Guatemalan Quetzal','GTQ','GTQ','Q',2,0,'Guatemalan quetzals',7.51698,'2016-09-26 23:47:12',0),(43,'Hong Kong Dollar','HKD','HK$','$',2,0,'Hong Kong dollars',7.7555,'2016-09-26 23:47:12',0),(44,'Honduran Lempira','HNL','HNL','L',2,0,'Honduran lempiras',22.5701,'2016-09-26 23:47:12',0),(45,'Croatian Kuna','HRK','kn','kn',2,0,'Croatian kunas',6.6289,'2016-09-26 23:47:12',0),(46,'Hungarian Forint','HUF','Ft','Ft',0,0,'Hungarian forints',272.34,'2016-09-26 23:47:12',0),(47,'Indonesian Rupiah','IDR','Rp','Rp',0,0,'Indonesian rupiahs',13000,'2016-09-26 23:47:12',0),(48,'Israeli New Sheqel','ILS','â‚ª','â‚ª',2,0,'Israeli new sheqels',3.7499,'2016-09-26 23:47:12',0),(49,'Indian Rupee','INR','Rs','à¦Ÿà¦•à¦¾',2,0,'Indian rupees',66.59,'2016-09-26 23:47:12',0),(50,'Iraqi Dinar','IQD','IQD','Ø¯.Ø¹.â€',0,0,'Iraqi dinars',1165,'2016-09-26 23:47:12',0),(51,'Iranian Rial','IRR','IRR','ï·¼',0,0,'Iranian rials',30068,'2016-09-26 23:47:12',0),(52,'Icelandic KrÃ³na','ISK','Ikr','kr',0,0,'Icelandic krÃ³nur',113.83,'2016-09-26 23:47:12',0),(53,'Jamaican Dollar','JMD','J$','$',2,0,'Jamaican dollars',127.2,'2016-09-26 23:47:12',0),(54,'Jordanian Dinar','JOD','JD','Ø¯.Ø£.â€',3,0,'Jordanian dinars',0.708498,'2016-09-26 23:47:13',0),(55,'Japanese Yen','JPY','Â¥','ï¿¥',0,0,'Japanese yen',100.499,'2016-09-26 23:47:13',0),(56,'Kenyan Shilling','KES','Ksh','Ksh',2,0,'Kenyan shillings',101.15,'2016-09-26 23:47:13',0),(57,'Cambodian Riel','KHR','KHR','áŸ›',2,0,'Cambodian riels',4050,'2016-09-26 23:47:13',0),(58,'Comorian Franc','KMF','CF','FC',0,0,'Comorian francs',437,'2016-09-26 23:47:13',0),(59,'South Korean Won','KRW','â‚©','â‚©',0,0,'South Korean won',1105.2,'2016-09-26 23:47:13',0),(60,'Kuwaiti Dinar','KWD','KD','Ø¯.Ùƒ.â€',3,0,'Kuwaiti dinars',0.30116,'2016-09-26 23:47:13',0),(61,'Kazakhstani Tenge','KZT','KZT','Ñ‚Ò£Ð³.',2,0,'Kazakhstani tenges',336.499,'2016-09-26 23:47:13',0),(62,'Lebanese Pound','LBP','LBÂ£','Ù„.Ù„.â€',0,0,'Lebanese pounds',1511,'2016-09-26 23:47:13',0),(63,'Sri Lankan Rupee','LKR','SLRs','SL Re',2,0,'Sri Lankan rupees',146.15,'2016-09-26 23:47:13',0),(64,'Lithuanian Litas','LTL','Lt','Lt',2,0,'Lithuanian litai',3.0487,'2016-09-26 23:47:13',0),(65,'Latvian Lats','LVL','Ls','Ls',2,0,'Latvian lati',0.62055,'2016-09-26 23:47:13',0),(66,'Libyan Dinar','LYD','LD','Ø¯.Ù„.â€',3,0,'Libyan dinars',1.3602,'2016-09-26 23:47:13',0),(67,'Moroccan Dirham','MAD','MAD','Ø¯.Ù….â€',2,0,'Moroccan dirhams',9.69022,'2016-09-26 23:47:13',0),(68,'Moldovan Leu','MDL','MDL','MDL',2,0,'Moldovan lei',19.69,'2016-09-26 23:47:13',0),(69,'Malagasy Ariary','MGA','MGA','MGA',0,0,'Malagasy Ariaries',3046,'2016-09-26 23:47:13',0),(70,'Macedonian Denar','MKD','MKD','MKD',2,0,'Macedonian denari',54.4095,'2016-09-26 23:47:13',0),(71,'Myanma Kyat','MMK','MMK','K',0,0,'Myanma kyats',1243,'2016-09-26 23:47:13',0),(72,'Macanese Pataca','MOP','MOP$','MOP$',2,0,'Macanese patacas',7.9877,'2016-09-26 23:47:13',0),(73,'Mauritian Rupee','MUR','MURs','MURs',0,0,'Mauritian rupees',35.22,'2016-09-26 23:47:13',0),(74,'Mexican Peso','MXN','MX$','$',2,0,'Mexican pesos',19.8467,'2016-09-26 23:47:13',0),(75,'Malaysian Ringgit','MYR','RM','RM',2,0,'Malaysian ringgits',4.12505,'2016-09-26 23:47:13',0),(76,'Mozambican Metical','MZN','MTn','MTn',2,0,'Mozambican meticals',76.81,'2016-09-26 23:47:13',0),(77,'Namibian Dollar','NAD','N$','N$',2,0,'Namibian dollars',13.6501,'2016-09-26 23:47:13',0),(78,'Nigerian Naira','NGN','â‚¦','â‚¦',2,0,'Nigerian nairas',304.434,'2016-09-26 23:47:13',0),(79,'Nicaraguan CÃ³rdoba','NIO','C$','C$',2,0,'Nicaraguan cÃ³rdobas',28.9513,'2016-09-26 23:47:13',0),(80,'Norwegian Krone','NOK','Nkr','kr',2,0,'Norwegian kroner',8.1058,'2016-09-26 23:47:13',0),(81,'Nepalese Rupee','NPR','NPRs','à¤¨à¥‡à¤°à¥‚',2,0,'Nepalese rupees',106.35,'2016-09-26 23:47:13',0),(82,'New Zealand Dollar','NZD','NZ$','$',2,0,'New Zealand dollars',1.3762,'2016-09-26 23:47:14',0),(83,'Omani Rial','OMR','OMR','Ø±.Ø¹.â€',3,0,'Omani rials',0.384992,'2016-09-26 23:47:14',0),(84,'Panamanian Balboa','PAB','B/.','B/.',2,0,'Panamanian balboas',1,'2016-09-26 23:47:14',0),(85,'Peruvian Nuevo Sol','PEN','S/.','S/.',2,0,'Peruvian nuevos soles',3.35306,'2016-09-26 23:47:14',0),(86,'Philippine Peso','PHP','â‚±','â‚±',2,0,'Philippine pesos',48.31,'2016-09-26 23:47:14',0),(87,'Pakistani Rupee','PKR','PKRs','â‚¨',0,0,'Pakistani rupees',104.7,'2016-09-26 23:47:14',0),(88,'Polish Zloty','PLN','zÅ‚','zÅ‚',2,0,'Polish zlotys',3.8142,'2016-09-26 23:47:14',0),(89,'Paraguayan Guarani','PYG','â‚²','â‚²',0,0,'Paraguayan guaranis',5577,'2016-09-26 23:47:14',0),(90,'Qatari Rial','QAR','QR','Ø±.Ù‚.â€',2,0,'Qatari rials',3.6414,'2016-09-26 23:47:14',0),(91,'Romanian Leu','RON','RON','RON',2,0,'Romanian lei',3.9508,'2016-09-26 23:47:14',0),(92,'Serbian Dinar','RSD','din.','Ð´Ð¸Ð½.',0,0,'Serbian dinars',109.38,'2016-09-26 23:47:14',0),(93,'Russian Ruble','RUB','RUB','Ñ€ÑƒÐ±.',2,0,'Russian rubles',63.6267,'2016-09-26 23:47:14',0),(94,'Rwandan Franc','RWF','RWF','FR',0,0,'Rwandan francs',801.57,'2016-09-26 23:47:14',0),(95,'Saudi Riyal','SAR','SR','Ø±.Ø³.â€',2,0,'Saudi riyals',3.7509,'2016-09-26 23:47:14',0),(96,'Sudanese Pound','SDG','SDG','SDG',2,0,'Sudanese pounds',6.19043,'2016-09-26 23:47:14',0),(97,'Swedish Krona','SEK','Skr','kr',2,0,'Swedish kronor',8.5354,'2016-09-26 23:47:14',0),(98,'Singapore Dollar','SGD','S$','$',2,0,'Singapore dollars',1.35921,'2016-09-26 23:47:14',0),(99,'Somali Shilling','SOS','Ssh','Ssh',0,0,'Somali shillings',558,'2016-09-26 23:47:14',0),(100,'Syrian Pound','SYP','SYÂ£','Ù„.Ø³.â€',0,0,'Syrian pounds',213.55,'2016-09-26 23:47:14',0),(101,'Thai Baht','THB','à¸¿','à¸¿',2,0,'Thai baht',34.5898,'2016-09-26 23:47:15',0),(102,'Tunisian Dinar','TND','DT','Ø¯.Øª.â€',3,0,'Tunisian dinars',2.196,'2016-09-26 23:47:15',0),(103,'Tongan PaÊ»anga','TOP','T$','T$',2,0,'Tongan paÊ»anga',2.2462,'2016-09-26 23:47:15',0),(104,'Turkish Lira','TRY','TL','TL',2,0,'Turkish Lira',2.9806,'2016-09-26 23:47:15',0),(105,'Trinidad and Tobago Dollar','TTD','TT$','$',2,0,'Trinidad and Tobago dollars',6.6695,'2016-09-26 23:47:15',0),(106,'New Taiwan Dollar','TWD','NT$','NT$',2,0,'New Taiwan dollars',31.407,'2016-09-26 23:47:15',0),(107,'Tanzanian Shilling','TZS','TSh','TSh',0,0,'Tanzanian shillings',2175,'2016-09-26 23:47:15',0),(108,'Ukrainian Hryvnia','UAH','â‚´','â‚´',2,0,'Ukrainian hryvnias',25.87,'2016-09-26 23:47:15',0),(109,'Ugandan Shilling','UGX','USh','USh',0,0,'Ugandan shillings',3383,'2016-09-26 23:47:15',0),(110,'Uruguayan Peso','UYU','$U','$',2,0,'Uruguayan pesos',28.4195,'2016-09-26 23:47:15',0),(111,'Uzbekistan Som','UZS','UZS','UZS',0,0,'Uzbekistan som',3000,'2016-09-26 23:47:15',0),(112,'Venezuelan BolÃ­var','VEF','Bs.F.','Bs.F.',2,0,'Venezuelan bolÃ­vars',9.96988,'2016-09-26 23:47:15',0),(113,'Vietnamese Dong','VND','â‚«','â‚«',0,0,'Vietnamese dong',22311,'2016-09-26 23:47:15',0),(114,'CFA Franc BEAC','XAF','FCFA','FCFA',0,0,'CFA francs BEAC',582.22,'2016-09-26 23:47:15',0),(115,'CFA Franc BCEAO','XOF','CFA','CFA',0,0,'CFA francs BCEAO',582.45,'2016-09-26 23:47:15',0),(116,'Yemeni Rial','YER','YR','Ø±.ÙŠ.â€',0,0,'Yemeni rials',249.7,'2016-09-26 23:47:15',0),(117,'South African Rand','ZAR','R','R',2,0,'South African rand',13.6525,'2016-09-26 23:47:15',0),(118,'Zambian Kwacha','ZMK','ZK','ZK',0,0,'Zambian kwachas',5156.1,'2016-09-26 23:47:15',0),(119,'Lao kip','LAK','₭','₭N',0,0,'Lao Kip',8100,'2016-09-26 23:47:13',0);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district_municipalities`
--

DROP TABLE IF EXISTS `district_municipalities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district_municipalities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `province_districts_id` int(11) NOT NULL,
  `is_district` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district_municipalities`
--

LOCK TABLES `district_municipalities` WRITE;
/*!40000 ALTER TABLE `district_municipalities` DISABLE KEYS */;
INSERT INTO `district_municipalities` VALUES (2,'12',168,1,NULL),(3,'District of US',169,1,NULL),(4,'4',170,1,NULL),(5,'Town',171,1,NULL),(6,'4',172,1,NULL),(7,'155',173,1,NULL),(8,'4',174,1,NULL),(9,'4',175,1,NULL),(10,'Tawi Tawi',176,1,NULL),(11,'23',177,1,NULL),(12,'5',178,1,NULL),(13,'4',179,1,NULL),(14,'3',180,1,NULL),(15,'5',181,1,NULL),(16,'2',182,1,NULL),(17,'3',183,1,NULL),(18,'55',184,1,NULL),(19,'14',185,1,NULL),(20,'7',186,1,NULL),(21,'3',187,1,NULL),(22,'2',188,1,NULL),(23,'AA',189,1,NULL),(24,'District',190,1,NULL),(25,'444',191,1,NULL),(26,'2',192,1,NULL),(27,'3',193,1,NULL),(28,'3',194,1,NULL),(29,'3',195,1,NULL),(30,'8',196,1,NULL),(31,'2',197,1,NULL),(32,'2',198,1,NULL),(33,'45',176,1,NULL),(34,'A',199,1,NULL),(35,'3',200,1,NULL),(36,'45',201,1,NULL),(37,'3',202,1,NULL),(38,'4',203,1,NULL),(39,'4',204,1,NULL);
/*!40000 ALTER TABLE `district_municipalities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer_seasons`
--

DROP TABLE IF EXISTS `farmer_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmer_seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farmers_id` int(11) NOT NULL,
  `seasons_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `sowing_date` datetime NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `import` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`farmers_id`),
  KEY `index3` (`seasons_id`),
  KEY `index4` (`year`),
  KEY `index5` (`sowing_date`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer_seasons`
--

LOCK TABLES `farmer_seasons` WRITE;
/*!40000 ALTER TABLE `farmer_seasons` DISABLE KEYS */;
INSERT INTO `farmer_seasons` VALUES (1,1,2,2015,'2016-09-22 10:27:18',0,1),(2,2,2,2015,'2016-09-22 10:27:18',0,1),(3,3,2,2015,'2016-09-22 10:27:18',0,1),(4,4,2,2015,'2016-09-22 10:27:18',0,1),(5,5,2,2015,'2016-09-22 10:27:18',0,1),(6,6,2,2015,'2016-09-22 10:27:18',0,1),(7,7,2,2015,'2016-09-22 10:27:18',0,1),(8,8,2,2015,'2016-09-22 10:27:18',0,1),(9,9,2,2015,'2016-09-22 10:27:18',0,1),(10,10,2,2015,'2016-09-22 10:27:18',0,1),(11,11,2,2015,'2016-09-22 10:27:18',0,1),(12,12,2,2015,'2016-09-22 10:27:18',0,1),(13,13,2,2015,'2016-09-22 10:27:18',0,1),(14,14,2,2015,'2016-09-22 10:27:18',0,1),(15,15,2,2015,'2016-09-22 10:27:18',0,1),(16,16,2,2015,'2016-09-22 10:27:18',0,1),(17,17,2,2015,'2016-09-22 10:27:18',0,1),(18,18,2,2015,'2016-09-22 10:27:18',0,1),(19,19,2,2015,'2016-09-22 10:27:18',0,1),(20,20,2,2015,'2016-09-22 10:27:18',0,1),(21,21,2,2015,'2016-09-22 10:31:43',0,1),(22,22,2,2015,'2016-09-22 10:31:43',0,1),(23,23,2,2015,'2016-09-22 10:31:43',0,1),(24,24,2,2015,'2016-09-22 10:31:43',0,1),(25,25,2,2015,'2016-09-22 10:31:43',0,1),(26,26,2,2015,'2016-09-22 10:31:43',0,1),(27,27,2,2015,'2016-09-22 10:31:44',0,1),(28,28,2,2015,'2016-09-22 10:31:44',0,1),(29,29,2,2015,'2016-09-22 10:31:44',0,1),(30,30,2,2015,'2016-09-22 10:31:44',0,1),(31,31,2,2015,'2016-09-22 10:31:44',0,1),(32,32,2,2015,'2016-09-22 10:31:44',0,1),(33,33,2,2015,'2016-09-22 10:31:44',0,1),(34,34,2,2015,'2016-09-22 10:31:44',0,1),(35,35,2,2015,'2016-09-22 10:31:44',0,1),(36,36,2,2015,'2016-09-22 10:31:44',0,1),(37,37,2,2015,'2016-09-22 10:31:44',0,1),(38,38,2,2015,'2016-09-22 10:31:44',0,1),(39,39,2,2015,'2016-09-22 10:31:44',0,1),(40,40,2,2015,'2016-09-22 10:31:44',0,1),(41,41,2,2015,'2016-09-22 10:47:35',0,1),(42,42,2,2015,'2016-09-22 10:47:35',0,1),(43,43,2,2015,'2016-09-22 10:47:35',0,1),(44,44,2,2015,'2016-09-22 10:47:35',0,1),(45,45,2,2015,'2016-09-22 10:47:36',0,1),(46,46,2,2015,'2016-09-22 10:47:36',0,1),(47,47,2,2015,'2016-09-22 10:47:36',0,1),(48,48,2,2015,'2016-09-22 10:47:36',0,1),(49,49,2,2015,'2016-09-22 10:47:36',0,1),(50,50,2,2015,'2016-09-22 10:47:36',0,1),(51,51,2,2015,'2016-09-22 10:47:36',0,1),(52,52,2,2015,'2016-09-22 10:47:36',0,1),(53,53,2,2015,'2016-09-22 10:47:36',0,1),(54,54,2,2015,'2016-09-22 10:47:36',0,1),(55,55,2,2015,'2016-09-22 10:47:36',0,1),(56,56,2,2015,'2016-09-22 10:47:36',0,1),(57,57,2,2015,'2016-09-22 10:47:36',0,1),(58,58,2,2015,'2016-09-22 10:47:36',0,1),(59,59,2,2015,'2016-09-22 10:47:36',0,1),(60,60,2,2015,'2016-09-22 10:47:36',0,1),(61,61,1,2015,'2016-08-28 00:00:00',0,0),(62,61,1,2016,'2017-02-13 00:00:00',0,0),(63,62,1,2016,'2017-02-09 00:00:00',0,0),(64,61,1,2016,'2017-02-07 00:00:00',0,0),(65,61,2,2015,'2016-10-03 00:00:00',0,0),(66,63,1,2017,'2017-02-21 00:00:00',0,0);
/*!40000 ALTER TABLE `farmer_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmers`
--

DROP TABLE IF EXISTS `farmers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farmers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `countries_id` int(11) NOT NULL,
  `region_provinces_id` int(11) DEFAULT NULL,
  `province_districts_id` int(11) DEFAULT NULL,
  `district_municipalities_id` int(11) DEFAULT NULL,
  `villages_id` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `farmer_groups_id` int(11) DEFAULT '0',
  `import` tinyint(4) NOT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index2` (`countries_id`),
  KEY `index3` (`region_provinces_id`),
  KEY `index4` (`province_districts_id`),
  KEY `index5` (`district_municipalities_id`),
  KEY `index6` (`villages_id`),
  KEY `index7` (`first_name`),
  KEY `index8` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmers`
--

LOCK TABLES `farmers` WRITE;
/*!40000 ALTER TABLE `farmers` DISABLE KEYS */;
INSERT INTO `farmers` VALUES (1,'Äá»— Ngá»c','Thiá»m',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(2,'VÅ© thá»‹','HÆ°Æ¡ng',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(3,'Nguyá»…n ÄÃ¬nh','Toáº£n',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(4,'BÃ¹i thá»‹','ThÃºy',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(5,'Nguyá»…n VÄƒn','Tuy',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(6,'BÃ¹i VÄƒn','Long',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(7,'Nguyá»…n VÄƒn','ThÃ nh',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(8,'Pháº¡m Trá»ng','NguyÃªn',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(9,'VÅ¨ Äá»¨C','Bá»˜I',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(10,'Pháº¡m VÄƒn','ThÆ°á»ng',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(11,'Nguyá»…n Giang','HoÃ nh',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(12,'VÅ© VÄƒn','Thá»¥',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(13,'VÅ© VÄƒn','Báº¡ch',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(14,'PHAM VAN','TUYET',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(15,'HoÃ ng VÄƒn','Khang',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(16,'Nguyá»…n VÄƒn','LÃ£m',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(17,'VÅ© VÄƒn','Nam',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(18,'Nguyá»…n Huy','KhÃ¡nh',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(19,'Nguyá»…n vÄƒn','Tháº¡nh',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(20,'VÅ© VÄƒn','HÃ¹ng',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(21,'Äá»— Ngá»c','Thiá»m',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(22,'VÅ© thá»‹','HÆ°Æ¡ng',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(23,'Nguyá»…n ÄÃ¬nh','Toáº£n',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(24,'BÃ¹i thá»‹','ThÃºy',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(25,'Nguyá»…n VÄƒn','Tuy',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(26,'BÃ¹i VÄƒn','Long',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(27,'Nguyá»…n VÄƒn','ThÃ nh',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(28,'Pháº¡m Trá»ng','NguyÃªn',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(29,'VÅ¨ Äá»¨C','Bá»˜I',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(30,'Pháº¡m VÄƒn','ThÆ°á»ng',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(31,'Nguyá»…n Giang','HoÃ nh',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(32,'VÅ© VÄƒn','Thá»¥',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(33,'VÅ© VÄƒn','Báº¡ch',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(34,'PHAM VAN','TUYET',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(35,'HoÃ ng VÄƒn','Khang',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(36,'Nguyá»…n VÄƒn','LÃ£m',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(37,'VÅ© VÄƒn','Nam',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(38,'Nguyá»…n Huy','KhÃ¡nh',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(39,'Nguyá»…n vÄƒn','Tháº¡nh',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(40,'VÅ© VÄƒn','HÃ¹ng',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(41,'Äá»— Ngá»c','Thiá»m',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(42,'VÅ© thá»‹','HÆ°Æ¡ng',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(43,'Nguyá»…n ÄÃ¬nh','Toáº£n',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(44,'BÃ¹i thá»‹','ThÃºy',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(45,'Nguyá»…n VÄƒn','Tuy',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(46,'BÃ¹i VÄƒn','Long',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(47,'Nguyá»…n VÄƒn','ThÃ nh',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(48,'Pháº¡m Trá»ng','NguyÃªn',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(49,'VÅ¨ Äá»¨C','Bá»˜I',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(50,'Pháº¡m VÄƒn','ThÆ°á»ng',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(51,'Nguyá»…n Giang','HoÃ nh',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(52,'VÅ© VÄƒn','Thá»¥',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(53,'VÅ© VÄƒn','Báº¡ch',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(54,'PHAM VAN','TUYET',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(55,'HoÃ ng VÄƒn','Khang',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(56,'Nguyá»…n VÄƒn','LÃ£m',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(57,'VÅ© VÄƒn','Nam',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(58,'Nguyá»…n Huy','KhÃ¡nh',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(59,'Nguyá»…n vÄƒn','Tháº¡nh',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(60,'VÅ© VÄƒn','HÃ¹ng',14,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0),(61,'Existing Farmer','One',14,125,202,37,37,NULL,NULL,0,0,0,1),(62,'ABC','DEF',163,126,203,38,38,NULL,NULL,0,0,0,1),(63,'ABCCCCC','DDDDEEE',191,127,204,39,39,NULL,NULL,0,0,0,1);
/*!40000 ALTER TABLE `farmers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey`
--

DROP TABLE IF EXISTS `household_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farmers_id` int(11) NOT NULL,
  `farmer_seasons_id` int(11) NOT NULL,
  `import` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index2` (`farmers_id`),
  KEY `index3` (`farmer_seasons_id`),
  KEY `index4` (`farmer_seasons_id`,`farmers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey`
--

LOCK TABLES `household_survey` WRITE;
/*!40000 ALTER TABLE `household_survey` DISABLE KEYS */;
INSERT INTO `household_survey` VALUES (1,61,61,0),(2,61,64,0),(3,61,65,0);
/*!40000 ALTER TABLE `household_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_child_labor`
--

DROP TABLE IF EXISTS `household_survey_child_labor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_child_labor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `employment_below_18` tinyint(4) NOT NULL,
  `employment_above_18` tinyint(4) NOT NULL,
  `school_going_children_employed` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_child_labor`
--

LOCK TABLES `household_survey_child_labor` WRITE;
/*!40000 ALTER TABLE `household_survey_child_labor` DISABLE KEYS */;
INSERT INTO `household_survey_child_labor` VALUES (1,2,0,0,0),(2,3,1,1,1);
/*!40000 ALTER TABLE `household_survey_child_labor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_child_labor_record`
--

DROP TABLE IF EXISTS `household_survey_child_labor_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_child_labor_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_child_labor_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_child_labor_record`
--

LOCK TABLES `household_survey_child_labor_record` WRITE;
/*!40000 ALTER TABLE `household_survey_child_labor_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `household_survey_child_labor_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_cleaning_drying`
--

DROP TABLE IF EXISTS `household_survey_cleaning_drying`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_cleaning_drying` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `dry_threshed_grain` tinyint(4) NOT NULL,
  `labor_count` int(11) NOT NULL,
  `labor_type` tinyint(4) NOT NULL,
  `male_labor` int(11) NOT NULL,
  `female_labor` int(11) NOT NULL,
  `above_18_years_old` int(11) NOT NULL,
  `below_18_years_old` int(11) NOT NULL,
  `labor_total_cost` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_cleaning_drying`
--

LOCK TABLES `household_survey_cleaning_drying` WRITE;
/*!40000 ALTER TABLE `household_survey_cleaning_drying` DISABLE KEYS */;
INSERT INTO `household_survey_cleaning_drying` VALUES (1,2,0,0,0,0,0,0,0,0),(2,3,3,2,1,3,4,5,6,1);
/*!40000 ALTER TABLE `household_survey_cleaning_drying` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_compost`
--

DROP TABLE IF EXISTS `household_survey_compost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_compost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farmer_id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  `organic_materials` varchar(100) NOT NULL,
  `straw_managed_previous_crop` varchar(100) NOT NULL,
  `days_before_rice_planting` int(11) NOT NULL,
  `organic_materials_amount` int(11) NOT NULL,
  `organic_materials_total_cost` int(11) NOT NULL,
  `labor_used` tinyint(4) NOT NULL,
  `male_labor` int(11) NOT NULL,
  `female_labor` int(11) NOT NULL,
  `hired_exchange_male_labor` int(11) NOT NULL,
  `hired_exchange_female_labor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_compost`
--

LOCK TABLES `household_survey_compost` WRITE;
/*!40000 ALTER TABLE `household_survey_compost` DISABLE KEYS */;
/*!40000 ALTER TABLE `household_survey_compost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_computation`
--

DROP TABLE IF EXISTS `household_survey_computation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_computation` (
  `farmers_id` int(11) NOT NULL,
  `farmer_seasons_id` int(11) NOT NULL,
  `seed_cost` int(11) NOT NULL DEFAULT '0',
  `land_preparation_cost` int(11) NOT NULL DEFAULT '0',
  `sowing_transplanting_cost` int(11) NOT NULL DEFAULT '0',
  `nursery_seedling_production_cost` int(11) NOT NULL DEFAULT '0',
  `irrigation_cost` int(11) NOT NULL DEFAULT '0',
  `fertilizer_application_cost` int(11) NOT NULL DEFAULT '0',
  `weeding_cost` int(11) NOT NULL DEFAULT '0',
  `organic_material_cost` int(11) NOT NULL DEFAULT '0',
  `seed_rate` int(11) NOT NULL DEFAULT '0',
  `land_preparation_date` datetime NOT NULL,
  `nursery_establishment_date` datetime NOT NULL,
  `sowing_transplanting_date` datetime NOT NULL,
  KEY `index1` (`farmers_id`,`farmer_seasons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_computation`
--

LOCK TABLES `household_survey_computation` WRITE;
/*!40000 ALTER TABLE `household_survey_computation` DISABLE KEYS */;
/*!40000 ALTER TABLE `household_survey_computation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_computations`
--

DROP TABLE IF EXISTS `household_survey_computations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_computations` (
  `farmers_id` float DEFAULT '0',
  `farmer_seasons_id` float DEFAULT '0',
  `seed_cost` float DEFAULT '0',
  `land_preparation_cost` float DEFAULT '0',
  `sowing_transplanting_cost` float DEFAULT '0',
  `nursery_seedling_production_cost` float DEFAULT '0',
  `nursery_preparation_cost` float DEFAULT '0',
  `nursery_preparation_machine_transplanting_cost` float DEFAULT '0',
  `purchased_seedling_cost` float DEFAULT '0',
  `irrigation_cost` float DEFAULT '0',
  `fertilizer_application_cost` float DEFAULT '0',
  `weeding_cost` float DEFAULT '0',
  `organic_material_cost` float DEFAULT '0',
  `seed_rate` float DEFAULT '0',
  `land_preparation_date` datetime DEFAULT NULL,
  `nursery_establishment_date` datetime DEFAULT NULL,
  `sowing_transplanting_date` datetime DEFAULT NULL,
  `harvesting_date` datetime DEFAULT NULL,
  `threshing_date` datetime DEFAULT NULL,
  `seedling_age` float DEFAULT '0',
  `crop_growing_duration` float DEFAULT '0',
  `pesticide_cost` float DEFAULT '0',
  `harvesting_threshing_cost` float DEFAULT '0',
  `cleaning_drying_cost` float DEFAULT '0',
  `total_cost` float DEFAULT '0',
  `straw_yield_previous_crop` float DEFAULT '0',
  `grain_yield` float DEFAULT '0',
  `straw_yield` float DEFAULT '0',
  `total_gross_income` float DEFAULT '0',
  `total_labor` float DEFAULT '0',
  `total_male_labor` float DEFAULT '0',
  `total_female_labor` float DEFAULT '0',
  `total_above_18_labor` float DEFAULT '0',
  `total_below_18_labor` float DEFAULT '0',
  `net_profit` float DEFAULT '0',
  `labor_productivity` float DEFAULT '0',
  `female_to_male_ratio` float DEFAULT '0',
  `below_to_above_18_ratio` float DEFAULT '0',
  `nitrogen_amount` float DEFAULT '0',
  `nitrogen_count` float DEFAULT '0',
  `phosphorus_amount` float DEFAULT '0',
  `phosphorus_count` float DEFAULT '0',
  `potassium_amount` float DEFAULT '0',
  `potassium_count` float DEFAULT '0',
  `nitrogen_use_efficiency` float DEFAULT '0',
  `phosphorus_use_efficiency` float DEFAULT '0',
  `potassium_use_efficiency` float DEFAULT '0',
  `zn_application` float DEFAULT '0',
  `sulphur_application` float DEFAULT '0',
  `total_nitrogen_uptake` float DEFAULT '0',
  `total_phosphorus_uptake` float DEFAULT '0',
  `nitrogen_use_efficiency_method_two` float DEFAULT '0',
  `phosphorus_use_efficiency_method_two` float DEFAULT '0',
  `water_applied_field_preparation` float DEFAULT '0',
  `water_applied_crop_growing` float DEFAULT '0',
  `irrigation_applied_count` float DEFAULT '0',
  `total_water_productivity_kg_grain` float DEFAULT '0',
  `total_water_productivity_litre_water` float DEFAULT '0',
  `total_irrigation_water_productivity` float DEFAULT '0',
  `rainfall_water_productivity` float DEFAULT '0',
  `sfo` float DEFAULT '0',
  `methane_emission` float DEFAULT '0',
  `co2_equivalent` float DEFAULT '0',
  `total_number_herbicide_application` float DEFAULT '0',
  `total_amount_herbicide_application` float DEFAULT '0',
  `herbicide_score` float DEFAULT '0',
  `herbicide_rank` varchar(50) DEFAULT NULL,
  `total_number_insecticide_application` float DEFAULT '0',
  `total_amount_insecticide_application` float DEFAULT '0',
  `insecticide_score` float DEFAULT '0',
  `insecticide_rank` varchar(50) DEFAULT NULL,
  `total_number_fungicide_application` float DEFAULT '0',
  `total_amount_fungicide_application` float DEFAULT '0',
  `fungicide_score` float DEFAULT '0',
  `fungicide_rank` varchar(50) DEFAULT NULL,
  `total_number_molluscicide_application` float DEFAULT '0',
  `total_amount_molluscicide_application` float DEFAULT '0',
  `molluscicide_score` float DEFAULT '0',
  `molluscicide_rank` varchar(50) DEFAULT '0',
  `total_number_rodenticide_application` float DEFAULT '0',
  `total_amount_rodenticide_application` float DEFAULT '0',
  `rodenticide_score` float DEFAULT '0',
  `rodenticide_rank` varchar(50) DEFAULT '0',
  `total_number_pesticide_application` float DEFAULT '0',
  `total_amount_pesticide_application` float DEFAULT '0',
  `total_score_pesticide_application` float DEFAULT '0',
  `pesticide_ranking` float DEFAULT '0',
  `food_safety_score` float DEFAULT '0',
  `food_safety_rank` varchar(50) DEFAULT NULL,
  `worker_health_and_safety_score` float DEFAULT '0',
  `worker_health_and_safety_rank` varchar(50) DEFAULT NULL,
  `child_labor_score` float DEFAULT '0',
  `child_labor_rank` varchar(50) DEFAULT NULL,
  `women_empowerment_score` float DEFAULT '0',
  `women_empowerment_rank` varchar(50) DEFAULT NULL,
  `pesticide_use_efficiency_score` float DEFAULT '0',
  `pesticide_use_efficiency_rank` varchar(50) DEFAULT NULL,
  `import` tinyint(4) NOT NULL,
  KEY `index2` (`farmers_id`,`farmer_seasons_id`),
  KEY `index3` (`grain_yield`,`net_profit`),
  KEY `index4` (`farmers_id`),
  KEY `index5` (`farmer_seasons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_computations`
--

LOCK TABLES `household_survey_computations` WRITE;
/*!40000 ALTER TABLE `household_survey_computations` DISABLE KEYS */;
INSERT INTO `household_survey_computations` VALUES (61,61,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,15,'Acceptable',0,0,-15,'Unsustainable',0,0,15,'Acceptable',0,0,15,'Acceptable',0,0,15,'Acceptable',0,0,45,0,0,'Poor',0,'Poor',0,'Poor',0,'Poor',0,'Poor',0),(61,64,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','2017-02-06 16:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,15,'Acceptable',0,0,-15,'Unsustainable',0,0,15,'Acceptable',0,0,15,'Acceptable',0,0,15,'Acceptable',0,0,45,0,0,'Poor',0,'Poor',0,'Poor',0,'Poor',0,'Poor',0),(61,65,0.000359,0.001121,0.001121,0,0,0,0,0.000448,0.000314,0.001255,0.000538,2,'2016-09-22 00:00:00','0000-00-00 00:00:00','2016-10-02 16:00:00','2017-02-15 00:00:00','0000-00-00 00:00:00',0,135,0.003496,0.001121,0.000045,0.009457,226.901,26.2093,28.3847,0.004789,70,42,28,34,35,-0.004669,0.374419,0.666667,1.02941,4.14,1,10.58,1,0,0,6.33075,5.67656,0,0,0,0.472803,0.083424,1.45607,0.569767,0,-190,1,-0.000014,-71348.7,-0.000014,0.000874,1.00006,105.316,2632.91,1,0.001,-15,'Unsustainable',0,0,-15,'Unsustainable',1,0.001333,-15,'Unsustainable',0,0,15,'Acceptable',0,0,15,'Acceptable',2,0.002333,-15,0,50,'Fair',90,'Good',85,'Good',38,'Poor',44,'Poor',0);
/*!40000 ALTER TABLE `household_survey_computations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_fertilizer_application`
--

DROP TABLE IF EXISTS `household_survey_fertilizer_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_fertilizer_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `fertilizer_cost` int(11) NOT NULL,
  `labor_type` tinyint(4) NOT NULL,
  `male_labor` int(11) NOT NULL,
  `female_labor` int(11) NOT NULL,
  `above_18_years_old` int(11) NOT NULL,
  `below_18_years_old` int(11) NOT NULL,
  `labor_total_cost` int(11) NOT NULL,
  `fertilizer_application` tinyint(4) NOT NULL,
  `fertilizer_application_other` varchar(100) DEFAULT NULL,
  `grain_yield_parcel` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_fertilizer_application`
--

LOCK TABLES `household_survey_fertilizer_application` WRITE;
/*!40000 ALTER TABLE `household_survey_fertilizer_application` DISABLE KEYS */;
INSERT INTO `household_survey_fertilizer_application` VALUES (1,1,0,0,0,0,0,0,0,0,'',0),(2,2,0,0,0,0,0,0,0,0,'',0),(3,3,1,2,2,3,4,5,6,2,'',0);
/*!40000 ALTER TABLE `household_survey_fertilizer_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_fertilizer_application_info`
--

DROP TABLE IF EXISTS `household_survey_fertilizer_application_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_fertilizer_application_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_fertilizer_application_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `amount` int(11) NOT NULL,
  `n` int(11) NOT NULL,
  `p205` int(11) NOT NULL,
  `k20` int(11) NOT NULL,
  `zn` int(11) NOT NULL,
  `s` int(11) NOT NULL,
  `other` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_fertilizer_application_info`
--

LOCK TABLES `household_survey_fertilizer_application_info` WRITE;
/*!40000 ALTER TABLE `household_survey_fertilizer_application_info` DISABLE KEYS */;
INSERT INTO `household_survey_fertilizer_application_info` VALUES (9,3,'dap','2017-02-15 00:00:00',23,18,46,0,0,0,0);
/*!40000 ALTER TABLE `household_survey_fertilizer_application_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_food_safety`
--

DROP TABLE IF EXISTS `household_survey_food_safety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_food_safety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `aware_food_safety_risk` tinyint(4) NOT NULL,
  `heavy_metal_risk` varchar(100) NOT NULL,
  `soil_remediation` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_food_safety`
--

LOCK TABLES `household_survey_food_safety` WRITE;
/*!40000 ALTER TABLE `household_survey_food_safety` DISABLE KEYS */;
INSERT INTO `household_survey_food_safety` VALUES (1,2,0,'',''),(2,3,1,'2','3');
/*!40000 ALTER TABLE `household_survey_food_safety` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_food_security`
--

DROP TABLE IF EXISTS `household_survey_food_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_food_security` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `rice_amount_wet_season` int(11) NOT NULL,
  `rice_amount_dry_season` int(11) NOT NULL,
  `amount_unmilled_rice_wet_season` int(11) NOT NULL,
  `amount_unmilled_rice_dry_season` int(11) NOT NULL,
  `price_rice_sold_wet_season` int(11) NOT NULL,
  `price_rice_sold_dry_season` int(11) NOT NULL,
  `purchased_rice` tinyint(4) NOT NULL,
  `amount_milled_rice` int(11) NOT NULL,
  `amount_unmilled_rice` int(11) NOT NULL,
  `price_per_kg_milled_rice` int(11) NOT NULL,
  `price_per_kg_unmilled_rice` int(11) NOT NULL,
  `members_below_12_years_old` int(11) NOT NULL,
  `members_above_12_years_old` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_food_security`
--

LOCK TABLES `household_survey_food_security` WRITE;
/*!40000 ALTER TABLE `household_survey_food_security` DISABLE KEYS */;
/*!40000 ALTER TABLE `household_survey_food_security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_general_information`
--

DROP TABLE IF EXISTS `household_survey_general_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_general_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT '0',
  `age` tinyint(4) DEFAULT '0',
  `marital_status` tinyint(4) DEFAULT NULL,
  `literacy` tinyint(4) DEFAULT NULL,
  `years_schooling` tinyint(4) DEFAULT NULL,
  `primary_occupation` tinyint(4) DEFAULT NULL,
  `primary_occupation_others` varchar(100) DEFAULT NULL,
  `secondary_occupation` tinyint(4) DEFAULT NULL,
  `secondary_occupation_others` varchar(100) DEFAULT NULL,
  `religion` tinyint(4) DEFAULT NULL,
  `religion_others` varchar(45) DEFAULT NULL,
  `contact_number` int(11) DEFAULT NULL,
  `attended_training` tinyint(4) DEFAULT NULL,
  `training` tinyint(4) DEFAULT NULL,
  `training_others` varchar(100) DEFAULT NULL,
  `training_duration` int(11) DEFAULT NULL,
  `total_income_farm` int(11) DEFAULT NULL,
  `total_income_non_farm` int(11) DEFAULT NULL,
  `farming_years` int(11) DEFAULT NULL,
  `machineries` tinyint(4) DEFAULT NULL,
  `ownership` tinyint(4) DEFAULT NULL,
  `economic_condition` tinyint(4) DEFAULT NULL,
  `economic_condition_change` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_general_information`
--

LOCK TABLES `household_survey_general_information` WRITE;
/*!40000 ALTER TABLE `household_survey_general_information` DISABLE KEYS */;
INSERT INTO `household_survey_general_information` VALUES (1,2,0,0,0,0,0,0,'',0,'',0,'',0,0,0,'',0,0,0,0,0,0,0,0),(2,3,1,21,1,2,0,1,'',1,'',3,'',23131,1,3,'',14,14,11,112,1,2,2,3);
/*!40000 ALTER TABLE `household_survey_general_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_general_information_problems`
--

DROP TABLE IF EXISTS `household_survey_general_information_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_general_information_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_general_information_id` int(11) NOT NULL,
  `problem` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_general_information_problems`
--

LOCK TABLES `household_survey_general_information_problems` WRITE;
/*!40000 ALTER TABLE `household_survey_general_information_problems` DISABLE KEYS */;
INSERT INTO `household_survey_general_information_problems` VALUES (25,2,'1'),(26,2,'2'),(27,2,'3');
/*!40000 ALTER TABLE `household_survey_general_information_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_grain_and_straw_yield`
--

DROP TABLE IF EXISTS `household_survey_grain_and_straw_yield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_grain_and_straw_yield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `rice_amount` int(11) NOT NULL,
  `grain_amount` int(11) NOT NULL,
  `rice_selling_price` int(11) NOT NULL,
  `straw_sold` tinyint(4) NOT NULL,
  `straw_total_price` int(11) NOT NULL,
  `straw_handled` tinyint(4) NOT NULL,
  `grain_moisture_content` int(11) NOT NULL,
  `total_rainfall` int(11) NOT NULL,
  `irrigation_method` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_grain_and_straw_yield`
--

LOCK TABLES `household_survey_grain_and_straw_yield` WRITE;
/*!40000 ALTER TABLE `household_survey_grain_and_straw_yield` DISABLE KEYS */;
INSERT INTO `household_survey_grain_and_straw_yield` VALUES (1,2,0,0,0,0,0,0,0,0,0),(2,3,23,1,4,1,2,0,2,3,2);
/*!40000 ALTER TABLE `household_survey_grain_and_straw_yield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_harvesting_threshing`
--

DROP TABLE IF EXISTS `household_survey_harvesting_threshing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_harvesting_threshing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `harvesting_method` tinyint(4) NOT NULL,
  `crop_harvest_date` datetime DEFAULT NULL,
  `combine_harvesting_total` int(11) NOT NULL,
  `harvesting_completion_time` int(11) NOT NULL,
  `combine_harvester_horse_power` int(11) NOT NULL,
  `combine_harvester_cutting_width` int(11) NOT NULL,
  `labor_type` tinyint(4) NOT NULL,
  `male_labor` int(11) NOT NULL,
  `female_labor` int(11) NOT NULL,
  `above_18_years_old` int(11) NOT NULL,
  `below_18_years_old` int(11) NOT NULL,
  `additional_labor` tinyint(4) NOT NULL,
  `additional_labor_cost` int(11) NOT NULL,
  `combine_harvester_owner` tinyint(4) NOT NULL,
  `manual_cutting_labor_count` int(11) NOT NULL,
  `total_labor_cost` int(11) NOT NULL,
  `amount_paid` int(11) NOT NULL,
  `wage_rate_male` int(11) NOT NULL,
  `wage_rate_female` int(11) NOT NULL,
  `labor_count_manual_cutting` int(11) NOT NULL,
  `threshing_date` datetime DEFAULT NULL,
  `thresher_operating_minute` int(11) NOT NULL,
  `threshing_machine_horse_power` int(11) NOT NULL,
  `threshing_total_cost` int(11) NOT NULL,
  `wage_rate_male_labor` int(11) NOT NULL,
  `wage_rate_female_labor` int(11) NOT NULL,
  `cutting_date` datetime DEFAULT NULL,
  `machine_cutting_name` varchar(100) DEFAULT NULL,
  `total_cost_cutting` int(11) NOT NULL,
  `labor_count_cutting_rice` int(11) NOT NULL,
  `male_cutting_wage_rate` int(11) NOT NULL,
  `female_cutting_wage_rate` int(11) NOT NULL,
  `rice_managed` tinyint(4) NOT NULL,
  `removed_straw` tinyint(4) NOT NULL,
  `grain_moisture_content` int(11) NOT NULL,
  `total_cost_manual_cutting` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_harvesting_threshing`
--

LOCK TABLES `household_survey_harvesting_threshing` WRITE;
/*!40000 ALTER TABLE `household_survey_harvesting_threshing` DISABLE KEYS */;
INSERT INTO `household_survey_harvesting_threshing` VALUES (1,2,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,0,0,'0000-00-00 00:00:00','',0,0,0,0,0,0,0,0),(2,3,1,'2017-02-15 00:00:00',2,3,3,3,2,23,2,1,1,1,23,2,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,0,0,'0000-00-00 00:00:00','',0,0,0,0,2,0,10,0);
/*!40000 ALTER TABLE `household_survey_harvesting_threshing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_irrigation`
--

DROP TABLE IF EXISTS `household_survey_irrigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_irrigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `water_condition` tinyint(4) NOT NULL,
  `irrigation_count` int(11) NOT NULL,
  `irrigation_energy_source` tinyint(4) NOT NULL,
  `pump_horse_power` int(11) NOT NULL,
  `hydraulic_lift_height` int(11) NOT NULL,
  `pump_disharge_rate` int(11) NOT NULL,
  `pump_operation_hour` int(11) NOT NULL,
  `discharge_pipe_diameter` int(11) NOT NULL,
  `electricity_consumed` int(11) NOT NULL,
  `diesel_consumed` int(11) NOT NULL,
  `total_fuel_cost` int(11) NOT NULL,
  `labor_type` tinyint(4) NOT NULL,
  `male_labor_count` int(11) NOT NULL,
  `female_labor_count` int(11) NOT NULL,
  `above_18_years_old_count` int(11) NOT NULL,
  `below_18_years_old_count` int(11) NOT NULL,
  `labor_total_cost` int(11) NOT NULL,
  `irrigation_field_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_irrigation`
--

LOCK TABLES `household_survey_irrigation` WRITE;
/*!40000 ALTER TABLE `household_survey_irrigation` DISABLE KEYS */;
INSERT INTO `household_survey_irrigation` VALUES (1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,3,2,1,0,0,0,0,0,0,0,0,4,1,2,3,4,5,6,0);
/*!40000 ALTER TABLE `household_survey_irrigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_irrigation_period`
--

DROP TABLE IF EXISTS `household_survey_irrigation_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_irrigation_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_irrigation_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `irrigated` tinyint(4) NOT NULL,
  `water_depth` int(11) NOT NULL,
  `standing_water` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_irrigation_period`
--

LOCK TABLES `household_survey_irrigation_period` WRITE;
/*!40000 ALTER TABLE `household_survey_irrigation_period` DISABLE KEYS */;
INSERT INTO `household_survey_irrigation_period` VALUES (9,2,'2017-02-14 00:00:00',1,4,23,'1');
/*!40000 ALTER TABLE `household_survey_irrigation_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_land_preparation`
--

DROP TABLE IF EXISTS `household_survey_land_preparation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_land_preparation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `crop_establishment` tinyint(4) NOT NULL,
  `land_preparation_started` datetime NOT NULL,
  `tractor_cost` int(11) NOT NULL,
  `labor_type` tinyint(4) NOT NULL,
  `male_labor_count` int(11) NOT NULL DEFAULT '0',
  `female_labor_count` int(11) NOT NULL DEFAULT '0',
  `above_18_years_old_count` int(11) NOT NULL DEFAULT '0',
  `below_18_years_old_count` int(11) NOT NULL,
  `labor_total_cost` int(11) NOT NULL,
  `wage_rate_per_day_male` int(11) NOT NULL,
  `wage_rate_per_day_female` int(11) NOT NULL,
  `import` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_land_preparation`
--

LOCK TABLES `household_survey_land_preparation` WRITE;
/*!40000 ALTER TABLE `household_survey_land_preparation` DISABLE KEYS */;
INSERT INTO `household_survey_land_preparation` VALUES (1,1,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0),(2,2,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0),(3,3,1,'2016-09-22 00:00:00',23,1,4,5,6,1,2,3,4,0);
/*!40000 ALTER TABLE `household_survey_land_preparation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_land_preparation_operations`
--

DROP TABLE IF EXISTS `household_survey_land_preparation_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_land_preparation_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_land_preparation_id` int(11) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `date` datetime NOT NULL,
  `power_source` tinyint(4) NOT NULL,
  `tractor_horsepower` int(11) NOT NULL,
  `tractor_hour_usage` int(11) NOT NULL,
  `soil_condition` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_land_preparation_operations`
--

LOCK TABLES `household_survey_land_preparation_operations` WRITE;
/*!40000 ALTER TABLE `household_survey_land_preparation_operations` DISABLE KEYS */;
INSERT INTO `household_survey_land_preparation_operations` VALUES (1,1,0,'0000-00-00 00:00:00',0,0,0,0),(6,2,0,'0000-00-00 00:00:00',0,0,0,0),(15,3,1,'2016-09-15 00:00:00',1,0,0,1);
/*!40000 ALTER TABLE `household_survey_land_preparation_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_nursery_establishment`
--

DROP TABLE IF EXISTS `household_survey_nursery_establishment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_nursery_establishment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farmer_id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  `nursery_date` datetime NOT NULL,
  `operation_used` varchar(100) NOT NULL,
  `horsepower_tractor` int(11) NOT NULL,
  `total_minute_tractor` int(11) NOT NULL,
  `total_hours_preparation` int(11) NOT NULL,
  `total_cost_nursery_establishment` int(11) NOT NULL,
  `labor_used` tinyint(4) NOT NULL,
  `male_labor` int(11) NOT NULL,
  `female_labor` int(11) NOT NULL,
  `hired_male_exchange_labor` int(11) NOT NULL,
  `hired_female_exchange_labor` int(11) NOT NULL,
  `operation_used_other` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_nursery_establishment`
--

LOCK TABLES `household_survey_nursery_establishment` WRITE;
/*!40000 ALTER TABLE `household_survey_nursery_establishment` DISABLE KEYS */;
/*!40000 ALTER TABLE `household_survey_nursery_establishment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_pesticide_application`
--

DROP TABLE IF EXISTS `household_survey_pesticide_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_pesticide_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `applied_pesticide` int(11) NOT NULL,
  `applied_pesticide_other` varchar(100) DEFAULT NULL,
  `pesticide_registered` tinyint(4) NOT NULL,
  `pesticide_forbidden` tinyint(4) NOT NULL,
  `pesticide_calibrated` int(11) NOT NULL,
  `total_cost_paid` int(11) NOT NULL,
  `labor_type` int(11) NOT NULL,
  `male_labor` int(11) NOT NULL,
  `female_labor` int(11) NOT NULL,
  `above_18_years_old` int(11) NOT NULL,
  `below_18_years_old` int(11) NOT NULL,
  `pesticide_labor_total_cost` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_pesticide_application`
--

LOCK TABLES `household_survey_pesticide_application` WRITE;
/*!40000 ALTER TABLE `household_survey_pesticide_application` DISABLE KEYS */;
INSERT INTO `household_survey_pesticide_application` VALUES (1,1,0,'0',0,0,0,0,0,0,0,0,0,0),(2,2,0,'0',0,0,0,0,0,0,0,0,0,0),(3,3,1,'0',0,0,1,2,2,2,3,4,5,76);
/*!40000 ALTER TABLE `household_survey_pesticide_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_pesticide_equipment`
--

DROP TABLE IF EXISTS `household_survey_pesticide_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_pesticide_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_pesticide_application_id` int(11) NOT NULL,
  `value` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`household_survey_pesticide_application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_pesticide_equipment`
--

LOCK TABLES `household_survey_pesticide_equipment` WRITE;
/*!40000 ALTER TABLE `household_survey_pesticide_equipment` DISABLE KEYS */;
INSERT INTO `household_survey_pesticide_equipment` VALUES (9,3,1);
/*!40000 ALTER TABLE `household_survey_pesticide_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_pesticide_rice_problems_detail`
--

DROP TABLE IF EXISTS `household_survey_pesticide_rice_problems_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_pesticide_rice_problems_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_pesticide_application_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `applied_date` datetime NOT NULL,
  `applied` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `leftover` int(11) NOT NULL DEFAULT '0',
  `brand_applied` varchar(100) DEFAULT NULL,
  `other` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_pesticide_rice_problems_detail`
--

LOCK TABLES `household_survey_pesticide_rice_problems_detail` WRITE;
/*!40000 ALTER TABLE `household_survey_pesticide_rice_problems_detail` DISABLE KEYS */;
INSERT INTO `household_survey_pesticide_rice_problems_detail` VALUES (9,3,'disease','2017-02-08 00:00:00',2,1,2,'2',0);
/*!40000 ALTER TABLE `household_survey_pesticide_rice_problems_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_pesticide_use_efficiency`
--

DROP TABLE IF EXISTS `household_survey_pesticide_use_efficiency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_pesticide_use_efficiency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL DEFAULT '0',
  `bird_management` int(11) NOT NULL DEFAULT '0',
  `disease_management` int(11) NOT NULL DEFAULT '0',
  `equipment_calibrated` int(11) NOT NULL DEFAULT '0',
  `insect_management` int(11) NOT NULL DEFAULT '0',
  `label_instructions` int(11) NOT NULL DEFAULT '0',
  `mollusk_management` int(11) NOT NULL DEFAULT '0',
  `registered_products` int(11) NOT NULL DEFAULT '0',
  `rodent_management` int(11) NOT NULL DEFAULT '0',
  `targeted_application` int(11) NOT NULL DEFAULT '0',
  `weed_management` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_pesticide_use_efficiency`
--

LOCK TABLES `household_survey_pesticide_use_efficiency` WRITE;
/*!40000 ALTER TABLE `household_survey_pesticide_use_efficiency` DISABLE KEYS */;
INSERT INTO `household_survey_pesticide_use_efficiency` VALUES (1,2,0,0,0,0,0,0,0,0,0,0),(2,3,1,3,4,3,3,2,3,1,3,1);
/*!40000 ALTER TABLE `household_survey_pesticide_use_efficiency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_pre_planting_information`
--

DROP TABLE IF EXISTS `household_survey_pre_planting_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_pre_planting_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `rice_area` double NOT NULL,
  `parcel_has_treatment` tinyint(4) NOT NULL DEFAULT '0',
  `treatment_name` varchar(100) NOT NULL DEFAULT '0',
  `previous_crop` tinyint(4) NOT NULL DEFAULT '0',
  `cropping_system` varchar(100) DEFAULT NULL,
  `previous_crop_harvested` datetime DEFAULT NULL,
  `straw_previous_crop_managed` varchar(100) DEFAULT NULL,
  `gps_north` int(11) NOT NULL DEFAULT '0',
  `gps_east` int(11) NOT NULL DEFAULT '0',
  `incorporate_organic_material` tinyint(4) NOT NULL DEFAULT '0',
  `organic_materials_incorporated` datetime DEFAULT NULL,
  `organic_material_cost` int(11) NOT NULL DEFAULT '0',
  `water_regime` tinyint(4) NOT NULL DEFAULT '0',
  `rice_variety_name` varchar(100) DEFAULT NULL,
  `seed_count` int(11) NOT NULL DEFAULT '0',
  `treatment_name_other` varchar(100) DEFAULT NULL,
  `land_rental` tinyint(4) NOT NULL,
  `rent_cost` int(11) NOT NULL DEFAULT '0',
  `grain_yield_previous` int(11) NOT NULL DEFAULT '0',
  `straw_burned` int(11) NOT NULL DEFAULT '0',
  `seed_type` int(11) NOT NULL DEFAULT '0',
  `seed_type_other` varchar(50) DEFAULT NULL,
  `soil_fertility` int(11) DEFAULT '0',
  `irrigation_regime` int(11) DEFAULT '0',
  `seed_certified` tinyint(4) NOT NULL DEFAULT '0',
  `import` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index2` (`household_survey_id`),
  KEY `index3` (`rice_area`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_pre_planting_information`
--

LOCK TABLES `household_survey_pre_planting_information` WRITE;
/*!40000 ALTER TABLE `household_survey_pre_planting_information` DISABLE KEYS */;
INSERT INTO `household_survey_pre_planting_information` VALUES (1,2,0,0,'',0,'','0000-00-00 00:00:00','',0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',0,0,0,0,0,'',0,0,0,0),(2,3,1,1,'SFLF',4,'1','2016-09-08 00:00:00','2',2,3,1,'2016-09-15 00:00:00',12,1,'ABC',2,'',2,0,231,1,3,'',2,2,0,0);
/*!40000 ALTER TABLE `household_survey_pre_planting_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_pre_planting_information_organic_materials`
--

DROP TABLE IF EXISTS `household_survey_pre_planting_information_organic_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_pre_planting_information_organic_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_pre_planting_information_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`household_survey_pre_planting_information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_pre_planting_information_organic_materials`
--

LOCK TABLES `household_survey_pre_planting_information_organic_materials` WRITE;
/*!40000 ALTER TABLE `household_survey_pre_planting_information_organic_materials` DISABLE KEYS */;
INSERT INTO `household_survey_pre_planting_information_organic_materials` VALUES (16,2,'Previous crop\'s straw',2),(17,2,'Compost',2);
/*!40000 ALTER TABLE `household_survey_pre_planting_information_organic_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_sowing_transplanting`
--

DROP TABLE IF EXISTS `household_survey_sowing_transplanting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_sowing_transplanting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `direct_sowing_method` tinyint(4) NOT NULL,
  `sowing_date` datetime DEFAULT NULL,
  `total_cost_paid_tractor` int(11) NOT NULL DEFAULT '0',
  `labor_type` tinyint(4) NOT NULL DEFAULT '0',
  `male_labor` int(11) NOT NULL,
  `female_labor` int(11) NOT NULL DEFAULT '0',
  `above_18_years_old` int(11) NOT NULL DEFAULT '0',
  `below_18_years_old` int(11) NOT NULL DEFAULT '0',
  `labor_total_cost` int(11) NOT NULL DEFAULT '0',
  `wage_rate_male` int(11) NOT NULL DEFAULT '0',
  `wage_rate_female` int(11) NOT NULL DEFAULT '0',
  `transplanting_method` tinyint(4) NOT NULL DEFAULT '0',
  `transplanting_carried_out` tinyint(4) NOT NULL DEFAULT '0',
  `total_cost_tractor` int(11) NOT NULL DEFAULT '0',
  `transplanting_labor_count` int(11) NOT NULL DEFAULT '0',
  `total_cost_paid_service_provider` int(11) NOT NULL DEFAULT '0',
  `custom_extra_labor` tinyint(4) NOT NULL DEFAULT '0',
  `custom_other_labor_count` int(11) NOT NULL DEFAULT '0',
  `prepared_nursery` tinyint(4) NOT NULL DEFAULT '0',
  `nursery_establishment_date` datetime DEFAULT NULL,
  `transplanting_date` datetime DEFAULT NULL,
  `trays_seedling_count` int(11) NOT NULL DEFAULT '0',
  `seed_total_cost` int(11) NOT NULL DEFAULT '0',
  `fertilizer_total_cost` int(11) NOT NULL DEFAULT '0',
  `total_labor_cost_seedling` int(11) NOT NULL DEFAULT '0',
  `total_cost_seedling_transport` int(11) NOT NULL DEFAULT '0',
  `nursery_area` int(11) NOT NULL DEFAULT '0',
  `nursery_field_area` tinyint(4) NOT NULL DEFAULT '0',
  `tractor_total_minute` int(11) NOT NULL DEFAULT '0',
  `total_seed_cost` int(11) NOT NULL DEFAULT '0',
  `seedling_labor_type` tinyint(4) NOT NULL DEFAULT '0',
  `seedling_male_labor` int(11) NOT NULL DEFAULT '0',
  `seedling_female_labor` int(11) NOT NULL DEFAULT '0',
  `seedling_above_18_years_old` int(11) NOT NULL DEFAULT '0',
  `seedling_below_18_years_old` int(11) NOT NULL DEFAULT '0',
  `nursery_labor_type` int(11) NOT NULL DEFAULT '0',
  `nursery_male_labor` int(11) NOT NULL DEFAULT '0',
  `nursery_female_labor` int(11) NOT NULL DEFAULT '0',
  `nursery_above_18_years_old` int(11) NOT NULL DEFAULT '0',
  `nursery_below_18_years_old` int(11) NOT NULL DEFAULT '0',
  `nursery_labor_total_cost` int(11) NOT NULL DEFAULT '0',
  `seedling_labor_total_cost` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index2` (`household_survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_sowing_transplanting`
--

LOCK TABLES `household_survey_sowing_transplanting` WRITE;
/*!40000 ALTER TABLE `household_survey_sowing_transplanting` DISABLE KEYS */;
INSERT INTO `household_survey_sowing_transplanting` VALUES (1,2,0,'2017-02-06 16:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,3,1,'2016-10-02 16:00:00',23,1,4,5,6,7,2,3,1,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `household_survey_sowing_transplanting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_weeding_herbicide`
--

DROP TABLE IF EXISTS `household_survey_weeding_herbicide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_weeding_herbicide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `control_weed` tinyint(4) NOT NULL,
  `weeding_carried_out` datetime DEFAULT NULL,
  `total_labor_weeding` int(11) NOT NULL,
  `weeding_labor` tinyint(4) NOT NULL,
  `weeding_male_labor` int(11) NOT NULL,
  `weeding_female_labor` int(11) NOT NULL,
  `weeding_above_18_years` int(11) NOT NULL,
  `weeding_below_18_years` int(11) NOT NULL,
  `weeding_wage_rate_male` int(11) NOT NULL,
  `weeding_wage_rate_female` int(11) NOT NULL,
  `herbicide_labor` tinyint(4) NOT NULL,
  `herbicide_count` int(11) NOT NULL,
  `herbicide_cost` int(11) NOT NULL,
  `herbicide_male_labor` int(11) NOT NULL,
  `herbicide_female_labor` int(11) NOT NULL,
  `herbicide_above_18_years` int(11) NOT NULL,
  `herbicide_below_18_years` int(11) NOT NULL,
  `herbicide_total_labor_cost` int(11) NOT NULL,
  `dominant_weed` tinyint(4) NOT NULL,
  `labor_total_cost` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_weeding_herbicide`
--

LOCK TABLES `household_survey_weeding_herbicide` WRITE;
/*!40000 ALTER TABLE `household_survey_weeding_herbicide` DISABLE KEYS */;
INSERT INTO `household_survey_weeding_herbicide` VALUES (1,2,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,3,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,2,1,23,2,3,4,5,5,1,0);
/*!40000 ALTER TABLE `household_survey_weeding_herbicide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_weeding_herbicide_application`
--

DROP TABLE IF EXISTS `household_survey_weeding_herbicide_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_weeding_herbicide_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_weeding_herbicide_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `technical_name` varchar(100) DEFAULT NULL,
  `active_ingredient` varchar(100) DEFAULT NULL,
  `bottles_applied` int(11) NOT NULL,
  `ml` int(11) NOT NULL,
  `leftover` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_weeding_herbicide_application`
--

LOCK TABLES `household_survey_weeding_herbicide_application` WRITE;
/*!40000 ALTER TABLE `household_survey_weeding_herbicide_application` DISABLE KEYS */;
INSERT INTO `household_survey_weeding_herbicide_application` VALUES (9,2,'2017-02-07 00:00:00','23','23','4',1,2,1);
/*!40000 ALTER TABLE `household_survey_weeding_herbicide_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_weeding_herbicide_weeds`
--

DROP TABLE IF EXISTS `household_survey_weeding_herbicide_weeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_weeding_herbicide_weeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_weeding_herbicide_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_weeding_herbicide_weeds`
--

LOCK TABLES `household_survey_weeding_herbicide_weeds` WRITE;
/*!40000 ALTER TABLE `household_survey_weeding_herbicide_weeds` DISABLE KEYS */;
INSERT INTO `household_survey_weeding_herbicide_weeds` VALUES (9,2,'Weed');
/*!40000 ALTER TABLE `household_survey_weeding_herbicide_weeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_women_empowerment`
--

DROP TABLE IF EXISTS `household_survey_women_empowerment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_women_empowerment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `womens_decision` tinyint(4) NOT NULL,
  `womens_control_over_decision` tinyint(4) NOT NULL,
  `womens_satisfaction_labor_input` tinyint(4) NOT NULL,
  `womens_access_information` tinyint(4) NOT NULL,
  `womens_access_seasonal_resources` tinyint(4) NOT NULL,
  `womens_control_long_term_resources` tinyint(4) NOT NULL,
  `womens_control_decision_making_household` tinyint(4) NOT NULL,
  `womens_control_personal_income` tinyint(4) NOT NULL,
  `womens_participation_decision_making` tinyint(4) NOT NULL,
  `violence_against_women` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_women_empowerment`
--

LOCK TABLES `household_survey_women_empowerment` WRITE;
/*!40000 ALTER TABLE `household_survey_women_empowerment` DISABLE KEYS */;
INSERT INTO `household_survey_women_empowerment` VALUES (1,2,0,0,0,0,0,0,0,0,0,0),(2,3,1,1,2,1,3,2,3,2,3,2);
/*!40000 ALTER TABLE `household_survey_women_empowerment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household_survey_workers_health_safety`
--

DROP TABLE IF EXISTS `household_survey_workers_health_safety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_workers_health_safety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
  `work_related_injuries` tinyint(4) NOT NULL,
  `safety_instructions_available` tinyint(4) NOT NULL,
  `tools_calibrated_maintained` tinyint(4) NOT NULL,
  `training_pesticide_applicators` tinyint(4) NOT NULL,
  `pesticide_applicator_good_quality` tinyint(4) NOT NULL,
  `washing_changing_facility_available` tinyint(4) NOT NULL,
  `pesticide_applied_pregnant_women` tinyint(4) NOT NULL,
  `re_entry_time_48_hour` tinyint(4) NOT NULL,
  `pesticide_inorganic_fertilizer_stored` tinyint(4) NOT NULL,
  `empty_pesticide_disposed` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_survey_workers_health_safety`
--

LOCK TABLES `household_survey_workers_health_safety` WRITE;
/*!40000 ALTER TABLE `household_survey_workers_health_safety` DISABLE KEYS */;
INSERT INTO `household_survey_workers_health_safety` VALUES (1,2,0,0,0,0,0,0,0,0,0,0),(2,3,1,2,2,3,1,1,1,1,1,2);
/*!40000 ALTER TABLE `household_survey_workers_health_safety` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province_districts`
--

DROP TABLE IF EXISTS `province_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province_districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_provinces_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `is_province` tinyint(4) NOT NULL DEFAULT '0',
  `other` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province_districts`
--

LOCK TABLES `province_districts` WRITE;
/*!40000 ALTER TABLE `province_districts` DISABLE KEYS */;
INSERT INTO `province_districts` VALUES (1,1,'Chiang Mai',1,0,0),(2,1,'Chiang Rai',1,0,0),(3,1,'Lampang',1,0,0),(4,1,'Lamphun',1,0,0),(5,1,'Mae Hong Son',1,0,0),(6,1,'Nan',1,0,0),(7,1,'Phayao',1,0,0),(8,1,'Phrae',1,0,0),(9,1,'Uttaradit',1,0,0),(10,1,'Tak',1,0,0),(11,1,'Sukhothai',1,0,0),(12,1,'Phitsanulok',1,0,0),(13,1,'Phichit',1,0,0),(14,1,'Kamphaeng Phet',1,0,0),(15,1,'Phetchabun',1,0,0),(16,1,'Nakhon Sawan',1,0,0),(17,1,'Uthai Thani',1,0,0),(18,2,'Amnat Charoen',1,0,0),(19,2,'Bueng Kan',1,0,0),(20,2,'Buri Ram',1,0,0),(21,2,'Chaiyaphum',1,0,0),(22,2,'Kalasin',1,0,0),(23,2,'Khon Kaen',1,0,0),(24,2,'Loei',1,0,0),(25,2,'Maha Sarakham',1,0,0),(26,2,'Mukdahan',1,0,0),(27,2,'Nakhon Phanom',1,0,0),(28,2,'Nakhon Ratchasima',1,0,0),(29,2,'Nong Bua Lamphu',1,0,0),(30,2,'Nong Khai',1,0,0),(31,2,'Roi Et',1,0,0),(32,2,'Sakon Nakhon',1,0,0),(33,2,'Si Sa Ket',1,0,0),(34,2,'Surin',1,0,0),(35,2,'Ubon Ratchathani',1,0,0),(36,2,'Udon Thani',1,0,0),(37,2,'Yasothon',1,0,0),(38,3,'Ang Thong',1,0,0),(39,3,'Chainat',1,0,0),(40,3,'Phra Nakhon Si Ayutthaya',1,0,0),(41,3,'Bangkok',1,0,0),(42,3,'Lop Buri',1,0,0),(43,3,'Nakhon Pathom',1,0,0),(44,3,'Nonthaburi',1,0,0),(45,3,'Pathum Thani',1,0,0),(46,3,'Samut Prakan',1,0,0),(47,3,'Samut Sakhon',1,0,0),(48,3,'Samut Songkhram',1,0,0),(49,3,'Saraburi',1,0,0),(50,3,'Sing Buri',1,0,0),(51,3,'Suphan Buri',1,0,0),(52,3,'Nakhon Nayok',1,0,0),(53,3,'Chachoengsao',1,0,0),(54,3,'Chanthaburi',1,0,0),(55,3,'Chon Buri',1,0,0),(56,3,'Prachin Buri',1,0,0),(57,3,'Rayong',1,0,0),(58,3,'Sa Kaeo',1,0,0),(59,3,'Trat',1,0,0),(60,3,'Kanchanaburi',1,0,0),(61,3,'Ratchaburi',1,0,0),(62,3,'Phetchaburi',1,0,0),(63,3,'Prachuap Khiri Khan',1,0,0),(64,4,'Chumphon',1,0,0),(65,4,'Nakhon Si Thammarat',1,0,0),(66,4,'Narathiwat',1,0,0),(67,4,'Pattani',1,0,0),(68,4,'Phatthalung',1,0,0),(69,4,'Songkhla',1,0,0),(70,4,'Surat Thani',1,0,0),(71,4,'Yala',1,0,0),(72,4,'Krabi',1,0,0),(73,4,'Phang Nga',1,0,0),(74,4,'Phuket',1,0,0),(75,4,'Ranong',1,0,0),(76,4,'Satun',1,0,0),(77,4,'Trang',1,0,0),(78,39,'Báº¯c Ninh',1,0,0),(79,39,'HÃ  Nam',1,0,0),(80,39,'HÃ  TÃ¢y',1,0,0),(81,39,'Háº£i DÆ°Æ¡ng',1,0,0),(82,39,'HÆ°ng YÃªn',1,0,0),(83,39,'Nam Äá»‹nh',1,0,0),(84,39,'Ninh BÃ¬nh',1,0,0),(85,39,'ThÃ¡i BÃ¬nh',1,0,0),(86,39,'VÄ©nh PhÃºc',1,0,0),(87,39,'Ha NoiÂ ',1,0,0),(88,39,'Hai PhongÂ ',1,0,0),(89,40,'HÃ  TÄ©nh',1,0,0),(90,40,'Nghá»‡ An',1,0,0),(91,40,'Quáº£ng BÃ¬nh',1,0,0),(92,40,'Quáº£ng Trá»‹',1,0,0),(93,40,'Thanh HÃ³a',1,0,0),(94,40,'Thá»«a ThiÃªn-Huáº¿',1,0,0),(95,41,'Báº¯c Giang',1,0,0),(96,41,'Báº¯c Káº¡n',1,0,0),(97,41,'Cao Báº±ng',1,0,0),(98,41,'HÃ  Giang',1,0,0),(99,41,'Láº¡ng SÆ¡n',1,0,0),(100,41,'LÃ o Cai',1,0,0),(101,41,'PhÃº Thá»',1,0,0),(102,41,'Quáº£ng Ninh',1,0,0),(103,41,'ThÃ¡i NguyÃªn',1,0,0),(104,41,'TuyÃªn Quang',1,0,0),(105,41,'YÃªn BÃ¡i',1,0,0),(106,41,'Äiá»‡n BiÃªn',1,0,0),(107,41,'HÃ²a BÃ¬nh',1,0,0),(108,41,'Lai ChÃ¢u',1,0,0),(109,41,'SÆ¡n La',1,0,0),(110,43,'Äáº¯k Láº¯k',1,0,0),(111,43,'Äáº¯k NÃ´ng',1,0,0),(112,43,'Gia Lai',1,0,0),(113,43,'Kon Tum',1,0,0),(114,43,'LÃ¢m Äá»“ng',1,0,0),(115,44,'BÃ¬nh Äá»‹nh',1,0,0),(116,44,'KhÃ¡nh HÃ²a',1,0,0),(117,44,'PhÃº YÃªn',1,0,0),(118,44,'Quáº£ng Nam',1,0,0),(119,44,'Quáº£ng NgÃ£i',1,0,0),(120,44,'BÃ¬nh Thuáº­n',1,0,0),(121,44,'Ninh Thuáº­n',1,0,0),(122,44,'Da NangÂ ',1,0,0),(123,45,'BÃ  Rá»‹aâ€“VÅ©ng TÃ u',1,0,0),(124,45,'BÃ¬nh DÆ°Æ¡ng',1,0,0),(125,45,'BÃ¬nh PhÆ°á»›c',1,0,0),(126,45,'Äá»“ng Nai',1,0,0),(127,45,'TÃ¢y Ninh',1,0,0),(128,45,'Ho Chi Minh',1,0,0),(129,46,'An Giang',1,0,0),(130,46,'Báº¡c LiÃªu',1,0,0),(131,46,'Báº¿n Tre',1,0,0),(132,46,'CÃ  Mau',1,0,0),(133,46,'Äá»“ng ThÃ¡p',1,0,0),(134,46,'Háº­u Giang',1,0,0),(135,46,'KiÃªn Giang',1,0,0),(136,46,'Long An',1,0,0),(137,46,'SÃ³c TrÄƒng',1,0,0),(138,46,'Tiá»n Giang',1,0,0),(139,46,'TrÃ  Vinh',1,0,0),(140,46,'VÄ©nh Long',1,0,0),(141,46,'Cáº§n ThÆ¡',1,0,0),(142,68,'Kandy',0,0,0),(143,68,'Matale',0,0,0),(144,68,'Nuwara Eliya',0,0,0),(145,69,'Ampara',0,0,0),(146,69,'Batticaloa',0,0,0),(147,69,'Trincomalee',0,0,0),(148,74,'Anuradhapura',0,0,0),(149,74,'Polonnaruwa',0,0,0),(150,73,'Kurunegala',0,0,0),(151,73,'Puttalam',0,0,0),(152,70,'Jaffna',0,0,0),(153,70,'Kilinochchi',0,0,0),(154,70,'Mannar',0,0,0),(155,70,'Mullaitivu',0,0,0),(156,70,'Vavuniya',0,0,0),(157,76,'Kegalle',0,0,0),(158,76,'Ratnapura',0,0,0),(159,71,'Galle',0,0,0),(160,71,'Hambantota',0,0,0),(161,71,'Matara',0,0,0),(162,75,'Badulla',0,0,0),(163,75,'Monaragala',0,0,0),(164,72,'Colombo',0,0,0),(165,72,'Gampaha',0,0,0),(166,72,'Kalutara',0,0,0),(171,68,'District',1,1,0),(172,111,'13',1,1,0),(173,112,'144',1,1,0),(174,113,'3',1,1,0),(175,114,'23',1,1,0),(176,115,'3',1,1,0),(177,112,'1445',1,1,0),(178,116,'14',1,1,0),(179,117,'3',1,1,0),(180,118,'2',1,1,0),(181,119,'4',1,1,0),(182,39,'1',1,1,0),(183,120,'2',1,1,0),(184,112,'44',1,1,0),(185,121,'111',1,1,0),(186,122,'6',1,1,0),(187,120,'1',1,1,0),(188,120,'4',1,1,0),(189,115,'AA',1,1,0),(190,39,'Province',1,1,0),(191,39,'123',1,1,0),(192,41,'1',1,1,0),(193,44,'2',1,1,0),(194,40,'2',1,1,0),(195,46,'2',1,1,0),(196,42,'9',1,1,0),(197,44,'1',1,1,0),(198,42,'1',1,1,0),(199,123,'a',1,1,0),(200,124,'2',1,1,0),(201,125,'3',1,1,0),(202,125,'1',1,1,0),(203,126,'3',1,1,0),(204,127,'3',1,1,0);
/*!40000 ALTER TABLE `province_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_provinces`
--

DROP TABLE IF EXISTS `region_provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_region` tinyint(4) NOT NULL DEFAULT '0',
  `other` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_provinces`
--

LOCK TABLES `region_provinces` WRITE;
/*!40000 ALTER TABLE `region_provinces` DISABLE KEYS */;
INSERT INTO `region_provinces` VALUES (1,13,'Northern Thailand',0,0,0),(2,13,'Northeastern Thailand',0,0,0),(3,13,'Central Thailand',0,0,0),(4,13,'Southern Thailand',0,0,0),(5,5,'Special Region of Aceh',0,0,0),(6,5,'Bali',0,0,0),(7,5,'Bangkaâ€“Belitung Islands',0,0,0),(8,5,'Banten',0,0,0),(9,5,'Bengkulu',0,0,0),(10,5,'Central Java',0,0,0),(11,5,'Central Kalimantan',0,0,0),(12,5,'Central Sulawesi',0,0,0),(13,5,'East Java',0,0,0),(14,5,'East Kalimantan',0,0,0),(15,5,'East Nusa Tenggara',0,0,0),(16,5,'Gorontalo',0,0,0),(17,5,'Jakarta Special Capital Region',0,0,0),(18,5,'Jambi',0,0,0),(19,5,'Lampung',0,0,0),(20,5,'Maluku',0,0,0),(21,5,'North Kalimantan',0,0,0),(22,5,'North Maluku',0,0,0),(23,5,'North Sulawesi',0,0,0),(24,5,'North Sumatra',0,0,0),(25,5,'Special Region of Papua',0,0,0),(26,5,'Riau',0,0,0),(27,5,'Riau Islands',0,0,0),(28,5,'Southeast Sulawesi',0,0,0),(29,5,'South Kalimantan',0,0,0),(30,5,'South Sulawesi',0,0,0),(31,5,'South Sumatra',0,0,0),(32,5,'West Java',0,0,0),(33,5,'West Kalimantan',0,0,0),(34,5,'West Nusa Tenggara',0,0,0),(35,5,'Special Region of West Papua',0,0,0),(36,5,'West Sulawesi',0,0,0),(37,5,'West Sumatra',0,0,0),(38,5,'Special Region of Yogyakarta',0,0,0),(39,14,'Red River Delta (Äá»“ng Báº±ng SÃ´ng Há»“ng)',1,0,0),(40,14,'North Central Coastal Vietnam',1,0,0),(41,14,'North Eastern Vietnam',1,0,0),(42,14,'North Western Vietnam',1,0,0),(43,14,'Southern Vietnam',1,0,0),(44,14,'South Central Coastal Vietnam',1,0,0),(45,14,'South Eastern Vietnam',1,0,0),(46,14,'Mekong River Delta',1,0,0),(47,8,'Ayeyarwady Region',1,0,0),(48,8,'Bago Region',1,0,0),(49,8,'Chin State',1,0,0),(50,8,'Kachin State',1,0,0),(51,8,'Kayah State',1,0,0),(52,8,'Kayin State',1,0,0),(53,8,'Magway Region',1,0,0),(54,8,'Mandalay Region',1,0,0),(55,8,'Mon State',1,0,0),(56,8,'Rakhine State',1,0,0),(57,8,'Shan State',1,0,0),(58,8,'Sagaing Region',1,0,0),(59,8,'Tanintharyi Region',1,0,0),(60,8,'Yangon Region',1,0,0),(61,8,'Naypyidaw Union Territory',1,0,0),(62,8,'Danu Self-Administered Zone',1,0,0),(63,8,'Kokang Self-Administered Zone',1,0,0),(64,8,'Naga Self-Administered Zone',1,0,0),(65,8,'Pa\'O Self-Administered Zone',1,0,0),(66,8,'Pa Laung Self-Administered Zone',1,0,0),(67,8,'Wa Self-Administered Division',1,0,0),(68,12,'Central Province',1,0,0),(69,12,'Eastern Province',1,0,0),(70,12,'Northern Province',1,0,0),(71,12,'Southern Province',1,0,0),(72,12,'Western Province',1,0,0),(73,12,'North Western Province',1,0,0),(74,12,'North Central Province',1,0,0),(75,12,'Uva Province',1,0,0),(76,12,'Sabaragamuwa Province',1,0,0),(77,3,'Anhui',1,0,0),(78,3,'Fujian',1,0,0),(79,3,'Gansu',1,0,0),(80,3,'Guangdong',1,0,0),(81,3,'Guizhou',1,0,0),(82,3,'Hainan',1,0,0),(83,3,'Hebei',1,0,0),(84,3,'Heilongjiang',1,0,0),(85,3,'Henan',1,0,0),(86,3,'Hubei',1,0,0),(87,3,'Hunan',1,0,0),(88,3,'Jiangsu',1,0,0),(89,3,'Jiangxi',1,0,0),(90,3,'Jilin',1,0,0),(91,3,'Liaoning',1,0,0),(92,3,'Qinghai',1,0,0),(93,3,'Shaanxi',1,0,0),(94,3,'Shandong',1,0,0),(95,3,'Shanxi',1,0,0),(96,3,'Sichuan',1,0,0),(97,3,'Yunnan',1,0,0),(98,3,'Zhejiang',1,0,0),(99,3,' GuangxiÂ Zhuang',1,0,0),(100,3,'Inner Mongolia',1,0,0),(101,3,'NingxiaÂ Hui',1,0,0),(102,3,'XinjiangÂ Uighur',1,0,0),(103,3,'Tibet',1,0,0),(104,3,'Beijing Municipality',1,0,0),(105,3,'Chongqing Municipality',1,0,0),(106,3,'Shanghai Municipality',1,0,0),(107,3,'Tianjin Municipality',1,0,0),(108,3,'Hong Kong',1,0,0),(109,3,'Macau',1,0,0),(110,3,'Wolong',1,0,0),(111,9,'12',1,1,0),(112,185,'123',1,1,0),(113,9,'2',1,1,0),(114,195,'123',1,1,0),(115,185,'2',1,1,0),(116,195,'23',1,1,0),(117,195,'2',1,1,0),(118,9,'1',1,1,0),(119,9,'123',1,1,0),(120,185,'1',1,1,0),(121,185,'1123',1,1,0),(122,185,'5',1,1,0),(123,163,'A',1,1,0),(124,190,'1',1,1,0),(125,14,'2',1,1,0),(126,163,'12',1,1,0),(127,191,'2',1,1,0);
/*!40000 ALTER TABLE `region_provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long`
--

DROP TABLE IF EXISTS `season_long`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farmers_id` int(11) NOT NULL,
  `farmer_seasons_id` int(11) NOT NULL,
  `import` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index2` (`farmers_id`),
  KEY `index3` (`farmer_seasons_id`),
  KEY `index4` (`farmer_seasons_id`,`farmers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long`
--

LOCK TABLES `season_long` WRITE;
/*!40000 ALTER TABLE `season_long` DISABLE KEYS */;
INSERT INTO `season_long` VALUES (1,1,1,1),(2,2,2,1),(3,3,3,1),(4,4,4,1),(5,5,5,1),(6,6,6,1),(7,7,7,1),(8,8,8,1),(9,9,9,1),(10,10,10,1),(11,11,11,1),(12,12,12,1),(13,13,13,1),(14,14,14,1),(15,15,15,1),(16,16,16,1),(17,17,17,1),(18,18,18,1),(19,19,19,1),(20,20,20,1),(21,21,21,1),(22,22,22,1),(23,23,23,1),(24,24,24,1),(25,25,25,1),(26,26,26,1),(27,27,27,1),(28,28,28,1),(29,29,29,1),(30,30,30,1),(31,31,31,1),(32,32,32,1),(33,33,33,1),(34,34,34,1),(35,35,35,1),(36,36,36,1),(37,37,37,1),(38,38,38,1),(39,39,39,1),(40,40,40,1),(41,41,41,1),(42,42,42,1),(43,43,43,1),(44,44,44,1),(45,45,45,1),(46,46,46,1),(47,47,47,1),(48,48,48,1),(49,49,49,1),(50,50,50,1),(51,51,51,1),(52,52,52,1),(53,53,53,1),(54,54,54,1),(55,55,55,1),(56,56,56,1),(57,57,57,1),(58,58,58,1),(59,59,59,1),(60,60,60,1),(61,61,61,0),(62,61,61,0),(63,61,61,0),(64,61,61,0),(65,61,61,0),(66,61,61,0),(67,61,61,0),(68,61,61,0),(69,63,66,0);
/*!40000 ALTER TABLE `season_long` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_child_labor`
--

DROP TABLE IF EXISTS `season_long_child_labor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_child_labor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `employment_below_18` tinyint(4) NOT NULL,
  `employment_above_18` tinyint(4) NOT NULL,
  `school_going_children_employed` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_child_labor`
--

LOCK TABLES `season_long_child_labor` WRITE;
/*!40000 ALTER TABLE `season_long_child_labor` DISABLE KEYS */;
INSERT INTO `season_long_child_labor` VALUES (1,68,1,2,4);
/*!40000 ALTER TABLE `season_long_child_labor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_child_labor_record`
--

DROP TABLE IF EXISTS `season_long_child_labor_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_child_labor_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_child_labor_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_child_labor_record`
--

LOCK TABLES `season_long_child_labor_record` WRITE;
/*!40000 ALTER TABLE `season_long_child_labor_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `season_long_child_labor_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_cleaning_drying`
--

DROP TABLE IF EXISTS `season_long_cleaning_drying`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_cleaning_drying` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `dry_threshed_grain` tinyint(4) NOT NULL,
  `labor_count` int(11) NOT NULL,
  `labor_type` tinyint(4) NOT NULL,
  `male_labor` int(11) NOT NULL,
  `female_labor` int(11) NOT NULL,
  `above_18_years_old` int(11) NOT NULL,
  `below_18_years_old` int(11) NOT NULL,
  `labor_total_cost` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_cleaning_drying`
--

LOCK TABLES `season_long_cleaning_drying` WRITE;
/*!40000 ALTER TABLE `season_long_cleaning_drying` DISABLE KEYS */;
INSERT INTO `season_long_cleaning_drying` VALUES (1,67,3,2,1,3,4,5,6,5);
/*!40000 ALTER TABLE `season_long_cleaning_drying` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_compost`
--

DROP TABLE IF EXISTS `season_long_compost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_compost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farmer_id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  `organic_materials` varchar(100) NOT NULL,
  `straw_managed_previous_crop` varchar(100) NOT NULL,
  `days_before_rice_planting` int(11) NOT NULL,
  `organic_materials_amount` int(11) NOT NULL,
  `organic_materials_total_cost` int(11) NOT NULL,
  `labor_used` tinyint(4) NOT NULL,
  `male_labor` int(11) NOT NULL,
  `female_labor` int(11) NOT NULL,
  `hired_exchange_male_labor` int(11) NOT NULL,
  `hired_exchange_female_labor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_compost`
--

LOCK TABLES `season_long_compost` WRITE;
/*!40000 ALTER TABLE `season_long_compost` DISABLE KEYS */;
/*!40000 ALTER TABLE `season_long_compost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_computation`
--

DROP TABLE IF EXISTS `season_long_computation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_computation` (
  `farmers_id` int(11) NOT NULL,
  `farmer_seasons_id` int(11) NOT NULL,
  `seed_cost` int(11) NOT NULL DEFAULT '0',
  `land_preparation_cost` int(11) NOT NULL DEFAULT '0',
  `sowing_transplanting_cost` int(11) NOT NULL DEFAULT '0',
  `nursery_seedling_production_cost` int(11) NOT NULL DEFAULT '0',
  `irrigation_cost` int(11) NOT NULL DEFAULT '0',
  `fertilizer_application_cost` int(11) NOT NULL DEFAULT '0',
  `weeding_cost` int(11) NOT NULL DEFAULT '0',
  `organic_material_cost` int(11) NOT NULL DEFAULT '0',
  `seed_rate` int(11) NOT NULL DEFAULT '0',
  `land_preparation_date` datetime NOT NULL,
  `nursery_establishment_date` datetime NOT NULL,
  `sowing_transplanting_date` datetime NOT NULL,
  KEY `index1` (`farmers_id`,`farmer_seasons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_computation`
--

LOCK TABLES `season_long_computation` WRITE;
/*!40000 ALTER TABLE `season_long_computation` DISABLE KEYS */;
/*!40000 ALTER TABLE `season_long_computation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_computations`
--

DROP TABLE IF EXISTS `season_long_computations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_computations` (
  `farmers_id` float DEFAULT '0',
  `farmer_seasons_id` float DEFAULT '0',
  `seed_cost` double DEFAULT '0',
  `land_preparation_cost` double DEFAULT '0',
  `sowing_transplanting_cost` double DEFAULT '0',
  `nursery_seedling_production_cost` double DEFAULT '0',
  `nursery_preparation_cost` double DEFAULT '0',
  `nursery_preparation_machine_transplanting_cost` double DEFAULT '0',
  `purchased_seedling_cost` double DEFAULT '0',
  `irrigation_cost` double DEFAULT '0',
  `fertilizer_application_cost` double DEFAULT '0',
  `weeding_cost` double DEFAULT '0',
  `organic_material_cost` double DEFAULT '0',
  `seed_rate` double DEFAULT '0',
  `land_preparation_date` datetime DEFAULT NULL,
  `nursery_establishment_date` datetime DEFAULT NULL,
  `sowing_transplanting_date` datetime DEFAULT NULL,
  `harvesting_date` datetime DEFAULT NULL,
  `threshing_date` datetime DEFAULT NULL,
  `seedling_age` double DEFAULT '0',
  `crop_growing_duration` double DEFAULT '0',
  `pesticide_cost` double DEFAULT '0',
  `harvesting_threshing_cost` double DEFAULT '0',
  `cleaning_drying_cost` double DEFAULT '0',
  `total_cost` double DEFAULT '0',
  `straw_yield_previous_crop` double DEFAULT '0',
  `grain_yield` double DEFAULT '0',
  `straw_yield` double DEFAULT '0',
  `total_gross_income` double DEFAULT '0',
  `total_labor` double DEFAULT '0',
  `total_male_labor` double DEFAULT '0',
  `total_female_labor` double DEFAULT '0',
  `total_above_18_labor` double DEFAULT '0',
  `total_below_18_labor` double DEFAULT '0',
  `net_profit` double DEFAULT '0',
  `labor_productivity` double DEFAULT '0',
  `female_to_male_ratio` double DEFAULT '0',
  `below_to_above_18_ratio` double DEFAULT '0',
  `nitrogen_amount` double DEFAULT '0',
  `nitrogen_count` double DEFAULT '0',
  `phosphorus_amount` double DEFAULT '0',
  `phosphorus_count` double DEFAULT '0',
  `potassium_amount` double DEFAULT '0',
  `potassium_count` double DEFAULT '0',
  `nitrogen_use_efficiency` double DEFAULT '0',
  `phosphorus_use_efficiency` double DEFAULT '0',
  `potassium_use_efficiency` double DEFAULT '0',
  `zn_application` double DEFAULT '0',
  `sulphur_application` double DEFAULT '0',
  `total_nitrogen_uptake` double DEFAULT '0',
  `total_phosphorus_uptake` double DEFAULT '0',
  `nitrogen_use_efficiency_method_two` double DEFAULT '0',
  `phosphorus_use_efficiency_method_two` double DEFAULT '0',
  `water_applied_field_preparation` double DEFAULT '0',
  `water_applied_crop_growing` double DEFAULT '0',
  `irrigation_applied_count` double DEFAULT '0',
  `total_water_productivity_kg_grain` double DEFAULT '0',
  `total_water_productivity_litre_water` double DEFAULT '0',
  `total_irrigation_water_productivity` double DEFAULT '0',
  `rainfall_water_productivity` double DEFAULT '0',
  `sfo` double DEFAULT '0',
  `methane_emission` double DEFAULT '0',
  `co2_equivalent` double DEFAULT '0',
  `total_number_herbicide_application` double DEFAULT '0',
  `total_amount_herbicide_application` double DEFAULT '0',
  `herbicide_score` double DEFAULT '0',
  `herbicide_rank` varchar(50) DEFAULT NULL,
  `total_number_insecticide_application` double DEFAULT '0',
  `total_amount_insecticide_application` double DEFAULT '0',
  `insecticide_score` double DEFAULT '0',
  `insecticide_rank` varchar(50) DEFAULT NULL,
  `total_number_fungicide_application` double DEFAULT '0',
  `total_amount_fungicide_application` double DEFAULT '0',
  `fungicide_score` double DEFAULT '0',
  `fungicide_rank` varchar(50) DEFAULT NULL,
  `total_number_molluscicide_application` double DEFAULT '0',
  `total_amount_molluscicide_application` double DEFAULT '0',
  `molluscicide_score` double DEFAULT '0',
  `molluscicide_rank` varchar(50) DEFAULT '0',
  `total_number_rodenticide_application` double DEFAULT '0',
  `total_amount_rodenticide_application` double DEFAULT '0',
  `rodenticide_score` double DEFAULT '0',
  `rodenticide_rank` varchar(50) DEFAULT '0',
  `total_number_pesticide_application` double DEFAULT '0',
  `total_amount_pesticide_application` double DEFAULT '0',
  `total_score_pesticide_application` double DEFAULT '0',
  `pesticide_ranking` double DEFAULT '0',
  `food_safety_score` double DEFAULT '0',
  `food_safety_rank` varchar(50) DEFAULT NULL,
  `worker_health_and_safety_score` double DEFAULT '0',
  `worker_health_and_safety_rank` varchar(50) DEFAULT NULL,
  `child_labor_score` double DEFAULT '0',
  `child_labor_rank` varchar(50) DEFAULT NULL,
  `women_empowerment_score` double DEFAULT '0',
  `women_empowerment_rank` varchar(50) DEFAULT NULL,
  `pesticide_use_efficiency_score` double DEFAULT '0',
  `pesticide_use_efficiency_rank` varchar(50) DEFAULT NULL,
  `import` tinyint(4) NOT NULL,
  KEY `index2` (`farmers_id`,`farmer_seasons_id`),
  KEY `index3` (`grain_yield`,`net_profit`),
  KEY `index4` (`farmers_id`),
  KEY `index5` (`farmer_seasons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_computations`
--

LOCK TABLES `season_long_computations` WRITE;
/*!40000 ALTER TABLE `season_long_computations` DISABLE KEYS */;
INSERT INTO `season_long_computations` VALUES (41,41,0,0,0,0,0,0,0,0,0,0,0,80,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,6541.914548404521,0,0,0,0,0,0,0,1238.171876200772,436.1276365603014,0,0,98.86666666666666,0,13.9648,0,0,0,66.16906151454337,468.4574464657225,0,0,0,0,0,0,0,0,0,0,0.0004517896787572183,0,0,0,0,0,3773.795155191042,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,15,NULL,1),(42,42,0,0,0,0,0,0,0,0,0,0,0,160,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,6619.794483504603,0,0,0,0,0,0,0,1062.35561168843,441.3196322336402,0,0,68,0,18.61973333333333,0,0,0,97.34991887506769,355.5257406213087,0,0,0,0,0,0,0,0,0,0,0.0005099995750003546,0,0,0,0,0,3748.350323878521,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,15,NULL,1),(43,43,0,0,0,0,0,0,0,0,0,0,0,80,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,6327.744726879394,0,0,0,0,0,0,0,1358.862660157356,356.4926606692616,0,0,73.33333333333333,0,9.309866666666666,0,0,0,86.28742809380992,679.6815629525014,0,0,0,0,0,0,0,0,0,0,0.0006340425578035464,0,0,0,0,0,3862.64056603376,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,45,NULL,1),(44,44,0,0,0,0,0,0,0,0,0,0,0,80,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,3407.247160627368,0,0,0,0,0,0,0,264.2233234180643,227.1498107084912,0,0,80,0,20.9472,0,0,0,42.5905895078421,162.6588355783765,0,0,0,0,0,0,0,0,0,0,0.0002624997812501825,0,0,0,0,0,3220.874462957671,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,30,NULL,1),(45,45,0,0,0,0,0,0,0,0,0,0,0,80,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,6425.094645754438,0,0,0,0,0,0,0,1147.193147969295,287.1550679666788,0,0,80,0,20.9472,0,0,0,80.31368307193047,306.7280899477943,0,0,0,0,0,0,0,0,0,0,0.0004949995875003419,0,0,0,0,0,3314.30946324223,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,45,NULL,1),(46,46,0,0,0,0,0,0,0,0,0,0,0,40,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,9205.40832882642,0,0,0,0,0,0,0,2226.999528687972,438.3527775631628,0,0,73.33333333333333,0,37.23946666666667,0,0,0,125.5282953930875,247.1949561261105,0,0,0,0,0,0,0,0,0,0,0.0007091994090004946,0,0,0,0,0,3899.867925796781,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,15,NULL,1),(47,47,0,0,0,0,0,0,0,0,0,0,0,19.23076923076923,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,8135.671791702059,0,0,0,0,0,0,0,1923.735532643441,542.3781194468039,0,0,73.07692307692308,0,27.9296,0,0,0,111.3302455706597,291.2920984082141,0,0,0,0,0,0,0,0,0,0,0.0008151975743188435,0,0,0,0,0,4097.632283072037,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,45,NULL,1),(48,48,0,0,0,0,0,0,0,0,0,0,0,66.66666666666667,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,6895.619253650604,0,0,0,0,0,0,0,1001.461388663537,459.7079502433736,0,0,77.77777777777777,0,23.27466666666667,0,0,0,88.65796183265063,296.2714505177563,0,0,0,0,0,0,0,0,0,0,0.0004315155978504759,0,0,0,0,0,3759.184124499873,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,45,NULL,1),(49,49,0,0,0,0,0,0,0,0,0,0,0,133.3333333333333,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,7301.243915630065,0,0,0,0,0,0,0,1310.002359705373,503.5340631469011,0,0,226.6666666666667,0,30.25706666666667,0,0,0,32.211370216015,241.3070637701187,0,0,0,0,0,0,0,0,0,0,0.0005624995312503902,0,0,0,0,0,4131.939748552234,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,30,NULL,1),(50,50,0,0,0,0,0,0,0,0,0,0,0,120,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,6498.107084910759,0,0,0,0,0,0,0,1055.786623947306,266.5890086117234,0,0,80,0,6.9824,0,0,0,81.2263385613845,930.6409092734244,0,0,0,0,0,0,0,0,0,0,0.0004066399927979198,0,0,0,0,0,3612.1078417259,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,15,NULL,1),(51,51,0,0,0,0,0,0,0,0,0,0,0,60,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,5475.932936722549,0,0,0,0,0,0,0,842.7138233504589,215.8003127772433,0,0,80,0,8.056615384615384,0,0,0,68.44916170903187,679.681562952501,0,0,0,0,0,0,0,0,0,0,0.0003781721641382976,0,0,0,0,0,3039.266817554667,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,30,NULL,1),(52,52,0,0,0,0,0,0,0,0,0,0,0,38.46153846153846,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,7301.243915630087,0,0,0,0,0,0,0,1626.151627104647,309.0473615081518,0,0,84.61538461538461,0,15.51644444444445,0,0,0,86.28742809381012,470.5487743517328,0,0,0,0,0,0,0,0,0,0,0.0006359968567622027,0,0,0,0,0,2966.016778099313,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,45,NULL,1),(53,53,0,0,0,0,0,0,0,0,0,0,0,45.45454545454545,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,7082.206598161173,0,0,0,0,0,0,0,1593.611474520276,280.4834296301455,0,0,72.72727272727272,0,27.9296,0,0,0,97.38034072471613,253.5735061784334,0,0,0,0,0,0,0,0,0,0,0.0006169169510593356,0,0,0,0,0,2919.023486760549,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,45,NULL,1),(54,54,0,0,0,0,0,0,0,0,0,0,0,133.3333333333333,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,6643.807463493768,0,0,0,0,0,0,0,1166.889880031245,442.9204975662512,0,0,75.55555555555556,0,41.8944,0,0,0,87.93274584035869,158.5846190300796,0,0,0,0,0,0,0,0,0,0,0.0005118495734586879,0,0,0,0,0,3475.438783163458,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,15,NULL,1),(55,55,0,0,0,0,0,0,0,0,0,0,0,115.3846153846154,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,8424.512210342384,0,0,0,0,0,0,0,1506.245854605101,561.6341473561589,0,0,92.3076923076923,0,13.9648,0,0,0,91.26554894537583,603.2676594252968,0,0,0,0,0,0,0,0,0,0,0.0006490379206735272,0,0,0,0,0,3929.231754285872,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,30,NULL,1),(56,56,0,0,0,0,0,0,0,0,0,0,0,26.66666666666667,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,6481.882098431591,0,0,0,0,0,0,0,1181.510064470715,432.1254732287727,0,0,73.33333333333333,0,32.22646153846154,0,0,0,88.38930134224897,201.1353958514997,0,0,0,0,0,0,0,0,0,0,0.0004476437913281485,0,0,0,0,0,3138.313173051848,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,45,NULL,1),(57,57,0,0,0,0,0,0,0,0,0,0,0,133.3333333333333,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,5918.875067604094,0,0,0,0,0,0,0,796.9648891249623,211.3883952715748,0,0,71.11111111111111,0,19.04290909090909,0,0,0,83.23418063818256,310.8177978137652,0,0,0,0,0,0,0,0,0,0,0.0004559996200003154,0,0,0,0,0,3252.820754328905,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,30,NULL,1),(58,58,0,0,0,0,0,0,0,0,0,0,0,40,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,6451.135749053553,0,0,0,0,0,0,0,1109.892256583999,430.0757166035702,0,0,95.33333333333333,0,27.9296,0,0,0,67.66925610895335,230.9784511433588,0,0,0,0,0,0,0,0,0,0,0.0004455204246583945,0,0,0,0,0,3552.343765914956,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,15,NULL,1),(59,59,0,0,0,0,0,0,0,0,0,0,0,37.03703703703704,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,9419.995364289569,0,0,0,0,0,0,0,2277.686348513238,627.9996909526379,0,0,183.7037037037037,0,22.82707692307692,0,0,0,51.27820057173758,412.6676138181525,0,0,0,0,0,0,0,0,0,0,0.0008205570874816697,0,0,0,0,0,2903.337861991909,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,15,NULL,1),(60,60,0,0,0,0,0,0,0,0,0,0,0,22.16666666666667,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,6500,0,0,0,0,0,0,0,1579.99343452381,433.3333333333333,0,0,73.33333333333333,0,6.206577777777778,0,0,0,88.63636363636364,1047.276008249313,0,0,0,0,0,0,0,0,0,0,0.0005662020905923345,0,0,0,0,0,3059.301169712077,0,0,0,NULL,0,0,0,NULL,0,0,0,NULL,0,0,0,'0',0,0,0,'0',0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,15,NULL,1),(61,61,0.00017928,0.05190265,0.00497512,0,0,0,0,0.00109811,0.00340639,0.00033616,0,2,'2017-01-11 00:00:00','0000-00-00 00:00:00','2017-01-11 00:00:00','2017-01-02 00:00:00','0000-00-00 00:00:00',0,9,0.00038098,0.00031375,0.00011205,0.06263726,404.19826735895,0.56976744,0.61705813752,0.0001214334,23.5,25,22,28.5,35,-0.0625158266,0.024245422978723,0.88,1.2280701754386,1.13,4,0.5,2,0.05,1,0.50421897345133,2.6112164986251,13.727681966028,3,3.5,0.01027831973388,0.00181356976152,-0.0126569292,-0.02860466,100,-180,4,-0.00000073995771428571,-1351428.5758414,-0.0000007122093,0.000018992248,1.067582042515,8.7033201616151,217.58300404038,0,0,15,'Acceptable',2,0.0045,-15,'Unsustainable',0,0,15,'Acceptable',0,0,15,'Acceptable',0,0,15,'Acceptable',2,0.0045,45,0,50,'Fair',53.3,'Fair',35,'Poor',14,'Poor',51,'Fair',0);
/*!40000 ALTER TABLE `season_long_computations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_fertilizer_application`
--

DROP TABLE IF EXISTS `season_long_fertilizer_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_fertilizer_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `fertilizer_cost` int(11) NOT NULL,
  `labor_type` tinyint(4) NOT NULL,
  `male_labor` int(11) NOT NULL,
  `female_labor` int(11) NOT NULL,
  `above_18_years_old` int(11) NOT NULL,
  `below_18_years_old` int(11) NOT NULL,
  `labor_total_cost` int(11) NOT NULL,
  `fertilizer_application` tinyint(4) NOT NULL,
  `fertilizer_application_other` varchar(100) DEFAULT NULL,
  `grain_yield_parcel` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_fertilizer_application`
--

LOCK TABLES `season_long_fertilizer_application` WRITE;
/*!40000 ALTER TABLE `season_long_fertilizer_application` DISABLE KEYS */;
INSERT INTO `season_long_fertilizer_application` VALUES (1,61,123,2,1,2,3,4,5,3,'',0),(2,62,11,1,1,2,2,4,5,2,'',0),(3,63,0,0,0,0,0,0,0,0,'',0),(4,64,0,0,0,0,0,0,0,0,'',0),(5,65,0,0,0,0,0,0,0,0,'',0),(6,66,0,0,0,0,0,0,0,0,'',0),(7,67,2,1,2,3,4,5,6,2,'',2),(8,69,0,0,0,0,0,0,0,0,'',0);
/*!40000 ALTER TABLE `season_long_fertilizer_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_fertilizer_application_info`
--

DROP TABLE IF EXISTS `season_long_fertilizer_application_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_fertilizer_application_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_fertilizer_application_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `amount` int(11) NOT NULL,
  `n` int(11) NOT NULL,
  `p205` int(11) NOT NULL,
  `k20` int(11) NOT NULL,
  `zn` int(11) NOT NULL,
  `s` int(11) NOT NULL,
  `other` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_fertilizer_application_info`
--

LOCK TABLES `season_long_fertilizer_application_info` WRITE;
/*!40000 ALTER TABLE `season_long_fertilizer_application_info` DISABLE KEYS */;
INSERT INTO `season_long_fertilizer_application_info` VALUES (7,2,'urea','2017-01-09 00:00:00',2,46,0,0,0,0,0),(8,7,'urea','2017-01-01 00:00:00',2,46,0,0,0,0,0),(13,1,'dap','2017-01-31 00:00:00',2,18,46,0,0,0,0),(14,1,'ABC','2017-01-18 00:00:00',2,3,4,5,6,7,1);
/*!40000 ALTER TABLE `season_long_fertilizer_application_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_food_safety`
--

DROP TABLE IF EXISTS `season_long_food_safety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_food_safety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `aware_food_safety_risk` tinyint(4) NOT NULL,
  `heavy_metal_risk` varchar(100) NOT NULL,
  `soil_remediation` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_food_safety`
--

LOCK TABLES `season_long_food_safety` WRITE;
/*!40000 ALTER TABLE `season_long_food_safety` DISABLE KEYS */;
INSERT INTO `season_long_food_safety` VALUES (1,68,1,'ABC','DEF');
/*!40000 ALTER TABLE `season_long_food_safety` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_food_security`
--

DROP TABLE IF EXISTS `season_long_food_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_food_security` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `rice_amount_wet_season` int(11) NOT NULL,
  `rice_amount_dry_season` int(11) NOT NULL,
  `amount_unmilled_rice_wet_season` int(11) NOT NULL,
  `amount_unmilled_rice_dry_season` int(11) NOT NULL,
  `price_rice_sold_wet_season` int(11) NOT NULL,
  `price_rice_sold_dry_season` int(11) NOT NULL,
  `purchased_rice` tinyint(4) NOT NULL,
  `amount_milled_rice` int(11) NOT NULL,
  `amount_unmilled_rice` int(11) NOT NULL,
  `price_per_kg_milled_rice` int(11) NOT NULL,
  `price_per_kg_unmilled_rice` int(11) NOT NULL,
  `members_below_12_years_old` int(11) NOT NULL,
  `members_above_12_years_old` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_food_security`
--

LOCK TABLES `season_long_food_security` WRITE;
/*!40000 ALTER TABLE `season_long_food_security` DISABLE KEYS */;
/*!40000 ALTER TABLE `season_long_food_security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_general_information`
--

DROP TABLE IF EXISTS `season_long_general_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_general_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT '0',
  `age` tinyint(4) DEFAULT '0',
  `marital_status` tinyint(4) DEFAULT NULL,
  `literacy` tinyint(4) DEFAULT NULL,
  `years_schooling` tinyint(4) DEFAULT NULL,
  `primary_occupation` tinyint(4) DEFAULT NULL,
  `primary_occupation_others` varchar(100) DEFAULT NULL,
  `secondary_occupation` tinyint(4) DEFAULT NULL,
  `secondary_occupation_others` varchar(100) DEFAULT NULL,
  `religion` tinyint(4) DEFAULT NULL,
  `religion_others` varchar(45) DEFAULT NULL,
  `contact_number` int(11) DEFAULT NULL,
  `attended_training` tinyint(4) DEFAULT NULL,
  `training` tinyint(4) DEFAULT NULL,
  `training_others` varchar(100) DEFAULT NULL,
  `training_duration` int(11) DEFAULT NULL,
  `total_income_farm` int(11) DEFAULT NULL,
  `total_income_non_farm` int(11) DEFAULT NULL,
  `farming_years` int(11) DEFAULT NULL,
  `machineries` tinyint(4) DEFAULT NULL,
  `ownership` tinyint(4) DEFAULT NULL,
  `economic_condition` tinyint(4) DEFAULT NULL,
  `economic_condition_change` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_general_information`
--

LOCK TABLES `season_long_general_information` WRITE;
/*!40000 ALTER TABLE `season_long_general_information` DISABLE KEYS */;
INSERT INTO `season_long_general_information` VALUES (1,61,1,23,3,2,0,3,'',6,'',3,'',2331313,1,3,'',4,5,6,7,2,4,4,2),(2,69,0,0,0,0,0,0,'',0,'',0,'',0,0,0,'',0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `season_long_general_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_general_information_problems`
--

DROP TABLE IF EXISTS `season_long_general_information_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_general_information_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_general_information_id` int(11) NOT NULL,
  `problem` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_general_information_problems`
--

LOCK TABLES `season_long_general_information_problems` WRITE;
/*!40000 ALTER TABLE `season_long_general_information_problems` DISABLE KEYS */;
INSERT INTO `season_long_general_information_problems` VALUES (13,1,'2'),(14,1,'A'),(15,1,'B'),(16,1,'C');
/*!40000 ALTER TABLE `season_long_general_information_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_grain_and_straw_yield`
--

DROP TABLE IF EXISTS `season_long_grain_and_straw_yield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_grain_and_straw_yield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `rice_amount` int(11) NOT NULL,
  `grain_amount` int(11) NOT NULL,
  `rice_selling_price` int(11) NOT NULL,
  `straw_sold` tinyint(4) NOT NULL,
  `straw_total_price` int(11) NOT NULL,
  `straw_handled` tinyint(4) NOT NULL,
  `grain_moisture_content` int(11) NOT NULL,
  `total_rainfall` int(11) NOT NULL,
  `irrigation_method` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_grain_and_straw_yield`
--

LOCK TABLES `season_long_grain_and_straw_yield` WRITE;
/*!40000 ALTER TABLE `season_long_grain_and_straw_yield` DISABLE KEYS */;
INSERT INTO `season_long_grain_and_straw_yield` VALUES (1,67,1,2,3,1,2,0,2,3,1);
/*!40000 ALTER TABLE `season_long_grain_and_straw_yield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_harvesting_threshing`
--

DROP TABLE IF EXISTS `season_long_harvesting_threshing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_harvesting_threshing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `harvesting_method` tinyint(4) NOT NULL,
  `crop_harvest_date` datetime DEFAULT NULL,
  `combine_harvesting_total` int(11) NOT NULL,
  `harvesting_completion_time` int(11) NOT NULL,
  `combine_harvester_horse_power` int(11) NOT NULL,
  `combine_harvester_cutting_width` int(11) NOT NULL,
  `labor_type` tinyint(4) NOT NULL,
  `male_labor` int(11) NOT NULL,
  `female_labor` int(11) NOT NULL,
  `above_18_years_old` int(11) NOT NULL,
  `below_18_years_old` int(11) NOT NULL,
  `additional_labor` tinyint(4) NOT NULL,
  `additional_labor_cost` int(11) NOT NULL,
  `combine_harvester_owner` tinyint(4) NOT NULL,
  `manual_cutting_labor_count` int(11) NOT NULL,
  `total_labor_cost` int(11) NOT NULL,
  `amount_paid` int(11) NOT NULL,
  `wage_rate_male` int(11) NOT NULL,
  `wage_rate_female` int(11) NOT NULL,
  `labor_count_manual_cutting` int(11) NOT NULL,
  `threshing_date` datetime DEFAULT NULL,
  `thresher_operating_minute` int(11) NOT NULL,
  `threshing_machine_horse_power` int(11) NOT NULL,
  `threshing_total_cost` int(11) NOT NULL,
  `wage_rate_male_labor` int(11) NOT NULL,
  `wage_rate_female_labor` int(11) NOT NULL,
  `cutting_date` datetime DEFAULT NULL,
  `machine_cutting_name` varchar(100) DEFAULT NULL,
  `total_cost_cutting` int(11) NOT NULL,
  `labor_count_cutting_rice` int(11) NOT NULL,
  `male_cutting_wage_rate` int(11) NOT NULL,
  `female_cutting_wage_rate` int(11) NOT NULL,
  `rice_managed` tinyint(4) NOT NULL,
  `removed_straw` tinyint(4) NOT NULL,
  `grain_moisture_content` int(11) NOT NULL,
  `total_cost_manual_cutting` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_harvesting_threshing`
--

LOCK TABLES `season_long_harvesting_threshing` WRITE;
/*!40000 ALTER TABLE `season_long_harvesting_threshing` DISABLE KEYS */;
INSERT INTO `season_long_harvesting_threshing` VALUES (1,67,1,'2017-01-02 00:00:00',2,3,4,5,1,1,2,3,4,1,12,1,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,0,0,'0000-00-00 00:00:00','',0,0,0,0,1,0,2,0);
/*!40000 ALTER TABLE `season_long_harvesting_threshing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_irrigation`
--

DROP TABLE IF EXISTS `season_long_irrigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_irrigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `water_condition` tinyint(4) NOT NULL,
  `irrigation_count` int(11) NOT NULL,
  `irrigation_energy_source` tinyint(4) NOT NULL,
  `pump_horse_power` int(11) NOT NULL,
  `hydraulic_lift_height` int(11) NOT NULL,
  `pump_disharge_rate` int(11) NOT NULL,
  `pump_operation_hour` int(11) NOT NULL,
  `discharge_pipe_diameter` int(11) NOT NULL,
  `electricity_consumed` int(11) NOT NULL,
  `diesel_consumed` int(11) NOT NULL,
  `total_fuel_cost` int(11) NOT NULL,
  `labor_type` tinyint(4) NOT NULL,
  `male_labor_count` int(11) NOT NULL,
  `female_labor_count` int(11) NOT NULL,
  `above_18_years_old_count` int(11) NOT NULL,
  `below_18_years_old_count` int(11) NOT NULL,
  `labor_total_cost` int(11) NOT NULL,
  `irrigation_field_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_irrigation`
--

LOCK TABLES `season_long_irrigation` WRITE;
/*!40000 ALTER TABLE `season_long_irrigation` DISABLE KEYS */;
INSERT INTO `season_long_irrigation` VALUES (1,61,2,1,1,1,23,4,5,6,1,0,2,2,2,3,4,5,6,1),(2,62,1,1,0,0,0,0,0,0,0,0,23,1,23,4,5,6,8,0),(3,67,1,1,0,0,0,0,0,0,0,0,4,1,2,3,4,5,6,0),(4,69,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `season_long_irrigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_irrigation_period`
--

DROP TABLE IF EXISTS `season_long_irrigation_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_irrigation_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_irrigation_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `irrigated` tinyint(4) NOT NULL,
  `water_depth` int(11) NOT NULL,
  `standing_water` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_irrigation_period`
--

LOCK TABLES `season_long_irrigation_period` WRITE;
/*!40000 ALTER TABLE `season_long_irrigation_period` DISABLE KEYS */;
INSERT INTO `season_long_irrigation_period` VALUES (6,2,'2017-01-03 00:00:00',1,2,2,'1'),(7,3,'2017-01-02 00:00:00',1,3,2,'1'),(10,1,'2017-01-09 00:00:00',1,4,23,'2');
/*!40000 ALTER TABLE `season_long_irrigation_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_land_preparation`
--

DROP TABLE IF EXISTS `season_long_land_preparation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_land_preparation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `crop_establishment` tinyint(4) NOT NULL,
  `land_preparation_started` datetime NOT NULL,
  `tractor_cost` int(11) NOT NULL,
  `labor_type` tinyint(4) NOT NULL,
  `male_labor_count` int(11) NOT NULL DEFAULT '0',
  `female_labor_count` int(11) NOT NULL DEFAULT '0',
  `above_18_years_old_count` int(11) NOT NULL DEFAULT '0',
  `below_18_years_old_count` int(11) NOT NULL,
  `labor_total_cost` int(11) NOT NULL,
  `wage_rate_per_day_male` int(11) NOT NULL,
  `wage_rate_per_day_female` int(11) NOT NULL,
  `import` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_land_preparation`
--

LOCK TABLES `season_long_land_preparation` WRITE;
/*!40000 ALTER TABLE `season_long_land_preparation` DISABLE KEYS */;
INSERT INTO `season_long_land_preparation` VALUES (1,1,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(2,2,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(3,3,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(4,4,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(5,5,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(6,6,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(7,7,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(8,8,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(9,9,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(10,10,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(11,11,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(12,12,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(13,13,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(14,14,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(15,15,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(16,16,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(17,17,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(18,18,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(19,19,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(20,20,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(21,21,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(22,22,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(23,23,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(24,24,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(25,25,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(26,26,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(27,27,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(28,28,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(29,29,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(30,30,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(31,31,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(32,32,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(33,33,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(34,34,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(35,35,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(36,36,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(37,37,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(38,38,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(39,39,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(40,40,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(41,41,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(42,42,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(43,43,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(44,44,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(45,45,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(46,46,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(47,47,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(48,48,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(49,49,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(50,50,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(51,51,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(52,52,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(53,53,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(54,54,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(55,55,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(56,56,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(57,57,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(58,58,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(59,59,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(60,60,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,1),(61,61,1,'2017-01-11 00:00:00',2311,2,1,2,3,4,5,6,7,0),(62,69,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `season_long_land_preparation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_land_preparation_operations`
--

DROP TABLE IF EXISTS `season_long_land_preparation_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_land_preparation_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_land_preparation_id` int(11) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `date` datetime NOT NULL,
  `power_source` tinyint(4) NOT NULL,
  `tractor_horsepower` int(11) NOT NULL,
  `tractor_hour_usage` int(11) NOT NULL,
  `soil_condition` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_land_preparation_operations`
--

LOCK TABLES `season_long_land_preparation_operations` WRITE;
/*!40000 ALTER TABLE `season_long_land_preparation_operations` DISABLE KEYS */;
INSERT INTO `season_long_land_preparation_operations` VALUES (4,61,1,'2017-01-03 00:00:00',2,23,12,1),(7,62,0,'0000-00-00 00:00:00',0,0,0,0);
/*!40000 ALTER TABLE `season_long_land_preparation_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_nursery_establishment`
--

DROP TABLE IF EXISTS `season_long_nursery_establishment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_nursery_establishment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farmer_id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  `nursery_date` datetime NOT NULL,
  `operation_used` varchar(100) NOT NULL,
  `horsepower_tractor` int(11) NOT NULL,
  `total_minute_tractor` int(11) NOT NULL,
  `total_hours_preparation` int(11) NOT NULL,
  `total_cost_nursery_establishment` int(11) NOT NULL,
  `labor_used` tinyint(4) NOT NULL,
  `male_labor` int(11) NOT NULL,
  `female_labor` int(11) NOT NULL,
  `hired_male_exchange_labor` int(11) NOT NULL,
  `hired_female_exchange_labor` int(11) NOT NULL,
  `operation_used_other` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_nursery_establishment`
--

LOCK TABLES `season_long_nursery_establishment` WRITE;
/*!40000 ALTER TABLE `season_long_nursery_establishment` DISABLE KEYS */;
/*!40000 ALTER TABLE `season_long_nursery_establishment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_pesticide_application`
--

DROP TABLE IF EXISTS `season_long_pesticide_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_pesticide_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `applied_pesticide` int(11) NOT NULL,
  `applied_pesticide_other` varchar(100) DEFAULT NULL,
  `pesticide_registered` tinyint(4) NOT NULL,
  `pesticide_forbidden` tinyint(4) NOT NULL,
  `pesticide_calibrated` int(11) NOT NULL,
  `total_cost_paid` int(11) NOT NULL,
  `labor_type` int(11) NOT NULL,
  `male_labor` int(11) NOT NULL,
  `female_labor` int(11) NOT NULL,
  `above_18_years_old` int(11) NOT NULL,
  `below_18_years_old` int(11) NOT NULL,
  `pesticide_labor_total_cost` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pesticide_application`
--

LOCK TABLES `season_long_pesticide_application` WRITE;
/*!40000 ALTER TABLE `season_long_pesticide_application` DISABLE KEYS */;
INSERT INTO `season_long_pesticide_application` VALUES (1,62,4,'0',1,1,2,2,2,3,4,5,6,7),(2,63,0,'0',0,0,0,0,0,0,0,0,0,0),(3,64,0,'0',0,0,0,0,0,0,0,0,0,0),(4,65,0,'0',0,0,0,0,0,0,0,0,0,0),(5,66,0,'0',0,0,0,0,0,0,0,0,0,0),(6,67,1,'0',1,0,2,2,1,2,3,4,5,6);
/*!40000 ALTER TABLE `season_long_pesticide_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_pesticide_equipment`
--

DROP TABLE IF EXISTS `season_long_pesticide_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_pesticide_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_pesticide_application_id` int(11) NOT NULL,
  `value` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`season_long_pesticide_application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pesticide_equipment`
--

LOCK TABLES `season_long_pesticide_equipment` WRITE;
/*!40000 ALTER TABLE `season_long_pesticide_equipment` DISABLE KEYS */;
INSERT INTO `season_long_pesticide_equipment` VALUES (5,1,0),(6,6,0);
/*!40000 ALTER TABLE `season_long_pesticide_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_pesticide_rice_problems_detail`
--

DROP TABLE IF EXISTS `season_long_pesticide_rice_problems_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_pesticide_rice_problems_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_pesticide_application_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `applied_date` datetime NOT NULL,
  `applied` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `leftover` int(11) NOT NULL DEFAULT '0',
  `brand_applied` varchar(100) DEFAULT NULL,
  `other` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pesticide_rice_problems_detail`
--

LOCK TABLES `season_long_pesticide_rice_problems_detail` WRITE;
/*!40000 ALTER TABLE `season_long_pesticide_rice_problems_detail` DISABLE KEYS */;
INSERT INTO `season_long_pesticide_rice_problems_detail` VALUES (5,1,'snails','2017-01-19 00:00:00',2,3,1,'1',0),(6,6,'insect','2017-01-03 00:00:00',2,3,1,'1',0);
/*!40000 ALTER TABLE `season_long_pesticide_rice_problems_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_pesticide_use_efficiency`
--

DROP TABLE IF EXISTS `season_long_pesticide_use_efficiency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_pesticide_use_efficiency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL DEFAULT '0',
  `bird_management` int(11) NOT NULL DEFAULT '0',
  `disease_management` int(11) NOT NULL DEFAULT '0',
  `equipment_calibrated` int(11) NOT NULL DEFAULT '0',
  `insect_management` int(11) NOT NULL DEFAULT '0',
  `label_instructions` int(11) NOT NULL DEFAULT '0',
  `mollusk_management` int(11) NOT NULL DEFAULT '0',
  `registered_products` int(11) NOT NULL DEFAULT '0',
  `rodent_management` int(11) NOT NULL DEFAULT '0',
  `targeted_application` int(11) NOT NULL DEFAULT '0',
  `weed_management` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pesticide_use_efficiency`
--

LOCK TABLES `season_long_pesticide_use_efficiency` WRITE;
/*!40000 ALTER TABLE `season_long_pesticide_use_efficiency` DISABLE KEYS */;
INSERT INTO `season_long_pesticide_use_efficiency` VALUES (1,68,3,3,2,2,3,3,2,3,2,2);
/*!40000 ALTER TABLE `season_long_pesticide_use_efficiency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_pre_planting_information`
--

DROP TABLE IF EXISTS `season_long_pre_planting_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_pre_planting_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `rice_area` double NOT NULL,
  `parcel_has_treatment` tinyint(4) NOT NULL DEFAULT '0',
  `treatment_name` varchar(100) NOT NULL DEFAULT '0',
  `previous_crop` tinyint(4) NOT NULL DEFAULT '0',
  `cropping_system` varchar(100) DEFAULT NULL,
  `previous_crop_harvested` datetime DEFAULT NULL,
  `straw_previous_crop_managed` varchar(100) DEFAULT NULL,
  `gps_north` int(11) NOT NULL DEFAULT '0',
  `gps_east` int(11) NOT NULL DEFAULT '0',
  `incorporate_organic_material` tinyint(4) NOT NULL DEFAULT '0',
  `organic_materials_incorporated` datetime DEFAULT NULL,
  `organic_material_cost` int(11) NOT NULL DEFAULT '0',
  `water_regime` tinyint(4) NOT NULL DEFAULT '0',
  `rice_variety_name` varchar(100) DEFAULT NULL,
  `seed_count` int(11) NOT NULL DEFAULT '0',
  `treatment_name_other` varchar(100) DEFAULT NULL,
  `land_rental` tinyint(4) NOT NULL,
  `rent_cost` int(11) NOT NULL DEFAULT '0',
  `grain_yield_previous` int(11) NOT NULL DEFAULT '0',
  `straw_burned` int(11) NOT NULL DEFAULT '0',
  `seed_type` int(11) NOT NULL DEFAULT '0',
  `seed_type_other` varchar(50) DEFAULT NULL,
  `soil_fertility` int(11) DEFAULT '0',
  `irrigation_regime` int(11) DEFAULT '0',
  `seed_certified` tinyint(4) NOT NULL DEFAULT '0',
  `import` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index2` (`season_long_id`),
  KEY `index3` (`rice_area`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pre_planting_information`
--

LOCK TABLES `season_long_pre_planting_information` WRITE;
/*!40000 ALTER TABLE `season_long_pre_planting_information` DISABLE KEYS */;
INSERT INTO `season_long_pre_planting_information` VALUES (1,1,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(2,2,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(3,3,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(4,4,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(5,5,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(6,6,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(7,7,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(8,8,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(9,9,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(10,10,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(11,11,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(12,12,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(13,13,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(14,14,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(15,15,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(16,16,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(17,17,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(18,18,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(19,19,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(20,20,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(21,21,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(22,22,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(23,23,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(24,24,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(25,25,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(26,26,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(27,27,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(28,28,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(29,29,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(30,30,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(31,31,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(32,32,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(33,33,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(34,34,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(35,35,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(36,36,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(37,37,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(38,38,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(39,39,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(40,40,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(41,41,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(42,42,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(43,43,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(44,44,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(45,45,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(46,46,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(47,47,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(48,48,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(49,49,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(50,50,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Treatment',0,0,0,0,0,NULL,0,0,0,1),(51,51,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(52,52,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(53,53,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(54,54,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(55,55,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(56,56,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(57,57,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(58,58,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(59,59,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(60,60,0,1,'Other',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,'Control',0,0,0,0,0,NULL,0,0,0,1),(61,61,2,1,'FarmersPractice',2,'6','2017-01-16 00:00:00','4',0,0,0,'0000-00-00 00:00:00',0,2,'2',4,'',3,5,823,23,2,'',2,1,1,0),(62,69,0.001,0,'',0,'','0000-00-00 00:00:00','',0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',0,0,0,0,0,'',0,0,0,0);
/*!40000 ALTER TABLE `season_long_pre_planting_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_pre_planting_information_organic_materials`
--

DROP TABLE IF EXISTS `season_long_pre_planting_information_organic_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_pre_planting_information_organic_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_pre_planting_information_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`season_long_pre_planting_information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pre_planting_information_organic_materials`
--

LOCK TABLES `season_long_pre_planting_information_organic_materials` WRITE;
/*!40000 ALTER TABLE `season_long_pre_planting_information_organic_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `season_long_pre_planting_information_organic_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_sowing_transplanting`
--

DROP TABLE IF EXISTS `season_long_sowing_transplanting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_sowing_transplanting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `direct_sowing_method` tinyint(4) NOT NULL,
  `sowing_date` datetime DEFAULT NULL,
  `total_cost_paid_tractor` int(11) NOT NULL DEFAULT '0',
  `labor_type` tinyint(4) NOT NULL DEFAULT '0',
  `male_labor` int(11) NOT NULL,
  `female_labor` int(11) NOT NULL DEFAULT '0',
  `above_18_years_old` int(11) NOT NULL DEFAULT '0',
  `below_18_years_old` int(11) NOT NULL DEFAULT '0',
  `labor_total_cost` int(11) NOT NULL DEFAULT '0',
  `wage_rate_male` int(11) NOT NULL DEFAULT '0',
  `wage_rate_female` int(11) NOT NULL DEFAULT '0',
  `transplanting_method` tinyint(4) NOT NULL DEFAULT '0',
  `transplanting_carried_out` tinyint(4) NOT NULL DEFAULT '0',
  `total_cost_tractor` int(11) NOT NULL DEFAULT '0',
  `transplanting_labor_count` int(11) NOT NULL DEFAULT '0',
  `total_cost_paid_service_provider` int(11) NOT NULL DEFAULT '0',
  `custom_extra_labor` tinyint(4) NOT NULL DEFAULT '0',
  `custom_other_labor_count` int(11) NOT NULL DEFAULT '0',
  `prepared_nursery` tinyint(4) NOT NULL DEFAULT '0',
  `nursery_establishment_date` datetime DEFAULT NULL,
  `transplanting_date` datetime DEFAULT NULL,
  `trays_seedling_count` int(11) NOT NULL DEFAULT '0',
  `seed_total_cost` int(11) NOT NULL DEFAULT '0',
  `fertilizer_total_cost` int(11) NOT NULL DEFAULT '0',
  `total_labor_cost_seedling` int(11) NOT NULL DEFAULT '0',
  `total_cost_seedling_transport` int(11) NOT NULL DEFAULT '0',
  `nursery_area` int(11) NOT NULL DEFAULT '0',
  `nursery_field_area` tinyint(4) NOT NULL DEFAULT '0',
  `tractor_total_minute` int(11) NOT NULL DEFAULT '0',
  `total_seed_cost` int(11) NOT NULL DEFAULT '0',
  `seedling_labor_type` tinyint(4) NOT NULL DEFAULT '0',
  `seedling_male_labor` int(11) NOT NULL DEFAULT '0',
  `seedling_female_labor` int(11) NOT NULL DEFAULT '0',
  `seedling_above_18_years_old` int(11) NOT NULL DEFAULT '0',
  `seedling_below_18_years_old` int(11) NOT NULL DEFAULT '0',
  `nursery_labor_type` int(11) NOT NULL DEFAULT '0',
  `nursery_male_labor` int(11) NOT NULL DEFAULT '0',
  `nursery_female_labor` int(11) NOT NULL DEFAULT '0',
  `nursery_above_18_years_old` int(11) NOT NULL DEFAULT '0',
  `nursery_below_18_years_old` int(11) NOT NULL DEFAULT '0',
  `nursery_labor_total_cost` int(11) NOT NULL DEFAULT '0',
  `seedling_labor_total_cost` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index2` (`season_long_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_sowing_transplanting`
--

LOCK TABLES `season_long_sowing_transplanting` WRITE;
/*!40000 ALTER TABLE `season_long_sowing_transplanting` DISABLE KEYS */;
INSERT INTO `season_long_sowing_transplanting` VALUES (1,61,1,'2017-01-11 00:00:00',213,1,4,5,6,5,9,1,2,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0),(2,69,0,'2017-02-20 16:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `season_long_sowing_transplanting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_weeding_herbicide`
--

DROP TABLE IF EXISTS `season_long_weeding_herbicide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_weeding_herbicide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `control_weed` tinyint(4) NOT NULL,
  `weeding_carried_out` datetime DEFAULT NULL,
  `total_labor_weeding` int(11) NOT NULL,
  `weeding_labor` tinyint(4) NOT NULL,
  `weeding_male_labor` int(11) NOT NULL,
  `weeding_female_labor` int(11) NOT NULL,
  `weeding_above_18_years` int(11) NOT NULL,
  `weeding_below_18_years` int(11) NOT NULL,
  `weeding_wage_rate_male` int(11) NOT NULL,
  `weeding_wage_rate_female` int(11) NOT NULL,
  `herbicide_labor` tinyint(4) NOT NULL,
  `herbicide_count` int(11) NOT NULL,
  `herbicide_cost` int(11) NOT NULL,
  `herbicide_male_labor` int(11) NOT NULL,
  `herbicide_female_labor` int(11) NOT NULL,
  `herbicide_above_18_years` int(11) NOT NULL,
  `herbicide_below_18_years` int(11) NOT NULL,
  `herbicide_total_labor_cost` int(11) NOT NULL,
  `dominant_weed` tinyint(4) NOT NULL,
  `labor_total_cost` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_weeding_herbicide`
--

LOCK TABLES `season_long_weeding_herbicide` WRITE;
/*!40000 ALTER TABLE `season_long_weeding_herbicide` DISABLE KEYS */;
INSERT INTO `season_long_weeding_herbicide` VALUES (1,62,1,'2017-01-04 00:00:00',3,1,4,5,6,7,1,2,0,0,0,0,0,0,0,0,0,3),(2,67,1,'2017-01-04 00:00:00',2,1,1,2,3,4,5,6,0,0,0,0,0,0,0,0,0,7);
/*!40000 ALTER TABLE `season_long_weeding_herbicide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_weeding_herbicide_application`
--

DROP TABLE IF EXISTS `season_long_weeding_herbicide_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_weeding_herbicide_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_weeding_herbicide_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `technical_name` varchar(100) DEFAULT NULL,
  `active_ingredient` varchar(100) DEFAULT NULL,
  `bottles_applied` int(11) NOT NULL,
  `ml` int(11) NOT NULL,
  `leftover` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_weeding_herbicide_application`
--

LOCK TABLES `season_long_weeding_herbicide_application` WRITE;
/*!40000 ALTER TABLE `season_long_weeding_herbicide_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `season_long_weeding_herbicide_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_weeding_herbicide_weeds`
--

DROP TABLE IF EXISTS `season_long_weeding_herbicide_weeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_weeding_herbicide_weeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_weeding_herbicide_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_weeding_herbicide_weeds`
--

LOCK TABLES `season_long_weeding_herbicide_weeds` WRITE;
/*!40000 ALTER TABLE `season_long_weeding_herbicide_weeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `season_long_weeding_herbicide_weeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_women_empowerment`
--

DROP TABLE IF EXISTS `season_long_women_empowerment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_women_empowerment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `womens_decision` tinyint(4) NOT NULL,
  `womens_control_over_decision` tinyint(4) NOT NULL,
  `womens_satisfaction_labor_input` tinyint(4) NOT NULL,
  `womens_access_information` tinyint(4) NOT NULL,
  `womens_access_seasonal_resources` tinyint(4) NOT NULL,
  `womens_control_long_term_resources` tinyint(4) NOT NULL,
  `womens_control_decision_making_household` tinyint(4) NOT NULL,
  `womens_control_personal_income` tinyint(4) NOT NULL,
  `womens_participation_decision_making` tinyint(4) NOT NULL,
  `violence_against_women` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_women_empowerment`
--

LOCK TABLES `season_long_women_empowerment` WRITE;
/*!40000 ALTER TABLE `season_long_women_empowerment` DISABLE KEYS */;
INSERT INTO `season_long_women_empowerment` VALUES (1,68,2,2,3,3,3,2,2,2,2,2);
/*!40000 ALTER TABLE `season_long_women_empowerment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_long_workers_health_safety`
--

DROP TABLE IF EXISTS `season_long_workers_health_safety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_long_workers_health_safety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_long_id` int(11) NOT NULL,
  `work_related_injuries` tinyint(4) NOT NULL,
  `safety_instructions_available` tinyint(4) NOT NULL,
  `tools_calibrated_maintained` tinyint(4) NOT NULL,
  `training_pesticide_applicators` tinyint(4) NOT NULL,
  `pesticide_applicator_good_quality` tinyint(4) NOT NULL,
  `washing_changing_facility_available` tinyint(4) NOT NULL,
  `pesticide_applied_pregnant_women` tinyint(4) NOT NULL,
  `re_entry_time_48_hour` tinyint(4) NOT NULL,
  `pesticide_inorganic_fertilizer_stored` tinyint(4) NOT NULL,
  `empty_pesticide_disposed` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_workers_health_safety`
--

LOCK TABLES `season_long_workers_health_safety` WRITE;
/*!40000 ALTER TABLE `season_long_workers_health_safety` DISABLE KEYS */;
INSERT INTO `season_long_workers_health_safety` VALUES (1,68,2,2,2,3,3,2,3,3,3,3);
/*!40000 ALTER TABLE `season_long_workers_health_safety` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(32) NOT NULL,
  `access` int(10) unsigned DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('2d0n46apoqkna5tg4r371snsr7',1486486554,'user|a:11:{s:2:\"id\";s:1:\"1\";s:5:\"email\";s:18:\"nylbrian@gmail.com\";s:8:\"username\";s:8:\"nylbrian\";s:8:\"password\";s:40:\"467d0efbc769f4cc78deb23d56ddef9775fd3179\";s:12:\"countries_id\";s:2:\"11\";s:10:\"profession\";s:10:\"profession\";s:12:\"organization\";s:12:\"Organization\";s:7:\"deleted\";s:1:\"0\";s:10:\"last_login\";s:19:\"2017-01-31 21:44:40\";s:4:\"role\";s:1:\"1\";s:4:\"hash\";s:40:\"467d0efbc769f4cc78deb23d56ddef9775fd3179\";}'),('9hf1ffu8rbrepgo16ikk0gfbm0',1486923773,'user|a:11:{s:2:\"id\";s:1:\"1\";s:5:\"email\";s:18:\"nylbrian@gmail.com\";s:8:\"username\";s:8:\"nylbrian\";s:8:\"password\";s:40:\"467d0efbc769f4cc78deb23d56ddef9775fd3179\";s:12:\"countries_id\";s:2:\"11\";s:10:\"profession\";s:10:\"profession\";s:12:\"organization\";s:12:\"Organization\";s:7:\"deleted\";s:1:\"0\";s:10:\"last_login\";s:19:\"2017-01-31 21:44:40\";s:4:\"role\";s:1:\"1\";s:4:\"hash\";s:40:\"467d0efbc769f4cc78deb23d56ddef9775fd3179\";}'),('cjvpebmi6ulhot23eqq6mc5kj7',1487873714,'user|a:11:{s:2:\"id\";s:1:\"1\";s:5:\"email\";s:18:\"nylbrian@gmail.com\";s:8:\"username\";s:8:\"nylbrian\";s:8:\"password\";s:40:\"467d0efbc769f4cc78deb23d56ddef9775fd3179\";s:12:\"countries_id\";s:2:\"11\";s:10:\"profession\";s:10:\"profession\";s:12:\"organization\";s:12:\"Organization\";s:7:\"deleted\";s:1:\"0\";s:10:\"last_login\";s:19:\"2017-01-31 21:44:40\";s:4:\"role\";s:1:\"1\";s:4:\"hash\";s:40:\"467d0efbc769f4cc78deb23d56ddef9775fd3179\";}'),('f6dd6empm5vebn7f6hgeeomhc5',1488737023,'user|a:11:{s:2:\"id\";s:1:\"1\";s:5:\"email\";s:18:\"nylbrian@gmail.com\";s:8:\"username\";s:8:\"nylbrian\";s:8:\"password\";s:40:\"467d0efbc769f4cc78deb23d56ddef9775fd3179\";s:12:\"countries_id\";s:2:\"11\";s:10:\"profession\";s:10:\"profession\";s:12:\"organization\";s:12:\"Organization\";s:7:\"deleted\";s:1:\"0\";s:10:\"last_login\";s:19:\"2017-01-31 21:44:40\";s:4:\"role\";s:1:\"1\";s:4:\"hash\";s:40:\"467d0efbc769f4cc78deb23d56ddef9775fd3179\";}'),('on5915e6hmrhc4r9bdcuav1qk2',1489416166,'user|a:11:{s:2:\"id\";s:1:\"1\";s:5:\"email\";s:18:\"nylbrian@gmail.com\";s:8:\"username\";s:8:\"nylbrian\";s:8:\"password\";s:40:\"467d0efbc769f4cc78deb23d56ddef9775fd3179\";s:12:\"countries_id\";s:2:\"11\";s:10:\"profession\";s:10:\"profession\";s:12:\"organization\";s:12:\"Organization\";s:7:\"deleted\";s:1:\"0\";s:10:\"last_login\";s:19:\"2017-01-31 21:44:40\";s:4:\"role\";s:1:\"1\";s:4:\"hash\";s:40:\"467d0efbc769f4cc78deb23d56ddef9775fd3179\";}'),('rbfvft666iik1hhp06q7t0lmn6',1487858897,'user|a:11:{s:2:\"id\";s:1:\"1\";s:5:\"email\";s:18:\"nylbrian@gmail.com\";s:8:\"username\";s:8:\"nylbrian\";s:8:\"password\";s:40:\"467d0efbc769f4cc78deb23d56ddef9775fd3179\";s:12:\"countries_id\";s:2:\"11\";s:10:\"profession\";s:10:\"profession\";s:12:\"organization\";s:12:\"Organization\";s:7:\"deleted\";s:1:\"0\";s:10:\"last_login\";s:19:\"2017-01-31 21:44:40\";s:4:\"role\";s:1:\"1\";s:4:\"hash\";s:40:\"467d0efbc769f4cc78deb23d56ddef9775fd3179\";}'),('sjcksv6kd8vp2nlvvp480uknu2',1487867032,'user|a:11:{s:2:\"id\";s:1:\"1\";s:5:\"email\";s:18:\"nylbrian@gmail.com\";s:8:\"username\";s:8:\"nylbrian\";s:8:\"password\";s:40:\"467d0efbc769f4cc78deb23d56ddef9775fd3179\";s:12:\"countries_id\";s:2:\"11\";s:10:\"profession\";s:10:\"profession\";s:12:\"organization\";s:12:\"Organization\";s:7:\"deleted\";s:1:\"0\";s:10:\"last_login\";s:19:\"2017-01-31 21:44:40\";s:4:\"role\";s:1:\"1\";s:4:\"hash\";s:40:\"467d0efbc769f4cc78deb23d56ddef9775fd3179\";}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `countries_id` int(11) NOT NULL,
  `profession` varchar(100) NOT NULL,
  `organization` varchar(100) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'nylbrian@gmail.com','nylbrian','467d0efbc769f4cc78deb23d56ddef9775fd3179',11,'profession','Organization',0,'2017-01-31 13:44:40',1),(2,'test@test.com','a','e9d71f5ee7c92d6dc9e92ffdad17b8bd49418f98',185,'a','a',0,'2017-01-31 17:15:30',1),(3,'','a','86f7e437faa5a7fce15d1ddcb9eaeaea377667b8',185,'a','a',0,'2017-01-31 17:22:00',1),(4,'nylbrian2@gmail.com','nylbrian','467d0efbc769f4cc78deb23d56ddef9775fd3179',11,'Profession','Organization',0,'2017-02-09 11:28:21',2),(5,'nylbrian2@gmail.com','nylbrian2','467d0efbc769f4cc78deb23d56ddef9775fd3179',11,'Profession','Organization',0,'2017-02-09 11:29:29',2),(6,'nylbrian3@gmail.com','nylbrian3','467d0efbc769f4cc78deb23d56ddef9775fd3179',11,'Profession','Organization',0,'2017-02-09 11:30:05',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villages`
--

DROP TABLE IF EXISTS `villages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `villages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district_municipalities_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villages`
--

LOCK TABLES `villages` WRITE;
/*!40000 ALTER TABLE `villages` DISABLE KEYS */;
INSERT INTO `villages` VALUES (2,2,'Makati',0),(3,3,'Village of US',0),(4,4,'5',0),(5,5,'Village',0),(6,6,'5',0),(7,7,'166',0),(8,8,'5',0),(9,9,'5',0),(10,10,'5',0),(11,11,'14',0),(12,12,'6',0),(13,13,'5',0),(14,14,'4',0),(15,15,'6',0),(16,16,'3',0),(17,17,'4',0),(18,18,'66',0),(19,19,'115',0),(20,20,'8',0),(21,21,'4',0),(22,22,'5',0),(23,23,'A',0),(24,24,'Village',0),(25,25,'555',0),(26,26,'3',0),(27,27,'4',0),(28,28,'4',0),(29,29,'4',0),(30,30,'AA',0),(31,31,'3',0),(32,32,'3',0),(33,33,'5',0),(34,34,'A',0),(35,35,'4',0),(36,36,'5',0),(37,37,'4',0),(38,38,'5',0),(39,39,'5',0);
/*!40000 ALTER TABLE `villages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-11 21:38:27
