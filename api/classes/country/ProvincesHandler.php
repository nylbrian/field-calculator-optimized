<?php

class ProvincesHandler {
  private $dao;

  public function __construct() {
    $this->dao = new ProvincesDAO();
  }

  public function add($regionId, $provinceName) {
    try {
      return $this->dao->add($regionId, $provinceName);
    } catch(DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }
}
