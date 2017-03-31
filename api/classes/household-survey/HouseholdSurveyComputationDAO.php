<?php

class HouseholdSurveyComputationDAO {
  const TABLE_NAME = 'household_survey_computations';
  private $farmerId;
  private $farmerSeasonId;
  private $riceAreaExchangeRate;

  public function __construct($farmerId, $farmerSeasonId) {
    $this->farmerId = $farmerId;
    $this->farmerSeasonId = $farmerSeasonId;
  }

  public function getRiceAreaAndExchangeRate() {
    if ($this->riceAreaExchangeRate) {
      return $this->riceAreaExchangeRate;
    }

    $result = DB::queryMaster('
      SELECT slp.rice_area, cs.exchange_rate
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN countries c ON c.id = f.countries_id
        INNER JOIN currencies cs ON cs.id = c.currencies_id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pre_planting_information slp ON slp.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array($this->farmerId, $this->farmerSeasonId));

    $this->riceAreaExchangeRate = $result->fetchFirstRow();
    return $this->riceAreaExchangeRate;
  }

  // 1
  public function getSeedCost() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT (sls.total_seed_cost / %f / %f) as seed_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_sowing_transplanting sls ON sls.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 2
  public function getLandPreparationCost() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT ((IFNULL(SUM(lp.tractor_cost),0) + IFNULL(SUM(lp.labor_total_cost),0)) / %f / %f) as land_preparation_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_land_preparation lp ON lp.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 3
  public function getSowingTransplantingCost() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT (IFNULL(SUM(sst.total_cost_paid_tractor),0) + IFNULL(SUM(sst.labor_total_cost),0) +
        IFNULL(SUM(sst.total_cost_paid_service_provider),0) +
        IFNULL(SUM(sst.total_cost_tractor), 0) +
        IFNULL(SUM(sst.nursery_labor_total_cost),0)) / %f / %f as sowing_transplanting_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        LEFT JOIN household_survey_sowing_transplanting sst ON sst.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 4
  public function getNurserySeedlingProductionCost() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT (IFNULL(SUM(sst.seedling_labor_total_cost),0) +
        IFNULL(SUM(sst.fertilizer_total_cost),0) +
        IFNULL(SUM(sst.total_labor_cost_seedling),0) +
        IFNULL(SUM(sst.total_cost_seedling_transport),0)) / %f / %f as nursery_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        LEFT JOIN household_survey_sowing_transplanting sst ON sst.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 4.1
  public function getNurseryPreparationCost() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT SUM(sls.seedling_labor_total_cost) / %f / %f as nursery_preparation_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_sowing_transplanting sls ON sls.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 4.2
  public function getNurseryPreparationMachineTransplantingCost() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT ((IFNULL(SUM(sls.fertilizer_total_cost),0) +
        IFNULL(SUM(sls.total_labor_cost_seedling),0)) / %f / %f)
        as nursery_preparation_machine_transplanting_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        LEFT JOIN household_survey_sowing_transplanting sls ON sls.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 4.3
  public function getPurchasedSeedlingCost() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT (IFNULL(SUM(sls.total_cost_seedling_transport),0) / %f / %f)
        as purchased_seedling_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        LEFT JOIN household_survey_sowing_transplanting sls ON sls.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 5
  public function getIrrigationCost() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT ((IFNULL(SUM(si.total_fuel_cost),0) +
        IFNULL(SUM(si.labor_total_cost),0)) / %f / %f) as irrigation_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_irrigation si ON si.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 6
  public function getFertilizerApplicationCost() {
    $temp = $this->getRiceAreaAndExchangeRate();
    // correction
    $result = DB::queryMaster('
      SELECT (SUM(IFNULL(sf.fertilizer_cost, 0)) + SUM(IFNULL(sf.labor_total_cost, 0))) / %f / %f as fertilizer_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application sf ON sf.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 7
  public function getWeedingCost() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT (
        IFNULL(SUM(swh.total_labor_weeding),0) +
        IFNULL(SUM(swh.labor_total_cost),0) +
        IFNULL(SUM(swh.herbicide_cost),0) +
        IFNULL(SUM(swh.herbicide_total_labor_cost),0)) / %f / %f as weeding_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_weeding_herbicide swh ON swh.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 8
  public function getOrganicMaterialCost() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT (slp.organic_material_cost / %f / %f) as organic_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pre_planting_information slp ON slp.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 9
  public function getSeedRate() {
    $result = DB::queryMaster('
      SELECT (slp.seed_count / slp.rice_area) as seed_rate
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pre_planting_information slp ON slp.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array($this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  // 10
  public function getLandPreparationDate() {
    $result = DB::queryMaster('
      SELECT land_preparation_started
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_land_preparation slp ON slp.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array($this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  // 11
  public function getNurseryEstablishmentDate() {
    $result = DB::queryMaster('
      SELECT slst.nursery_establishment_date
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_sowing_transplanting slst ON slst.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array($this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  // 12
  public function getSowingTransplantingDate() {
    $result = DB::queryMaster('
      SELECT slst.sowing_date, slst.transplanting_date
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_sowing_transplanting slst ON slst.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array($this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  // 13
  public function getHarvestingDate() {
    $result = DB::queryMaster('
      SELECT slht.crop_harvest_date
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_harvesting_threshing slht ON slht.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array($this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  // 14
  public function getTreshingDate() {
    $result = DB::queryMaster('
      SELECT slht.threshing_date
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_harvesting_threshing slht ON slht.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array($this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  // 17
  public function getPesticideCost() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT ((
        IFNULL(SUM(sls.total_cost_paid),0) +
        IFNULL(SUM(sls.pesticide_labor_total_cost),0)) / %f / %f) as pesticide_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pesticide_application sls ON sls.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 18
  public function getHarvestingThreshingCost() {
    $temp = $this->getRiceAreaAndExchangeRate();
    $result = DB::queryMaster('
      SELECT ((
        IFNULL(SUM(sls.combine_harvesting_total),0) +
        IFNULL(SUM(sls.additional_labor_cost),0) +
        IFNULL(SUM(sls.total_labor_cost),0) +
        IFNULL(SUM(sls.amount_paid),0) +
        IFNULL(SUM(sls.total_cost_manual_cutting),0) +
        IFNULL(SUM(sls.threshing_total_cost),0) +
        IFNULL(SUM(sls.total_cost_cutting),0))
        / %f / %f) as harvesting_threshing_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_harvesting_threshing sls ON sls.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 19
  public function getCleaningDryingCost() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT (SUM(sls.labor_total_cost ) / %f / %f) as cleaning_drying_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN countries c ON c.id = f.countries_id
        INNER JOIN currencies cs ON cs.id = c.currencies_id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pre_planting_information slp ON slp.household_survey_id = sl.id
        INNER JOIN household_survey sl2 ON sl2.farmers_id = f.id AND
          sl2.farmer_seasons_id = fs.id
        INNER JOIN household_survey_cleaning_drying sls ON sls.household_survey_id = sl2.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 20
  public function getRentalCost() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT ((slp.rent_cost ) / %f / %f) as rent_cost
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pre_planting_information slp ON slp.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 20.1
  public function getStrawYieldPreviousCrop() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT (((100 - 22) / 86) * SUM(slp.grain_yield_previous)
        / %f) * 2.083 - (((100 - 22) / 86) * SUM(slp.grain_yield_previous)
        / %f) as straw_yield_previous_crop
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        LEFT JOIN household_survey_pre_planting_information slp ON slp.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $temp['rice_area'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    $result = $result->fetchFirstRow();
    return $result['straw_yield_previous_crop'];
  }

  // 21
  public function getGrainYield() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT ((100 -
        IF(slg.grain_moisture_content = 0, 22, slg.grain_moisture_content)) / 86 *
        slg.rice_amount) / %f as grain_yield
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_grain_and_straw_yield slg ON slg.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $temp['rice_area'],
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 23
  public function getTotalGrossIncome() {
    $result = $this->getGrainYield();
    $temp = $this->getRiceAreaAndExchangeRate();

    $grainYield = (float) $result['grain_yield'];

    $result = DB::queryMaster('
      SELECT ((%f * SUM(slg.rice_selling_price)) / %f) + (SUM(slg.straw_total_price) / %f / %f ) as total_gross_income
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_grain_and_straw_yield slg ON slg.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $grainYield,
        $temp['exchange_rate'],
        $temp['rice_area'],
        $temp['exchange_rate'],
        $this->farmerId,
        $this->farmerSeasonId
      ));

    return $result->fetchFirstRow();
  }

  // 25
  public function getTotalNumberOfMaleLabor() {
    $temp = $this->getRiceAreaAndExchangeRate();
    $result = DB::queryMaster('
      SELECT (IFNULL(SUM(sllp.male_labor_count),0) +
        IFNULL(SUM(sls.male_labor),0) +
        IFNULL(SUM(sls.seedling_male_labor),0) +
        IFNULL(SUM(sls.nursery_male_labor),0) +
        IFNULL(SUM(slf.male_labor),0) +
        IFNULL(SUM(slw.weeding_male_labor),0) +
        IFNULL(SUM(slw.herbicide_male_labor),0) +
        IFNULL(SUM(slpa.male_labor),0) +
        IFNULL(SUM(slht.male_labor),0) +
        IFNULL(SUM(sli.male_labor_count),0) +
        IFNULL(SUM(slc.male_labor),0)) / %f as total_male_labor
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        LEFT JOIN household_survey_land_preparation sllp ON sllp.household_survey_id = sl.id
        LEFT JOIN household_survey_sowing_transplanting sls ON sls.household_survey_id = sl.id
        LEFT JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
        LEFT JOIN household_survey_weeding_herbicide slw ON slw.household_survey_id = sl.id
        LEFT JOIN household_survey_pesticide_application slpa ON slpa.household_survey_id = sl.id
        LEFT JOIN household_survey_harvesting_threshing slht ON slht.household_survey_id = sl.id
        LEFT JOIN household_survey_cleaning_drying slc ON slc.household_survey_id = sl.id
        LEFT JOIN household_survey_irrigation sli ON sli.household_survey_id = sl.id

      WHERE f.id = %f AND fs.id = %f', array($temp['rice_area'], $this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  // 26
  public function getTotalNumberOfFemaleLabor() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT (IFNULL(SUM(sllp.female_labor_count),0) +
        IFNULL(SUM(sls.female_labor),0) +
        IFNULL(SUM(sls.seedling_female_labor),0) +
        IFNULL(SUM(sls.nursery_female_labor),0) +
        IFNULL(SUM(slf.female_labor),0) +
        IFNULL(SUM(slw.weeding_female_labor),0) +
        IFNULL(SUM(slw.herbicide_female_labor),0) +
        IFNULL(SUM(slpa.female_labor),0) +
        IFNULL(SUM(slht.female_labor),0) +
        IFNULL(SUM(sli.female_labor_count),0) +
        IFNULL(SUM(slc.female_labor),0)) / %f as total_female_labor
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        LEFT JOIN household_survey_land_preparation sllp ON sllp.household_survey_id = sl.id
        LEFT JOIN household_survey_sowing_transplanting sls ON sls.household_survey_id = sl.id
        LEFT JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
        LEFT JOIN household_survey_weeding_herbicide slw ON slw.household_survey_id = sl.id
        LEFT JOIN household_survey_pesticide_application slpa ON slpa.household_survey_id = sl.id
        LEFT JOIN household_survey_harvesting_threshing slht ON slht.household_survey_id = sl.id
        LEFT JOIN household_survey_cleaning_drying slc ON slc.household_survey_id = sl.id
        LEFT JOIN household_survey_irrigation sli ON sli.household_survey_id = sl.id

      WHERE f.id = %f AND fs.id = %f', array($temp['rice_area'], $this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  // 27
  public function getTotalNumberOfAbove18Labor() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT (IFNULL(SUM(sllp.above_18_years_old_count),0) +
        IFNULL(SUM(sls.above_18_years_old),0) +
        IFNULL(SUM(sli.above_18_years_old_count),0) +
        IFNULL(SUM(sls.seedling_above_18_years_old),0) +
        IFNULL(SUM(sls.nursery_above_18_years_old),0) +
        IFNULL(SUM(slf.above_18_years_old),0) +
        IFNULL(SUM(slw.weeding_above_18_years),0) +
        IFNULL(SUM(slw.herbicide_above_18_years),0) +
        IFNULL(SUM(slpa.above_18_years_old),0) +
        IFNULL(SUM(slht.above_18_years_old),0) +
        IFNULL(SUM(slc.above_18_years_old),0)) / %f as total_above_18_labor
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        LEFT JOIN household_survey_land_preparation sllp ON sllp.household_survey_id = sl.id
        LEFT JOIN household_survey_sowing_transplanting sls ON sls.household_survey_id = sl.id
        LEFT JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
        LEFT JOIN household_survey_weeding_herbicide slw ON slw.household_survey_id = sl.id
        LEFT JOIN household_survey_pesticide_application slpa ON slpa.household_survey_id = sl.id
        LEFT JOIN household_survey_harvesting_threshing slht ON slht.household_survey_id = sl.id
        LEFT JOIN household_survey_cleaning_drying slc ON slc.household_survey_id = sl.id
        LEFT JOIN household_survey_irrigation sli ON sli.household_survey_id = sl.id

      WHERE f.id = %f AND fs.id = %f', array($temp['rice_area'], $this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  // 27
  public function getTotalNumberOfBelow18Labor() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT (IFNULL(SUM(sllp.below_18_years_old_count),0) +
        IFNULL(SUM(sls.below_18_years_old),0) +
        IFNULL(SUM(sli.below_18_years_old_count),0) +
        IFNULL(SUM(sls.seedling_below_18_years_old),0) +
        IFNULL(SUM(sls.nursery_below_18_years_old),0) +
        IFNULL(SUM(slf.below_18_years_old),0) +
        IFNULL(SUM(slw.weeding_below_18_years),0) +
        IFNULL(SUM(slw.herbicide_below_18_years),0) +
        IFNULL(SUM(slpa.below_18_years_old),0) +
        IFNULL(SUM(slht.below_18_years_old),0) +
        IFNULL(SUM(slc.below_18_years_old),0)) / %f as total_below_18_labor
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        LEFT JOIN household_survey_land_preparation sllp ON sllp.household_survey_id = sl.id
        LEFT JOIN household_survey_sowing_transplanting sls ON sls.household_survey_id = sl.id
        LEFT JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
        LEFT JOIN household_survey_weeding_herbicide slw ON slw.household_survey_id = sl.id
        LEFT JOIN household_survey_pesticide_application slpa ON slpa.household_survey_id = sl.id
        LEFT JOIN household_survey_harvesting_threshing slht ON slht.household_survey_id = sl.id
        LEFT JOIN household_survey_cleaning_drying slc ON slc.household_survey_id = sl.id
        LEFT JOIN household_survey_irrigation sli ON sli.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array($temp['rice_area'], $this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  // 32.1
  public function getNitrogenAmount() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT SUM(n / 100 * slfa.`amount` / %f) as nitrogen_amount
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
        INNER JOIN household_survey_fertilizer_application_info slfa ON slfa.household_survey_fertilizer_application_id = slf.id
      WHERE f.id = %f AND fs.id = %f', array($temp['rice_area'], $this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  // 32.2
  public function getPhosphorusAmount() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT SUM(p205 / 100 * slfa.`amount` / %f) as phosphorus_amount
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
        INNER JOIN household_survey_fertilizer_application_info slfa ON slfa.household_survey_fertilizer_application_id = slf.id
      WHERE f.id = %f AND fs.id = %f', array($temp['rice_area'], $this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  // 32.3
  public function getPotassiumAmount() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT SUM(k20 / 100 * slfa.`amount` / %f) as potassium_amount
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
        INNER JOIN household_survey_fertilizer_application_info slfa ON slfa.household_survey_fertilizer_application_id = slf.id
      WHERE f.id = %f AND fs.id = %f', array($temp['rice_area'], $this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  // 32.4
  public function getNitrogenCount() {
    $result = DB::queryMaster('
      SELECT slfa.id
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
        INNER JOIN household_survey_fertilizer_application_info slfa ON slfa.household_survey_fertilizer_application_id = slf.id
      WHERE f.id = %f AND fs.id = %f AND n > 0', array($this->farmerId, $this->farmerSeasonId));

    return $result->numRows();
  }

  // 32.5
  public function getPhosphorusCount() {
    $result = DB::queryMaster('
      SELECT slfa.id
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
        INNER JOIN household_survey_fertilizer_application_info slfa ON slfa.household_survey_fertilizer_application_id = slf.id
      WHERE f.id = %f AND fs.id = %f AND p205 > 0', array($this->farmerId, $this->farmerSeasonId));

    return $result->numRows();
  }

  // 32.6
  public function getPotassiumCount() {
    $result = DB::queryMaster('
      SELECT slfa.id
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
        INNER JOIN household_survey_fertilizer_application_info slfa ON slfa.household_survey_fertilizer_application_id = slf.id
      WHERE f.id = %f AND fs.id = %f AND k20 > 0', array($this->farmerId, $this->farmerSeasonId));

    return $result->numRows();
  }

  // 33
  public function getNitrogenUseEfficiency() {
    $grainYield = $this->getGrainYield();
    $nitrogenAmount = $this->getNitrogenAmount();
    return ((float) $grainYield['grain_yield'] / (float) $nitrogenAmount['nitrogen_amount']);
  }

  // 34
  public function getPhosphorusUseEfficiency() {
    $grainYield = $this->getGrainYield();
    $phosphorusAmount = $this->getPhosphorusAmount();
    return (float) $grainYield['grain_yield'] / ((float) $phosphorusAmount['phosphorus_amount'] * 0.4364);
  }

  // 35
  public function getPotassiumUseEfficiency() {
    $grainYield = $this->getGrainYield();
    $potassiumAmount = $this->getPotassiumAmount();
    return (float) $grainYield['grain_yield'] / ((float) $potassiumAmount['potassium_amount'] * 0.8301);
  }

  // 36
  public function getZnApplication() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT (SUM(slfa.zn) / %f) as zn_application
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
        INNER JOIN household_survey_fertilizer_application_info slfa ON slfa.household_survey_fertilizer_application_id = slf.id
      WHERE f.id = %f AND fs.id = %f', array($temp['rice_area'], $this->farmerId, $this->farmerSeasonId));
    return $result->fetchFirstRow();
  }

  // 37
  public function getSulphurApplication() {
    $temp = $this->getRiceAreaAndExchangeRate();

    $result = DB::queryMaster('
      SELECT (SUM(slfa.s) / %f) as sulphur_application
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
        INNER JOIN household_survey_fertilizer_application_info slfa ON slfa.household_survey_fertilizer_application_id = slf.id
      WHERE f.id = %f AND fs.id = %f', array($temp['rice_area'], $this->farmerId, $this->farmerSeasonId));
    return $result->fetchFirstRow();
  }


  // 40
  public function getNitrogenUseEfficiencyMethodTwo() {
    $result = $this->getGrainYield();
    $grainYield = (float) $result['grain_yield'];

    $result = DB::queryMaster('
      SELECT (%f - SUM(slf.grain_yield_parcel)) / SUM(slfa.n) as nitrogen_use_efficiency
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
        INNER JOIN household_survey_fertilizer_application_info slfa ON slfa.household_survey_fertilizer_application_id = slf.id
      WHERE f.id = %f AND fs.id = %f', array($grainYield, $this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  // 41
  public function getPhosphorusUseEfficiencyMethodTwo() {
    $result = $this->getGrainYield();
    $grainYield = (float) $result['grain_yield'];

    $result = DB::queryMaster('
      SELECT (%f - SUM(slf.grain_yield_parcel)) / SUM(slfa.p205) as phosphorus_use_efficiency
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application slf ON slf.household_survey_id = sl.id
        INNER JOIN household_survey_fertilizer_application_info slfa ON slfa.household_survey_fertilizer_application_id = slf.id
      WHERE f.id = %f AND fs.id = %f', array($grainYield, $this->farmerId, $this->farmerSeasonId));

    return $result->fetchFirstRow();
  }

  protected function getTotalWaterIrrigation() {
    $result = DB::queryMaster('
      SELECT IFNULL(SUM(sip.water_depth),0) - IFNULL(SUM(sip.standing_water),0) as irrigation_total
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_irrigation si ON si.household_survey_id = sl.id
        INNER JOIN household_survey_irrigation_period sip ON sip.household_survey_irrigation_id = si.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  // 42
  public function getWaterAppliedFieldPreparation() {
    $temp = $this->getTotalWaterIrrigation();

    $result = DB::queryMaster('
      SELECT SUM(si.irrigation_field_count) * 100 as water_applied_field_preparation
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_irrigation si ON si.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();

  }

  // 43
  public function getWaterAppliedCropGrowing() {
    $temp = $this->getTotalWaterIrrigation();

    return array(
      'water_applied_crop_growing' => ((float) $temp['irrigation_total'] * 10)
    );
  }

  // 44
  public function getIrrigationAppliedCount() {
    $result = DB::queryMaster('
      SELECT *
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_irrigation si ON si.household_survey_id = sl.id
        INNER JOIN household_survey_irrigation_period sip ON sip.household_survey_irrigation_id = si.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    $count = (float) $result->numRows();

    $result2 = DB::queryMaster('
      SELECT SUM(irrigation_field_count) as irrigation_sum
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_irrigation si ON si.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    $result2 = $result2->fetchFirstRow();
    return $count + (float) $result2['irrigation_sum'];
  }

  public function getTotalRainFall() {
    $result = DB::queryMaster('
      SELECT slg.total_rainfall
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_grain_and_straw_yield slg ON slg.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));
    return $result->fetchFirstRow();
  }

  protected function getDateDifference($sDate, $nDate) {
    $dStart = new DateTime($sDate);
    $dEnd  = new DateTime($nDate);
    $dDiff = $dStart->diff($dEnd);
    return (int) $dDiff->format('%a');
  }

  protected function getPreplantingHarvestDates() {
    $result = DB::queryMaster('
      SELECT slp.organic_materials_incorporated as date_end, slp.previous_crop_harvested as date_start
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pre_planting_information slp ON slp.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  protected function getOrganicMaterials() {
    $result = DB::queryMaster('
      SELECT slpom.name, slpom.amount
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pre_planting_information slp ON slp.household_survey_id = sl.id
        INNER JOIN household_survey_pre_planting_information_organic_materials slpom
          ON slpom.household_survey_pre_planting_information_id = slp.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));
    return $result->fetch();
  }

  public function getPreviousCrop() {
    $result = DB::queryMaster('
      SELECT slp.previous_crop
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pre_planting_information slp ON slp.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));
    if ($result->numRows() <= 0) {
      return false;
    }

    $result = $result->fetchFirstRow();
    return $result['previous_crop'];
  }

  public function getStrawManaged() {
    $result = DB::queryMaster('
      SELECT slp.straw_previous_crop_managed as value
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pre_planting_information slp ON slp.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));
    $result = $result->fetchFirstRow();

    switch ((int) $result['value']) {
      case 1:
      case 2:
      case 3:
        $spMultiplier = 0.15;
      break;
      case 4:
        $spMultiplier = 1;
      break;
      case 5:
        $spMultiplier = 0.50;
      break;
      case 6:
        $spMultiplier = 0.20;
      break;
    }

    return $spMultiplier * (float) $this->getStrawYieldPreviousCrop() / 1000;
  }

  public function getOrganicMaterialSum() {
    $organicMaterials = $this->getOrganicMaterials();
    $organicMaterialSum = 0;

    foreach ($organicMaterials as $value) {
      switch($value['name']) {
        /*case 'Previous crop\'s straw':
          $organicMaterialSum += 0.29 * $value['amount'] / 1000;
        break;*/
        case 'Compost':
          $organicMaterialSum += 0.05 * $value['amount'] / 1000;
        break;
        case 'FYM':
          $organicMaterialSum += 0.14 * $value['amount'] / 1000;
        break;
        case 'Green manure':
          $organicMaterialSum += 0.50 * $value['amount'] / 1000;
        break;
      }
    }
    return $organicMaterialSum;
  }

  // 49.1
  public function getSFO() {
    $dates = $this->getPreplantingHarvestDates();
    $sDate = $this->getSowingTransplantingDate();

    if ($this->isValidDate($sDate['sowing_date'])) {
      $sDate = $sDate['sowing_date'];
    } else if ($this->isValidDate($sDate['transplanting_date'])) {
      $sDate = $sDate['transplanting_date'];
    } else {
      return;
    }

    $dStart = new DateTime($sDate);
    $dEnd  = new DateTime($dates['date_end']);
    $dateDiff = $dStart->diff($dEnd)->format('%a');

    $previousCrop = $this->getPreviousCrop();
    if (!$previousCrop) {
      return;
    }

    if ($dateDiff < 30) {
      if ($previousCrop >= 1 && $previousCrop <= 2) {
        return pow(1 + $this->getStrawManaged() + $this->getOrganicMaterialSum(), 0.59);
      } else if ($previousCrop > 2 && $previousCrop <= 5) {
        return pow(1 + $this->getOrganicMaterialSum(), 0.59);
      }
    } else {
      if ($previousCrop >= 1 && $previousCrop <= 2) {
        return pow(1 + ((float) $this->getStrawManaged() * 0.29) + $this->getOrganicMaterialSum(), 0.59);
      } else if ($previousCrop > 2 && $previousCrop <= 5) {
        return pow(1 + $this->getOrganicMaterialSum(), 0.59);
      }
    }
  }

  protected function getWaterRegime() {
    $result = DB::queryMaster('
      SELECT slp.water_regime
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pre_planting_information slp ON slp.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));
    $result = $result->fetchFirstRow();

    switch ($result['water_regime']) {
      case 1:
        return 1;
      break;
      case 2:
        return 0.68;
      break;
      case 3:
        return 1.90;
      break;
      case 4:
        return 1.22;
      break;
    }
  }

  protected function getIrrigationMethodGrainYield() {
    $result = DB::queryMaster('
      SELECT slp.irrigation_method
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_grain_and_straw_yield slp ON slp.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));
    $result = $result->fetchFirstRow();

    switch ($result['irrigation_method']) {
      case 1:
        return 1;
      break;
      case 2:
        return 0.6;
      break;
      case 3:
        return 0.52;
      break;
      case 4:
        return 0.28;
      break;
      case 5:
        return 0.25;
      break;
      case 6:
        return 0.31;
      break;
      case 7:
        return 0.78;
      break;
      case 8:
        return 0.27;
      break;
      case 9:
        return 0;
      break;
    }
  }

  public function getStrawBurned() {
    $result = DB::queryMaster('
      SELECT slp.straw_burned
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pre_planting_information slp ON slp.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));
    $result = $result->fetchFirstRow();
    return (float) $result['straw_burned'];
  }

  protected function getCropGrowingDuration() {
    $sDate = $this->getSowingTransplantingDate();
    $nDate = $this->getHarvestingDate();

    if ($this->isValidDate($sDate['sowing_date'])) {
      $sDate = $sDate['sowing_date'];
    } else if ($this->isValidDate($sDate['transplanting_date'])) {
      $sDate = $sDate['transplanting_date'];
    } else {
      return;
    }

    if (!$this->isValidDate($nDate['crop_harvest_date'])) {
      return;
    }

    $nDate = $nDate['crop_harvest_date'];

    if (!$this->isValidDate($sDate) || !$this->isValidDate($nDate)) {
      return null;
    }

    $dStart = new DateTime($sDate);
    $dEnd  = new DateTime($nDate);
    $dDiff = $dStart->diff($dEnd);
    return (int) $dDiff->format('%a');
  }

  private function isValidDate($date) {
    return $date && $date != '0000-00-00 00:00:00';
  }

  // 49.2
  public function getMethaneEmission() {
    $waterRegime = $this->getWaterRegime();
    $duration = $this->getCropGrowingDuration();
    $irrigationMethod = $this->getIrrigationMethodGrainYield();
    $temp = $this->getRiceAreaAndExchangeRate();
    $sfo = $this->getSFO();

    return ($duration * $sfo * $waterRegime * $irrigationMethod * 1.3) +
      ((float) $this->getStrawYieldPreviousCrop() * $this->getStrawBurned() / 100 * 4.51 / 1000) / $temp['rice_area'];
  }

  // 51
  public function getTotalNumberHerbicideApplication() {
    $sDate = $this->getSowingTransplantingDate();

    if ($this->isValidDate($sDate['sowing_date'])) {
      $sDate = $sDate['sowing_date'];
    } else if ($this->isValidDate($sDate['transplanting_date'])) {
      $sDate = $sDate['transplanting_date'];
    } else {
      return;
    }

    $result = DB::queryMaster('
      SELECT slha.*
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_weeding_herbicide slh ON slh.household_survey_id = sl.id
        INNER JOIN household_survey_weeding_herbicide_application slha
          ON slha.household_survey_weeding_herbicide_id = slh.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));
    $result = $result->fetch();

    $total = 0;
    $max = 0;
    foreach ($result as $value) {
      if (!$this->isValidDate($value['date'])) {
        continue;
      }

      $dateDifference = $this->getDateDifference($value['date'], $sDate);
      $total += $dateDifference;

      if ($dateDifference > $max) {
        $max = $dateDifference;
      }
    }

    return array(
      'total' => $total,
      'max' => $max,
      'count' => count($result)
    );
  }

  protected function getHerbicideApplicationLeftOver($value) {
    switch ((int) $value) {
      case 1:
        return 1/2;
      break;
      case 2:
        return 2/3;
      break;
      case 3:
        return 1/3;
      break;
      case 4:
        return 1/4;
      break;
      default:
        return 0;
    }
  }

  public function getTotalAmountHerbicideApplication() {
    $result = DB::queryMaster('
      SELECT slha.*
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_weeding_herbicide slh ON slh.household_survey_id = sl.id
        INNER JOIN household_survey_weeding_herbicide_application slha
          ON slha.household_survey_weeding_herbicide_id = slh.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));
    $result = $result->fetch();
    $temp = $this->getRiceAreaAndExchangeRate();
    $total = 0;
    foreach ($result as $value) {
      $b = (float) $value['bottles_applied'];
      $a = (float) $value['ml'];
      $l = $this->getHerbicideApplicationLeftOver($value['leftover']);
      $total += ($b * $a) - ($a - ($a - ($l * $a)));
    }

    return $total / 1000 / $temp['rice_area'];
  }

  public function getTotalNumberApplication($brand) {
    $sDate = $this->getSowingTransplantingDate();

    if ($this->isValidDate($sDate['sowing_date'])) {
      $sDate = $sDate['sowing_date'];
    } else if ($this->isValidDate($sDate['transplanting_date'])) {
      $sDate = $sDate['transplanting_date'];
    } else {
      return;
    }

    $result = DB::queryMaster('
      SELECT slprp.*
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pesticide_application slpa ON slpa.household_survey_id = sl.id
        INNER JOIN household_survey_pesticide_rice_problems_detail slprp
          ON slprp.household_survey_pesticide_application_id = slpa.id
      WHERE f.id = %f AND fs.id = %f AND brand_applied = "%d"', array(
        $this->farmerId,
        $this->farmerSeasonId,
        $brand
      ));
    $result = $result->fetch();

    $total = 0;
    $max = 0;
    $min = null;
    foreach ($result as $value) {
      if (!$this->isValidDate($value['applied_date'])) {
        continue;
      }

      $dateDifference = $this->getDateDifference($value['applied_date'], $sDate);
      $total += $dateDifference;

      if ($dateDifference > $max) {
        $max = $dateDifference;
      }

      if ($min === null || $min > $dateDifference) {
        $min = $dateDifference;
      }
    }

    return array(
      'total' => $total,
      'max' => $max,
      'min' => $min,
      'count' => count($result)
    );
  }

  public function getTotalAmountApplication($brand) {
    $result = DB::queryMaster('
      SELECT slprp.*
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pesticide_application slpa ON slpa.household_survey_id = sl.id
        INNER JOIN household_survey_pesticide_rice_problems_detail slprp
          ON slprp.household_survey_pesticide_application_id = slpa.id
      WHERE f.id = %f AND fs.id = %f AND brand_applied = "%d"', array(
        $this->farmerId,
        $this->farmerSeasonId,
        $brand
      ));
    $result = $result->fetch();
    $temp = $this->getRiceAreaAndExchangeRate();

    $total = 0;
    foreach ($result as $value) {
      $b = (float) $value['applied'];
      $a = (float) $value['amount'];
      $l = $this->getHerbicideApplicationLeftOver($value['leftover']);
      $total += ($b * $a) - ($a - ($a - ($l * $a)));
    }

    return $total / 1000 / $temp['rice_area'];
  }

  // 75
  public function getFoodSafetyScore() {
    $result = DB::queryMaster('
      SELECT SUM(slfs.aware_food_safety_risk*100)/2 as food_safety_score
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_food_safety slfs ON slfs.household_survey_id = sl.id
      WHERE f.id = %d AND fs.id = %d', array(
        $this->farmerId,
        $this->farmerSeasonId
      ));

    return $result->fetchFirstRow();
  }

  // 77
  public function getWorkerHealthAndSafetyScore() {
    $result = DB::queryMaster('
      SELECT (
        SUM(IF(work_related_injuries=1, 10, IF(work_related_injuries=2, 5, 0))) +
        SUM(IF(safety_instructions_available=1, 10, IF(safety_instructions_available=2, 10,
          IF(safety_instructions_available=3, 5, 0)))) +
        SUM(IF(tools_calibrated_maintained=1, 10, IF(tools_calibrated_maintained=2, 5, 0))) +
        SUM(IF(training_pesticide_applicators=1, 10, IF(training_pesticide_applicators=2, 10,
          IF(training_pesticide_applicators=3, 5, 0)))) +
        SUM(IF(pesticide_applicator_good_quality=1, 10, IF(pesticide_applicator_good_quality=2, 10,
          IF(pesticide_applicator_good_quality=3, 5, 0)))) +
        SUM(IF(washing_changing_facility_available=1, 10, IF(washing_changing_facility_available=2, 10,
          IF(washing_changing_facility_available=3, 5, 0)))) +
        SUM(IF(pesticide_applied_pregnant_women=1, 10, IF(pesticide_applied_pregnant_women=2, 5, 0))) +
        SUM(IF(re_entry_time_48_hour=1, 10, IF(re_entry_time_48_hour=2, 10,
          IF(re_entry_time_48_hour=3, 5, 0)))) +
        SUM(IF(pesticide_inorganic_fertilizer_stored=1, 10, IF(pesticide_inorganic_fertilizer_stored=2, 10,
          IF(pesticide_inorganic_fertilizer_stored=3, 5, 0)))) +
        SUM(IF(empty_pesticide_disposed=1, 10, IF(empty_pesticide_disposed=2, 10,
          IF(empty_pesticide_disposed=3, 3.3, IF(empty_pesticide_disposed=4, 3.3,
          IF(empty_pesticide_disposed=5, 3.3, 0))))))
      ) worker_health_safety_score
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_workers_health_safety slwhs ON slwhs.household_survey_id = sl.id
      WHERE f.id = %d AND fs.id = %d', array(
        $this->farmerId,
        $this->farmerSeasonId
      ));

    return $result->fetchFirstRow();
  }


  // 79
  public function getChildLaborScore() {
    $result = DB::queryMaster('
      SELECT slwhs.id, IF(employment_below_18=1, 10, 0) as child_labor_score,
        IF(employment_above_18=1, 25, IF(employment_above_18=2, 25, IF(employment_above_18=3, 10, 0))) as employment_above_score,
        IF(school_going_children_employed=1, 50, IF(school_going_children_employed=2, 50, IF(school_going_children_employed=3, 25, IF(school_going_children_employed=3, 10, 0)))) as school_going_children_employed_score

      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_child_labor slwhs ON slwhs.household_survey_id = sl.id
      WHERE f.id = %d AND fs.id = %d', array(
        $this->farmerId,
        $this->farmerSeasonId
      ));

    $data = $result->fetchFirstRow();
    $score = 0;
    if ($data['child_labor_score'] > 0) {
      $score += $data['child_labor_score'];
    } else {
      $res = DB::querySlave('
        SELECT id
        FROM household_survey_child_labor_record
        WHERE household_survey_child_labor_id = %d', array(
        $data['id']
      ));

      $score += $res->numRows() * 5;
    }

    return $score + $data['employment_above_score'] + $data['school_going_children_employed_score'];
  }

  // 81
  public function getWomenEmpowermentScore() {
    $result = DB::queryMaster('
      SELECT (
        SUM(IF(womens_decision=1, 10, IF(womens_decision=2, 2, 0))) +
        SUM(IF(womens_control_over_decision=1, 10, IF(womens_control_over_decision=2, 2, 0))) +
        SUM(IF(womens_satisfaction_labor_input=1, 10, IF(womens_satisfaction_labor_input=2, 2, 0))) +
        SUM(IF(womens_access_information=1, 10, IF(womens_access_information=2, 2, 0))) +
        SUM(IF(womens_access_seasonal_resources=1, 10, IF(womens_access_seasonal_resources=2, 2, 0))) +
        SUM(IF(womens_control_long_term_resources=1, 10, IF(womens_control_long_term_resources=2, 2, 0))) +
        SUM(IF(womens_control_decision_making_household=1, 10, IF(womens_control_decision_making_household=2, 2, 0))) +
        SUM(IF(womens_control_personal_income=1, 10, IF(womens_control_personal_income=2, 2, 0))) +
        SUM(IF(womens_participation_decision_making=1, 10, IF(womens_participation_decision_making=2, 2, 0))) +
        SUM(IF(violence_against_women=1, 10, IF(violence_against_women=2, 2, 0)))
      ) as women_empowerment_score
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_women_empowerment slwhs ON slwhs.household_survey_id = sl.id
      WHERE f.id = %d AND fs.id = %d', array(
        $this->farmerId,
        $this->farmerSeasonId
      ));

    return $result->fetchFirstRow();
  }

  public function getPesticideUseEfficiencyScore() {
    $result = DB::queryMaster('
      SELECT (
        SUM(IF(registered_products=1, 10, IF(registered_products=2, 10, 0))) +
        SUM(IF(targeted_application=1, 10, IF(targeted_application=2, 10, 0))) +
        SUM(IF(label_instructions=1, 10, IF(label_instructions=2, 10, IF(label_instructions=3, 5, 0)))) +
        SUM(IF(equipment_calibrated=1, 10, IF(equipment_calibrated=2, 10, IF(equipment_calibrated=3, 5, 0)))) +
        SUM(IF(weed_management=1, 10, IF(weed_management=2, 5, IF(weed_management=3, 2, 0)))) +
        SUM(IF(insect_management=1, 10, IF(insect_management=2, 5, IF(insect_management=3, 2, 0)))) +
        SUM(IF(disease_management=1, 10, IF(disease_management=2, 5, IF(disease_management=3, 2, 0)))) +
        SUM(IF(mollusk_management=1, 10, IF(mollusk_management=2, 5, IF(mollusk_management=3, 2, 0)))) +
        SUM(IF(rodent_management=1, 10, IF(rodent_management=2, 5, IF(rodent_management=3, 2, 0)))) +
        SUM(IF(bird_management=1, 10, IF(bird_management=2, 5, 0)))
      ) as pesticide_use_efficiency_score
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pesticide_use_efficiency pue ON pue.household_survey_id = sl.id
      WHERE f.id = %d AND fs.id = %d', array(
        $this->farmerId,
        $this->farmerSeasonId
      ));

    return $result->fetchFirstRow();
  }

  public function save($data) {
    DB::startTransaction();

    DB::queryMaster('DELETE FROM '.self::TABLE_NAME.' WHERE farmers_id = %d AND farmer_seasons_id = %d',
      array($data['farmers_id'], $data['farmer_seasons_id']));

    $result = DB::queryMaster('INSERT INTO '.self::TABLE_NAME.' VALUES (
      %f, %f, %f, %f, %f, %f, %f, %f, %f, %f,
      %f, %f, %f, %f, "%s", "%s", "%s", "%s", "%s", %f,
      %f, %f, %f, %f, %f, %f, %f, %f, %f, %f,
      %f, %f, %f, %f, %f, %f, %f, %f, %f, %f,
      %f, %f, %f, %f, %f, %f, %f, %f, %f, %f,
      %f, %f, %f, %f, %f, %f, %f, %f, %f, %f,
      %f, %f, %f, %f, %f, %f, "%s", %f, %f, %f,
      "%s", %f, %f, %f, "%s", %f, %f, %f, "%s", %f,
      %f, %f, "%s", %f, %f, %f, %f, %f, "%s", %f,
      "%s", %f, "%s", %f, "%s", %d, "%s", 0
    )', array(
      $data['farmers_id'] ? (float)  $data['farmers_id'] : 0,
      $data['farmer_seasons_id'] ? (float)  $data['farmer_seasons_id'] : 0,
      $data['seed_cost'] ? (float)  $data['seed_cost'] : 0,
      $data['land_preparation_cost'] ? (float)  $data['land_preparation_cost'] : 0,
      $data['sowing_transplanting_cost'] ? (float)  $data['sowing_transplanting_cost'] : 0,
      $data['nursery_seedling_production_cost'] ? (float)  $data['nursery_seedling_production_cost'] : 0,
      $data['nursery_preparation_cost'] ? (float)  $data['nursery_preparation_cost'] : 0,
      $data['nursery_preparation_machine_transplanting_cost'] ? (float)  $data['nursery_preparation_machine_transplanting_cost'] : 0,
      $data['purchased_seedling_cost'] ? (float)  $data['purchased_seedling_cost'] : 0,
      $data['irrigation_cost'] ? (float)  $data['irrigation_cost'] : 0,
      $data['fertilizer_application_cost'] ? (float)  $data['fertilizer_application_cost'] : 0,
      $data['weeding_cost'] ? (float)  $data['weeding_cost'] : 0,
      $data['organic_material_cost'] ? (float)  $data['organic_material_cost'] : 0,
      $data['seed_rate'] ? (float)  $data['seed_rate'] : 0,
      $data['land_preparation_date'] ?  $data['land_preparation_date'] : null,
      $data['nursery_establishment_date'] ? $data['nursery_establishment_date'] : null,
      $data['sowing_transplanting_date'] ? $data['sowing_transplanting_date'] : null,
      $data['harvesting_date'] ? $data['harvesting_date'] : null,
      $data['threshing_date'] ?  $data['threshing_date'] : null,
      $data['seedling_age'] ? (float)  $data['seedling_age'] : 0,
      $data['crop_growing_duration'] ? (float)  $data['crop_growing_duration'] : 0,
      $data['pesticide_cost'] ? (float)  $data['pesticide_cost'] : 0,
      $data['harvesting_threshing_cost'] ? (float)  $data['harvesting_threshing_cost'] : 0,
      $data['cleaning_drying_cost'] ? (float)  $data['cleaning_drying_cost'] : 0,
      $data['total_cost'] ? (float)  $data['total_cost'] : 0,
      $data['straw_yield_previous_crop'] ? (float)  $data['straw_yield_previous_crop'] : 0,
      $data['grain_yield'] ? (float)  $data['grain_yield'] : 0,
      $data['straw_yield'] ? (float)  $data['straw_yield'] : 0,
      $data['total_gross_income'] ? (float)  $data['total_gross_income'] : 0,
      $data['total_labor'] ? (float)  $data['total_labor'] : 0,
      $data['total_male_labor'] ? (float)  $data['total_male_labor'] : 0,
      $data['total_female_labor'] ? (float)  $data['total_female_labor'] : 0,
      $data['total_above_18_labor'] ? (float)  $data['total_above_18_labor'] : 0,
      $data['total_below_18_labor'] ? (float)  $data['total_below_18_labor'] : 0,
      $data['net_profit'] ? (float)  $data['net_profit'] : 0,
      $data['labor_productivity'] ? (float)  $data['labor_productivity'] : 0,
      $data['female_to_male_ratio'] ? (float)  $data['female_to_male_ratio'] : 0,
      $data['below_to_above_18_ratio'] ? (float)  $data['below_to_above_18_ratio'] : 0,
      $data['nitrogen_amount'] ? (float)  $data['nitrogen_amount'] : 0,
      $data['nitrogen_count'] ? (float)  $data['nitrogen_count'] : 0,
      $data['phosphorus_amount'] ? (float)  $data['phosphorus_amount'] : 0,
      $data['phosphorus_count'] ? (float)  $data['phosphorus_count'] : 0,
      $data['potassium_amount'] ? (float)  $data['potassium_amount'] : 0,
      $data['potassium_count'] ? (float)  $data['potassium_count'] : 0,
      $data['nitrogen_use_efficiency'] ? (float)  $data['nitrogen_use_efficiency'] : 0,
      $data['phosphorus_use_efficiency'] ? (float)  $data['phosphorus_use_efficiency'] : 0,
      $data['potassium_use_efficiency'] ? (float)  $data['potassium_use_efficiency'] : 0,
      $data['zn_application'] ? (float)  $data['zn_application'] : 0,
      $data['sulphur_application'] ? (float)  $data['sulphur_application'] : 0,
      $data['total_nitrogen_uptake'] ? (float)  $data['total_nitrogen_uptake'] : 0,
      $data['total_phosphorus_uptake'] ? (float)  $data['total_phosphorus_uptake'] : 0,
      $data['nitrogen_use_efficiency_method_two'] ? (float)  $data['nitrogen_use_efficiency_method_two'] : 0,
      $data['phosphorus_use_efficiency_method_two'] ? (float)  $data['phosphorus_use_efficiency_method_two'] : 0,
      $data['water_applied_field_preparation'] ? (float)  $data['water_applied_field_preparation'] : 0,
      $data['water_applied_crop_growing'] ? (float)  $data['water_applied_crop_growing'] : 0,
      $data['irrigation_applied_count'] ? (float)  $data['irrigation_applied_count'] : 0,
      $data['total_water_productivity_kg_grain'] ? (float)  $data['total_water_productivity_kg_grain'] : 0,
      $data['total_water_productivity_litre_water'] ? (float)  $data['total_water_productivity_litre_water'] : 0,
      $data['total_irrigation_water_productivity'] ? (float)  $data['total_irrigation_water_productivity'] : 0,
      $data['rainfall_water_productivity'] ? (float)  $data['rainfall_water_productivity'] : 0,
      $data['sfo'] ? (float)  $data['sfo'] : 0,
      $data['methane_emission'] ? (float)  $data['methane_emission'] : 0,
      $data['co2_equivalent'] ? (float)  $data['co2_equivalent'] : 0,
      $data['total_number_herbicide_application'] ? (float)  $data['total_number_herbicide_application'] : 0,
      $data['total_amount_herbicide_application'] ? (float)  $data['total_amount_herbicide_application'] : 0,
      $data['herbicide_score'] ? (float)  $data['herbicide_score'] : 0,
      $data['herbicide_rank'] ? $data['herbicide_rank'] : null,
      $data['total_number_insecticide_application'] ? (float)  $data['total_number_insecticide_application'] : 0,
      $data['total_amount_insecticide_application'] ? (float)  $data['total_amount_insecticide_application'] : 0,
      $data['insecticide_score'] ? (float)  $data['insecticide_score'] : 0,
      $data['insecticide_rank'] ?  $data['insecticide_rank'] : null,
      $data['total_number_fungicide_application'] ? (float)  $data['total_number_fungicide_application'] : 0,
      $data['total_amount_fungicide_application'] ? (float)  $data['total_amount_fungicide_application'] : 0,
      $data['fungicide_score'] ? (float)  $data['fungicide_score'] : 0,
      $data['fungicide_rank'] ? $data['fungicide_rank'] : null,
      $data['total_number_molluscicide_application'] ? (float)  $data['total_number_molluscicide_application'] : 0,
      $data['total_amount_molluscicide_application'] ? (float)  $data['total_amount_molluscicide_application'] : 0,
      $data['molluscicide_score'] ? (float)  $data['molluscicide_score'] : 0,
      $data['molluscicide_rank'] ? $data['molluscicide_rank'] : null,
      $data['total_number_rodenticide_application'] ? (float)  $data['total_number_rodenticide_application'] : 0,
      $data['total_amount_rodenticide_application'] ? (float)  $data['total_amount_rodenticide_application'] : 0,
      $data['rodenticide_score'] ? (float)  $data['rodenticide_score'] : 0,
      $data['rodenticide_rank'] ?  $data['rodenticide_rank'] : null,
      $data['total_number_pesticide_application'] ? (float)  $data['total_number_pesticide_application'] : 0,
      $data['total_amount_pesticide_application'] ? (float)  $data['total_amount_pesticide_application'] : 0,
      $data['total_score_pesticide_application'] ? (float)  $data['total_score_pesticide_application'] : 0,
      $data['pesticide_ranking'] ? (float)  $data['pesticide_ranking'] : 0,
      $data['food_safety_score'] ? (float)  $data['food_safety_score'] : 0,
      $data['food_safety_rank'] ?  $data['food_safety_rank'] : null,
      $data['worker_health_and_safety_score'] ? (float)  $data['worker_health_and_safety_score'] : 0,
      $data['worker_health_and_safety_rank'] ? $data['worker_health_and_safety_rank'] : null,
      $data['child_labor_score'] ? (float)  $data['child_labor_score'] : 0,
      $data['child_labor_rank'] ? $data['child_labor_rank'] : null,
      $data['women_empowerment_score'] ? (float)  $data['women_empowerment_score'] : 0,
      $data['women_empowerment_rank'] ? $data['women_empowerment_rank'] : null,
      $data['pesticide_use_efficiency_score'] ? (float)  $data['pesticide_use_efficiency_score'] : 0,
      $data['pesticide_use_efficiency_rank'] ? $data['pesticide_use_efficiency_rank'] : null,
    ));

    DB::commit();
    return true;
  }

  public function get() {
    $result = DB::queryMaster('SELECT * from ' . self::TABLE_NAME . ' WHERE farmers_id = %d AND farmer_seasons_id = %d', array(
      $this->farmerId,
      $this->farmerSeasonId
    ));

    return $result->fetchFirstRow();
  }
}
