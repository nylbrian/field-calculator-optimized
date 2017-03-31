<?php

class SeasonlongGeneralInformationDAO {
  const MAIN_TABLE = 'season_long_general_information';
  const PROBLEMS_TABLE = 'season_long_general_information_problems';

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
      (`season_long_id`, `gender`, `age`, `marital_status`, `literacy`, `years_schooling`, `primary_occupation`, `primary_occupation_others`, `secondary_occupation`, `secondary_occupation_others`, `religion`, `religion_others`, `contact_number`, `attended_training`, `training`, `training_others`, `training_duration`, `total_income_farm`, `total_income_non_farm`, `farming_years`, `machineries`, `ownership`, `economic_condition`, `economic_condition_change`)
      VALUES
      (%d, %d, %d, %d, %d, %d, %d, "%s", %d, "%s", %d, "%s", %d, %d, %d,
        "%s", %d, %d, %d, %d, %d, %d, %d, %d)';

    $params = array(
      $seasonLongId,
      $data['gender'],
      $data['age'],
      $data['marital_status'],
      $data['literacy'],
      $data['years_schooling'],
      $data['primary_occupation'],
      $data['primary_occupation_others'],
      $data['secondary_occupation'],
      $data['secondary_occupation_others'],
      $data['religion'],
      $data['religion_others'],
      $data['contact_number'],
      $data['attended_training'],
      $data['training'],
      $data['training_others'],
      $data['training_duration'],
      $data['total_income_farm'],
      $data['total_income_non_farm'],
      $data['farming_years'],
      $data['machineries'],
      $data['ownership'],
      $data['economic_condition'],
      $data['economic_condition_change'],
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new SeasonlongDAOException('Failed to insert pre planting information');
    }

    if ($data['problems']) {
      $this->saveProblems($data['problems'], $id);
    }

    DB::commit();
    $data['id'] = $id;
    return $data;
  }

  public function saveProblems($data, $id) {
    DB::startTransaction();

    $sql = 'DELETE FROM `' . self::PROBLEMS_TABLE . '`
      WHERE `season_long_general_information_id` = %d';

    DB::queryMaster($sql, array($id));

    foreach ($data as $key => $value) {
      if ($value['problem']) {
        DB::queryMaster('INSERT INTO `' . self::PROBLEMS_TABLE . '`
          (season_long_general_information_id, problem) VALUES
          (%d, "%s")',
          array($id, $value['problem'])
        );
      }
    }

    DB::commit();
    return true;
  }

  public function get($seasonLongId) {
    $result = DB::querySlave('
      SELECT * FROM season_long_general_information WHERE season_long_id = %d
    ', array($seasonLongId));

    if ($result->numRows() <= 0) {
      return false;
    }

    $data = $result->fetchFirstRow();
    $data['problems'] = $this->getProblems($data['id']);

    return $data;
  }

  public function getProblems($id) {
    $result = DB::querySlave('
      SELECT * FROM season_long_general_information_problems
      WHERE season_long_general_information_id = %d',
      array($id));

    if ($result->numRows() <= 0) {
      return false;
    }

    $result = $result->fetch();

    $data = array();
    foreach($result as $value) {
      $data[] = array(
        'problem' => $value['problem'],
      );
    }

    return $data;
  }

  public function update($id, $data, $seasonLongId) {
    DB::startTransaction();

    $sql = 'UPDATE `' . self::MAIN_TABLE . '`
      SET `season_long_id` = %d, `gender` = %d, `age` = %d, `marital_status` = %d, `literacy` = %d,
        `years_schooling` = %d, `primary_occupation` = %d, `primary_occupation_others` = "%s",
        `secondary_occupation` = %d, `secondary_occupation_others` = "%s", `religion` = %d,
        `religion_others` = "%s", `contact_number` = %d, `attended_training` = %d, `training` = %d,
        `training_others` = "%s", `training_duration` = %d, `total_income_farm` = %d,
        `total_income_non_farm` = %d, `farming_years` = %d, `machineries` = %d, `ownership` = %d,
        `economic_condition` = %d, `economic_condition_change` = %d
      WHERE id = %d';

    $params = array(
      $seasonLongId,
      $data['gender'],
      $data['age'],
      $data['marital_status'],
      $data['literacy'],
      $data['years_schooling'],
      $data['primary_occupation'],
      $data['primary_occupation_others'],
      $data['secondary_occupation'],
      $data['secondary_occupation_others'],
      $data['religion'],
      $data['religion_others'],
      $data['contact_number'],
      $data['attended_training'],
      $data['training'],
      $data['training_others'],
      $data['training_duration'],
      $data['total_income_farm'],
      $data['total_income_non_farm'],
      $data['farming_years'],
      $data['machineries'],
      $data['ownership'],
      $data['economic_condition'],
      $data['economic_condition_change'],
      $id
    );

    $result = DB::queryMaster($sql, $params);

    if ($data['problems']) {
      $this->saveProblems($data['problems'], $id);
    }

    DB::commit();
    return $data;
  }

}
