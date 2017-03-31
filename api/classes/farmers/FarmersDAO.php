<?php

class FarmersDAO {
  const MAIN_TABLE = 'farmers';

  public function __construct() {
    $this->auth = new AuthenticationHandler();
    $this->user = $this->auth->getLoggedInUser();

    if (!$this->user) {
      throw new AuthenticationDAOException('Invalid user');
    }
  }

  public function add($data) {
    DB::startTransaction();

    $sql = 'INSERT INTO `' . self::MAIN_TABLE . '`
      (`first_name`, `last_name`, `users_id`)
      VALUES ("%s", "%s", "%s")';
    $params = array(
      $data['first_name'],
      $data['last_name'],
      $this->user['id'],
    );
    $result = DB::queryMaster($sql, $params);

    $farmerId = $result->insertId();
    if (!$farmerId) {
      DB::rollback();
      throw new FarmersDAOException('Failed to insert farmer data');
    }

    $data = $this->updateRequiredFields($farmerId, $data);
    if (!$data) {
      DB::rollback();
      throw new FarmersDAOException('Failed to update farmer details');
    }

    DB::commit();
    return $data;
  }

  public function edit($data) {
    DB::startTransaction();

    $sql = 'UPDATE `' . self::MAIN_TABLE . '`
      SET `first_name` = "%s", `last_name` = "%s", `users_id` = %d
      WHERE `id` = %d ';
    $params = array(
      $data['first_name'],
      $data['last_name'],
      $this->user['id'],
      $data['id'],
    );
    $result = DB::queryMaster($sql, $params);

    $farmerId = $data['id'];

    $data = $this->updateRequiredFields($farmerId, $data);
    if (!$data) {
      DB::rollback();
      throw new FarmersDAOException('Failed to update farmer details');
    }

    DB::commit();
    return $data;
  }

  public function updateRequiredFields($farmerId, $data) {
    DB::startTransaction();

    $countryId = $this->updateCountry($farmerId, $data);
    if (!$countryId) {
      DB::rollback();
      throw new FarmersDAOException('Failed to update farmer country');
    }

    $regionId = $this->updateRegion($farmerId, $countryId, $data);
    if (!$regionId) {
      DB::rollback();
      throw new FarmersDAOException('Failed to update farmer region');
    }

    $provinceId = $this->updateProvince($farmerId, $regionId, $data);
    if (!$provinceId) {
      DB::rollback();
      throw new FarmersDAOException('Failed to update farmer province');
    }

    $districtId = $this->updateDistrict($farmerId, $provinceId, $data['district']);
    if (!$districtId) {
      DB::rollback();
      throw new FarmersDAOException('Failed to update farmer district');
    }

    $villageId = $this->updateVillage($farmerId, $districtId, $data['village']);
    if (!$villageId) {
      DB::rollback();
      throw new FarmersDAOException('Failed to update farmer village');
    }

    $data['id'] = $farmerId;
    $data['country_id'] = $countryId;
    $data['region_id'] = $regionId;
    $data['province_id'] = $provinceId;
    $data['district_id'] = $districtId;
    $data['village_id'] = $villageId;
    DB::commit();
    return $data;
  }

  public function updateCountry($farmerId, $data) {
    if (!$farmerId || !($data['country_id'] || $data['other_country'] )) {
      return false;
    }

    if ($data['country_id']) {
      $country_id = $data['country_id'];
    } else {
      $handler = new CountriesHandler();
      $country_id = $handler->add($data['other_country']);
    }

    if (!$country_id) {
      return false;
    }

    $result = DB::queryMaster('UPDATE farmers SET countries_id = %d WHERE id = %d',
      array($country_id, $farmerId));

    return $country_id;
  }

  public function updateRegion($farmerId, $countryId, $data) {
    if (!$farmerId || !($data['region_id'] || $data['other_region'] )) {
      return false;
    }

    if ($data['region_id']) {
      $region_id = $data['region_id'];
    } else {
      $handler = new RegionsHandler();
      $region_id = $handler->add($countryId, $data['other_region']);
    }

    if (!$region_id) {
      return false;
    }

    $result = DB::queryMaster('
      UPDATE farmers
      SET region_provinces_id = %d
      WHERE id = %d', array(
        $region_id,
        $farmerId
      ));

