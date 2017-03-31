'use strict';

angular.module('fieldCalculator')
.service('DataFilters', function($resource, $translate, API_URL) {

  var request = $resource(API_URL, {
    controller: 'Filters',
    action: '@action',
    id: '@id',
    paramOne: '@paramOne',
    paramTwo: '@paramTwo',
    paramThree: '@paramThree',
    paramFour: '@paramFour',
  }, {
    getCountries: {
      method: 'POST',
      params: {
        action: 'getCountries'
      }
    },
    getRegions: {
      method: 'POST',
      params: {
        action: 'getRegions'
      }
    },
    getProvinces: {
      method: 'POST',
      params: {
        action: 'getProvinces'
      }
    },
    getDistricts: {
      method: 'POST',
      params: {
        action: 'getDistricts'
      }
    },
    getVillages: {
      method: 'POST',
      params: {
        action: 'getVillages'
      }
    },
    getYears: {
      method: 'POST',
      params: {
        action: 'getYears'
      }
    },
    getSeasons: {
      method: 'POST',
      params: {
        action: 'getSeasons'
      }
    }
  });

  return {
    getCountries: function(data) {
      return request.getCountries(data).$promise
        .then(function(response) {
          return response.data;
        })
        .catch(function(error) {

        });
    },
    getYears: function(data) {
      return request.getYears(data).$promise
        .then(function(response) {
          return response.data;
        })
        .catch(function(error) {

        });
    },
    getSeasons: function(data) {
      return request.getSeasons(data).$promise
        .then(function(response) {
          return response.data;
        })
        .catch(function(error) {

        });
    },
    getRegions: function(data) {
      return request.getRegions(data).$promise
        .then(function(response) {
          return response.data;
        })
        .catch(function(error) {

        });
    },
    getProvinces: function(data) {
      return request.getProvinces(data).$promise
        .then(function(response) {
          return response.data;
        })
        .catch(function(error) {

        });
    },
    getDistricts: function(data) {
      return request.getDistricts(data).$promise
        .then(function(response) {
          return response.data;
        })
        .catch(function(error) {

        });
    },
    getVillages: function(data) {
      return request.getVillages(data).$promise
        .then(function(response) {
          return response.data;
        })
        .catch(function(error) {

        });
    },
  };
});
