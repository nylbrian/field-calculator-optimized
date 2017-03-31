'use strict';

angular.module('fieldCalculator')
.controller('GraphicsCtrl', function(DropdownValues, Countries, Graphics, TreatmentNames) {
  var _this = this;

  _this.data = {};
  _this.displayGraph = false;
  _this.loading = false;
  _this.categoryNames = DropdownValues.categoryNames();
  _this.inputInformation = DropdownValues.inputInformation();
  _this.sustainabilityIndicators = DropdownValues.sustainabilityIndicators();
  _this.graphTypes = DropdownValues.graphTypes();
  _this.seasons = DropdownValues.seasons();
  _this.years = [2015, 2016, 2017, 2018, 2019, 2020, 2021];

  Countries.getAll().then(function(response) {
    _this.countries = response;
    _this.regions = [];
  });

  _this.canDisplay = function() {
    if (_this.loading) {
      return false;
    }

    return true;
  };

  _this.display = function() {
    _this.loading = true;
    _this.errorMessage = '';

    if (angular.isArray(_this.data.country) &&
      _this.data.country.length > 0) {
      _this.data['country_ids'] = [];
      angular.forEach(_this.data.country, function(item) {
        _this.data['country_ids'].push(item.id);
      });
    }

    if (angular.isArray(_this.data.year) &&
      _this.data.year.length > 0) {
      _this.data['year_ids'] = [];
      angular.forEach(_this.data.year, function(item) {
        _this.data['year_ids'].push(item);
      });
    }

    if (angular.isArray(_this.data.season) &&
      _this.data.season.length > 0) {
      _this.data['season_ids'] = [];
      angular.forEach(_this.data.season, function(item) {
        _this.data['season_ids'].push(item.value);
      });
    }

    Graphics.generate(_this.data)
      .then(function(response) {
        if (response.status !== 'success') {
          _this.errorMessage = response.error;
        } else {
          _this.loadGraph(response.data);
        }
      })
      .catch(function() {
        _this.errorMessage = 'An unexpected error has occured';
      })
      .finally(function() {
        _this.loading = false;
      });
  };

  _this.hideGraph = function() {
    _this.displayGraph = false;
  }

  _this.loadGraph = function(graphData) {
    _this.graphs = graphData.data;
    _this.graphType = graphData.type;

    if (_this.graphType === 'radar') {
      angular.forEach(_this.graphs, function(item) {
        item.countryName = Countries.getCountryName(item.country);
        item.graphOptions = {
          legend: {
            display: true,
            position: 'right',
            fullWidth: true
          },
          scale: {
            pointLabels: {
              fontSize: 12,
              fontStyle: 'bold'
            },
            ticks: {
              stepSize: 0.1,
              callback: function(tick, index, ticks) {
                return tick.toFixed(2);
              }
            }
          }
        };

        item.graphLabels = _this.getLabels(graphData.labels.y);
        item.graphSeries = _this.getSeriesName(
          graphData.category,
          graphData.labels.x);
        item.graphData = item.scaled;
      });
    }

    if (_this.graphType === 'bar') {
      _this.graphDisplay = graphData.display;
      if (graphData.display === 'single') {
        angular.forEach(_this.graphs, function(item) {
          item.graphOptions = {
            legend: {
              display: true,
              position: 'right',
              fullWidth: true
            },
            tooltips: {
              callbacks: {
                label: function(tooltipItem, data) {
                  return ' ' + data.datasets[tooltipItem.datasetIndex].label +
                    ': ' + item.actual[tooltipItem.datasetIndex][tooltipItem.index];
                }
              }
            }
          };

          item.graphLabels = _this.getLabels(graphData.labels.y);
          item.graphSeries = _this.getSeriesName(
            graphData.category,
            graphData.labels.x);
          item.graphData = item.scaled;
        });
      } else {
        angular.forEach(_this.graphs, function(item) {
          item.graphOptions = {
            legend: {
              display: true,
              position: 'right',
              fullWidth: true
            },
            tooltips: {
              callbacks: {
                label: function(tooltipItem, data) {
                  return ' ' + data.datasets[tooltipItem.datasetIndex].label +
                    ': ' + item.actual[tooltipItem.datasetIndex][tooltipItem.index];
                }
              }
            }
          };

          item.graphLabel = _this.getLabel(item.label);
          item.graphLabels = _this.getCountryNames(item.labels.y);
          item.graphSeries = _this.getSeriesName(
            graphData.category,
            graphData.labels.x);
          item.graphData = item.scaled;
        });
      }
    }

    _this.displayGraph = true;
  }

  _this.getCountryNames = function(countries) {
    var names = [];
    angular.forEach(countries, function(item) {
      names.push(Countries.getCountryName(item));
    });

    return names;
  };

  _this.getLabel = function(label) {
    var indicators = DropdownValues.sustainabilityIndicatorGraph();
    var returnlabel;

    angular.forEach(indicators, function(item) {
      if (item.value == label) {
        returnlabel = item.name;
      }
    });

    return returnlabel;
  }

  _this.getLabels = function(labels) {
    var indicators = DropdownValues.sustainabilityIndicatorGraph();
    var returnlabel = [];
    for (var i = 0; i < labels.length; i++) {
      var found = false;
      angular.forEach(indicators, function(item) {
        if (item.value == labels[i]) {
          returnlabel.push(item.name);
          found = true;
        }
      });

      if (!found) {
        returnlabel.push(labels[i]);
      }
    }

    return returnlabel;
  }

  _this.getSeriesName = function(category, labels) {
    switch (category) {
      case 1:
        var labels = DropdownValues.yieldGapNames();
        return [
          labels[1].name,
          labels[2].name,
          labels[3].name
        ];
      break;
      case 2:
        var treatmentNames = TreatmentNames.getCountriesList();
        var list = {};
        list = angular.extend(list, treatmentNames.getVietnam());
        list = angular.extend(list, treatmentNames.getThailand());
        list = angular.extend(list, treatmentNames.getIndonesia());
        list = angular.extend(list, treatmentNames.getMyanmar());
        list = angular.extend(list, treatmentNames.getChina());
        list = angular.extend(list, treatmentNames.getSriLanka());
        list = angular.extend(list, treatmentNames.getDefault());

        var returnLabel = [];
        for (var i = 0; i < labels.length; i++) {
          var found = false;
          angular.forEach(list, function(item) {
            if (item.value === labels[i]) {
              returnLabel.push(item.name);
              found = true;
            }
          })

          if (!found) {
            returnLabel.push(labels[i]);
          }
        }

        return returnLabel;
      break;
      case 3:
        var labels = DropdownValues.landCropEstablishment();
        return [
          labels[1].name,
          labels[2].name
        ];
      break;
    }
  }

  /*_this.labels = [
    "Eating",
    "Drinking",
    "Sleeping",
    "Designing",
    "Coding",
    "Cycling",
    "Running",
    "Temp",
    "Tempting"
  ];

  _this.series = [
    'Upper 10%',
    'Lower 10%',
  ];

  _this.data = [
    [65, 59, 90, 81, 56, 55, 40, 199, 299],
    [28, 48, 40, 19, 96, 27, 100, 199, 299]
  ];

  _this.chartOptions = {
    legend: {
      display: true,
      position: 'right',
      fullWidth: true
    }
  };

  _this.labelsBar = ['2006', '2007', '2008', '2009', '2010', '2011', '2012'];
  _this.seriesBar = ['Series A', 'Series B'];
  _this.dataBar = [
    [65, 59, 80, 81, 56, 55, 40],
    [28, 48, 40, 19, 86, 27, 90]
  ];*/

});
