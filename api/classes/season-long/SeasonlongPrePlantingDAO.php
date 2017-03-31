<?php

class SeasonlongPreplantingDAO {
  const MAIN_TABLE = 'season_long_pre_planting_information';
  const ORGANIC_MATERIALS_TABLE = 'season_long_pre_planting_information_organic_materials';

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
      (`season_long_id`, `rice_area`, `parcel_has_treatment`, `treatment_name`, `treatment_name_other`,
        `previous_crop`, `cropping_system`, `previous_crop_harvested`, `straw_previous_crop_managed`,
        `gps_north`, `gps_east`, `incorporate_organic_material`, `organic_materials_incorporated`,
        `organic_material_cost`, `water_regime`, `rice_variety_name`, `seed_count`, land_rental, rent_cost,
        grain_yield_previous, straw_burned, seed_type, seed_type_other, soil_fertility, irrigation_regime, seed_certified)
      VALUES
      (%d, "%s", %d, "%s", "%s", "%s", "%s", "%s", "%s", %d, %d, %d, "%s", %d, "%s", "%s", %d, %d, %d, %d, %d,
        %d, "%s", %d, %d, %d)';

    $params = array(
      $seasonLongId,
      $data['rice_area'],
      $data['parcel_has_treatment'],
      $data['treatment_name'],
      $data['treatment_name_other'],
      $data['previous_crop'],
      $data['cropping_system'],
      $data['previous_crop_harvested'],
      $data['straw_previous_crop_managed'],
      $data['gps_north'],
      $data['gps_east'],
      $data['incorporate_organic_material'],
      $data['organic_materials_incorporated'],
      $data['organic_material_cost'],
      $data['water_regime'],
      $data['rice_variety_name'],
      $data['seed_count'],
      $data['land_rental'],
      $data['rent_cost'],
      $data['grain_yield_previous'],
      $data['straw_burned'],
      $data['seed_type'],
      $data['seed_type_other'],
      $data['soil_fertility'],
      $data['irrigation_regime'],
      $data['seed_certified'],
    );

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    if (!$id) {
      DB::rollback();
      throw new SeasonlongDAOException('Failed to insert pre planting information');
    }

    if ($data['organic_materials']) {
      $this->saveOrganicMaterials($data['organic_materials'], $id);
    }

    DB::commit();
    $data['id'] = $id;
    return $data;
  }

  public function saveOrganicMaterials($data, $id) {
    DB::startTransaction();

    $sql = 'DELETE FROM `' . self::ORGANIC_MATERIALS_TABLE . '`
      WHERE `season_long_pre_planting_information_id` = %d';

    DB::queryMaster($sql, array($id));

    foreach ($data as $key => $value) {
      if ($value['checked']) {
        DB::queryMaster('INSERT INTO `' . self::ORGANIC_MATERIALS_TABLE . '`
          (season_long_pre_planting_information_id, name, amount) VALUES
          (%d, "%s", %d)',
          array($id, $key, $value['amount'])
        );
      }
    }

    DB::commit();
    return true;
  }

  public function get($seasonLongId) {
    $result = DB::querySlave('
      SELECT * FROM season_long_pre_planting_information WHERE season_long_id = %d
    ', array($seasonLongId));

    if ($result->numRows() <= 0) {
      return false;
    }

    $data = $result->fetchFirstRow();
    $data['organic_materials'] = $this->getOrganicMaterials($data['id']);

    return $data;
  }

  public function getOrganicMaterials($id) {
    $result = DB::querySlave('
      SELECT * FROM season_long_pre_planting_information_organic_materials
      WHERE season_long_pre_planting_information_id = %d',
      array($id));

    if ($result->numRows() <= 0) {
      return false;
    }

    $result = $result->fetch();

    $data = array();
    foreach($result as $value) {
      $data[$value['name']] = array(
        'checked' => true,
        'amount' => $value['amount'],
        'name' => $value['name'],
      );
    }

    return $data;
  }

  public function update($id, $data, $seasonLongId) {
    DB::startTransaction();

    $sql = 'UPDATE `' . self::MAIN_TABLE . '`
      SET `season_long_id` = %d, `rice_area` = "%s", `parcel_has_treatment` = %d,
        `treatment_name` = "%s", `treatment_name_other` = "%s",
        `previous_crop` = "%s", `cropping_system` = "%s", `previous_crop_harvested` = "%s",
        `straw_previous_crop_managed` = "%s", `gps_north` = %d, `gps_east` = %d,
        `incorporate_organic_material` = %d, `organic_materials_incorporated` = "%s",
        `organic_material_cost` = %d, `water_regime` = "%s", `rice_variety_name` = "%s", `seed_count` = "%d",
        land_rental= %d, rent_cost = %d, grain_yield_previous = %d, straw_burned = %d,
        seed_type = %d, seed_type_other = "%s", soil_fertility = %d, irrigation_regime = %d,
        seed_certified = %d
      WHERE id = %d';

    $params = array(
      $seasonLongId,
      $data['rice_area'],
      $data['parcel_has_treatment'],
      $data['treatment_name'],
      $data['treatment_name_other'],
      $data['previous_crop'],
      $data['cropping_system'],
      $data['previous_crop_harvested'],
      $data['straw_previous_crop_managed'],
      $data['gps_north'],
      $data['gps_east'],
      $data['incorporate_organic_material'],
      $data['organic_materials_incorporated'],
      $data['organic_material_cost'],
      $data['water_regime'],
      $data['rice_variety_name'],
      $data['seed_count'],
      $data['land_rental'],
      $data['rent_cost'],
      $data['grain_yield_previous'],
      $data['straw_burned'],
      $data['seed_type'],
      $data['seed_type_other'],
      $data['soil_fertility'],
      $data['irrigation_regime'],
      $data['seed_certified'],
      $id
    );

    $result = DB::queryMaster($sql, $params);

    if ($data['organic_materials']) {
      $this->saveOrganicMaterials($data['organic_materials'], $id);
    }

    DB::commit();
    return $data;
  }

}
