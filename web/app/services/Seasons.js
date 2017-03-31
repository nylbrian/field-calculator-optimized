'use strict';

angular.module('fieldCalculator')
.service('Seasons', function($resource, API_URL, SyncInterceptor, RedirectInterceptor) {
  var _this = this;

  var request = $resource(API_URL, {
      controller: 'seasons',
      action: '@action',
      id: '@id',
      paramOne: '@paramOne',
      paramTwo: '@paramTwo',
      paramThree: '@paramThree',
      paramFour: '@paramFour',
    }, {
      add: {
        method: 'POST',
        params: {
          action: 'add'
        },
        interceptor: SyncInterceptor,
        headers: {'Content-Type': 'application/json'}
      },
      edit: {
        method: 'POST',
        params: {
          action: 'edit',
          id: '@id'
        },
        interceptor: SyncInterceptor,
        headers: {'Content-Type': 'application/json'}
      },
      get: {
        method: 'GET',
        params: {
          action: 'get',
          id: '@id'
        },
        interceptor: RedirectInterceptor
      },
      getAllByFarmerId: {
        method: 'GET',
        params: {
          action: 'getAllByFarmerId',
          id: '@id'
        }
      }
    });

  _this.add = function(data) {
    return request.add(data).$promise
    .then(function(response) {
      return response;
    })
    .catch(function(error) {

    });
  };

  _this.edit = function(data) {
    return request.edit(data).$promise
    .then(function(response) {
      return response;
    })
    .catch(function(error) {

    });
  };

  _this.get = function(id) {
    return request.get({id: id}).$promise
      .then(function(response) {
        return response.data;
      }).catch(function(error) {
        console.log(error);
      });
  };

  _this.getAllByFarmerId = function(farmerId) {
    return request.getAllByFarmerId({id: farmerId}).$promise
    .then(function(response) {
      return response.data;
    })
    .catch(function(error) {
      console.log(error);
    })
  };

  return _this;
});
