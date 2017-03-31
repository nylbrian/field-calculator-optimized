<?php

class FiltersDAO {
  private $join;
  private $where;

  protected function setAdditionalFilters($data) {
    $this->join = '';
    $this->where = '';

    $where = array();
    $join = array();

    if (isset($data['country_ids']) && is_array($data['country_ids']) &&
      count($data['country_ids']) > 0) {
      $where[] = vsprintf(' c.id IN (%s) ', array(implode(', ', $data['country_ids'])));
    }

    if (isset($data['region_ids']) && is_array($data['region_ids']) &&
      count($data['region_ids']) > 0) {
      $where[] = vsprintf(' rp.id IN (%s) ', array(implode(', ', $data['region_ids'])));

      if (isset($data['province_ids']) && is_array($data['province_ids']) &&
        count($data['province_ids']) > 0) {
        $where[] = vsprintf(' pd.id IN (%s) ', array(implode(', ', $data['province_ids'])));

        if (isset($data['district_ids']) && is_array($data['district_ids']) &&
          count($data['district_ids']) > 0) {
          $where[] = vsprintf(' dm.id IN (%s) ', array(implode(', ', $data['district_ids'])));

          if (isset($data['village_ids']) && is_array($data['village_ids']) &&
            count($data['village_ids']) > 0) {
            $where[] = vsprintf(' dm.id IN (%s) ', array(implode(', ', $data['district_ids'])));
          }
        }
      }
    }

    if (isset($data['year_ids']) && is_array($data['year_ids']) &&
      count($data['year_ids']) > 0) {
      $where[] = vsprintf(' fs.year IN (%s) ', array(implode(', ', $data['year_ids'])));
    }

    if (isset($data['season_ids']) && is_array($data['season_ids']) &&
      count($data['season_ids']) > 0) {
      $where[] = vsprintf(' fs.seasons_id IN (%s) ', array(implode(', ', $data['season_ids'])));
    }

    if (count($where) > 0) {
      $this->where = ' WHERE ' . implode(' AND ', $where);
    }

    if (count($join) > 0) {
      $this->join = implode(' ', $join);
    }
  }

  protected function getCommonQuery($fields) {
    return vsprintf("
      SELECT DISTINCT %s
      FROM season_long_computations slc
        INNER JOIN farmers f ON f.id = slc.farmers_id
        INNER JOIN countries c ON c.id = f.countries_id
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id ", array($fields));
  }

  public function getCountries() {
    $result = DB::queryMaster(
      $this->getCommonQuery('c.id, c.name') .
      ' ORDER BY c.name ASC ');
    return $result->fetch();
  }

  public function getYears($data) {
    $this->setAdditionalFilters($data);

    $result = DB::queryMaster($this->getCommonQuery('year as id, year as name') .
      $this->join .
      $this->where .
      'ORDER BY name ASC ');
    return $result->fetch();
  }

  public function getSeasons($data) {
    $this->setAdditionalFilters($data);

    $result = DB::queryMaster($this->getCommonQuery('seasons_id as id, seasons_id as name') .
      ' LEFT JOIN region_provinces rp ON rp.countries_id = c.id ' .
      ' LEFT JOIN province_districts pd ON pd.region_provinces_id = rp.id ' .
      ' LEFT JOIN district_municipalities dm ON dm.province_districts_id = pd.id ' .
      ' LEFT JOIN villages v ON dm.id = v.district_municipalities_id ' .
      $this->join .
      $this->where .
      'ORDER BY name ASC ');
    return $result->fetch();
  }

  public function getRegions($data) {
    $this->setAdditionalFilters($data);

    $result = DB::queryMaster($this->getCommonQuery('rp.id, rp.name') .
      ' INNER JOIN region_provinces rp ON rp.countries_id = c.id ' .
      $this->join .
      $this->where .
      'ORDER BY rp.name ASC ');
    return $result->fetch();
  }

  public function getProvinces($data) {
    $this->setAdditionalFilters($data);

    $result = DB::queryMaster($this->getCommonQuery('pd.id, pd.name') .
      ' INNER JOIN region_provinces rp ON rp.countries_id = c.id ' .
      ' INNER JOIN province_districts pd ON pd.region_provinces_id = rp.id ' .
      $this->join .
      $this->where .
      'ORDER BY pd.name ASC ');
    return $result->fetch();
  }

  public function getDistricts($data) {
    $this->setAdditionalFilters($data);

    $result = DB::queryMaster($this->getCommonQuery('dm.id, dm.name') .
      ' INNER JOIN region_provinces rp ON rp.countries_id = c.id ' .
      ' INNER JOIN province_districts pd ON pd.region_provinces_id = rp.id ' .
      ' INNER JOIN district_municipalities dm ON dm.province_districts_id = pd.id ' .
      $this->join .
      $this->where .
      'ORDER BY dm.name ASC ');
    return $result->fetch();
  }

  public function getVillages($data) {
    $this->setAdditionalFilters($data);

    $result = DB::queryMaster($this->getCommonQuery('v.id, v.name') .
      ' INNER JOIN region_provinces rp ON rp.countries_id = c.id ' .
      ' INNER JOIN province_districts pd ON pd.region_provinces_id = rp.id ' .
      ' INNER JOIN district_municipalities dm ON dm.province_districts_id = pd.id ' .
      ' INNER JOIN villages v ON dm.id = v.district_municipalities_id ' .
      $this->join .
      $this->where .
      'ORDER BY v.name ASC ');
    return $result->fetch();
  }
}
