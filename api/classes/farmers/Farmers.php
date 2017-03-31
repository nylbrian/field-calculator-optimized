<?php

class Farmers {
  public function __construct() {
    $this->handler = new FarmersHandler();
  }

  public function index($id = null) {
    return $this->get($id);
  }

  public function add() {
    $data = FormInput::post();
    $result = $this->handler->add($data);
    return ResponseHandler::formatJSONResponse($result);
  }

  public function edit() {
    $data = FormInput::post();
    $result = $this->handler->edit($data);
    return ResponseHandler::formatJSONResponse($result);
  }

  public function get($id = null) {
    $result = $this->handler->get($id);
    return ResponseHandler::formatJSONResponse($result);
  }

  public function getAll() {
    $result = $this->handler->getAll();
    return ResponseHandler::formatJSONResponse($result);
  }

  public function delete() {
    $data = FormInput::post();
    $result = $this->handler->delete($data['id']);
    return ResponseHandler::formatJSONResponse($result);
  }
}
