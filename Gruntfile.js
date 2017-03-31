module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    uglify: {
      build: {
        files: [{
          src: ['web/min-safe/app.js'],
          dest: 'web/build/scripts.min.js',
        }]
      }
    },
    ngAnnotate: {
      dist: {
        files: [{
          expand: true,
          src: [
            'web/**/*.js',
            '!web/bower_components/ydn.db/*.js*',
            '!web/bower_components/**/*.min.js*',
            '!web/bower_components/**/*karma*',
            '!web/bower_components/**/*index.js*',
            '!web/bower_components/**/*config.js*',
            '!web/bower_components/**/*gulpfile.js*',
            '!web/bower_components/**/demo/**/*.js*',
            '!web/bower_components/**/src/**/*.js*',
            '!web/bower_components/**/examples/**/*.js*',
          ],
          dest: 'web/min-safe/'
        }],
      }
    },
    concat: {
      js: {
        src: [
          'web/min-safe/web/bower_components/angular/angular.js',
          'web/min-safe/web/bower_components/angular-translate/angular-translate.js',
          'web/min-safe/web/bower_components/chart/dist/Chart.js',
          'web/min-safe/web/bower_components/chart/dist/Chart.bundle.js',
          'web/min-safe/web/bower_components/**/*.js',
          'web/assets/js/ui-bootstrap.min.js',
          'web/assets/js/ui-bootstrap-tpls.min.js',
          'web/min-safe/web/app/app.js',
          'web/min-safe/web/app/db/db.js',
          'web/min-safe/web/app/db/dbHelper.js',
          'web/min-safe/web/app/db/Rest.js',
          'web/min-safe/web/app/db/RestService.js',
          'web/min-safe/web/app/db.js',
          'web/min-safe/web/app/routes.js',
          'web/min-safe/templates.html.js',
          'web/min-safe/web/app/**/*.js'
        ],
        dest: 'web/min-safe/app.js'
      }
    },
    html2js: {
      options: {
        base: 'web/app/',
        module: 'field-calculatorTemplates',
        singleModule: true,
        useStrict: true,
        htmlmin: {
          collapseBooleanAttributes: true,
          collapseWhitespace: true,
          removeAttributeQuotes: true,
          removeComments: true,
          removeEmptyAttributes: true,
          removeRedundantAttributes: true,
          removeScriptTypeAttributes: true,
          removeStyleLinkTypeAttributes: true
        }
      },
      main: {
        src: ['web/app/views/**/*.html'],
        dest: 'web/min-safe/templates.html.js',
      }
    },
    cssmin: {
      options: {
        shorthandCompacting: false,
        roundingPrecision: -1
      },
      target: {
        files: {
          'web/build/styles.min.css': [
            'web/assets/css/default.css',
            'web/assets/css/effects.css',
            'web/assets/css/login.css',
            'web/assets/css/tables.css',
            'web/assets/css/forms.css'
          ]
        }
      }
    },
    i18nextract: {
      key_as_text: {
        suffix: '.json',
        src: ['web/app/**/*.js', 'web/app/**/*.html', 'web/index.php'],
        lang: ['en', 'cn'],
        stringifyOptions: true,
        nullEmpty: true,
        dest: 'web/translations',
        keyAsText: true
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-ng-annotate');
  grunt.loadNpmTasks('grunt-html2js');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-angular-translate');

  // Default task(s).
  grunt.registerTask('default', ['ngAnnotate', 'html2js', 'concat', 'uglify', 'cssmin', 'i18nextract']);
};
