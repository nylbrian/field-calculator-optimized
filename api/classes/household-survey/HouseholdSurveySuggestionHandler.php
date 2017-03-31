<?php

class HouseholdSurveySuggestionHandler {
  private $dao;

  public function __construct($farmersId, $farmerSeasonsId) {
    $this->dao = new HouseholdSurveySuggestionDAO($farmersId, $farmerSeasonsId);
  }

  public function getSuggestion() {
    try {
      return array('data' => $this->dao->getSuggestion());
    } catch (HouseholdSurveySuggestionDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }
}
