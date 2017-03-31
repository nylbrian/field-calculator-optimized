'use strict';

angular.module('fieldCalculator')
.service('Users', function($resource, API_URL, RedirectInterceptor, SyncInterceptor) {
  var _this = this;

  var request = $resource(API_URL, {
      controller: 'users',
      action: '@action',
      id: '@id',
      paramOne: '@paramOne',
      paramTwo: '@paramTwo',
      paramThree: '@paramThree',
      paramFour: '@paramFour',
    }, {
      login: {
        method: 'POST',
        params: {
          action: 'login'
        }
      },
      register: {
        method: 'POST',
        params: {
          action: 'register'
        }
      },
      delete: {
        method: 'POST',
        params: {
          action: 'delete'
        }
      }
    });

  _this.register = function(data) {
    return request.register(data).$promise
      .then(function(response) {
        return response;
      });
  };

  _this.login = function(data) {
    return request.login(data).$promise
      .then(function(response) {
        return response;
      });
  };

  _this.delete = function(data) {
    return request.delete(data).$promise
      .then(function(response) {
        return response;
      });
  };

  return _this;
});
