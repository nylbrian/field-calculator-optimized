'use strict';

angular.module('fieldCalculator')
.service('Download',
  function($resource, DOWNLOAD_URL) {
  var request = $resource(DOWNLOAD_URL, {}, {
    save: {
      method: 'POST'
    }
  });

  return {
    download: function(data) {
      return request.save(data);
    }
  };
});
