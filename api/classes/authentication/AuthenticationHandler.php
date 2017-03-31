<?php

class AuthenticationHandler {
  const COOKIE_AUTH = 'COOKIE_AUTH';
  const COOKIE_TIME = 2592000;

  private $dao;

  public function __construct() {
    $this->dao = new AuthenticationDAO();
  }

  public function save($data, $remember) {
    $_SESSION['user'] = $data;

    if ($remember) {
      setcookie(
        self::COOKIE_AUTH,
        http_build_query($data),
        time() + self::COOKIE_TIME,
        '/'
      );
    }
  }

  public function getLoggedInUser() {
    if (isset($_SESSION['user'])) {
      return $_SESSION['user'];
    }

    if (isset($_COOKIE[self::COOKIE_AUTH])) {
      parse_str($_COOKIE[self::COOKIE_AUTH], $_SESSION['user']);

      $handler = new UsersHandler();
      $user = $handler->get($_SESSION['user']['id']);

      if (isset($user['error']) || $user['data']['hash'] !== $_SESSION['user']['hash']) {
        unset($_SESSION['user']);
        return false;
      }

      return $_SESSION['user'];
    }

    return false;
  }


  public function isUserLoggedIn() {
    if ($this->getLoggedInUser()) {
      return true;
    }

    return false;
  }

  public function verify() {
    try {
      return array('data' => $this->getLoggedInUser());
    } catch (UsersDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function logout() {
    unset($_COOKIE[self::COOKIE_AUTH]);
    setcookie(self::COOKIE_AUTH, null, -1, '/');
    session_unset();
    session_destroy();
    return array('data' => 'logged out', 'isLoggedIn' => $this->isUserLoggedIn());
  }
}
