'use strict';

angular.module('fieldCalculator')
.controller('HouseholdSurveySavedCtrl',
  function(FarmerInfo, FarmerSeason) {
  var _this = this;

  _this.farmer = FarmerInfo;
  _this.season = FarmerSeason;

});
