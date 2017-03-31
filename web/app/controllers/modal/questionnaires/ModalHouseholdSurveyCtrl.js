'use strict';

angular.module('fieldCalculator')
.controller('ModalHouseholdSurveyCtrl', function($uibModalInstance) {
  this.ok = function() {
    $uibModalInstance.close();
  };

  this.cancel = function() {
    $uibModalInstance.dismiss('cancel');
  };
});
