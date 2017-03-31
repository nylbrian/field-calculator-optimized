<?php

class ProvincesDAO {
  const MAIN_TABLE = 'province_districts';

  public function add($regionId, $provinceName) {
    if (!($regionId || $provinceName)) {
      return false;
    }

    $region = DB::querySlave('
      SELECT id from province_districts
      WHERE region_provinces_id = %d AND name = "%s"', array($regionId, $provinceName));
    $result = $region->fetch();

    if (count($result) > 0) {
      return $result[0]['id'];
    }

    $result = DB::queryMaster('
      INSERT INTO province_districts
        (region_provinces_id, name, is_province, other)
      VALUES
        (%d, "%s", 1, 1)', array($regionId, $provinceName));

    return $result->insertId();
  }

  public function getAllByRegion($regionId) {
    $sql = 'SELECT * FROM ' . self::MAIN_TABLE . ' WHERE deleted = 0 AND region_provinces_id = %d AND other = 0';
    $result = DB::querySlave($sql, array($regionId));

    if ($result->numRows() <= 0) {
      return;
    }

    $provinces = $result->fetch();
    $provinceList = array();

    foreach ($provinces as $province) {
      $provinceList[$province['id']] = $province;
    }

    return $provinceList;
  }
}
