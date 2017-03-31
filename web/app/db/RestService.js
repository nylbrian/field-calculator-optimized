'use strict';

angular.module('db')
.service('RestService', function(Rest) {
  return function(name, db) {
    var _this = this;
    _this.name = name;
    _this.db = db.branch('single', false);

    _this.get = function(cb, name, id, token) {
      Rest.get(function(obj) {
        if (obj) {
          if (obj.updatedAt == token) {
            cb(304);
          } else {
            cb(200, obj, obj.updatedAt);
          }
        } else {
          cb(404);
        }
      }, id, name)
    };

    _this.add = function(cb, name, data) {
      Rest.insert(function(obj) {
        for (var n in data) {obj[n] = data[n]};
        obj.updatedAt = obj.createdAt;
        cb(201, obj, obj.objectId, obj.updatedAt);
      }, data, name);
    };

    _this.put = function(cb, name, data, id, token) {
      Rest.update(function(obj) {
        for (var n in data) {obj[n] = data[n]};
        cb(200, obj, obj.objectId, obj.updatedAt);
      }, data, name);
    };

    _this.remove = function(cb, name, id, token) {
      Rest.delete(function(obj) {
        cb(200);
      }, id);
    };

    _this.list_ = function(cb, name, token) {
      Rest.list(function(arr) {
        var ids = arr.map(function(obj) {
          return obj.objectId;
        });
        var tokens = arr.map(function(obj) {
          return obj.updatedAt;
        });
        cb(200, arr, ids, tokens);
      }, token, name);
    };

    _this.list = function(cb, name, token) {
      if (token) {
        _this.list_(cb, name, token);
      } else {
        _this.db.values(_this.name, 'updatedAt', null, 1, 0, true).always(function(obj) {
          var token = obj[0] ? obj[0].updatedAt : null;
          _this.list_(cb, name, token);
        });
      }
    };
  };
});
