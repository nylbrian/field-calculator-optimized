<?php

class HouseholdSurveyFoodAndSafetyDAO {
  const MAIN_TABLE = 'household_survey_food_safety';

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
      (`household_survey_id`, `aware_food_safety_risk`, `heavy_metal_risk`, `soil_remediation`)
      VALUES
      (%d, %d, "%s", "%s")';

    $params = array(
      $seasonLongId,
      $data['aware_food_safety_risk'],
      $data['heavy_metal_risk'],
      $data['soil_remediation']
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new HouseholdSurveyDAOException('Failed to insert food and safety information');
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
    DB::queryMaster('UPDATE `' . self::MAIN_TABLE . '`
      SET `household_survey_id` = %d, `aware_food_safety_risk` = %d,
        `heavy_metal_risk` = "%s", `soil_remediation` = "%s"
      WHERE id = %d',
      array(
        $seasonLongId,
        $data['aware_food_safety_risk'],
        $data['heavy_metal_risk'],
        $data['soil_remediation'],
        $id
    ));

  }

}
