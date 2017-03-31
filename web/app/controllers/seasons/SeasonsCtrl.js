'use strict';

angular.module('fieldCalculator')
.controller('SeasonsCtrl',
  function(DropdownValues, FarmerInfo, FarmerSeasons) {
  var _this = this;

  _this.getSeason = function(id) {
    var seasons = DropdownValues.seasons();
    var name = '';
    angular.forEach(seasons, function(value, key) {
      if (id == key) {
        name = seasons[key].name;
      }
    });

    return name;
  };

  _this.count = FarmerSeasons.length;
  _this.start = 1;
  _this.items = 10;

  _this.data = FarmerSeasons;
  _this.farmer = FarmerInfo;

  _this.filterTable = function(item){
    if (!_this.search ||
        (item.year.toString().indexOf(_this.search.toLowerCase()) != -1) ||
        (item.sowing_date.toString().indexOf(_this.search.toLowerCase()) != -1) ||
        (_this.getSeason(item.seasons_id).toLowerCase().indexOf(_this.search.toLowerCase()) != -1) ){
        return true;
    }
    return false;
  };

  _this.reset = function() {
    _this.start = 1;
  };

  /*function updateTable(key_range) {
    var farmers = $db.values('farmers', key_range).then(function(data) {
      _this.data = data;
    });
  }

  _this.update = function(id) {
    $state.go('main.edit-farmer', {farmerId: id});
  };


  //updateTable();

  var key_range = $dbHelper.keyRangeStarts([{name: 'farmers', a : 2}]);
  updateTable(key_range);
  //console.log(key_range);

  $db.from('farmers').where('storage_id', '=', 1);*/
});
