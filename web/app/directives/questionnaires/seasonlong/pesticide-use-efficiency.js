'use strict';

angular.module('fieldCalculator')
.directive('pesticideUseEfficiency',
  function(Common, DropdownValues, SEASON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '='
    },
    templateUrl: SEASON_DIRECTIVE_URL + 'pesticide-use-efficiency.html',
    link: function(scope) {
      scope.useRegisteredProductions = DropdownValues.useRegisteredProductions();
      scope.targetedApplication = DropdownValues.targetedApplication();
      scope.labelInstructions = DropdownValues.labelInstructions();
      scope.pesticideEquipmentCalibrated = DropdownValues.pesticideEquipmentCalibrated();
      scope.weedManagementCarriedOut = DropdownValues.weedManagementCarriedOut();
      scope.diseaseManagementCarriedOut = DropdownValues.diseaseManagementCarriedOut();
      scope.insectManagementCarriedOut = DropdownValues.insectManagementCarriedOut();
      scope.molluskManagementCarriedOut = DropdownValues.molluskManagementCarriedOut();
      scope.rodentManagementCarriedOut = DropdownValues.rodentManagementCarriedOut();
      scope.birdManagementCarriedOut = DropdownValues.birdManagementCarriedOut();
      scope.validateField = Common.validateField;
    }
  };
});
