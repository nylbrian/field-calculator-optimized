'use strict';

angular.module('fieldCalculator')
.controller('AssessmentSuggestionCtrl',
  function($state, $window, FarmerInfo, FarmerSeason, Suggestion, Common) {
  var _this = this;

  _this.farmer = FarmerInfo;
  _this.season = FarmerSeason;
  _this.suggestion = Suggestion;
  _this.displayDate = Common.displayDate;
  _this.printPage = function() {
    $window.print();
  };

  _this.getPercent = function(current, max) {
    return 100 - (current / max * 100);
  };

});
