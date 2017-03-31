<?php

class HouseholdSurveyDAO {

  public function save($data) {
    DB::startTransaction();

    $id = $this->getId($data['farmers_id'], $data['farmer_seasons_id']);

    if (!$id) {
      $result = DB::queryMaster('
        INSERT INTO `household_survey`(farmers_id, farmer_seasons_id) VALUES(%d, %d)',
        array($data['farmers_id'], $data['farmer_seasons_id']));

      if (!$result->insertID()) {
        DB::rollback();
        throw new HouseholdSurveyDAOException('Failed to insert season long data');
      }
      $id = $result->insertID();
    }

    $return = array('household_survey_id' => $id);

    $forms = $data['data'];

    if (isset($forms['generalInformation']) && count($forms['generalInformation']['data']) > 0) {
      $dao = new HouseholdSurveyGeneralInformationDAO();
      $return['generalInformation'] = $dao->insert($forms['generalInformation']['data'], $id);
    }


    if (isset($forms['prePlanting']) && count($forms['prePlanting']['data']) > 0) {
      $dao = new HouseholdSurveyPrePlantingDAO();
      $return['prePlantingInformation'] = $dao->insert($forms['prePlanting']['data'], $id);
    }

    if (isset($forms['landPreparation']) && count($forms['landPreparation']['data']) > 0) {
      $dao = new HouseholdSurveyLandPreparationDAO();
      $return['landPreparation'] = $dao->insert($forms['landPreparation']['data'], $id);
    }

    if (isset($forms['sowingTransplanting']) && count($forms['sowingTransplanting']['data']) > 0) {
      $dao = new HouseholdSurveySowingTransplantingDAO();
      $return['sowingTransplanting'] = $dao->insert($forms['sowingTransplanting']['data'], $id);
    }

    if (isset($forms['irrigation']) && count($forms['irrigation']['data']) > 0) {
      $dao = new HouseholdSurveyIrrigationDAO();
      $return['irrigation'] = $dao->insert($forms['irrigation']['data'], $id);
    }

    if ($forms['fertilizerApplication'] && count($forms['fertilizerApplication']['data']) > 0) {
      $dao = new HouseholdSurveyFertilizerApplicationDAO();
      $return['fertilizerApplication'] = $dao->insert($forms['fertilizerApplication']['data'], $id);
    }

    if ($forms['pesticideApplication'] && count($forms['pesticideApplication']['data']) > 0) {
      $dao = new HouseholdSurveyPesticideApplicationDAO();
      $return['pesticideApplication'] = $dao->insert($forms['pesticideApplication']['data'], $id);
    }

    if ($forms['harvestingAndThreshing'] && count($forms['harvestingAndThreshing']['data']) > 0) {
      $dao = new HouseholdSurveyHarvestingAndThreshingDAO();
      $return['harvestingAndThreshing'] = $dao->insert($forms['harvestingAndThreshing']['data'], $id);
    }

    if ($forms['cleaningAndDrying'] && count($forms['cleaningAndDrying']['data']) > 0) {
      $dao = new HouseholdSurveyCleaningAndDryingDAO();
      $return['cleaningAndDrying'] = $dao->insert($forms['cleaningAndDrying']['data'], $id);
    }

    if ($forms['grainAndStrawYield'] && count($forms['grainAndStrawYield']['data']) > 0) {
      $dao = new HouseholdSurveyGrainAndStrawYieldDAO();
      $return['grainAndStrawYield'] = $dao->insert($forms['grainAndStrawYield']['data'], $id);
    }

    if ($forms['foodSafety'] && count($forms['foodSafety']['data']) > 0) {
      $dao = new HouseholdSurveyFoodAndSafetyDAO();
      $return['foodSafety'] = $dao->insert($forms['foodSafety']['data'], $id);
    }

    if ($forms['workerHealthSafety'] && count($forms['workerHealthSafety']['data']) > 0) {
      $dao = new HouseholdSurveyWorkersHealthSafetyDAO();
      $return['workerHealthSafety'] = $dao->insert($forms['workerHealthSafety']['data'], $id);
    }

    if ($forms['childLabor'] && count($forms['childLabor']['data']) > 0) {
      $dao = new HouseholdSurveyChildLaborDAO();
      $return['childLabor'] = $dao->insert($forms['childLabor']['data'], $id);
    }

    if ($forms['womenEmpowerment'] && count($forms['womenEmpowerment']['data']) > 0) {
      $dao = new HouseholdSurveyWomenEmpowermentDAO();
      $return['womenEmpowerment'] = $dao->insert($forms['womenEmpowerment']['data'], $id);
    }

    if ($forms['foodSecurity'] && count($forms['foodSecurity']['data']) > 0) {
      $dao = new HouseholdSurveyFoodSecurityDAO();
      $return['foodSecurity'] = $dao->insert($forms['foodSecurity']['data'], $id);
    }

    if ($forms['weedingHerbicideApplication'] && count($forms['weedingHerbicideApplication']['data']) > 0) {
      $dao = new HouseholdSurveyWeedingHerbicideDAO();
      $return['weedingHerbicideApplication'] = $dao->insert($forms['weedingHerbicideApplication']['data'], $id);
    }

    if ($forms['pesticideUseEfficiency'] && count($forms['pesticideUseEfficiency']['data']) > 0) {
      $dao = new HouseholdSurveyPesticideUseEfficiencyDAO();
      $return['pesticideUseEfficiency'] = $dao->insert($forms['pesticideUseEfficiency']['data'], $id);
    }

    $answeredLastForm = DB::querySlave('
      SELECT s.id
      FROM household_survey s
        INNER JOIN household_survey_food_safety slgy ON s.id = slgy.household_survey_id
      WHERE farmers_id = %d AND
        farmer_seasons_id = %d
      ORDER BY id ASC
    ', array($data['farmers_id'], $data['farmer_seasons_id']));

    if ($answeredLastForm->numRows()) {
      $return['answeredLastForm'] = true;
    }

    DB::commit();
    return $return;
  }

  protected function getId($farmerId, $farmerSeasonsId) {
    $result = DB::querySlave('
      SELECT id FROM household_survey WHERE farmers_id = %d AND farmer_seasons_id = %d ORDER BY id ASC
    ', array($farmerId, $farmerSeasonsId));

    if ($result->numRows() <= 0) {
      return false;
    }

    $result = $result->fetchFirstRow();
    return $result['id'];
  }

  public function getFormData($farmerId, $farmerSeasonsId) {
    $data = array();
    $result = DB::querySlave('
      SELECT id FROM household_survey WHERE farmers_id = %d AND farmer_seasons_id = %d ORDER BY id ASC
    ', array($farmerId, $farmerSeasonsId));

    $count = $result->numRows();
    if ($count <= 0) {
      return array();
    }

    return $this->getAnsweredForm($farmerId, $farmerSeasonsId);
  }

  public function getAnsweredForm($farmerId, $farmerSeasonsId) {
    $data = array();

    $result = DB::querySlave('
      SELECT s.id
      FROM household_survey s
      WHERE farmers_id = %d AND
        farmer_seasons_id = %d
      ORDER BY id ASC
    ', array($farmerId, $farmerSeasonsId));

    $count = $result->numRows();
    $data = array();
    if ($count <= 0) {
      return $data;
    }

    $result = $result->fetchFirstRow();
    $id = $result['id'];

    $generalInformation = new HouseholdSurveyGeneralInformationDAO();
    $data['forms']['generalInformation'] = $generalInformation->get($id);

    $prePlanting = new HouseholdSurveyPrePlantingDAO();
    $data['forms']['prePlanting'] = $prePlanting->get($id);

    $landPreparation = new HouseholdSurveyLandPreparationDAO();
    $data['forms']['landPreparation'] = $landPreparation->get($id);

    $sowingTransplanting = new HouseholdSurveySowingTransplantingDAO();
    $data['forms']['sowingTransplanting'] = $sowingTransplanting->get($id);

    $irrigation = new HouseholdSurveyIrrigationDAO();
    $data['forms']['irrigation'] = $irrigation->get($id);

    $fertilizerApplication = new HouseholdSurveyFertilizerApplicationDAO();
    $data['forms']['fertilizerApplication'] = $fertilizerApplication->get($id);

    $weedingHerbicideApplication = new HouseholdSurveyWeedingHerbicideDAO();
    $data['forms']['weedingHerbicideApplication'] = $weedingHerbicideApplication->get($id);

    $pesticideApplication = new HouseholdSurveyPesticideApplicationDAO();
    $data['forms']['pesticideApplication'] = $pesticideApplication->get($id);

    $harvestingAndThreshing = new HouseholdSurveyHarvestingAndThreshingDAO();
    $data['forms']['harvestingAndThreshing'] = $harvestingAndThreshing->get($id);

    $cleaningAndDrying = new HouseholdSurveyCleaningAndDryingDAO();
    $data['forms']['cleaningAndDrying'] = $cleaningAndDrying->get($id);

    $grainAndStrawYield = new HouseholdSurveyGrainAndStrawYieldDAO();
    $data['forms']['grainAndStrawYield'] = $grainAndStrawYield->get($id);

    $foodSafety = new HouseholdSurveyFoodAndSafetyDAO();
    $data['forms']['foodSafety'] = $foodSafety->get($id);

    $workerHealthSafety = new HouseholdSurveyWorkersHealthSafetyDAO();
    $data['forms']['workerHealthSafety'] = $workerHealthSafety->get($id);

    $childLabor = new HouseholdSurveyChildLaborDAO();
    $data['forms']['childLabor'] = $childLabor->get($id);

    $womenEmpowerment = new HouseholdSurveyWomenEmpowermentDAO();
    $data['forms']['womenEmpowerment'] = $womenEmpowerment->get($id);

    $foodSecurity = new HouseholdSurveyFoodSecurityDAO();
    $data['forms']['foodSecurity'] = $foodSecurity->get($id);

    $pesticideUseEfficiency = new HouseholdSurveyPesticideUseEfficiencyDAO();
    $data['forms']['pesticideUseEfficiency'] = $pesticideUseEfficiency->get($id);
    $data['householdSurveyId'] = $id;

    return $data;
  }

}
