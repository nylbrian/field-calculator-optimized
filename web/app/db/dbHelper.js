'use strict';

angular.module('db')
.service('$dbHelper', function($window) {
  return {
    keyRangeStarts: function() {
      return $window.ydn.db.KeyRange.starts;
    }
  };
});
