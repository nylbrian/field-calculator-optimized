'use strict';

angular.module('fieldCalculator')
.controller('ModalSeasonlongCtrl', function($uibModalInstance) {
  this.ok = function() {
    $uibModalInstance.close();
  };

  this.cancel = function() {
    $uibModalInstance.dismiss('cancel');
  };
});
