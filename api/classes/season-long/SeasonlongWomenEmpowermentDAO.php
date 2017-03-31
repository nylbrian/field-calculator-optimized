<?php

class SeasonlongWomenEmpowermentDAO {
  const MAIN_TABLE = 'season_long_women_empowerment';

  public function checkRecordExists($seasonLongId) {
    $result = DB::queryMaster('SELECT id from '.self::MAIN_TABLE.' WHERE season_long_id = %d', array($seasonLongId));
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
      (`season_long_id`, `womens_decision`,
        `womens_control_over_decision`, `womens_satisfaction_labor_input`,
        `womens_access_information`, `womens_access_seasonal_resources`,
        `womens_control_long_term_resources`, `womens_control_decision_making_household`, `womens_control_personal_income`, `womens_participation_decision_making`,
        `violence_against_women`)
      VALUES
      (%d, %d,
        %d, %d,
        %d, %d,
        %d, %d,
        %d, %d, %d)';

    $params = array(
      $seasonLongId,
      $data['womens_decision'],
      $data['womens_control_over_decision'],
      $data['womens_satisfaction_labor_input'],
      $data['womens_access_information'],
      $data['womens_access_seasonal_resources'],
      $data['womens_control_long_term_resources'],
      $data['womens_control_decision_making_household'],
      $data['womens_control_personal_income'],
      $data['womens_participation_decision_making'],
      $data['violence_against_women']
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new SeasonlongDAOException('Failed to insert women empowerment information');
    }

    DB::commit();
    $data['id'] = $id;
    return $data;
  }

  public function get($seasonLongId) {
    $result = DB::querySlave('
      SELECT * FROM `' . self::MAIN_TABLE . '` WHERE season_long_id = %d', array($seasonLongId));

    if ($result->numRows() <= 0) {
      return false;
    }

    $data = $result->fetchFirstRow();
    return $data;
  }

  public function update($id, $data, $seasonLongId) {
    DB::startTransaction();

    DB::queryMaster('UPDATE `' . self::MAIN_TABLE . '`
      SET `season_long_id` = %d, `womens_decision` = %d,
        `womens_control_over_decision` = %d, `womens_satisfaction_labor_input` = %d,
        `womens_access_information` = %d, `womens_access_seasonal_resources` = %d,
        `womens_control_long_term_resources` = %d, `womens_control_decision_making_household` = %d,
        `womens_control_personal_income` = %d, `womens_participation_decision_making` = %d,
        `violence_against_women` = %d WHERE id = %d',
      array(
        $seasonLongId,
        $data['womens_decision'],
        $data['womens_control_over_decision'],
        $data['womens_satisfaction_labor_input'],
        $data['womens_access_information'],
        $data['womens_access_seasonal_resources'],
        $data['womens_control_long_term_resources'],
        $data['womens_control_decision_making_household'],
        $data['womens_control_personal_income'],
        $data['womens_participation_decision_making'],
        $data['violence_against_women'],
        $id,
      ));

    DB::commit();
    return $data;
  }
}
