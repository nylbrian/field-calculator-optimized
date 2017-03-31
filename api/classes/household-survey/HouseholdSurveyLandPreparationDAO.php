<?php

class HouseholdSurveyLandPreparationDAO {
  const MAIN_TABLE = 'household_survey_land_preparation';
  const OPERATIONS_TABLE = 'household_survey_land_preparation_operations';

  public function checkRecordExists($seasonLongId) {
    $result = DB::queryMaster('SELECT id from '.self::MAIN_TABLE.' WHERE household_survey_id = %d', array($seasonLongId));
    return $result->fetchFirstRow();
  }

  public function insert($data, $seasonLongId) {
    $checkId = $this->checkRecordExists($seasonLongId);
    if ($checkId) {
      $data['id'] = $checkId['id'];
    }

    if (isset($data['id'])) {
      return $this->update($data['id'], $data, $seasonLongId);
    }

    DB::startTransaction();

    $sql = 'INSERT INTO `' . self::MAIN_TABLE . '`
      (`household_survey_id`, `crop_establishment`, `land_preparation_started`,
      `tractor_cost`, `labor_type`, `male_labor_count`, `female_labor_count`,
      `above_18_years_old_count`, `below_18_years_old_count`, `labor_total_cost`,
      `wage_rate_per_day_male`, `wage_rate_per_day_female`)
      VALUES
      (%d, %d, "%s", %d, %d, %d, %d, %d, %d, %d, %d, %d)';

    $params = array(
      $seasonLongId,
      $data['crop_establishment'],
      $data['land_preparation_started'],
      $data['tractor_cost'],
      $data['labor_type'],
      $data['male_labor_count'],
      $data['female_labor_count'],
      $data['above_18_years_old_count'],
      $data['below_18_years_old_count'],
      $data['labor_total_cost'],
      $data['wage_rate_per_day_male'],
      $data['wage_rate_per_day_female']
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new HouseholdSurveyDAOException('Failed to insert land preparation information');
    }

    if ($data['operations']) {
      $this->saveOperations($data['operations'], $id);
    }

    DB::commit();
    $data['id'] = $id;
    return $data;
  }

  public function saveOperations($data, $id) {
    $sql = 'DELETE FROM `' . self::OPERATIONS_TABLE . '` WHERE `household_survey_land_preparation_id` = %d';
    DB::queryMaster($sql, array($id));

    foreach ($data as $key => $value) {
      DB::queryMaster('INSERT INTO `' . self::OPERATIONS_TABLE . '`
        (`household_survey_land_preparation_id`, `name`, `date`,
          `power_source`, `tractor_horsepower`, `tractor_hour_usage`, `soil_condition`)
        VALUES (%d, "%s", "%s", "%s", %d, %d, "%s")',
        array(
          $id,
          $value['name'],
          $value['date'],
          $value['power_source'],
          $value['tractor_horsepower'],
          $value['tractor_hour_usage'],
          $value['soil_condition']
        )
      );
    }

    DB::commit();
    return true;
  }

  public function getOperations($id) {
    $result = DB::queryMaster('SELECT * FROM `' . self::OPERATIONS_TABLE . '`
      WHERE household_survey_land_preparation_id = %d
    ', array($id));

    $data = array();

    if ($result->numRows() <= 0) {
      return $data;
    }

    $result = $result->fetch();

    foreach ($result as $value) {
      $data[] = array(
        'name' => $value['name'],
        'date' => $value['date'],
        'power_source' => $value['power_source'],
        'tractor_horsepower' => $value['tractor_horsepower'],
        'tractor_hour_usage' => $value['tractor_hour_usage'],
        'soil_condition' => $value['soil_condition'],
      );
    }

    return $data;
  }

  public function get($seasonLongId) {
    $result = DB::querySlave('
      SELECT * FROM `' . self::MAIN_TABLE . '` WHERE household_survey_id = %d', array($seasonLongId));

    if ($result->numRows() <= 0) {
      return false;
    }

    $data = $result->fetchFirstRow();
    $data['operations'] = $this->getOperations($data['id']);
    return $data;
  }

  public function update($id, $data, $seasonLongId) {
    DB::startTransaction();

    DB::queryMaster('
      UPDATE `' . self::MAIN_TABLE . '`
      SET `household_survey_id` = %d, `crop_establishment` = %d, `land_preparation_started` = "%s",
        `tractor_cost` = %d, `labor_type` = %d, `male_labor_count` = %d, `female_labor_count` = %d,
        `above_18_years_old_count` = %d, `below_18_years_old_count` = %d, `labor_total_cost` = %d,
        `wage_rate_per_day_male` = %d, `wage_rate_per_day_female` = %d
      WHERE id = %d
    ', array(
      $seasonLongId,
      $data['crop_establishment'],
      $data['land_preparation_started'],
      $data['tractor_cost'],
      $data['labor_type'],
      $data['male_labor_count'],
      $data['female_labor_count'],
      $data['above_18_years_old_count'],
      $data['below_18_years_old_count'],
      $data['labor_total_cost'],
      $data['wage_rate_per_day_male'],
      $data['wage_rate_per_day_female'],
      $id
    ));

    if ($data['operations']) {
      $this->saveOperations($data['operations'], $id);
    }

    DB::commit();
    return $data;
  }
}
