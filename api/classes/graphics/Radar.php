<?php

class Radar {

  public function generate($data) {
    $this->setYValues($data);
    $this->setWhereCommonQuery($data);
    $this->setYSelect();

    switch ((int) $data['category_name']) {
      case 1:
        $return = $this->getYieldGap($data);
      break;
      case 2:
        $return = $this->getTreatment($data);
      break;
      case 3:
        $return = $this->getCropEstablishmentMethod($data);
      break;
      default:
        throw new GraphicsDAOException('Category name is not supported');
    }

    return $return;
  }

  protected function setYSelect() {
    foreach ($this->yValues as $value) {
      switch ($value) {
        case 'netProfit':
          $this->ySelect[] = ' sc.net_profit ';
        break;
        case 'laborProductivity':
          $this->ySelect[] = ' sc.labor_productivity ';
        break;
        case 'grainYield':
          $this->ySelect[] = ' sc.grain_yield ';
        break;
        case 'waterUseEfficiency':
          $this->ySelect[] = ' sc.total_water_productivity_kg_grain ';
        break;
        case 'nitrogenUseEffiency':
          $this->ySelect[] = ' sc.nitrogen_use_efficiency ';
        break;
        case 'phosphorusUseEfficiency':
          $this->ySelect[] = ' sc.phosphorus_use_efficiency ';
        break;
        case 'pesticideUse':
          // $this->ySelect[] = ' sc.total_score_pesticide_application ';
          $this->ySelect[] = ' sc.pesticide_use_efficiency_score ';
        break;
        case 'pesticideScore':
          $this->ySelect[] = ' sc.pesticide_use_efficiency_score ';
        break;
        case 'greenhouseGas':
          //$this->ySelect[] = ' sc.methane_emission ';
          $this->ySelect[] = ' sc.co2_equivalent ';
        break;
        case 'workersHealthSafety':
          $this->ySelect[] = ' sc.worker_health_and_safety_score ';
        break;
        case 'childLabor':
          $this->ySelect[] = ' sc.child_labor_score ';
        break;
        case 'womenEmpowerment':
          $this->ySelect[] = ' sc.women_empowerment_score ';
        break;
        case 'seedRate':
          $this->ySelect[] = ' sc.seed_rate ';
        break;
        case 'nitrogenAmount':
          $this->ySelect[] = ' sc.nitrogen_amount ';
        break;
        case 'phosphorusAmount':
          $this->ySelect[] = ' sc.phosphorus_amount ';
        break;
        case 'potassiumAmount':
          $this->ySelect[] = ' sc.potassium_amount ';
        break;
        case 'nApplication':
          $this->ySelect[] = ' sc.nitrogen_count '; // to be updated
        break;
        case 'nIrrigation':
          $this->ySelect[] = ' sc.irrigation_applied_count ';
        break;
      }
    }
  }

