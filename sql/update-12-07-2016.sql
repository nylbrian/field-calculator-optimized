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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district_municipalities`
--

LOCK TABLES `district_municipalities` WRITE;
/*!40000 ALTER TABLE `district_municipalities` DISABLE KEYS */;
INSERT INTO `district_municipalities` VALUES (2,'12',168,1,NULL),(3,'District of US',169,1,NULL),(4,'4',170,1,NULL),(5,'Town',171,1,NULL),(6,'4',172,1,NULL),(7,'155',173,1,NULL),(8,'4',174,1,NULL),(9,'4',175,1,NULL),(10,'Tawi Tawi',176,1,NULL),(11,'23',177,1,NULL),(12,'5',178,1,NULL),(13,'4',179,1,NULL),(14,'3',180,1,NULL),(15,'5',181,1,NULL),(16,'2',182,1,NULL),(17,'3',183,1,NULL),(18,'55',184,1,NULL),(19,'14',185,1,NULL),(20,'7',186,1,NULL),(21,'3',187,1,NULL),(22,'2',188,1,NULL),(23,'AA',189,1,NULL),(24,'District',190,1,NULL),(25,'444',191,1,NULL),(26,'2',192,1,NULL),(27,'3',193,1,NULL),(28,'3',194,1,NULL),(29,'3',195,1,NULL),(30,'8',196,1,NULL),(31,'2',197,1,NULL),(32,'2',198,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer_seasons`
--

LOCK TABLES `farmer_seasons` WRITE;
/*!40000 ALTER TABLE `farmer_seasons` DISABLE KEYS */;
INSERT INTO `farmer_seasons` VALUES (39,62,1,2016,'2016-03-27 00:00:00',0,0),(40,63,1,2016,'2016-05-01 00:00:00',0,0),(41,64,1,2016,'2016-05-29 00:00:00',0,0),(42,62,2,2016,'2016-11-27 00:00:00',0,0),(43,62,1,2016,'2016-11-28 00:00:00',0,0),(44,65,1,2016,'2016-06-26 00:00:00',0,0),(45,66,1,2016,'2016-06-26 00:00:00',0,0),(46,67,1,2016,'2016-06-26 00:00:00',0,0),(47,68,1,2016,'2016-06-26 00:00:00',0,0),(48,69,1,2016,'2016-06-26 00:00:00',0,0),(49,70,1,2016,'2016-06-26 00:00:00',0,0),(50,71,1,2016,'2016-08-28 00:00:00',0,0);
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
  PRIMARY KEY (`id`),
  KEY `index2` (`countries_id`),
  KEY `index3` (`region_provinces_id`),
  KEY `index4` (`province_districts_id`),
  KEY `index5` (`district_municipalities_id`),
  KEY `index6` (`villages_id`),
  KEY `index7` (`first_name`),
  KEY `index8` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1429 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmers`
--

LOCK TABLES `farmers` WRITE;
/*!40000 ALTER TABLE `farmers` DISABLE KEYS */;
INSERT INTO `farmers` VALUES (62,'Vietnam Farmer','One',14,39,190,24,24,NULL,NULL,0,0,0),(63,'Vietnam Farmer','Two',14,39,191,25,25,NULL,NULL,0,0,0),(64,'Vietnam Farmer','Three',14,39,182,16,16,NULL,NULL,0,0,0),(65,'Vietnam Farmer','Four',14,41,192,26,26,NULL,NULL,0,0,0),(66,'Vietnam Farmer','Five',14,44,193,27,27,NULL,NULL,0,0,0),(67,'Vietnam Farmer','Six',14,40,194,28,28,NULL,NULL,0,0,0),(68,'Vietnam Farmer','Seven',14,46,195,29,29,NULL,NULL,0,0,0),(69,'Vietnam Farmer','Eight',14,42,196,30,30,NULL,NULL,0,0,0),(70,'Vietnam Farmer','Nine',14,44,197,31,31,NULL,NULL,0,0,0),(71,'Vietnam Farmer','Ten',14,42,198,32,32,NULL,NULL,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province_districts`
--

