<?php

class SeasonsHandler {
  private $dao;

  public function __construct() {
    $this->dao = new SeasonsDAO();
  }

  public function add($data) {
    try {
      return array('data' => $this->dao->add($data));
    } catch (SeasonsDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function edit($id, $data) {
    try {
      return array('data' => $this->dao->edit($id, $data));
    } catch (SeasonsDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function get($id) {
    try {
      return array('data' => $this->dao->get($id));
    } catch (SeasonsDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function getAllByFarmerId($id) {
    try {
      return array('data' => $this->dao->getAllByFarmerId($id));
    } catch (SeasonsDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

}
