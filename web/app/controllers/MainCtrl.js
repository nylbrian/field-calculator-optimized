'use strict';

angular.module('fieldCalculator')
.controller('MainCtrl', function($state, Authentication, IMAGE_URL) {
  this.imageUrl = IMAGE_URL;
  this.logout = function() {
    Authentication.logout()
      .then(function(response) {
        if (response) {
          $state.go('logged-out.login');
        }
      })
      .catch(function() {

      });
  };
});
