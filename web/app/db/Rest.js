'use strict';

angular.module('db')
.service('Rest', function($window) {
  var _this = this;

  _this.APP_ID = 'x2yPHidLnLDjeMz9cZNifHlsaz9csJbWLZvX3Ncj';
  _this.APP_REST_KEY = 'e0HxDCcoLWeBD79eJabihNMCtSVA7JZFxRfHeyiv';

  _this.request = function(cb, method, key, param, object, name) {
    var xhr = new $window.XMLHttpRequest();
    var base = '/rest/index.php?request=sync&type=' + name;
    if (key) {
      base += '&updateKey=' + key;
    }
    if (param) {
      base += '&';
      for (var name in param) {
        base += name + '=' + $window.encodeURIComponent(param[name]) + '&';
      }
      base = base.substr(0, base.length - 1);
    }
    xhr.open(method, base, true);
    xhr.setRequestHeader('X-Parse-Application-Id', _this.APP_ID);
    xhr.setRequestHeader('X-Parse-REST-API-Key', _this.APP_REST_KEY);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
      cb($window.JSON.parse(xhr.responseText));
    };
    var data = object ? $window.JSON.stringify(object) : null;
    xhr.send(data);
  };

  _this.list = function(cb, after, name) {
    var param = {
      'order': 'updatedAt'
    };
    if (after) {
      param['where'] = $window.JSON.stringify({
        updatedAt: {$gt: after}
      });
    }
    _this.request(function(resp) {
      cb(resp.results);
    }, 'GET', null, param, {}, name);
  };

  _this.get = function(cb, key, name) {
    _this.request(cb, 'GET', key, {}, {}, name);
  };

  _this.delete = function(cb, key, name) {
    _this.request(cb, 'DELETE', key, {}, {}, name);
  };

  _this.insert = function(cb, obj, name) {
    _this.request(cb, 'POST', null, {}, obj, name);
  };

  _this.update = function(cb, obj, name) {
    _this.request(cb, 'PUT', obj.objectId, {}, obj, name);
  };
});
