<?php

class SeasonlongComputationHandler {
  private $dao;
  private $farmerId;
  private $farmerSeasonId;

  public function __construct($farmerId, $farmerSeasonId) {
    $this->setFarmerId($farmerId);
    $this->setFarmerSeasonId($farmerSeasonId);
    $this->dao = new SeasonlongComputationDAO($farmerId, $farmerSeasonId);
  }

  public function setFarmerId($id) {
    $this->farmerId = $id;
  }

  public function setFarmerSeasonId($id) {
    $this->farmerSeasonId = $id;
  }

  // 1
  public function getSeedCost() {
    try {
      $result = $this->dao->getSeedCost();

      if (!$result) {
        return false;
      }

      return (float) $result['seed_cost'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 2
  public function getLandPreparationCost() {
    try {
      $result = $this->dao->getLandPreparationCost();

      if (!$result) {
        return false;
      }

      return (float) $result['land_preparation_cost'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 3
  public function getSowingTransplantingCost() {
    try {
      $result = $this->dao->getSowingTransplantingCost();

      if (!$result) {
        return false;
      }

      return (float) $result['sowing_transplanting_cost'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 4
  public function getNurserySeedlingProductionCost() {
    try {
      $result = $this->dao->getNurserySeedlingProductionCost();

      if (!$result) {
        return false;
      }

      return (float) $result['nursery_cost'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 4.1
  public function getNurseryPreparationCost() {
    try {
      $result = $this->dao->getNurseryPreparationCost();

      if (!$result) {
        return false;
      }

      return (float) $result['nursery_preparation_cost'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 4.2
  public function getNurseryPreparationMachineTransplantingCost() {
    try {
      $result = $this->dao->getNurseryPreparationMachineTransplantingCost();

      if (!$result) {
        return false;
      }

      return (float) $result['nursery_preparation_machine_transplanting_cost'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 4.3
  public function getPurchasedSeedlingCost() {
    try {
      $result = $this->dao->getPurchasedSeedlingCost();

      if (!$result) {
        return false;
      }

      return (float) $result['purchased_seedling_cost'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 5
  public function getIrrigationCost() {
    try {
      $result = $this->dao->getIrrigationCost();

      if (!$result) {
        return false;
      }

      return (float) $result['irrigation_cost'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 6
  public function getFertilizerApplicationCost() {
    try {
      $result = $this->dao->getFertilizerApplicationCost();

      if (!$result) {
        return false;
      }

      return (float) $result['fertilizer_cost'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 7
  public function getWeedingCost() {
    try {
      $result = $this->dao->getWeedingCost();

      if (!$result) {
        return false;
      }

      return (float) $result['weeding_cost'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 8
  public function getOrganicMaterialCost() {
    try {
      $result = $this->dao->getOrganicMaterialCost();

      if (!$result) {
        return false;
      }

      return (float) $result['organic_cost'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 9
  public function getSeedRate() {
    try {
      $result = $this->dao->getSeedRate();

      if (!$result) {
        return false;
      }

      return (float) $result['seed_rate'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 10
  public function getLandPreparationDate() {
    try {
      $result = $this->dao->getLandPreparationDate();

      if (!$result) {
        return false;
      }

      return (string) $result['land_preparation_started'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }


  // 11
  public function getNurseryEstablishmentDate() {
    try {
      $result = $this->dao->getNurseryEstablishmentDate();

      if (!$result) {
        return false;
      }

      if ($this->isValidDate($result['nursery_establishment_date'])) {
        return $result['nursery_establishment_date'];
      }

    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 12
  public function getSowingTransplantingDate() {
    try {
      $result = $this->dao->getSowingTransplantingDate();

      if (!$result) {
        return false;
      }

      if ($this->isValidDate($result['sowing_date'])) {
        return $result['sowing_date'];
      }

      if ($this->isValidDate($result['transplanting_date'])) {
        return $result['transplanting_date'];
      }
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

 // 13
  public function getHarvestingDate() {
    try {
      $result = $this->dao->getHarvestingDate();

      if (!$result) {
        return false;
      }

      if ($this->isValidDate($result['crop_harvest_date'])) {
        return $result['crop_harvest_date'];
      }

    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 14
  public function getTreshingDate() {
    try {
      $result = $this->dao->getTreshingDate();

      if (!$result) {
        return false;
      }

      if ($this->isValidDate($result['threshing_date'])) {
        return $result['threshing_date'];
      }
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 15
  public function getSeedlingAge() {
    $sDate = $this->getSowingTransplantingDate();
    $nDate = $this->getNurseryEstablishmentDate();

    if (!$this->isValidDate($sDate) || !$this->isValidDate($nDate)) {
      return null;
    }

    $dStart = new DateTime($sDate);
    $dEnd  = new DateTime($nDate);
    $dDiff = $dStart->diff($dEnd);
    return (int) $dDiff->format('%a');
  }

  // 16
  public function getCropGrowingDuration() {
    $sDate = $this->getSowingTransplantingDate();
    $nDate = $this->getHarvestingDate();

    if (!$this->isValidDate($sDate) || !$this->isValidDate($nDate)) {
      return null;
    }

    $dStart = new DateTime($sDate);
    $dEnd  = new DateTime($nDate);
    $dDiff = $dStart->diff($dEnd);
    return (int) $dDiff->format('%a');
  }

  // 17
  public function getPesticideCost() {
    try {
      $result = $this->dao->getPesticideCost();
      return (float) $result['pesticide_cost'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 18
  public function getHarvestingThreshingCost() {
    try {
      $result = $this->dao->getHarvestingThreshingCost();
      return (float) $result['harvesting_threshing_cost'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 19
  public function getCleaningDryingCost() {
    try {
      $result = $this->dao->getCleaningDryingCost();
      return (float) $result['cleaning_drying_cost'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 20
  public function getTotalCost() {
    try {
      $result = $this->dao->getRentalCost();
      return (float) $result['rent_cost'] +
        $this->getLandPreparationCost() + // 2
        $this->getSowingTransplantingCost() + // 3
        $this->getNurseryPreparationCost() + // 4.1
        $this->getNurseryPreparationMachineTransplantingCost() + // 4.2
        $this->getPurchasedSeedlingCost() + // 4.3
        $this->getIrrigationCost() + // 5
        $this->getFertilizerApplicationCost() + // 6
        $this->getWeedingCost() + // 7
        $this->getOrganicMaterialCost() + // 8
        $this->getPesticideCost() + // 17
        $this->getHarvestingThreshingCost() + // 18
        $this->getCleaningDryingCost(); // 19
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 20.1
  public function getStrawYieldPreviousCrop() {
    try {
      return (float) $this->dao->getStrawYieldPreviousCrop();
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 21
  public function getGrainYield() {
    try {
      $result = $this->dao->getGrainYield();
      return (float) $result['grain_yield'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 22
  public function getStrawYield() {
    try {
      $result = $this->dao->getGrainYield();
      return ((float) $result['grain_yield'] * 2.083) - (float) $result['grain_yield'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 23
  public function getTotalGrossIncome() {
    try {
      $result = $this->dao->getTotalGrossIncome();
      return (float) $result['total_gross_income'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 24
  public function getTotalNumberOfLabor() {
    try {
      $temp = $this->dao->getRiceAreaAndExchangeRate();
      return (float) (($this->getTotalNumberOfMaleLabor() + $this->getTotalNumberOfFemaleLabor())
        / $temp['rice_area']);
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 25
  public function getTotalNumberOfMaleLabor() {
    try {
      $result = $this->dao->getTotalNumberOfMaleLabor();
      return (float) $result['total_male_labor'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 26
  public function getTotalNumberOfFemaleLabor() {
    try {
      $result = $this->dao->getTotalNumberOfFemaleLabor();
      return (float) $result['total_female_labor'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 27
  public function getTotalNumberOfAbove18Labor() {
    try {
      $result = $this->dao->getTotalNumberOfAbove18Labor();
      return (float) $result['total_above_18_labor'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 28
  public function getTotalNumberOfBelow18Labor() {
    try {
      $result = $this->dao->getTotalNumberOfBelow18Labor();
      return (float) $result['total_below_18_labor'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 29
  public function getNetProfit() {
    return $this->getTotalGrossIncome() - $this->getTotalCost();
  }

  // 30
  public function getLaborProductivity() {
    return $this->getGrainYield() / $this->getTotalNumberOfLabor();
  }

  // 31
  public function getFemaleToMaleRatio() {
    return $this->getTotalNumberOfFemaleLabor() / $this->getTotalNumberOfMaleLabor();
  }

  // 32
  public function getBelowToAbove18Ratio() {
    return $this->getTotalNumberOfBelow18Labor() / $this->getTotalNumberOfAbove18Labor();
  }

  // 32.1
  public function getNitrogenAmount() {
    try {
      $result = $this->dao->getNitrogenAmount();
      return (float) $result['nitrogen_amount'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 32.2
  public function getPhosphorusAmount() {
    try {
      $result = $this->dao->getPhosphorusAmount();
      return (float) $result['phosphorus_amount'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 32.3
  public function getPotassiumAmount() {
    try {
      $result = $this->dao->getPotassiumAmount();
      return (float) $result['potassium_amount'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 32.4
  public function getNitrogenCount() {
    try {
      $result = $this->dao->getNitrogenCount();
      return (float) $result;
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 32.5
  public function getPhosphorusCount() {
    try {
      $result = $this->dao->getPhosphorusCount();
      return (float) $result;
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 32.6
  public function getPotassiumCount() {
    try {
      $result = $this->dao->getPotassiumCount();
      return (float) $result;
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 33
  public function getNitrogenUseEfficiency() {
    try {
      return (float) $this->dao->getNitrogenUseEfficiency();
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 34
  public function getPhosphorusUseEfficiency() {
    try {
      return (float) $this->dao->getPhosphorusUseEfficiency();
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 35
  public function getPotassiumUseEfficiency() {
    try {
      return (float) $this->dao->getPotassiumUseEfficiency();
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 36
  public function getZnApplication() {
    try {
      $result = $this->dao->getZnApplication();
      return (float) $result['zn_application'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 37
  public function getSulphurApplication() {
    try {
      $result = $this->dao->getSulphurApplication();
      return (float) $result['sulphur_application'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 38
  public function getTotalNitrogenUptake() {
    return (($this->getGrainYield() * 1.1) + ($this->getStrawYield() * 0.65)) / 100;
  }

  // 39
  public function getTotalPhosphorusUptake() {
    return (($this->getGrainYield() * 0.21) + ($this->getStrawYield() * 0.1)) / 100;
  }

  // 40
  public function getNitrogenUseEfficiencyMethodTwo() {
    try {
      $result = $this->dao->getNitrogenUseEfficiencyMethodTwo();
      return (float) $result['nitrogen_use_efficiency'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 41
  public function getPhosphorusUseEfficiencyMethodTwo() {
    try {
      $result = $this->dao->getPhosphorusUseEfficiencyMethodTwo();
      return (float) $result['phosphorus_use_efficiency'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 42
  public function getWaterAppliedFieldPreparation() {
    try {
      $result = $this->dao->getWaterAppliedFieldPreparation();
      return (float) $result['water_applied_field_preparation'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 43
  public function getWaterAppliedCropGrowing() {
    try {
      $result = $this->dao->getWaterAppliedCropGrowing();
      return (float) $result['water_applied_crop_growing'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 44
  public function getIrrigationAppliedCount() {
    try {
      return $this->dao->getIrrigationAppliedCount();
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 45
  public function getTotalWaterProductivityKgGrain() {
    try {
      $result = $this->dao->getTotalRainFall();
      return (float) ($this->getGrainYield() / ((float) $result['total_rainfall'] + ($this->getWaterAppliedFieldPreparation() + $this->getWaterAppliedCropGrowing())) / 10000);
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 46
  public function getTotalWaterProductivityLitreWater() {
    try {
      $result = $this->dao->getTotalRainFall();
      return ((float) $result['total_rainfall'] + ($this->getWaterAppliedFieldPreparation() + $this->getWaterAppliedCropGrowing())) / $this->getGrainYield() * 10000;
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 47
  public function getIrrigationWaterProductivity() {
    try {
      return $this->getGrainYield() / ($this->getWaterAppliedFieldPreparation() + $this->getWaterAppliedCropGrowing()) / 10000;
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 48
  public function getRainfallWaterProductivity() {
    try {
      $result = $this->dao->getTotalRainFall();
      return $this->getGrainYield() / ((float) $result['total_rainfall']) / 10000;
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 49.1
  public function getSFO() {
    try {
      return $this->dao->getSFO();
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 49.2
  public function getMethaneEmission() {
    try {
      return $this->dao->getMethaneEmission();
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 50
  public function getCO2Equivalent() {
    return $this->getMethaneEmission() * 25;
  }

  // 51
  public function getTotalNumberHerbicideApplication() {
    try {
      $result = $this->dao->getTotalNumberHerbicideApplication();
      return $result['count'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 52
  public function getTotalAmountHerbicideApplication() {
    try {
      return $this->dao->getTotalAmountHerbicideApplication();
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 53
  public function getHerbicideScore() {
    $result = $this->dao->getTotalNumberHerbicideApplication();

    if ($result['count'] <= 1 && $result['max'] <= 40) {
      return 15;
    }

    if ($result['count'] >= 1 && $result['count'] <= 4 && $result['max'] < 40) {
      return 0;
    }

    /*if ($result['total'] > 4 && $result['max'] > 40) {
      return -15;
    }*/

    return -15;
  }

  // 54
  public function getHerbicideRank() {
    switch ($this->getHerbicideScore()) {
      case -15:
        return 'Unsustainable';
      case 15:
        return 'Acceptable';
      case 0:
        return 'Tolerable';
      default:
        return 'Fail';
    }
  }

  // 55
  public function getTotalNumberInsecticideApplication() {
    try {
      $result = $this->dao->getTotalNumberApplication(1);
      return $result['count'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 56
  public function getTotalAmountInsecticideApplication() {
    try {
      return $this->dao->getTotalAmountApplication(1);
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 57
  public function getInsecticideScore() {
    $result = $this->dao->getTotalNumberApplication(1);

    if ($result['count'] <= 1 && $result['max'] < 70 && $result['min'] > 40) {
      return 15;
    }

    if ($result['count'] > 1 && $result['count'] <= 2 && $result['min'] > 40 && $result['max'] < 70) {
      return 0;
    }

    /*if ($result['count'] > 2 && $result['min'] > 40 && $result['max'] < 70) {
      return -15;
    }*/

    return -15;
  }

  // 58
  public function getInsecticideRank() {
    switch ($this->getInsecticideScore()) {
      case -15:
        return 'Unsustainable';
      case 15:
        return 'Acceptable';
      case 0:
        return 'Tolerable';
      default:
        return 'Fail';
    }
  }

  // 59
  public function getTotalNumberFungicideApplication() {
    try {
      $result = $this->dao->getTotalNumberApplication(2);
      return $result['count'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 60
  public function getTotalAmountFungicideApplication() {
    try {
      return $this->dao->getTotalAmountApplication(2);
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 61
  public function getFungicideScore() {
    $result = $this->dao->getTotalNumberApplication(2);

    if ($result['count'] <= 1 && $result['max'] < 70) {
      return 15;
    }

    if ($result['count'] >= 1 && $result['count'] <= 2 && $result['max'] < 70) {
      return 0;
    }

    /*if ($result['count'] > 2 && $result['min'] > 40 && $result['max'] < 70) {
      return -15;
    }*/

    return -15;
  }

  // 62
  public function getFungicideRank() {
    switch ($this->getFungicideScore()) {
      case -15:
        return 'Unsustainable';
      case 15:
        return 'Acceptable';
      case 0:
        return 'Tolerable';
      default:
        return 'Fail';
    }
  }

  // 63
  public function getTotalNumberMolluscicideApplication() {
    try {
      $result = $this->dao->getTotalNumberApplication(3);
      return $result['count'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 64
  public function getTotalAmountMolluscicideApplication() {
    try {
      return $this->dao->getTotalAmountApplication(3);
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 65
  public function getMolluscicideScore() {
    $result = $this->dao->getTotalNumberApplication(3);

    if ($result['count'] <= 1 && $result['max'] <= 30) {
      return 15;
    }

    if ($result['count'] >= 1 && $result['count'] <= 2 && $result['min'] < 0 && $result['max'] <= 30) {
      return 0;
    }

    /*if ($result['count'] > 2 && $result['min'] > 40 && $result['max'] < 70) {
      return -15;
    }*/

    return -15;
  }

  // 66
  public function getMolluscicideRank() {
    switch ($this->getMolluscicideScore()) {
      case -15:
        return 'Unsustainable';
      case 15:
        return 'Acceptable';
      case 0:
        return 'Tolerable';
      default:
        return 'Fail';
    }
  }

  // 67
  public function getTotalNumberRodenticideApplication() {
    try {
      $result = $this->dao->getTotalNumberApplication(4);
      return $result['count'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 68
  public function getTotalAmountRodenticideApplication() {
    try {
      return $this->dao->getTotalAmountApplication(4);
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 69
  public function getRodenticideScore() {
    $result = $this->dao->getTotalNumberApplication(4);

    if ($result['count'] <= 1 && $result['max'] <= 70) {
      return 15;
    }

    if ($result['count'] >= 1 && $result['count'] <= 2 && $result['max'] <= 70) {
      return 0;
    }

    /*if ($result['count'] > 2 && $result['min'] > 40 && $result['max'] < 70) {
      return -15;
    }*/

    return -15;
  }

  // 70
  public function getRodenticideRank() {
    switch ($this->getRodenticideScore()) {
      case -15:
        return 'Unsustainable';
      case 15:
        return 'Acceptable';
      case 0:
        return 'Tolerable';
      default:
        return 'Fail';
    }
  }

  // 71
  public function getTotalNumberPesticideApplication() {
    return $this->getTotalNumberHerbicideApplication() +
      $this->getTotalNumberInsecticideApplication() +
      $this->getTotalNumberMolluscicideApplication() +
      $this->getTotalNumberRodenticideApplication() +
      $this->getTotalNumberFungicideApplication();
  }

  // 72
  public function getTotalAmountPesticideApplication() {
    return $this->getTotalAmountHerbicideApplication() +
      $this->getTotalAmountInsecticideApplication() +
      $this->getTotalAmountMolluscicideApplication() +
      $this->getTotalAmountMolluscicideApplication() +
      $this->getTotalAmountRodenticideApplication() +
      $this->getTotalAmountFungicideApplication();
  }

  // 73
  public function getTotalScorePesticideApplication() {
    return $this->getHerbicideScore() + $this->getInsecticideScore() + $this->getFungicideScore() +
      $this->getMolluscicideScore() + $this->getRodenticideScore() ;
  }

  // 74
  public function getPesticideRanking() {
    $total = $this->getTotalScorePesticideApplication();
    $total2 = $this->getTotalNumberPesticideApplication();

    if ($total > 60) {
      return 'Gold';
    }

    if ($total > 30) {
      return 'Acceptable';
    }

    if ($total > 0) {
      return 'Tolerable';
    }

    if ($total <= 0 || $total2 > 8) {
      return 'Unsustainable';
    }

    return 'Fail';
  }

  // 75
  public function getFoodSafetyScore() {
    try {
      $result = $this->dao->getFoodSafetyScore();
      return $result['food_safety_score'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 76
  public function getFoodSafetyRank() {
    try {
      $result = $this->dao->getFoodSafetyScore();
      $score = $result['food_safety_score'];

      if ($score > 80) {
        return 'Good';
      }

      if ($score >= 50) {
        return 'Fair';
      }

      if ($score < 49) {
        return 'Poor';
      }

      return 'Fail';
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 77
  public function getWorkerHealthAndSafetyScore() {
    try {
      $result = $this->dao->getWorkerHealthAndSafetyScore();
      return $result['worker_health_safety_score'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 78
  public function getWorkerHealthAndSafetyRank() {
    $score = $this->getWorkerHealthAndSafetyScore();

    if ($score > 80) {
      return 'Good';
    }

    if ($score >= 50) {
      return 'Fair';
    }

    if ($score < 50) {
      return 'Poor';
    }

    return 'Fail';
  }

  // 79
  public function getChildLaborScore() {
    try {
      return $this->dao->getChildLaborScore();
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 80
  public function getChildLaborRank() {
    $score = $this->getChildLaborScore();

    if ($score > 80) {
      return 'Good';
    }

    if ($score >= 50) {
      return 'Fair';
    }

    if ($score < 50) {
      return 'Poor';
    }

    return 'Fail';
  }

  // 81
  public function getWomenEmpowermentScore() {
    try {
      $result = $this->dao->getWomenEmpowermentScore();
      return $result['women_empowerment_score'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  // 82
  public function getWomenEmpowermentRank() {
    $score = $this->getWomenEmpowermentScore();

    if ($score > 80) {
      return 'Good';
    }

    if ($score >= 50) {
      return 'Fair';
    }

    if ($score < 50) {
      return 'Poor';
    }

    return 'Fail';
  }

  public function getPesticideUseEfficiencyScore() {
    try {
      $result = $this->dao->getPesticideUseEfficiencyScore();
      return $result['pesticide_use_efficiency_score'];
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  public function getPesticideUseEfficiencyRank() {
    $score = $this->getPesticideUseEfficiencyScore();

    if ($score > 80) {
      return 'Good';
    }

    if ($score >= 50) {
      return 'Fair';
    }

    if ($score < 50) {
      return 'Poor';
    }

    return 'Fail';
  }

  public function compute() {
    $data = array(
      'farmers_id' => $this->farmerId,
      'farmer_seasons_id' => $this->farmerSeasonId,
      'seed_cost' => $this->getSeedCost(),
      'land_preparation_cost' => $this->getLandPreparationCost(),
      'sowing_transplanting_cost' => $this->getSowingTransplantingCost(),
      'nursery_seedling_production_cost' => $this->getNurserySeedlingProductionCost(),
      'nursery_preparation_cost' => $this->getNurseryPreparationCost(),
      'nursery_preparation_machine_transplanting_cost' => $this->getNurseryPreparationMachineTransplantingCost(),
      'purchased_seedling_cost' => $this->getPurchasedSeedlingCost(),
      'irrigation_cost' => $this->getIrrigationCost(),
      'fertilizer_application_cost' => $this->getFertilizerApplicationCost(),
      'weeding_cost' => $this->getWeedingCost(),
      'organic_material_cost' => $this->getOrganicMaterialCost(),
      'seed_rate' => $this->getSeedRate(),
      'land_preparation_date' => $this->getLandPreparationDate(),
      'nursery_establishment_date' => $this->getNurseryEstablishmentDate(),
      'sowing_transplanting_date' => $this->getSowingTransplantingDate(),
      'harvesting_date' => $this->getHarvestingDate(),
      'threshing_date' => $this->getTreshingDate(),
      'seedling_age' => $this->getSeedlingAge(),
      'crop_growing_duration' => $this->getCropGrowingDuration(),
      'pesticide_cost' => $this->getPesticideCost(),
      'harvesting_threshing_cost' => $this->getHarvestingThreshingCost(),
      'cleaning_drying_cost' => $this->getCleaningDryingCost(),
      'total_cost' => $this->getTotalCost(),
      'straw_yield_previous_crop' => $this->getStrawYieldPreviousCrop(),
      'grain_yield' => $this->getGrainYield(),
      'straw_yield' => $this->getStrawYield(),
      'total_gross_income' => $this->getTotalGrossIncome(),
      'total_labor' => $this->getTotalNumberOfLabor(),
      'total_male_labor' => $this->getTotalNumberOfMaleLabor(),
      'total_female_labor' => $this->getTotalNumberOfFemaleLabor(),
      'total_above_18_labor' => $this->getTotalNumberOfAbove18Labor(),
      'total_below_18_labor' => $this->getTotalNumberOfBelow18Labor(),
      'net_profit' => $this->getNetProfit(),
      'labor_productivity' => $this->getLaborProductivity(),
      'female_to_male_ratio' => $this->getFemaleToMaleRatio(),
      'below_to_above_18_ratio' => $this->getBelowToAbove18Ratio(),
      'nitrogen_amount' => $this->getNitrogenAmount(),
      'nitrogen_count' => $this->getNitrogenCount(),
      'phosphorus_amount' => $this->getPhosphorusAmount(),
      'phosphorus_count' => $this->getPhosphorusCount(),
      'potassium_amount' => $this->getPotassiumAmount(),
      'potassium_count' => $this->getPotassiumCount(),
      'nitrogen_use_efficiency' => $this->getNitrogenUseEfficiency(),
      'phosphorus_use_efficiency' => $this->getPhosphorusUseEfficiency(),
      'potassium_use_efficiency' => $this->getPotassiumUseEfficiency(),
      'zn_application' => $this->getZnApplication(),
      'sulphur_application' => $this->getSulphurApplication(),
      'total_nitrogen_uptake' => $this->getTotalNitrogenUptake(),
      'total_phosphorus_uptake' => $this->getTotalPhosphorusUptake(),
      'nitrogen_use_efficiency_method_two' => $this->getNitrogenUseEfficiencyMethodTwo(),
      'phosphorus_use_efficiency_method_two' => $this->getPhosphorusUseEfficiencyMethodTwo(),
      'water_applied_field_preparation' => $this-> getWaterAppliedFieldPreparation(),
      'water_applied_crop_growing' => $this->getWaterAppliedCropGrowing(),
      'irrigation_applied_count' => $this->getIrrigationAppliedCount(),
      'total_water_productivity_kg_grain' => $this->getTotalWaterProductivityKgGrain(),
      'total_water_productivity_litre_water' => $this->getTotalWaterProductivityLitreWater(),
      'total_irrigation_water_productivity' => $this->getIrrigationWaterProductivity(),
      'rainfall_water_productivity' => $this->getRainfallWaterProductivity(),
      'sfo' => $this->getSFO(),
      'methane_emission' => $this->getMethaneEmission(),
      'co2_equivalent' => $this->getCO2Equivalent(),
      'total_number_herbicide_application' => $this->getTotalNumberHerbicideApplication(),
      'total_amount_herbicide_application' => $this->getTotalAmountHerbicideApplication(),
      'herbicide_score' => $this->getHerbicideScore(),
      'herbicide_rank' => $this->getHerbicideRank(),
      'total_number_insecticide_application' => $this->getTotalNumberInsecticideApplication(),
      'total_amount_insecticide_application' => $this->getTotalAmountInsecticideApplication(),
      'insecticide_score' => $this->getInsecticideScore(),
      'insecticide_rank' => $this->getInsecticideRank(),
      'total_number_fungicide_application' => $this->getTotalNumberFungicideApplication(),
      'total_amount_fungicide_application' => $this->getTotalAmountFungicideApplication(),
      'fungicide_score' => $this->getFungicideScore(),
      'fungicide_rank' => $this->getFungicideRank(),
      'total_number_molluscicide_application' => $this->getTotalNumberMolluscicideApplication(),
      'total_amount_molluscicide_application' => $this->getTotalAmountMolluscicideApplication(),
      'molluscicide_score' => $this->getMolluscicideScore(),
      'molluscicide_rank' => $this->getMolluscicideRank(),
      'total_number_rodenticide_application' => $this->getTotalNumberRodenticideApplication(),
      'total_amount_rodenticide_application' => $this->getTotalAmountRodenticideApplication(),
      'rodenticide_score' => $this->getRodenticideScore(),
      'rodenticide_rank' => $this->getRodenticideRank(),
      'total_number_pesticide_application' => $this->getTotalNumberPesticideApplication(),
      'total_amount_pesticide_application' => $this->getTotalAmountPesticideApplication(),
      'total_score_pesticide_application' => $this->getTotalScorePesticideApplication(),
      'pesticide_ranking' => $this->getPesticideRanking(),
      'food_safety_score' => $this->getFoodSafetyScore(),
      'food_safety_rank' => $this->getFoodSafetyRank(),
      'worker_health_and_safety_score' => $this->getWorkerHealthAndSafetyScore(),
      'worker_health_and_safety_rank' => $this->getWorkerHealthAndSafetyRank(),
      'child_labor_score' => $this->getChildLaborScore(),
      'child_labor_rank' => $this->getChildLaborRank(),
      'women_empowerment_score' => $this->getWomenEmpowermentScore(),
      'women_empowerment_rank' => $this->getWomenEmpowermentRank(),
      'pesticide_use_efficiency_score' => $this->getPesticideUseEfficiencyScore(),
      'pesticide_use_efficiency_rank' => $this->getPesticideUseEfficiencyRank(),
    );

    return $data;
  }

  private function isValidDate($date) {
    return $date && $date != '0000-00-00 00:00:00';
  }

  public function save() {
    try {
      $result = $this->dao->save($this->compute());
      return true;
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }

  public function get() {
    try {
      return $this->dao->get();
    } catch (DBException $e) {
      trigger_error($e->getMessage());
      return false;
    }
  }
}
