'use strict';

angular.module('fieldCalculator')
.service('HouseholdSurvey', function($resource, $translate, API_URL,
  HouseholdGeneralInformation, HouseholdPrePlanting, HouseholdLandPreparation,
  HouseholdSowingTransplanting, HouseholdIrrigation,
  HouseholdFertilizerApplication, HouseholdWeedingHerbicideApplication,
  HouseholdPesticideApplication, HouseholdHarvestingAndThreshing,
  HouseholdCleaningAndDrying, HouseholdGrainAndStrawYield,
  HouseholdFoodSafety, HouseholdWorkerHealthSafety,
  HouseholdChildLabor, HouseholdWomenEmpowerment,
  HouseholdFoodSecurity, HouseholdPesticideUseEfficiency) {

  var request = $resource(API_URL, {
    controller: 'HouseholdSurvey',
    action: '@action',
    id: '@id',
    paramOne: '@paramOne',
    paramTwo: '@paramTwo',
    paramThree: '@paramThree',
    paramFour: '@paramFour',
  }, {
    getLastAnswered: {
      method: 'GET',
      params: {
        action: 'getLastAnswered',
        id: '@id',
        paramOne: '@paramOne',
        paramTwo: '@paramTwo'
      }
    },
    save: {
      method: 'POST',
      params: {
        action: 'save'
      }
    },
    getFormData: {
      method: 'GET',
      params: {
        action: 'getFormData',
        id: '@id',
        paramOne: '@paramOne',
        paramTwo: '@paramTwo'
      }
    }
  });

  var data = {};
  var forms = {};

  var Household = {
    getForms: function(householdData) {
      Household.resetData(householdData);
      return {
        forms: forms,
        householdSurveyId: householdData.householdSurveyId ? householdData.householdSurveyId : null
      };
    },
    getFormData: function(farmerId, farmerSeasonsId, sowingDate) {
      return request.getFormData({
        id: farmerId,
        paramOne: farmerSeasonsId,
        paramTwo: sowingDate
      }).$promise
      .then(function(response) {
        return Household.getForms(response.data);
      })
      .catch(function(error) {

      });
    },
    resetData: function(initData) {
      data = {
        generalInformation: new HouseholdGeneralInformation(),
        prePlanting: new HouseholdPrePlanting(),
        landPreparation: new HouseholdLandPreparation(),
        sowingTransplanting: new HouseholdSowingTransplanting(),
        irrigation: new HouseholdIrrigation(),
        fertilizerApplication: new HouseholdFertilizerApplication(),
        weedingHerbicideApplication: new HouseholdWeedingHerbicideApplication(),
        pesticideApplication: new HouseholdPesticideApplication(),
        harvestingAndThreshing: new HouseholdHarvestingAndThreshing(),
        cleaningAndDrying: new HouseholdCleaningAndDrying(),
        grainAndStrawYield: new HouseholdGrainAndStrawYield(),
        foodSafety: new HouseholdFoodSafety(),
        workerHealthSafety: new HouseholdWorkerHealthSafety(),
        childLabor: new HouseholdChildLabor(),
        womenEmpowerment: new HouseholdWomenEmpowerment(),
        pesticideUseEfficiency: new HouseholdPesticideUseEfficiency()
        //foodSecurity: new HouseholdFoodSecurity()
      };

      if (angular.isObject(initData) && angular.isObject(initData.forms)) {
        angular.forEach(initData.forms, function(value, key) {
          if (angular.isDefined(data[key])) {
            data[key].setData(value);
          }
        });
      }

      forms = {
        generalInformation: {
          label: $translate.instant('General information'),
          id: 'gi',
          data: data.generalInformation.data
        },
        prePlanting: {
          label: $translate.instant('Pre-planting information'),
          id: 'ppi',

          data: data.prePlanting.data
        },
        landPreparation: {
          label: $translate.instant('Land Preparation'),
          id: 'lp',

          data: data.landPreparation.data
        },
        sowingTransplanting: {
          label: $translate.instant('Sowing or Transplating'),
          id: 'sot',

          data: data.sowingTransplanting.data
        },
        irrigation: {
          label: $translate.instant('Irrigation'),
          id: 'ir',

          data: data.irrigation.data
        },
        fertilizerApplication: {
          label: $translate.instant('Fertilizer application'),
          id: 'fa',

          data: data.fertilizerApplication.data
        },
        weedingHerbicideApplication: {
          label: $translate.instant('Weeding and herbicide application'),
          id: 'waha',

          data: data.weedingHerbicideApplication.data
        },
        pesticideApplication: {
          label: $translate.instant('Pesticide application'),
          id: 'pa',

          data: data.pesticideApplication.data
        },
        harvestingAndThreshing: {
          label: $translate.instant('Harvesting & threshing'),
          id: 'har',

          data: data.harvestingAndThreshing.data
        },
        cleaningAndDrying: {
          label: $translate.instant('Cleaning & drying'),
          id: 'cd',

          data: data.cleaningAndDrying.data
        },
        grainAndStrawYield: {
          label: $translate.instant('Grain and straw yield'),
          id: 'gstry',

          data: data.grainAndStrawYield.data
        },
        foodSafety: {
          label: $translate.instant('Food safety'),
          id: 'fs',

          data: data.foodSafety.data
        },
        workerHealthSafety: {
          label: $translate.instant('Worker health & safety'),
          id: 'whs',

          data: data.workerHealthSafety.data
        },
        childLabor: {
          label: $translate.instant('Child labor'),
          id: 'cl',

          data: data.childLabor.data
        },
        womenEmpowerment: {
          label: $translate.instant('Women empowerment'),
          id: 'we',

          data: data.womenEmpowerment.data
        },
        pesticideUseEfficiency: {
          label: $translate.instant('Pesticide Use Efficiency'),
          id: 'pue',

          data: data.pesticideUseEfficiency.data
        }
        /*,
        foodSecurity: {
          label: $translate.instant('Food security'),
          id: 'fse',

          data: data.foodSecurity.data
        }*/
      };
    },
    save: function(data) {
      return request.save(data).$promise
        .then(function(response) {
          return response;
        })
        .catch(function(error) {

        });
    }
  };

  return Household;
})
