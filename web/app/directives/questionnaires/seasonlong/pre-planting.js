'use strict';

angular.module('fieldCalculator')
.directive('prePlanting',
  function(Common, DropdownValues, TreatmentNames, SEASON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '=',
      farmer: '=',
      season: '=',
      period: '='
    },
    templateUrl: SEASON_DIRECTIVE_URL + 'pre-planting.html',
    link: function(scope) {
      scope.formatDate = Common.formatDate;
      scope.addDate = Common.addDate;
      scope.irrigationRegime = DropdownValues.irrigationRegime();
      scope.organicMaterials = DropdownValues.organicMaterials();
      scope.previousCrop = DropdownValues.previousCrop();
      scope.seedTypes = DropdownValues.seedTypes();
      scope.soilFertility = DropdownValues.soilFertility();
      scope.strawManagement = DropdownValues.strawManagement();
      scope.riceStrawHarvestManagement = DropdownValues.riceStrawHarvestManagement();
      scope.treatment = TreatmentNames.getList(scope.farmer.country_id);
      scope.waterRegime = DropdownValues.waterRegime();
      scope.yesNo = DropdownValues.yesNo();
      scope.landRental = DropdownValues.landRental();
      scope.validateField = Common.validateField;
    }
  };
});
