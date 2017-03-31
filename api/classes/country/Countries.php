<?php

class Countries {
  public function __construct() {
    $this->handler = new CountriesHandler();
  }

  public function index($id = null) {
    return $this->get($id);
  }

  public function getAll($asArray = false) {
    $result = $this->handler->getAll($asArray);
    return ResponseHandler::formatJSONResponse($result);
  }

  public function countryReader() {
    $this->handler->countryReader();
  }

  public function getCurrencies() {
    $result = $this->handler->getCurrencies();
    return ResponseHandler::formatJSONResponse($result);
  }

  public function updateExchangeRate() {
    $result = $this->handler->updateExchangeRate();
    return ResponseHandler::formatJSONResponse($result);
  }
}
