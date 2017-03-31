-- MySQL dump 10.13  Distrib 5.6.24, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: field_calculator
-- ------------------------------------------------------
-- Server version 5.5.44-0ubuntu0.14.04.1

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
-- Table structure for table `household_survey`
--

USE field_calculator;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `household_survey_pre_planting_information`
--

DROP TABLE IF EXISTS `household_survey_pre_planting_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_survey_pre_planting_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `household_survey_id` int(11) NOT NULL,
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
  KEY `index2` (`household_survey_id`),
  KEY `index3` (`rice_area`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-11 21:59:28
