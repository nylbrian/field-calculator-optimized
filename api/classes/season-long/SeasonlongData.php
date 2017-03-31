<?php

class SeasonlongData {

  public function get($farmerId, $farmerSeasonsId) {

    $result = DB::querySlave('
      SELECT s.id
      FROM season_long s
      WHERE farmers_id = %d AND
        farmer_seasons_id = %d
      ORDER BY id ASC
    ', array($farmerId, $farmerSeasonsId));

    $period = $result->numRows();

    echo '<h1>Saved Data</h1>';
    echo '<p>Number of period answered: ' . $period . '</p>';

    $rows = $result->fetch();

    if ($period <=0 ) {
      return;
    }

    echo '<style>
        table {
          border-collapse: collapse;
          width: 100%;
        }

        table td, table th {
          border: 1px solid #000;
          padding: 10px;
          vertical-align: top;
        }

        .center {
          text-align: center;
        }
      </style>';

    echo '<table>';
    echo '<tr>
      <th width="100px">Period #</th>
      <th width="300px">Form Name</th>
      <th>Values</th>
    </tr>';
    foreach ($rows as $key => $value) {

      if ($key === 0) {
        echo '<tr><td class="center" rowspan="6">' . ($key + 1) . '</td></tr>';

        echo '<tr><td class="center">Pre Planting Information</td>';
        $prePlanting = new SeasonlongPrePlantingDAO();
        echo '<td><pre>' . print_r($prePlanting->get($value['id']), true) . '</pre></td></tr>';

        echo '<tr><td class="center">Land Preparation</td>';
        $landPreparation = new SeasonlongLandPreparationDAO();
        echo '<td><pre>' . print_r($landPreparation->get($value['id']), true) . '</pre></td></tr>';

        echo '<tr><td class="center">Sowing Transplanting</td>';
        $sowingTransplanting = new SeasonlongSowingTransplantingDAO();
        echo '<td><pre>' . print_r($sowingTransplanting->get($value['id']), true) . '</pre></td></tr>';

        echo '<tr><td class="center">Irrigation</td>';
        $irrigation = new SeasonlongIrrigationDAO();
        echo '<td><pre>' . print_r($irrigation->get($value['id']), true) . '</pre></td></tr>';

        echo '<tr><td class="center">Fertilizer Application</td>';
        $fertilizerApplication = new SeasonlongFertilizerApplicationDAO();
        echo '<td><pre>' . print_r($fertilizerApplication->get($value['id']), true) . '</pre></td></tr>';
      } else if ($key > 0 && $key < 6) {

        echo '<tr><td class="center" rowspan="5">' . ($key + 1) . '</td></tr>';

        echo '<tr><td class="center">Irrigation</td>';
        $irrigation = new SeasonlongIrrigationDAO();
        echo '<td><pre>' . print_r($irrigation->get($value['id']), true) . '</pre></td></tr>';

        echo '<tr><td class="center">Fertilizer Application</td>';
        $fertilizerApplication = new SeasonlongFertilizerApplicationDAO();
        echo '<td><pre>' . print_r($fertilizerApplication->get($value['id']), true) . '</pre></td></tr>';

        echo '<tr><td class="center">Weeding Herbicide Application</td>';
        $weedingHerbicideApplication = new SeasonlongWeedingHerbicideDAO();
        echo '<td><pre>' . print_r($weedingHerbicideApplication->get($value['id']), true) . '</pre></td></tr>';

        echo '<tr><td class="center">Pesticide Application</td>';
        $pesticideApplication = new SeasonlongPesticideApplicationDAO();
        echo '<td><pre>' . print_r($pesticideApplication->get($value['id']), true) . '</pre></td></tr>';
      } else if ($key > 5) {

        $lastForm = DB::querySlave('
          SELECT id FROM season_long_food_safety WHERE season_long_id = %d
        ', array($value['id']));

        if ($lastForm->numRows() > 0) {
          echo '<tr><td class="center" rowspan="6">' . ($key + 1) . '</td></tr>';

          echo '<tr><td class="center">Food Safety</td>';
          $foodSafety = new SeasonlongFoodAndSafetyDAO();
          echo '<td><pre>' . print_r($foodSafety->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Workers Health and Safety</td>';
          $workerHealthSafety = new SeasonlongWorkersHealthSafetyDAO();
          echo '<td><pre>' . print_r($workerHealthSafety->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Child Labor</td>';
          $childLabor = new SeasonlongChildLaborDAO();
          echo '<td><pre>' . print_r($childLabor->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Women Empowerment</td>';
          $womenEmpowerment = new SeasonlongWomenEmpowermentDAO();
          echo '<td><pre>' . print_r($womenEmpowerment->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Food Security</td>';
          $foodSecurity = new SeasonlongFoodSecurityDAO();
          echo '<td><pre>' . print_r($foodSecurity->get($value['id']), true) . '</pre></td></tr>';
        } else {
          echo '<tr><td class="center" rowspan="8">' . ($key + 1) . '</td></tr>';

          echo '<tr><td class="center">Irrigation</td>';
          $irrigation = new SeasonlongIrrigationDAO();
          echo '<td><pre>' . print_r($irrigation->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Fertilizer Application</td>';
          $fertilizerApplication = new SeasonlongFertilizerApplicationDAO();
          echo '<td><pre>' . print_r($fertilizerApplication->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Weeding Herbicide Application</td>';
          $weedingHerbicideApplication = new SeasonlongWeedingHerbicideDAO();
          echo '<td><pre>' . print_r($weedingHerbicideApplication->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Pesticide Application</td>';
          $pesticideApplication = new SeasonlongPesticideApplicationDAO();
          echo '<td><pre>' . print_r($pesticideApplication->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Harvesting Threshing</td>';
          $harvestingAndThreshing = new SeasonlongHarvestingAndThreshingDAO();
          echo '<td><pre>' . print_r($harvestingAndThreshing->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Cleaning Drying</td>';
          $cleaningAndDrying = new SeasonlongCleaningAndDryingDAO();
          echo '<td><pre>' . print_r($cleaningAndDrying->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Grain And Straw Yield</td>';
          $grainAndStrawYield = new SeasonlongGrainAndStrawYieldDAO();
          echo '<td><pre>' . print_r($grainAndStrawYield->get($value['id']), true) . '</pre></td></tr>';
        }

      }

    }

    echo '</table>';

    die();
  }

}
