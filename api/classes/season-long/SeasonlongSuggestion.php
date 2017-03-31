<?php

class SeasonlongSuggestion {

  public function getSuggestion($farmersId, $farmerSeasonsId) {
    $handler = new SeasonlongSuggestionHandler($farmersId, $farmerSeasonsId);
    $result = $handler->getSuggestion();
    return ResponseHandler::formatJSONResponse($result);
  }
}
