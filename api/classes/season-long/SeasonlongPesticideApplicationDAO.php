<?php

class SeasonlongPesticideApplicationDAO {
  const MAIN_TABLE = 'season_long_pesticide_application';
  const INFO_TABLE = 'season_long_pesticide_rice_problems_detail';
  const EQUIPMENT_TABLE = 'season_long_pesticide_equipment';

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
      (`season_long_id`, `applied_pesticide`, `applied_pesticide_other`,
        `pesticide_registered`, `pesticide_forbidden`, `pesticide_calibrated`,
        `total_cost_paid`, `labor_type`, `male_labor`,
        `female_labor`, `above_18_years_old`, `below_18_years_old`, `pesticide_labor_total_cost`)
      VALUES
      (%d, %d, %d,
        %d, %d, %d,
        %d, %d, %d,
        %d, %d, %d, %d)';

    $params = array(
      $seasonLongId,
      $data['applied_pesticide'],
      $data['applied_pesticide_other'],
      $data['pesticide_registered'],
      $data['pesticide_forbidden'],
      $data['pesticide_calibrated'],
      $data['total_cost_paid'],
      $data['labor_type'],
      $data['male_labor'],
      $data['female_labor'],
      $data['above_18_years_old'],
      $data['below_18_years_old'],
      $data['pesticide_labor_total_cost'],
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new SeasonlongDAOException('Failed to insert pesticide application information');
    }

    $this->saveProblems($data, $id);
    if ($data['protective_equipments']) {
      $this->saveEquipments($data['protective_equipments'], $id);
    }

    DB::commit();
    $data['id'] = $id;
    return $data;
  }

  public function saveProblems($data, $id) {
    DB::startTransaction();

    $sql = 'DELETE FROM `' . self::INFO_TABLE . '`
      WHERE `season_long_pesticide_application_id` = %d';

    DB::queryMaster($sql, array($id));

    if (isset($data['problemsRiceField'])) {
      foreach ($data['problemsRiceField'] as $key => $value) {
        if (!isset($value['applied_date']) && !isset($value['applied']) && !isset($value['amount']) && !isset($value['leftover'])) {
          continue;
        }

        DB::queryMaster('INSERT INTO `' . self::INFO_TABLE . '`
          (season_long_pesticide_application_id, name, applied_date, applied, amount, leftover, brand_applied)
          VALUES (%d, "%s", "%s", %d, %d, %d, "%s")',
          array(
            $id,
            $key,
            $value['applied_date'],
            $value['applied'],
            $value['amount'],
            $value['leftover'],
            $value['brand_applied']
          )
        );
      }
    }

    if (isset($data['otherProblemsRiceField'])) {
      foreach ($data['otherProblemsRiceField'] as $key => $value) {
        if (!isset($value['applied_date']) && !isset($value['applied']) && !isset($value['amount']) && !isset($value['leftover'])) {
          continue;
        }

        DB::queryMaster('INSERT INTO `' . self::INFO_TABLE . '`
          (season_long_pesticide_application_id, name, applied_date, applied, amount, leftover, brand_applied, other)
          VALUES (%d, "%s", "%s", %d, %d, %d, "%s", %d)',
          array(
            $id,
            $key,
            $value['applied_date'],
            $value['applied'],
            $value['amount'],
            $value['leftover'],
            $value['brand_applied'],
            1
          )
        );
      }
    }

    DB::commit();
    return true;
  }

  public function saveEquipments($data, $id) {
    DB::startTransaction();

    $sql = 'DELETE FROM `' . self::EQUIPMENT_TABLE . '`
      WHERE `season_long_pesticide_application_id` = %d';

    DB::queryMaster($sql, array($id));

    foreach ($data as $key => $value) {
      if ($value !== true) {
        continue;
      }

      DB::queryMaster('INSERT INTO `' . self::EQUIPMENT_TABLE . '`
        (season_long_pesticide_application_id, value)
        VALUES (%d, %d)',
        array(
          $id,
          $key
        )
      );
    }

    DB::commit();
    return true;
  }

  public function getEquipments($id) {
    $result = DB::querySlave('SELECT * FROM `' . self::EQUIPMENT_TABLE . '`
      WHERE `season_long_pesticide_application_id` = %d', array($id));

    if ($result->numRows() <= 0) {
      return array();
    }

    $data = array();
    $result = $result->fetch();
    foreach ($result as $value) {
      $data[$value['value']] = true;
    }

    return $data;
  }

  public function getProblems($id, &$data) {
    $result = DB::queryMaster('
      SELECT * FROM `' . self::INFO_TABLE . '` WHERE `season_long_pesticide_application_id` = %d',
      array($id)
    );

    if ($result->numRows() <= 0) {
      return;
    }

    $temp = $result->fetch();
    foreach ($temp as $value) {
      if ($value['other'] == 1) {
        $data['otherPests'] = true;
        $data['otherRiceFieldProblems'][] = array(
          'isChecked' => true,
          'name' => $value['name'],
          'value' => $value['name']
        );
        $data['otherProblemsRiceField'][$value['name']] = array(
          'amount' => $value['amount'],
          'applied' => $value['applied'],
          'brand_applied' => $value['brand_applied'],
          'applied_date' => $value['applied_date'],
          'leftover' => $value['leftover'],
        );
      } else {
        $data['riceFieldProblems'][$value['name']] = array(
          'checked' => true
        );
        $data['problemsRiceField'][$value['name']] = array(
          'amount' => $value['amount'],
          'applied' => $value['applied'],
          'brand_applied' => $value['brand_applied'],
          'applied_date' => $value['applied_date'],
          'leftover' => $value['leftover'],
        );
      }
    }
  }

  public function get($seasonLongId) {
    $result = DB::querySlave('
      SELECT * FROM `' . self::MAIN_TABLE . '` WHERE season_long_id = %d', array($seasonLongId));

    if ($result->numRows() <= 0) {
      return false;
    }

    $data = $result->fetchFirstRow();
    $data['protective_equipments'] = $this->getEquipments($data['id']);
    $this->getProblems($data['id'], $data);
    return $data;
  }

  public function update($id, $data, $seasonLongId) {
    DB::startTransaction();

    DB::queryMaster('
      UPDATE `' . self::MAIN_TABLE . '`
      SET `season_long_id` = %d, `applied_pesticide` = %d, `applied_pesticide_other` = %d,
        `pesticide_registered` = %d, `pesticide_forbidden` = %d, `pesticide_calibrated` = %d,
        `total_cost_paid` = %d, `labor_type` = %d, `male_labor` = %d,
        `female_labor` = %d, `above_18_years_old` = %d, `below_18_years_old` = %d, `pesticide_labor_total_cost` = %d
      WHERE id = %d
    ', array(
      $seasonLongId,
      $data['applied_pesticide'],
      $data['applied_pesticide_other'],
      $data['pesticide_registered'],
      $data['pesticide_forbidden'],
      $data['pesticide_calibrated'],
      $data['total_cost_paid'],
      $data['labor_type'],
      $data['male_labor'],
      $data['female_labor'],
      $data['above_18_years_old'],
      $data['below_18_years_old'],
      $data['pesticide_labor_total_cost'],
      $id
    ));

    $this->saveProblems($data, $id);
    if ($data['protective_equipments']) {
      $this->saveEquipments($data['protective_equipments'], $id);
    }

    DB::commit();
    return $data;
  }

}
