<?php

class ProvinceUploader {
  public function __construct() {
    $this->handler = new ProvinceUploaderHandler();
  }

  public function index($id = null) {
    return $this->get($id);
  }

  public function get($id = null) {
    return $this->handler->get($id);
  }

  public function save() {
    $data = FormInput::post();
    $result = $this->handler->save();

    return ResponseHandler::formatJSONResponse($result);
  }
}
