'use strict';

angular.module('fieldCalculator')
.factory('SeasonlongFertilizerApplication', function() {
  return function(data) {
    var _this = this;
    _this.data = {};

    _this.setData = function(data) {
      _this.data = data;
      //_this.setFertilizers();
      //_this.setOtherFertilizers();
    };

    /*_this.setFertilizers = function() {
      _this.data.fertilizers = [];
      angular.forEach(_this.data.fertilizerApplied, function(value, key) {
        if (value.other !== 1) {
          var index = _this.getFertilizerValue(value.name);

          if (!angular.isNumeric(index)) {
            break;
          }

          _this.data.fertilizers[index] = {
            isChecked: true
          };
        }
      });
    };

    _this.setOtherFertilizers = function() {
      _this.data.otherFertilizers = [];
      angular.forEach(_this.data.fertilizerApplied, function(value, key) {
        if (value.other !== 1) {
          var index = _this.getFertilizerValue(value.name);

          if (!angular.isNumeric(index)) {
            break;
          }

          _this.data.fertilizers[index] = {
            isChecked: true
          };
        }
      });
    }

    _this.getFertilizerValue = function(name) {
      var types = DropdownValues.fertilizerTypes();
      var index = null;
      angular.forEach(types, function(value, key) {
        if (value.value === name) {
          index = key;
        }
      });

      return index;
    };
*/
    if (data) {
      _this.setData(data);
    }

    return _this;
  };
});
