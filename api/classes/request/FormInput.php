<?php

class FormInput {

  public static function get() {
    return $_GET;
  }

  public static function post() {
    $payload = json_decode(file_get_contents('php://input'), true);
    return $payload ? $payload : $_POST;
  }

  public static function request() {
    return $_REQUEST;
  }

}
