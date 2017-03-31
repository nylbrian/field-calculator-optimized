'use strict';

angular.module('fieldCalculator')
.factory('RedirectInterceptor', function($q, $state) {
  return {
    response: function(response) {
      if (response.data.status === 'failed') {
        $state.go('main.pageNotFound', {}, {location: 'replace'});
        return $q.reject(response);
      }

      return $q.resolve(response.data);
    },
    responseError: function(response) {
      $state.go('main.pageNotFound', {}, {location: 'replace'});
      return $q.reject(response);
    }
  };
});
