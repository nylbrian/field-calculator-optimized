<?php

class HouseholdSurveyHandler {
  private $dao;

  public function __construct() {
    $this->dao = new HouseholdSurveyDAO();
  }

  public function save($data) {
    try {
      $return = $this->dao->save($data);
      $calculate = new HouseholdSurveyComputationHandler($data['farmers_id'], $data['farmer_seasons_id']);
      $calculate->save();
      return array('data' => $return);
    } catch (HouseholdSurveyDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function getFormData($farmerId, $farmerSeasonsId, $sowingDate, $dateNow) {
    try {
      return array('data' => $this->dao->getFormData($farmerId, $farmerSeasonsId, $sowingDate, $dateNow));
    } catch (HouseholdSurveyDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }
}
