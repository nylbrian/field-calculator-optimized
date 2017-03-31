'use strict';

angular.module('fieldCalculator')
.directive('foodSafety',
  function(Common, DropdownValues, SEASON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '='
    },
    templateUrl: SEASON_DIRECTIVE_URL + 'food-safety.html',
    link: function(scope) {
      scope.yesNo = DropdownValues.yesNo();
      scope.validateField = Common.validateField;
    }
  };
});
