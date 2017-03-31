<?php

class Graphics {
  private $handler;

  public function __construct() {
    $this->handler = new GraphicsHandler();
  }

  public function generate() {
    $data = FormInput::post();
    $result = $this->handler->generate($data);

    return ResponseHandler::formatJSONResponse($result);
  }
}
