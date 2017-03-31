'use strict';

angular.module('fieldCalculator')
.service('GraphicsHousehold', function($resource, API_URL) {
  var _this = this;

  var request = $resource(API_URL, {
      controller: 'householdGraphics',
      action: '@action',
      id: '@id',
      paramOne: '@paramOne',
      paramTwo: '@paramTwo',
      paramThree: '@paramThree',
      paramFour: '@paramFour',
    }, {
      generate: {
        method: 'POST',
        params: {
          action: 'generate'
        },
        headers: {'Content-Type': 'application/json'}
      }
    });

  _this.generate = function(data) {
    return request.generate(data).$promise
    .then(function(response) {
      return response;
    })
    .catch(function(error) {

    });
  };

  return _this;
});
