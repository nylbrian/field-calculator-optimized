<?php

class HouseholdSurveyGrainAndStrawYieldDAO {
  const MAIN_TABLE = 'household_survey_grain_and_straw_yield';

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
      (`household_survey_id`, `rice_amount`, `grain_amount`,
      `rice_selling_price`, `straw_sold`, `straw_total_price`, `straw_handled`,
      `grain_moisture_content`, `total_rainfall`, irrigation_method)
      VALUES
      (%d, %d, %d, %d, %d, %d, %d, %d, %d, %d)';

    $params = array(
      $seasonLongId,
      $data['rice_amount'],
      $data['grain_amount'],
      $data['rice_selling_price'],
      $data['straw_sold'],
      $data['straw_total_price'],
      $data['straw_handled'],
      $data['grain_moisture_content'],
      $data['total_rainfall'],
      $data['irrigation_method']
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new HouseholdSurveyDAOException('Failed to insert grain and straw yield information');
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
      SET `household_survey_id` = %d, `rice_amount` = %d, `grain_amount` = %d,
        `rice_selling_price` = %d, `straw_sold` = %d,
        `straw_total_price` = %d, `straw_handled` = %d,
        `grain_moisture_content` = %d, `total_rainfall` = %d, `irrigation_method` = %d
      WHERE id = %d',
      array(
        $seasonLongId,
        $data['rice_amount'],
        $data['grain_amount'],
        $data['rice_selling_price'],
        $data['straw_sold'],
        $data['straw_total_price'],
        $data['straw_handled'],
        $data['grain_moisture_content'],
        $data['total_rainfall'],
        $data['irrigation_method'],
        $id
    ));

  }
}
