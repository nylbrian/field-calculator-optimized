<?php

class Filters {
  private $handler;

  public function __construct() {
    $this->handler = new FiltersHandler();
  }

  public function getCountries() {
    $result = $this->handler->getCountries();

    return ResponseHandler::formatJSONResponse($result);
  }

  public function getYears() {
    $data = FormInput::post();
    $result = $this->handler->getYears($data);

    return ResponseHandler::formatJSONResponse($result);
  }

  public function getSeasons() {
    $data = FormInput::post();
    $result = $this->handler->getSeasons($data);

    return ResponseHandler::formatJSONResponse($result);
  }

  public function getRegions() {
    $data = FormInput::post();
    $result = $this->handler->getRegions($data);

    return ResponseHandler::formatJSONResponse($result);
  }

  public function getProvinces() {
    $data = FormInput::post();
    $result = $this->handler->getProvinces($data);

    return ResponseHandler::formatJSONResponse($result);
  }

  public function getDistricts() {
    $data = FormInput::post();
    $result = $this->handler->getDistricts($data);

    return ResponseHandler::formatJSONResponse($result);
  }

  public function getVillages() {
    $data = FormInput::post();
    $result = $this->handler->getVillages($data);

    return ResponseHandler::formatJSONResponse($result);
  }
}
