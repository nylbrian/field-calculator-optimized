'use strict';

angular.module('fieldCalculator')
.controller('FarmerCtrl',
  function($db, $dbHelper, $state, $uibModal, Farmers, MODAL_URL) {
  var _this = this;

  _this.update = function(id) {
    $state.go('main.edit-farmer', {farmerId: id});
  };

  _this.start = 1;
  _this.items = 10;
  _this.count = 0;

  _this.loadFarmers = function() {
    Farmers.getAll().then(function(data) {
      _this.data = data;
      _this.count = _this.data.length;
    });
  };

  _this.delete = function(farmer) {
    $uibModal.open({
      ariaLabelledBy: 'modal-title',
      ariaDescribedBy: 'modal-body',
      templateUrl: MODAL_URL + 'farmers/delete.html',
      controller: 'ModalDeleteFarmerCtrl',
      controllerAs: 'msc',
      backdrop: 'static',
      resolve: {
        Farmer: function() {
          return farmer;
        }
      }
    }).result.then(function(response) {
      Farmers.delete(farmer).then(function() {
        _this.loadFarmers();
      });

    });
  };

  _this.filterTable = function(item){
    if (!_this.search ||
        (item.first_name.toLowerCase().indexOf(_this.search.toLowerCase()) != -1) ||
        (item.last_name.toLowerCase().indexOf(_this.search.toLowerCase()) != -1) ||
        (item.country.toLowerCase().indexOf(_this.search.toLowerCase()) != -1) ){
        return true;
    }
    return false;
  };

  _this.reset = function() {
    _this.start = 1;
  };

  _this.loadFarmers();

  /*function updateTable(key_range) {
    var farmers = $db.values('farmers', key_range).then(function(data) {
      _this.data = data;
    });
  }

  //updateTable();

  var key_range = $dbHelper.keyRangeStarts([{name: 'farmers', a : 2}]);
  updateTable(key_range);
  //console.log(key_range);

  $db.from('farmers').where('storage_id', '=', 1);*/
});
