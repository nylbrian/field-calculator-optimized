<?php

class DistrictHandler {
  private $dao;

  public function __construct() {
    $this->dao = new DistrictDAO();
  }

  public function add($provinceId, $districtName) {
    try {
      return $this->dao->add($provinceId, $districtName);
    } catch(DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }
}
