'use strict';

angular.module('fieldCalculator')
.directive('sowingTransplanting',
  function(Common, DropdownValues, SEASON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '=',
      landPreparation: '=',
      period: '=',
      season: '='
    },
    templateUrl: SEASON_DIRECTIVE_URL + 'sowing-transplanting.html',
    link: function(scope) {
      scope.formatDate = Common.formatDate;
      scope.addDate = Common.addDate;
      scope.directSowingMethod = DropdownValues.directSowingMethod();
      scope.laborTypes = DropdownValues.laborTypes();
      scope.nurseryAreaField = DropdownValues.nurseryAreaField();
      scope.transplantingMethod = DropdownValues.transplantingMethod();
      scope.transplantingType = DropdownValues.transplantingType();
      scope.transplantingNurserySelf = DropdownValues.transplantingNurserySelf();
      scope.yesNo = DropdownValues.yesNo();
      scope.validateField = Common.validateField;

      if (!scope.data.sowing_date) {
        scope.data.sowing_date = Common.formatDate(scope.season.sowing_date);
      }

      /*if (!scope.data.transplanting_date) {
        scope.data.transplanting_date = Common.formatDate(scope.season.sowing_date);
      }*/
    }
  };
});
