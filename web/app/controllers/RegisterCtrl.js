'use strict';

angular.module('fieldCalculator')
.controller('RegisterCtrl', function($state, Countries, Users) {
  var _this = this;

  this.data = {};

  this.save = function() {
    if (_this.processing) {
      return;
    }

    _this.processing = true;
    _this.error = '';

    Users.register(this.data)
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

  this.back = function() {
    $state.go('logged-out.login');
  };

  Countries.getAll().then(function(response) {
    _this.countries = response;
  });

});
