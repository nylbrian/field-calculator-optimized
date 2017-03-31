<?php

class RegionsDAO {
  const MAIN_TABLE = 'region_provinces';

  private $provinceDAO;

  public function __construct() {
    $this->provinceDAO = new ProvincesDAO();
  }

  public function add($countryId, $regionName = '') {
    if (!($countryId || $regionName)) {
      return false;
    }

    $region = DB::querySlave('
      SELECT id from region_provinces
      WHERE countries_id = %d AND name = "%s"', array($countryId, $regionName));
    $result = $region->fetch();

    if (count($result) > 0) {
      return $result[0]['id'];
    }

    $result = DB::queryMaster('
      INSERT INTO region_provinces
        (countries_id, name, is_region, other)
      VALUES
        (%d, "%s", 1, 1)', array($countryId, $regionName));

    return $result->insertId();
  }

  public function getAllByCountry($countryId) {
    $sql = 'SELECT * FROM ' . self::MAIN_TABLE . ' WHERE deleted = 0 AND countries_id = %d AND other = 0';
    $result = DB::querySlave($sql, array($countryId));

    if ($result->numRows() <= 0) {
      return;
    }

    $regions = $result->fetch();
    $regionList = array();

    foreach ($regions as &$region) {
      $region['provinces'] = $this->provinceDAO->getAllByRegion($region['id']);
      $regionList[$region['id']] = $region;
    }

    return $regionList;
  }
}
