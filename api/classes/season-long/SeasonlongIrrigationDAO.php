<?php

class SeasonlongIrrigationDAO {
  const MAIN_TABLE = 'season_long_irrigation';
  const PERIOD_TABLE = 'season_long_irrigation_period';

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
      (`season_long_id`, `water_condition`, `irrigation_count`,
        `irrigation_energy_source`, `pump_horse_power`, `hydraulic_lift_height`,
        `pump_disharge_rate`, `pump_operation_hour`,  `discharge_pipe_diameter`,
        `electricity_consumed`, `diesel_consumed`, `total_fuel_cost`,
        `labor_type`, `male_labor_count`, `female_labor_count`,
        `above_18_years_old_count`, `below_18_years_old_count`, `labor_total_cost`, `irrigation_field_count`)
      VALUES
      (%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d)';

    $params = array(
      $seasonLongId,
      $data['water_condition'],
      $data['irrigation_count'],
      $data['irrigation_energy_source'],
      $data['pump_horse_power'],
      $data['hydraulic_lift_height'],
      $data['pump_disharge_rate'],
      $data['pump_operation_hour'],
      $data['discharge_pipe_diameter'],
      $data['electricity_consumed'],
      $data['diesel_consumed'],
      $data['total_fuel_cost'],
      $data['labor_type'],
      $data['male_labor_count'],
      $data['female_labor_count'],
      $data['above_18_years_old_count'],
      $data['below_18_years_old_count'],
      $data['labor_total_cost'],
      $data['irrigation_field_count'],
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new SeasonlongDAOException('Failed to insert irrigation information');
    }

    if ($data['period']) {
      $this->savePeriod($data['period'], $id);
    }

    DB::commit();
    $data['id'] = $id;
    return $data;
  }

  private function isValidDate($date) {
    return $date && $date != '0000-00-00 00:00:00';
  }

  public function savePeriod($data, $id) {
    DB::startTransaction();

    $sql = 'DELETE FROM `' . self::PERIOD_TABLE . '`
      WHERE `season_long_irrigation_id` = %d';

    DB::queryMaster($sql, array($id));

    foreach ($data as $key => $value) {
      if (!$this->isValidDate($value['date'])) {
        continue;
      }

      DB::queryMaster('INSERT INTO `' . self::PERIOD_TABLE . '`
        (season_long_irrigation_id, date, irrigated, water_depth, standing_water, source)
        VALUES (%d, "%s", %d, %d, %d, %d)',
        array(
          $id,
          $value['date'],
          $value['irrigated'],
          $value['water_depth'],
          $value['standing_water'],
          $value['source'],
        )
      );
    }

    DB::commit();
    return true;
  }

  public function getPeriod($id) {
    $result = DB::queryMaster('SELECT * FROM `' . self::PERIOD_TABLE . '`
      WHERE season_long_irrigation_id = %d
    ', array($id));

    $data = array();

    if ($result->numRows() <= 0) {
      return $data;
    }

    $result = $result->fetch();

    foreach ($result as $value) {
      $data[] = array(
        'date' => $value['date'],
        'irrigated' => $value['irrigated'],
        'water_depth' => $value['water_depth'],
        'standing_water' => $value['standing_water'],
        'source' => $value['source'],
      );
    }

    return $data;
  }

  public function get($seasonLongId) {
    $result = DB::querySlave('
      SELECT * FROM `' . self::MAIN_TABLE . '` WHERE season_long_id = %d', array($seasonLongId));

    if ($result->numRows() <= 0) {
      return false;
    }

    $data = $result->fetchFirstRow();
    $data['period'] = $this->getPeriod($data['id']);
    return $data;
  }

  public function update($id, $data, $seasonLongId) {
    DB::startTransaction();

    DB::queryMaster('
      UPDATE `' . self::MAIN_TABLE . '`
      SET `season_long_id` = %d, `water_condition` = %d, `irrigation_count` = %d,
        `irrigation_energy_source` = %d, `pump_horse_power` = %d, `hydraulic_lift_height` = %d,
        `pump_disharge_rate` = %d, `pump_operation_hour` = %d,  `discharge_pipe_diameter` = %d,
        `electricity_consumed` = %d, `diesel_consumed` = %d, `total_fuel_cost` = %d,
        `labor_type` = %d, `male_labor_count` = %d, `female_labor_count` = %d,
        `above_18_years_old_count` = %d, `below_18_years_old_count` = %d, `labor_total_cost` = %d,
        `irrigation_field_count` = %d
      WHERE id = %d',
      array(
        $seasonLongId,
        $data['water_condition'],
        $data['irrigation_count'],
        $data['irrigation_energy_source'],
        $data['pump_horse_power'],
        $data['hydraulic_lift_height'],
        $data['pump_disharge_rate'],
        $data['pump_operation_hour'],
        $data['discharge_pipe_diameter'],
        $data['electricity_consumed'],
        $data['diesel_consumed'],
        $data['total_fuel_cost'],
        $data['labor_type'],
        $data['male_labor_count'],
        $data['female_labor_count'],
        $data['above_18_years_old_count'],
        $data['below_18_years_old_count'],
        $data['labor_total_cost'],
        $data['irrigation_field_count'],
        $id
    ));

    if ($data['period']) {
      $this->savePeriod($data['period'], $id);
    }

    DB::commit();
    return $data;
  }

}
