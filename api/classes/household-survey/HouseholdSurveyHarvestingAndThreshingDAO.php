<?php

class HouseholdSurveyHarvestingAndThreshingDAO {
  const MAIN_TABLE = 'household_survey_harvesting_threshing';

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
      (`household_survey_id`, `harvesting_method`, `crop_harvest_date`,
      `combine_harvesting_total`, `harvesting_completion_time`,
      `combine_harvester_horse_power`, `combine_harvester_cutting_width`,
      `labor_type`, `male_labor`, `female_labor`, `above_18_years_old`,
      `below_18_years_old`, `additional_labor`, `additional_labor_cost`,
      `combine_harvester_owner`, `manual_cutting_labor_count`,
      `total_labor_cost`, `amount_paid`, `wage_rate_male`, `wage_rate_female`,
      `labor_count_manual_cutting`, `threshing_date`,
      `thresher_operating_minute`, `threshing_machine_horse_power`,
      `threshing_total_cost`, `wage_rate_male_labor`,
      `wage_rate_female_labor`, `cutting_date`,
      `machine_cutting_name`, `total_cost_cutting`,
      `labor_count_cutting_rice`, `male_cutting_wage_rate`,
      `female_cutting_wage_rate`, `rice_managed`,
      `removed_straw`, `grain_moisture_content`, `total_cost_manual_cutting`)
      VALUES
      (%d, "%s", "%s", %d, %d, %d, %d, "%s", %d, %d, %d,
       %d, %d, %d, "%s", %d, %d, %d, %d, %d, %d, "%s",
       %d, %d, %d, %d, %d, "%s", "%s", %d, %d, %d,
       %d, "%s", "%s", %d, %d)';

    $params = array(
      $seasonLongId,
      $data['harvesting_method'],
      $data['crop_harvest_date'],
      $data['combine_harvesting_total'],
      $data['harvesting_completion_time'],
      $data['combine_harvester_horse_power'],
      $data['combine_harvester_cutting_width'],
      $data['labor_type'],
      $data['male_labor'],
      $data['female_labor'],
      $data['above_18_years_old'],
      $data['below_18_years_old'],
      $data['additional_labor'],
      $data['additional_labor_cost'],
      $data['combine_harvester_owner'],
      $data['manual_cutting_labor_count'],
      $data['total_labor_cost'],
      $data['amount_paid'],
      $data['wage_rate_male'],
      $data['wage_rate_female'],
      $data['labor_count_manual_cutting'],
      $data['threshing_date'],
      $data['thresher_operating_minute'],
      $data['threshing_machine_horse_power'],
      $data['threshing_total_cost'],
      $data['wage_rate_male_labor'],
      $data['wage_rate_female_labor'],
      $data['cutting_date'],
      $data['machine_cutting_name'],
      $data['total_cost_cutting'],
      $data['labor_count_cutting_rice'],
      $data['male_cutting_wage_rate'],
      $data['female_cutting_wage_rate'],
      $data['rice_managed'],
      $data['removed_straw'],
      $data['grain_moisture_content'],
      $data['total_cost_manual_cutting']
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new HouseholdSurveyDAOException('Failed to insert harvesting and threshing information');
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

    DB::queryMaster('
      UPDATE `' . self::MAIN_TABLE . '`
      SET `household_survey_id` = %d, `harvesting_method` = %d, `crop_harvest_date` = "%s",
      `combine_harvesting_total` = %d, `harvesting_completion_time` = %d,
      `combine_harvester_horse_power` = %d, `combine_harvester_cutting_width` = %d,
      `labor_type` = %d, `male_labor` = %d, `female_labor` = %d, `above_18_years_old` = %d,
      `below_18_years_old` = %d, `additional_labor` = %d, `additional_labor_cost` = %d,
      `combine_harvester_owner` = %d, `manual_cutting_labor_count` = %d,
      `total_labor_cost` = %d, `amount_paid` = %d, `wage_rate_male` = %d, `wage_rate_female` = %d,
      `labor_count_manual_cutting` = %d, `threshing_date` = "%s",
      `thresher_operating_minute` = %d, `threshing_machine_horse_power` = %d,
      `threshing_total_cost` = %d, `wage_rate_male_labor` = %d,
      `wage_rate_female_labor` = %d, `cutting_date` = "%s",
      `machine_cutting_name` = "%s", `total_cost_cutting` = %d,
      `labor_count_cutting_rice` = %d, `male_cutting_wage_rate` = %d,
      `female_cutting_wage_rate` = %d, `rice_managed` = %d,
      `removed_straw` = %d, `grain_moisture_content` = %d, `total_cost_manual_cutting` = %d
      WHERE id = %d
    ',
      array(
        $seasonLongId,
        $data['harvesting_method'],
        $data['crop_harvest_date'],
        $data['combine_harvesting_total'],
        $data['harvesting_completion_time'],
        $data['combine_harvester_horse_power'],
        $data['combine_harvester_cutting_width'],
        $data['labor_type'],
        $data['male_labor'],
        $data['female_labor'],
        $data['above_18_years_old'],
        $data['below_18_years_old'],
        $data['additional_labor'],
        $data['additional_labor_cost'],
        $data['combine_harvester_owner'],
        $data['manual_cutting_labor_count'],
        $data['total_labor_cost'],
        $data['amount_paid'],
        $data['wage_rate_male'],
        $data['wage_rate_female'],
        $data['labor_count_manual_cutting'],
        $data['threshing_date'],
        $data['thresher_operating_minute'],
        $data['threshing_machine_horse_power'],
        $data['threshing_total_cost'],
        $data['wage_rate_male_labor'],
        $data['wage_rate_female_labor'],
        $data['cutting_date'],
        $data['machine_cutting_name'],
        $data['total_cost_cutting'],
        $data['labor_count_cutting_rice'],
        $data['male_cutting_wage_rate'],
        $data['female_cutting_wage_rate'],
        $data['rice_managed'],
        $data['removed_straw'],
        $data['grain_moisture_content'],
        $data['total_cost_manual_cutting'],
        $id
    ));

    DB::commit();
    return $data;
  }
}
