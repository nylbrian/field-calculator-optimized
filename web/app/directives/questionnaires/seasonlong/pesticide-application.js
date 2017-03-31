'use strict';

angular.module('fieldCalculator')
.directive('pesticideApplication',
  function(Common, DropdownValues, SEASON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '=',
      season: '=',
      period: '='
    },
    templateUrl: SEASON_DIRECTIVE_URL + 'pesticide-application.html',
    link: function(scope) {
      scope.getProblemName = function(val) {
        var name = '';
        angular.forEach(scope.riceFieldProblems, function(item) {
          if (item.value === val) {
            name = item.name;
          }
        });

        return name;
      }

      scope.addProblems = function(val) {
        scope.data.otherRiceFieldProblems.push({
          value: val,
          name: val,
          isChecked: true
        });
      };
      scope.removeProblem = function(index) {
        scope.data.otherRiceFieldProblems.splice(index, 1);
      };

      scope.updateOtherProblems = function(value, index) {
        if (value === '' && scope.getEmptyFieldCount() > 1) {
          return scope.removeProblem(index);
        }

        if (value !== '' && scope.getEmptyFieldCount() <= 0) {
          scope.addProblems();
        }
      };

      scope.getEmptyFieldCount = function() {
        var count = 0;
        angular.forEach(scope.data.otherRiceFieldProblems, function(value) {
          if (!value.name) {
            count++;
          }
        });
        return count;
      };

      scope.hasSelectedProblems = function() {
        var found = false;
        var object;

        angular.forEach(scope.data.riceFieldProblems, function(item) {
          if (item.checked === true) {
            found = true;
            return;
          }
        });

        angular.forEach(scope.data.otherRiceFieldProblems, function(value) {
          if (value.isChecked && value.name) {
            found = true;
            return;
          }
        });

        return found;
      };

      scope.hasSelectedProtectiveEquipment = function() {
        if (!angular.isDefined(scope.data.protective_equipments) || !angular.isObject(scope.data.protective_equipments)) {
          return false;
        }

        var found = false;
        angular.forEach(scope.data.protective_equipments, function(item) {
          if (item === true) {
            found = true;
          }
        });

        return found;
      };


      if (!scope.data) {
        scope.data = {};
      }

      if (!scope.data.otherRiceFieldProblems) {
        scope.data.otherRiceFieldProblems = [];
      }

      if (!scope.data.riceFieldProblems) {
        scope.data.riceFieldProblems = {};
      }

      scope.riceFieldProblems = DropdownValues.riceFieldProblems();
      scope.herbicideLeftOver = DropdownValues.herbicideLeftOver();
      scope.laborTypes = DropdownValues.laborTypes();
      scope.protectiveEquipments = DropdownValues.protectiveEquipments();
      scope.pesticideApplication = DropdownValues.pesticideApplication();
      scope.pesticideCalibrated = DropdownValues.pesticideCalibrated();
      scope.pesticideCategory = DropdownValues.pesticideCategory();
      scope.yesNo = DropdownValues.yesNo();
      scope.addProblems();
      scope.validateField = Common.validateField;
      scope.addDate = Common.addDate;
    }
  };
});
