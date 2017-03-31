<?php

class Authentication {
  public function __construct() {
    $this->handler = new AuthenticationHandler();
  }

  public function index($id = null) {
    /*return $this->get($id);*/
  }

  public function verify() {
    $result = $this->handler->verify();
    return ResponseHandler::formatJSONResponse($result);
  }

  public function logout() {
    $result = $this->handler->logout();
    return ResponseHandler::formatJSONResponse($result);
  }
}
