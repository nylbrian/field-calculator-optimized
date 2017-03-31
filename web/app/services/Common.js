'use strict';

angular.module('fieldCalculator')
.service('Common', function() {
  var Common = {
    addDate: function(d, period) {
      if (typeof d !== 'undefined') {
        d = new Date(d);
      } else {
        d = new Date();
      }

      if (typeof period !== 'undefined') {
        if (period == 1) {
          period = 0;
        }
        d.setDate(d.getDate() + period);
      }
      return d;
    },
    displayErrorModal: function(errorMessage) {
      console.log(errorMessage);
    },
    displayDate: function(d, period) {
      var monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
      ];

      if (typeof d !== 'undefined') {
        d = new Date(d);
      } else {
        d = new Date();
      }

      if (typeof period !== 'undefined') {
        if (period == 1) {
          period = 0;
        }
        d.setDate(d.getDate() + period);
      }

      var dd = d.getDate();
      var mm = monthNames[d.getMonth()];
      var y = d.getFullYear();

      return mm + ' '+ dd + ', '+ y;
    },
    formatDate: function(date) {
      return new Date(date);
    },
    isValidDateField: function(form) {
      if (form.$error && form.$error.dateDisabled) {
        return false;
      }

      return true;
    },
    range: function(min, max, step) {
      step = step || 1;
      var input = [];
      for (var i = min; i <= max; i += step) {
        input.push(i);
      }
      return input;
    },
    setDirty: function(obj) {
      angular.forEach(obj, function(value) {
        value.$touched = true;
        value.$dirty = true;

        if (angular.isDefined(value.$error.dateDisabled)) {
          Common.setTouched(value.$error.dateDisabled);
        }
      });
    },
    setTouched: function(obj) {
      angular.forEach(obj, function(value) {
        value.$touched = true;
        value.$dirty = true;

        if (angular.isDefined(value.$error.required)) {
          Common.setTouched(value.$error.required);
        }
      });
    },
    validateField: function(form, item) {
      if (!angular.isDefined(form) || !angular.isObject(form) ||
        !item || !angular.isObject(form[item])) {
        return {};
      }

      var keys = Object.keys(form[item].$error);
      var length = keys.length;

      return {
        'has-error': length > 0 && (form[item].$touched || form[item].$dirty)
      }
    }
  };

  return Common;
});
