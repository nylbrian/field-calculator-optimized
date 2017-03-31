<?php

class CountryUploader {
  public function __construct() {
    $this->handler = new CountryUploaderHandler();
  }

  public function index($id = null) {
    return $this->get($id);
  }

  public function getAll() {
    $result = $this->handler->getAll();
    return ResponseHandler::formatJSONResponse($result);
  }

  public function save() {
    $data = FormInput::post();
    $result = $this->handler->save();

    return ResponseHandler::formatJSONResponse($result);
  }
}
