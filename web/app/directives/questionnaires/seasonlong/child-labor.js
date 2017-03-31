'use strict';

angular.module('fieldCalculator')
.directive('childLabor',
  function(Common, DropdownValues, SEASON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '='
    },
    templateUrl: SEASON_DIRECTIVE_URL + 'child-labor.html',
    link: function(scope) {
      scope.employmentBelow18 = DropdownValues.employmentBelow18();
      scope.evidenceBelow18 = DropdownValues.evidenceBelow18();
      scope.schoolChildren = DropdownValues.schoolChildren();
      scope.noChildrenBelowMinimumAge = DropdownValues.noChildrenBelowMinimumAge();
      scope.validateField = Common.validateField;
    }
  };
});
