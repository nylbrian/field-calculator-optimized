<?php

class DistrictUploader {
  public function __construct() {
    $this->handler = new DistrictUploaderHandler();
  }

  public function index($id = null) {
    return $this->get($id);
  }

  public function save() {
    $data = FormInput::post();
    $result = $this->handler->save();

    return ResponseHandler::formatJSONResponse($result);
  }
}
