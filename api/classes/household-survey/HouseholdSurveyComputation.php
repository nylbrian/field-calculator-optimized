<?php

class HouseholdSurveyComputation {
  public function compute($farmerId, $farmerSeasonsId) {
    $this->handler = new HouseholdSurveyComputationHandler($farmerId, $farmerSeasonsId);
    $result = $this->handler->compute();

    echo '<pre>' . print_r($result, true) . '</pre>';
    die();

    return ResponseHandler::formatJSONResponse($result);
  }
}
