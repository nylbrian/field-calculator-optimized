<?php

class GraphicsDAO {
  private $whereCommon;
  private $yValues;
  private $yLabels;
  private $plotData;
  private $ySelect;

  public function generate($data) {
    $return = array();

    if (!isset($data['category_name'])) {
      throw new GraphicsDAOException('Category name is required.');
    }

    if (!isset($data['graphType'])) {
      throw new GraphicsDAOException('Graph type is required.');
    }

    if (!$this->setYValues($data)) {
      throw new GraphicsDAOException('Sustainability indicator is required');
    }

    if (!$this->setWhereCommonQuery($data)) {
      throw new GraphicsDAOException('At least one category comparison is required.');
    }

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

    return array(
      'category' => $data['category_name'],
      'type' => $data['graphType'],
      'data' => $return,
      'labels' => array(
        'x' => $this->xValues,
        'y' => $this->yValues
      )
    );
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

    if (isset($data['country'])) {
      $where[] = vsprintf('c.id = %d', $data['country']);
    }

    if (isset($data['season'])) {
      $where[] = vsprintf('fs.seasons_id = %d', $data['season']);
    }

    if (isset($data['year'])) {
      $where[] = vsprintf('fs.year = %d', $data['year']);
    }

    if (count($where) <= 0) {
      return false;
    }

    $this->whereCommon = ' WHERE ' . implode(' AND ', $where) . ' ';
    return true;
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
          $this->ySelect[] = ' sc.total_score_pesticide_application ';
        break;
        case 'pesticideScore':
          $this->ySelect[] = ' sc.pesticide_use_efficiency_score ';
        break;
        case 'greenhouseGas':
          $this->ySelect[] = ' sc.methane_emission ';
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
        SELECT AVG(%s) as average
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

  protected function getCropEstablishmentMethod($data) {
    $this->xValues = array(1, 2);

    $actual = array();
    $sum = array();
    foreach ($this->xValues as $index => $xValue) {
      $rowData = array();

      foreach ($this->ySelect as $index2 => $yValue) {
        $rowData[] = $this->getCropEstablishmentMethodCount($yValue, $xValue);
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

    return array(
      'actual' => $actual,
      'scaled' => $scaled
    );
  }

  protected function getCropEstablishmentMethodCount($field, $xValue) {
    $sql = $this->getCommonQuery($field);
    $sql .= '
      INNER JOIN season_long sl ON sl.farmers_id = f.id AND
        sl.farmer_seasons_id = fs.id
      INNER JOIN season_long_land_preparation lp ON lp.season_long_id = sl.id
        AND lp.crop_establishment = %d' .
      $this->whereCommon;
    $return = DB::querySlave($sql, array($xValue));

    if ($return->numRows() <= 0) {
      return 0;
    }

    $return = $return->fetchFirstRow();
    return $return['average'];
  }

  protected function getTreatment($data) {
    $this->xValues = $this->getTreatmentNames();

    $actual = array();
    $sum = array();
    foreach ($this->xValues as $index => $xValue) {
      $rowData = array();

      foreach ($this->ySelect as $index2 => $yValue) {
        $rowData[] = $this->getTreatmentCount($yValue, $xValue);
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

    return array(
      'actual' => $actual,
      'scaled' => $scaled
    );
  }

  protected function getTreatmentCount($field, $xValue) {
    $sql = $this->getCommonQuery($field);
    $sql .= '
      INNER JOIN season_long sl ON sl.farmers_id = f.id AND
        sl.farmer_seasons_id = fs.id
      INNER JOIN season_long_pre_planting_information slp ON slp.season_long_id = sl.id
        AND (slp.treatment_name = "%s" OR slp.treatment_name_other = "%s")' .
      $this->whereCommon;
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
      INNER JOIN season_long_pre_planting_information slp ON slp.season_long_id = sl.id' .
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

    $sum = array();
    $top = array();
    foreach ($this->ySelect as $key => $value) {
      $top[] = $this->getYieldGapTop10Percent($value);
      $sum[$key] = $sum[$key] + $top[$key];
    }

    $middle = array();
    foreach ($this->ySelect as $key => $value) {
      $middle[] = $this->getYieldGapMiddle80Percent($value);
      $sum[$key] = $sum[$key] + $middle[$key];
    }

    $bottom = array();
    foreach ($this->ySelect as $key => $value) {
      $bottom[] = $this->getYieldGapBottom10Percent($value);
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

    return array(
      'actual' => array($top, $middle, $bottom),
      'scaled' => array($topScale, $middleScale, $bottomScale)
    );
  }

  protected function getYieldGapTop10Percent($field) {
    $count = DB::querySlave('%s', array(
      $this->getCommonQuery('0.1 * COUNT(*) as cnt', false)
    ));
    $count = $count->fetchFirstRow();

    $sql = '
      %s
      INNER JOIN (
        %s %s ORDER BY %s DESC LIMIT %d, %d
      ) a ON a.id = f.id';
    $vars = array(
      $this->getCommonQuery($field),
      $this->getCommonQuery('f.id', false),
      $this->where,
      $field,
      0,
      round($count['cnt'])
    );

    $result = DB::querySlave($sql, $vars);

    if ($result->numRows() <= 0) {
      return 0;
    }

    $result = $result->fetchFirstRow();
    return (float) round($result['average'], 2);
  }

  protected function getYieldGapBottom10Percent($field) {
    $count = DB::querySlave('%s', array(
      $this->getCommonQuery('0.1 * COUNT(*) as cnt', false)
    ));
    $count = $count->fetchFirstRow();

    $sql = '
      %s
      INNER JOIN (
        %s %s ORDER BY %s ASC LIMIT %d, %d
      ) a ON a.id = f.id';
    $vars = array(
      $this->getCommonQuery($field),
      $this->getCommonQuery('f.id', false),
      $this->where,
      $field,
      0,
      round($count['cnt'])
    );

    $result = DB::querySlave($sql, $vars);

    if ($result->numRows() <= 0) {
      return 0;
    }

    $result = $result->fetchFirstRow();
    return (float) round($result['average'], 2);
  }

  protected function getYieldGapMiddle80Percent($field) {
    $count = DB::querySlave('%s', array(
      $this->getCommonQuery('COUNT(*) as cnt', false)
    ));
    $count = $count->fetchFirstRow();

    $sql = '
      %s
      INNER JOIN (
        %s %s ORDER BY %s ASC LIMIT %d, %d
      ) a ON a.id = f.id';
    $vars = array(
      $this->getCommonQuery($field),
      $this->getCommonQuery('f.id', false),
      $this->where,
      $field,
      round(0.2 * $count['cnt']) - 1,
      round(0.8 * $count['cnt'])
    );

    $result = DB::querySlave($sql, $vars);

    if ($result->numRows() <= 0) {
      return 0;
    }

    $result = $result->fetchFirstRow();
    return (float) round($result['average'], 2);
  }
}
