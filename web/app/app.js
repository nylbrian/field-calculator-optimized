'use strict';

angular.module('field-calculatorTemplates', []);
angular.module('db', []);
angular.module('fieldCalculator', [
  'ngCookies',
  'ngAnimate',
  'ngResource',
  'ngMessages',
  'ui.bootstrap',
  'ui.router',
  'ui.router.stateHelper',
  'chart.js',
  'duScroll',
  'db',
  'ncy-angular-breadcrumb',
  'ui.multiselect',
  'pascalprecht.translate',
  'angularFileUpload',
  'field-calculatorTemplates'
])
.constant('TEMPLATE_URL', 'app/views/common/')
.constant('COMMON_DIRECTIVE_URL', 'app/views/directives/common/')
.constant('DIRECTIVE_URL', 'app/views/directives/')
.constant('SEASON_DIRECTIVE_URL', 'app/views/directives/season-long/')
.constant('QUESTIONNAIRE_URL', 'app/views/common/questionnaires/')
.constant('HOUSEHOLD_DIRECTIVE_URL', 'app/views/directives/household-survey/')
.constant('MODAL_URL', 'app/views/modal/')
.constant('IMAGE_URL', 'assets/images/')
.constant('API_URL', '../rest/index.php?request=:controller/:action/:id/:paramOne/:paramTwo/:paramThree/:paramFour')
.constant('DOWNLOAD_URL', '../download/index.php?')
.constant('DOWNLOAD_HOUSEHOLD_URL', '../download/index-household.php?')
.constant('IMPORT_URL', '../download/import.php?')
.constant('IMPORT_URL_HOUSEHOLD', '../download/import-household.php?')
.constant('JSON_URL', 'json/')
.config(function($animateProvider) {
  $animateProvider.classNameFilter(/\banimated\b/);
})
.config(function($translateProvider) {
  // set everything we need for translations
  $translateProvider
    .useStaticFilesLoader({
      prefix: 'translations/',
      suffix: '.json'
    })
    .preferredLanguage('cn')
    .fallbackLanguage(['en'])
    .useSanitizeValueStrategy('escape')
    .useLocalStorage()
    .useMissingTranslationHandler('missingTranslationFactory')
    .usePostCompiling(true);
}).factory('missingTranslationFactory', function() {
  // this shouldn't be here but this is what it only does
  return function(translationId) {
    return translationId;
  }
});
