'use strict';

angular.module('fieldCalculator')
.controller('NewSeasonCtrl',
  function($state, Seasons, DropdownValues, FarmerInfo) {
  var _this = this;

  _this.save = function() {
    Seasons.add(_this.data)
    .then(function(response) {
      $state.go('main.farmeroptions', {farmerId: FarmerInfo.id, seasonId: response.data.id});
    });
  };

  _this.farmer = FarmerInfo;
  _this.seasons = DropdownValues.seasons();
  _this.data = {
    farmers_id: _this.farmer.id
  };
  _this.years = [2015, 2016, 2017, 2018, 2019, 2020, 2021];
});
