<?php

class SeasonlongDAO {

  public function save($data) {
    DB::startTransaction();

    if (!$data['season_long_id']) {
      $result = DB::queryMaster('
        INSERT INTO `season_long`(farmers_id, farmer_seasons_id) VALUES(%d, %d)',
        array($data['farmers_id'], $data['farmer_seasons_id']));

      if (!$result->insertID()) {
        DB::rollback();
        throw new SeasonlongDAOException('Failed to insert season long data');
      }
      $seasonLongId = $result->insertID();
    } else {
      $seasonLongId = $data['season_long_id'];
    }

    $return = array('season_long_id' => $seasonLongId);

    $forms = $data['data'];

    if (isset($forms['generalInformation']) && count($forms['generalInformation']['data']) > 0) {
      $dao = new SeasonlongGeneralInformationDAO();
      $return['generalInformation'] = $dao->insert($forms['generalInformation']['data'], $seasonLongId);
    }

    if (isset($forms['prePlanting']) && count($forms['prePlanting']['data']) > 0) {
      $dao = new SeasonlongPrePlantingDAO();
      $return['prePlantingInformation'] = $dao->insert($forms['prePlanting']['data'], $seasonLongId);
    }

    if (isset($forms['landPreparation']) && count($forms['landPreparation']['data']) > 0) {
      $dao = new SeasonlongLandPreparationDAO();
      $return['landPreparation'] = $dao->insert($forms['landPreparation']['data'], $seasonLongId);
    }

    if (isset($forms['sowingTransplanting']) && count($forms['sowingTransplanting']['data']) > 0) {
      $dao = new SeasonlongSowingTransplantingDAO();
      $return['sowingTransplanting'] = $dao->insert($forms['sowingTransplanting']['data'], $seasonLongId);
    }

    if (isset($forms['irrigation']) && count($forms['irrigation']['data']) > 0) {
      $dao = new SeasonlongIrrigationDAO();
      $return['irrigation'] = $dao->insert($forms['irrigation']['data'], $seasonLongId);
    }

    if ($forms['fertilizerApplication'] && count($forms['fertilizerApplication']['data']) > 0) {
      $dao = new SeasonlongFertilizerApplicationDAO();
      $return['fertilizerApplication'] = $dao->insert($forms['fertilizerApplication']['data'], $seasonLongId);
    }

    if ($forms['pesticideApplication'] && count($forms['pesticideApplication']['data']) > 0) {
      $dao = new SeasonlongPesticideApplicationDAO();
      $return['pesticideApplication'] = $dao->insert($forms['pesticideApplication']['data'], $seasonLongId);
    }

    if ($forms['harvestingAndThreshing'] && count($forms['harvestingAndThreshing']['data']) > 0) {
      $dao = new SeasonlongHarvestingAndThreshingDAO();
      $return['harvestingAndThreshing'] = $dao->insert($forms['harvestingAndThreshing']['data'], $seasonLongId);
    }

    if ($forms['cleaningAndDrying'] && count($forms['cleaningAndDrying']['data']) > 0) {
      $dao = new SeasonlongCleaningAndDryingDAO();
      $return['cleaningAndDrying'] = $dao->insert($forms['cleaningAndDrying']['data'], $seasonLongId);
    }

    if ($forms['grainAndStrawYield'] && count($forms['grainAndStrawYield']['data']) > 0) {
      $dao = new SeasonlongGrainAndStrawYieldDAO();
      $return['grainAndStrawYield'] = $dao->insert($forms['grainAndStrawYield']['data'], $seasonLongId);
    }

    if ($forms['foodSafety'] && count($forms['foodSafety']['data']) > 0) {
      $dao = new SeasonlongFoodAndSafetyDAO();
      $return['foodSafety'] = $dao->insert($forms['foodSafety']['data'], $seasonLongId);
    }

    if ($forms['workerHealthSafety'] && count($forms['workerHealthSafety']['data']) > 0) {
      $dao = new SeasonlongWorkersHealthSafetyDAO();
      $return['workerHealthSafety'] = $dao->insert($forms['workerHealthSafety']['data'], $seasonLongId);
    }

    if ($forms['childLabor'] && count($forms['childLabor']['data']) > 0) {
      $dao = new SeasonlongChildLaborDAO();
      $return['childLabor'] = $dao->insert($forms['childLabor']['data'], $seasonLongId);
    }

    if ($forms['womenEmpowerment'] && count($forms['womenEmpowerment']['data']) > 0) {
      $dao = new SeasonlongWomenEmpowermentDAO();
      $return['womenEmpowerment'] = $dao->insert($forms['womenEmpowerment']['data'], $seasonLongId);
    }

    if ($forms['foodSecurity'] && count($forms['foodSecurity']['data']) > 0) {
      $dao = new SeasonlongFoodSecurityDAO();
      $return['foodSecurity'] = $dao->insert($forms['foodSecurity']['data'], $seasonLongId);
    }

    if ($forms['weedingHerbicideApplication'] && count($forms['weedingHerbicideApplication']['data']) > 0) {
      $dao = new SeasonlongWeedingHerbicideDAO();
      $return['weedingHerbicideApplication'] = $dao->insert($forms['weedingHerbicideApplication']['data'], $seasonLongId);
    }

    if ($forms['pesticideUseEfficiency'] && count($forms['pesticideUseEfficiency']['data']) > 0) {
      $dao = new SeasonlongPesticideUseEfficiencyDAO();
      $return['pesticideUseEfficiency'] = $dao->insert($forms['pesticideUseEfficiency']['data'], $seasonLongId);
    }

    $answeredLastForm = DB::querySlave('
      SELECT s.id
      FROM season_long s
        INNER JOIN season_long_food_safety slgy ON s.id = slgy.season_long_id
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

  public function getFormData($farmerId, $farmerSeasonsId, $sowingDate, $dateNow) {
    $data = array();
    $dStart = new DateTime($sowingDate);
    $dEnd  = new DateTime($dateNow);
    $dDiff = $dStart->diff($dEnd);
    $duration = ceil((int) $dDiff->format('%a') / 14);

    $result = DB::querySlave('
      SELECT id FROM season_long WHERE farmers_id = %d AND farmer_seasons_id = %d ORDER BY id ASC
    ', array($farmerId, $farmerSeasonsId));

    $count = $result->numRows();
    if ($count <= 0) {
      $data['period'] = 1;
      return $data;
    }

    $records = $result->fetch();

    if ($duration <= 0) {
      $duration = 1;
    }

    if ($duration >= 12) {
      $duration = 12;
    }

    $data = array_merge($data, $this->getAnsweredForm($farmerId, $farmerSeasonsId, $duration));
    return $data;
  }

  public function getAnsweredForm($farmerId, $farmerSeasonsId, $period) {
    $data = array();

    $result = DB::querySlave('
      SELECT s.id
      FROM season_long s
      WHERE farmers_id = %d AND
        farmer_seasons_id = %d
      ORDER BY id ASC
    ', array($farmerId, $farmerSeasonsId));

    $count = $result->numRows();
    $data = array();
    if ($count <= 0) {
      return $data;
    }

    $result = $result->fetch();

    $answeredGrainYield = DB::querySlave('
      SELECT s.id
      FROM season_long s
        INNER JOIN season_long_grain_and_straw_yield slgy ON s.id = slgy.season_long_id
      WHERE farmers_id = %d AND
        farmer_seasons_id = %d
      ORDER BY id ASC
    ', array($farmerId, $farmerSeasonsId));

    $answeredGrainYieldRow = $answeredGrainYield->fetchFirstRow();
    $answeredGrainYield = $answeredGrainYield->numRows();

    $answeredLastForm = DB::querySlave('
      SELECT s.id
      FROM season_long s
        INNER JOIN season_long_food_safety slgy ON s.id = slgy.season_long_id
      WHERE farmers_id = %d AND
        farmer_seasons_id = %d
      ORDER BY id ASC
    ', array($farmerId, $farmerSeasonsId));

    $answeredLastFormCount = $answeredLastForm->numRows();
    $answeredLastForm = $answeredLastForm->fetchFirstRow();

    if ($period > $count && (!$answeredGrainYield)) {
      $data['period'] = $count + 1;
      return $data;
    }

    $id = $result[$period - 1]['id'];
    $data['period'] = $period;

    if ($period <= 1) {
      $generalInformation = new SeasonlongGeneralInformationDAO();
      $data['forms']['generalInformation'] = $generalInformation->get($id);

      $prePlanting = new SeasonlongPrePlantingDAO();
      $data['forms']['prePlanting'] = $prePlanting->get($id);

      $landPreparation = new SeasonlongLandPreparationDAO();
      $data['forms']['landPreparation'] = $landPreparation->get($id);

      $sowingTransplanting = new SeasonlongSowingTransplantingDAO();
      $data['forms']['sowingTransplanting'] = $sowingTransplanting->get($id);

      $irrigation = new SeasonlongIrrigationDAO();
      $data['forms']['irrigation'] = $irrigation->get($id);

      $fertilizerApplication = new SeasonlongFertilizerApplicationDAO();
      $data['forms']['fertilizerApplication'] = $fertilizerApplication->get($id);
    } else if ($period > 1 && $period <= 6) {
      $irrigation = new SeasonlongIrrigationDAO();
      $data['forms']['irrigation'] = $irrigation->get($id);

      $fertilizerApplication = new SeasonlongFertilizerApplicationDAO();
      $data['forms']['fertilizerApplication'] = $fertilizerApplication->get($id);

      $weedingHerbicideApplication = new SeasonlongWeedingHerbicideDAO();
      $data['forms']['weedingHerbicideApplication'] = $weedingHerbicideApplication->get($id);

      $pesticideApplication = new SeasonlongPesticideApplicationDAO();
      $data['forms']['pesticideApplication'] = $pesticideApplication->get($id);
    } else if ($period > 6) {
      if ($answeredGrainYield > 0) {
        $data['answeredGrainYield'] = true;

        if ($answeredLastFormCount > 0) {
          $data['answeredLastForm'] = true;
        }

        $foodSafety = new SeasonlongFoodAndSafetyDAO();
        $data['forms']['foodSafety'] = $foodSafety->get($answeredLastForm['id']);

        $workerHealthSafety = new SeasonlongWorkersHealthSafetyDAO();
        $data['forms']['workerHealthSafety'] = $workerHealthSafety->get($answeredLastForm['id']);

        $childLabor = new SeasonlongChildLaborDAO();
        $data['forms']['childLabor'] = $childLabor->get($answeredLastForm['id']);

        $womenEmpowerment = new SeasonlongWomenEmpowermentDAO();
        $data['forms']['womenEmpowerment'] = $womenEmpowerment->get($answeredLastForm['id']);

        $foodSecurity = new SeasonlongFoodSecurityDAO();
        $data['forms']['foodSecurity'] = $foodSecurity->get($answeredLastForm['id']);

        $pesticideUseEfficiency = new SeasonlongPesticideUseEfficiencyDAO();
        $data['forms']['pesticideUseEfficiency'] = $pesticideUseEfficiency->get($answeredLastForm['id']);

        $data['seasonLongId'] = $answeredLastForm['id'];
        return $data;
      } else {
        $irrigation = new SeasonlongIrrigationDAO();
        $data['forms']['irrigation'] = $irrigation->get($id);

        $fertilizerApplication = new SeasonlongFertilizerApplicationDAO();
        $data['forms']['fertilizerApplication'] = $fertilizerApplication->get($id);

        $weedingHerbicideApplication = new SeasonlongWeedingHerbicideDAO();
        $data['forms']['weedingHerbicideApplication'] = $weedingHerbicideApplication->get($id);

        $pesticideApplication = new SeasonlongPesticideApplicationDAO();
        $data['forms']['pesticideApplication'] = $pesticideApplication->get($id);

        $harvestingAndThreshing = new SeasonlongHarvestingAndThreshingDAO();
        $data['forms']['harvestingAndThreshing'] = $harvestingAndThreshing->get($id);

        $cleaningAndDrying = new SeasonlongCleaningAndDryingDAO();
        $data['forms']['cleaningAndDrying'] = $cleaningAndDrying->get($id);

        $grainAndStrawYield = new SeasonlongGrainAndStrawYieldDAO();
        $data['forms']['grainAndStrawYield'] = $grainAndStrawYield->get($id);
        $data['answeredGrainYield'] = false;
      }
    }
    $data['seasonLongId'] = $id;
    return $data;
  }

  public function calculate() {

  }
}
