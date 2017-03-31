'use strict';

angular.module('fieldCalculator')
.directive('harvestingThreshing',
  function(Common, DropdownValues, SEASON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '=',
      season: '=',
      period: '='
    },
    templateUrl: SEASON_DIRECTIVE_URL + 'harvesting-threshing.html',
    link: function(scope) {
      scope.formatDate = Common.formatDate;
      scope.combineHarvester = DropdownValues.combineHarvester();
      scope.harvestingMethod = DropdownValues.harvestingMethod();
      scope.laborTypes = DropdownValues.laborTypes();
      scope.riceStrawHarvestManagement = DropdownValues.riceStrawHarvestManagement();
      scope.removedStraw = DropdownValues.removedStraw();
      scope.yesNo = DropdownValues.yesNo();
      scope.validateField = Common.validateField;
      scope.addDate = Common.addDate;
    }
  };
});
