<?php

class CountriesHandler {
  private $dao;

  public function __construct() {
    $this->dao = new CountriesDAO();
  }

  public function add($countryName) {
    try {
      return $this->dao->add($countryName);
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  public function getAll($asArray = false) {
    try {
      return array('content' => $this->dao->getAll($asArray));
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function countryReader() {
    return $this->dao->countryReader();
  }

  public function getCurrencies() {
    return $this->dao->getCurrencies();
  }

  public function updateExchangeRate() {
    return $this->dao->updateExchangeRate();
  }
}
