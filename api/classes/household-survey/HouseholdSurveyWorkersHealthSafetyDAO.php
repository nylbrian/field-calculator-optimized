<?php

class HouseholdSurveyWorkersHealthSafetyDAO {
  const MAIN_TABLE = 'household_survey_workers_health_safety';

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
      (`household_survey_id`, `work_related_injuries`,
        `safety_instructions_available`, `tools_calibrated_maintained`,
        `training_pesticide_applicators`, `pesticide_applicator_good_quality`,
        `washing_changing_facility_available`, `pesticide_applied_pregnant_women`,
        `re_entry_time_48_hour`, `pesticide_inorganic_fertilizer_stored`, `empty_pesticide_disposed`)
      VALUES
      (%d, %d,
       %d, %d, %d,
       %d, %d, %d,
       %d, %d, %d)';

    $params = array(
      $seasonLongId,
      $data['work_related_injuries'],
      $data['safety_instructions_available'],
      $data['tools_calibrated_maintained'],
      $data['training_pesticide_applicators'],
      $data['pesticide_applicator_good_quality'],
      $data['washing_changing_facility_available'],
      $data['pesticide_applied_pregnant_women'],
      $data['re_entry_time_48_hour'],
      $data['pesticide_inorganic_fertilizer_stored'],
      $data['empty_pesticide_disposed']
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new HouseholdSurveyDAOException('Failed to insert workers health safety information');
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
      SET `household_survey_id` = %d, `work_related_injuries` = %d,
        `safety_instructions_available` = %d, `tools_calibrated_maintained` = %d,
        `training_pesticide_applicators` = %d, `pesticide_applicator_good_quality` = %d,
        `washing_changing_facility_available` = %d, `pesticide_applied_pregnant_women` = %d,
        `re_entry_time_48_hour` = %d, `pesticide_inorganic_fertilizer_stored` = %d,
        `empty_pesticide_disposed` = %d
      WHERE id = %d
    ', array(
      $seasonLongId,
      $data['work_related_injuries'],
      $data['safety_instructions_available'],
      $data['tools_calibrated_maintained'],
      $data['training_pesticide_applicators'],
      $data['pesticide_applicator_good_quality'],
      $data['washing_changing_facility_available'],
      $data['pesticide_applied_pregnant_women'],
      $data['re_entry_time_48_hour'],
      $data['pesticide_inorganic_fertilizer_stored'],
      $data['empty_pesticide_disposed'],
      $id
    ));

    DB::commit();
    return $data;
  }
}
