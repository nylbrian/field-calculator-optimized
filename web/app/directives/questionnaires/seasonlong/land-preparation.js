'use strict';

angular.module('fieldCalculator')
.directive('landPreparation',
  function(Common, DropdownValues, SEASON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '=',
      season: '=',
      period: '='
    },
    templateUrl: SEASON_DIRECTIVE_URL + 'land-preparation.html',
    link: function(scope) {
      scope.validateField = Common.validateField;
      scope.addOperation = function() {
        if (!angular.isArray(scope.data.operations)) {
          scope.data.operations = [];
        }
        scope.data.operations.push({});
      };

      scope.removeOperation = function(index) {
        scope.data.operations.splice(index, 1);
      };

      scope.formatDate = Common.formatDate;
      scope.addDate = Common.addDate;
      scope.range = Common.range;
      scope.laborTypes = DropdownValues.laborTypes();
      scope.landCropEstablishment = DropdownValues.landCropEstablishment();
      scope.operationName = DropdownValues.operationName();
      scope.sowingPowerSource = DropdownValues.sowingPowerSource();
      scope.soilCondition = DropdownValues.soilCondition();
      scope.validateField = Common.validateField;

      if (!angular.isObject(scope.data)) {
        scope.data = {};
      }

      if (!angular.isDefined(scope.data.operations) ||
        !angular.isArray(scope.data.operations) || scope.data.operations.length <= 0) {
        scope.data.operations = [];
        scope.addOperation();
      }
    }
  };
});
