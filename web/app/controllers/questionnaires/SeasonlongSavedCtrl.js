'use strict';

angular.module('fieldCalculator')
.controller('SeasonlongSavedCtrl', function(FarmerInfo, FarmerSeason, Seasonlong) {
  var _this = this;

  _this.farmer = FarmerInfo;
  _this.season = FarmerSeason;

});
