<?php

class SeasonlongSowingTransplantingDAO {
  const MAIN_TABLE = 'season_long_sowing_transplanting';

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
      (`season_long_id`, `direct_sowing_method`,
        `sowing_date`, `total_cost_paid_tractor`, `labor_type`,
        `male_labor`, `female_labor`, `above_18_years_old`,
        `below_18_years_old`, `labor_total_cost`, `wage_rate_male`,
        `wage_rate_female`, `transplanting_method`, `transplanting_carried_out`,
        `total_cost_tractor`, `transplanting_labor_count`, `total_cost_paid_service_provider`,
        `custom_extra_labor`, `custom_other_labor_count`, `prepared_nursery`,
        `nursery_establishment_date`, `transplanting_date`, `trays_seedling_count`,
        `seed_total_cost`, `fertilizer_total_cost`, `total_labor_cost_seedling`,
        `total_cost_seedling_transport`, `nursery_area`, `nursery_field_area`,
        `tractor_total_minute`, `total_seed_cost`, `seedling_labor_type`,
        `seedling_male_labor`, `seedling_female_labor`, `seedling_above_18_years_old`,
        `seedling_below_18_years_old`, `nursery_labor_type`, `nursery_male_labor`,
        `nursery_female_labor`, `nursery_above_18_years_old`, `nursery_below_18_years_old`,
        `nursery_labor_total_cost`, `seedling_labor_total_cost`)
      VALUES
      (
        %d, %d,
        "%s", %d, %d,
        %d, %d, %d,
        %d, %d, %d,
        %d, %d, %d,
        %d, %d, %d,
        %d, %d, %d,
        "%s", "%s", %d,
        %d, %d, %d,
        %d, %d,  "%s",
        %d, %d, %d,
        %d, %d, %d,
        %d, %d, %d,
        %d, %d, %d, %d, %d
      )';

    $params = array(
      $seasonLongId,
      $data['direct_sowing_method'],
      $data['sowing_date'],
      $data['total_cost_paid_tractor'],
      $data['labor_type'],
      $data['male_labor'],
      $data['female_labor'],
      $data['above_18_years_old'],
      $data['below_18_years_old'],
      $data['labor_total_cost'],
      $data['wage_rate_male'],
      $data['wage_rate_female'],
      $data['transplanting_method'],
      $data['transplanting_carried_out'],
      $data['total_cost_tractor'],
      $data['transplanting_labor_count'],
      $data['total_cost_paid_service_provider'],
      $data['custom_extra_labor'],
      $data['custom_other_labor_count'],
      $data['prepared_nursery'],
      $data['nursery_establishment_date'],
      $data['transplanting_date'],
      $data['trays_seedling_count'],
      $data['seed_total_cost'],
      $data['fertilizer_total_cost'],
      $data['total_labor_cost_seedling'],
      $data['total_cost_seedling_transport'],
      $data['nursery_area'],
      $data['nursery_field_area'],
      $data['tractor_total_minute'],
      $data['total_seed_cost'],
      $data['seedling_labor_type'],
      $data['seedling_male_labor'],
      $data['seedling_female_labor'],
      $data['seedling_above_18_years_old'],
      $data['seedling_below_18_years_old'],
      $data['nursery_labor_type'],
      $data['nursery_male_labor'],
      $data['nursery_female_labor'],
      $data['nursery_above_18_years_old'],
      $data['nursery_below_18_years_old'],
      $data['nursery_labor_total_cost'],
      $data['seedling_labor_total_cost'],
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new SeasonlongDAOException('Failed to insert sowing transplanting information');
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

    DB::queryMaster('
      UPDATE `' . self::MAIN_TABLE . '`
      SET `season_long_id` = %d, `direct_sowing_method` = %d,
        `sowing_date` = "%s", `total_cost_paid_tractor` = %d, `labor_type` = %d,
        `male_labor` = %d, `female_labor` = %d, `above_18_years_old` = %d,
        `below_18_years_old` = %d, `labor_total_cost` = %d, `wage_rate_male` = %d,
        `wage_rate_female` = %d, `transplanting_method` = %d, `transplanting_carried_out` = %d,
        `total_cost_tractor` = %d, `transplanting_labor_count` = %d, `total_cost_paid_service_provider` = %d,
        `custom_extra_labor` = %d, `custom_other_labor_count` = %d, `prepared_nursery` = %d,
        `nursery_establishment_date` = "%s", `transplanting_date` = "%s", `trays_seedling_count` = %d,
        `seed_total_cost` = %d, `fertilizer_total_cost` = %d, `total_labor_cost_seedling` = %d,
        `total_cost_seedling_transport` = %d, `nursery_area` = %d, `nursery_field_area` = %d,
        `tractor_total_minute` = %d, `total_seed_cost` = %d, `seedling_labor_type` = %d,
        `seedling_male_labor` = %d, `seedling_female_labor` = %d, `seedling_above_18_years_old` = %d,
        `seedling_below_18_years_old` = %d, `nursery_labor_type` = %d, `nursery_male_labor` = %d,
        `nursery_female_labor` = %d, `nursery_above_18_years_old` = %d, `nursery_below_18_years_old` = %d,
        `nursery_labor_total_cost` = %d, `seedling_labor_total_cost` = %d
      WHERE id = %d',
      array(
        $seasonLongId,
        $data['direct_sowing_method'],
        $data['sowing_date'],
        $data['total_cost_paid_tractor'],
        $data['labor_type'],
        $data['male_labor'],
        $data['female_labor'],
        $data['above_18_years_old'],
        $data['below_18_years_old'],
        $data['labor_total_cost'],
        $data['wage_rate_male'],
        $data['wage_rate_female'],
        $data['transplanting_method'],
        $data['transplanting_carried_out'],
        $data['total_cost_tractor'],
        $data['transplanting_labor_count'],
        $data['total_cost_paid_service_provider'],
        $data['custom_extra_labor'],
        $data['custom_other_labor_count'],
        $data['prepared_nursery'],
        $data['nursery_establishment_date'],
        $data['transplanting_date'],
        $data['trays_seedling_count'],
        $data['seed_total_cost'],
        $data['fertilizer_total_cost'],
        $data['total_labor_cost_seedling'],
        $data['total_cost_seedling_transport'],
        $data['nursery_area'],
        $data['nursery_field_area'],
        $data['tractor_total_minute'],
        $data['total_seed_cost'],
        $data['seedling_labor_type'],
        $data['seedling_male_labor'],
        $data['seedling_female_labor'],
        $data['seedling_above_18_years_old'],
        $data['seedling_below_18_years_old'],
        $data['nursery_labor_type'],
        $data['nursery_male_labor'],
        $data['nursery_female_labor'],
        $data['nursery_above_18_years_old'],
        $data['nursery_below_18_years_old'],
        $data['nursery_labor_total_cost'],
        $data['seedling_labor_total_cost'],
        $id
    ));

    DB::commit();
    return $data;
  }
}
