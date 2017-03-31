<?php

class GraphicsHandler {
  private $dao;

  public function __construct() {
    $this->dao = new GraphicsDAO();
  }

  public function generate($data) {
    try {
      return array('data' => $this->dao->generate($data));
    } catch (GraphicsDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }
}
