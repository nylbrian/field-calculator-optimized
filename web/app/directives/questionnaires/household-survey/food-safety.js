'use strict';

angular.module('fieldCalculator')
.directive('foodSafetyHousehold',
  function(Common, DropdownValues, HOUSEHOLD_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '='
    },
    templateUrl: HOUSEHOLD_DIRECTIVE_URL + 'food-safety.html',
    link: function(scope) {
      scope.yesNo = DropdownValues.yesNo();
      scope.validateField = Common.validateField;
    }
  };
});
