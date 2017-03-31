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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district_municipalities`
--

LOCK TABLES `district_municipalities` WRITE;
/*!40000 ALTER TABLE `district_municipalities` DISABLE KEYS */;
INSERT INTO `district_municipalities` VALUES (2,'12',168,1,NULL),(3,'District of US',169,1,NULL),(4,'4',170,1,NULL),(5,'Town',171,1,NULL),(6,'4',172,1,NULL),(7,'155',173,1,NULL),(8,'4',174,1,NULL),(9,'4',175,1,NULL),(10,'4',176,1,NULL),(11,'23',177,1,NULL),(12,'5',178,1,NULL),(13,'4',179,1,NULL),(14,'3',180,1,NULL),(15,'5',181,1,NULL);
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
  PRIMARY KEY (`id`),
  KEY `index2` (`farmers_id`),
  KEY `index3` (`seasons_id`),
  KEY `index4` (`year`),
  KEY `index5` (`sowing_date`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer_seasons`
--

LOCK TABLES `farmer_seasons` WRITE;
/*!40000 ALTER TABLE `farmer_seasons` DISABLE KEYS */;
INSERT INTO `farmer_seasons` VALUES (16,39,1,2016,'2016-11-01 00:00:00',0),(17,40,1,223,'2016-05-30 00:00:00',0),(18,41,1,2016,'2016-08-01 00:00:00',0),(19,42,1,231,'2016-08-30 00:00:00',0),(20,43,1,2016,'2016-08-31 00:00:00',0),(21,44,1,2013,'2016-08-30 00:00:00',0),(22,45,1,2131,'2016-08-01 00:00:00',0),(23,46,1,2016,'2016-09-28 00:00:00',0),(24,47,1,2016,'2016-05-01 00:00:00',0),(25,48,1,2016,'2016-10-31 00:00:00',0),(26,49,1,2016,'2016-07-27 00:00:00',0),(27,50,1,2016,'2016-06-28 00:00:00',0);
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
  PRIMARY KEY (`id`),
  KEY `index2` (`countries_id`),
  KEY `index3` (`region_provinces_id`),
  KEY `index4` (`province_districts_id`),
  KEY `index5` (`district_municipalities_id`),
  KEY `index6` (`villages_id`),
  KEY `index7` (`first_name`),
  KEY `index8` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmers`
--

LOCK TABLES `farmers` WRITE;
/*!40000 ALTER TABLE `farmers` DISABLE KEYS */;
/*!40000 ALTER TABLE `farmers` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province_districts`
--

