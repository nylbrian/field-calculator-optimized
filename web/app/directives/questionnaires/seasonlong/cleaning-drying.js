'use strict';

angular.module('fieldCalculator')
.directive('cleaningDrying',
  function(Common, DropdownValues, SEASON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '='
    },
    templateUrl: SEASON_DIRECTIVE_URL + 'cleaning-drying.html',
    link: function(scope) {
      scope.dryThreshedGrain = DropdownValues.dryThreshedGrain();
      scope.laborTypes = DropdownValues.laborTypes();
      scope.validateField = Common.validateField;
    }
  };
});
