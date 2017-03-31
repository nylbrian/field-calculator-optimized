'use strict';

angular.module('fieldCalculator')
.controller('HouseholdSurveyCtrl',
  function($uibModal, $state, MODAL_URL, FarmerInfo, FarmerSeason, HouseholdSurvey, Common) {
  var _this = this;

  _this.farmer = FarmerInfo;
  _this.season = FarmerSeason;
  _this.loading = true;

  HouseholdSurvey.getFormData(
    FarmerInfo.id,
    FarmerSeason.id,
    FarmerSeason.sowing_date)
  .then(function(response) {
    _this.forms = response.forms;
    _this.period = response.period;
    if (angular.isDefined(response.seasonLongId) && response.seasonLongId !== null) {
      _this.seasonLongId = response.seasonLongId;
    }
  })
  .finally(function(response) {
    _this.loading = false;
  });

  _this.save = function(form) {
    if (_this.processing) {
      return;
    }

    Common.setTouched(form.$error.required);
    Common.setDirty(form.$error.dateDisabled);
    angular.forEach(_this.forms, function(item) {
      if (angular.isDefined(form[item.id])) {
        if (!form[item.id].$valid) {
          item.opened = true;
        }
      }
    });

    if (!form.$valid) {
      return;
    }

    _this.processing = true;

    $uibModal.open({
      ariaLabelledBy: 'modal-title',
      ariaDescribedBy: 'modal-body',
      templateUrl: MODAL_URL + 'questionnaires/household-survey.html',
      controller: 'ModalHouseholdSurveyCtrl',
      controllerAs: 'msc',
      backdrop: 'static',
      /*appendTo: parentElem,*/
    }).result.then(function() {
      _this.data = {
        farmers_id: FarmerInfo.id,
        farmer_seasons_id: FarmerSeason.id,
        season_long_id: _this.seasonLongId,
        data: _this.forms
      };
      HouseholdSurvey.save(_this.data).then(function(response) {
        $state.go('main.householdAssessmentSuggestion', {
          farmerId: FarmerInfo.id, seasonId: FarmerSeason.id});
      }).finally(function() {
        _this.processing = false;
      });
    }).catch(function() {
      _this.processing = false;
    });
  };

  _this.displayDate = Common.displayDate;
});
