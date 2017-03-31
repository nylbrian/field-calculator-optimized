'use strict';

angular.module('fieldCalculator')
.controller('LoginCtrl', function($state, Users) {
  var _this = this;

  this.data = {};

  _this.login = function() {
    if (_this.processing) {
      return;
    }

    _this.processing = true;
    _this.error = '';

    Users.login(_this.data)
    .then(function(response) {
      if (response.status === 'success') {
        $state.go('main');
      } else {
        _this.error = response.error;
      }
    }).finally(function() {
      _this.processing = false;
    });
  };

  _this.register = function() {
    $state.go('logged-out.register');
  };
});
