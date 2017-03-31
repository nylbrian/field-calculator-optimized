<?php

class HouseholdSurveyCleaningAndDryingDAO {
  const MAIN_TABLE = 'household_survey_cleaning_drying';

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
      (`household_survey_id`, `dry_threshed_grain`, `labor_count`,
        `labor_type`, `male_labor`, `female_labor`, `above_18_years_old`,
        `below_18_years_old`, `labor_total_cost`)
      VALUES
      (%d, %d, %d, %d, %d, %d, %d, %d, %d)';

    $params = array(
      $seasonLongId,
      $data['dry_threshed_grain'],
      $data['labor_count'],
      $data['labor_type'],
      $data['male_labor'],
      $data['female_labor'],
      $data['above_18_years_old'],
      $data['below_18_years_old'],
      $data['labor_total_cost']
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new HouseholdSurveyDAOException('Failed to insert cleaning drying information');
    }

    DB::commit();
    $data['id'] = $id;
    return $data;
  }

  public function get($seasonLongId) {
    $result = DB::querySlave('
      SELECT * FROM `' . self::MAIN_TABLE . '` WHERE household_survey_id = %d', array($seasonLongId));

    if ($result->numRows() <= 0) {
      return false;
    }

    $data = $result->fetchFirstRow();
    return $data;
  }

  public function update($id, $data, $seasonLongId) {
    DB::startTransaction();

    DB::queryMaster('
      UPDATE `' . self::MAIN_TABLE . '`
      SET `household_survey_id` = %d, `dry_threshed_grain` = %d, `labor_count` = %d,
        `labor_type` = %d, `male_labor` = %d, `female_labor` = %d, `above_18_years_old` = %d,
        `below_18_years_old` = %d, `labor_total_cost` = %d
      WHERE id = %d
    ', array(
      $seasonLongId,
      $data['dry_threshed_grain'],
      $data['labor_count'],
      $data['labor_type'],
      $data['male_labor'],
      $data['female_labor'],
      $data['above_18_years_old'],
      $data['below_18_years_old'],
      $data['labor_total_cost'],
      $id
    ));

    DB::commit();
    return $data;
  }
}
