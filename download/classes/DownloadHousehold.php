<?php

define('DB_DIRECTORY', 'db' . DIRECTORY_SEPARATOR);

include_once(DB_DIRECTORY . 'DBConfig.php');
include_once(DB_DIRECTORY . 'DB.php');
include_once(DB_DIRECTORY . 'DBBase.php');
include_once(DB_DIRECTORY . 'DBException.php');
include_once(DB_DIRECTORY . 'MySQLDB.php');
include_once('PHPExcel.php');

class DownloadHousehold {
  const COMPUTATIONS_TABLE_NAME = 'household_survey_computations';

  private $spreadsheet;
  private $worksheet;
  private $data;

  public function __construct() {
    $this->data = $_REQUEST;
    $this->initializeDatabase();
    $this->spreadsheet = new PHPExcel();
    $this->spreadsheet->setActiveSheetIndex(0);
    $this->worksheet = $this->spreadsheet->getActiveSheet();
    $this->index();
  }

  public function index() {
    try {
      $this->setHeaders();
      $this->setContent();
      $this->downloadFile();
    } catch (Exception $e) {
      echo $e->getMessage();
    }
  }

  protected function downloadFile() {
    header('Content-type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="Household Survey.xls"');
    $writer = new PHPExcel_Writer_Excel2007($this->spreadsheet);
    $writer->save('php://output');
    exit();
  }

  protected function initializeDatabase() {
    DB::initialize(DBConfig::getConfig());
    DB::queryMaster('SET autocommit=0;');
    DB::querySlave('SET autocommit=0;');
  }

  protected function setHeaders() {
    $headers = $this->getHeaders();
    $start = 'A';
    foreach ($headers as $row) {
      $this->worksheet->setCellValue($start . 1, $row);
      $this->worksheet->getColumnDimension($start)->setAutoSize(true);
      $this->worksheet->getStyle($start . 1)->applyFromArray(
        array('font' => array(
          'bold' => true
        )));
      $start++;
    }
  }

  protected function getHeaders() {
    return array(
      'SN',
      'Farmers_ID',
      'Farmer_Season_ID',
      'Farmers name',
      'Country',
      'Region/Province',
      'Province/District/State/Cities',
      'District/Sub-district/Municipality/Township',
      'Village',

      'Gender',
      'Age',
      'Marital status',
      'Literacy level',
      'Years of schooling',
      'Primary occupation',
      'Secondary occupation',
      'Religion',
      'Contact Number',
      'Attended training during last 6 months',
      'Training related with',
      'Number of times attended training',
      'Total farm income in a year',
      'Total non-farm income in a year',
      'Years involved in rice cultivation/farming',
      'Machineries owned',
      'Ownership status of land',
      'Economic condition',
      'Economic condition change in the last 3 years',
      'Major problems in rice production',

      'Season',
      'Year',
      'Sowing date',
      'Data source',
      'Group name',
      'Rice area (ha)',
      'Does this parcel have any treatment name?',
      'Parcel treatment name',
      'Ownership of the land',
      'Land rent ($/ha)',
      'Previous crop in the field ',
      'Cropping system in the parcel ',
      'Harvesting date of previous crop',
      'Straw management of the previous crop',
      'Straw burning of the previous crop (%)',
      'GPS ID (N)',
      'GPS ID (E)',
      'Straw of the previous crop incorporated? ',
      'Compost amount (kg/ha)',
      'FYM amount (kg/ha)',
      'Green manure amount (kg/ha)',
      'Organic amendment incorporation date',
      'Water regime in the field before rice cultivation',
      'Rice variety',
      'Seed type',
      'Was the seed certified?',
      'Fertility condition of the soil',
      'Irrigation condition of the field',
      'Crop establishment method',
      'Which method of sowing or transplanting was used?',
      'Which method of machine transplanting was used?',
      'Family labor',
      'Hired labor',
      'Both',
      'No. of canal the source of irrigation',
      'No. of pumping the source of irrigation',
      'No. of groundwater the source of irrigation',
      'The field had continuously standing water',
      'The field was dry',
      'The field was alternately wetting and drying',
      'No. of fertilizer application based on LCC',
      'No. of fertilizer application based on RCM recommendation',
      'No. of fertilizer application based on Government recommendation',
      'No. of fertilizer application based on neighboring farmers rec.',
      'No. of fertilizer application based on own past experience',
      'No. of fertilizer application based on others',
      'Number of manual weeding',
      'Number of herbicide application',
      'Number of both manual weeidng and herbicide application',
      'Harvesting and threshing method',
      'Straw management at harvest',
      'Straw used for other purpose or not?',
      'If straw was used, how it was used?',
      'How the grain drying carried out? ',
      'Amount of rainfall during rice growing period (mm)',
      'Irrigation method during the rice growing period',
      'Seed cost ($/ha)',
      'Land preparation cost ($/ha)',
      'Sowing/transplanting cost ($/ha) ',
      'Nursery seedling production cost ($/ha)',
      'Nursery preparation cost for manual transplanting ($/ha)',
      'Nursery preparation cost for machine transplanting ($/ha)',
      'Seedling cost from purchasing or custom hiring ($/ha) ',
      'Irrigation cost ($/ha)',
      'Fertilizer application cost ($/ha) ',
      'Weeding cost ($/ha)',
      'Organic material or manure cost ($/ha)',
      'Seed rate (kg/ha)',
      'Land preparation date ',
      'Nursery establishment date ',
      'Sowing transplanting date',
      'Harvesting date',
      'Threshing date',
      'Seedling age',
      'Crop growing duration',
      'Pesticide cost ($/ha)',
      'Harvesting threshing cost ($/ha)',
      'Cleaning drying cost ($/ha)',
      'Total cost ($/ha)',
      'Straw yield of previous crop (kg/ha)',
      'Grain yield (kg/ha)',
      'Straw yield (kg/ha)',
      'Total gross income ($/ha)',
      'Total number of labor (per ha)',
      'Total male labor (per ha)',
      'Total female labor (per ha)',
      'Total labor above 18 years (per ha)',
      'Total laobr below 18 years (per ha)',
      'Net profit ($/ha)',
      'Labor productivity (kg grain/labor)',
      'Female to male ratio ',
      '<18 to >18 years labor ratio ',
      'Nitrogen amount (kg/ha)',
      'No. of nitrogen application',
      'Phosphorus amount (kg/ha)',
      'No. of phosphorus application ',
      'Potassium amount (kg/ha)',
      'No. of potassium application',
      'Nitrogen use efficiency (kg grain/kg N)',
      'Phosphorus use efficiency (kg grain/kg P)',
      'Potassium use efficiency (kg grain/kg K)',
      'Zn application (kg/ha)',
      'Sulphur application (kg/ha)',
      'Total nitrogen uptake (kg/ha)',
      'Total phosphorus uptake (kg/ha)',
      'Nitrogen use efficiency (Omission method) ',
      'Phosphorus use efficiency (omission method)',
      'Amount of water applied for field preparation (mm)',
      'Water applied during crop growing period (mm)',
      'No. of irrigation applied ',
      'Total water productivity (kg grain/L water)',
      'Total water productivity (L water/kg grain)',
      'Irrigation water productivity (kg grain/L water)',
      'Rainfall water productivity (kg grain/L water)',
      'Methane emission (kg/ha)',
      'CO2 equivalent (kg/ha)',
      'Total number of herbicide application',
      'Total amount of herbicide application (kg or L/ha)',
      'Herbicide score',
      'Herbicide rank',
      'Total number of insecticide application',
      'Total amount of insecticide application (kg or L/ha)',
      'Insecticide score',
      'Insecticide rank ',
      'Total number of fungicide application',
      'Total amount of fungicide application (kg or L/ha)',
      'Fungicide score',
      'Fungicide rank',
      'Total number of molluscicide application',
      'Total amount molluscicide application',
      'Molluscicide score',
      'Molluscicide rank',
      'Total number of rodenticide application',
      'Total amount rodenticide application (kg or L/ha)',
      'Rodenticide score',
      'Rodenticide rank',
      'Total number of all pesticides application ',
      'Total amount of all pesticides application (kg or L/ha)',
      'Total pesticide score (IRRI method)',
      'Pesticide ranking (IRRI method)',
      'Food safety score',
      'Food safety rank',
      'Workers health and safety score',
      'Worker health and safety rank ',
      'Child labor score ',
      'Child labor rank',
      'Women empowerment score',
      'Women empowerment rank ',
      'Pesticide use efficiency score (SRP method)',
      'Pesticide use efficiency rank (SRP method)',
    );
  }

