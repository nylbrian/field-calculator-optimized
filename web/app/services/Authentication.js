'use strict';

angular.module('fieldCalculator')
.service('Authentication', function(
  $resource, API_URL, RedirectInterceptor, SyncInterceptor) {
  var _this = this;

  var request = $resource(API_URL, {
      controller: 'authentication',
      action: '@action',
      id: '@id',
      paramOne: '@paramOne',
      paramTwo: '@paramTwo',
      paramThree: '@paramThree',
      paramFour: '@paramFour',
    }, {
      verify: {
        params: {
          action: 'verify'
        }
      },
      logout: {
        params: {
          action: 'logout'
        }
      }
    });

  _this.verify = function(data) {
    return request.verify(data).$promise
      .then(function(response) {
        return response.data;
      });
  };

  _this.logout = function() {
    return request.logout().$promise
      .then(function(response) {
        return response.data;
      });
  };

  return _this;
});
