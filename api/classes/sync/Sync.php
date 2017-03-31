<?php

class Sync {
  public function index() {
    switch ($_SERVER['REQUEST_METHOD']) {
      case 'POST':
        return $this->handlePost();
      break;
      case 'GET':
        return $this->handleGet();
      break;
    }

    /*$result['results'] = array('content' => 1, 'createdAt' => date());
    return ResponseHandler::formatJSONResponse($result);*/
  }

  public function handleGet() {
    switch ($_GET['type']) {
      case 'countries':
        $handler = new Countries();
        $result = $handler->getAll(true);
        return ResponseHandler::formatJSONResponse($result);
      break;
    }
  }

  public function handlePost() {
    switch ($_GET['type']) {
      case 'farmers':
        var_dump($payload);
      break;
    }
  }
}
