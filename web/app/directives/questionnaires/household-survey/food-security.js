'use strict';

angular.module('fieldCalculator')
.directive('foodSecurityHousehold',
  function(DropdownValues, HOUSEHOLD_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '='
    },
    templateUrl: HOUSEHOLD_DIRECTIVE_URL + 'food-security.html',
    link: function(scope) {
      scope.yesNo = DropdownValues.yesNo();
    }
  };
});
