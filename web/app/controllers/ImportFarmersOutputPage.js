'use strict';

angular.module('fieldCalculator')
.controller('ImportFarmersOutputPage',
  function(FileUploader, IMPORT_URL) {
  var _this = this;

  _this.uploader = new FileUploader({
    url: IMPORT_URL
  });

});