  protected function setContent() {
    $content = $this->getContent();

    $rowCount = 2;
    foreach ($content as $data) {
      $temp = array(
        $rowCount - 1,
        $data['farmers_id'],
        $data['farmer_seasons_id'],
        $data['farmer_name'],
        $data['country'],
        $data['region'],
        $data['province'],
        $data['district'],
        $data['village'],

        $data['gender'],
        $data['age'],
        $data['marital_status'],
        $data['literacy'],
        $data['years_schooling'],
        $data['primary_occupation'],
        $data['secondary_occupation'],
        $data['religion'],
        $data['contact_number'],
        $data['attended_training'],
        $data['training'],
        $data['training_duration'],
        $data['total_income_farm'],
        $data['total_income_non_farm'],
        $data['farming_years'],
        $data['machineries'],
        $data['ownership'],
        $data['economic_condition'],
        $data['economic_condition_change'],
        $data['problems'],

        $data['season'],
        $data['year'],
        $data['sowing_date'],
        'Season Long',
        '',
        $data['rice_area'],
        $data['parcel_has_treatment'],
        $data['parcel_treatment_name'],
        $data['land_rental'],
        $data['rent_cost'],
        $data['previous_crop'],
        $data['cropping_system'],
        $data['previous_crop_harvested'],
        $data['straw_previous_crop_managed'],
        $data['straw_burned'],
        $data['gps_north'],
        $data['gps_east'],
        $data['incorporate_organic_material'],
        $data['compost_amount'],
        $data['fym_amount'],
        $data['green_manure_amount'],
        $data['organic_amendment_date'],
        $data['water_regime'],
        $data['rice_variety_name'],
        $data['seed_type'],
        $data['seed_certified'],
        $data['soil_fertility'],
        $data['irrigation_regime'],
        $data['crop_establishment_method'],
        $data['sowing_method'],
        $data['transplanting_type'],
        $data['family_labor'],
        $data['hired_labor'],
        $data['both_labor'],
        $data['canal'],
        $data['pumping'],
        $data['ground_water'],
        $data['continous_water'],
        $data['dry'],
        $data['alternating'],
        $data['lcc'],
        $data['rcm'],
        $data['government'],
        $data['neighboring'],
        $data['experience'],
        $data['other_based'],
        $data['manual'],
        $data['herbicide'],
        $data['both_manual_herbicide'],
        $data['harvest_threshing_method'],
        $data['rice_managed'],
        $data['straw_sold'],
        $data['straw_used'],
        $data['carried_out'],
        $data['rainfall_amount'],
        $data['total_rainfall'],
        $data['seed_cost'],
        $data['land_preparation_cost'],
        $data['sowing_transplanting_cost'],
        $data['nursery_seedling_production_cost'],
        $data['nursery_preparation_cost'],
        $data['nursery_preparation_machine_transplanting_cost'],
        $data['purchased_seedling_cost'],
        $data['irrigation_cost'],
        $data['fertilizer_application_cost'],
        $data['weeding_cost'],
        $data['organic_material_cost'],
        $data['seed_rate'],
        $data['land_preparation_date'],
        $data['nursery_establishment_date'],
        $data['sowing_transplanting_date'],
        $data['harvesting_date'],
        $data['threshing_date'],
        $data['seedling_age'],
        $data['crop_growing_duration'],
        $data['pesticide_cost'],
        $data['harvesting_threshing_cost'],
        $data['cleaning_drying_cost'],
        $data['total_cost'],
        $data['straw_yield_previous_crop'],
        $data['grain_yield'],
        $data['straw_yield'],
        $data['total_gross_income'],
        $data['total_labor'],
        $data['total_male_labor'],
        $data['total_female_labor'],
        $data['total_above_18_labor'],
        $data['total_below_18_labor'],
        $data['net_profit'],
        $data['labor_productivity'],
        $data['female_to_male_ratio'],
        $data['below_to_above_18_ratio'],
        $data['nitrogen_amount'],
        $data['nitrogen_count'],
        $data['phosphorus_amount'],
        $data['phosphorus_count'],
        $data['potassium_amount'],
        $data['potassium_count'],
        $data['nitrogen_use_efficiency'],
        $data['phosphorus_use_efficiency'],
        $data['potassium_use_efficiency'],
        $data['zn_application'],
        $data['sulphur_application'],
        $data['total_nitrogen_uptake'],
        $data['total_phosphorus_uptake'],
        $data['nitrogen_use_efficiency_method_two'],
        $data['phosphorus_use_efficiency_method_two'],
        $data['water_applied_field_preparation'],
        $data['water_applied_crop_growing'],
        $data['irrigation_applied_count'],
        $data['total_water_productivity_kg_grain'],
        $data['total_water_productivity_litre_water'],
        $data['total_irrigation_water_productivity'],
        $data['rainfall_water_productivity'],
        /*$data['sfo'],*/
        $data['methane_emission'],
        $data['co2_equivalent'],
        $data['total_number_herbicide_application'],
        $data['total_amount_herbicide_application'],
        $data['herbicide_score'],
        $data['herbicide_rank'],
        $data['total_number_insecticide_application'],
        $data['total_amount_insecticide_application'],
        $data['insecticide_score'],
        $data['insecticide_rank'],
        $data['total_number_fungicide_application'],
        $data['total_amount_fungicide_application'],
        $data['fungicide_score'],
        $data['fungicide_rank'],
        $data['total_number_molluscicide_application'],
        $data['total_amount_molluscicide_application'],
        $data['molluscicide_score'],
        $data['molluscicide_rank'],
        $data['total_number_rodenticide_application'],
        $data['total_amount_rodenticide_application'],
        $data['rodenticide_score'],
        $data['rodenticide_rank'],
        $data['total_number_pesticide_application'],
        $data['total_amount_pesticide_application'],
        $data['total_score_pesticide_application'],
        $data['pesticide_ranking'],
        $data['food_safety_score'],
        $data['food_safety_rank'],
        $data['worker_health_and_safety_score'],
        $data['worker_health_and_safety_rank'],
        $data['child_labor_score'],
        $data['child_labor_rank'],
        $data['women_empowerment_score'],
        $data['women_empowerment_rank'],
        $data['pesticide_use_efficiency_score'],
        $data['pesticide_use_efficiency_rank'],
      );

      $start = 'A';
      foreach ($temp as $value) {
        $this->worksheet->setCellValue($start . $rowCount, $value);
        $this->worksheet->getColumnDimension($start)->setAutoSize(true);
        $start++;
      }

      $rowCount++;
    }
    /*exit();*/
  }

