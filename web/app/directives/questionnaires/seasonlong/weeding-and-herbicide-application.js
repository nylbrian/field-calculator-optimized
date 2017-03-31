'use strict';

angular.module('fieldCalculator')
.directive('weedingAndHerbicideApplication',
  function(Common, DropdownValues, SEASON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      data: '=',
      period: '=',
      season: '='
    },
    templateUrl: SEASON_DIRECTIVE_URL + 'weeding-and-herbicide-application.html',
    link: function(scope) {
      scope.hasSuppliedNames = function() {
        if (!angular.isDefined(scope.data.weedNames) || !angular.isObject(scope.data.weedNames)) {
          return false;
        }

        var supplied = false;
        angular.forEach(scope.data.weedNames, function(item) {
          if (item.name && item.name !== '') {
            supplied = true;
          }
        });

        return supplied;
      };

      scope.range = Common.range;
      scope.weedingHerbicide = DropdownValues.weedingHerbicide();
      scope.laborTypes = DropdownValues.laborTypes();
      scope.herbicideLeftOver = DropdownValues.herbicideLeftOver();
      scope.yesNo = DropdownValues.yesNo();
      scope.validateField = Common.validateField;
      scope.addDate = Common.addDate;
    }
  };
});
