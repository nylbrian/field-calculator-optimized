<?php

class HouseholdSurveyFertilizerApplicationDAO {
  const MAIN_TABLE = 'household_survey_fertilizer_application';
  const INFO_TABLE = 'household_survey_fertilizer_application_info';

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
      (`household_survey_id`, `fertilizer_cost`, `labor_type`, `male_labor`,
        `female_labor`, `above_18_years_old`, `below_18_years_old`, `labor_total_cost`,
        `fertilizer_application`, `fertilizer_application_other`, grain_yield_parcel)
      VALUES
      (%d, %d, %d, %d, %d, %d, %d, %d, %d, "%s", %d)';

    $params = array(
      $seasonLongId,
      $data['fertilizer_cost'],
      $data['labor_type'],
      $data['male_labor'],
      $data['female_labor'],
      $data['above_18_years_old'],
      $data['below_18_years_old'],
      $data['labor_total_cost'],
      $data['fertilizer_application'],
      $data['fertilizer_application_other'],
      $data['grain_yield_parcel'],
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      return false;
    }

    $this->saveInfo($data, $id);

    DB::commit();
    $data['id'] = $id;
    return $data;
  }

  protected function getAmountByName($name) {
    switch ($name) {
      case 'urea':
        return array(
          'n' => 46,
          'p205' => 0,
          'k20' => 0,
          'zn' => 0,
          's' => 0
        );
        break;
      case 'dap':
        return array(
          'n' => 18,
          'p205' => 46,
          'k20' => 0,
          'zn' => 0,
          's' => 0
        );
        break;
      case 'mop':
        return array(
          'n' => 0,
          'p205' => 0,
          'k20' => 60,
          'zn' => 0,
          's' => 0
        );
        break;
      case 'ammoniumSulphate':
        return array(
          'n' => 21,
          'p205' => 0,
          'k20' => 0,
          'zn' => 0,
          's' => 24
        );
        break;
      case 'complete':
        return array(
          'n' => 14,
          'p205' => 14,
          'k20' => 14,
          'zn' => 0,
          's' => 0
        );
        break;
      case 'solophos':
        return array(
          'n' => 0,
          'p205' => 18,
          'k20' => 0,
          'zn' => 0,
          's' => 0
        );
        break;
    }
  }

  public function saveInfo($data, $id) {
    DB::startTransaction();

    $sql = 'DELETE FROM `' . self::INFO_TABLE . '`
      WHERE `household_survey_fertilizer_application_id` = %d';
    DB::queryMaster($sql, array($id));

    if (isset($data['fertilizerApplied'])) {
      foreach ($data['fertilizerApplied'] as $key => $value) {
        $amount = $this->getAmountByName($key);
        DB::queryMaster('INSERT INTO `' . self::INFO_TABLE . '`
          (household_survey_fertilizer_application_id, name, date, amount, n, p205, k20, zn, s)
          VALUES (%d, "%s", "%s", %d, %d, %d, %d, %d, %d)',
          array(
            $id,
            $key,
            $value['date'],
            $value['amount'],
            $amount['n'],
            $amount['p205'],
            $amount['k20'],
            $amount['zn'],
            $amount['s'],
          )
        );
      }
    }

    if (isset($data['otherFertilizerApplied'])) {
      foreach ($data['otherFertilizerApplied'] as $key => $value) {
        if (!$key || !$value['date'] || !$value['amount']) {
          continue;
        }

        // || !$value['n'] || !$value['p205'] || !$value['k20'] || !$value['zn'] || !$value['s']

        DB::queryMaster('INSERT INTO `' . self::INFO_TABLE . '`
          (household_survey_fertilizer_application_id, name, date, amount, n, p205, k20, zn, s, other)
          VALUES (%d, "%s", "%s", %d, %d, %d, %d, %d, %d, %d)',
          array(
            $id,
            $key,
            $value['date'],
            $value['amount'],
            $value['n'],
            $value['p205'],
            $value['k20'],
            $value['zn'],
            $value['s'],
            1,
          )
        );
      }
    }

    DB::commit();
    return true;
  }

  public function getInfo($id, &$data) {
    $result = DB::querySlave('
      SELECT * FROM `' . self::INFO_TABLE . '` WHERE household_survey_fertilizer_application_id = %d
    ', array($id));

    if ($result->numRows() <= 0) {
      return;
    }

    $temp = $result->fetch();

    foreach ($temp as $value) {
      if ($value['other'] == 1) {
        $data['otherFertilizerApplied'][$value['name']] = $value;
        $data['otherFertilizer'] = true;
        $data['otherFertilizers'][] = array(
          'isChecked' => true,
          'name' => $value['name'],
          'other' => 1,
          'value' => $value['name']
        );
      } else {
        $data['fertilizerApplied'][$value['name']] = $value;
        $data['fertilizers'][$value['name']] = array(
          'checked' => true
        );
      }
    }
  }

  public function get($seasonLongId) {
    $result = DB::querySlave('
      SELECT * FROM `' . self::MAIN_TABLE . '` WHERE household_survey_id = %d', array($seasonLongId));

    if ($result->numRows() <= 0) {
      return false;
    }

    $data = $result->fetchFirstRow();
    $this->getInfo($data['id'], $data);
    return $data;
  }

  public function update($id, $data, $seasonLongId) {
    DB::startTransaction();

    DB::queryMaster('
      UPDATE `' . self::MAIN_TABLE . '`
      SET `household_survey_id` = %d, `fertilizer_cost` = %d, `labor_type` = %d, `male_labor` = %d,
        `female_labor` = %d, `above_18_years_old` = %d, `below_18_years_old` = %d, `labor_total_cost` = %d,
        `fertilizer_application` = %d, `fertilizer_application_other` = "%s", grain_yield_parcel = %d
      WHERE id = %d
    ', array(
      $seasonLongId,
      $data['fertilizer_cost'],
      $data['labor_type'],
      $data['male_labor'],
      $data['female_labor'],
      $data['above_18_years_old'],
      $data['below_18_years_old'],
      $data['labor_total_cost'],
      $data['fertilizer_application'],
      $data['fertilizer_application_other'],
      $data['grain_yield_parcel'],
      $id
    ));

    $this->saveInfo($data, $id);

    DB::commit();
    return $data;
  }

}