LOCK TABLES `province_districts` WRITE;
/*!40000 ALTER TABLE `province_districts` DISABLE KEYS */;
INSERT INTO `province_districts` VALUES (1,1,'Chiang Mai',1,0,0),(2,1,'Chiang Rai',1,0,0),(3,1,'Lampang',1,0,0),(4,1,'Lamphun',1,0,0),(5,1,'Mae Hong Son',1,0,0),(6,1,'Nan',1,0,0),(7,1,'Phayao',1,0,0),(8,1,'Phrae',1,0,0),(9,1,'Uttaradit',1,0,0),(10,1,'Tak',1,0,0),(11,1,'Sukhothai',1,0,0),(12,1,'Phitsanulok',1,0,0),(13,1,'Phichit',1,0,0),(14,1,'Kamphaeng Phet',1,0,0),(15,1,'Phetchabun',1,0,0),(16,1,'Nakhon Sawan',1,0,0),(17,1,'Uthai Thani',1,0,0),(18,2,'Amnat Charoen',1,0,0),(19,2,'Bueng Kan',1,0,0),(20,2,'Buri Ram',1,0,0),(21,2,'Chaiyaphum',1,0,0),(22,2,'Kalasin',1,0,0),(23,2,'Khon Kaen',1,0,0),(24,2,'Loei',1,0,0),(25,2,'Maha Sarakham',1,0,0),(26,2,'Mukdahan',1,0,0),(27,2,'Nakhon Phanom',1,0,0),(28,2,'Nakhon Ratchasima',1,0,0),(29,2,'Nong Bua Lamphu',1,0,0),(30,2,'Nong Khai',1,0,0),(31,2,'Roi Et',1,0,0),(32,2,'Sakon Nakhon',1,0,0),(33,2,'Si Sa Ket',1,0,0),(34,2,'Surin',1,0,0),(35,2,'Ubon Ratchathani',1,0,0),(36,2,'Udon Thani',1,0,0),(37,2,'Yasothon',1,0,0),(38,3,'Ang Thong',1,0,0),(39,3,'Chainat',1,0,0),(40,3,'Phra Nakhon Si Ayutthaya',1,0,0),(41,3,'Bangkok',1,0,0),(42,3,'Lop Buri',1,0,0),(43,3,'Nakhon Pathom',1,0,0),(44,3,'Nonthaburi',1,0,0),(45,3,'Pathum Thani',1,0,0),(46,3,'Samut Prakan',1,0,0),(47,3,'Samut Sakhon',1,0,0),(48,3,'Samut Songkhram',1,0,0),(49,3,'Saraburi',1,0,0),(50,3,'Sing Buri',1,0,0),(51,3,'Suphan Buri',1,0,0),(52,3,'Nakhon Nayok',1,0,0),(53,3,'Chachoengsao',1,0,0),(54,3,'Chanthaburi',1,0,0),(55,3,'Chon Buri',1,0,0),(56,3,'Prachin Buri',1,0,0),(57,3,'Rayong',1,0,0),(58,3,'Sa Kaeo',1,0,0),(59,3,'Trat',1,0,0),(60,3,'Kanchanaburi',1,0,0),(61,3,'Ratchaburi',1,0,0),(62,3,'Phetchaburi',1,0,0),(63,3,'Prachuap Khiri Khan',1,0,0),(64,4,'Chumphon',1,0,0),(65,4,'Nakhon Si Thammarat',1,0,0),(66,4,'Narathiwat',1,0,0),(67,4,'Pattani',1,0,0),(68,4,'Phatthalung',1,0,0),(69,4,'Songkhla',1,0,0),(70,4,'Surat Thani',1,0,0),(71,4,'Yala',1,0,0),(72,4,'Krabi',1,0,0),(73,4,'Phang Nga',1,0,0),(74,4,'Phuket',1,0,0),(75,4,'Ranong',1,0,0),(76,4,'Satun',1,0,0),(77,4,'Trang',1,0,0),(78,39,'Báº¯c Ninh',1,0,0),(79,39,'HÃ  Nam',1,0,0),(80,39,'HÃ  TÃ¢y',1,0,0),(81,39,'Háº£i DÆ°Æ¡ng',1,0,0),(82,39,'HÆ°ng YÃªn',1,0,0),(83,39,'Nam Äá»‹nh',1,0,0),(84,39,'Ninh BÃ¬nh',1,0,0),(85,39,'ThÃ¡i BÃ¬nh',1,0,0),(86,39,'VÄ©nh PhÃºc',1,0,0),(87,39,'Ha NoiÂ ',1,0,0),(88,39,'Hai PhongÂ ',1,0,0),(89,40,'HÃ  TÄ©nh',1,0,0),(90,40,'Nghá»‡ An',1,0,0),(91,40,'Quáº£ng BÃ¬nh',1,0,0),(92,40,'Quáº£ng Trá»‹',1,0,0),(93,40,'Thanh HÃ³a',1,0,0),(94,40,'Thá»«a ThiÃªn-Huáº¿',1,0,0),(95,41,'Báº¯c Giang',1,0,0),(96,41,'Báº¯c Káº¡n',1,0,0),(97,41,'Cao Báº±ng',1,0,0),(98,41,'HÃ  Giang',1,0,0),(99,41,'Láº¡ng SÆ¡n',1,0,0),(100,41,'LÃ o Cai',1,0,0),(101,41,'PhÃº Thá»',1,0,0),(102,41,'Quáº£ng Ninh',1,0,0),(103,41,'ThÃ¡i NguyÃªn',1,0,0),(104,41,'TuyÃªn Quang',1,0,0),(105,41,'YÃªn BÃ¡i',1,0,0),(106,41,'Äiá»‡n BiÃªn',1,0,0),(107,41,'HÃ²a BÃ¬nh',1,0,0),(108,41,'Lai ChÃ¢u',1,0,0),(109,41,'SÆ¡n La',1,0,0),(110,43,'Äáº¯k Láº¯k',1,0,0),(111,43,'Äáº¯k NÃ´ng',1,0,0),(112,43,'Gia Lai',1,0,0),(113,43,'Kon Tum',1,0,0),(114,43,'LÃ¢m Äá»“ng',1,0,0),(115,44,'BÃ¬nh Äá»‹nh',1,0,0),(116,44,'KhÃ¡nh HÃ²a',1,0,0),(117,44,'PhÃº YÃªn',1,0,0),(118,44,'Quáº£ng Nam',1,0,0),(119,44,'Quáº£ng NgÃ£i',1,0,0),(120,44,'BÃ¬nh Thuáº­n',1,0,0),(121,44,'Ninh Thuáº­n',1,0,0),(122,44,'Da NangÂ ',1,0,0),(123,45,'BÃ  Rá»‹aâ€“VÅ©ng TÃ u',1,0,0),(124,45,'BÃ¬nh DÆ°Æ¡ng',1,0,0),(125,45,'BÃ¬nh PhÆ°á»›c',1,0,0),(126,45,'Äá»“ng Nai',1,0,0),(127,45,'TÃ¢y Ninh',1,0,0),(128,45,'Ho Chi Minh',1,0,0),(129,46,'An Giang',1,0,0),(130,46,'Báº¡c LiÃªu',1,0,0),(131,46,'Báº¿n Tre',1,0,0),(132,46,'CÃ  Mau',1,0,0),(133,46,'Äá»“ng ThÃ¡p',1,0,0),(134,46,'Háº­u Giang',1,0,0),(135,46,'KiÃªn Giang',1,0,0),(136,46,'Long An',1,0,0),(137,46,'SÃ³c TrÄƒng',1,0,0),(138,46,'Tiá»n Giang',1,0,0),(139,46,'TrÃ  Vinh',1,0,0),(140,46,'VÄ©nh Long',1,0,0),(141,46,'Cáº§n ThÆ¡',1,0,0),(142,68,'Kandy',0,0,0),(143,68,'Matale',0,0,0),(144,68,'Nuwara Eliya',0,0,0),(145,69,'Ampara',0,0,0),(146,69,'Batticaloa',0,0,0),(147,69,'Trincomalee',0,0,0),(148,74,'Anuradhapura',0,0,0),(149,74,'Polonnaruwa',0,0,0),(150,73,'Kurunegala',0,0,0),(151,73,'Puttalam',0,0,0),(152,70,'Jaffna',0,0,0),(153,70,'Kilinochchi',0,0,0),(154,70,'Mannar',0,0,0),(155,70,'Mullaitivu',0,0,0),(156,70,'Vavuniya',0,0,0),(157,76,'Kegalle',0,0,0),(158,76,'Ratnapura',0,0,0),(159,71,'Galle',0,0,0),(160,71,'Hambantota',0,0,0),(161,71,'Matara',0,0,0),(162,75,'Badulla',0,0,0),(163,75,'Monaragala',0,0,0),(164,72,'Colombo',0,0,0),(165,72,'Gampaha',0,0,0),(166,72,'Kalutara',0,0,0),(171,68,'District',1,1,0),(172,111,'13',1,1,0),(173,112,'144',1,1,0),(174,113,'3',1,1,0),(175,114,'23',1,1,0),(176,115,'3',1,1,0),(177,112,'1445',1,1,0),(178,116,'14',1,1,0),(179,117,'3',1,1,0),(180,118,'2',1,1,0),(181,119,'4',1,1,0),(182,39,'1',1,1,0),(183,120,'2',1,1,0),(184,112,'44',1,1,0),(185,121,'111',1,1,0),(186,122,'6',1,1,0),(187,120,'1',1,1,0),(188,120,'4',1,1,0),(189,115,'AA',1,1,0),(190,39,'Province',1,1,0),(191,39,'123',1,1,0),(192,41,'1',1,1,0),(193,44,'2',1,1,0),(194,40,'2',1,1,0),(195,46,'2',1,1,0),(196,42,'9',1,1,0),(197,44,'1',1,1,0),(198,42,'1',1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_provinces`
--

LOCK TABLES `region_provinces` WRITE;
/*!40000 ALTER TABLE `region_provinces` DISABLE KEYS */;
INSERT INTO `region_provinces` VALUES (1,13,'Northern Thailand',0,0,0),(2,13,'Northeastern Thailand',0,0,0),(3,13,'Central Thailand',0,0,0),(4,13,'Southern Thailand',0,0,0),(5,5,'Special Region of Aceh',0,0,0),(6,5,'Bali',0,0,0),(7,5,'Bangkaâ€“Belitung Islands',0,0,0),(8,5,'Banten',0,0,0),(9,5,'Bengkulu',0,0,0),(10,5,'Central Java',0,0,0),(11,5,'Central Kalimantan',0,0,0),(12,5,'Central Sulawesi',0,0,0),(13,5,'East Java',0,0,0),(14,5,'East Kalimantan',0,0,0),(15,5,'East Nusa Tenggara',0,0,0),(16,5,'Gorontalo',0,0,0),(17,5,'Jakarta Special Capital Region',0,0,0),(18,5,'Jambi',0,0,0),(19,5,'Lampung',0,0,0),(20,5,'Maluku',0,0,0),(21,5,'North Kalimantan',0,0,0),(22,5,'North Maluku',0,0,0),(23,5,'North Sulawesi',0,0,0),(24,5,'North Sumatra',0,0,0),(25,5,'Special Region of Papua',0,0,0),(26,5,'Riau',0,0,0),(27,5,'Riau Islands',0,0,0),(28,5,'Southeast Sulawesi',0,0,0),(29,5,'South Kalimantan',0,0,0),(30,5,'South Sulawesi',0,0,0),(31,5,'South Sumatra',0,0,0),(32,5,'West Java',0,0,0),(33,5,'West Kalimantan',0,0,0),(34,5,'West Nusa Tenggara',0,0,0),(35,5,'Special Region of West Papua',0,0,0),(36,5,'West Sulawesi',0,0,0),(37,5,'West Sumatra',0,0,0),(38,5,'Special Region of Yogyakarta',0,0,0),(39,14,'Red River Delta (Äá»“ng Báº±ng SÃ´ng Há»“ng)',1,0,0),(40,14,'North Central Coastal Vietnam',1,0,0),(41,14,'North Eastern Vietnam',1,0,0),(42,14,'North Western Vietnam',1,0,0),(43,14,'Southern Vietnam',1,0,0),(44,14,'South Central Coastal Vietnam',1,0,0),(45,14,'South Eastern Vietnam',1,0,0),(46,14,'Mekong River Delta',1,0,0),(47,8,'Ayeyarwady Region',1,0,0),(48,8,'Bago Region',1,0,0),(49,8,'Chin State',1,0,0),(50,8,'Kachin State',1,0,0),(51,8,'Kayah State',1,0,0),(52,8,'Kayin State',1,0,0),(53,8,'Magway Region',1,0,0),(54,8,'Mandalay Region',1,0,0),(55,8,'Mon State',1,0,0),(56,8,'Rakhine State',1,0,0),(57,8,'Shan State',1,0,0),(58,8,'Sagaing Region',1,0,0),(59,8,'Tanintharyi Region',1,0,0),(60,8,'Yangon Region',1,0,0),(61,8,'Naypyidaw Union Territory',1,0,0),(62,8,'Danu Self-Administered Zone',1,0,0),(63,8,'Kokang Self-Administered Zone',1,0,0),(64,8,'Naga Self-Administered Zone',1,0,0),(65,8,'Pa\'O Self-Administered Zone',1,0,0),(66,8,'Pa Laung Self-Administered Zone',1,0,0),(67,8,'Wa Self-Administered Division',1,0,0),(68,12,'Central Province',1,0,0),(69,12,'Eastern Province',1,0,0),(70,12,'Northern Province',1,0,0),(71,12,'Southern Province',1,0,0),(72,12,'Western Province',1,0,0),(73,12,'North Western Province',1,0,0),(74,12,'North Central Province',1,0,0),(75,12,'Uva Province',1,0,0),(76,12,'Sabaragamuwa Province',1,0,0),(77,3,'Anhui',1,0,0),(78,3,'Fujian',1,0,0),(79,3,'Gansu',1,0,0),(80,3,'Guangdong',1,0,0),(81,3,'Guizhou',1,0,0),(82,3,'Hainan',1,0,0),(83,3,'Hebei',1,0,0),(84,3,'Heilongjiang',1,0,0),(85,3,'Henan',1,0,0),(86,3,'Hubei',1,0,0),(87,3,'Hunan',1,0,0),(88,3,'Jiangsu',1,0,0),(89,3,'Jiangxi',1,0,0),(90,3,'Jilin',1,0,0),(91,3,'Liaoning',1,0,0),(92,3,'Qinghai',1,0,0),(93,3,'Shaanxi',1,0,0),(94,3,'Shandong',1,0,0),(95,3,'Shanxi',1,0,0),(96,3,'Sichuan',1,0,0),(97,3,'Yunnan',1,0,0),(98,3,'Zhejiang',1,0,0),(99,3,' GuangxiÂ Zhuang',1,0,0),(100,3,'Inner Mongolia',1,0,0),(101,3,'NingxiaÂ Hui',1,0,0),(102,3,'XinjiangÂ Uighur',1,0,0),(103,3,'Tibet',1,0,0),(104,3,'Beijing Municipality',1,0,0),(105,3,'Chongqing Municipality',1,0,0),(106,3,'Shanghai Municipality',1,0,0),(107,3,'Tianjin Municipality',1,0,0),(108,3,'Hong Kong',1,0,0),(109,3,'Macau',1,0,0),(110,3,'Wolong',1,0,0),(111,9,'12',1,1,0),(112,185,'123',1,1,0),(113,9,'2',1,1,0),(114,195,'123',1,1,0),(115,185,'2',1,1,0),(116,195,'23',1,1,0),(117,195,'2',1,1,0),(118,9,'1',1,1,0),(119,9,'123',1,1,0),(120,185,'1',1,1,0),(121,185,'1123',1,1,0),(122,185,'5',1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long`
--

LOCK TABLES `season_long` WRITE;
/*!40000 ALTER TABLE `season_long` DISABLE KEYS */;
INSERT INTO `season_long` VALUES (299,51,28,0),(300,51,28,0),(301,51,28,0),(302,51,28,0),(303,51,28,0),(304,51,28,0),(305,51,28,0),(306,51,28,0),(307,51,28,0),(308,53,30,0),(309,53,30,0),(310,53,30,0),(311,53,30,0),(312,53,30,0),(313,53,30,0),(314,53,30,0),(315,53,30,0),(316,53,30,0),(317,53,30,0),(318,53,30,0),(319,53,30,0),(320,53,30,0),(321,62,39,0),(322,62,39,0),(323,62,39,0),(324,62,39,0),(325,62,39,0),(326,62,39,0),(327,62,39,0),(328,62,39,0),(329,63,40,0),(330,63,40,0),(331,63,40,0),(332,63,40,0),(333,63,40,0),(334,63,40,0),(335,63,40,0),(336,63,40,0),(337,64,41,0),(338,64,41,0),(339,64,41,0),(340,64,41,0),(341,64,41,0),(342,64,41,0),(343,64,41,0),(344,64,41,0),(345,65,44,0),(346,65,44,0),(347,65,44,0),(348,65,44,0),(349,65,44,0),(350,65,44,0),(351,65,44,0),(352,65,44,0),(353,66,45,0),(354,66,45,0),(355,66,45,0),(356,66,45,0),(357,66,45,0),(358,66,45,0),(359,66,45,0),(360,66,45,0),(361,67,46,0),(362,67,46,0),(363,67,46,0),(364,67,46,0),(365,67,46,0),(366,67,46,0),(367,67,46,0),(368,67,46,0),(369,68,47,0),(370,68,47,0),(371,68,47,0),(372,68,47,0),(373,68,47,0),(374,68,47,0),(375,68,47,0),(376,68,47,0),(377,71,50,0),(378,69,48,0),(379,71,50,0),(380,71,50,0),(381,71,50,0),(382,71,50,0),(383,71,50,0),(384,69,48,0),(385,69,48,0),(386,69,48,0),(387,69,48,0),(388,69,48,0),(389,69,48,0),(390,71,50,0),(391,69,48,0),(392,71,50,0),(393,70,49,0),(394,70,49,0),(395,70,49,0),(396,70,49,0),(397,70,49,0),(398,70,49,0),(399,70,49,0),(400,70,49,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_child_labor`
--

LOCK TABLES `season_long_child_labor` WRITE;
/*!40000 ALTER TABLE `season_long_child_labor` DISABLE KEYS */;
INSERT INTO `season_long_child_labor` VALUES (30,328,1,3,4),(31,336,2,4,5),(32,344,3,1,1),(33,352,2,3,4),(34,360,2,3,4),(35,368,1,3,3),(36,376,1,3,5),(37,391,3,2,4),(38,392,3,1,1),(39,400,1,3,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_child_labor_record`
--

LOCK TABLES `season_long_child_labor_record` WRITE;
/*!40000 ALTER TABLE `season_long_child_labor_record` DISABLE KEYS */;
INSERT INTO `season_long_child_labor_record` VALUES (17,32,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_cleaning_drying`
--

LOCK TABLES `season_long_cleaning_drying` WRITE;
/*!40000 ALTER TABLE `season_long_cleaning_drying` DISABLE KEYS */;
INSERT INTO `season_long_cleaning_drying` VALUES (33,327,3,23,3,2,2,2,2,2),(34,335,5,22,1,11,2,5,8,22),(35,343,1,2,2,2,5,1,1,2),(36,351,1,2,2,55,11,23,1,2),(37,359,2,5,2,1,2,1,2,3),(38,367,2,2,2,2,2,0,4,1),(39,375,2,0,2,2,1,2,3,4),(40,389,1,2,2,2,3,4,1,5),(41,390,1,38,2,3,3,3,0,279),(42,399,3,2,0,0,0,0,0,0);
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
-- Dumping data for table `season_long_computations`
--

LOCK TABLES `season_long_computations` WRITE;
/*!40000 ALTER TABLE `season_long_computations` DISABLE KEYS */;
INSERT INTO `season_long_computations` VALUES (62,39,0.000002,0.000065,0.000035,0,0,0,0,0.000055,0.000026,0.000007,0.000548,1.23,'2016-12-14 00:00:00','0000-00-00 00:00:00','2016-12-23 00:00:00','2016-12-20 00:00:00','2016-12-08 00:00:00',0,3,0.000137,0.000047,0.000001,0.009885,24.5368,0.017442,0.01889,0.000019,0.0068,0.31,0.37,0.32,0.41,-0.009866,2.56498,1.19355,1.28125,0.1874,4,0.215,4,0.001,1,0.093073,0.185896,21.0118,0.06,0.08,0.000315,0.000056,-0.023324,-0.017391,100,-110,4,0,6880000,0,0,1.1398,4.44539,111.135,1,0.000015,15,'Acceptable',2,0.00096,-15,'Unsustainable',0,0,15,'Acceptable',0,0,15,'Acceptable',0,0,15,'Acceptable',3,0.000975,45,0,50,'Fair',48.3,'Poor',20,'Poor',24,'Poor',44,'Poor',0),(63,40,0.000001,0.000002,0.000899,0.000001,0,0.000001,0,0.000003,0.000021,0.000005,0.000002,0.1009,'2016-11-27 00:00:00','2016-11-27 00:00:00','2016-12-01 00:00:00','2016-11-29 00:00:00','2016-11-27 00:00:00',4,2,0.000002,0.000001,0.000002,0.000939,0.040706,0.037586,0.040706,0.000096,0.000416,0.1568,0.0739,0.0973,0.0505,-0.000843,90.4225,0.471301,0.519013,0.001009,2,0.001658,3,0.025874,3,37.2508,51.9578,1.75,0,0,0.000678,0.00012,-1.64152,-0.999183,2500,70,28,0,684290000,0,0.000002,1.00153,4.94757,123.689,1,0.000005,15,'Acceptable',2,0.000024,-15,'Unsustainable',0,0,15,'Acceptable',2,0.00003,-15,'Unsustainable',0,0,15,'Acceptable',5,0.00009,15,0,50,'Fair',0,'Poor',0,'Poor',2,'Poor',0,'Poor',0),(64,41,0.000016,0.000032,0.000003,0,0,0,0,0.000012,0.000023,0.00001,0,0.3636,'2016-11-27 00:00:00','0000-00-00 00:00:00','2016-11-27 00:00:00','2016-11-27 00:00:00','2016-12-02 00:00:00',0,0,0.000002,0.000004,0.000001,0.000087,0.029765,0.034531,0.037397,0.000008,0.017677,0.5455,0.6212,0.6364,0.303,-0.000079,1.95343,1.13877,0.476116,0.009697,2,0.023636,3,0.004242,1,3.56105,3.34771,9.8055,0,0,0.000623,0.00011,-0.155171,-0.06366,200,20,5,0,65158200,0,0.000001,1,0.000001,0.000028,2,0.000366,0,'Tolerable',0,0,-15,'Unsustainable',1,0.00004,15,'Acceptable',0,0,15,'Acceptable',0,0,15,'Acceptable',3,0.000407,30,0,0,'Poor',100,'Good',80,'Fair',92,'Good',90,'Good',0),(65,44,0.000134,0.00009,0.000202,0,0,0,0,0.000359,0.000448,0.000381,0,2.5,'2016-11-27 00:00:00','0000-00-00 00:00:00','2016-11-27 00:00:00','2016-11-27 00:00:00','0000-00-00 00:00:00',0,0,0.000269,0.000157,0.000045,0.001995,0.982256,0.895349,0.969663,0.000201,28.75,37,20.5,27,15,-0.001794,0.031143,0.554054,0.555556,0.48,2,0.87,2,0.6,1,1.86531,2.35824,1.79767,0,12,0.016152,0.00285,-0.028324,-0.01726,200,20,5,0,2468310,0,0.00009,1.00017,0.000044,0.001107,2,0.002583,0,'Tolerable',2,0.005,-15,'Unsustainable',1,0.001875,15,'Acceptable',0,0,15,'Acceptable',0,0,15,'Acceptable',5,0.009458,30,0,50,'Fair',63.3,'Fair',10,'Poor',38,'Poor',44,'Poor',0),(66,45,0.000045,0.000067,0.000112,0,0,0,0,0.000381,0.000852,0.000247,0,3,'2016-11-28 00:00:00','0000-00-00 00:00:00','2016-10-30 00:00:00','2016-10-30 00:00:00','2016-10-30 00:00:00',0,0,0.000202,0.000202,0.000067,0.002174,0.982256,2.84884,3.08529,0.000128,17.25,19.5,15,16,26,-0.002046,0.16515,0.769231,1.625,0.85,3,0.46,1,0,0,3.35157,14.1914,0,0,12,0.051392,0.009068,-0.237073,-0.438069,200,50,5,0.000001,888082,0.000001,0.000095,1.00003,0.000044,0.001107,1,0.013,15,'Acceptable',1,0.002667,-15,'Unsustainable',0,0,15,'Acceptable',1,0.019167,-15,'Unsustainable',0,0,15,'Acceptable',3,0.054,15,0,0,'Poor',75,'Fair',10,'Poor',24,'Poor',0,'Poor',0),(67,46,0,0.000001,0.000001,0,0,0,0,0.000003,0.000002,0.000002,0,0.0045,'2016-09-25 00:00:00','2016-12-04 00:00:00','2016-11-27 00:00:00','2016-11-27 00:00:00','2016-10-31 00:00:00',7,0,0.000002,0.000005,0,0.000018,0.048891,0.118594,0.128437,0.000079,0.001106,0.1222,0.1222,0.1991,0.1403,0.000061,107.239,1,0.704671,0.0019,1,0,0,0.008145,2,62.4032,0,17.5409,0,0.1086,0.002139,0.000377,-0.089591,0,100,20,4,0,10455800,0,0.000003,1.00065,0,0.000006,1,0.000042,15,'Acceptable',1,0.000003,-15,'Unsustainable',1,0.00003,15,'Acceptable',0,0,15,'Acceptable',0,0,15,'Acceptable',3,0.000075,45,0,0,'Poor',58.3,'Fair',45,'Poor',18,'Poor',29,'Poor',0),(68,47,0.000269,0.000134,0.000179,0.000247,0.000247,0,0,0.000247,0.000269,0.001434,0.000045,1,'2016-10-30 00:00:00','2016-10-30 00:00:00','2016-10-30 00:00:00','2016-10-03 00:00:00','2016-12-11 00:00:00',0,27,0.000247,0.000112,0.00009,0.003048,5.40241,0.569767,0.617058,0.000026,15.5,16,15,19,19.5,-0.003022,0.036759,0.9375,1.02632,0.35,2,0.14,1,0.74,2,1.62791,9.32577,0.927546,0,12,0.010278,0.001814,-0.012292,-0.030731,100,40,4,0,2509800,0,0.000019,1.0007,10.8889,272.222,0,0,15,'Acceptable',0,0,-15,'Unsustainable',2,0.003167,0,'Tolerable',0,0,15,'Acceptable',0,0,15,'Acceptable',2,0.003167,30,0,50,'Fair',48.3,'Poor',20,'Poor',32,'Poor',49,'Poor',0),(69,48,0.000022,0.000018,0.000036,0,0,0,0,0.000058,0.000108,0.000036,0,0.2,'2016-12-05 00:00:00','0000-00-00 00:00:00','2016-10-31 00:00:00','2016-10-30 00:00:00','0000-00-00 00:00:00',0,1,0.000125,0.000009,0.000022,0.000421,0.491128,0.227907,0.246823,0.000045,1.05,5.6,4.9,4.1,4.6,-0.000376,0.217054,0.875,1.12195,0.07,2,0.028,1,0.148,2,3.25581,18.6515,1.85509,0,2.4,0.004111,0.000725,-0.02206,-0.055149,200,40,6,0,10662200,0,0.000008,1.00001,0.689533,17.2383,1,0.000067,-15,'Unsustainable',0,0,-15,'Unsustainable',2,0.0011,0,'Tolerable',0,0,15,'Acceptable',0,0,15,'Acceptable',3,0.001167,0,0,50,'Fair',58.3,'Fair',25,'Poor',30,'Poor',44,'Poor',0),(71,50,0.00009,0.000149,0.000194,0,0,0,0,6.29976,9.54928,43.7035,0.00003,0.6667,'2016-09-28 00:00:00','0000-00-00 00:00:00','2016-12-04 00:00:00','2016-11-27 00:00:00','0000-00-00 00:00:00',0,7,6.60992,0.006499,0.004168,66.1787,1.63709,15.814,17.1265,207.723,11,16.6667,16.3333,17,0.6667,141.544,1.43763,0.979996,0.039218,11.2333,4,9.50667,2,0,0,1.40777,3.81178,0,0,0,0.285276,0.050336,-5.80614,-8.07811,400,3090,7,0,5197310,0,0,1.00074,9.10687,227.672,0,0,15,'Acceptable',1,2020.3,-15,'Unsustainable',1,0.001,15,'Acceptable',0,0,15,'Acceptable',0,0,15,'Acceptable',2,2020.3,45,0,50,'Fair',100,'Good',75,'Fair',100,'Good',100,'Good',0),(70,49,0.000008,0.000113,0.000006,0,0,0,0,0.000033,0.000045,0.000105,0.00024,0.2174,'2016-12-01 00:00:00','0000-00-00 00:00:00','2016-11-28 00:00:00','2016-09-26 00:00:00','2016-10-30 00:00:00',0,63,0.000023,0.000014,0,0.000583,0.085414,1.04651,1.13337,0.004535,0.16257,2.1304,1.6087,1.4783,2,0.003953,6.43732,0.755116,1.35291,0.012174,1,0.012174,1,0.116522,3,85.9635,196.983,10.8195,0,0,0.018879,0.003331,0.003322,0.003322,200,130,7,0,3191560,0,0.000026,1.00016,33.4207,835.518,1,0.000797,15,'Acceptable',1,0.000116,-15,'Unsustainable',1,0.00029,15,'Acceptable',0,0,15,'Acceptable',0,0,15,'Acceptable',3,0.001203,45,0,0,'Poor',68.3,'Fair',45,'Poor',60,'Fair',66,'Fair',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_fertilizer_application`
--

LOCK TABLES `season_long_fertilizer_application` WRITE;
/*!40000 ALTER TABLE `season_long_fertilizer_application` DISABLE KEYS */;
INSERT INTO `season_long_fertilizer_application` VALUES (244,321,23,1,2,4,4,2,23,1,'',0),(245,322,1,1,5,5,2,8,1,1,'',0),(246,323,0,0,0,0,0,0,0,0,'',0),(247,324,0,0,0,0,0,0,0,0,'',0),(248,325,0,0,0,0,0,0,0,0,'',0),(249,326,0,0,0,0,0,0,0,0,'',0),(250,327,2,1,4,5,6,7,8,1,'',2),(251,329,1,2,1,1,2,0,1,5,'',0),(252,330,2,2,1,1,1,1,233,5,'',0),(253,331,0,0,0,0,0,0,0,0,'',0),(254,332,0,0,0,0,0,0,0,0,'',0),(255,333,0,0,0,0,0,0,0,0,'',0),(256,334,0,0,0,0,0,0,0,0,'',0),(257,335,22,1,2,2,4,0,2,3,'',23),(258,337,2,2,2,4,0,6,2,2,'',0),(259,338,24,2,2,2,4,0,2,4,'',0),(260,339,0,0,0,0,0,0,0,0,'',0),(261,340,0,0,0,0,0,0,0,0,'',0),(262,341,0,0,0,0,0,0,0,0,'',0),(263,342,0,0,0,0,0,0,0,0,'',0),(264,343,2,3,2,2,4,1,2,3,'',5),(265,345,2,1,1,2,3,4,5,1,'',0),(266,346,2,1,2,3,1,4,5,1,'',0),(267,347,0,0,0,0,0,0,0,0,'',0),(268,348,0,0,0,0,0,0,0,0,'',0),(269,349,0,0,0,0,0,0,0,0,'',0),(270,350,0,0,0,0,0,0,0,0,'',0),(271,351,5,2,1,2,1,1,1,2,'',1),(272,353,23,1,5,6,2,9,1,2,'',0),(273,354,4,2,1,5,1,2,3,3,'',0),(274,355,0,0,0,0,0,0,0,0,'',0),(275,356,0,0,0,0,0,0,0,0,'',0),(276,357,0,0,0,0,0,0,0,0,'',0),(277,358,0,0,0,0,0,0,0,0,'',0),(278,359,2,1,1,1,1,3,5,6,'AAA',23),(279,361,1,1,5,6,1,1,1,4,'',0),(280,362,1,1,2,1,3,4,5,2,'',0),(281,363,0,0,0,0,0,0,0,0,'',0),(282,364,0,0,0,0,0,0,0,0,'',0),(283,365,0,0,0,0,0,0,0,0,'',0),(284,366,0,0,0,0,0,0,0,0,'',0),(285,367,1,1,2,2,1,1,1,3,'',2),(286,369,1,2,3,1,4,5,2,2,'',0),(287,370,1,1,2,3,4,5,6,5,'',0),(288,371,0,0,0,0,0,0,0,0,'',0),(289,372,0,0,0,0,0,0,0,0,'',0),(290,373,0,0,0,0,0,0,0,0,'',0),(291,374,0,0,0,0,0,0,0,0,'',0),(292,375,1,2,5,6,7,2,1,3,'',1),(293,377,3567,1,2,2,2,0,2,1,'',0),(294,378,2,2,1,1,3,2,4,5,'',0),(295,379,2689,1,4,4,4,0,628304,2,'',0),(296,380,0,0,0,0,0,0,0,0,'',0),(297,381,0,0,0,0,0,0,0,0,'',0),(298,382,0,0,0,0,0,0,0,0,'',0),(299,383,0,0,0,0,0,0,0,0,'',0),(300,384,2,2,4,5,1,3,6,4,'',0),(301,385,0,0,0,0,0,0,0,0,'',0),(302,386,0,0,0,0,0,0,0,0,'',0),(303,387,0,0,0,0,0,0,0,0,'',0),(304,388,0,0,0,0,0,0,0,0,'',0),(305,389,5,2,1,2,3,4,5,4,'',1),(306,390,3950,3,6,6,6,0,650,5,'',759),(307,393,2,1,4,1,5,6,7,4,'',0),(308,394,5,1,2,1,3,1,1,3,'',0),(309,395,0,0,0,0,0,0,0,0,'',0),(310,396,0,0,0,0,0,0,0,0,'',0),(311,397,0,0,0,0,0,0,0,0,'',0),(312,398,0,0,0,0,0,0,0,0,'',0),(313,399,2,2,2,4,1,5,6,3,'',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_fertilizer_application_info`
--

LOCK TABLES `season_long_fertilizer_application_info` WRITE;
/*!40000 ALTER TABLE `season_long_fertilizer_application_info` DISABLE KEYS */;
INSERT INTO `season_long_fertilizer_application_info` VALUES (130,244,'dap','2016-11-27 00:00:00',1,18,46,0,0,0,0),(131,244,'Mol','2016-11-27 00:00:00',2,3,4,5,6,8,1),(132,245,'urea','2016-11-27 00:00:00',23,46,0,0,0,0,0),(133,245,'dap','2016-11-27 00:00:00',44,18,46,0,0,0,0),(134,250,'solophos','2016-11-27 00:00:00',4,0,18,0,0,0,0),(135,251,'mop','2016-11-27 00:00:00',23,0,0,60,0,0,0),(136,252,'complete','2016-11-29 00:00:00',2,14,14,14,0,0,0),(137,257,'complete','2016-11-27 00:00:00',2,14,14,14,0,0,0),(138,257,'solophos','2016-11-03 00:00:00',2,0,18,0,0,0,0),(139,258,'complete','2016-11-28 00:00:00',2,14,14,14,0,0,0),(140,259,'solophos','2016-11-27 00:00:00',2,0,18,0,0,0,0),(141,264,'dap','2016-11-28 00:00:00',2,18,46,0,0,0,0),(142,265,'mop','2016-11-27 00:00:00',2,0,0,60,0,0,0),(143,266,'solophos','2016-11-27 00:00:00',2,0,18,0,0,0,0),(144,271,'ammoniumSulphate','2016-11-28 00:00:00',2,21,0,0,0,24,0),(145,271,'dap','2016-12-13 00:00:00',3,18,46,0,0,0,0),(146,272,'urea','2016-11-27 00:00:00',2,46,0,0,0,0,0),(147,273,'dap','2016-11-27 00:00:00',2,18,46,0,0,0,0),(148,278,'ammoniumSulphate','2016-11-27 00:00:00',2,21,0,0,0,24,0),(149,279,'mop','2016-11-28 00:00:00',2,0,0,60,0,0,0),(150,280,'mop','2016-11-27 00:00:00',1,0,0,60,0,0,0),(151,285,'ammoniumSulphate','2016-10-30 00:00:00',2,21,0,0,0,24,0),(152,286,'ammoniumSulphate','2016-12-04 00:00:00',2,21,0,0,0,24,0),(153,287,'complete','2016-11-27 00:00:00',2,14,14,14,0,0,0),(154,292,'mop','2016-11-27 00:00:00',2,0,0,60,0,0,0),(155,293,'urea','2016-10-02 00:00:00',24,46,0,0,0,0,0),(156,293,'dap','2016-10-02 00:00:00',24,18,46,0,0,0,0),(157,294,'mop','2016-10-31 00:00:00',2,0,0,60,0,0,0),(158,295,'urea','2016-06-27 00:00:00',25,46,0,0,0,0,0),(159,300,'ammoniumSulphate','2016-10-31 00:00:00',2,21,0,0,0,24,0),(160,305,'complete','2016-11-27 00:00:00',2,14,14,14,0,0,0),(161,306,'dap','2016-11-27 00:00:00',38,18,46,0,0,0,0),(162,307,'mop','2016-11-28 00:00:00',2,0,0,60,0,0,0),(163,308,'mop','2016-11-28 00:00:00',2,0,0,60,0,0,0),(164,313,'complete','2016-11-27 00:00:00',2,14,14,14,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_food_safety`
--

LOCK TABLES `season_long_food_safety` WRITE;
/*!40000 ALTER TABLE `season_long_food_safety` DISABLE KEYS */;
INSERT INTO `season_long_food_safety` VALUES (38,328,1,'ABC','AA'),(39,336,1,'223','AA'),(40,344,0,'',''),(41,352,1,'A','DD'),(42,360,0,'',''),(43,368,0,'',''),(44,376,1,'2','3'),(45,391,1,'AA','23'),(46,392,1,'arsenix','y'),(47,400,0,'','');
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_grain_and_straw_yield`
--

LOCK TABLES `season_long_grain_and_straw_yield` WRITE;
/*!40000 ALTER TABLE `season_long_grain_and_straw_yield` DISABLE KEYS */;
INSERT INTO `season_long_grain_and_straw_yield` VALUES (42,327,2,23,24,0,0,1,25,22,1),(43,335,23,44,56,1,23,0,22,2,1),(44,343,2,3,5,0,0,2,2,5,5),(45,351,2,4,5,0,0,2,23,1,4),(46,359,5,6,1,0,0,1,2,3,1),(47,367,23,1,14,1,23,0,2,4,3),(48,375,1,2,1,1,0,0,2,3,6),(49,389,2,3,4,1,1,0,2,3,7),(50,390,240,2759,284950,1,384940,0,83,4729,1),(51,399,23,5,4,1,2231,0,10,4,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_harvesting_threshing`
--

LOCK TABLES `season_long_harvesting_threshing` WRITE;
/*!40000 ALTER TABLE `season_long_harvesting_threshing` DISABLE KEYS */;
INSERT INTO `season_long_harvesting_threshing` VALUES (35,327,3,'2016-12-20 00:00:00',0,0,0,0,2,2,2,2,2,0,0,0,0,0,0,0,0,1,'2016-12-08 00:00:00',25,23,100,2,23,'0000-00-00 00:00:00','',0,0,0,0,1,0,25,5),(36,335,3,'2016-11-29 00:00:00',0,0,0,0,2,2,2,4,0,0,0,0,0,0,0,0,0,23,'2016-11-27 00:00:00',23,4,6,1,2,'0000-00-00 00:00:00','',0,0,0,0,3,2,2,5),(37,343,2,'2016-11-27 00:00:00',0,0,0,0,2,2,1,1,1,0,0,0,2,5,1,2,2,0,'2016-12-02 00:00:00',0,0,0,0,0,'0000-00-00 00:00:00','',0,0,0,0,3,5,2,0),(38,351,4,'2016-11-27 00:00:00',0,0,0,0,3,2,5,1,2,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00',2,1,1,0,0,'2016-12-22 00:00:00','24',5,66,3,4,3,2,2,1),(39,359,3,'2016-10-30 00:00:00',0,0,0,0,2,1,1,2,1,0,0,0,0,0,0,0,0,2,'2016-10-30 00:00:00',2,3,5,6,1,'0000-00-00 00:00:00','',0,0,0,0,5,0,2,4),(40,367,3,'2016-11-27 00:00:00',0,0,0,0,2,1,1,22,1,0,0,0,0,0,0,0,0,1,'2016-10-31 00:00:00',1,22,14,15,1,'0000-00-00 00:00:00','',0,0,0,0,3,2,12,13),(41,375,2,'2016-10-03 00:00:00',0,0,0,0,2,5,2,6,1,0,0,0,0,2,3,4,5,0,'2016-12-11 00:00:00',0,0,0,0,0,'0000-00-00 00:00:00','',0,0,0,0,4,0,0,0),(42,389,1,'2016-10-30 00:00:00',2,3,4,5,2,2,3,4,5,1,0,4,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,0,0,'0000-00-00 00:00:00','',0,0,0,0,3,3,2,0),(43,390,1,'2016-11-27 00:00:00',392,24,3950,4739,1,2,2,2,0,1,43,1,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,0,0,'0000-00-00 00:00:00','',0,0,0,0,1,0,278,0),(44,399,3,'2016-09-26 00:00:00',0,0,0,0,2,2,3,1,4,0,0,0,0,0,0,0,0,2,'2016-10-30 00:00:00',2,3,5,1,3,'0000-00-00 00:00:00','',0,0,0,0,2,0,2,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_irrigation`
--

LOCK TABLES `season_long_irrigation` WRITE;
/*!40000 ALTER TABLE `season_long_irrigation` DISABLE KEYS */;
INSERT INTO `season_long_irrigation` VALUES (62,321,2,1,0,0,0,0,0,0,0,0,0,1,2,2,2,2,111,1),(63,322,1,1,1,23,44,55,66,77,123,0,1,1,2,4,2,5,6,0),(64,327,2,1,0,0,0,0,0,0,0,0,2,1,1,1,1,1,2,0),(65,329,2,1,0,0,0,0,0,0,0,0,2,1,1,1,1,1,2,25),(66,330,3,1,0,0,0,0,0,0,0,0,1,1,2,2,4,5,6,0),(67,335,3,1,0,0,0,0,0,0,0,0,5,1,2,4,5,1,22,0),(68,337,2,1,0,0,0,0,0,0,0,0,2,3,5,6,11,0,2,2),(69,338,3,1,2,5,6,2,1,2,0,3,4,2,5,6,11,0,2,0),(70,343,3,1,1,2,2,1,1,4,5,0,6,2,2,2,1,1,1,0),(71,345,3,1,0,0,0,0,0,0,0,0,2,1,1,2,3,0,2,2),(72,346,1,1,2,2,2,3,4,5,0,6,7,1,2,3,1,5,2,0),(73,351,2,1,1,2,4,1,2,5,6,0,1,1,1,1,1,1,2,0),(74,353,3,1,0,0,0,0,0,0,0,0,1,2,5,1,2,3,4,2),(75,354,3,1,0,0,0,0,0,0,0,0,2,1,5,1,2,6,2,0),(76,357,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(77,359,2,1,0,0,0,0,0,0,0,0,2,2,2,1,4,5,6,0),(78,361,2,1,0,0,0,0,0,0,0,0,1,1,1,2,3,4,5,1),(79,362,2,1,0,0,0,0,0,0,0,0,2,1,1,1,1,1,1,0),(80,367,2,1,0,0,0,0,0,0,0,0,2,2,1,2,3,4,5,0),(81,369,2,1,0,0,0,0,0,0,0,0,1,2,1,1,2,1,1,1),(82,370,3,1,0,0,0,0,0,0,0,0,2,2,2,1,3,4,1,0),(83,375,2,1,2,2,1,1,5,6,0,4,1,2,2,3,1,4,5,0),(84,377,1,1,0,0,0,0,0,0,0,0,333333,1,2,2,2,0,2,4),(85,378,2,1,0,0,0,0,0,0,0,0,2,2,2,3,1,4,5,2),(86,379,1,1,0,0,0,0,0,0,0,0,2445,1,2,2,2,0,76909,0),(87,384,3,1,0,0,0,0,0,0,0,0,1,2,2,4,5,6,2,0),(88,388,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(89,389,3,2,0,0,0,0,0,0,0,0,2,2,5,6,1,3,1,0),(90,390,1,1,0,0,0,0,0,0,0,0,568,2,5,5,5,0,8405,0),(91,393,3,2,0,0,0,0,0,0,0,0,2,2,2,3,1,4,5,2),(92,394,3,2,0,0,0,0,0,0,0,0,2,1,2,2,1,3,4,0),(93,398,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(94,399,2,1,0,0,0,0,0,0,0,0,2,2,5,2,3,1,2,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_irrigation_period`
--

LOCK TABLES `season_long_irrigation_period` WRITE;
/*!40000 ALTER TABLE `season_long_irrigation_period` DISABLE KEYS */;
INSERT INTO `season_long_irrigation_period` VALUES (130,62,'2016-11-27 00:00:00',1,11,23,'1'),(131,63,'2016-11-27 00:00:00',1,22,23,'2'),(132,64,'2016-11-27 00:00:00',1,4,2,'1'),(133,65,'2016-11-27 00:00:00',1,5,2,'1'),(134,66,'2016-11-27 00:00:00',0,2,0,'1'),(135,67,'2016-11-27 00:00:00',0,2,0,'1'),(136,68,'2016-11-27 00:00:00',0,2,0,'1'),(137,69,'2016-11-27 00:00:00',1,2,2,'3'),(138,70,'2016-11-27 00:00:00',1,2,2,'2'),(139,71,'2016-11-27 00:00:00',1,2,2,'1'),(140,72,'2016-11-27 00:00:00',0,2,0,'2'),(141,73,'2016-11-27 00:00:00',1,2,2,'2'),(142,74,'2016-11-28 00:00:00',0,2,0,'1'),(143,75,'2016-09-26 00:00:00',0,2,0,'1'),(144,77,'2016-11-27 00:00:00',0,1,0,'1'),(145,78,'2016-05-17 00:00:00',0,2,0,'1'),(146,79,'2016-09-25 00:00:00',1,1,2,'1'),(147,80,'2016-10-30 00:00:00',0,1,0,'1'),(148,81,'2016-11-27 00:00:00',1,2,2,'1'),(149,82,'2016-10-30 00:00:00',0,2,0,'1'),(150,83,'2016-11-27 00:00:00',1,4,2,'2'),(151,84,'2016-09-26 00:00:00',1,333,24,'1'),(152,85,'2016-10-31 00:00:00',1,4,2,'1'),(153,86,'2016-08-28 00:00:00',1,24,24,'1'),(154,87,'2016-10-30 00:00:00',1,4,2,'1'),(155,89,'2016-12-19 00:00:00',1,2,2,'2'),(156,89,'2016-12-19 00:00:00',0,0,0,'1'),(157,90,'2016-11-27 00:00:00',1,24,24,'1'),(158,91,'2016-12-07 00:00:00',1,4,2,'1'),(159,91,'2016-11-27 00:00:00',1,5,3,'2'),(160,92,'2016-12-05 00:00:00',1,4,2,'1'),(161,92,'2016-11-27 00:00:00',0,5,0,'2'),(162,94,'2016-11-28 00:00:00',0,2,0,'1');
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_land_preparation`
--

LOCK TABLES `season_long_land_preparation` WRITE;
/*!40000 ALTER TABLE `season_long_land_preparation` DISABLE KEYS */;
INSERT INTO `season_long_land_preparation` VALUES (71,321,1,'2016-12-14 00:00:00',23,1,1,2,1,2,123,144,1554,0),(72,329,2,'2016-11-27 00:00:00',25,1,6,7,1,2,3,4,5,0),(73,337,1,'2016-11-27 00:00:00',24,1,2,2,0,4,23,2,4,0),(74,345,1,'2016-11-27 00:00:00',2,1,1,1,2,1,2,4,5,0),(75,353,1,'2016-11-28 00:00:00',2,2,1,1,1,1,1,1,1,0),(76,361,2,'2016-09-25 00:00:00',2,2,2,1,3,1,4,5,6,0),(77,369,2,'2016-10-30 00:00:00',5,2,1,2,1,1,1,1,1,0),(78,377,1,'2016-09-28 00:00:00',5,1,2,1,3,2,5,5,6,0),(79,378,1,'2016-12-05 00:00:00',3,2,2,4,1,5,1,2,3,0),(80,393,1,'2016-12-01 00:00:00',56,2,2,1,1,1,2,3,4,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_land_preparation_operations`
--

LOCK TABLES `season_long_land_preparation_operations` WRITE;
/*!40000 ALTER TABLE `season_long_land_preparation_operations` DISABLE KEYS */;
INSERT INTO `season_long_land_preparation_operations` VALUES (144,71,1,'2016-12-15 00:00:00',2,123,2,1),(145,72,1,'2016-12-04 00:00:00',1,0,0,1),(146,73,2,'2016-10-30 00:00:00',1,0,0,1),(147,74,1,'2016-11-29 00:00:00',2,2,2,2),(148,75,2,'2016-12-11 00:00:00',1,0,0,1),(149,76,1,'2016-09-25 00:00:00',1,0,0,1),(150,77,1,'2016-10-30 00:00:00',3,2,3,2),(151,78,1,'2016-11-27 00:00:00',1,0,0,1),(152,79,1,'2016-10-31 00:00:00',2,2,5,2),(153,80,1,'2016-12-08 00:00:00',1,0,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pesticide_application`
--

LOCK TABLES `season_long_pesticide_application` WRITE;
/*!40000 ALTER TABLE `season_long_pesticide_application` DISABLE KEYS */;
INSERT INTO `season_long_pesticide_application` VALUES (174,322,1,'0',0,1,1,23,1,2,2,2,2,45),(175,323,0,'0',0,0,0,0,0,0,0,0,0,0),(176,324,0,'0',0,0,0,0,0,0,0,0,0,0),(177,325,0,'0',0,0,0,0,0,0,0,0,0,0),(178,326,0,'0',0,0,0,0,0,0,0,0,0,0),(179,327,1,'0',0,1,2,235,3,2,2,2,2,2),(180,330,3,'0',0,1,2,2,1,2,2,2,2,2),(181,331,0,'0',0,0,0,0,0,0,0,0,0,0),(182,332,0,'0',0,0,0,0,0,0,0,0,0,0),(183,333,0,'0',0,0,0,0,0,0,0,0,0,0),(184,334,0,'0',0,0,0,0,0,0,0,0,0,0),(185,335,1,'0',1,1,1,23,2,45,6,7,1,2),(186,338,2,'0',0,0,1,2,2,5,6,2,1,1),(187,339,0,'0',0,0,0,0,0,0,0,0,0,0),(188,340,0,'0',0,0,0,0,0,0,0,0,0,0),(189,341,0,'0',0,0,0,0,0,0,0,0,0,0),(190,342,0,'0',0,0,0,0,0,0,0,0,0,0),(191,343,0,'0',0,0,0,0,0,0,0,0,0,0),(192,346,1,'0',0,1,4,2,2,2,1,5,1,1),(193,347,0,'0',0,0,0,0,0,0,0,0,0,0),(194,348,0,'0',0,0,0,0,0,0,0,0,0,0),(195,349,0,'0',0,0,0,0,0,0,0,0,0,0),(196,350,0,'0',0,0,0,0,0,0,0,0,0,0),(197,351,2,'0',0,0,3,8,2,1,1,1,1,1),(198,354,4,'0',0,1,2,2,2,5,1,2,3,4),(199,355,0,'0',0,0,0,0,0,0,0,0,0,0),(200,356,0,'0',0,0,0,0,0,0,0,0,0,0),(201,357,0,'0',0,0,0,0,0,0,0,0,0,0),(202,358,0,'0',0,0,0,0,0,0,0,0,0,0),(203,359,2,'0',1,0,1,2,1,2,2,1,1,1),(204,362,3,'0',1,0,1,2,2,1,1,1,1,1),(205,363,0,'0',0,0,0,0,0,0,0,0,0,0),(206,364,0,'0',0,0,0,0,0,0,0,0,0,0),(207,365,0,'0',0,0,0,0,0,0,0,0,0,0),(208,366,0,'0',0,0,0,0,0,0,0,0,0,0),(209,367,2,'0',0,1,3,2,2,1,1,2,4,5),(210,370,2,'0',1,0,1,2,2,1,2,3,4,5),(211,371,0,'0',0,0,0,0,0,0,0,0,0,0),(212,372,0,'0',0,0,0,0,0,0,0,0,0,0),(213,373,0,'0',0,0,0,0,0,0,0,0,0,0),(214,374,0,'0',0,0,0,0,0,0,0,0,0,0),(215,375,3,'0',0,1,3,2,2,4,1,1,1,2),(216,379,1,'0',1,1,1,364830,1,3,3,3,0,7493),(217,380,0,'0',0,0,0,0,0,0,0,0,0,0),(218,381,0,'0',0,0,0,0,0,0,0,0,0,0),(219,382,0,'0',0,0,0,0,0,0,0,0,0,0),(220,383,0,'0',0,0,0,0,0,0,0,0,0,0),(221,384,2,'0',1,0,2,2,2,2,4,5,1,1),(222,385,0,'0',0,0,0,0,0,0,0,0,0,0),(223,386,0,'0',0,0,0,0,0,0,0,0,0,0),(224,387,0,'0',0,0,0,0,0,0,0,0,0,0),(225,388,0,'0',0,0,0,0,0,0,0,0,0,0),(226,389,2,'0',0,1,4,23,1,2,4,5,1,2),(227,390,3,'0',1,0,2,24,1,7,7,7,0,70075),(228,394,3,'0',0,1,3,2,2,1,2,4,5,6),(229,395,0,'0',0,0,0,0,0,0,0,0,0,0),(230,396,0,'0',0,0,0,0,0,0,0,0,0,0),(231,397,0,'0',0,0,0,0,0,0,0,0,0,0),(232,398,0,'0',0,0,0,0,0,0,0,0,0,0),(233,399,2,'0',1,0,2,2,2,2,5,6,2,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pesticide_equipment`
--

LOCK TABLES `season_long_pesticide_equipment` WRITE;
/*!40000 ALTER TABLE `season_long_pesticide_equipment` DISABLE KEYS */;
INSERT INTO `season_long_pesticide_equipment` VALUES (53,174,0),(54,179,1),(55,180,0),(56,185,2),(57,185,3),(58,186,3),(59,192,1),(60,197,2),(61,198,2),(62,203,3),(63,204,1),(64,209,2),(65,210,1),(66,215,2),(67,216,0),(68,221,3),(69,226,1),(70,227,1),(71,228,2),(72,233,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pesticide_rice_problems_detail`
--

LOCK TABLES `season_long_pesticide_rice_problems_detail` WRITE;
/*!40000 ALTER TABLE `season_long_pesticide_rice_problems_detail` DISABLE KEYS */;
INSERT INTO `season_long_pesticide_rice_problems_detail` VALUES (62,174,'insect','2016-11-27 00:00:00',23,4,1,'1',0),(63,179,'birds','2016-11-29 00:00:00',2,4,1,'1',0),(64,180,'rats','2016-11-27 00:00:00',2,5,1,'1',0),(65,180,'birds','2016-11-28 00:00:00',2,5,3,'3',0),(66,185,'snails','2016-11-30 00:00:00',2,4,1,'1',0),(67,185,'rats','2016-11-27 00:00:00',2,5,3,'3',0),(68,186,'disease','2016-11-28 00:00:00',2,2,2,'2',0),(69,192,'birds','2016-11-27 00:00:00',2,4,3,'1',0),(70,197,'rats','2016-11-28 00:00:00',2,2,3,'1',0),(71,197,'snails','2016-12-27 00:00:00',1,5,4,'2',0),(72,198,'snails','2016-12-11 00:00:00',2,23,3,'3',0),(73,203,'snails','2016-12-05 00:00:00',2,4,2,'1',0),(74,204,'insect','2016-09-27 00:00:00',2,4,3,'2',0),(75,209,'disease','2016-10-31 00:00:00',1,2,2,'1',0),(76,210,'insect','2016-11-27 00:00:00',2,2,3,'2',0),(77,215,'birds','2016-11-30 00:00:00',2,2,1,'2',0),(78,216,'insect','2016-08-02 00:00:00',246,24688,1,'1',0),(79,221,'snails','2016-10-31 00:00:00',2,4,4,'2',0),(80,226,'snails','2016-11-28 00:00:00',2,3,2,'2',0),(81,227,'disease','2016-11-27 00:00:00',2,2,1,'2',0),(82,228,'disease','2016-12-05 00:00:00',2,4,3,'2',0),(83,233,'insect','2016-11-27 00:00:00',2,2,2,'1',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pesticide_use_efficiency`
--

LOCK TABLES `season_long_pesticide_use_efficiency` WRITE;
/*!40000 ALTER TABLE `season_long_pesticide_use_efficiency` DISABLE KEYS */;
INSERT INTO `season_long_pesticide_use_efficiency` VALUES (3,328,1,2,3,1,3,2,3,3,3,3),(4,336,3,4,4,4,4,4,3,4,3,4),(5,344,1,2,1,1,1,2,2,1,1,1),(6,352,2,3,3,3,3,2,3,2,2,2),(7,360,0,0,0,0,0,0,0,0,0,0),(8,368,2,4,2,3,4,3,3,2,3,2),(9,376,2,3,3,3,2,2,3,1,2,4),(10,391,2,3,2,2,3,3,3,2,2,4),(11,392,1,1,1,1,1,1,1,1,1,1),(12,400,1,3,2,1,1,3,2,3,3,1);
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
  `seed_certified` tinyint(4) NOT NULL DEFAULT '0',
  `import` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index2` (`season_long_id`),
  KEY `index3` (`rice_area`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pre_planting_information`
--

LOCK TABLES `season_long_pre_planting_information` WRITE;
/*!40000 ALTER TABLE `season_long_pre_planting_information` DISABLE KEYS */;
INSERT INTO `season_long_pre_planting_information` VALUES (47,321,100,0,'',2,'Crop','2016-08-29 00:00:00','1',5,29,1,'2016-12-20 00:00:00',1223,1,'BBBB',123,'',1,20000,2498,16,2,'',1,1,1,0),(48,329,555,1,'1M5R',4,'ACC','2016-11-27 00:00:00','2',2,3,1,'2016-11-27 00:00:00',26,3,'23',56,'',2,0,23,24,2,'',2,2,1,0),(49,337,66,0,'',3,'AA','2016-10-31 00:00:00','5',2,5,0,'0000-00-00 00:00:00',0,3,'23',24,'',2,0,2,55,2,'',2,1,0,0),(50,345,2,0,'',2,'CC','2016-09-25 00:00:00','4',2,4,0,'0000-00-00 00:00:00',0,2,'2',5,'',1,2,2,2,2,'',2,2,1,0),(51,353,2,0,'',2,'22','2016-10-31 00:00:00','3',4,0,0,'0000-00-00 00:00:00',0,2,'5',6,'',3,2,2,2,3,'',2,2,1,0),(52,361,221,1,'GlobalGAP',2,'2','2016-11-27 00:00:00','5',1,2,1,'2016-09-25 00:00:00',2,2,'5',1,'',4,0,11,23,2,'',1,1,1,0),(53,369,2,1,'VietGAP',2,'22','2016-11-27 00:00:00','2',1,1,1,'2016-10-30 00:00:00',2,1,'AA',2,'',3,2,11,2,2,'',3,2,1,0),(54,377,3,1,'VietGAP',1,'idk','2016-08-01 00:00:00','1',3,3,1,'2016-08-30 00:00:00',2,1,'idk',2,'',1,350,5,4,1,'',1,1,1,0),(55,378,10,1,'VietGAP',2,'5','2016-10-30 00:00:00','3',25,11,0,'0000-00-00 00:00:00',0,2,'3',2,'',3,2,5,2,3,'',2,2,0,0),(56,393,23,1,'SFLF',3,'4','2016-10-30 00:00:00','2',3,4,1,'2016-12-04 00:00:00',123,2,'4',5,'',3,2,2,2,2,'',2,2,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_pre_planting_information_organic_materials`
--

LOCK TABLES `season_long_pre_planting_information_organic_materials` WRITE;
/*!40000 ALTER TABLE `season_long_pre_planting_information_organic_materials` DISABLE KEYS */;
INSERT INTO `season_long_pre_planting_information_organic_materials` VALUES (145,47,'Compost',2000),(146,47,'Green manure',224),(147,47,'FYM',233),(148,48,'Compost',2),(149,48,'Green manure',5),(150,52,'Previous crop\'s straw',0),(151,52,'Compost',22),(152,53,'Compost',2),(153,53,'FYM',2),(154,54,'Previous crop\'s straw',0),(155,54,'Compost',1),(156,54,'FYM',1),(157,54,'Green manure',2),(158,56,'FYM',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_sowing_transplanting`
--

LOCK TABLES `season_long_sowing_transplanting` WRITE;
/*!40000 ALTER TABLE `season_long_sowing_transplanting` DISABLE KEYS */;
INSERT INTO `season_long_sowing_transplanting` VALUES (24,321,2,'2016-12-23 00:00:00',23,1,2,2,2,2,55,66,1,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0),(25,329,0,'0000-00-00 00:00:00',0,2,1,1,2,0,13,123,144,2,2,11123,123,0,0,0,1,'2016-11-27 00:00:00','2016-12-01 00:00:00',15,0,17,1,0,0,0,0,16,2,1,1,1,1,0,0,0,0,0,0,0),(26,337,2,'2016-11-27 00:00:00',2,2,1,1,0,2,2,4,5,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,0,0,0,0),(27,345,2,'2016-11-27 00:00:00',2,2,2,3,4,5,7,8,9,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0),(28,353,1,'2016-10-30 00:00:00',2,2,5,1,1,1,3,4,5,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0),(29,361,0,'0000-00-00 00:00:00',0,1,1,2,1,1,1,1,1,1,0,2,0,0,0,0,0,'2016-12-04 00:00:00','2016-11-27 00:00:00',0,0,0,0,0,1,1,0,2,0,0,0,0,0,1,1,2,1,1,1,1),(30,369,0,'0000-00-00 00:00:00',0,2,1,1,1,1,2,1,1,1,0,2,0,0,0,0,0,'2016-10-30 00:00:00','2016-10-30 00:00:00',0,0,0,0,0,2,2,2,12,0,0,0,0,0,1,1,2,1,3,4,11),(31,377,1,'2016-12-04 00:00:00',5,2,2,2,2,0,8,3,5,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0),(32,378,2,'2016-10-31 00:00:00',2,2,24,1,3,4,6,7,1,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0),(33,393,2,'2016-11-28 00:00:00',2,2,1,5,2,3,1,5,6,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_weeding_herbicide`
--

LOCK TABLES `season_long_weeding_herbicide` WRITE;
/*!40000 ALTER TABLE `season_long_weeding_herbicide` DISABLE KEYS */;
INSERT INTO `season_long_weeding_herbicide` VALUES (37,322,1,'2016-11-27 00:00:00',2,1,2,2,2,2,44,55,0,0,0,0,0,0,0,0,0,6),(38,327,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,1,1,2,2,2,2,2,5,0,0),(39,330,1,'2016-11-27 00:00:00',22,2,4,5,9,0,2,2,0,0,0,0,0,0,0,0,0,4),(40,335,3,'2016-11-29 00:00:00',2,2,4,2,2,2,1,1,1,1,22,2,2,4,4,5,1,1),(41,338,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,2,1,2,2,2,4,0,2,0,0),(42,343,3,'2016-11-28 00:00:00',2,1,2,1,1,2,2,2,2,1,2,2,1,2,1,2,0,5),(43,346,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,2,1,5,1,1,2,3,5,0,0),(44,351,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,2,1,5,2,5,6,1,2,0,0),(45,354,3,'2016-11-27 00:00:00',2,2,1,2,3,4,6,1,2,1,2,2,2,5,6,3,1,1),(46,357,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(47,359,1,'2016-11-27 00:00:00',2,2,2,3,4,5,6,7,0,0,0,0,0,0,0,0,0,1),(48,362,1,'2016-09-26 00:00:00',2,1,4,1,1,2,3,4,0,0,0,0,0,0,0,0,0,5),(49,367,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,1,1,2,2,2,1,1,1,0,0),(50,370,1,'2016-10-30 00:00:00',2,1,1,2,1,2,3,4,0,0,0,0,0,0,0,0,0,5),(51,375,1,'2016-10-10 00:00:00',2,2,1,2,1,2,111,2,0,0,0,0,0,0,0,0,0,55),(52,379,1,'2016-11-07 00:00:00',3825,1,6,6,6,0,2640,63810,0,0,0,0,0,0,0,0,0,2840603),(53,384,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,2,1,2,5,6,1,2,3,0,0),(54,388,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(55,389,1,'2016-10-31 00:00:00',2,1,2,3,4,5,1,1,0,0,0,0,0,0,0,0,0,1),(56,390,1,'2016-11-27 00:00:00',4849,2,4,4,4,0,74,78,0,0,0,0,0,0,0,0,0,75930),(57,394,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,2,1,23,2,4,1,5,22,0,0),(58,398,0,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(59,399,1,'2016-11-28 00:00:00',2,1,22,4,5,6,1,1,0,0,0,0,0,0,0,0,0,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_weeding_herbicide_application`
--

LOCK TABLES `season_long_weeding_herbicide_application` WRITE;
/*!40000 ALTER TABLE `season_long_weeding_herbicide_application` DISABLE KEYS */;
INSERT INTO `season_long_weeding_herbicide_application` VALUES (50,38,'2016-11-27 00:00:00','ABC','DEF','2',2,1,1),(51,40,'2016-11-29 00:00:00','SAMPLE','TECH','1',2,2,1),(52,41,'2016-11-27 00:00:00','A','D','2',4,5,2),(53,42,'2016-12-12 00:00:00','H','AA','2',2,5,1),(54,43,'2016-11-27 00:00:00','2','A','2',2,2,4),(55,44,'2016-12-05 00:00:00','AA','AA','2',2,1,3),(56,45,'2016-12-06 00:00:00','2','3','4',5,6,2),(57,49,'2016-11-27 00:00:00','1','1','2',3,4,2),(58,53,'2016-12-20 00:00:00','2','2','1',1,2,2),(59,57,'2016-11-28 00:00:00','2','A','2',4,5,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_weeding_herbicide_weeds`
--

LOCK TABLES `season_long_weeding_herbicide_weeds` WRITE;
/*!40000 ALTER TABLE `season_long_weeding_herbicide_weeds` DISABLE KEYS */;
INSERT INTO `season_long_weeding_herbicide_weeds` VALUES (186,40,'Weed'),(187,40,'WW'),(188,45,'AA'),(189,45,'ASD'),(190,45,'AA'),(191,45,'23'),(192,45,'11');
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_women_empowerment`
--

LOCK TABLES `season_long_women_empowerment` WRITE;
/*!40000 ALTER TABLE `season_long_women_empowerment` DISABLE KEYS */;
INSERT INTO `season_long_women_empowerment` VALUES (28,328,2,3,0,2,2,2,2,2,2,1),(29,336,3,3,3,3,3,3,3,3,3,2),(30,344,1,1,1,1,1,1,1,1,2,1),(31,352,2,2,1,1,3,2,2,3,3,1),(32,360,3,1,3,2,3,3,3,2,3,1),(33,368,1,0,3,2,3,2,2,3,3,2),(34,376,1,2,3,2,2,2,2,3,2,1),(35,391,2,0,3,2,3,2,1,2,2,1),(36,392,1,1,1,1,1,1,1,1,1,1),(37,400,2,2,2,2,1,1,2,1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_long_workers_health_safety`
--

LOCK TABLES `season_long_workers_health_safety` WRITE;
/*!40000 ALTER TABLE `season_long_workers_health_safety` DISABLE KEYS */;
INSERT INTO `season_long_workers_health_safety` VALUES (39,328,3,3,1,3,2,3,3,4,2,4),(40,336,3,4,3,4,4,4,3,4,4,6),(41,344,1,1,1,1,1,1,1,1,1,1),(42,352,3,2,2,2,2,3,2,2,3,4),(43,360,2,1,1,3,2,2,2,3,3,2),(44,368,2,2,2,4,2,3,3,2,2,3),(45,376,3,3,3,3,3,3,1,2,3,5),(46,391,2,4,2,2,2,3,2,2,3,3),(47,392,1,1,1,1,1,1,1,1,1,1),(48,400,2,3,2,3,2,2,2,2,2,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villages`
--

LOCK TABLES `villages` WRITE;
/*!40000 ALTER TABLE `villages` DISABLE KEYS */;
INSERT INTO `villages` VALUES (2,2,'Makati',0),(3,3,'Village of US',0),(4,4,'5',0),(5,5,'Village',0),(6,6,'5',0),(7,7,'166',0),(8,8,'5',0),(9,9,'5',0),(10,10,'5',0),(11,11,'14',0),(12,12,'6',0),(13,13,'5',0),(14,14,'4',0),(15,15,'6',0),(16,16,'3',0),(17,17,'4',0),(18,18,'66',0),(19,19,'115',0),(20,20,'8',0),(21,21,'4',0),(22,22,'5',0),(23,23,'A',0),(24,24,'Village',0),(25,25,'555',0),(26,26,'3',0),(27,27,'4',0),(28,28,'4',0),(29,29,'4',0),(30,30,'AA',0),(31,31,'3',0),(32,32,'3',0);
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

-- Dump completed on 2016-12-07  1:09:18
