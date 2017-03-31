'use strict';

angular.module('fieldCalculator')
.directive('foodSecurity',
  function(DropdownValues, SEASON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '='
    },
    templateUrl: SEASON_DIRECTIVE_URL + 'food-security.html',
    link: function(scope) {
      scope.yesNo = DropdownValues.yesNo();
      scope.validateField = Common.validateField;
    }
  };
});
