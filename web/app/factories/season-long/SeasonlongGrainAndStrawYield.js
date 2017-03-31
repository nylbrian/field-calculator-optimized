'use strict';

angular.module('fieldCalculator')
.factory('SeasonlongGrainAndStrawYield', function() {
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
