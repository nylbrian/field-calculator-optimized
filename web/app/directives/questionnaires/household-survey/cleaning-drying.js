'use strict';

angular.module('fieldCalculator')
.directive('cleaningDryingHousehold',
  function(Common, DropdownValues, HOUSEHOLD_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '='
    },
    templateUrl: HOUSEHOLD_DIRECTIVE_URL + 'cleaning-drying.html',
    link: function(scope) {
      scope.dryThreshedGrain = DropdownValues.dryThreshedGrain();
      scope.laborTypes = DropdownValues.laborTypes();
      scope.validateField = Common.validateField;
    }
  };
});