  protected function getContent() {
    $sql = '
      SELECT slc.*,
        sglc.id as ge_id, sglc.gender, sglc.age, sglc.marital_status,
        sglc.literacy, sglc.years_schooling, sglc.primary_occupation,
        sglc.primary_occupation_others, sglc.secondary_occupation,
        sglc.secondary_occupation_others, sglc.religion,
        sglc.religion_others, sglc.contact_number, sglc.attended_training,
        sglc.training, sglc.training_others, sglc.training_duration,
        sglc.total_income_farm, sglc.total_income_non_farm, sglc.farming_years,
        sglc.machineries, sglc.ownership, sglc.economic_condition,
        sglc.economic_condition_change
      FROM farmers f
        INNER JOIN farmer_seasons fs ON f.id = fs.farmers_id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_computations slc ON f.id = slc.farmers_id
          AND fs.id = slc.farmer_seasons_id
        INNER JOIN household_survey_general_information sglc on sglc.household_survey_id = sl.id
      WHERE true = true';

    if (isset($this->data['country_ids'])) {
      $sql .= ' AND f.countries_id IN (' . implode(',', $this->data['country_ids']) . ')';
    }
    if (isset($this->data['year_ids'])) {
      $sql .= ' AND fs.year IN (' . implode(',', $this->data['year_ids']) . ')';
    }

    if (isset($this->data['season_ids'])) {
      $sql .= ' AND fs.seasons_id IN (' . implode(',', $this->data['season_ids']) . ')';
    }

    $result = DB::queryMaster($sql);

    if ($result->numRows() <= 0) {
      return array();
    }

    $data = $result->fetch();

    $return = array();
    foreach ($data as $value) {
      $prePlantingInformation = $this->getPrePlantingInformation(
        $value['farmers_id'],
        $value['farmer_seasons_id']);

      if ($prePlantingInformation === false) {
        continue;
      }

      $landPreparationSowingTransplanting = $this->getLandPreparationSowingTransplanting(
        $value['farmers_id'],
        $value['farmer_seasons_id']);

      if ($landPreparationSowingTransplanting === false) {
        continue;
      }

      $harvestingThreshing = $this->getHarvestingThreshing(
        $value['farmers_id'],
        $value['farmer_seasons_id']);

      if ($harvestingThreshing === false) {
        continue;
      }

      $grainYield = $this->getGrainYield(
        $value['farmers_id'],
        $value['farmer_seasons_id']);

      if ($grainYield === false) {
        continue;
      }

      $cleaningDrying = $this->getCleaningDrying($value['farmers_id'], $value['farmer_seasons_id']);

      $irrigationCount = array(
        'canal' => $this->getIrrigationCount($value['farmers_id'], $value['farmer_seasons_id'], 1),
        'pumping' => $this->getIrrigationCount($value['farmers_id'], $value['farmer_seasons_id'], 3),
        'ground_water' => $this->getIrrigationCount($value['farmers_id'], $value['farmer_seasons_id'], 2),
      );

      $irrigationConditionCount = array(
        'continous_water' => $this->getIrrigationConditionCount($value['farmers_id'], $value['farmer_seasons_id'], 1),
        'dry' => $this->getIrrigationConditionCount($value['farmers_id'], $value['farmer_seasons_id'], 2),
        'alternating' => $this->getIrrigationConditionCount($value['farmers_id'], $value['farmer_seasons_id'], 3),
      );

      $fertilizerApplication = array(
        'lcc' => $this->getFertilizerApplication($value['farmers_id'], $value['farmer_seasons_id'], 1),
        'rcm' => $this->getFertilizerApplication($value['farmers_id'], $value['farmer_seasons_id'], 2),
        'government' => $this->getFertilizerApplication($value['farmers_id'], $value['farmer_seasons_id'], 3),
        'neighboring' => $this->getFertilizerApplication($value['farmers_id'], $value['farmer_seasons_id'], 4),
        'experience' => $this->getFertilizerApplication($value['farmers_id'], $value['farmer_seasons_id'], 5),
        'other_based' => $this->getFertilizerApplication($value['farmers_id'], $value['farmer_seasons_id'], 6),
      );

      $weedingControl = array(
        'manual' => $this->getWeedControl($value['farmers_id'], $value['farmer_seasons_id'], 1),
        'herbicide' => $this->getWeedControl($value['farmers_id'], $value['farmer_seasons_id'], 2),
        'both_manual_herbicide' => $this->getWeedControl($value['farmers_id'], $value['farmer_seasons_id'], 3),
      );

      $generalInformation = array(
        'gender' => $this->getGender($value['gender']),
        'age' => $value['age'],
        'marital_status' => $this->getMaritalStatus($value['marital_status']),
        'literacy' => $this->getLiteracyLevel($value['literacy']),
        'years_schooling' => $value['years_schooling'],
        'primary_occupation' => $this->getPrimaryOccupation($value['primary_occupation'], $value['primary_occupation_others']),
        'secondary_occupation' => $this->getPrimaryOccupation($value['secondary_occupation'], $value['secondary_occupation_others']),
        'religion' => $this->getReligion($value['religion'], $value['religion_others']),
        'contact_number' => $value['contact_number'],
        'attended_training' => $value['attended_training'] == 1 ? 'Yes' : 'No',
        'training' => $this->getTraining($value['training'], $value['training_others']),
        'training_duration' => $value['training_duration'],
        'total_income_farm' => $value['total_income_farm'],
        'total_income_non_farm' => $value['total_income_non_farm'],
        'farming_years' => $value['farming_years'],
        'machineries' => $this->getMachineries($value['machineries']),
        'ownership' => $this->getOwnership($value['ownership']),
        'economic_condition' => $this->getEconomicCondition($value['economic_condition']),
        'economic_condition_change' => $this->getEconomicCondition3Years($value['economic_condition_change']),
        'problems' => $this->getProblems($value['ge_id']),
      );

      $value = array_merge(
        $value,
        $prePlantingInformation,
        $landPreparationSowingTransplanting,
        $irrigationCount,
        $irrigationConditionCount,
        $fertilizerApplication,
        $weedingControl,
        $harvestingThreshing,
        $grainYield,
        $cleaningDrying,
        $generalInformation
      );
      $return[] = $value;
    }

    /*echo '<pre>' . print_r($return, true) . '</pre>';*/

    return $return;
  }

