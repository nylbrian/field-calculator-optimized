'use strict';

angular.module('db')
.provider('$db', function($windowProvider) {
  var _this = this;
  var dbInstance;

  _this.setName = function(name) {
    _this.name = name;
    return _this;
  };

  _this.getName = function() {
    return _this.name;
  };

  _this.setSchema = function(schema) {
    _this.schema = schema;
    return _this;
  };

  _this.getSchema = function() {
    return _this.schema;
  };

  _this.$get = ['$window', function($window) {
    if (!_this.name || !_this.schema) {
      throw new Error('Name and schema is required for running ydnDB');
    }

    dbInstance = new $window.ydn.db.Storage(_this.name, _this.schema);
    return dbInstance;
  }];
});
