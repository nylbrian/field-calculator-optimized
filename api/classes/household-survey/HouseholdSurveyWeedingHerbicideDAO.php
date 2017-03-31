<?php

class HouseholdSurveyWeedingHerbicideDAO {
  const MAIN_TABLE = 'household_survey_weeding_herbicide';
  const APPLICATION_TABLE = 'household_survey_weeding_herbicide_application';
  const WEEDS_TABLE = 'household_survey_weeding_herbicide_weeds';

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
      (`household_survey_id`, `control_weed`,
        `weeding_carried_out`, `total_labor_weeding`,`weeding_labor`,
        `weeding_male_labor`, `weeding_female_labor`, `weeding_above_18_years`,
        `weeding_below_18_years`, `weeding_wage_rate_male`, `weeding_wage_rate_female`,
        `herbicide_labor`, `herbicide_count`, `herbicide_cost`,
        `herbicide_male_labor`, `herbicide_female_labor`, `herbicide_above_18_years`,
        `herbicide_below_18_years`, `herbicide_total_labor_cost`, `dominant_weed`, `labor_total_cost`)
      VALUES
      (
        %d, "%s",
        "%s", %d, "%s",
        %d, %d, %d,
        %d, %d, %d,
        %d, %d, %d,
        %d, %d, %d,
        %d, %d, %d, %d
      )';

    $params = array(
      $seasonLongId,
      $data['control_weed'],
      $data['weeding_carried_out'],
      $data['total_labor_weeding'],
      $data['weeding_labor'],
      $data['weeding_male_labor'],
      $data['weeding_female_labor'],
      $data['weeding_above_18_years'],
      $data['weeding_below_18_years'],
      $data['weeding_wage_rate_male'],
      $data['weeding_wage_rate_female'],
      $data['herbicide_labor'],
      $data['herbicide_count'],
      $data['herbicide_cost'],
      $data['herbicide_male_labor'],
      $data['herbicide_female_labor'],
      $data['herbicide_above_18_years'],
      $data['herbicide_below_18_years'],
      $data['herbicide_total_labor_cost'],
      $data['dominant_weed'],
      $data['labor_total_cost'],
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new HouseholdSurveyDAOException('Failed to insert weeding herbicide information');
    }

    if ($data['herbicideProduct']) {
      $this->saveHerbicideProduct($data['herbicideProduct'], $id);
    }

    if ($data['weedNames']) {
      $this->saveHerbicideWeed($data['weedNames'], $id);
    }

    DB::commit();
    $data['id'] = $id;
    return $data;
  }

  public function saveHerbicideProduct($data, $id) {
    DB::startTransaction();

    $sql = 'DELETE FROM `' . self::APPLICATION_TABLE . '`
      WHERE `household_survey_weeding_herbicide_id` = %d';

    DB::queryMaster($sql, array($id));

    foreach ($data as $key => $value) {
      if (!isset($value['date']) && !isset($value['name']) && !isset($value['technical_name']) &&
        !isset($value['active_ingredient']) && !isset($value['bottles_applied']) &&
        !isset($value['ml']) && !isset($value['leftover'])) {
        continue;
      }

      DB::queryMaster('INSERT INTO `' . self::APPLICATION_TABLE . '`
        (household_survey_weeding_herbicide_id, `date`, `name`,
          `technical_name`, `active_ingredient`, `bottles_applied`,
          `ml`, `leftover`)
        VALUES
        (%d, "%s", "%s",
         "%s", "%s", %d,
         %d, "%s")',
        array(
          $id,
          $value['date'],
          $value['name'],
          $value['technical_name'],
          $value['active_ingredient'],
          $value['bottles_applied'],
          $value['ml'],
          $value['leftover'],
        )
      );
    }

    DB::commit();
    return true;
  }

  public function getHerbicideProducts($id) {
    $return = DB::queryMaster('
      SELECT * FROM `' . self::APPLICATION_TABLE . '` WHERE household_survey_weeding_herbicide_id = %d
    ', array($id));

    return $return->fetch();
  }

  public function saveHerbicideWeed($data, $id) {
    DB::startTransaction();

    $sql = 'DELETE FROM `' . self::WEEDS_TABLE . '`
      WHERE `household_survey_weeding_herbicide_id` = %d';

    DB::queryMaster($sql, array($id));

    foreach ($data as $key => $value) {
      DB::queryMaster('INSERT INTO `' . self::WEEDS_TABLE . '`
        (household_survey_weeding_herbicide_id, `name`) VALUES(%d, "%s")',
        array(
          $id,
          $value['name']
        )
      );
    }

    DB::commit();
    return true;
  }

  public function getHerbicideWeed($id) {
    $return = DB::queryMaster('
      SELECT * FROM `' . self::WEEDS_TABLE . '` WHERE household_survey_weeding_herbicide_id = %d
    ', array($id));

    return $return->fetch();
  }

  public function get($seasonLongId) {
    $result = DB::querySlave('
      SELECT * FROM `' . self::MAIN_TABLE . '` WHERE household_survey_id = %d', array($seasonLongId));

    if ($result->numRows() <= 0) {
      return false;
    }

    $data = $result->fetchFirstRow();
    $data['herbicideProduct'] = $this->getHerbicideProducts($data['id']);
    $data['weedNames'] = $this->getHerbicideWeed($data['id']);
    return $data;
  }

  public function update($id, $data, $seasonLongId) {
    DB::startTransaction();

    DB::queryMaster('
      UPDATE `' . self::MAIN_TABLE . '`
      SET `household_survey_id` = %d, `control_weed` = %d,
        `weeding_carried_out` = "%s", `total_labor_weeding` = %d,`weeding_labor` = %d,
        `weeding_male_labor` = %d, `weeding_female_labor` = %d, `weeding_above_18_years` = %d,
        `weeding_below_18_years` = %d, `weeding_wage_rate_male` = %d, `weeding_wage_rate_female` = %d,
        `herbicide_labor` = %d, `herbicide_count` = %d, `herbicide_cost` = %d,
        `herbicide_male_labor` = %d, `herbicide_female_labor` = %d, `herbicide_above_18_years` = %d,
        `herbicide_below_18_years` = %d, `herbicide_total_labor_cost` = %d, `dominant_weed` = %d,
        `labor_total_cost` = %d
      WHERE id = %d',
      array(
        $seasonLongId,
        $data['control_weed'],
        $data['weeding_carried_out'],
        $data['total_labor_weeding'],
        $data['weeding_labor'],
        $data['weeding_male_labor'],
        $data['weeding_female_labor'],
        $data['weeding_above_18_years'],
        $data['weeding_below_18_years'],
        $data['weeding_wage_rate_male'],
        $data['weeding_wage_rate_female'],
        $data['herbicide_labor'],
        $data['herbicide_count'],
        $data['herbicide_cost'],
        $data['herbicide_male_labor'],
        $data['herbicide_female_labor'],
        $data['herbicide_above_18_years'],
        $data['herbicide_below_18_years'],
        $data['herbicide_total_labor_cost'],
        $data['dominant_weed'],
        $data['labor_total_cost'],
        $id
    ));

    if ($data['herbicideProduct']) {
      $this->saveHerbicideProduct($data['herbicideProduct'], $id);
    }

    if ($data['weedNames']) {
      $this->saveHerbicideWeed($data['weedNames'], $id);
    }

    DB::commit();
    return $data;
  }

}
