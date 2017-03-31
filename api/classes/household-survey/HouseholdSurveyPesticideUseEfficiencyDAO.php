<?php

class HouseholdSurveyPesticideUseEfficiencyDAO {
  const MAIN_TABLE = 'household_survey_pesticide_use_efficiency';

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
      (`household_survey_id`, `bird_management`,
        `disease_management`, `equipment_calibrated`, `insect_management`,
        `label_instructions`, `mollusk_management`, `registered_products`,
        `rodent_management`, `targeted_application`, `weed_management`)
      VALUES
      (%d, %d, %d,
        %d, %d, %d,
        %d, %d, %d,
        %d, %d)';

    $params = array(
      $seasonLongId,
      $data['bird_management'],
      $data['disease_management'],
      $data['equipment_calibrated'],
      $data['insect_management'],
      $data['label_instructions'],
      $data['mollusk_management'],
      $data['registered_products'],
      $data['rodent_management'],
      $data['targeted_application'],
      $data['weed_management'],
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new HouseholdSurveyDAOException('Failed to insert food security information');
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

    DB::queryMaster('UPDATE `' . self::MAIN_TABLE . '`
      SET `household_survey_id` = %d, `bird_management` = %d,
        `disease_management` = %d, `equipment_calibrated` = %d, `insect_management` = %d,
        `label_instructions` = %d, `mollusk_management` = %d, `registered_products` = %d,
        `rodent_management` = %d, `targeted_application` = %d, `weed_management` = %d
      WHERE id = %d',
      array(
        $seasonLongId,
        $data['bird_management'],
        $data['disease_management'],
        $data['equipment_calibrated'],
        $data['insect_management'],
        $data['label_instructions'],
        $data['mollusk_management'],
        $data['registered_products'],
        $data['rodent_management'],
        $data['targeted_application'],
        $data['weed_management'],
        $id,
      ));

    DB::commit();
    return $data;
  }
}
