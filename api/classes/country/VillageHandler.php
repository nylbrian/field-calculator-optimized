<?php

class VillageHandler {
  private $dao;

  public function __construct() {
    $this->dao = new VillageDAO();
  }

  public function add($districtId, $villageName) {
    try {
      return $this->dao->add($districtId, $villageName);
    } catch(DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }
}
