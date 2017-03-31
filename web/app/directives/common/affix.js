'use strict';

angular.module('fieldCalculator')
.directive('affix', function ($window) {
  return {
    restrict: 'A',
    link: function ($scope, $element) {
      var win = angular.element($window);
      var topOffset = $element[0].offsetTop;

      function affixElement() {
        if ($window.pageYOffset > topOffset) {
          $element.css('position', 'fixed');
        } else {
          $element.css('position', '');
        }
      }

      $scope.$on('$stateChangeStart', function() {
        win.unbind('scroll', affixElement);
      });
      win.bind('scroll', affixElement);
    }
  };
})
