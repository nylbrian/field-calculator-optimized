'use strict';

angular.module('fieldCalculator')
.controller('DownloadHouseholdCtrl', function($httpParamSerializer, $window,
  Countries, DataFilters, DropdownValues, DOWNLOAD_HOUSEHOLD_URL) {
  var _this = this;

  /*_this.seasons = DropdownValues.seasons();
  _this.years = [
    2016, 2017, 2018, 2019, 2020, 2021
  ];*/

  _this.data = {};
  _this.seasonNames = DropdownValues.seasons();

  _this.getSubmitData = function() {
    _this.submitData = {};
    var formData = _this.data;

    if (angular.isArray(formData.country_ids) &&
      formData.country_ids.length > 0) {
      _this.submitData['country_ids[]'] = [];
      angular.forEach(formData.country_ids, function(item) {
        if (item) {
          _this.submitData['country_ids[]'].push(item.id);
        }
      });
    }

    if (angular.isArray(formData.region_ids) &&
      formData.region_ids.length > 0) {
      _this.submitData['region_ids[]'] = [];
      angular.forEach(formData.region_ids, function(item) {
        if (item) {
          _this.submitData['region_ids[]'].push(item.id);
        }
      });
    }

    if (angular.isArray(formData.province_ids) &&
      formData.province_ids.length > 0) {
      _this.submitData['province_ids[]'] = [];
      angular.forEach(formData.province_ids, function(item) {
        if (item) {
          _this.submitData['province_ids[]'].push(item.id);
        }
      });
    }

    if (angular.isArray(formData.district_ids) &&
      formData.district_ids.length > 0) {
      _this.submitData['district_ids[]'] = [];
      angular.forEach(formData.district_ids, function(item) {
        if (item) {
          _this.submitData['district_ids[]'].push(item.id);
        }
      });
    }

    if (angular.isArray(formData.village_ids) &&
      formData.village_ids.length > 0) {
      _this.submitData['village_ids[]'] = [];
      angular.forEach(formData.village_ids, function(item) {
        if (item) {
          _this.submitData['village_ids[]'].push(item.id);
        }
      });
    }

    if (angular.isArray(formData.year_ids) &&
      formData.year_ids.length > 0) {
      _this.submitData['year_ids[]'] = [];
      angular.forEach(formData.year_ids, function(item) {
        if (item) {
          _this.submitData['year_ids[]'].push(item.id);
        }
      });
    }

    if (angular.isArray(formData.season_ids) &&
      formData.season_ids.length > 0) {
      _this.submitData['season_ids[]'] = [];
      angular.forEach(formData.season_ids, function(item) {
        if (item) {
          _this.submitData['season_ids[]'].push(item.id);
        }
      });
    }

    return _this.submitData;
  }

  _this.canSubmit = function() {
    if (Object.keys(_this.getSubmitData()).length) {
      return true;
    }

    return false;
  }

  _this.download = function() {
    if (_this.canSubmit()) {
      $window.location = DOWNLOAD_HOUSEHOLD_URL + $httpParamSerializer(_this.submitData);
    }
  }

  _this.countryUpdated = function() {
    var data = _this.getSubmitData();

    _this.regions = null;
    _this.data['region_ids'] = null;
    _this.provinces = null;
    _this.data['province_ids'] = null;
    _this.districts = null;
    _this.data['district_ids'] = null;
    _this.villages = null;
    _this.data['village_ids'] = null;

    if (data['country_ids[]']) {
      _this.getRegions({
        'country_ids': data['country_ids[]']
      });
    }

    _this.getYears({
      'country_ids': data['country_ids[]']
    });
    _this.yearUpdated();
  }

  _this.yearUpdated = function() {
    var data = _this.getSubmitData();
    _this.getSeasons({
      'country_ids': data['country_ids[]'],
      'season_ids': data['season_ids[]'],
      'region_ids': data['region_ids[]'],
      'province_ids': data['province_ids[]'],
      'district_ids': data['district_ids[]'],
      'village_ids': data['village_ids'],
      'year_ids': data['year_ids[]'],
    });
    _this.data['season_ids'] = null;
  }

  _this.regionUpdated = function(data) {
    var data = _this.getSubmitData();
    _this.provinces = null;
    _this.data['province_ids'] = null;
    _this.districts = null;
    _this.data['district_ids'] = null;
    _this.villages = null;
    _this.data['village_ids'] = null;

    if (data['region_ids[]']) {
      _this.getProvinces({
        'year_ids': data['year_ids[]'],
        'country_ids': data['country_ids[]'],
        'season_ids': data['season_ids[]'],
        'region_ids': data['region_ids[]'],
      });
    }
  }

  _this.provinceUpdated = function(data) {
    var data = _this.getSubmitData();
    _this.districts = null;
    _this.data['district_ids'] = null;
    _this.villages = null;
    _this.data['village_ids'] = null;

    if (data['province_ids[]']) {
      _this.getDistricts({
        'year_ids': data['year_ids[]'],
        'country_ids': data['country_ids[]'],
        'season_ids': data['season_ids[]'],
        'region_ids': data['region_ids[]'],
        'province_ids': data['province_ids[]'],
      });
    }
  }

  _this.districtUpdated = function(data) {
    var data = _this.getSubmitData();
    _this.villages = null;
    _this.data['village_ids'] = null;

    if (data['village_ids[]']) {
      _this.getVillages({
        'year_ids': data['year_ids[]'],
        'country_ids': data['country_ids[]'],
        'season_ids': data['season_ids[]'],
        'region_ids': data['region_ids[]'],
        'province_ids': data['province_ids[]'],
        'district_ids': data['district_ids[]'],
      });
    }
  }

  _this.villageUpdated = function(data) {
    var data = _this.getSubmitData();

    _this.getYears({
      'year_ids': data['year_ids[]'],
      'country_ids': data['country_ids[]'],
      'season_ids': data['season_ids[]'],
      'region_ids': data['region_ids[]'],
      'province_ids': data['province_ids[]'],
      'district_ids': data['district_ids[]'],
      'village_ids': data['village_ids'],
    });
  }

  _this.getRegions = function(data) {
    _this.regions = null;
    return DataFilters.getRegions(data).then(function(response) {
      if (response.length > 0) {
        _this.regions = response;
      }
    });
    _this.data['region_ids'] = null;
  }

  _this.getProvinces = function(data) {
    _this.provinces = null;
    return DataFilters.getProvinces(data).then(function(response) {
      if (response.length > 0) {
        _this.provinces = response;
      }
    });
    _this.data['province_ids'] = null;
  }

  _this.getDistricts = function(data) {
    _this.districts = null;
    return DataFilters.getDistricts(data).then(function(response) {
      if (response.length > 0) {
        _this.districts = response;
      }
    });
    _this.data['district_ids'] = null;
  }

  _this.getVillages = function(data) {
    _this.villages = null;
    return DataFilters.getVillages(data).then(function(response) {
      if (response.length > 0) {
        _this.villages = response;
      }
    });
    _this.data['village_ids'] = null;
  }

  _this.getYears = function(data) {
    _this.years = null;
    return DataFilters.getYears(data).then(function(response) {
      _this.years = response;
    });
    _this.data['year_ids'] = null;
  }

  _this.getSeasons = function(data) {
    _this.seasons = null;
    return DataFilters.getSeasons(data).then(function(response) {
      angular.forEach(response, function(item) {
        item.name = _this.getSeasonName(item.id);
      });

      _this.seasons = response;
    });
    _this.data['season_ids'] = null;
  }

  _this.getSeasonName = function(id) {
    var found;
    angular.forEach(_this.seasonNames, function(item) {
      if (id == item.value) {
        found = item.name;
      }
    });

    return found;
  }

  DataFilters.getCountries().then(function(response) {
    _this.countries = response;
  });

  _this.getYears();
  _this.getSeasons();
});
