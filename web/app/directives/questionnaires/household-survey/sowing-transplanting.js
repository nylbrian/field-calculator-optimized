'use strict';

angular.module('fieldCalculator')
.directive('sowingTransplantingHousehold',
  function(Common, DropdownValues, HOUSEHOLD_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '=',
      landPreparation: '=',
      period: '=',
      season: '='
    },
    templateUrl: HOUSEHOLD_DIRECTIVE_URL + 'sowing-transplanting.html',
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
    }
  };
});