  protected function getCommonQuery($field, $withAverage = true) {
    if ($withAverage) {
      return vsprintf('
        SELECT IFNULL(AVG(%s),0) as average
        FROM farmers f
          INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
          INNER JOIN countries c ON f.countries_id = c.id
          INNER JOIN season_long_computations sc ON fs.farmers_id = f.id
            AND sc.farmer_seasons_id = fs.id ', array($field));
    }

    return vsprintf('
      SELECT %s
      FROM farmers f
        INNER JOIN farmer_seasons fs ON fs.farmers_id = f.id
        INNER JOIN countries c ON f.countries_id = c.id
        INNER JOIN season_long_computations sc ON sc.farmers_id = f.id
          AND sc.farmer_seasons_id = fs.id ', array($field));
  }

  protected function setYValues($data) {
    if (!isset($data['yValues']) || !is_array($data['yValues']) || count($data['yValues']) <= 0) {
      return false;
    }

    $yValues = array();
    foreach ($data['yValues'] as $key => $value) {
      if ($value === true) {
        $yValues[] = $key;
      }
    }

    if (count($yValues) <= 0) {
      return false;
    }

    $this->yValues = $yValues;
    return true;
  }

  protected function setWhereCommonQuery($data) {
    $where = array();

    if (isset($data['season_ids']) && is_array($data['season_ids']) && count($data['season_ids']) > 0) {
      $where[] = vsprintf('fs.seasons_id IN (%s)', implode(',', $data['season_ids']));
    }

    if (isset($data['year_ids']) && is_array($data['year_ids']) && count($data['year_ids']) > 0) {
      $where[] = vsprintf('fs.year IN (%s)', implode(',', $data['year_ids']));
    }

    if (count($where) > 0) {
      $this->whereCommon = ' WHERE ' . implode(' AND ', $where) . ' ';
    } else {
      $this->whereCommon = ' WHERE true = true ';
    }

    return true;
  }

  protected function getCountryQuery($country) {
    if ($country > 0) {
      return vsprintf(' AND c.id = %d ', array($country));
    }

    return '';
  }


  protected function getCropEstablishmentMethod($data) {
    $countryData = array(0);
    if (isset($data['country_ids']) && is_array($data['country_ids']) && count($data['country_ids']) > 0) {
      $countryData = $data['country_ids'];
    }

    $this->xValues = array(1, 2);
    $returnData = array();

    foreach ($countryData as $country) {
      $actual = array();
      $sum = array();
      foreach ($this->xValues as $index => $xValue) {
        $rowData = array();

        foreach ($this->ySelect as $index2 => $yValue) {
          $rowData[] = $this->getCropEstablishmentMethodCount($yValue, $xValue, $country);
          $sum[$index2] = $sum[$index2] + $rowData[$index2];
        }

        $actual[] = $rowData;
      }

      $scaled = array();
      foreach ($actual as $index => $value) {
        $scaled[$index] = array();
        foreach ($value as $index2 => $value2) {
          if ($sum[$index2] <= 0) {
            $scaled[$index][$index2] = 0;
            continue;
          }
          $scaled[$index][$index2] = round($value2 / $sum[$index2], 2);
        }
      }

      $returnData[] = array(
        'country' => $country,
        'actual' => $actual,
        'scaled' => $scaled
      );
    }

    return array(
      'category' => $data['category_name'],
      'labels' => array(
        'x' => $this->xValues,
        'y' => $this->yValues
      ),
      'type' => $data['graphType'],
      'data' => $returnData,
    );
  }

  protected function getCropEstablishmentMethodCount($field, $xValue, $country) {
    $sql = $this->getCommonQuery($field);
    $sql .= '
      INNER JOIN season_long sl ON sl.farmers_id = f.id AND
        sl.farmer_seasons_id = fs.id
      INNER JOIN season_long_land_preparation lp ON lp.season_long_id = sl.id
        AND lp.crop_establishment = %d' .
      $this->whereCommon . $this->getCountryQuery($country);

    $return = DB::querySlave($sql, array($xValue));

    if ($return->numRows() <= 0) {
      return 0;
    }

    $return = $return->fetchFirstRow();
    return $return['average'];
  }

  protected function getTreatment($data) {
    $countryData = array(0);
    if (isset($data['country_ids']) && is_array($data['country_ids']) && count($data['country_ids']) > 0) {
      $countryData = $data['country_ids'];
    }
    $returnData = array();

    $this->xValues = $this->getTreatmentNames();

    foreach ($countryData as $country) {
      $actual = array();
      $sum = array();
      foreach ($this->xValues as $index => $xValue) {
        $rowData = array();

        foreach ($this->ySelect as $index2 => $yValue) {
          $rowData[] = $this->getTreatmentCount($yValue, $xValue, $country);
          $sum[$index2] = $sum[$index2] + $rowData[$index2];
        }

        $actual[] = $rowData;
      }

      $scaled = array();
      foreach ($actual as $index => $value) {
        $scaled[$index] = array();
        foreach ($value as $index2 => $value2) {
          if ($sum[$index2] <= 0) {
            $scaled[$index][$index2] = 0;
            continue;
          }
          $scaled[$index][$index2] = round($value2 / $sum[$index2], 2);
        }
      }
      $returnData[] = array(
        'country' => $country,
        'actual' => $actual,
        'scaled' => $scaled
      );
    }

    return array(
      'category' => $data['category_name'],
      'labels' => array(
        'x' => $this->xValues,
        'y' => $this->yValues
      ),
      'type' => $data['graphType'],
      'data' => $returnData,
    );
  }

  protected function getTreatmentCount($field, $xValue, $country) {
    $sql = $this->getCommonQuery($field);
    $sql .= '
      INNER JOIN season_long sl ON sl.farmers_id = f.id AND
        sl.farmer_seasons_id = fs.id
      INNER JOIN season_long_pre_planting_information slp ON slp.season_long_id = sl.id
        AND (slp.treatment_name = "%s" OR slp.treatment_name_other = "%s")' .
      $this->whereCommon . $this->getCountryQuery($country);
    $return = DB::querySlave($sql, array($xValue, $xValue));

    if ($return->numRows() <= 0) {
      return 0;
    }

    $return = $return->fetchFirstRow();
    return $return['average'];
  }

  protected function getTreatmentNames() {
    $sql = $this->getCommonQuery('
      DISTINCT IF(slp.treatment_name = "Other", slp.treatment_name_other, slp.treatment_name) as treatment
      ', false);
    $sql .= '
      INNER JOIN season_long sl ON sl.farmers_id = f.id AND
        sl.farmer_seasons_id = fs.id
      INNER JOIN season_long_pre_planting_information slp ON slp.season_long_id = sl.id
        AND slp.parcel_has_treatment = 1' .
      $this->whereCommon;

    $return = DB::querySlave($sql);

    if ($return->numRows() <= 0) {
      return array();
    }

    $data = $return->fetchArray();
    $return = array();

    foreach ($data as $value) {
      $return[] = $value['treatment'];
    }

    return $return;
  }

  protected function getYieldGap($data) {
    $this->xValues = array('top', 'middle', 'bottom');
    $countryData = array(0);

    if (isset($data['country_ids']) && is_array($data['country_ids']) && count($data['country_ids']) > 0) {
      $countryData = $data['country_ids'];
    }

    foreach ($countryData as $country) {
      $sum = array();
      $top = array();
      foreach ($this->ySelect as $key => $value) {
        $top[] = $this->getYieldGapTop10Percent($value, $country);
        $sum[$key] = $sum[$key] + $top[$key];
      }

      $middle = array();
      foreach ($this->ySelect as $key => $value) {
        $middle[] = $this->getYieldGapMiddle80Percent($value, $country);
        $sum[$key] = $sum[$key] + $middle[$key];
      }

      $bottom = array();
      foreach ($this->ySelect as $key => $value) {
        $bottom[] = $this->getYieldGapBottom10Percent($value, $country);
        $sum[$key] = $sum[$key] + $bottom[$key];
      }

      $topScale = array();
      $middleScale = array();
      $bottomScale = array();
      foreach ($sum as $key => $value) {
        if ($value === 0) {
          $topScale[$key] = 0;
          $middleScale[$key] = 0;
          $bottomScale[$key] = 0;
          continue;
        }
        $topScale[$key] = round($top[$key] / $value, 2);
        $middleScale[$key] = round($middle[$key] / $value, 2);
        $bottomScale[$key] = round($bottom[$key] / $value, 2);
      }

      $returnData[] = array(
        'country' => $country,
        'actual' => array($top, $middle, $bottom),
        'scaled' => array($topScale, $middleScale, $bottomScale),
      );
    }

    return array(
      'category' => $data['category_name'],
      'labels' => array(
        'x' => $this->xValues,
        'y' => $this->yValues
      ),
      'type' => $data['graphType'],
      'data' => $returnData,
    );
  }

  protected function getYieldGapTop10Percent($field, $country) {
    $count = DB::querySlave('%s %s', array(
      $this->getCommonQuery('0.1 * COUNT(*) as cnt', false),
      $this->getCountryQuery($country),
    ));
    $count = $count->fetchFirstRow();
    if ($count['cnt'] <= 0) {
      return 0;
    }
    $sql = '
      %s
      INNER JOIN (
        %s %s %s ORDER BY sc.grain_yield DESC LIMIT %d, %d
      ) a ON a.id = f.id';
    $vars = array(
      $this->getCommonQuery($field),
      $this->getCommonQuery('f.id', false),
      $this->whereCommon,
      $this->getCountryQuery($country),
      0,
      round($count['cnt'])
    );

    $result = DB::querySlave($sql, $vars);

    if ($result->numRows() <= 0) {
      return 0;
    }

    $result = $result->fetchFirstRow();
    return $result['average'];
  }

  protected function getYieldGapBottom10Percent($field, $country) {
    $count = DB::querySlave('%s %s', array(
      $this->getCommonQuery('0.1 * COUNT(*) as cnt', false),
      $this->getCountryQuery($country),
    ));
    $count = $count->fetchFirstRow();
    if ($count['cnt'] <= 0) {
      return 0;
    }
    $sql = '
      %s
      INNER JOIN (
        %s %s %s ORDER BY sc.grain_yield ASC LIMIT %d, %d
      ) a ON a.id = f.id';
    $vars = array(
      $this->getCommonQuery($field),
      $this->getCommonQuery('f.id', false),
      $this->whereCommon,
      $this->getCountryQuery($country),
      0,
      round($count['cnt'])
    );

    $result = DB::querySlave($sql, $vars);

    if ($result->numRows() <= 0) {
      return 0;
    }

    $result = $result->fetchFirstRow();
    return $result['average'];
  }

  protected function getYieldGapMiddle80Percent($field, $country) {
    $count = DB::querySlave('%s %s', array(
      $this->getCommonQuery('COUNT(*) as cnt', false),
      $this->getCountryQuery($country),
    ));

    $count = $count->fetchFirstRow();

    if ($count['cnt'] <= 0) {
      return 0;
    }

    $sql = '
      %s
      INNER JOIN (
        %s %s %s ORDER BY sc.grain_yield ASC LIMIT %d, %d
      ) a ON a.id = f.id';
    $vars = array(
      $this->getCommonQuery($field),
      $this->getCommonQuery('f.id', false),
      $this->whereCommon,
      $this->getCountryQuery($country),
      round(0.1 * $count['cnt']),
      round(0.8 * $count['cnt'])
    );

    $result = DB::querySlave($sql, $vars);

    if ($result->numRows() <= 0) {
      return 0;
    }

    $result = $result->fetchFirstRow();
    return $result['average'];
  }

}
