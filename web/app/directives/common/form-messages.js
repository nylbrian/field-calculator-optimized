'use strict';

angular.module('fieldCalculator')
.directive('formMessages',
  function(COMMON_DIRECTIVE_URL) {
  return {
    restrict: 'E',
    scope: {
      form: '=',
      name: '=',
      data: '='
    },
    templateUrl: COMMON_DIRECTIVE_URL + 'form-messages.html',
    link: function(scope) {
      if (scope.name) {
        scope.parent = false;
        scope.item = scope.form[scope.name];
      } else {
        scope.parent = true;
        scope.item = scope.form;
      }
    }
  };
});
