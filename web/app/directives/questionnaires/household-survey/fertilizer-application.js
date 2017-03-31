'use strict';

angular.module('fieldCalculator')
.directive('fertilizerApplicationHousehold',
  function(Common, DropdownValues, HOUSEHOLD_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '=',
      period: '=',
      season: '='
    },
    templateUrl: HOUSEHOLD_DIRECTIVE_URL + 'fertilizer-application.html',
    link: function(scope) {
      scope.getFertilizerName = function(val) {
        var name = '';
        angular.forEach(scope.fertilizerTypes, function(item) {
          if (item.value === val) {
            name = item.name;
          }
        });

        return name;
      }

      scope.addFertilizer = function(val) {
        scope.data.otherFertilizers.push({
          value: val,
          name: val,
          isChecked: true,
          other: 1
        });
      };

      scope.removeFertilizer = function(index) {
        scope.data.otherFertilizers.splice(index, 1);
      };

      scope.updateOtherFertilizers = function(value, index) {
        if (value === '' && scope.getEmptyFieldCount() > 1) {
          return scope.removeFertilizer(index);
        }

        if (value !== '' && scope.getEmptyFieldCount() <= 0) {
          scope.addFertilizer();
        }
      };

      scope.getEmptyFieldCount = function() {
        var count = 0;
        angular.forEach(scope.data.otherFertilizers, function(value) {
          if (!value.name) {
            count++;
          }
        });
        return count;
      };

      scope.hasSelectedFertilizerType = function() {
        var found = false;
        var object;

        angular.forEach(scope.data.fertilizers, function(item) {
          if (item.checked === true) {
            found = true;
            return;
          }
        });

        angular.forEach(scope.data.otherFertilizers, function(value) {
          if (value.isChecked && value.name) {
            found = true;
            return;
          }
        });

        return found;
      };

      if (!scope.data) {
        scope.data = {};
      }

      if (!scope.data.otherFertilizers) {
        scope.data.otherFertilizers = [];
      }

      if (!scope.data.fertilizers) {
        scope.data.fertilizers = {};
      }

      if (!scope.data.fertilizerApplied) {
        scope.data.fertilizerApplied = {};
      }

      scope.fertilizerTypes = DropdownValues.fertilizerTypes();
      scope.laborTypes = DropdownValues.laborTypes();
      scope.fertilizerApplication = DropdownValues.fertilizerApplication();
      scope.addFertilizer();
      scope.formatDate = Common.formatDate;
      scope.range = Common.range;
      scope.validateField = Common.validateField;
      scope.validateCheckbox = Common.validateCheckbox;
      scope.addDate = Common.addDate;
    }
  };
});
