<?php

define('DB_DIRECTORY', 'db' . DIRECTORY_SEPARATOR);

include_once(DB_DIRECTORY . 'DBConfig.php');
include_once(DB_DIRECTORY . 'DB.php');
include_once(DB_DIRECTORY . 'DBBase.php');
include_once(DB_DIRECTORY . 'DBException.php');
include_once(DB_DIRECTORY . 'MySQLDB.php');
include_once('PHPExcel.php');

class ImportHousehold {
  private $file;

  private $supported = array(
    'application/vnd.ms-excel',
    'application/vnd.ms-excel.addin.macroEnabled.12',
    'application/vnd.ms-excel.sheet.binary.macroEnabled.12',
    'application/vnd.ms-excel.sheet.macroEnabled.12',
    'application/vnd.ms-excel.template.macroEnabled.12',
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
  );

  public function __construct($file) {
    $this->initializeDatabase();
    $this->file = $file;
  }

  protected function initializeDatabase() {
    DB::initialize(DBConfig::getConfig());
    DB::queryMaster('SET autocommit=0;');
    DB::querySlave('SET autocommit=0;');
  }

  public function importFile() {
    if (!in_array($this->file['type'], $this->supported)) {
      throw new Exception('File type is not supported');
    }

    try {
      $inputFileType = PHPExcel_IOFactory::identify($this->file['tmp_name']);
      $objReader = PHPExcel_IOFactory::createReader($inputFileType);
      $objPHPExcel = $objReader->load($this->file['tmp_name']);
    } catch (Exception $e) {
      die('Error loading file "'.pathinfo($this->file['tmp_name'], PATHINFO_BASENAME).'": '.$e->getMessage());
    }

    $sheet = $objPHPExcel->getSheet(0);
    $highestRow = $sheet->getHighestRow();
    $highestColumn = $sheet->getHighestColumn();

    //  Loop through each row of the worksheet in turn
    for ($row = 2; $row <= $highestRow; $row++) {
      DB::startTransaction();
      $data = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
      try {
        $this->insertData($data);
      } catch (Exception $e) {
        echo $e->getMessage();
        DB::rollback();
      }
      DB::commit();
    }
    echo 'success';
  }

  protected function insertData($data) {
    $data = $data[0];
    $farmerName = $this->getFarmerName($data[7]);
    $farmerCountry = $this->getCountryIdByName($data[2]);

    if (!$farmerCountry) {
      throw new Exception('Country ' . $data[2] . ' doesn\'t exist');
    }

    $farmerId = $this->insertFarmer(array(
      'first_name' => $farmerName['first_name'],
      'last_name' => $farmerName['last_name'],
      'countries_id' => $farmerCountry,
    ));

    if (!$farmerId) {
      throw new Exception('Failed to insert farmer ID');
    }

    $seasonId = $this->getSeasonId($data[5]);
    $year = $data[4];

    $farmerSeasonsId = $this->insertFarmerSeason(array(
      'farmers_id' => $farmerId,
      'year' => $year,
      'season_id' => $seasonId,
    ));

    if (!$seasonId) {
      throw new Exception('Failed to insert farmer season');
    }

    $seasonLongId = $this->insertSeasonLong(array(
      'farmers_id' => $farmerId,
      'farmer_seasons_id' => $farmerSeasonsId,
    ));

    if (!$seasonLongId) {
      throw new Exception('Failed to insert farmer season long ID');
    }

    $prePlanting = $this->insertPrePlantingInformation(array(
      'household_survey_id' => $seasonLongId,
      'treatment_name_other' => $data[22],
    ));

    if (!$prePlanting) {
      throw new Exception('Failed to insert farmer season long pre planting information');
    }

    $landPreparation = $this->insertLandPreparation(array(
      'household_survey_id' => $seasonLongId,
      'crop_establishment' => $this->getCropEstablishmentId($data[23]),
    ));

    if (!$landPreparation) {
      throw new Exception('Failed to insert farmer season long land preparation information');
    }

    $farmerComputations = $this->insertFarmerComputations(array(
      'farmers_id' => $farmerId,
      'farmer_seasons_id' => $farmerSeasonsId,
      'grain_yield' => $data[11],
      'seed_rate' => $data[12],
      'net_profit' => $data[13],
      'labor_productivity' => $data[14],
      'nitrogen_amount' => $data[15],
      'phosphorus_amount' => $data[16],
      'nitrogen_use_efficiency' => $data[17],
      'phosphorus_use_efficiency' => $data[18],
      'total_water_productivity_kg_grain' => $data[19],
      'co2_equivalent' => $data[20],
      'pesticide_use_efficiency_score' => $data[21],
    ));

    return true;
  }

