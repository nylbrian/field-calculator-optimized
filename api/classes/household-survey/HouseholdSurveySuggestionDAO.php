<?php

class HouseholdSurveySuggestionDAO {
  private $farmerId;
  private $farmerSeasonId;

  public function __construct($farmersId, $farmerSeasonsId) {
    $this->farmerId = $farmersId;
    $this->farmerSeasonId = $farmerSeasonsId;
  }

  public function getSuggestion() {
    $result = DB::queryMaster('
      SELECT sc.*
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey_computations sc ON fs.farmers_id = f.id
      WHERE f.id = %d AND sc.farmer_seasons_id = %d', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    $data = array();

    if ($result->numRows() <= 0) {
      return $data;
    }

    $data = $result->fetchFirstRow();

    $foodSafety = $this->getFoodSafety();
    $data['nitrogen_recommendation'] = $this->getNitrogenRecommendations($data);
    $data['aware_food_safety_risk'] = $foodSafety['aware_food_safety_risk'];
    $data['grain_yield_info'] = $this->getGrainYieldRecommendation('grain_yield');
    $data['net_profit_info'] = $this->getNetProfitRecommendation('net_profit');
    $data['weeding_control'] = $this->getWeedingControl();
    $data['weeding_infestation'] = $this->getWeedingInfestation();
    $data['herbicide_application_count'] = $this->getHerbicideApplication();
    $data['weed_control_inefficiency'] = $this->getWeedControlInefficiency();
    $data['herbicide_application_date'] = $this->getHerbicideApplicationDate(
      $data['sowing_transplanting_date']);

    $prePlanting = $this->getPrePlantingInformation();
    $data['seed_type'] = $prePlanting['seed_type'];
    $data['seed_certified'] = $prePlanting['seed_certified'];
    $data['soil_fertility'] = $prePlanting['soil_fertility'];
    $data['incorporate_straw'] = $this->getDateDifference($prePlanting['organic_materials_incorporated'], $data['sowing_transplanting_date']);
    $data['water_regime'] = $prePlanting['water_regime'];

    $grainYield = $this->getGrainYield();
    $data['greenhouse_gas'] = $grainYield['irrigation_method'];

    $data['insecticide_less_40'] = $this->getPesticideRows(1, $data['sowing_transplanting_date'], 40, 0) > 0;
    $data['insecticide_greater_70'] = $this->getPesticideRows(1, $data['sowing_transplanting_date'], 70, 1) > 0;
    $data['fungicide_greater_70'] = $this->getPesticideRows(2, $data['sowing_transplanting_date'], 70, 1) > 0;
    $data['molluscicide_greater_30'] = $this->getPesticideRows(3, $data['sowing_transplanting_date'], 30, 1) > 0;
    $data['rodenticide_greater_70'] = $this->getPesticideRows(4, $data['sowing_transplanting_date'], 70, 1) > 0;

    $data['timely_threshing'] = $this->getDateDifference(
      $data['threshing_date'], $data['harvesting_date']);
    $data['irrigation_total'] = $this->getIrrigationCount();

    return $data;
  }

  public function getNitrogenRecommendations($data) {
    $return = array();

    $result = DB::queryMaster('
      SELECT sfa.id
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application sf ON sf.household_survey_id = sl.id
        INNER JOIN household_survey_fertilizer_application_info sfa ON sfa.household_survey_fertilizer_application_id = sf.id
      WHERE f.id = %f AND fs.id = %f AND
        DATEDIFF(sfa.date, "%s") > (%d - 60) AND n != 0', array(
        $this->farmerId,
        $this->farmerSeasonId,
        $data['sowing_transplanting_date'],
        $data['crop_growing_duration'],
      ));

    if ($result->numRows() > 0) {
      $return['apply_before'] = (float) $data['crop_growing_duration'] - 60;
      $returnData = true;
    }

    $result = DB::queryMaster('
      SELECT sfa.id
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application sf ON sf.household_survey_id = sl.id
        INNER JOIN household_survey_fertilizer_application_info sfa ON sfa.household_survey_fertilizer_application_id = sf.id
      WHERE f.id = %f AND fs.id = %f AND n != 0', array(
        $this->farmerId,
        $this->farmerSeasonId,
        $data['sowing_transplanting_date'],
        $data['crop_growing_duration'],
      ));

