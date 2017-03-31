<?php

class DistrictDAO {
  public function add($provinceId, $districtName) {
    if (!($provinceId || $districtName)) {
      return false;
    }

    $region = DB::querySlave('
      SELECT id from district_municipalities
      WHERE province_districts_id = %d AND name = "%s"', array($provinceId, $districtName));
    $result = $region->fetch();

    if (count($result) > 0) {
      return $result[0]['id'];
    }

    $result = DB::queryMaster('
      INSERT INTO district_municipalities
        (province_districts_id, name, is_district)
      VALUES
        (%d, "%s", 1)', array($provinceId, $districtName));

    return $result->insertId();
  }
}
