<?php

class Users {
  public function __construct() {
    $this->handler = new UsersHandler();
  }

  public function index($id = null) {
    /*return $this->get($id);*/
  }

  public function login() {
    $data = FormInput::post();
    $result = $this->handler->login($data);
    return ResponseHandler::formatJSONResponse($result);
  }

  public function register() {
    $data = FormInput::post();
    $result = $this->handler->register($data);
    return ResponseHandler::formatJSONResponse($result);
  }


}