  protected function getGender($value) {
    switch ($value) {
      case 1:
        return 'Male';
      case 2:
        return 'Female';
      default:
        return '';
    }
  }

  protected function getMaritalStatus($value) {
    switch ($value) {
      case 1:
        return 'Single (never married)';
      case 2:
        return 'Married';
      case 3:
        return 'Divorced';
      case 4:
        return 'Widow/widower';
      default:
        return '';
    }
  }

  protected function getLiteracyLevel($value) {
    switch ($value) {
      case 1:
        return 'Cannot read and write';
      case 2:
        return 'Can sign only';
      case 3:
        return 'Can read only';
      case 4:
        return 'Can read and write';
      default:
        return '';
    }
  }

  protected function getPrimaryOccupation($value, $other) {
    switch ($value) {
      case 1:
        return 'Jobless';
      case 2:
        return 'Farmer';
      case 3:
        return 'Tailor/weaver/sewer';
      case 4:
        return 'Agriculture laborer';
      case 5:
        return 'Carpentry/masonry';
      case 6:
        return 'Driver';
      case 7:
        return 'Community/village officer';
      case 8:
        return 'Teacher';
      case 9:
        return 'Factory worker';
      case 10:
        return $other;
      default:
        return '';
    }
  }

  protected function getReligion($value, $other) {
    switch ($value) {
      case 1:
        return 'Buddhist';
      case 2:
        return 'Christian';
      case 3:
        return 'Hindu';
      case 4:
        return 'Muslim';
      case 5:
        return 'No religion';
      case 6:
        return $other;
      default:
        return '';
    }
  }

