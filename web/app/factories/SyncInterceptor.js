'use strict';

angular.module('fieldCalculator')
.factory('SyncInterceptor', function($q, $state) {
  return {
    response: function(response) {
      if (response.data.status === 'failed') {
        return $q.reject(response.data);
      }

      return $q.resolve(response.data);
    }
  };
});
