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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-17 21:50:56
