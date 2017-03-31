<?php

class HouseholdSurveyData {

  public function get($farmerId, $farmerSeasonsId) {

    $result = DB::querySlave('
      SELECT s.id
      FROM household_survey s
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
        $prePlanting = new HouseholdSurveyPrePlantingDAO();
        echo '<td><pre>' . print_r($prePlanting->get($value['id']), true) . '</pre></td></tr>';

        echo '<tr><td class="center">Land Preparation</td>';
        $landPreparation = new HouseholdSurveyLandPreparationDAO();
        echo '<td><pre>' . print_r($landPreparation->get($value['id']), true) . '</pre></td></tr>';

        echo '<tr><td class="center">Sowing Transplanting</td>';
        $sowingTransplanting = new HouseholdSurveySowingTransplantingDAO();
        echo '<td><pre>' . print_r($sowingTransplanting->get($value['id']), true) . '</pre></td></tr>';

        echo '<tr><td class="center">Irrigation</td>';
        $irrigation = new HouseholdSurveyIrrigationDAO();
        echo '<td><pre>' . print_r($irrigation->get($value['id']), true) . '</pre></td></tr>';

        echo '<tr><td class="center">Fertilizer Application</td>';
        $fertilizerApplication = new HouseholdSurveyFertilizerApplicationDAO();
        echo '<td><pre>' . print_r($fertilizerApplication->get($value['id']), true) . '</pre></td></tr>';
      } else if ($key > 0 && $key < 6) {

        echo '<tr><td class="center" rowspan="5">' . ($key + 1) . '</td></tr>';

        echo '<tr><td class="center">Irrigation</td>';
        $irrigation = new HouseholdSurveyIrrigationDAO();
        echo '<td><pre>' . print_r($irrigation->get($value['id']), true) . '</pre></td></tr>';

        echo '<tr><td class="center">Fertilizer Application</td>';
        $fertilizerApplication = new HouseholdSurveyFertilizerApplicationDAO();
        echo '<td><pre>' . print_r($fertilizerApplication->get($value['id']), true) . '</pre></td></tr>';

        echo '<tr><td class="center">Weeding Herbicide Application</td>';
        $weedingHerbicideApplication = new HouseholdSurveyWeedingHerbicideDAO();
        echo '<td><pre>' . print_r($weedingHerbicideApplication->get($value['id']), true) . '</pre></td></tr>';

        echo '<tr><td class="center">Pesticide Application</td>';
        $pesticideApplication = new HouseholdSurveyPesticideApplicationDAO();
        echo '<td><pre>' . print_r($pesticideApplication->get($value['id']), true) . '</pre></td></tr>';
      } else if ($key > 5) {

        $lastForm = DB::querySlave('
          SELECT id FROM household_survey_food_safety WHERE household_survey_id = %d
        ', array($value['id']));

        if ($lastForm->numRows() > 0) {
          echo '<tr><td class="center" rowspan="6">' . ($key + 1) . '</td></tr>';

          echo '<tr><td class="center">Food Safety</td>';
          $foodSafety = new HouseholdSurveyFoodAndSafetyDAO();
          echo '<td><pre>' . print_r($foodSafety->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Workers Health and Safety</td>';
          $workerHealthSafety = new HouseholdSurveyWorkersHealthSafetyDAO();
          echo '<td><pre>' . print_r($workerHealthSafety->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Child Labor</td>';
          $childLabor = new HouseholdSurveyChildLaborDAO();
          echo '<td><pre>' . print_r($childLabor->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Women Empowerment</td>';
          $womenEmpowerment = new HouseholdSurveyWomenEmpowermentDAO();
          echo '<td><pre>' . print_r($womenEmpowerment->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Food Security</td>';
          $foodSecurity = new HouseholdSurveyFoodSecurityDAO();
          echo '<td><pre>' . print_r($foodSecurity->get($value['id']), true) . '</pre></td></tr>';
        } else {
          echo '<tr><td class="center" rowspan="8">' . ($key + 1) . '</td></tr>';

          echo '<tr><td class="center">Irrigation</td>';
          $irrigation = new HouseholdSurveyIrrigationDAO();
          echo '<td><pre>' . print_r($irrigation->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Fertilizer Application</td>';
          $fertilizerApplication = new HouseholdSurveyFertilizerApplicationDAO();
          echo '<td><pre>' . print_r($fertilizerApplication->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Weeding Herbicide Application</td>';
          $weedingHerbicideApplication = new HouseholdSurveyWeedingHerbicideDAO();
          echo '<td><pre>' . print_r($weedingHerbicideApplication->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Pesticide Application</td>';
          $pesticideApplication = new HouseholdSurveyPesticideApplicationDAO();
          echo '<td><pre>' . print_r($pesticideApplication->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Harvesting Threshing</td>';
          $harvestingAndThreshing = new HouseholdSurveyHarvestingAndThreshingDAO();
          echo '<td><pre>' . print_r($harvestingAndThreshing->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Cleaning Drying</td>';
          $cleaningAndDrying = new HouseholdSurveyCleaningAndDryingDAO();
          echo '<td><pre>' . print_r($cleaningAndDrying->get($value['id']), true) . '</pre></td></tr>';

          echo '<tr><td class="center">Grain And Straw Yield</td>';
          $grainAndStrawYield = new HouseholdSurveyGrainAndStrawYieldDAO();
          echo '<td><pre>' . print_r($grainAndStrawYield->get($value['id']), true) . '</pre></td></tr>';
        }

      }

    }

    echo '</table>';

    die();
  }

}
