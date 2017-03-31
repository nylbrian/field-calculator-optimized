<?php

class HouseholdSurveySuggestion {

  public function getSuggestion($farmersId, $farmerSeasonsId) {
    $handler = new HouseholdSurveySuggestionHandler($farmersId, $farmerSeasonsId);
    $result = $handler->getSuggestion();
    return ResponseHandler::formatJSONResponse($result);
  }
}
