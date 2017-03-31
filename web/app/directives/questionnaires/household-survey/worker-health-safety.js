'use strict';

angular.module('fieldCalculator')
.directive('workerHealthSafetyHousehold',
  function(Common, DropdownValues, HOUSEHOLD_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '='
    },
    templateUrl: HOUSEHOLD_DIRECTIVE_URL + 'worker-health-safety.html',
    link: function(scope) {
      scope.facilityApplicators = DropdownValues.facilityApplicators();
      scope.pesticideApplied = DropdownValues.pesticideApplied();
      scope.pesticideApplicatorUse = DropdownValues.pesticideApplicatorUse();
      scope.pesticideDisposed = DropdownValues.pesticideDisposed();
      scope.recommendedReEntry = DropdownValues.recommendedReEntry();
      scope.safetyActivities = DropdownValues.safetyActivities();
      scope.storage = DropdownValues.storage();
      scope.toolCalibrated = DropdownValues.toolCalibrated();
      scope.trainingPesticide = DropdownValues.trainingPesticide();
      scope.workInjuries = DropdownValues.workInjuries();
      scope.validateField = Common.validateField;
    }
  };
});