  protected function getFarmerName($name) {
    $parts = explode(' ', $name);
    $lastname = array_pop($parts);
    return array(
      'first_name' => implode(' ', $parts),
      'last_name' => $lastname,
    );
  }

  protected function insertFarmer($data) {
    $result = DB::queryMaster('
      INSERT INTO farmers(first_name, last_name, countries_id, import)
      VALUES("%s", "%s", %d, 1)', array(
        $data['first_name'],
        $data['last_name'],
        $data['countries_id'],
      ));

    return $result->insertID();
  }

  protected function getCountryIdByName($country) {
    $result = DB::querySlave('SELECT id from countries where name = "%s"', array(
      trim($country)));
    if ($result->numRows() <= 0) {
      return false;
    }

    $result = $result->fetchFirstRow();
    return $result['id'];
  }

  protected function getSeasonId($season) {
    $season = strtolower($season);

    switch ($season) {
      case 'wet':
        return 1;
      case 'dry':
        return 2;
      case 'early':
        return 3;
      case 'late':
        return 4;
      case 'monsoon':
        return 5;
      case 'summer':
        return 6;
      default:
        return false;
    }
  }

  protected function getCropEstablishmentId($cropEstablishment) {
    $cropEstablishment = strtolower($cropEstablishment);

    switch ($cropEstablishment) {
      case 'dsr':
        return 1;
      default:
        return 2;
    }
  }

  protected function insertFarmerSeason($data) {
    $result = DB::queryMaster('
      INSERT INTO farmer_seasons(farmers_id, seasons_id, year, import, sowing_date)
      VALUES(%d, %d, %d, 1, "%s")', array(
        $data['farmers_id'],
        $data['season_id'],
        $data['year'],
        date('Y-m-d h:i:s', strtotime('-4 months')),
      ));

    return $result->insertID();
  }

  protected function insertSeasonLong($data) {
    $result = DB::queryMaster('
      INSERT INTO household_survey(farmers_id, farmer_seasons_id, import)
      VALUES(%d, %d, 1)', array(
        $data['farmers_id'],
        $data['farmer_seasons_id'],
      ));

    return $result->insertID();
  }

  protected function insertPrePlantingInformation($data) {
    $result = DB::queryMaster('
      INSERT INTO household_survey_pre_planting_information(
        household_survey_id, treatment_name, treatment_name_other, import, parcel_has_treatment)
      VALUES(%d, "Other", "%s", 1, 1)', array(
        $data['household_survey_id'],
        $data['treatment_name_other'],
      ));

    return $result->insertID();
  }

  protected function insertLandPreparation($data) {
    $result = DB::queryMaster('
      INSERT INTO household_survey_land_preparation(household_survey_id, crop_establishment, import)
      VALUES(%d, %d, 1)', array(
        $data['household_survey_id'],
        $data['crop_establishment'],
      ));

    return $result->insertID();
  }

  protected function insertFarmerComputations($data) {
    $result = DB::queryMaster('
      INSERT INTO household_survey_computations(
        farmers_id, farmer_seasons_id, grain_yield,
        seed_rate, net_profit, labor_productivity,
        nitrogen_amount, phosphorus_amount, nitrogen_use_efficiency,
        phosphorus_use_efficiency, total_water_productivity_kg_grain,
        co2_equivalent, pesticide_use_efficiency_score, import)
      VALUES(
        %d, %d, %s,
        %s, %s, %s,
        %s, %s, %s,
        %s, %s, %s, %s, 1)', array(
        $data['farmers_id'],
        $data['farmer_seasons_id'],
        $data['grain_yield'],
        $data['seed_rate'],
        $data['net_profit'],
        $data['labor_productivity'],
        $data['nitrogen_amount'],
        $data['phosphorus_amount'],
        $data['nitrogen_use_efficiency'],
        $data['phosphorus_use_efficiency'],
        $data['total_water_productivity_kg_grain'],
        $data['co2_equivalent'],
        $data['pesticide_use_efficiency_score'],
      ));

    return true;
  }

  public function clearImport() {
    DB::startTransaction();
    DB::queryMaster('DELETE FROM farmers where import = 1 AND id > 0');
    DB::queryMaster('DELETE FROM household_survey_computations WHERE import = 1 AND farmers_id > 0');
    DB::queryMaster('DELETE FROM household_survey_land_preparation  WHERE import = 1 AND id > 0');
    DB::queryMaster('DELETE FROM household_survey_pre_planting_information  WHERE import = 1 AND id > 0');
    DB::queryMaster('DELETE FROM household_survey  WHERE import = 1 AND id > 0');
    DB::queryMaster('DELETE FROM farmer_seasons WHERE import = 1 AND id > 0');
    DB::commit();
  }
}