  protected function getTraining($value, $other) {
    switch ($value) {
      case 1:
        return 'General agriculture';
      case 2:
        return 'Rice (anything related)';
      case 3:
        return 'Pesticide use';
      case 4:
        return 'Vegetable crops';
      case 5:
        return $other;
      default:
        return '';
    }
  }

  protected function getMachineries($value) {
    switch ($value) {
      case 1:
        return 'Four wheel tractor';
      case 2:
        return 'Two-wheel tractor/power tiller';
      case 3:
        return 'Truck';
      case 4:
        return 'Blade harrow';
      case 5:
        return 'Treadle harrow';
      case 6:
        return 'Rower pump';
      case 7:
        return 'Sprinkler';
      case 8:
        return 'Submersible pump';
      case 9:
        return 'Electric motor pump';
      case 10:
        return 'Diesel motor pump';
      case 11:
        return 'Rice transplanting machine';
      case 12:
        return 'Seed drill';
      case 13:
        return 'Drum seeder';
      case 14:
        return 'Rotovator';
      case 15:
        return 'Weeder';
      case 16:
        return 'Power sprayer';
      case 17:
        return 'Harvester';
      case 18:
        return 'Thresher';
      case 19:
        return 'Mechanical thresher';
      case 20:
        return 'Combined harvester and thresher';
      default:
        return '';
    }
  }

  protected function getOwnership($value) {
    switch ($value) {
      case 1:
        return 'Own operated';
      case 2:
        return 'Rented/leased in cash/kind';
      case 3:
        return 'Rented/leased in/share';
      case 4:
        return 'Rented leased out/share';
      case 5:
        return 'Rented leased/out cash';
      case 6:
        return 'Mortgaged in';
      case 7:
        return 'Mortgaged out';
      default:
        return '';
    }
  }

  protected function getEconomicCondition($value) {
    switch ($value) {
      case 1:
        return 'Rice';
      case 2:
        return 'Average';
      case 3:
        return 'Poor';
      case 4:
        return 'Very poor';
      default:
        return '';
    }
  }

  protected function getEconomicCondition3Years($value) {
    switch ($value) {
      case 1:
        return 'Improve';
      case 2:
        return 'Unchanged';
      case 3:
        return 'Get worse';
      default:
        return '';
    }
  }

  protected function getProblems($id) {
    $result = DB::queryMaster('
      SELECT problem from household_survey_general_information_problems
      WHERE household_survey_general_information_id = %d
      ', array($id));

    if ($result->numRows() <= 0) {
      return '';
    }

    $result = $result->fetch();

    $return = array();
    foreach ($result as $value) {
      $return[] = $value['problem'];
    }

    return implode($return, ', ');
  }

  protected function getCleaningDrying($farmerId, $farmerSeasonId) {
    $result = DB::queryMaster('
      SELECT gy.*
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_cleaning_drying gy ON gy.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $farmerId,
        $farmerSeasonId,
      ));

    if ($result->numRows() <= 0) {
      return array();
    }

    $result = $result->fetchFirstRow();

    return array(
      'carried_out' => $this->getDryThreshedGrain($result['dry_threshed_grain']),
    );

  }

  protected function getDryThreshedGrain($value) {
    $value = (int) $value;

    switch ($value) {
      case 1:
        return 'Sun drying';
      case 2:
        return 'Mechanical flat bed dryer';
      case 3:
        return 'Mechanical columnar dryer';
      case 4:
        return 'Bubble dryer';
      case 5:
        return 'None';
      default:
        return '';
    }
  }

  protected function getGrainYield($farmerId, $farmerSeasonId) {
    $result = DB::queryMaster('
      SELECT gy.*
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_grain_and_straw_yield gy ON gy.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $farmerId,
        $farmerSeasonId,
      ));

    if ($result->numRows() <= 0) {
      return array();
    }

    $result = $result->fetchFirstRow();

