<?php

class SeasonlongHandler {
  private $dao;

  public function __construct() {
    $this->dao = new SeasonlongDAO();
  }

  public function save($data) {
    try {
      $return = $this->dao->save($data);
      if (isset($return['answeredLastForm']) && $return['answeredLastForm']) {
        $calculate = new SeasonlongComputationHandler($data['farmers_id'], $data['farmer_seasons_id']);
        $calculate->save();
      }
      return array('data' => $return);
    } catch (SeasonlongDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function getFormData($farmerId, $farmerSeasonsId, $sowingDate, $dateNow) {
    try {
      return array('data' => $this->dao->getFormData($farmerId, $farmerSeasonsId, $sowingDate, $dateNow));
    } catch (SeasonlongDAOException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }
}
