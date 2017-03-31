'use strict';

angular.module('fieldCalculator')
.controller('ImportFarmersOutputPageHousehold',
  function(FileUploader, IMPORT_URL_HOUSEHOLD) {
  var _this = this;

  _this.uploader = new FileUploader({
    url: IMPORT_URL_HOUSEHOLD
  });

});
