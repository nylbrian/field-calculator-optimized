<?php

class RegionsHandler {
  private $dao;

  public function __construct() {
    $this->dao = new RegionsDAO();
  }

  public function add($countryId, $regionName) {
    try {
      return $this->dao->add($countryId, $regionName);
    } catch(DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }
}
