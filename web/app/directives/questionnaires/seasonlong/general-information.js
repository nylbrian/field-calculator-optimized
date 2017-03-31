'use strict';

angular.module('fieldCalculator')
.directive('generalInformation',
  function(Common, DropdownValues, SEASON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '=',
      farmer: '='
    },
    templateUrl: SEASON_DIRECTIVE_URL + 'general-information.html',
    link: function(scope) {
      scope.hasSuppliedProblem = function() {
        if (!angular.isDefined(scope.data.problems) || !angular.isObject(scope.data.problems)) {
          return false;
        }

        var supplied = false;
        angular.forEach(scope.data.problems, function(item) {
          if (item.problem && item.problem !== '') {
            supplied = true;
          }
        });

        return supplied;
      };

      scope.gender = DropdownValues.gender();
      scope.maritalStatus = DropdownValues.maritalStatus();
      scope.literacy = DropdownValues.literacy();
      scope.primaryOccupation = DropdownValues.primaryOccupation();
      scope.secondaryOccupation = DropdownValues.secondaryOccupation();
      scope.religion = DropdownValues.religion();
      scope.yesNo = DropdownValues.yesNo();
      scope.householdTraining = DropdownValues.householdTraining();
      scope.machineries = DropdownValues.machineries();
      scope.ownershipStatus = DropdownValues.ownershipStatus();
      scope.economicCondition = DropdownValues.economicCondition();
      scope.economicCondition3Years = DropdownValues.economicCondition3Years();
      scope.range = Common.range;
      scope.validateField = Common.validateField;
    }
  };
});
