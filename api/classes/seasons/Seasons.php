<?php

class Seasons {
  public function __construct() {
    $this->handler = new SeasonsHandler();
  }

  public function add() {
    $data = FormInput::post();
    $result = $this->handler->add($data);
    return ResponseHandler::formatJSONResponse($result);
  }

  public function edit($id = null) {
    $data = FormInput::post();
    $result = $this->handler->edit($id, $data);
    return ResponseHandler::formatJSONResponse($result);
  }

  public function get($id = null) {
    $result = $this->handler->get($id);
    return ResponseHandler::formatJSONResponse($result);
  }

  public function getAllByFarmerId($id = null) {
    $result = $this->handler->getAllByFarmerId($id);
    return ResponseHandler::formatJSONResponse($result);
  }
}
