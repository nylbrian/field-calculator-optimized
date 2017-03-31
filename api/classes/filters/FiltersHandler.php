<?php

class FiltersHandler {
  private $dao;

  public function __construct() {
    $this->dao = new FiltersDAO();
  }

  public function getCountries() {
    try {
      return array('data' => $this->dao->getCountries());
    } catch (FiltersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function getYears($data) {
    try {
      return array('data' => $this->dao->getYears($data));
    } catch (FiltersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function getSeasons($data) {
    try {
      return array('data' => $this->dao->getSeasons($data));
    } catch (FiltersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function getRegions($data) {
    try {
      return array('data' => $this->dao->getRegions($data));
    } catch (FiltersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function getProvinces($data) {
    try {
      return array('data' => $this->dao->getProvinces($data));
    } catch (FiltersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function getDistricts($data) {
    try {
      return array('data' => $this->dao->getDistricts($data));
    } catch (FiltersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function getVillages($data) {
    try {
      return array('data' => $this->dao->getVillages($data));
    } catch (FiltersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }
}
