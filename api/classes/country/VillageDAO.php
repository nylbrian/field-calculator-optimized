<?php

class VillageDAO {
  public function add($districtId, $villageName) {
    if (!($districtId || $villageName)) {
      return false;
    }

    $region = DB::querySlave('
      SELECT id from villages
      WHERE district_municipalities_id = %d AND name = "%s"', array($districtId, $villageName));
    $result = $region->fetch();

    if (count($result) > 0) {
      return $result[0]['id'];
    }

    $result = DB::queryMaster('
      INSERT INTO villages
        (district_municipalities_id, name)
      VALUES
        (%d, "%s")', array($districtId, $villageName));

    return $result->insertId();
  }
}
