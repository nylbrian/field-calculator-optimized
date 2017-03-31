'use strict';

angular.module('fieldCalculator')
.controller('NewFarmerCtrl',
  function($db, $state, Farmers, Countries) {
  var _this = this;
  _this.data = {};

  _this.changeCountry = function() {
    _this.data.other_country = null;
    _this.data.other_region = null;
    _this.data.other_province = null;
    _this.data.region_id = null;
    _this.data.province_id = null;
    _this.data.district = null;
    _this.data.village = null;
    _this.provinces = null;
    _this.regions = null;
    if (_this.data.country_id > 0) {
      _this.regions = _this.countries[_this.data.country_id].regions;
    }
  };

  _this.changeRegion = function() {
    _this.data.other_province = '';
    _this.data.province_id = null;
    _this.data.district = null;
    _this.data.village = null;
    _this.provinces = _this.countries[_this.data.country_id]
      .regions[_this.data.region].provinces;
  }

  _this.save = function() {
    Farmers.add(_this.data)
    .then(function(response) {
      $state.go('main.seasons', {farmerId: response.data.id});
    });
  };

  Countries.getCountries().then(function(response) {
    _this.countries = response;
  });

});
