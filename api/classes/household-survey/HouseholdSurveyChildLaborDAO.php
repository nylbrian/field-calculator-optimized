<?php

class HouseholdSurveyChildLaborDAO {
  const MAIN_TABLE = 'household_survey_child_labor';

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
      (`household_survey_id`, `employment_below_18`,
        `employment_above_18`, `school_going_children_employed`)
      VALUES
      (%d, %d, %d, %d)';

    $params = array(
      $seasonLongId,
      $data['employment_below_18'],
      $data['employment_above_18'],
      $data['school_going_children_employed']
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new HouseholdSurveyDAOException('Failed to insert child labor information');
    }

    $this->insertMinimumWage($id, $data['childrenMinimumWage']);

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
    $data['childrenMinimumWage'] = $this->getMinimumWage($data['id']);
    return $data;
  }

  protected function insertMinimumWage($id, $data) {
    DB::queryMaster('
      DELETE FROM household_survey_child_labor_record WHERE household_survey_child_labor_id = %d',
      array($id));

    foreach($data as $key => $value) {
      if (!$value) {
        continue;
      }

      DB::queryMaster('
        INSERT INTO household_survey_child_labor_record(household_survey_child_labor_id, value)
        VALUES(%d, %d)', array(
          $id,
          $key,
      ));
    }
  }

  protected function getMinimumWage($id) {
    $result = DB::querySlave('
      SELECT *
      FROM household_survey_child_labor_record
      WHERE household_survey_child_labor_id = %d', array(
      $id
    ));

    $data = array();
    foreach($result->fetch() as $value) {
      $data[$value['value']] = true;
    }

    return $data;
  }

  public function update($id, $data, $seasonLongId) {
    DB::startTransaction();

    DB::queryMaster('
      UPDATE `' . self::MAIN_TABLE . '`
      SET `household_survey_id` = %d, `employment_below_18` = %d,
        `employment_above_18` = %d, `school_going_children_employed` = %d
      WHERE id = %d
    ', array(
      $seasonLongId,
      $data['employment_below_18'],
      $data['employment_above_18'],
      $data['school_going_children_employed'],
      $id
    ));

    $this->insertMinimumWage($id, $data['childrenMinimumWage']);

    DB::commit();
    return $data;
  }

}
