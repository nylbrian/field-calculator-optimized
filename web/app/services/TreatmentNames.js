'use strict';

angular.module('fieldCalculator')
.service('TreatmentNames', function($translate) {
  var countriesList = {
    getVietnam: function() {
      return [
        {name: $translate.instant('1M5R'), value: '1M5R'},
        {name: $translate.instant('SFLF'), value: 'SFLF'},
        {name: $translate.instant('VietGAP'), value: 'VietGAP'},
        {name: $translate.instant('GlobalGAP'), value: 'GlobalGAP'},
        {name: $translate.instant('AWD'), value: 'AWD'},
        {name: $translate.instant('Drum seeder'), value: 'DrumSeeder'},
        {name: $translate.instant('Other (Specify)'), value: 'Other'}
      ];
    },
    getThailand: function() {
      return [
        {name: $translate.instant('Cost Reduction Program (CROP)'), value: 'cropReductionProgram'},
        {name: $translate.instant('Large Field Project'), value: 'largeFieldProject'},
        {name: $translate.instant('ThaiGAP'), value: 'ThaiGAP'},
        {name: $translate.instant('AWD'), value: 'AWD'},
        {name: $translate.instant('Drum seeder'), value: 'DrumSeeder'},
        {name: $translate.instant('Machine Transplanting'), value: 'MachineTransplanting'},
        {name: $translate.instant('Other (Specify)'), value: 'Other'}
      ];
    },
    getIndonesia: function() {
      return [
        {name: $translate.instant('ICM (PTT)'), value: 'ICM'},
        {name: $translate.instant('AWD'), value: 'AWD'},
        {name: $translate.instant('DrumSeeder'), value: 'DrumSeeder'},
        {name: $translate.instant('Machine Transplanting'), value: 'MachineTransplanting'},
        {name: $translate.instant('Other (Specify)'), value: 'Other'}
      ];
    },
    getMyanmar: function() {
      return [
        {name: $translate.instant('BMP'), value: 'BMP'},
        {name: $translate.instant('AWD'), value: 'AWD'},
        {name: $translate.instant('DrumSeeder'), value: 'DrumSeeder'},
        {name: $translate.instant('Machine Transplanting'), value: 'MachineTransplanting'},
        {name: $translate.instant('Other (Specify)'), value: 'Other'}
      ];
    },
    getChina: function() {
      return [
        {name: $translate.instant('3Control'), value: '3Control'},
        {name: $translate.instant('AWD'), value: 'AWD'},
        {name: $translate.instant('DrumSeeder'), value: 'DrumSeeder'},
        {name: $translate.instant('Machine Transplanting'), value: 'MachineTransplanting'},
        {name: $translate.instant('Other (Specify)'), value: 'Other'}
      ];
    },
    getSriLanka: function() {
      return [
        {name: $translate.instant('Dry seeded rice (DSR)'), value: 'dsr'},
        {name: $translate.instant('Parachute broadcasting'), value: 'ParachuteBroadcasting'},
        {name: $translate.instant('AWD'), value: 'AWD'},
        {name: $translate.instant('DrumSeeder'), value: 'DrumSeeder'},
        {name: $translate.instant('Machine Transplanting'), value: 'MachineTransplanting'},
        {name: $translate.instant('Other (Specify)'), value: 'Other'}
      ];
    },
    getDefault: function() {
      return [
        {name: $translate.instant('AWD'), value: 'AWD'},
        {name: $translate.instant('Dry direct seeding'), value: 'DryDirectSeeding'},
        {name: $translate.instant('ICM'), value: 'ICM'},
        {name: $translate.instant('Farmers practice'), value: 'FarmersPractice'},
        {name: $translate.instant('DrumSeeder'), value: 'DrumSeeder'},
        {name: $translate.instant('Machine Transplanting'), value: 'MachineTransplanting'},
        {name: $translate.instant('Other (Specify)'), value: 'Other'}
      ];
    }
  };

  return {
    getList: function(country) {
      switch(country) {
        case 14:
          return countriesList.getVietnam();
          break;
        case 13:
          return countriesList.getThailand();
          break;
        case 8:
          return countriesList.getMyanmar();
          break;
        case 3:
          return countriesList.getChina();
          break;
        case 12:
          return countriesList.getSriLanka();
          break;
        case 5:
          return countriesList.getIndonesia();
          break;
        default:
          return countriesList.getDefault();
      }
    },
    getCountriesList: function() {
      return countriesList;
    }
  };
});
