'use strict';

angular.module('fieldCalculator')
.controller('FarmerOptionsCtrl',
  function($window, $state, FarmerInfo, FarmerSeason) {
  var _this = this;

  _this.farmer = FarmerInfo;
  _this.season = FarmerSeason;
  _this.next = function() {
    /*if (_this.data.rcm) {
      var country = Countries.getById(_this.farmer.country);
      $window.open('http://webapps.irri.org/' + country.rcm, '_blank');
    }*/

    if (_this.data.questionnaire) {
      switch (_this.data.questionnaire) {
        case 'seasonlong':
          $state.go('main.seasonlong', {farmerId: FarmerInfo.id, seasonId: FarmerSeason.id});
        break;
        case 'householdSurvey':
          $state.go('main.householdSurvey', {farmerId: FarmerInfo.id, seasonId: FarmerSeason.id});
        break;
      }
    }
  };

});
