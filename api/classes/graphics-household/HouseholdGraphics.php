<?php

class HouseholdGraphics {
  private $handler;

  public function __construct() {
    $this->handler = new HouseholdGraphicsHandler();
  }

  public function generate() {
    $data = FormInput::post();
    $result = $this->handler->generate($data);

    return ResponseHandler::formatJSONResponse($result);
  }
}
