'use strict';

angular.module('fieldCalculator')
.config(function($stateProvider, $urlRouterProvider,
  $urlMatcherFactoryProvider, $breadcrumbProvider,
  TEMPLATE_URL, QUESTIONNAIRE_URL) {
  // everything state or route related, let's keep em clean
  $urlMatcherFactoryProvider.caseInsensitive(true);
  $urlMatcherFactoryProvider.strictMode(false);
  $urlRouterProvider.otherwise('/');

  $breadcrumbProvider.setOptions({
    prefixStateName: 'main',
    template: 'bootstrap3',
    includeAbstract: true
  });

  $stateProvider
    .state('logged-out', {
      url: '/',
      abstract: true,
      templateUrl: TEMPLATE_URL + 'logged-out.html',
      resolve: {
        auth: function($q, $state, Authentication) {
          return $q(function(resolve, reject) {
            Authentication.verify()
              .then(function(response) {
                if (response) {
                  $state.go('main');
                }
                resolve();
              }).catch(function() {
                reject();
              });
          });
        }
      },
      ncyBreadcrumb: {
        skip: true
      },
    })
    .state('logged-out.login', {
      url: '',
      templateUrl: TEMPLATE_URL + 'login.html',
      controller: 'LoginCtrl as lc',
      ncyBreadcrumb: {
        skip: true
      },
    })
    .state('logged-out.register', {
      url: 'register',
      templateUrl: TEMPLATE_URL + 'register.html',
      controller: 'RegisterCtrl as rc',
      ncyBreadcrumb: {
        skip: true
      },
    })
    .state('main', {
      url: '/main',
      templateUrl: TEMPLATE_URL + 'main.html',
      controller: 'MainCtrl as mc',
      resolve: {
        auth: function($q, $state, Authentication) {
          return $q(function(resolve, reject) {
            Authentication.verify()
              .then(function(response) {
                if (!response) {
                  $state.go('logged-out.login');
                }

                resolve();
              }).catch(function() {
                $state.go('logged-out.login');
                reject();
              });
          });
        }
      },
      ncyBreadcrumb: {
        label: 'Home'
      }
    })
    .state('main.farmers', {
      url: '/farmers',
      templateUrl: TEMPLATE_URL + 'farmers/index.html',
      controller: 'FarmerCtrl as fc',
      ncyBreadcrumb: {
        label: 'Farmers',
        parent: 'main'
      }
    })
    .state('main.new-farmer', {
      url: '/new-farmer',
      templateUrl: TEMPLATE_URL + 'farmers/new.html',
      controller: 'NewFarmerCtrl as nfc',
      ncyBreadcrumb: {
        label: 'New Farmer',
        parent: 'main.farmers'
      }
    })
    .state('main.edit-farmer', {
      url: '/edit-farmer/:farmerId',
      templateUrl: TEMPLATE_URL + 'farmers/edit.html',
      resolve: {
        FarmerInfo: function($stateParams, Farmers) {
          return Farmers.get($stateParams.farmerId);
        },
        CountriesInfo: function(Countries) {
          return Countries.getCountries();
        }
        /*FarmerInfo: function($stateParams, $db, $q) {
          return $q(function(resolve, reject) {
            $db.get('farmers', $stateParams.farmerId).done(function(obj) {
              console.log(obj);
              resolve(obj);
            });
          });
        }*/
      },
      controller: 'EditFarmerCtrl as efc',
      ncyBreadcrumb: {
        label: 'Update Farmer',
        parent: 'main.farmers'
      }
    })
    .state('main.seasons', {
      url: '/seasons/:farmerId',
      templateUrl: TEMPLATE_URL + 'seasons/index.html',
      controller: 'SeasonsCtrl as sc',
      ncyBreadcrumb: {
        label: 'Seasons',
        parent: 'main.farmers'
      },
      resolve: {
        FarmerInfo: function($stateParams, Farmers) {
          return Farmers.get($stateParams.farmerId);
        },
        FarmerSeasons: function($stateParams, Seasons) {
          return Seasons.getAllByFarmerId($stateParams.farmerId);
        }
      }
    })
    .state('main.new-season', {
      url: '/seasons/new-season/:farmerId',
      templateUrl: TEMPLATE_URL + 'seasons/new.html',
      controller: 'NewSeasonCtrl as nsc',
      ncyBreadcrumb: {
        label: 'New Season',
        parent: 'main.seasons'
      },
      resolve: {
        FarmerInfo: function($stateParams, Farmers) {
          return Farmers.get($stateParams.farmerId);
        }
      }
    })
    .state('main.edit-season', {
      url: '/seasons/edit-season/:farmerId/:seasonId',
      templateUrl: TEMPLATE_URL + 'seasons/edit.html',
      controller: 'EditSeasonCtrl as esc',
      ncyBreadcrumb: {
        label: 'Edit Season',
        parent: 'main.seasons'
      },
      resolve: {
        FarmerInfo: function($stateParams, Farmers) {
          return Farmers.get($stateParams.farmerId);
        },
        FarmerSeason: function($stateParams, Seasons) {
          return Seasons.get($stateParams.seasonId);
        }
      }
    })
    .state('main.farmeroptions', {
      url: '/farmer-options/:farmerId/:seasonId',
      templateUrl: TEMPLATE_URL + 'farmer-options/index.html',
      controller: 'FarmerOptionsCtrl as foc',
      ncyBreadcrumb: {
        label: 'Questionnaires',
        parent: 'main.seasons'
      },
      resolve: {
        FarmerInfo: function($stateParams, Farmers) {
          return Farmers.get($stateParams.farmerId);
        },
        FarmerSeason: function($stateParams, Seasons) {
          return Seasons.get($stateParams.seasonId);
        }
      }
    })
    .state('main.seasonlong', {
      url: '/season-long/:farmerId/:seasonId',
      templateUrl: QUESTIONNAIRE_URL + 'season-long/index.html',
      controller: 'SeasonlongCtrl as sc',
      ncyBreadcrumb: {
        label: 'Season long',
        parent: 'main.farmeroptions'
      },
      resolve: {
        FarmerInfo: function($stateParams, Farmers) {
          return Farmers.get($stateParams.farmerId);
        },
        FarmerSeason: function($stateParams, Seasons) {
          return Seasons.get($stateParams.seasonId);
        }
      }
    })
    .state('main.seasonlongSaved', {
      url: '/season-long-saved/:farmerId/:seasonId',
      templateUrl: QUESTIONNAIRE_URL + 'season-long/saved.html',
      controller: 'SeasonlongSavedCtrl as ssc',
      ncyBreadcrumb: {
        label: 'Season long Saved',
        parent: 'main.seasonlong'
      },
      resolve: {
        FarmerInfo: function($stateParams, Farmers) {
          return Farmers.get($stateParams.farmerId);
        },
        FarmerSeason: function($stateParams, Seasons) {
          return Seasons.get($stateParams.seasonId);
        }
      }
    })
    .state('main.householdSurvey', {
      url: '/household-survey/:farmerId/:seasonId',
      templateUrl: QUESTIONNAIRE_URL + 'household-survey/index.html',
      controller: 'HouseholdSurveyCtrl as hsc',
      ncyBreadcrumb: {
        label: 'Household Survey',
        parent: 'main.farmeroptions'
      },
      resolve: {
        FarmerInfo: function($stateParams, Farmers) {
          return Farmers.get($stateParams.farmerId);
        },
        FarmerSeason: function($stateParams, Seasons) {
          return Seasons.get($stateParams.seasonId);
        }
      }
    })
    .state('main.householdSurveySaved', {
      url: '/household-survey-saved/:farmerId/:seasonId',
      templateUrl: QUESTIONNAIRE_URL + 'household-survey/saved.html',
      controller: 'HouseholdSurveySavedCtrl as hssc',
      ncyBreadcrumb: {
        label: 'Household Survey Saved',
        parent: 'main.householdSurvey'
      },
      resolve: {
        FarmerInfo: function($stateParams, Farmers) {
          return Farmers.get($stateParams.farmerId);
        },
        FarmerSeason: function($stateParams, Seasons) {
          return Seasons.get($stateParams.seasonId);
        }
      }
    })
    .state('main.assessmentSuggestion', {
      url: '/season-long-assessment-suggestion/:farmerId/:seasonId',
      templateUrl: QUESTIONNAIRE_URL + 'season-long/assessment-suggestion.html',
      controller: 'AssessmentSuggestionCtrl as asc',
      ncyBreadcrumb: {
        label: 'Assessment and Suggestion',
        parent: 'main.seasonlong'
      },
      resolve: {
        FarmerInfo: function($stateParams, Farmers) {
          return Farmers.get($stateParams.farmerId);
        },
        FarmerSeason: function($stateParams, Seasons) {
          return Seasons.get($stateParams.seasonId);
        },
        Suggestion: function($stateParams, SeasonlongSuggestion) {
          return SeasonlongSuggestion.getSuggestion($stateParams.farmerId, $stateParams.seasonId);
        }
      }
    })
    .state('main.householdAssessmentSuggestion', {
      url: '/household-survey-assessment-suggestion/:farmerId/:seasonId',
      templateUrl: QUESTIONNAIRE_URL + 'season-long/assessment-suggestion.html',
      controller: 'HouseholdAssessmentSuggestionCtrl as asc',
      ncyBreadcrumb: {
        label: 'Assessment and Suggestion',
        parent: 'main.householdSurvey'
      },
      resolve: {
        FarmerInfo: function($stateParams, Farmers) {
          return Farmers.get($stateParams.farmerId);
        },
        FarmerSeason: function($stateParams, Seasons) {
          return Seasons.get($stateParams.seasonId);
        },
        Suggestion: function($stateParams, HouseholdSuggestion) {
          return HouseholdSuggestion.getSuggestion($stateParams.farmerId, $stateParams.seasonId);
        }
      }
    })
    .state('main.graphics', {
      url: '/graphics',
      templateUrl: TEMPLATE_URL + 'graphics/index.html',
      controller: 'GraphicsCtrl as gc',
      ncyBreadcrumb: {
        label: 'Season Long - Graphical Display',
        parent: 'main'
      }
    })
    .state('main.download', {
      url: '/download',
      templateUrl: TEMPLATE_URL + 'download/index.html',
      controller: 'DownloadCtrl as dl',
      ncyBreadcrumb: {
        label: 'Season Long - Download',
        parent: 'main'
      }
    })
    .state('main.graphicsHousehold', {
      url: '/household-graphics',
      templateUrl: TEMPLATE_URL + 'graphics/household.html',
      controller: 'GraphicsHouseholdCtrl as gc',
      ncyBreadcrumb: {
        label: 'Household Survey - Graphical Display',
        parent: 'main'
      }
    })
    .state('main.downloadHousehold', {
      url: '/household-download',
      templateUrl: TEMPLATE_URL + 'download/household.html',
      controller: 'DownloadHouseholdCtrl as dl',
      ncyBreadcrumb: {
        label: 'Household Survey - Download',
        parent: 'main'
      }
    })
    .state('main.importFarmersOutputPage', {
      url: '/import/farmers-output-page',
      templateUrl: TEMPLATE_URL + 'import/farmers-output-page.html',
      controller: 'ImportFarmersOutputPage as ifo',
      ncyBreadcrumb: {
        label: 'Import Farmer\'s Output Page',
        parent: 'main'
      }
    })
    .state('main.importFarmersOutputPageHousehold', {
      url: '/import/farmers-output-page-household',
      templateUrl: TEMPLATE_URL + 'import/farmers-output-page-household.html',
      controller: 'ImportFarmersOutputPageHousehold as ifo',
      ncyBreadcrumb: {
        label: 'Import Farmer\'s Output Page - Household',
        parent: 'main'
      }
    })
    .state('main.pageNotFound', {
      url: '/404',
      templateUrl: TEMPLATE_URL + 'page-not-found/index.html',
      ncyBreadcrumb: {
        label: 'Page Not Found'
      }
    });
})
.run(function($templateCache, $compile, $rootScope) {
  // let's compile those templates and cache em
  var templatesHTML = $templateCache.get('field-calculatorTemplates');
  $compile(templatesHTML)($rootScope);

  // debugger for stateProvider since it doesn't return errors by default
  $rootScope.$on("$stateChangeError", function(event, toState, toParams, fromState, fromParams, error) {
    console.log(error);
  });

  $rootScope.$on('$stateChangeSuccess', function() {
    document.body.scrollTop = document.documentElement.scrollTop = 0;
  });
});