    return array(
      'straw_sold' => $result['straw_sold'] == 1 ? 'Yes' : 'No',
      'straw_used' => $this->getStrawUsed($result['straw_handled']),
      'rainfall_amount' => $result['total_rainfall'],
      'irrigation_method' => $this->getIrrigationMethod($result['irrigation_method']),
    );

  }

  protected function getIrrigationMethod($value) {
    $value = (int) $value;

    switch ($value) {
      case 1:
        return 'Irrigated - continuously flooded';
      case 2:
        return 'Irrigated - Intermittently flooded - single aeration';
      case 3:
        return 'Irrigated - Intermittently flooded - multiple aeration';
      case 4:
        return 'Regular rainfed';
      case 5:
        return 'Regular drought prone';
      case 6:
        return 'Deep water';
      case 7:
        return 'Irrigated - but water regime during rice cultivation unknown';
      case 8:
        return 'Rainfed or deep water and water regime during the rice cultivation period unknown';
      case 9:
        return 'Upland';
      default:
        return '';
    }
  }

  protected function getStrawUsed($value) {
    $value = (int) $value;

    switch ($value) {
      case 1:
        return 'Incorporated in the field';
      case 2:
        return 'Animal feeding';
      case 3:
        return 'Mushroom cultivation';
      case 4:
        return 'Burned';
      default:
        return '';
    }
  }

  protected function getHarvestingThreshing($farmerId, $farmerSeasonId) {
    $result = DB::queryMaster('
      SELECT ht.*
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_harvesting_threshing ht ON ht.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $farmerId,
        $farmerSeasonId,
      ));

    if ($result->numRows() <= 0) {
      return array();
    }

    $result = $result->fetchFirstRow();

    return array(
      'harvest_threshing_method' => $this->getHarvestingThreshingMethod($result['harvesting_method']),
      'rice_managed' => $this->getRiceManaged($result['rice_managed']),
    );
  }

  protected function getRiceManaged($method) {
    $method = (int) $method;

    switch ($method) {
      case 1:
        return 'Retained in pile, not returned to field, and not burnt';
      case 2:
        return 'Removed from field and used for other purposes';
      case 3:
        return 'Returned to field and spread across';
      case 4:
        return '50% (20-30 cm standing stubble) retained in the field and all incorporated';
      case 5:
        return '50% (20-30 cm standing stubble) retained in the field and all incorporated';
      case 6:
        return '50% (20-30 cm standing stubble) retained in the field and all burned';
      default:
        return '';
    }
  }

  protected function getHarvestingThreshingMethod($method) {
    $method = (int) $method;

    switch ($method) {
      case 1:
        return 'Combine harvesting and threshing';
      case 2:
        return 'Manual cutting and manual threshing';
      case 3:
        return 'Manual cutting and mechanical threshing';
      case 4:
        return 'Mechanical cutting and mechanical threshing';
      default:
        return '';
    }
  }

  protected function getWeedControl($farmerId, $farmerSeasonId, $condition) {
    $result = DB::queryMaster('
      SELECT wh.id
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_weeding_herbicide wh ON wh.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f AND wh.control_weed = %d', array(
        $farmerId,
        $farmerSeasonId,
        $condition,
      ));

    return $result->numRows();
  }

  protected function getFertilizerApplication($farmerId, $farmerSeasonId, $condition) {
    $result = DB::queryMaster('
      SELECT fa.id
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application fa ON fa.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f AND fa.fertilizer_application = %d', array(
        $farmerId,
        $farmerSeasonId,
        $condition,
      ));

    return $result->numRows();
  }

  protected function getIrrigationConditionCount($farmerId, $farmerSeasonId, $condition) {
    $result = DB::queryMaster('
      SELECT si.id
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_irrigation si ON si.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f AND si.water_condition = %d', array(
        $farmerId,
        $farmerSeasonId,
        $condition,
      ));

    return $result->numRows();
  }

  protected function getIrrigationCount($farmerId, $farmerSeasonId, $source) {
    $result = DB::queryMaster('
      SELECT si.id
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_irrigation si ON si.household_survey_id = sl.id
        INNER JOIN household_survey_irrigation_period sip ON sip.household_survey_irrigation_id = si.id
      WHERE f.id = %f AND fs.id = %f AND sip.source = %d', array(
        $farmerId,
        $farmerSeasonId,
        $source,
      ));

    return $result->numRows();
  }

  protected function getLaborCount($farmerId, $farmerSeasonId, $laborType) {
    $result = DB::queryMaster('
      SELECT (
        IFNULL(SUM(sllp.labor_type),0) +
        IFNULL(SUM(sls.labor_type),0) +
        IFNULL(SUM(sls.seedling_labor_type),0) +
        IFNULL(SUM(sls.nursery_labor_type),0) +
        IFNULL(SUM(slf.male_labor),0) +
        IFNULL(SUM(slw.weeding_labor),0) +
        IFNULL(SUM(slw.herbicide_labor),0) +
        IFNULL(SUM(slpa.labor_type),0) +
        IFNULL(SUM(slht.labor_type),0) +
        IFNULL(SUM(sli.labor_type),0) +
        IFNULL(SUM(slc.labor_type),0)) / %d as labor_count
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        LEFT JOIN household_survey_land_preparation sllp ON sllp.household_survey_id = sl.id
          AND sllp.labor_type = %d
        LEFT JOIN household_survey_sowing_transplanting sls ON sls.household_survey_id = sl.id
          AND (sls.labor_type = %d OR sls.seedling_labor_type = %d OR sls.nursery_labor_type = %d)
        LEFT JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
          AND slf.labor_type = %d
        LEFT JOIN household_survey_weeding_herbicide slw ON slw.household_survey_id = sl.id
          AND (slw.weeding_labor = %d OR slw.herbicide_labor = %d)
        LEFT JOIN household_survey_pesticide_application slpa ON slpa.household_survey_id = sl.id
          AND slpa.labor_type = %d
        LEFT JOIN household_survey_harvesting_threshing slht ON slht.household_survey_id = sl.id
          AND slht.labor_type = %d
        LEFT JOIN household_survey_cleaning_drying slc ON slc.household_survey_id = sl.id
          AND slc.labor_type = %d
        LEFT JOIN household_survey_irrigation sli ON sli.household_survey_id = sl.id
          AND sli.labor_type = %d
      WHERE f.id = %f AND fs.id = %f', array(
        $laborType,
        $laborType,
        $laborType,
        $laborType,
        $laborType,
        $laborType,
        $laborType,
        $laborType,
        $laborType,
        $laborType,
        $laborType,
        $laborType,
        $farmerId,
        $farmerSeasonId
      ));

    if ($result->numRows() <= 0) {
      return 0;
    }

    $result = $result->fetchFirstRow();

    return $result['labor_count'];
  }

  protected function getLandPreparationSowingTransplanting($farmerId, $farmerSeasonId) {
    $result = DB::queryMaster('
      SELECT lp.crop_establishment,
        st.direct_sowing_method,
        st.transplanting_carried_out
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_land_preparation lp ON lp.household_survey_id = sl.id
        INNER JOIN household_survey_sowing_transplanting st ON st.household_survey_id = sl.id
      WHERE f.id = %d AND fs.id = %d', array(
        $farmerId,
        $farmerSeasonId,
      ));


    if ($result->numRows() <= 0) {
      return array();
    }

    $result = $result->fetchFirstRow();

    return array(
      'crop_establishment_method' => $this->getCropEstablishmentMethod($result['crop_establishment']),
      'sowing_method' => $this->getSowingMethod($result['crop_establishment'], $result['direct_sowing_method']),
      'transplanting_type' => $this->getTransplantingType($result['transplanting_carried_out']),
      'family_labor' => $this->getLaborCount($farmerId, $farmerSeasonId, 1),
      'hired_labor' => $this->getLaborCount($farmerId, $farmerSeasonId, 2),
      'both_labor' => $this->getLaborCount($farmerId, $farmerSeasonId, 3),
    );
  }

  protected function getCropEstablishmentMethod($value) {
    $value = (int) $value;

    switch ($value) {
      case 1:
        return 'Direct Sowing';
      case 2:
        return 'Transplanting';
      default:
        return '';
    }
  }

  protected function getSowingMethod($cropMethod, $sowingMethod) {
    $cropMethod = (int) $cropMethod;
    $sowingMethod = (int) $sowingMethod;

    if ($cropMethod == 1) {
      switch ($sowingMethod) {
        case 1:
          return 'Dry soil tillage and direct sowing of seed (Dry-DSR)';
        case 2:
          return 'Wet tillage and direct sowing of soaked seed (Wet-DSR)';
        default:
          return '';
      }
    }

    if ($cropMethod == 2) {
      switch ($sowingMethod) {
        case 1:
          return 'Transplanting by the labor';
        case 2:
          return 'Transplanting by machine';
        default:
          return '';
      }
    }
  }

  protected function getTransplantingType($value) {
    $value = (int) $value;

    switch ($value) {
      case 1:
        return 'Own transplanting machine';
      case 2:
        return 'Hired transplanting machine';
      case 3:
        return 'Custom hiring of seeding and transplanting machine (together)';
      default:
        return '';
    }
  }

  protected function getPrePlantingInformation($farmerId, $farmerSeasonId) {
    $result = DB::queryMaster('
      SELECT pp.*,
        fs.seasons_id,
        cs.exchange_rate,
        CONCAT(f.first_name, " ", f.last_name) as farmer_name,
        c.name as country,
        r.name as region,
        p.name as province,
        d.name as district,
        v.name as village,
        fs.seasons_id,
        fs.sowing_date,
        fs.year
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pre_planting_information pp ON pp.household_survey_id = sl.id
        INNER JOIN countries c ON f.countries_id = c.id
        INNER JOIN currencies cs ON cs.id = c.currencies_id
        LEFT JOIN region_provinces r ON c.id = r.countries_id AND f.region_provinces_id = r.id
        LEFT JOIN province_districts p ON p.region_provinces_id = r.id AND p.id = f.province_districts_id
        LEFT JOIN district_municipalities d ON d.province_districts_id = p.id AND f.district_municipalities_id = d.id
        LEFT JOIN villages v ON v.district_municipalities_id = d.id AND f.villages_id = v.id
      WHERE f.id = %d AND fs.id = %d', array(
        $farmerId,
        $farmerSeasonId,
      ));

    if ($result->numRows() <= 0) {
      return array();
    }

    $data = $result->fetchFirstRow();

    $result = DB::queryMaster('
      SELECT *
      FROM household_survey_pre_planting_information_organic_materials
      WHERE household_survey_pre_planting_information_id = %d
    ', array($data['id']));

    $organicMaterials = array(
      'Previous crop\'s straw' => 0,
      'Compost' => 0,
      'FYM' => 0,
      'Green Manure' => 0,
    );
    if ($result->numRows() > 0) {
      $result = $result->fetch();
      foreach ($result as $value) {
        $organicMaterials[$value['name']] = (int) $value['amount'];
      }
    }

    $return['farmer_name'] = $data['farmer_name'];
    $return['country'] = $data['country'];
    $return['region'] = $data['region'];
    $return['province'] = $data['province'];
    $return['district'] = $data['district'];
    $return['village'] = $data['village'];
    $return['season'] = $this->getSeasonString($data['seasons_id']);
    $return['year'] = $data['year'];
    $return['rice_area'] = (int) $data['rice_area'];
    $return['sowing_date'] = date('M j, Y', strtotime($data['sowing_date']));
    $return['parcel_has_treatment'] = $data['parcel_has_treatment'] == 1 ? 'Yes' : 'No';
    $return['parcel_treatment_name'] = $data['treatment_name'] == 'Other' ? $data['treatment_name_other'] : $data['treatment_name'];
    $return['land_rental'] = $this->getLandRentalString($data['land_rental']);
    $return['rent_cost'] = (int) ($data['rent_cost'] / $data['rice_area'] / $data['exchange_rate']);
    $return['previous_crop'] = $this->getPreviousCrop($data['previous_crop']);
    $return['cropping_system'] = $data['cropping_system'];
    $return['previous_crop_harvested'] = date('M j, Y', strtotime($data['previous_crop_harvested']));
    $return['straw_previous_crop_managed'] = $this->getStrawPreviousCropManaged($data['straw_previous_crop_managed']);
    $return['straw_burned'] = $data['straw_burned'];
    $return['gps_north'] = $data['gps_north'];
    $return['gps_east'] = $data['gps_east'];
    $return['incorporate_organic_material'] = $data['incorporate_organic_material'] == 1 ? 'Yes' : 'No';
    $return['compost_amount'] = $organicMaterials['Compost'] / $data['rice_area'];
    $return['fym_amount'] = $organicMaterials['FYM'] / $data['rice_area'];
    $return['green_manure_amount'] = $organicMaterials['Green Manure'] / $data['rice_area'];
    $return['organic_amendment_date'] = date('M j, Y', strtotime($data['organic_materials_incorporated']));
    $return['water_regime'] = $this->getWaterRegime($data['water_regime']);
    $return['rice_variety_name'] = $data['rice_variety_name'];
    $return['seed_type'] = $this->getSeedTypes($data['seed_type']);
    $return['seed_certified'] = $data['seed_certified'] == 1 ? 'Yes' : 'No';
    $return['soil_fertility'] = $this->getSoilFertility($data['soil_fertility']);
    $return['irrigation_regime'] = $this->getIrrigationRegime($data['irrigation_regime']);
    return $return;
  }

  protected function getLandRentalString($value) {
    $value = (int) $value;

    switch ($value) {
      case 1:
        return 'Rented';
      case 2:
        return 'Own';
      case 3:
        return 'Contract';
      case 4:
        return 'Share tenant';
      default:
        return '';
    }
  }

  protected function getSeasonString($value) {
    $value = (int) $value;

    switch ($value) {
      case 1:
        return 'Wet';
      case 2:
        return 'Dry';
      case 3:
        return 'Early';
      case 4:
        return 'Late';
      case 5:
        return 'Monsoon';
      case 6:
        return 'Summer';
      default:
        return '';
    }
  }

  protected function getPreviousCrop($value) {
    $value = (int) $value;

    switch ($value) {
      case 1:
        return 'Rice';
      case 2:
        return 'Wheat';
      case 3:
        return 'Maize';
      case 4:
        return 'Vegetable';
      case 5:
        return 'Potato';
      default:
        return '';
    }
  }

  protected function getStrawPreviousCropManaged($value) {
    $value = (int) $value;

    switch ($value) {
      case 1:
        return 'Retained in pile, not returned to field, and not burnt';
      case 2:
        return 'Retained in pile, and burnt';
      case 3:
        return 'Removed from field and used for other purposes';
      case 4:
        return 'Returned to field and spread across';
      case 5:
        return '50% (20-30 cm standing stubble) retained in the field and all incorporated';
      case 6:
        return '50% (20-30 cm standing stubble) retained in the field and all burned';
      default:
        return '';
    }
  }

  protected function getWaterRegime($value) {
    $value = (int) $value;

    switch ($value) {
      case 1:
        return 'Non flooded pre-season was less than 180 days';
      case 2:
        return 'Non flooded pre-season was more than 180 days';
      case 3:
        return 'Flooded preseason was more than 30 days';
      case 4:
        return 'I do not know the condition';
      default:
        return '';
    }
  }

  protected function getSeedTypes($value) {
    $value = (int) $value;

    switch ($value) {
      case 1:
        return 'Hybrid';
      case 2:
        return 'Own saved';
      case 3:
        return 'Local variety';
      case 4:
        return 'Government released variety';
      case 5:
        return 'Farmer to farmer exchange';
      default:
        return '';
    }
  }

  protected function getSoilFertility($value) {
    $value = (int) $value;

    switch ($value) {
      case 1:
        return 'Highly fertile';
      case 2:
        return 'Medium fertility';
      case 3:
        return 'Low fertility';
      default:
        return '';
    }
  }

  protected function getIrrigationRegime($value) {
    $value = (int) $value;

    switch ($value) {
      case 1:
        return 'Irrigated';
      case 2:
        return 'Rainfed';
      default:
        return '';
    }
  }
}
