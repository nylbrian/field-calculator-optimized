'use strict';

angular.module('fieldCalculator')
.service('Countries',
  function($resource, $q, $db, RestService, JSON_URL, API_URL) {

  var request = $resource(JSON_URL + 'Countries.json');
  var crudRequest = $resource(API_URL);
  var countries;

  var resource = $resource(API_URL, {
    controller: 'countries',
    action: '@action',
    id: '@id',
    paramOne: '@paramOne',
    paramTwo: '@paramTwo',
    paramThree: '@paramThree',
    paramFour: '@paramFour',
  });

  return {
    getById: function(id) {
      if (countries) {
        return countries[id];
      }
    },
    getCountryName: function(id) {
      if (countries && countries[id]) {
        return countries[id].name;
      }
    },
    getRegion: function(countryId, regionId) {
      if (countries && countries[countryId] && countries[countryId].regions) {
        return countries[countryId].regions[regionId];
      }
    },
    getRegionName: function(countryId, regionId) {
      if (countries && countries[countryId] && countries[countryId].regions) {
        return countries[countryId].regions[regionId].name;
      }
    },
    getCountries: function() {
      return request.get().$promise.then(function(response) {
        countries = response.data;
        return response.data;
      });
    },
    getRegionsPerCountry: function(countryId) {
      var defer = $q.defer();

      if (countries) {
        return defer.resolve(countries[countryId].regions);
      }

      return request.get().$promise.then(function(response) {
        if (!response.countryId || !response.countryId.regions) {
          return;
        }
        countries = response.data;
        return response.countryId.regions;
      })
    },
    getProvincesPerRegionCountry: function(countryId, regionId) {
      return request.get().$promise.then(function(response) {
        if (!response.countryId || !response.countryId.regions || !!response.countryId.regions.regionId) {
          return;
        }
        countries = response.data;
        return response.countryId.regions.regionId;
      });
    },
    sync: function() {
      var service = new RestService('countries', $db);
      var Item = $db.entity(service, 'countries');
      Item.update();
    },
    getAll: function() {
      return resource.get({
        action: 'getAll'
      }).$promise
        .then(function(response) {
          countries = response.content;
          return response.content;
        })
        .catch(function(error) {

        });
    }
  };
});
