'use strict';

angular.module('fieldCalculator')
.service('SeasonlongSuggestion', function($resource, $translate, API_URL) {

  var request = $resource(API_URL, {
    controller: 'SeasonlongSuggestion',
    action: '@action',
    id: '@id',
    paramOne: '@paramOne',
    paramTwo: '@paramTwo',
    paramThree: '@paramThree',
    paramFour: '@paramFour',
  }, {
    getSuggestion: {
      method: 'GET',
      params: {
        action: 'getSuggestion',
        id: '@id',
        paramOne: '@paramOne',
        paramTwo: '@paramTwo'
      }
    }
  });

  var SeasonlongSuggestion = {
    getSuggestion: function(farmerId, farmerSeasonsId) {
      return request.getSuggestion({
        id: farmerId,
        paramOne: farmerSeasonsId
      }).$promise
      .then(function(response) {
        return response.data;
      })
      .catch(function(error) {

      });
    }
  };

  return SeasonlongSuggestion;
})





