<?php

class HouseholdGraphicsHandler {
  private $dao;

  public function __construct() {
    $this->dao = new HouseholdGraphicsDAO();
  }

  public function generate($data) {
    try {
      return array('data' => $this->dao->generate($data));
    } catch (HouseholdGraphicsDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }
}
