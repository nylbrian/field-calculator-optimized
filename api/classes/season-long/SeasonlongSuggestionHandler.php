<?php

class SeasonlongSuggestionHandler {
  private $dao;

  public function __construct($farmersId, $farmerSeasonsId) {
    $this->dao = new SeasonlongSuggestionDAO($farmersId, $farmerSeasonsId);
  }

  public function getSuggestion() {
    try {
      return array('data' => $this->dao->getSuggestion());
    } catch (SeasonlongSuggestionDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }
}
