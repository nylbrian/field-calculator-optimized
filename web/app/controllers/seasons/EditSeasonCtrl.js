'use strict';

angular.module('fieldCalculator')
.controller('EditSeasonCtrl',
  function($state, Common, Seasons, DropdownValues, FarmerInfo, FarmerSeason) {
  var _this = this;

  _this.save = function() {
    Seasons.edit(_this.data)
    .then(function(response) {
      $state.go('main.farmeroptions', {farmerId: FarmerInfo.id, seasonId: response.data.id});
    });
  };

  _this.farmer = FarmerInfo;
  _this.seasons = DropdownValues.seasons();
  _this.data = FarmerSeason;
  _this.formatDate = Common.formatDate;
  _this.years = [2015, 2016, 2017, 2018, 2019, 2020, 2021];
});
