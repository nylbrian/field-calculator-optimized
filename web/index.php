<?php
  $production_env = false;
?>
<!DOCTYPE html>
<html ng-app="fieldCalculator" lang="en">
  <head>
    <title>Field Calculator</title>
    <meta name="viewport" content="width=device-width, user-scalable=no" id="viewportMeta" />
    <meta charset="UTF-8" />
    <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
    <?php if ($production_env) { ?>
      <link rel="stylesheet" href="build/css/bootstrap.min.css" />
      <link rel="stylesheet" href="build/css/bootstrap-theme.min.css" />
      <link rel="stylesheet" href="build/styles.min.css" />
      <link rel="stylesheet" href="build/font-awesome/css/font-awesome.min.css" />
      <script src="bower_components/ydn.db/jsc/ydn.db-dev.js"></script>
      <script src="bower_components/ydn.db/jsc/ydn.db-core-entity.js"></script>
      <script src="bower_components/angular-file-upload/dist/angular-file-upload.min.js" type="text/javascript"></script>
      <script src="build/scripts.min.js" type="text/javascript"></script>
    <?php } else { ?>
      <link rel="stylesheet" href="build/css/bootstrap.min.css" />
      <link rel="stylesheet" href="build/css/bootstrap-theme.min.css" />
      <link rel="stylesheet" href="build/font-awesome/css/font-awesome.min.css" />
      <link rel="stylesheet" href="bower_components/angular-bootstrap/ui-bootstrap-csp.css" />
      <link rel="stylesheet" href="assets/css/default.css" />
      <link rel="stylesheet" href="assets/css/login.css" />
      <link rel="stylesheet" href="assets/css/effects.css" />
      <link rel="stylesheet" href="assets/css/tables.css" />
      <link rel="stylesheet" href="assets/css/forms.css" />

      <link rel="stylesheet" media="print" href="build/css/bootstrap.min.css" />
      <link rel="stylesheet" media="print" href="build/css/bootstrap-theme.min.css" />
      <link rel="stylesheet" media="print" href="assets/css/tables.css" />
      <link rel="stylesheet" media="print" href="assets/css/print.css" />

      <!-- bower dependencies -->
      <script src="bower_components/angular/angular.js"></script>
      <script src="bower_components/angular-resource/angular-resource.js"></script>
      <script src="bower_components/angular-ui-router/release/angular-ui-router.js"></script>
      <script src="bower_components/angular-bootstrap/ui-bootstrap.js"></script>
      <script src="bower_components/angular-bootstrap/ui-bootstrap-tpls.js"></script>
      <script src="bower_components/angular-animate/angular-animate.js"></script>
      <script src="bower_components/angular-cookies/angular-cookies.js"></script>
      <script src="bower_components/ydn.db/jsc/ydn.db-dev.js"></script>
      <script src="bower_components/ydn.db/jsc/ydn.db-core-entity.js"></script>
      <script src="bower_components/angular-translate/angular-translate.js"></script>
      <script src="bower_components/angular-translate-loader-static-files/angular-translate-loader-static-files.js"></script>
      <script src="bower_components/angular-translate-storage-local/angular-translate-storage-local.js"></script>
      <script src="bower_components/angular-translate-storage-cookie/angular-translate-storage-cookie.js"></script>
      <script src="bower_components/chart/dist/Chart.js"></script>
      <script src="bower_components/offline/offline.js"></script>
      <script src="bower_components/angular-chart/angular-chart.js"></script>
      <script src="bower_components/angular-breadcrumb/angular-breadcrumb.js"></script>
      <script src="bower_components/angular-scroll/angular-scroll.js"></script>
      <script src="bower_components/angular-bootstrap-multiselect/angular-bootstrap-multiselect.js"></script>
      <script src="bower_components/angular-file-upload/dist/angular-file-upload.min.js" type="text/javascript"></script>
      <script src="bower_components/angular-messages/angular-messages.js"></script>
      <script src="bower_components/angular-ui-router.stateHelper/statehelper.js"></script>

      <script src="app/app.js"></script>

      <!-- custom script -->
      <script src="app/db/db.js"></script>
      <script src="app/db/dbHelper.js"></script>
      <script src="app/db/Rest.js"></script>
      <script src="app/db/RestService.js"></script>

      <script src="app/db.js"></script>
      <script src="app/routes.js"></script>

      <!-- services -->
      <script src="app/services/Common.js"></script>
      <script src="app/services/Countries.js"></script>
      <script src="app/services/DropdownValues.js"></script>
      <script src="app/services/Farmers.js"></script>
      <script src="app/services/Seasonlong.js"></script>
      <script src="app/services/HouseholdSurvey.js"></script>
      <script src="app/services/SeasonlongSuggestion.js"></script>
      <script src="app/services/HouseholdSuggestion.js"></script>
      <script src="app/services/Seasons.js"></script>
      <script src="app/services/Users.js"></script>
      <script src="app/services/TreatmentNames.js"></script>
      <script src="app/services/Download.js"></script>
      <script src="app/services/Graphics.js"></script>
      <script src="app/services/GraphicsHousehold.js"></script>
      <script src="app/services/DataFilters.js"></script>
      <script src="app/services/Authentication.js"></script>

      <!-- factories -->
      <script src="app/factories/SyncInterceptor.js"></script>
      <script src="app/factories/RedirectInterceptor.js"></script>
      <script src="app/factories/season-long/SeasonlongGeneralInformation.js"></script>
      <script src="app/factories/season-long/SeasonLongPrePlanting.js"></script>
      <script src="app/factories/season-long/SeasonlongLandPreparation.js"></script>
      <script src="app/factories/season-long/SeasonlongSowingTransplanting.js"></script>
      <script src="app/factories/season-long/SeasonlongIrrigation.js"></script>
      <script src="app/factories/season-long/SeasonlongFertilizerApplication.js"></script>
      <script src="app/factories/season-long/SeasonlongWeedingHerbicideApplication.js"></script>
      <script src="app/factories/season-long/SeasonlongPesticideApplication.js"></script>
      <script src="app/factories/season-long/SeasonlongHarvestingAndThreshing.js"></script>
      <script src="app/factories/season-long/SeasonlongCleaningAndDrying.js"></script>
      <script src="app/factories/season-long/SeasonlongGrainAndStrawYield.js"></script>
      <script src="app/factories/season-long/SeasonlongFoodSafety.js"></script>
      <script src="app/factories/season-long/SeasonlongWorkerHealthSafety.js"></script>
      <script src="app/factories/season-long/SeasonlongChildLabor.js"></script>
      <script src="app/factories/season-long/SeasonlongWomenEmpowerment.js"></script>
      <script src="app/factories/season-long/SeasonlongFoodSecurity.js"></script>
      <script src="app/factories/season-long/SeasonlongPesticideUseEfficiency.js"></script>

      <script src="app/factories/household-survey/HouseholdGeneralInformation.js"></script>
      <script src="app/factories/household-survey/HouseholdPrePlanting.js"></script>
      <script src="app/factories/household-survey/HouseholdLandPreparation.js"></script>
      <script src="app/factories/household-survey/HouseholdSowingTransplanting.js"></script>
      <script src="app/factories/household-survey/HouseholdIrrigation.js"></script>
      <script src="app/factories/household-survey/HouseholdFertilizerApplication.js"></script>
      <script src="app/factories/household-survey/HouseholdWeedingHerbicideApplication.js"></script>
      <script src="app/factories/household-survey/HouseholdPesticideApplication.js"></script>
      <script src="app/factories/household-survey/HouseholdHarvestingAndThreshing.js"></script>
      <script src="app/factories/household-survey/HouseholdCleaningAndDrying.js"></script>
      <script src="app/factories/household-survey/HouseholdGrainAndStrawYield.js"></script>
      <script src="app/factories/household-survey/HouseholdFoodSafety.js"></script>
      <script src="app/factories/household-survey/HouseholdWorkerHealthSafety.js"></script>
      <script src="app/factories/household-survey/HouseholdChildLabor.js"></script>
      <script src="app/factories/household-survey/HouseholdWomenEmpowerment.js"></script>
      <script src="app/factories/household-survey/HouseholdFoodSecurity.js"></script>
      <script src="app/factories/household-survey/HouseholdPesticideUseEfficiency.js"></script>

      <!-- controllers -->
      <script src="app/controllers/LoginCtrl.js"></script>
      <script src="app/controllers/RegisterCtrl.js"></script>
      <script src="app/controllers/MainCtrl.js"></script>
      <script src="app/controllers/DownloadCtrl.js"></script>
      <script src="app/controllers/DownloadHouseholdCtrl.js"></script>
      <script src="app/controllers/ImportFarmersOutputPage.js"></script>
      <script src="app/controllers/ImportFarmersOutputPageHousehold.js"></script>
      <script src="app/controllers/common/DropdownCtrl.js"></script>
      <script src="app/controllers/farmers/FarmerCtrl.js"></script>
      <script src="app/controllers/farmers/NewFarmerCtrl.js"></script>
      <script src="app/controllers/farmers/EditFarmerCtrl.js"></script>
      <script src="app/controllers/farmer-options/FarmerOptionsCtrl.js"></script>
      <script src="app/controllers/graphics/GraphicsCtrl.js"></script>
      <script src="app/controllers/graphics/GraphicsHouseholdCtrl.js"></script>
      <script src="app/controllers/questionnaires/SeasonlongCtrl.js"></script>
      <script src="app/controllers/questionnaires/HouseholdSurveyCtrl.js"></script>
      <script src="app/controllers/questionnaires/HouseholdSurveySavedCtrl.js"></script>
      <script src="app/controllers/seasons/SeasonsCtrl.js"></script>
      <script src="app/controllers/questionnaires/SeasonlongSavedCtrl.js"></script>
      <script src="app/controllers/questionnaires/AssessmentSuggestionCtrl.js"></script>
      <script src="app/controllers/questionnaires/HouseholdAssessmentSuggestionCtrl.js"></script>
      <script src="app/controllers/seasons/NewSeasonCtrl.js"></script>
      <script src="app/controllers/seasons/EditSeasonCtrl.js"></script>

      <!-- modal controllers -->
      <script src="app/controllers/modal/questionnaires/ModalSeasonlongCtrl.js"></script>
      <script src="app/controllers/modal/questionnaires/ModalHouseholdSurveyCtrl.js"></script>
      <script src="app/controllers/modal/farmers/ModalDeleteFarmerCtrl.js"></script>

      <!-- directives -->
      <script src="app/directives/common/affix.js"></script>
      <script src="app/directives/common/datepickerLocaldate.js"></script>
      <script src="app/directives/common/form-messages.js"></script>
      <script src="app/directives/questionnaires/seasonlong/general-information.js"></script>
      <script src="app/directives/questionnaires/seasonlong/pre-planting.js"></script>
      <script src="app/directives/questionnaires/seasonlong/land-preparation.js"></script>
      <script src="app/directives/questionnaires/seasonlong/sowing-transplanting.js"></script>
      <script src="app/directives/questionnaires/seasonlong/irrigation.js"></script>
      <script src="app/directives/questionnaires/seasonlong/fertilizer-application.js"></script>
      <script src="app/directives/questionnaires/seasonlong/weeding-and-herbicide-application.js"></script>
      <script src="app/directives/questionnaires/seasonlong/pesticide-application.js"></script>
      <script src="app/directives/questionnaires/seasonlong/harvesting-threshing.js"></script>
      <script src="app/directives/questionnaires/seasonlong/cleaning-drying.js"></script>
      <script src="app/directives/questionnaires/seasonlong/grain-and-straw-yield.js"></script>
      <script src="app/directives/questionnaires/seasonlong/food-safety.js"></script>
      <script src="app/directives/questionnaires/seasonlong/worker-health-safety.js"></script>
      <script src="app/directives/questionnaires/seasonlong/child-labor.js"></script>
      <script src="app/directives/questionnaires/seasonlong/women-empowerment.js"></script>
      <script src="app/directives/questionnaires/seasonlong/food-security.js"></script>
      <script src="app/directives/questionnaires/seasonlong/pesticide-use-efficiency.js"></script>

      <script src="app/directives/questionnaires/household-survey/general-information.js"></script>
      <script src="app/directives/questionnaires/household-survey/pre-planting.js"></script>
      <script src="app/directives/questionnaires/household-survey/land-preparation.js"></script>
      <script src="app/directives/questionnaires/household-survey/sowing-transplanting.js"></script>
      <script src="app/directives/questionnaires/household-survey/irrigation.js"></script>
      <script src="app/directives/questionnaires/household-survey/fertilizer-application.js"></script>
      <script src="app/directives/questionnaires/household-survey/weeding-and-herbicide-application.js"></script>
      <script src="app/directives/questionnaires/household-survey/pesticide-application.js"></script>
      <script src="app/directives/questionnaires/household-survey/harvesting-threshing.js"></script>
      <script src="app/directives/questionnaires/household-survey/cleaning-drying.js"></script>
      <script src="app/directives/questionnaires/household-survey/grain-and-straw-yield.js"></script>
      <script src="app/directives/questionnaires/household-survey/food-safety.js"></script>
      <script src="app/directives/questionnaires/household-survey/worker-health-safety.js"></script>
      <script src="app/directives/questionnaires/household-survey/child-labor.js"></script>
      <script src="app/directives/questionnaires/household-survey/women-empowerment.js"></script>
      <script src="app/directives/questionnaires/household-survey/food-security.js"></script>
      <script src="app/directives/questionnaires/household-survey/pesticide-use-efficiency.js"></script>

      <!-- filters -->
      <script src="app/filters/orderObjectBy.js"></script>
      <script src="app/filters/ordinal.js"></script>
    <?php } ?>
  </head>

  <body>
    <div ui-view class="main-pages animated"></div>
  </body>

</html>
