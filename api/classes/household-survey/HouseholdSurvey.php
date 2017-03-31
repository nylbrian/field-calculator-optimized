<?php

class HouseholdSurvey {
  private $handler;

  public function __construct() {
    $this->handler = new HouseholdSurveyHandler();
  }

  public function save() {
    $data = FormInput::post();
    $result = $this->handler->save($data);

    return ResponseHandler::formatJSONResponse($result);
  }

  public function getFormData($farmerId, $farmerSeasonsId, $sowingDate, $dateNow) {
    $result = $this->handler->getFormData($farmerId, $farmerSeasonsId, $sowingDate, $dateNow);

    return ResponseHandler::formatJSONResponse($result);
  }

  public function getLastAnswered($farmerId, $farmerSeasonsId, $period) {
    $result = $this->handler->getLastAnswered($farmerId, $farmerSeasonsId, $period);

    return ResponseHandler::formatJSONResponse($result);
  }
}
