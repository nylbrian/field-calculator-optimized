'use strict';

angular.module('fieldCalculator')
.service('Seasonlong', function($resource, $translate, API_URL,
  SeasonlongGeneralInformation, SeasonLongPrePlanting, SeasonlongLandPreparation,
  SeasonlongSowingTransplanting, SeasonlongIrrigation,
  SeasonlongFertilizerApplication, SeasonlongWeedingHerbicideApplication,
  SeasonlongPesticideApplication, SeasonlongHarvestingAndThreshing,
  SeasonlongCleaningAndDrying, SeasonlongGrainAndStrawYield,
  SeasonlongFoodSafety, SeasonlongWorkerHealthSafety,
  SeasonlongChildLabor, SeasonlongWomenEmpowerment,
  SeasonlongFoodSecurity, SeasonlongPesticideUseEfficiency) {

  var request = $resource(API_URL, {
    controller: 'seasonlong',
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

  function showFirstGroup(period) {
    return period <= 1;
  }

  function showSecondGroup(period) {
    return period > 1 && period <= 6;
  }

  function showThirdGroup(period, answeredGrainYield) {
    return period > 6 && !answeredGrainYield;
  }

  function showFourthGroup(period, answeredGrainYield) {
    return period > 6 && answeredGrainYield;
  }

  function showFirstSecondGroup(period) {
    return showFirstGroup(period) || showSecondGroup(period);
  }

  function showSecondThirdGroup(period, answeredGrainYield) {
    return showSecondGroup(period) || showThirdGroup(period, answeredGrainYield);
  }

  function showFirstSecondThirdGroup(period, answeredGrainYield) {
    return showFirstGroup(period) || showSecondGroup(period) || showThirdGroup(period, answeredGrainYield);
  }

  var Seasonlong = {
    getForms: function(seasonLongData) {
      Seasonlong.resetData(seasonLongData);
      var visibleForms = {};
      angular.forEach(forms, function(value, key) {
        if (value.visible(seasonLongData.period, seasonLongData.answeredGrainYield)) {
          visibleForms[key] = value;
        }
      });

      return {
        forms: visibleForms,
        seasonLongId: seasonLongData.seasonLongId ? seasonLongData.seasonLongId : null,
        period: seasonLongData.period
      };
    },
    getFormData: function(farmerId, farmerSeasonsId, sowingDate, dateNow) {
      return request.getFormData({
        id: farmerId,
        paramOne: farmerSeasonsId,
        paramTwo: sowingDate,
        paramThree: dateNow,
      }).$promise
      .then(function(response) {
        if (response.data.answeredLastForm) {
          // should redirect
        }
        return Seasonlong.getForms(response.data);
      })
      .catch(function(error) {

      });
    },
    resetData: function(initData) {
      data = {
        generalInformation: new SeasonlongGeneralInformation(),
        prePlanting: new SeasonLongPrePlanting(),
        landPreparation: new SeasonlongLandPreparation(),
        sowingTransplanting: new SeasonlongSowingTransplanting(),
        irrigation: new SeasonlongIrrigation(),
        fertilizerApplication: new SeasonlongFertilizerApplication(),
        weedingHerbicideApplication: new SeasonlongWeedingHerbicideApplication(),
        pesticideApplication: new SeasonlongPesticideApplication(),
        harvestingAndThreshing: new SeasonlongHarvestingAndThreshing(),
        cleaningAndDrying: new SeasonlongCleaningAndDrying(),
        grainAndStrawYield: new SeasonlongGrainAndStrawYield(),
        foodSafety: new SeasonlongFoodSafety(),
        workerHealthSafety: new SeasonlongWorkerHealthSafety(),
        childLabor: new SeasonlongChildLabor(),
        womenEmpowerment: new SeasonlongWomenEmpowerment(),
        pesticideUseEfficiency: new SeasonlongPesticideUseEfficiency()
        //foodSecurity: new SeasonlongFoodSecurity()
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
          visible: showFirstGroup,
          data: data.generalInformation.data
        },
        prePlanting: {
          label: $translate.instant('Pre-planting information'),
          id: 'ppi',
          visible: showFirstGroup,
          data: data.prePlanting.data
        },
        landPreparation: {
          label: $translate.instant('Land Preparation'),
          id: 'lp',
          visible: showFirstGroup,
          data: data.landPreparation.data
        },
        sowingTransplanting: {
          label: $translate.instant('Sowing or Transplating'),
          id: 'sot',
          visible: showFirstGroup,
          data: data.sowingTransplanting.data
        },
        irrigation: {
          label: $translate.instant('Irrigation'),
          id: 'ir',
          visible: showFirstSecondThirdGroup,
          data: data.irrigation.data
        },
        fertilizerApplication: {
          label: $translate.instant('Fertilizer application'),
          id: 'fa',
          visible: showFirstSecondThirdGroup,
          data: data.fertilizerApplication.data
        },
        weedingHerbicideApplication: {
          label: $translate.instant('Weeding and herbicide application'),
          id: 'waha',
          visible: showSecondThirdGroup,
          data: data.weedingHerbicideApplication.data
        },
        pesticideApplication: {
          label: $translate.instant('Pesticide application'),
          id: 'pa',
          visible: showSecondThirdGroup,
          data: data.pesticideApplication.data
        },
        harvestingAndThreshing: {
          label: $translate.instant('Harvesting & threshing'),
          id: 'har',
          visible: showThirdGroup,
          data: data.harvestingAndThreshing.data
        },
        cleaningAndDrying: {
          label: $translate.instant('Cleaning & drying'),
          id: 'cd',
          visible: showThirdGroup,
          data: data.cleaningAndDrying.data
        },
        grainAndStrawYield: {
          label: $translate.instant('Grain and straw yield'),
          id: 'gstry',
          visible: showThirdGroup,
          data: data.grainAndStrawYield.data
        },
        foodSafety: {
          label: $translate.instant('Food safety'),
          id: 'fs',
          visible: showFourthGroup,
          data: data.foodSafety.data
        },
        workerHealthSafety: {
          label: $translate.instant('Worker health & safety'),
          id: 'whs',
          visible: showFourthGroup,
          data: data.workerHealthSafety.data
        },
        childLabor: {
          label: $translate.instant('Child labor'),
          id: 'cl',
          visible: showFourthGroup,
          data: data.childLabor.data
        },
        womenEmpowerment: {
          label: $translate.instant('Women empowerment'),
          id: 'we',
          visible: showFourthGroup,
          data: data.womenEmpowerment.data
        },
        pesticideUseEfficiency: {
          label: $translate.instant('Pesticide Use Efficiency'),
          id: 'pue',
          visible: showFourthGroup,
          data: data.pesticideUseEfficiency.data
        }
        /*,
        foodSecurity: {
          label: $translate.instant('Food security'),
          id: 'fse',
          visible: showFourthGroup,
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

  return Seasonlong;
})





