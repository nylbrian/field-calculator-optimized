<?php

class SeasonlongComputation {
  public function compute($farmerId, $farmerSeasonsId) {
    $this->handler = new SeasonlongComputationHandler($farmerId, $farmerSeasonsId);
    $result = $this->handler->compute();

    echo '<pre>' . print_r($result, true) . '</pre>';
    die();

    return ResponseHandler::formatJSONResponse($result);
  }
}
