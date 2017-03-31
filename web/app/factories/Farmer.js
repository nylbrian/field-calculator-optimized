'use strict';

angular.module('fieldCalculator')
.factory('FarmerFactory', function() {
  return function() {
    var _this = this;

    _this.getAll = function() {
      return {};
    }

    return _this;
  }
});
