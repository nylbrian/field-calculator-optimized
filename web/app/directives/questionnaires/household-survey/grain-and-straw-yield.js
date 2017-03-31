'use strict';

angular.module('fieldCalculator')
.directive('grainAndStrawYieldHousehold',
  function(Common, DropdownValues, HOUSEHOLD_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '='
    },
    templateUrl: HOUSEHOLD_DIRECTIVE_URL + 'grain-and-straw-yield.html',
    link: function(scope) {
      scope.strawUsage = DropdownValues.strawUsage();
      scope.yesNo = DropdownValues.yesNo();
      scope.irrigationMethod = DropdownValues.irrigationMethod();
      scope.validateField = Common.validateField;
    }
  };
});