    return $region_id;
  }

  public function updateProvince($farmerId, $regionId, $data) {
    if (!$farmerId || !($data['province_id'] || $data['other_province'] )) {
      return false;
    }

    if ($data['province_id']) {
      $provinceId = $data['province_id'];
    } else {
      $handler = new ProvincesHandler();
      $provinceId = $handler->add($regionId, $data['other_province']);
    }

    if (!$provinceId) {
      return false;
    }

    $result = DB::queryMaster('
      UPDATE farmers
      SET province_districts_id = %d
      WHERE id = %d', array(
        $provinceId,
        $farmerId
      ));

    return $provinceId;
  }

  public function updateDistrict($farmerId, $provinceId, $districtName) {
    if (!$farmerId || !$provinceId || !($districtName)) {
      return false;
    }

    $handler = new DistrictHandler();
    $districtId = $handler->add($provinceId, $districtName);

    if (!$districtId) {
      return false;
    }

    $result = DB::queryMaster('
      UPDATE farmers
      SET district_municipalities_id = %d
      WHERE id = %d', array(
        $districtId,
        $farmerId
      ));

    return $districtId;
  }

  public function updateVillage($farmerId, $districtId, $villageName) {
    if (!$farmerId || !$districtId || !($villageName)) {
      return false;
    }

    $handler = new VillageHandler();
    $villageId = $handler->add($districtId, $villageName);

    if (!$villageId) {
      return false;
    }

    $result = DB::queryMaster('
      UPDATE farmers
      SET villages_id = %d
      WHERE id = %d', array(
        $villageId,
        $farmerId
      ));

    return $villageId;
  }

  public function get($id) {
    $result = DB::querySlave('
      SELECT f.id, f.first_name, f.last_name,
        IF(c.other = 1, 0, c.id) as country_id,
        c.name as country_name,
        IF(c.other = 1, c.name, "") as other_country,
        IF(rp.other = 1, 0, rp.id) as region_id,
        IF(rp.other = 1, rp.name, "") as other_region,
        IF(pd.other = 1, 0, pd.id) as province_id,
        IF(pd.other = 1, pd.name, "") as other_province,
        dm.id as district_id, dm.name as district,
        v.id as village_id, v.name as village
      FROM farmers f
        INNER JOIN countries c ON c.id = f.countries_id
        INNER JOIN region_provinces rp ON rp.id = f.region_provinces_id
        INNER JOIN province_districts pd ON pd.id = f.province_districts_id
        INNER JOIN district_municipalities dm ON dm.id = f.district_municipalities_id
        INNER JOIN villages v ON v.id = f.villages_id
      WHERE f.id = %d', array($id));

    if ($result->numRows() <= 0) {
      throw new FarmersDAOException('Farmer ID not found');
    }

    $result = $result->fetch();
    return $result[0];
  }

  public function getAll() {
    $result = DB::querySlave('
      SELECT f.id, f.first_name, f.last_name,
        IF(c.other = 1, 0, c.id) as country_id,
        IF(c.other = 1, c.name, "") as other_country,
        c.name as country,
        IF(rp.other = 1, 0, rp.id) as region_id,
        IF(rp.other = 1, rp.name, "") as other_region,
        rp.name as region,
        IF(pd.other = 1, 0, pd.id) as province_id,
        IF(pd.other = 1, pd.name, "") as other_province,
        pd.name as province,
        dm.id as district_id, dm.name as district,
        v.id as village_id, v.name as village
      FROM farmers f
        INNER JOIN countries c ON c.id = f.countries_id
        INNER JOIN region_provinces rp ON rp.id = f.region_provinces_id
        INNER JOIN province_districts pd ON pd.id = f.province_districts_id
        INNER JOIN district_municipalities dm ON dm.id = f.district_municipalities_id
        INNER JOIN villages v ON v.id = f.villages_id
      WHERE f.import = 0 ' . ($this->user['role'] != 1 ? (' AND f.users_id = ' . $this->user['id']) : '') );

    if ($result->numRows() <= 0) {
      throw new FarmersDAOException('No farmers added to database');
    }

    $result = $result->fetch();
    return $result;
  }

  public function delete($id) {
    DB::startTransaction();
    DB::queryMaster('DELETE FROM `farmers` WHERE id = %d', array($id));
    DB::commit();

    return true;
  }
}
