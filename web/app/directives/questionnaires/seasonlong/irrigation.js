'use strict';

angular.module('fieldCalculator')
.directive('irrigation',
  function(Common, DropdownValues, SEASON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '=',
      period: '=',
      season: '='
    },
    templateUrl: SEASON_DIRECTIVE_URL + 'irrigation.html',
    link: function(scope) {
      scope.isGroundWaterOrPumping = function() {
        var found = false;

        if (!scope.data) {
          return false;
        }

        angular.forEach(scope.data.period, function(value, key) {
          if (value.source === 2 || value.source === 3) {
            found = true;
          }
        });
        return found;
      };

      scope.isCanalSelected = function() {
        var found = false;

        if (!scope.data) {
          return false;
        }

        angular.forEach(scope.data.period, function(value, key) {
          if (value.source === 1) {
            found = true;
          }
        });
        return found;
      };

      scope.irrigationSource = DropdownValues.irrigationSource();
      scope.irrigationPumpSource = DropdownValues.irrigationPumpSource();
      scope.laborTypes = DropdownValues.laborTypes();
      scope.range = Common.range;
      scope.waterCondition = DropdownValues.waterCondition();
      scope.yesNo = DropdownValues.yesNo();
      scope.validateField = Common.validateField;
      scope.addDate = Common.addDate;
    }
  };
});
