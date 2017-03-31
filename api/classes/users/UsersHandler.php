<?php

class UsersHandler {
  const COOKIE_AUTH = 'COOKIE_AUTH';
  const COOKIE_TIME = 2592000;

  private $dao;

  public function __construct() {
    $this->dao = new UsersDAO();
  }

  public function register($data) {
    try {
      $this->dao->register($data);
      return array('data' => $this->dao->login($data));
    } catch (UsersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function login($data) {
    try {
      $info = $this->dao->login($data);
      $info['hash'] = $info['password'];

      $handler = new AuthenticationHandler();
      $handler->save(
        $info,
        isset($data['remember']) && $data['remember'] === true
      );
      unset($info['password']);
      return array('data' => $info);
    } catch (UsersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function get($id) {
    try {
      return array('data' => $this->dao->get($id));
    } catch (UsersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }
}
