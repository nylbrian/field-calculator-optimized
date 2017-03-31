'use strict';

angular.module('fieldCalculator')
.factory('SeasonlongWomenEmpowerment', function() {
  return function(data) {
    var _this = this;
    _this.data = {};

    _this.setData = function(data) {
      _this.data = data;
    };

    if (data) {
      _this.setData(data);
    }

    return _this;
  };
});
