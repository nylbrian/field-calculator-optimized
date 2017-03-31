<?php

class FarmersHandler {
  private $dao;

  public function __construct() {
    $this->dao = new FarmersDAO();
  }

  public function add($data) {
    try {
      return array('data' => $this->dao->add($data));
    } catch (FarmersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    } catch (AuthenticationDAOException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function edit($data) {
    try {
      return array('data' => $this->dao->edit($data));
    } catch (FarmersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    } catch (AuthenticationDAOException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function get($id) {
    try {
      return array('data' => $this->dao->get($id));
    } catch (FarmersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    } catch (AuthenticationDAOException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function getAll() {
    try {
      return array('data' => $this->dao->getAll());
    } catch (FarmersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    } catch (AuthenticationDAOException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function delete($id) {
    try {
      return array('data' => $this->dao->delete($id));
    } catch (FarmersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    } catch (AuthenticationDAOException $e) {
      return array('error' => $e->getMessage());
    }
  }
}