LOCK TABLES `province_districts` WRITE;
/*!40000 ALTER TABLE `province_districts` DISABLE KEYS */;
INSERT INTO `province_districts` VALUES (1,1,'Chiang Mai',1,0,0),(2,1,'Chiang Rai',1,0,0),(3,1,'Lampang',1,0,0),(4,1,'Lamphun',1,0,0),(5,1,'Mae Hong Son',1,0,0),(6,1,'Nan',1,0,0),(7,1,'Phayao',1,0,0),(8,1,'Phrae',1,0,0),(9,1,'Uttaradit',1,0,0),(10,1,'Tak',1,0,0),(11,1,'Sukhothai',1,0,0),(12,1,'Phitsanulok',1,0,0),(13,1,'Phichit',1,0,0),(14,1,'Kamphaeng Phet',1,0,0),(15,1,'Phetchabun',1,0,0),(16,1,'Nakhon Sawan',1,0,0),(17,1,'Uthai Thani',1,0,0),(18,2,'Amnat Charoen',1,0,0),(19,2,'Bueng Kan',1,0,0),(20,2,'Buri Ram',1,0,0),(21,2,'Chaiyaphum',1,0,0),(22,2,'Kalasin',1,0,0),(23,2,'Khon Kaen',1,0,0),(24,2,'Loei',1,0,0),(25,2,'Maha Sarakham',1,0,0),(26,2,'Mukdahan',1,0,0),(27,2,'Nakhon Phanom',1,0,0),(28,2,'Nakhon Ratchasima',1,0,0),(29,2,'Nong Bua Lamphu',1,0,0),(30,2,'Nong Khai',1,0,0),(31,2,'Roi Et',1,0,0),(32,2,'Sakon Nakhon',1,0,0),(33,2,'Si Sa Ket',1,0,0),(34,2,'Surin',1,0,0),(35,2,'Ubon Ratchathani',1,0,0),(36,2,'Udon Thani',1,0,0),(37,2,'Yasothon',1,0,0),(38,3,'Ang Thong',1,0,0),(39,3,'Chainat',1,0,0),(40,3,'Phra Nakhon Si Ayutthaya',1,0,0),(41,3,'Bangkok',1,0,0),(42,3,'Lop Buri',1,0,0),(43,3,'Nakhon Pathom',1,0,0),(44,3,'Nonthaburi',1,0,0),(45,3,'Pathum Thani',1,0,0),(46,3,'Samut Prakan',1,0,0),(47,3,'Samut Sakhon',1,0,0),(48,3,'Samut Songkhram',1,0,0),(49,3,'Saraburi',1,0,0),(50,3,'Sing Buri',1,0,0),(51,3,'Suphan Buri',1,0,0),(52,3,'Nakhon Nayok',1,0,0),(53,3,'Chachoengsao',1,0,0),(54,3,'Chanthaburi',1,0,0),(55,3,'Chon Buri',1,0,0),(56,3,'Prachin Buri',1,0,0),(57,3,'Rayong',1,0,0),(58,3,'Sa Kaeo',1,0,0),(59,3,'Trat',1,0,0),(60,3,'Kanchanaburi',1,0,0),(61,3,'Ratchaburi',1,0,0),(62,3,'Phetchaburi',1,0,0),(63,3,'Prachuap Khiri Khan',1,0,0),(64,4,'Chumphon',1,0,0),(65,4,'Nakhon Si Thammarat',1,0,0),(66,4,'Narathiwat',1,0,0),(67,4,'Pattani',1,0,0),(68,4,'Phatthalung',1,0,0),(69,4,'Songkhla',1,0,0),(70,4,'Surat Thani',1,0,0),(71,4,'Yala',1,0,0),(72,4,'Krabi',1,0,0),(73,4,'Phang Nga',1,0,0),(74,4,'Phuket',1,0,0),(75,4,'Ranong',1,0,0),(76,4,'Satun',1,0,0),(77,4,'Trang',1,0,0),(78,39,'Báº¯c Ninh',1,0,0),(79,39,'HÃ  Nam',1,0,0),(80,39,'HÃ  TÃ¢y',1,0,0),(81,39,'Háº£i DÆ°Æ¡ng',1,0,0),(82,39,'HÆ°ng YÃªn',1,0,0),(83,39,'Nam Äá»‹nh',1,0,0),(84,39,'Ninh BÃ¬nh',1,0,0),(85,39,'ThÃ¡i BÃ¬nh',1,0,0),(86,39,'VÄ©nh PhÃºc',1,0,0),(87,39,'Ha NoiÂ ',1,0,0),(88,39,'Hai PhongÂ ',1,0,0),(89,40,'HÃ  TÄ©nh',1,0,0),(90,40,'Nghá»‡ An',1,0,0),(91,40,'Quáº£ng BÃ¬nh',1,0,0),(92,40,'Quáº£ng Trá»‹',1,0,0),(93,40,'Thanh HÃ³a',1,0,0),(94,40,'Thá»«a ThiÃªn-Huáº¿',1,0,0),(95,41,'Báº¯c Giang',1,0,0),(96,41,'Báº¯c Káº¡n',1,0,0),(97,41,'Cao Báº±ng',1,0,0),(98,41,'HÃ  Giang',1,0,0),(99,41,'Láº¡ng SÆ¡n',1,0,0),(100,41,'LÃ o Cai',1,0,0),(101,41,'PhÃº Thá»',1,0,0),(102,41,'Quáº£ng Ninh',1,0,0),(103,41,'ThÃ¡i NguyÃªn',1,0,0),(104,41,'TuyÃªn Quang',1,0,0),(105,41,'YÃªn BÃ¡i',1,0,0),(106,41,'Äiá»‡n BiÃªn',1,0,0),(107,41,'HÃ²a BÃ¬nh',1,0,0),(108,41,'Lai ChÃ¢u',1,0,0),(109,41,'SÆ¡n La',1,0,0),(110,43,'Äáº¯k Láº¯k',1,0,0),(111,43,'Äáº¯k NÃ´ng',1,0,0),(112,43,'Gia Lai',1,0,0),(113,43,'Kon Tum',1,0,0),(114,43,'LÃ¢m Äá»“ng',1,0,0),(115,44,'BÃ¬nh Äá»‹nh',1,0,0),(116,44,'KhÃ¡nh HÃ²a',1,0,0),(117,44,'PhÃº YÃªn',1,0,0),(118,44,'Quáº£ng Nam',1,0,0),(119,44,'Quáº£ng NgÃ£i',1,0,0),(120,44,'BÃ¬nh Thuáº­n',1,0,0),(121,44,'Ninh Thuáº­n',1,0,0),(122,44,'Da NangÂ ',1,0,0),(123,45,'BÃ  Rá»‹aâ€“VÅ©ng TÃ u',1,0,0),(124,45,'BÃ¬nh DÆ°Æ¡ng',1,0,0),(125,45,'BÃ¬nh PhÆ°á»›c',1,0,0),(126,45,'Äá»“ng Nai',1,0,0),(127,45,'TÃ¢y Ninh',1,0,0),(128,45,'Ho Chi Minh',1,0,0),(129,46,'An Giang',1,0,0),(130,46,'Báº¡c LiÃªu',1,0,0),(131,46,'Báº¿n Tre',1,0,0),(132,46,'CÃ  Mau',1,0,0),(133,46,'Äá»“ng ThÃ¡p',1,0,0),(134,46,'Háº­u Giang',1,0,0),(135,46,'KiÃªn Giang',1,0,0),(136,46,'Long An',1,0,0),(137,46,'SÃ³c TrÄƒng',1,0,0),(138,46,'Tiá»n Giang',1,0,0),(139,46,'TrÃ  Vinh',1,0,0),(140,46,'VÄ©nh Long',1,0,0),(141,46,'Cáº§n ThÆ¡',1,0,0),(142,68,'Kandy',0,0,0),(143,68,'Matale',0,0,0),(144,68,'Nuwara Eliya',0,0,0),(145,69,'Ampara',0,0,0),(146,69,'Batticaloa',0,0,0),(147,69,'Trincomalee',0,0,0),(148,74,'Anuradhapura',0,0,0),(149,74,'Polonnaruwa',0,0,0),(150,73,'Kurunegala',0,0,0),(151,73,'Puttalam',0,0,0),(152,70,'Jaffna',0,0,0),(153,70,'Kilinochchi',0,0,0),(154,70,'Mannar',0,0,0),(155,70,'Mullaitivu',0,0,0),(156,70,'Vavuniya',0,0,0),(157,76,'Kegalle',0,0,0),(158,76,'Ratnapura',0,0,0),(159,71,'Galle',0,0,0),(160,71,'Hambantota',0,0,0),(161,71,'Matara',0,0,0),(162,75,'Badulla',0,0,0),(163,75,'Monaragala',0,0,0),(164,72,'Colombo',0,0,0),(165,72,'Gampaha',0,0,0),(166,72,'Kalutara',0,0,0),(171,68,'District',1,1,0),(172,111,'13',1,1,0),(173,112,'144',1,1,0),(174,113,'3',1,1,0),(175,114,'23',1,1,0),(176,115,'3',1,1,0),(177,112,'1445',1,1,0),(178,116,'14',1,1,0),(179,117,'3',1,1,0),(180,118,'2',1,1,0),(181,119,'4',1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_provinces`
--

LOCK TABLES `region_provinces` WRITE;
/*!40000 ALTER TABLE `region_provinces` DISABLE KEYS */;
INSERT INTO `region_provinces` VALUES (1,13,'Northern Thailand',0,0,0),(2,13,'Northeastern Thailand',0,0,0),(3,13,'Central Thailand',0,0,0),(4,13,'Southern Thailand',0,0,0),(5,5,'Special Region of Aceh',0,0,0),(6,5,'Bali',0,0,0),(7,5,'Bangkaâ€“Belitung Islands',0,0,0),(8,5,'Banten',0,0,0),(9,5,'Bengkulu',0,0,0),(10,5,'Central Java',0,0,0),(11,5,'Central Kalimantan',0,0,0),(12,5,'Central Sulawesi',0,0,0),(13,5,'East Java',0,0,0),(14,5,'East Kalimantan',0,0,0),(15,5,'East Nusa Tenggara',0,0,0),(16,5,'Gorontalo',0,0,0),(17,5,'Jakarta Special Capital Region',0,0,0),(18,5,'Jambi',0,0,0),(19,5,'Lampung',0,0,0),(20,5,'Maluku',0,0,0),(21,5,'North Kalimantan',0,0,0),(22,5,'North Maluku',0,0,0),(23,5,'North Sulawesi',0,0,0),(24,5,'North Sumatra',0,0,0),(25,5,'Special Region of Papua',0,0,0),(26,5,'Riau',0,0,0),(27,5,'Riau Islands',0,0,0),(28,5,'Southeast Sulawesi',0,0,0),(29,5,'South Kalimantan',0,0,0),(30,5,'South Sulawesi',0,0,0),(31,5,'South Sumatra',0,0,0),(32,5,'West Java',0,0,0),(33,5,'West Kalimantan',0,0,0),(34,5,'West Nusa Tenggara',0,0,0),(35,5,'Special Region of West Papua',0,0,0),(36,5,'West Sulawesi',0,0,0),(37,5,'West Sumatra',0,0,0),(38,5,'Special Region of Yogyakarta',0,0,0),(39,14,'Red River Delta (Äá»“ng Báº±ng SÃ´ng Há»“ng)',1,0,0),(40,14,'North Central Coastal Vietnam',1,0,0),(41,14,'North Eastern Vietnam',1,0,0),(42,14,'North Western Vietnam',1,0,0),(43,14,'Southern Vietnam',1,0,0),(44,14,'South Central Coastal Vietnam',1,0,0),(45,14,'South Eastern Vietnam',1,0,0),(46,14,'Mekong River Delta',1,0,0),(47,8,'Ayeyarwady Region',1,0,0),(48,8,'Bago Region',1,0,0),(49,8,'Chin State',1,0,0),(50,8,'Kachin State',1,0,0),(51,8,'Kayah State',1,0,0),(52,8,'Kayin State',1,0,0),(53,8,'Magway Region',1,0,0),(54,8,'Mandalay Region',1,0,0),(55,8,'Mon State',1,0,0),(56,8,'Rakhine State',1,0,0),(57,8,'Shan State',1,0,0),(58,8,'Sagaing Region',1,0,0),(59,8,'Tanintharyi Region',1,0,0),(60,8,'Yangon Region',1,0,0),(61,8,'Naypyidaw Union Territory',1,0,0),(62,8,'Danu Self-Administered Zone',1,0,0),(63,8,'Kokang Self-Administered Zone',1,0,0),(64,8,'Naga Self-Administered Zone',1,0,0),(65,8,'Pa\'O Self-Administered Zone',1,0,0),(66,8,'Pa Laung Self-Administered Zone',1,0,0),(67,8,'Wa Self-Administered Division',1,0,0),(68,12,'Central Province',1,0,0),(69,12,'Eastern Province',1,0,0),(70,12,'Northern Province',1,0,0),(71,12,'Southern Province',1,0,0),(72,12,'Western Province',1,0,0),(73,12,'North Western Province',1,0,0),(74,12,'North Central Province',1,0,0),(75,12,'Uva Province',1,0,0),(76,12,'Sabaragamuwa Province',1,0,0),(77,3,'Anhui',1,0,0),(78,3,'Fujian',1,0,0),(79,3,'Gansu',1,0,0),(80,3,'Guangdong',1,0,0),(81,3,'Guizhou',1,0,0),(82,3,'Hainan',1,0,0),(83,3,'Hebei',1,0,0),(84,3,'Heilongjiang',1,0,0),(85,3,'Henan',1,0,0),(86,3,'Hubei',1,0,0),(87,3,'Hunan',1,0,0),(88,3,'Jiangsu',1,0,0),(89,3,'Jiangxi',1,0,0),(90,3,'Jilin',1,0,0),(91,3,'Liaoning',1,0,0),(92,3,'Qinghai',1,0,0),(93,3,'Shaanxi',1,0,0),(94,3,'Shandong',1,0,0),(95,3,'Shanxi',1,0,0),(96,3,'Sichuan',1,0,0),(97,3,'Yunnan',1,0,0),(98,3,'Zhejiang',1,0,0),(99,3,' GuangxiÂ Zhuang',1,0,0),(100,3,'Inner Mongolia',1,0,0),(101,3,'NingxiaÂ Hui',1,0,0),(102,3,'XinjiangÂ Uighur',1,0,0),(103,3,'Tibet',1,0,0),(104,3,'Beijing Municipality',1,0,0),(105,3,'Chongqing Municipality',1,0,0),(106,3,'Shanghai Municipality',1,0,0),(107,3,'Tianjin Municipality',1,0,0),(108,3,'Hong Kong',1,0,0),(109,3,'Macau',1,0,0),(110,3,'Wolong',1,0,0),(111,9,'12',1,1,0),(112,185,'123',1,1,0),(113,9,'2',1,1,0),(114,195,'123',1,1,0),(115,185,'2',1,1,0),(116,195,'23',1,1,0),(117,195,'2',1,1,0),(118,9,'1',1,1,0),(119,9,'123',1,1,0);
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
  PRIMARY KEY (`id`),
  KEY `index2` (`farmers_id`),
  KEY `index3` (`farmer_seasons_id`),
  KEY `index4` (`farmer_seasons_id`,`farmers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long`
--

LOCK TABLES `season_long` WRITE;
/*!40000 ALTER TABLE `season_long` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_child_labor`
--

LOCK TABLES `season_long_child_labor` WRITE;
/*!40000 ALTER TABLE `season_long_child_labor` DISABLE KEYS */;
INSERT INTO `season_long_child_labor` VALUES (22,194,0,0,0),(23,209,3,0,0),(24,229,1,1,1),(25,280,0,0,0),(26,290,0,0,0),(27,298,1,3,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_child_labor_record`
--

LOCK TABLES `season_long_child_labor_record` WRITE;
/*!40000 ALTER TABLE `season_long_child_labor_record` DISABLE KEYS */;
INSERT INTO `season_long_child_labor_record` VALUES (14,23,2),(15,23,4),(16,23,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_cleaning_drying`
--

LOCK TABLES `season_long_cleaning_drying` WRITE;
/*!40000 ALTER TABLE `season_long_cleaning_drying` DISABLE KEYS */;
INSERT INTO `season_long_cleaning_drying` VALUES (27,181,0,0,2,2,3,4,5,23),(28,188,0,0,2,1,2,3,1,5),(29,274,2,23,1,24,5,1,1,0),(30,279,0,0,0,0,0,0,0,0),(31,297,2,2,1,1,2,3,4,5);
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
  KEY `index1` (`farmers_id`,`farmer_seasons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_computations`
--

LOCK TABLES `season_long_computations` WRITE;
/*!40000 ALTER TABLE `season_long_computations` DISABLE KEYS */;
INSERT INTO `season_long_computations` VALUES (39,16,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,15,'Acceptable',0,0,-15,'Unsustainable',0,0,15,'Acceptable',0,0,15,'Acceptable',0,0,15,'Acceptable',0,0,45,0,0,'Poor',0,'Poor',85,'Good',0,'Poor');
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
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_fertilizer_application`
--

LOCK TABLES `season_long_fertilizer_application` WRITE;
/*!40000 ALTER TABLE `season_long_fertilizer_application` DISABLE KEYS */;
INSERT INTO `season_long_fertilizer_application` VALUES (106,175,0,0,0,0,0,0,0,0,'',0),(107,176,0,0,0,0,0,0,0,0,'',0),(108,177,0,0,0,0,0,0,0,0,'',0),(109,178,0,0,0,0,0,0,0,0,'',0),(110,179,0,0,0,0,0,0,0,0,'',0),(111,180,0,0,0,0,0,0,0,0,'',0),(112,181,0,0,0,0,0,0,0,0,'',0),(113,182,2,0,0,0,0,0,0,0,'',0),(114,183,0,0,0,0,0,0,0,0,'',0),(115,184,0,0,0,0,0,0,0,0,'',0),(116,185,0,0,0,0,0,0,0,0,'',0),(117,186,0,0,0,0,0,0,0,0,'',0),(118,187,0,0,0,0,0,0,0,0,'',0),(119,188,0,0,0,0,0,0,0,0,'',0),(120,189,0,0,0,0,0,0,0,0,'',0),(121,190,0,0,0,0,0,0,0,0,'',0),(122,191,0,0,0,0,0,0,0,0,'',0),(123,192,0,0,0,0,0,0,0,0,'',0),(124,193,0,0,0,0,0,0,0,0,'',0),(125,195,0,0,0,0,0,0,0,0,'',0),(126,196,0,0,0,0,0,0,0,0,'',0),(127,197,23,1,4,5,6,7,3,1,'',23),(128,198,0,0,0,0,0,0,0,0,'',0),(129,199,0,0,0,0,0,0,0,0,'',0),(130,200,0,0,0,0,0,0,0,0,'',0),(131,201,0,0,0,0,0,0,0,0,'',0),(132,202,0,0,0,0,0,0,0,0,'',0),(133,203,0,0,0,0,0,0,0,0,'',0),(134,204,0,0,0,0,0,0,0,0,'',0),(135,205,0,0,0,0,0,0,0,0,'',0),(136,206,0,0,0,0,0,0,0,0,'',0),(137,207,0,0,0,0,0,0,0,0,'',0),(138,208,0,0,0,0,0,0,0,0,'',0),(139,210,0,0,0,0,0,0,0,0,'',0),(140,211,0,0,0,0,0,0,0,0,'',0),(141,212,0,0,0,0,0,0,0,0,'',0),(142,213,0,0,0,0,0,0,0,0,'',0),(143,214,0,0,0,0,0,0,0,0,'',0),(144,215,0,0,0,0,0,0,0,0,'',0),(145,216,0,0,0,0,0,0,0,0,'',0),(146,217,0,0,0,0,0,0,0,0,'',0),(147,218,0,0,0,0,0,0,0,0,'',0),(148,219,0,0,0,0,0,0,0,0,'',0),(149,220,0,0,0,0,0,0,0,0,'',0),(150,221,0,0,0,0,0,0,0,0,'',0),(151,222,0,0,0,0,0,0,0,0,'',0),(152,223,0,0,0,0,0,0,0,0,'',0),(153,224,0,0,0,0,0,0,0,0,'',0),(154,225,0,0,0,0,0,0,0,0,'',0),(155,226,0,0,0,0,0,0,0,0,'',0),(156,227,0,0,0,0,0,0,0,0,'',0),(157,228,0,0,0,0,0,0,0,0,'',0),(158,230,0,0,0,0,0,0,0,0,'',0),(159,231,0,0,0,0,0,0,0,0,'',0),(160,232,0,0,0,0,0,0,0,0,'',0),(161,233,0,0,0,0,0,0,0,0,'',0),(162,234,0,0,0,0,0,0,0,0,'',0),(163,235,0,0,0,0,0,0,0,0,'',0),(164,236,0,0,0,0,0,0,0,0,'',0),(165,237,0,0,0,0,0,0,0,0,'',0),(166,238,0,0,0,0,0,0,0,0,'',0),(167,239,0,0,0,0,0,0,0,0,'',0),(168,240,0,0,0,0,0,0,0,0,'',0),(169,241,0,0,0,0,0,0,0,0,'',0),(170,242,0,0,0,0,0,0,0,0,'',0),(171,243,0,0,0,0,0,0,0,0,'',0),(172,244,0,0,0,0,0,0,0,0,'',0),(173,245,0,0,0,0,0,0,0,0,'',0),(174,246,0,0,0,0,0,0,0,0,'',0),(175,247,0,0,0,0,0,0,0,0,'',0),(176,248,0,0,0,0,0,0,0,0,'',0),(177,249,0,0,0,0,0,0,0,0,'',0),(178,250,0,0,0,0,0,0,0,0,'',0),(179,251,0,0,0,0,0,0,0,0,'',0),(180,252,0,0,0,0,0,0,0,0,'',0),(181,253,0,0,0,0,0,0,0,0,'',0),(182,254,0,0,0,0,0,0,0,0,'',0),(183,255,0,0,0,0,0,0,0,0,'',0),(184,256,0,0,0,0,0,0,0,0,'',0),(185,257,0,0,0,0,0,0,0,0,'',0),(186,258,0,0,0,0,0,0,0,0,'',0),(187,259,0,0,0,0,0,0,0,0,'',0),(188,260,0,0,0,0,0,0,0,0,'',0),(189,261,0,0,0,0,0,0,0,0,'',0),(190,262,0,0,0,0,0,0,0,0,'',0),(191,263,0,0,0,0,0,0,0,0,'',0),(192,264,0,0,0,0,0,0,0,0,'',0),(193,265,0,0,0,0,0,0,0,0,'',0),(194,266,0,0,0,0,0,0,0,0,'',0),(195,267,0,0,0,0,0,0,0,0,'',0),(196,268,24,1,5,6,7,8,9,1,'',12),(197,269,0,0,0,0,0,0,0,0,'',0),(198,270,0,0,0,0,0,0,0,0,'',0),(199,271,0,0,0,0,0,0,0,0,'',0),(200,272,0,0,0,0,0,0,0,0,'',0),(201,273,0,0,0,0,0,0,0,0,'',0),(202,274,0,0,0,0,0,0,0,0,'',0),(203,275,0,0,0,0,0,0,0,0,'',0),(204,276,0,0,0,0,0,0,0,0,'',0),(205,277,0,0,0,0,0,0,0,0,'',0),(206,278,0,0,0,0,0,0,0,0,'',0),(207,279,0,0,0,0,0,0,0,0,'',0),(208,281,0,0,0,0,0,0,0,0,'',0),(209,282,0,0,0,0,0,0,0,0,'',0),(210,283,0,0,0,0,0,0,0,0,'',0),(211,284,0,0,0,0,0,0,0,0,'',0),(212,285,0,0,0,0,0,0,0,0,'',0),(213,286,0,0,0,0,0,0,0,0,'',0),(214,287,0,0,0,0,0,0,0,0,'',0),(215,288,0,0,0,0,0,0,0,0,'',0),(216,289,0,0,0,0,0,0,0,0,'',0),(217,291,23,1,4,5,2,1,1,2,'',45),(218,292,23,1,1,1,2,3,4,1,'',6),(219,293,0,0,0,0,0,0,0,0,'',0),(220,294,0,0,0,0,0,0,0,0,'',0),(221,295,0,0,0,0,0,0,0,0,'',0),(222,296,0,0,0,0,0,0,0,0,'',0),(223,297,4,1,23,4,5,6,7,2,'',9);
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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_fertilizer_application_info`
--

LOCK TABLES `season_long_fertilizer_application_info` WRITE;
/*!40000 ALTER TABLE `season_long_fertilizer_application_info` DISABLE KEYS */;
INSERT INTO `season_long_fertilizer_application_info` VALUES (34,65,'ammoniumPhosphate','2016-10-03 00:00:00',2,0,0,0,0,0,0),(35,65,'mop','2016-10-20 00:00:00',3,0,0,0,0,0,0),(36,65,'Name','2016-10-19 00:00:00',4,5,6,7,8,9,1),(66,66,'dap','2016-10-27 00:00:00',2,18,46,0,0,0,0),(67,66,'complete','2016-10-12 00:00:00',4,14,14,14,0,0,0),(68,67,'solophos','2016-10-03 00:00:00',1,0,18,0,0,0,0),(69,127,'dap','2016-10-03 00:00:00',2,18,46,0,0,0,0),(70,133,'urea','2016-09-27 00:00:00',2,46,0,0,0,0,0),(71,133,'2','2016-10-26 00:00:00',4,209,2,13,4,5,1),(97,130,'urea','2016-10-13 00:00:00',144,46,0,0,0,0,0),(98,130,'dap','2016-10-04 00:00:00',123,18,46,0,0,0,0),(99,130,'mop','2016-10-04 00:00:00',15,0,0,60,0,0,0),(100,130,'ammoniumSulphate','2016-10-17 00:00:00',16,21,0,0,0,0,0),(101,130,'complete','2016-09-28 00:00:00',18,14,14,14,0,0,0),(102,130,'solophos','2016-09-28 00:00:00',23,0,18,0,0,0,0),(103,130,'ABCDEF','2016-10-04 00:00:00',2,1,4,5,16,8,1),(104,165,'ammoniumSulphate','2016-11-15 00:00:00',2,21,0,0,0,0,0),(105,166,'ammoniumSulphate','2016-11-30 00:00:00',2,21,0,0,0,0,0),(106,168,'ammoniumSulphate','2016-10-31 00:00:00',23,21,0,0,0,0,0),(107,169,'ammoniumSulphate','2016-10-31 00:00:00',23,21,0,0,0,24,0),(108,178,'urea','2016-11-02 00:00:00',100,46,0,0,0,0,0),(109,178,'dap','2016-11-02 00:00:00',100,18,46,0,0,0,0),(110,178,'mop','2016-11-02 00:00:00',100,0,0,60,0,0,0),(111,178,'ammoniumSulphate','2016-11-02 00:00:00',100,21,0,0,0,24,0),(112,178,'complete','2016-11-02 00:00:00',100,14,14,14,0,0,0),(113,178,'solophos','2016-11-02 00:00:00',100,0,18,0,0,0,0),(114,179,'Urea 1','2016-11-08 00:00:00',100,46,0,0,0,0,1),(115,196,'mop','2016-10-30 00:00:00',23,0,0,60,0,0,0),(116,217,'urea','2016-11-08 00:00:00',2,46,0,0,0,0,0),(117,217,'ammoniumSulphate','2016-11-16 00:00:00',4,21,0,0,0,24,0),(118,217,'solophos','2016-11-10 00:00:00',5,0,18,0,0,0,0),(119,217,'complete','2016-10-30 00:00:00',6,14,14,14,0,0,0),(120,217,'mop','2016-11-02 00:00:00',7,0,0,60,0,0,0),(121,217,'dap','2016-11-05 00:00:00',8,18,46,0,0,0,0),(122,223,'urea','2016-11-16 00:00:00',23,46,0,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_food_safety`
--

LOCK TABLES `season_long_food_safety` WRITE;
/*!40000 ALTER TABLE `season_long_food_safety` DISABLE KEYS */;
INSERT INTO `season_long_food_safety` VALUES (22,124,1,'2','3'),(23,123,0,'',''),(24,127,1,'2','3'),(25,128,1,'23','44'),(26,173,1,'',''),(27,174,1,'2','3'),(28,171,1,'2','3'),(29,172,1,'',''),(30,194,0,'',''),(31,209,0,'',''),(32,229,0,'',''),(33,280,0,'',''),(34,290,1,'2',''),(35,298,1,'2','3');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_food_security`
--

LOCK TABLES `season_long_food_security` WRITE;
/*!40000 ALTER TABLE `season_long_food_security` DISABLE KEYS */;
INSERT INTO `season_long_food_security` VALUES (17,124,2,3,4,5,6,7,1,8,1,2,3,12,11),(18,123,0,0,0,0,0,0,0,0,0,0,0,0,0),(19,127,23,4,5,6,1,2,1,245,2,13,1,12,13),(20,128,4,5,6,7,8,9,1,2,3,4,5,6,1),(21,173,0,0,0,0,0,0,0,0,0,0,0,0,0),(22,174,0,0,0,0,0,0,0,0,0,0,0,0,0),(23,171,0,0,0,0,0,0,0,0,0,0,0,0,0),(24,172,0,0,0,0,0,0,0,0,0,0,0,0,0),(25,194,0,0,0,0,0,0,0,0,0,0,0,0,0),(26,209,0,0,0,0,0,0,0,0,0,0,0,0,0),(27,229,0,0,0,0,0,0,0,0,0,0,0,0,0),(28,280,0,0,0,0,0,0,0,0,0,0,0,0,0),(29,290,5,0,0,0,0,0,0,0,0,0,0,0,0),(30,298,23,4,5,6,7,8,1,2,3,4,5,6,123);
/*!40000 ALTER TABLE `season_long_food_security` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_grain_and_straw_yield`
--

LOCK TABLES `season_long_grain_and_straw_yield` WRITE;
/*!40000 ALTER TABLE `season_long_grain_and_straw_yield` DISABLE KEYS */;
INSERT INTO `season_long_grain_and_straw_yield` VALUES (33,228,145,0,0,0,0,0,0,0,0),(34,236,6500,6500,0,0,0,0,21,0,0),(35,258,0,0,0,0,0,0,0,0,2),(36,265,0,0,0,0,0,0,4911,0,2),(37,279,0,0,0,0,0,0,0,0,0),(38,289,1,0,0,0,0,0,0,0,0),(39,297,23,4,5,1,67,0,2,3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_harvesting_threshing`
--

LOCK TABLES `season_long_harvesting_threshing` WRITE;
/*!40000 ALTER TABLE `season_long_harvesting_threshing` DISABLE KEYS */;
INSERT INTO `season_long_harvesting_threshing` VALUES (26,123,1,'2016-10-21 00:00:00',2,3,4,5,2,11,22,5,6,0,0,3,123,4,3,2,1,0,'0000-00-00 00:00:00',0,0,0,0,0,'0000-00-00 00:00:00','',0,0,0,0,5,0,24,0),(27,127,2,'2016-10-11 00:00:00',0,0,0,0,2,5,6,7,8,0,0,0,4,2,3,4,5,0,'2016-08-10 00:00:00',0,0,0,0,0,'0000-00-00 00:00:00','',0,0,0,0,2,0,11,0),(28,168,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,0,0,'0000-00-00 00:00:00','',0,0,0,0,0,0,0,0),(29,265,2,'2016-10-20 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2016-10-20 00:00:00',0,0,0,0,0,'0000-00-00 00:00:00','',0,0,0,0,0,0,0,0),(30,274,3,'2016-11-01 00:00:00',0,0,0,0,2,1,2,3,4,0,0,0,0,0,0,0,0,24,'2016-10-31 00:00:00',23,4,6,7,8,'0000-00-00 00:00:00','',0,0,0,0,1,0,0,5),(31,279,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,0,0,'0000-00-00 00:00:00','',0,0,0,0,0,0,0,0),(32,297,1,'2016-11-02 00:00:00',3,4,5,6,1,2,3,4,5,1,2,1,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,0,0,'0000-00-00 00:00:00','',0,0,0,0,2,0,23,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_irrigation`
--

LOCK TABLES `season_long_irrigation` WRITE;
/*!40000 ALTER TABLE `season_long_irrigation` DISABLE KEYS */;
INSERT INTO `season_long_irrigation` VALUES (15,121,2,1,1,4,2,3,4,5,5,0,7,2,1,2,3,4,5,0),(16,122,2,2,1,2,3,4,5,6,7,0,8,2,2,3,4,5,6,0),(17,125,3,2,2,2,3,4,5,6,0,7,8,2,2,3,4,5,6,2),(18,126,2,1,1,2,1,5,6,7,8,0,1,2,2,3,4,5,6,0),(19,130,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,123),(20,142,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21,143,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(22,144,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(23,145,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(24,146,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(25,147,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2),(26,148,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2),(27,151,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2),(28,155,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2),(29,156,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(30,161,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2),(31,162,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24),(32,168,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(33,158,1,1,2,0,0,0,0,0,0,0,0,2,0,0,0,0,0,24),(34,157,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(35,182,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(36,197,2,1,0,0,0,0,0,0,0,0,4,2,2,3,4,5,6,2),(37,199,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(38,204,0,1,0,0,0,0,0,0,0,0,0,1,1,2,3,4,5,1),(39,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(40,248,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(41,252,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2),(42,253,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4),(43,254,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(44,268,2,1,0,0,0,0,0,0,0,0,56,1,2,3,45,1,2,2),(45,269,2,5,0,0,0,0,0,0,0,0,0,2,24,5,0,0,0,24),(46,279,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(47,281,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5),(48,282,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(49,283,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(50,291,2,1,0,0,0,0,0,0,0,0,5,1,2,3,4,5,5,2),(51,292,1,1,0,0,0,0,0,0,0,0,5,1,1,1,1,1,1,0),(52,297,1,1,0,0,0,0,0,0,0,0,56,1,23,4,5,6,7,0),(53,222,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_irrigation_period`
--

LOCK TABLES `season_long_irrigation_period` WRITE;
/*!40000 ALTER TABLE `season_long_irrigation_period` DISABLE KEYS */;
INSERT INTO `season_long_irrigation_period` VALUES (33,15,'2016-11-01 00:00:00',1,3,2,'1'),(72,16,'2016-10-03 00:00:00',1,3,2,'2'),(73,16,'2016-10-04 00:00:00',0,4,0,'3'),(103,17,'2016-10-19 00:00:00',1,3,2,'2'),(104,17,'2016-10-18 00:00:00',0,4,0,'3'),(105,18,'2016-10-04 00:00:00',1,3,2,'2'),(109,33,'2016-10-05 00:00:00',1,1,23,'2'),(110,36,'2016-10-04 00:00:00',1,0,2,'1'),(113,42,'2016-11-01 00:00:00',1,2,3,'1'),(115,43,'2016-11-07 00:00:00',1,3,2,'1'),(119,41,'2016-11-01 00:00:00',0,2,0,'1'),(120,44,'2016-11-01 00:00:00',1,4,23,'1'),(121,50,'2016-11-29 00:00:00',1,4,2,'1'),(122,51,'2016-11-11 00:00:00',1,0,2,'1'),(123,52,'2016-10-31 00:00:00',1,4,23,'1');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_land_preparation`
--

LOCK TABLES `season_long_land_preparation` WRITE;
/*!40000 ALTER TABLE `season_long_land_preparation` DISABLE KEYS */;
INSERT INTO `season_long_land_preparation` VALUES (45,121,2,'2016-10-02 16:00:00',2,2,3,4,5,6,7,8,9),(46,125,2,'2016-10-25 00:00:00',2,2,2,3,4,5,6,7,8),(47,129,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0),(48,140,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0),(49,149,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0),(50,157,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0),(51,175,1,'2016-09-27 00:00:00',0,0,0,0,0,0,0,0,0),(52,182,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0),(53,195,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0),(54,197,1,'2016-10-10 00:00:00',0,2,2,3,4,5,6,7,8),(55,199,1,'2016-10-04 00:00:00',0,0,0,0,0,0,0,0,0),(56,210,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0),(57,222,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0),(58,230,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0),(59,237,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0),(60,244,1,'2016-11-09 00:00:00',0,0,0,0,0,0,0,0,0),(61,249,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0),(62,252,1,'2016-11-14 00:00:00',0,0,0,0,0,0,0,0,0),(63,259,1,'2016-06-01 00:00:00',0,0,0,0,0,0,0,0,0),(64,266,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0),(65,268,1,'2016-11-01 00:00:00',23,2,24,24,56,13,155,23,11),(66,281,1,'2016-10-30 00:00:00',0,0,0,0,0,0,0,0,0),(67,283,1,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0),(68,291,1,'2016-11-15 00:00:00',23,1,2,3,4,5,6,7,8);
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
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_land_preparation_operations`
--

LOCK TABLES `season_long_land_preparation_operations` WRITE;
/*!40000 ALTER TABLE `season_long_land_preparation_operations` DISABLE KEYS */;
INSERT INTO `season_long_land_preparation_operations` VALUES (69,45,1,'2016-10-07 16:00:00',1,0,0,1),(70,45,2,'2016-10-09 16:00:00',2,2,3,2),(97,46,1,'2016-10-10 00:00:00',2,4,5,3),(98,46,2,'2016-10-11 00:00:00',3,2,3,2),(99,47,0,'0000-00-00 00:00:00',0,0,0,0),(100,48,0,'0000-00-00 00:00:00',0,0,0,0),(101,49,0,'0000-00-00 00:00:00',0,0,0,0),(103,50,0,'0000-00-00 00:00:00',0,0,0,0),(104,51,0,'0000-00-00 00:00:00',0,0,0,0),(106,52,0,'0000-00-00 00:00:00',0,0,0,0),(107,53,0,'0000-00-00 00:00:00',0,0,0,0),(108,54,1,'2016-10-09 00:00:00',1,0,0,0),(112,55,0,'0000-00-00 00:00:00',0,0,0,0),(113,56,0,'0000-00-00 00:00:00',0,0,0,0),(115,58,0,'0000-00-00 00:00:00',0,0,0,0),(116,59,0,'0000-00-00 00:00:00',0,0,0,0),(117,60,0,'0000-00-00 00:00:00',0,0,0,0),(118,61,0,'0000-00-00 00:00:00',0,0,0,0),(123,62,0,'0000-00-00 00:00:00',0,0,0,0),(124,63,0,'0000-00-00 00:00:00',0,0,0,0),(125,64,0,'0000-00-00 00:00:00',0,0,0,0),(126,65,1,'2016-11-22 00:00:00',1,0,0,1),(133,66,0,'0000-00-00 00:00:00',0,0,0,0),(136,67,0,'0000-00-00 00:00:00',0,0,0,0),(137,68,1,'2016-11-15 00:00:00',1,0,0,1),(139,57,0,'0000-00-00 00:00:00',0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pesticide_application`
--

LOCK TABLES `season_long_pesticide_application` WRITE;
/*!40000 ALTER TABLE `season_long_pesticide_application` DISABLE KEYS */;
INSERT INTO `season_long_pesticide_application` VALUES (75,200,0,'0',0,0,0,0,0,0,0,0,0,0),(76,201,0,'0',0,0,0,0,0,0,0,0,0,0),(77,202,0,'0',0,0,0,0,0,0,0,0,0,0),(78,203,0,'0',0,0,0,0,0,0,0,0,0,0),(79,204,0,'0',0,0,0,0,0,0,0,0,0,0),(80,205,0,'0',0,0,0,0,0,0,0,0,0,0),(81,206,0,'0',0,0,0,0,0,0,0,0,0,0),(82,207,0,'0',0,0,0,0,0,0,0,0,0,0),(83,208,0,'0',0,0,0,0,0,0,0,0,0,0),(84,211,0,'0',0,0,0,0,0,0,0,0,0,0),(85,212,0,'0',0,0,0,0,0,0,0,0,0,0),(86,213,0,'0',0,0,0,0,0,0,0,0,0,0),(87,214,0,'0',0,0,0,0,0,0,0,0,0,0),(88,215,0,'0',0,0,0,0,0,0,0,0,0,0),(89,216,0,'0',0,0,0,0,0,0,0,0,0,0),(90,217,0,'0',0,0,0,0,0,0,0,0,0,0),(91,218,0,'0',0,0,0,0,0,0,0,0,0,0),(92,219,0,'0',0,0,0,0,0,0,0,0,0,0),(93,220,0,'0',0,0,0,0,0,0,0,0,0,0),(94,221,0,'0',0,0,0,0,0,0,0,0,0,0),(95,223,0,'0',0,0,0,0,0,0,0,0,0,0),(96,224,0,'0',0,0,0,0,0,0,0,0,0,0),(97,225,0,'0',0,0,0,0,0,0,0,0,0,0),(98,226,0,'0',0,0,0,0,0,0,0,0,0,0),(99,227,0,'0',0,0,0,0,0,0,0,0,0,0),(100,228,0,'0',0,0,0,0,0,0,0,0,0,0),(101,231,0,'0',0,0,0,0,0,0,0,0,0,0),(102,232,0,'0',0,0,0,0,0,0,0,0,0,0),(103,233,0,'0',0,0,0,0,0,0,0,0,0,0),(104,234,0,'0',0,0,0,0,0,0,0,0,0,0),(105,235,0,'0',0,0,0,0,0,0,0,0,0,0),(106,236,0,'0',0,0,0,0,0,0,0,0,0,0),(107,238,0,'0',0,0,0,0,0,0,0,0,0,0),(108,239,0,'0',0,0,0,0,0,0,0,0,0,0),(109,240,0,'0',0,0,0,0,0,0,0,0,0,0),(110,241,0,'0',0,0,0,0,0,0,0,0,0,0),(111,242,0,'0',0,0,0,0,0,0,0,0,0,0),(112,243,0,'0',0,0,0,0,0,0,0,0,0,0),(113,245,0,'0',0,0,0,0,0,0,0,0,0,0),(114,246,0,'0',0,0,0,0,0,0,0,0,0,0),(115,247,0,'0',0,0,0,0,0,0,0,0,0,0),(116,248,0,'0',0,0,0,0,0,0,0,0,0,0),(117,250,0,'0',0,0,0,0,0,0,0,0,0,0),(118,251,0,'0',0,0,0,0,0,0,0,0,0,0),(119,253,0,'0',0,0,0,0,0,0,0,0,0,0),(120,254,0,'0',0,0,0,0,0,0,0,0,0,0),(121,255,0,'0',0,0,0,0,0,0,0,0,0,0),(122,256,0,'0',0,0,0,0,0,0,0,0,0,0),(123,257,0,'0',0,0,0,0,0,0,0,0,0,0),(124,258,0,'0',0,0,0,0,0,0,0,0,0,0),(125,260,0,'0',0,0,0,0,0,0,0,0,0,0),(126,261,0,'0',0,0,0,0,0,0,0,0,0,0),(127,262,0,'0',0,0,0,0,0,0,0,0,0,0),(128,263,0,'0',0,0,0,0,0,0,0,0,0,0),(129,264,0,'0',0,0,0,0,0,0,0,0,0,0),(130,265,0,'0',0,0,0,0,0,0,0,0,0,0),(131,267,0,'0',0,0,0,0,0,0,0,0,0,0),(132,269,0,'0',0,0,0,0,0,0,0,0,0,0),(133,270,0,'0',0,0,0,0,0,0,0,0,0,0),(134,271,0,'0',0,0,0,0,0,0,0,0,0,0),(135,272,0,'0',0,0,0,0,0,0,0,0,0,0),(136,273,0,'0',0,0,0,0,0,0,0,0,0,0),(137,274,1,'0',1,1,2,0,1,25,5,6,7,8),(138,275,0,'0',0,0,0,0,0,0,0,0,0,0),(139,276,0,'0',0,0,0,0,0,0,0,0,0,0),(140,277,0,'0',0,0,0,0,0,0,0,0,0,0),(141,278,0,'0',0,0,0,0,0,0,0,0,0,0),(142,279,0,'0',0,0,0,0,0,0,0,0,0,0),(143,282,0,'0',0,0,0,0,0,0,0,0,0,0),(144,284,0,'0',0,0,0,0,0,0,0,0,0,0),(145,285,0,'0',0,0,0,0,0,0,0,0,0,0),(146,286,0,'0',0,0,0,0,0,0,0,0,0,0),(147,287,0,'0',0,0,0,0,0,0,0,0,0,0),(148,288,0,'0',0,0,0,0,0,0,0,0,0,0),(149,289,0,'0',0,0,0,0,0,0,0,0,0,0),(150,292,1,'0',0,1,3,23,1,2,3,4,5,6),(151,293,0,'0',0,0,0,0,0,0,0,0,0,0),(152,294,0,'0',0,0,0,0,0,0,0,0,0,0),(153,295,0,'0',0,0,0,0,0,0,0,0,0,0),(154,296,0,'0',0,0,0,0,0,0,0,0,0,0),(155,297,1,'0',0,1,3,2,1,23,4,5,6,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pesticide_equipment`
--

LOCK TABLES `season_long_pesticide_equipment` WRITE;
/*!40000 ALTER TABLE `season_long_pesticide_equipment` DISABLE KEYS */;
INSERT INTO `season_long_pesticide_equipment` VALUES (42,19,1),(43,19,2),(44,19,3),(48,20,2),(49,137,0),(50,150,0),(51,155,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pesticide_rice_problems_detail`
--

LOCK TABLES `season_long_pesticide_rice_problems_detail` WRITE;
/*!40000 ALTER TABLE `season_long_pesticide_rice_problems_detail` DISABLE KEYS */;
INSERT INTO `season_long_pesticide_rice_problems_detail` VALUES (52,116,'insect','2016-10-31 00:00:00',23,5,1,'3',0),(53,116,'ABC','2016-11-24 00:00:00',4,6,3,'3',1),(54,137,'insect','2016-11-14 00:00:00',2,3,2,'2',0),(55,150,'insect','2016-11-14 00:00:00',2,3,1,'1',0),(56,155,'insect','2016-11-01 00:00:00',2,3,1,'1',0);
/*!40000 ALTER TABLE `season_long_pesticide_rice_problems_detail` ENABLE KEYS */;
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
  `rice_area` int(11) NOT NULL,
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
  PRIMARY KEY (`id`),
  KEY `index2` (`season_long_id`),
  KEY `index3` (`rice_area`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pre_planting_information`
--

LOCK TABLES `season_long_pre_planting_information` WRITE;
/*!40000 ALTER TABLE `season_long_pre_planting_information` DISABLE KEYS */;
INSERT INTO `season_long_pre_planting_information` VALUES (33,199,1,0,'',2,'3','2016-10-02 00:00:00','3',0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',1,2,5,0,0,NULL,0,0),(34,230,1,0,'0',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,NULL,0,0,0,0,0,NULL,0,0),(35,237,1,0,'0',0,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,NULL,0,0,0,0,0,NULL,0,0),(36,244,1,0,'',0,'','0000-00-00 00:00:00','',0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',0,0,0,0,0,NULL,0,0),(37,249,1,0,'',0,'','0000-00-00 00:00:00','',0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',0,0,0,0,0,NULL,0,0),(38,252,0,0,'',0,'','0000-00-00 00:00:00','',0,0,0,'0000-00-00 00:00:00',0,3,'',0,'',0,0,0,4911,0,NULL,0,0),(39,259,1,0,'',0,'','0000-00-00 00:00:00','',0,0,0,'0000-00-00 00:00:00',0,2,'',0,'',0,0,0,9,0,NULL,0,0),(40,268,1,1,'AWD',1,'Cropping','0000-00-00 00:00:00','1',1,2,1,'2016-10-31 00:00:00',23,2,'Variety',24,'',1,234114,2015,21,0,NULL,0,0),(41,281,0,0,'',2,'','0000-00-00 00:00:00','3',0,0,1,'2016-10-31 00:00:00',0,0,'',0,'',0,0,0,0,0,NULL,0,0),(42,283,1,0,'',1,'','0000-00-00 00:00:00','3',0,0,1,'2016-10-01 00:00:00',0,0,'',0,'',0,0,5000,0,0,NULL,0,0),(43,291,1,1,'AWD',1,'1','2016-11-15 00:00:00','3',4,3,1,'2016-11-16 00:00:00',3,2,'24',5,'',1,234,14,56,0,NULL,0,0),(44,222,0,0,'',0,'','0000-00-00 00:00:00','',0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',0,0,0,0,3,'Other',2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pre_planting_information_organic_materials`
--

LOCK TABLES `season_long_pre_planting_information_organic_materials` WRITE;
/*!40000 ALTER TABLE `season_long_pre_planting_information_organic_materials` DISABLE KEYS */;
INSERT INTO `season_long_pre_planting_information_organic_materials` VALUES (96,26,'Compost',23),(113,27,'Compost',2),(114,27,'Previous crop\'s straw',6),(115,27,'FYM',5),(116,27,'Green manure',3),(117,30,'Previous crop\'s straw',123),(118,30,'FYM',44),(119,32,'Previous crop\'s straw',2),(120,40,'Compost',123),(121,40,'FYM',155),(125,41,'Compost',1500),(126,41,'FYM',1000),(127,41,'Green manure',1000),(134,42,'Compost',1500),(135,42,'Green manure',1000),(136,42,'FYM',1000),(137,43,'Previous crop\'s straw',0),(138,43,'Compost',23),(139,43,'FYM',4),(140,43,'Green manure',566);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_sowing_transplanting`
--

LOCK TABLES `season_long_sowing_transplanting` WRITE;
/*!40000 ALTER TABLE `season_long_sowing_transplanting` DISABLE KEYS */;
INSERT INTO `season_long_sowing_transplanting` VALUES (8,121,0,'0000-00-00 00:00:00',0,2,3,4,5,6,7,8,9,1,0,2,0,0,0,0,0,'2016-10-10 16:00:00','2016-10-10 00:00:00',0,0,0,0,0,23,1,0,4,0,0,0,0,0,2,6,1,2,3,4,23),(9,125,0,'0000-00-00 00:00:00',0,2,2,3,4,5,6,7,8,2,1,2,0,0,0,0,0,'2016-10-13 00:00:00','2016-05-25 00:00:00',0,0,1,2,2,23,1,0,4,0,0,0,0,0,2,2,3,5,6,7,2),(10,157,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(11,182,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(12,197,1,'2016-10-18 00:00:00',3,2,2,4,5,6,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0),(13,199,1,'2016-10-11 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(14,244,1,'2016-11-07 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(15,252,0,'2016-11-02 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(16,259,1,'2016-06-01 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(17,268,2,'2016-11-08 00:00:00',23,1,1,2,3,4,6,8,9,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0),(18,281,1,'2016-10-30 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(19,283,0,'2016-10-30 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(20,291,1,'2016-11-08 00:00:00',23,1,4,5,6,7,9,0,123,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0),(21,222,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_weeding_herbicide`
--

LOCK TABLES `season_long_weeding_herbicide` WRITE;
/*!40000 ALTER TABLE `season_long_weeding_herbicide` DISABLE KEYS */;
INSERT INTO `season_long_weeding_herbicide` VALUES (13,122,3,'2016-10-05 00:00:00',4,2,2,3,1,5,4,6,2,1,4,2,3,4,5,6,1,2),(14,126,3,'2016-10-19 00:00:00',2,2,4,5,6,7,8,9,2,1,2,2,3,4,5,6,0,12),(15,142,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(16,143,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(17,144,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(18,145,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(19,146,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(20,147,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(21,148,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(22,155,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(23,156,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(24,168,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(25,158,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(26,200,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(27,248,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(28,254,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(29,279,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(30,292,1,'2016-10-30 00:00:00',3,1,4,5,6,7,8,9,0,0,0,0,0,0,0,0,0,1),(31,297,2,'2016-11-07 00:00:00',0,0,0,0,0,0,0,0,1,1,5,2,3,4,5,6,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_weeding_herbicide_application`
--

LOCK TABLES `season_long_weeding_herbicide_application` WRITE;
/*!40000 ALTER TABLE `season_long_weeding_herbicide_application` DISABLE KEYS */;
INSERT INTO `season_long_weeding_herbicide_application` VALUES (45,13,'2016-10-25 00:00:00','AASD','2','2',3,4,4),(47,14,'2016-10-11 00:00:00','2','3','4',5,6,1),(48,31,'2016-11-16 00:00:00','ABC','DEF','2',3,4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_weeding_herbicide_weeds`
--

LOCK TABLES `season_long_weeding_herbicide_weeds` WRITE;
/*!40000 ALTER TABLE `season_long_weeding_herbicide_weeds` DISABLE KEYS */;
INSERT INTO `season_long_weeding_herbicide_weeds` VALUES (171,13,'Weed 1'),(172,13,'Weed 2'),(173,13,'Weed 23'),(174,13,'Weed 4'),(175,13,'Weed 5'),(176,31,'1'),(177,31,'2'),(178,31,'3'),(179,31,'4'),(180,31,'5');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_women_empowerment`
--

LOCK TABLES `season_long_women_empowerment` WRITE;
/*!40000 ALTER TABLE `season_long_women_empowerment` DISABLE KEYS */;
INSERT INTO `season_long_women_empowerment` VALUES (12,124,3,2,2,2,2,3,2,3,1,2),(13,123,0,0,0,0,0,0,0,0,0,0),(14,127,3,3,3,3,2,3,2,3,2,2),(15,128,2,2,3,1,2,3,2,2,3,1),(16,173,0,0,0,0,0,0,0,0,0,0),(17,174,0,0,0,0,0,0,0,0,0,0),(18,171,0,0,0,0,0,0,0,0,0,0),(19,172,0,0,0,0,0,0,0,0,0,0),(20,194,0,0,0,0,0,0,0,0,0,0),(21,209,0,0,0,0,0,0,0,0,0,0),(22,229,0,0,0,0,0,0,0,0,0,0),(23,280,0,0,0,0,0,0,0,0,0,0),(24,290,0,0,0,0,0,0,0,0,0,0),(25,298,2,2,3,3,3,3,2,2,2,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_workers_health_safety`
--

LOCK TABLES `season_long_workers_health_safety` WRITE;
/*!40000 ALTER TABLE `season_long_workers_health_safety` DISABLE KEYS */;
INSERT INTO `season_long_workers_health_safety` VALUES (23,124,2,2,3,3,3,1,2,2,2,6),(24,123,0,0,0,0,0,0,0,0,0,0),(25,127,1,3,1,1,2,2,1,3,2,2),(26,128,2,2,3,2,1,2,2,3,1,3),(27,173,0,0,0,0,0,0,0,0,0,0),(28,174,0,0,0,0,0,0,0,0,0,0),(29,171,0,1,3,0,0,0,0,0,0,0),(30,172,0,0,0,0,0,0,0,0,0,0),(31,194,0,0,0,0,0,0,0,0,0,0),(32,209,0,0,0,0,0,0,0,0,0,0),(33,229,0,0,0,0,0,0,0,0,0,0),(34,280,0,0,0,0,0,0,0,0,0,0),(35,290,0,0,0,0,0,0,0,0,0,0),(36,298,1,1,3,3,4,4,2,3,3,3);
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
  `data` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('2q3ltl2oris5flhrbbh0sgq9m1',1474259412,''),('5bmaugq9f2qhh94g3b9fp4ged7',1473608868,''),('5e5ugtoq8dvv2mmraq479u8b14',1471104889,''),('5kn1k5vvdaonfvimvqkmi450j4',1470668024,''),('84l4bb5fdgvn3gqk6rpc9hr5s6',1471972987,''),('88faqn9faap5kab6er1eodgtg7',1471873814,''),('dr882117g4defa6p77uh99lkb7',1470578927,''),('e4u0lfdknutkm4qbp3hu754ct7',1471758999,''),('efh9pithgin6m1i797fm5ni861',1471540482,''),('f64b499toukebaf56p2md0ccp1',1470493429,''),('o77jngfm8neqigoglnfvrs6443',1473572804,''),('qe9vrlal9sb3vsj0a3kj1a8ii0',1473610854,''),('s0bl3b0504qq47s4oins3f2m33',1474171183,''),('ssb6dirq00puktl6b5h1htvje2',1473574018,''),('vhhb46pt78pc9j9io2nch3te91',1478412304,'');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villages`
--

LOCK TABLES `villages` WRITE;
/*!40000 ALTER TABLE `villages` DISABLE KEYS */;
INSERT INTO `villages` VALUES (2,2,'Makati',0),(3,3,'Village of US',0),(4,4,'5',0),(5,5,'Village',0),(6,6,'5',0),(7,7,'166',0),(8,8,'5',0),(9,9,'5',0),(10,10,'5',0),(11,11,'14',0),(12,12,'6',0),(13,13,'5',0),(14,14,'4',0),(15,15,'6',0);
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

-- Dump completed on 2016-11-07  4:35:57
