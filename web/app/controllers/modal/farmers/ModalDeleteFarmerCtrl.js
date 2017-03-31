'use strict';

angular.module('fieldCalculator')
.controller('ModalDeleteFarmerCtrl', function($uibModalInstance, Farmer) {
  this.farmer = Farmer;

  this.ok = function() {
    $uibModalInstance.close();
  };

  this.cancel = function() {
    $uibModalInstance.dismiss('cancel');
  };
});
