'use strict';

angular.module('fieldCalculator')
.directive('womenEmpowerment',
  function(Common, DropdownValues, SEASON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '='
    },
    templateUrl: SEASON_DIRECTIVE_URL + 'women-empowerment.html',
    link: function(scope) {
      scope.womenDecision = DropdownValues.womenDecision();
      scope.womenSatisfaction = DropdownValues.womenSatisfaction();
      scope.womenAccess = DropdownValues.womenAccess();
      scope.womenSeasonalResources = DropdownValues.womenSeasonalResources();
      scope.womenControlDecisionMaking = DropdownValues.womenControlDecisionMaking();
      scope.womenControlPersonalIncome = DropdownValues.womenControlPersonalIncome();
      scope.womenParticipationDecision = DropdownValues.womenParticipationDecision();
      scope.womenViolence = DropdownValues.womenViolence();
      scope.validateField = Common.validateField;
    }
  };
});
