'use strict';

angular.module('fieldCalculator')
.factory('RequestInterceptor', function($q, $state, Common) {

  var getErrorMessages = function(response) {

  };

  return {
    response: function(response) {
      if (response.data.status === 'failed') {
        Common.displayErrorModal(response);
        //$state.go('main.pageNotFound', {}, {location: 'replace'});
        return $q.reject(response);
      }

      return $q.resolve(response.data);
    },
    responseError: function(response) {
      Common.displayErrorModal(response);
      $state.go('main.pageNotFound', {}, {location: 'replace'});
      return $q.reject(response);
    }
  };
});
