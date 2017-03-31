'use strict';

angular.module('fieldCalculator')
.service('Farmers', function($resource, $db, $dbHelper, API_URL, RedirectInterceptor, SyncInterceptor) {
  var _this = this;

  var request = $resource(API_URL, {
      controller: 'farmers',
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
          action: 'edit'
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
      getAll: {
        method: 'GET',
        params: {
          action: 'getAll'
        }
      },
      delete: {
        method: 'POST',
        params: {
          action: 'delete'
        }
      }
    });

  _this.get = function(id) {
    return request.get({id: id}).$promise
      .then(function(response) {
        return response.data;
      });
  };

  _this.getAll = function() {
    return request.getAll().$promise
    .then(function(response) {
      return response.data;
    })
    .catch(function(error) {
      console.log(error);
    });
  };

  _this.add = function(data) {
    return request.add(data).$promise
    .then(function(response) {
      return response;
    })
    .catch(function(error) {

    })
    /*
    $db.put('farmers', data);
    return request.add(data).$promise
    .catch(function(response) {

    });*/
  };

  _this.edit = function(data) {
    return request.edit(data).$promise
    .then(function(response) {
      return response;
    })
    .catch(function(error) {

    })
    /*
    $db.put('farmers', data);
    return request.add(data).$promise
    .catch(function(response) {

    });*/
  };

  _this.update = function(id, data) {

  };

  _this.delete = function(data) {
    return request.delete(data).$promise
    .then(function(response) {
      return response.data;
    })
  };

  return _this;
});