    if ($result->numRows() <= 3) {
      $return['splits'] = true;
      $returnData = true;
    }

    $result = DB::queryMaster('
      SELECT SUM(IFNULL(sfa.amount, 0)) as sum_amount
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_fertilizer_application sf ON sf.household_survey_id = sl.id
        INNER JOIN household_survey_fertilizer_application_info sfa ON sfa.household_survey_fertilizer_application_id = sf.id
      WHERE f.id = %f AND fs.id = %f AND n != 0', array(
        $this->farmerId,
        $this->farmerSeasonId,
        $data['sowing_transplanting_date'],
        $data['crop_growing_duration'],
      ));

    if ($result->numRows() > 0) {
      $result = $result->fetchFirstRow();
      if ($result['sum_amount'] > 40 && $data['crop_growing_duration'] < 5) {
        $return['high_amount'];
        $returnData = true;
      }
    }

    if ($returnData) {
      return $return;
    }

    return false;
  }

  public function getWeedingInfestation() {
    $result = DB::queryMaster('
      SELECT SUM(IFNULL(wh.weeding_male_labor, 0)) + SUM(IFNULL(wh.weeding_female_labor, 0)) as infestation_count
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_weeding_herbicide wh ON wh.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    if ($result->numRows() <= 0) {
      return false;
    }

    $result = $result->fetchFirstRow();

    return $result['infestation_count'] >= 40;
  }

  public function getHerbicideApplication() {
    $result = DB::queryMaster('
      SELECT SUM(IFNULL(wh.herbicide_count, 0)) as herbicide_application_count
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_weeding_herbicide wh ON wh.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    if ($result->numRows() <= 0) {
      return false;
    }

    $result = $result->fetchFirstRow();

    return $result['herbicide_application_count'] >= 4;
  }

  public function getWeedControlInefficiency() {
    $result = DB::queryMaster('
      SELECT SUM(IFNULL(wh.herbicide_male_labor, 0)) + SUM(IFNULL(wh.herbicide_female_labor, 0)) as inefficiency_count, SUM(IFNULL(wh.herbicide_count, 0)) as inefficiency_application_count
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_weeding_herbicide wh ON wh.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    if ($result->numRows() <= 0) {
      return false;
    }

    $result = $result->fetchFirstRow();

    return $result['inefficiency_count'] > 30 && $result['inefficiency_application_count'] > 3;
  }

  public function getWeedingControl() {
    $result = DB::queryMaster('
      SELECT DISTINCT(wh.control_weed) as control
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_weeding_herbicide wh ON wh.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f ORDER BY control_weed DESC', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    if ($result->numRows() <= 0) {
      return false;
    }

    $result = $result->fetch();

    $found = array();
    foreach ($result as $value) {
      if ($value['control'] == 3) {
        return 3;
      }

      if ($value['control'] == 2) {
        $found[] = 2;
        continue;
      }

      if ($value['control'] == 1) {
        $found[] = 1;
      }
    }

    if (count($found) >= 2) {
      return 3;
    }

    if ($found[0] == 2) {
      return 2;
    }

    return 1;
  }

  public function getHerbicideApplicationDate($date) {
    $result = DB::queryMaster('
      SELECT *
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_weeding_herbicide wh ON wh.household_survey_id = sl.id
        INNER JOIN household_survey_weeding_herbicide_application wha
          ON wha.household_survey_weeding_herbicide_id = wh.id
      WHERE f.id = %d AND fs.id = %d AND DATEDIFF(wha.date, "%s") > 40', array(
        $this->farmerId,
        $this->farmerSeasonId,
        $date,
      ));

    return $result->numRows() > 0;
  }

  public function getFoodSafety() {
    $result = DB::queryMaster('
      SELECT sls.*
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_food_safety sls ON sls.household_survey_id = sl.id
      WHERE f.id = %f AND fs.id = %f', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  public function getIrrigationCount() {
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

    return $result->numRows();
  }

  public function getPrePlantingInformation() {
    $result = DB::queryMaster('
      SELECT pp.*
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pre_planting_information pp ON pp.household_survey_id = sl.id
      WHERE f.id = %d AND fs.id = %d', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  public function getGrainYield() {
    $result = DB::queryMaster('
      SELECT pp.*
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_grain_and_straw_yield pp ON pp.household_survey_id = sl.id
      WHERE f.id = %d AND fs.id = %d', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    return $result->fetchFirstRow();
  }

  public function getPesticideRows($brand, $date, $days, $operator) {
    if ($operator === 1) {
      $sql = ' SELECT *
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pesticide_application sa ON sa.household_survey_id = sl.id
        INNER JOIN household_survey_pesticide_rice_problems_detail ss ON ss.household_survey_pesticide_application_id = sa.id
      WHERE f.id = %d AND
        fs.id = %d AND
        DATEDIFF(ss.applied_date, "%s") > %d AND
        brand_applied = %d';
    } else {
      $sql = ' SELECT *
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN household_survey sl ON sl.farmers_id = f.id AND
          sl.farmer_seasons_id = fs.id
        INNER JOIN household_survey_pesticide_application sa ON sa.household_survey_id = sl.id
        INNER JOIN household_survey_pesticide_rice_problems_detail ss ON ss.household_survey_pesticide_application_id = sa.id
      WHERE f.id = %d AND
        fs.id = %d AND
        DATEDIFF(ss.applied_date, "%s") < %d AND
        brand_applied = %d';
    }

    $result = DB::queryMaster($sql, array(
        $this->farmerId,
        $this->farmerSeasonId,
        $date,
        $days,
        $brand
      ));

    return $result->numRows();
  }

  protected function getDateDifference($sDate, $nDate) {
    $dStart = new DateTime($sDate);
    $dEnd  = new DateTime($nDate);
    $dDiff = $dStart->diff($dEnd);
    return (int) $dDiff->format('%a');
  }

  /*protected function calculatePercentileRank() {
    $sql = '
      SELECT
        c.id, c.score, ROUND(((@rank - rank) / @rank) * 100, 2) AS percentile_rank
      FROM
      (
        SELECT *, @prev:=@curr, @curr:=a.score, @rank:=IF(@prev = @curr, @rank, @rank + 1) AS rank
        FROM
          (SELECT id, score FROM mytable) AS a,
          (SELECT @curr:= null, @prev:= null, @rank:= 0) AS b
        ORDER BY score DESC
      ) AS c';
  }*/

  public function getGrainYieldRecommendation($grainYield) {
    $farmerInfo = $this->getFarmerInfo();

    if (!$farmerInfo) {
      return false;
    }

    $data = array(
      'rank' => $this->getRank($farmerInfo, 'grain_yield'),
      'aveSDV' => $this->getAverageAndStandardDeviation($farmerInfo, 'grain_yield', $grainYield)
    );

    return $data;
  }

  public function getNetProfitRecommendation($netProfit) {
    $farmerInfo = $this->getFarmerInfo();

    if (!$farmerInfo) {
      return false;
    }

    $data = array(
      'rank' => $this->getRank($farmerInfo, 'net_profit'),
      'aveSDV' => $this->getAverageAndStandardDeviation($farmerInfo, 'net_profit', $netProfit)
    );

    return $data;
  }

  protected function getFarmerInfo() {
    $result = DB::queryMaster('
      SELECT f.id, fs.id, f.countries_id, fs.year, fs.seasons_id
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
      WHERE f.id = %d AND fs.id = %d', array(
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    if ($result->numRows() <= 0) {
      return false;
    }

    return $result->fetchFirstRow();
  }

  protected function getRecordCount($farmerInfo) {
    $result = DB::queryMaster('
      SELECT COUNT(f.id) as cnt
        FROM farmers f
          INNER JOIN farmer_seasons fs ON f.id = fs.farmers_id
          INNER JOIN household_survey_computations sc ON f.id = sc.farmers_id
            AND sc.farmer_seasons_id = fs.id
        WHERE f.countries_id = %d AND fs.year = %d AND fs.seasons_id = %d', array(
          $farmerInfo['countries_id'],
          $farmerInfo['year'],
          $farmerInfo['seasons_id'],
      ));

    $result = $result->fetchFirstRow();
    return $result['cnt'];
  }

  protected function getRecordMax($farmerInfo, $fieldName) {
    $result = DB::queryMaster('
      SELECT MAX(%s) as cnt
        FROM farmers f
          INNER JOIN farmer_seasons fs ON f.id = fs.farmers_id
          INNER JOIN household_survey_computations sc ON f.id = sc.farmers_id
            AND sc.farmer_seasons_id = fs.id
        WHERE f.countries_id = %d AND fs.year = %d AND fs.seasons_id = %d', array(
          $fieldName,
          $farmerInfo['countries_id'],
          $farmerInfo['year'],
          $farmerInfo['seasons_id'],
      ));

    $result = $result->fetchFirstRow();
    return $result['cnt'];
  }

  protected function getRank($farmerInfo, $fieldName) {
    $result = DB::queryMaster('
      SELECT *
      FROM
        (SELECT *,
          @curRank := IF(@prevRank = %s, @curRank, @incRank) AS rank,
          @incRank := @incRank + 1,
          @prevRank := %s
          FROM (
            SELECT sc.%s, sc.farmers_id, sc.farmer_seasons_id
              FROM farmers f
                INNER JOIN farmer_seasons fs ON f.id = fs.farmers_id
                INNER JOIN household_survey_computations sc ON f.id = sc.farmers_id
                  AND sc.farmer_seasons_id = fs.id
              WHERE f.countries_id = %d AND fs.year = %d AND fs.seasons_id = %d
            ) a,
          (SELECT @curRank :=0, @prevRank := NULL, @incRank := 1) result
          ORDER BY %s
        ) s
      WHERE farmers_id = %d AND farmer_seasons_id = %d', array(
        $fieldName,
        $fieldName,
        $fieldName,
        $farmerInfo['countries_id'],
        $farmerInfo['year'],
        $farmerInfo['seasons_id'],
        $fieldName,
        $this->farmerId,
        $this->farmerSeasonId,
      ));

    if ($result->numRows() <= 0) {
      return false;
    }

    $result = $result->fetchFirstRow();
    $data = array(
      'rank' => $result['rank'],
      'total' => $this->getRecordCount($farmerInfo),
      'max' => $this->getRecordMax($farmerInfo, $fieldName),
    );

    return $data;
  }

  protected function getAverageAndStandardDeviation($farmerInfo, $fieldName, $compare) {
    $result = DB::queryMaster('
      SELECT IFNULL(avg(%s),0) as average, IFNULL(stddev(%s),0) as standard_deviation
        FROM (
          SELECT %s, @counter := @counter +1 AS counter
          FROM
            (SELECT @counter:=0) AS initvar,
            (SELECT sc.%s
              FROM farmers f
                INNER JOIN farmer_seasons fs ON f.id = fs.farmers_id
                INNER JOIN household_survey_computations sc ON f.id = sc.farmers_id
                  AND sc.farmer_seasons_id = fs.id
              WHERE f.countries_id = %d AND fs.year = %d AND fs.seasons_id = %d) as sa
          ORDER BY %s DESC
        ) AS X
      WHERE counter <= (10/100 * @counter)
      ORDER BY %s DESC', array(
        $fieldName,
        $fieldName,
        $fieldName,
        $fieldName,
        $farmerInfo['countries_id'],
        $farmerInfo['year'],
        $farmerInfo['seasons_id'],
        $fieldName,
        $fieldName,
      ));

    if ($result->numRows() <= 0) {
      return false;
    }

    $data = $result->fetchFirstRow();
    /*var_dump($data);

    if (!$data['average'] && !$data['standard_deviation']) {
      return false;
    }*/

    /*if ($compare > $data['average']) {
      return false;
    }*/

    $data['average'] = round($data['average'], 3);
    $data['standard_deviation'] = round($data['standard_deviation'], 3);

    return $data;
  }

}
