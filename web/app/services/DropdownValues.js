'use strict';

angular.module('fieldCalculator')
.service('DropdownValues', function($translate) {
  return {
    categoryNames: function() {
      return {
        1: {name: $translate.instant('Yield Gap'), value: 1},
        2: {name: $translate.instant('Treatment'), value: 2},
        3: {name: $translate.instant('Crop Establishment Method'), value: 3},
      };
    },
    combineHarvester: function() {
      return {
        1: {name: $translate.instant('Farmers own'), value: 1},
        2: {name: $translate.instant('Custom hiring from private agencies'), value: 2},
        3: {name: $translate.instant('Government subsidized'), value: 3},
        4: {name: $translate.instant('Farmers association'), value: 4},
      };
    },
    directSowingMethod: function() {
      return {
        1: {name: $translate.instant('Dry soil tillage and direct sowing of seed (Dry-DSR)'), value: 1},
        2: {name: $translate.instant('Wet tillage and direct sowing of soaked seed (Wet-DSR)'), value: 2}
      };
    },
    dryThreshedGrain: function() {
      return {
        1: {name: $translate.instant('Sun drying'), value: 1},
        2: {name: $translate.instant('Mechanical flat bed dryer'), value: 2},
        3: {name: $translate.instant('Mechanical columnar dryer'), value: 3},
        4: {name: $translate.instant('Bubble dryer'), value: 4},
        5: {name: $translate.instant('None'), value: 5}
      };
    },
    economicCondition: function() {
      return {
        1: {name: $translate.instant('Rich'), value: 1},
        2: {name: $translate.instant('Average'), value: 2},
        3: {name: $translate.instant('Poor'), value: 3},
        4: {name: $translate.instant('Very poor'), value: 4}
      };
    },
    economicCondition3Years: function() {
      return {
        1: {name: $translate.instant('Improve'), value: 1},
        2: {name: $translate.instant('Unchanged'), value: 2},
        3: {name: $translate.instant('Get worse'), value: 3}
      };
    },
    employmentBelow18: function() {
      return {
        1: {name: $translate.instant('Children below the minimum age are working on farm, but there are deliberate and evidenced efforts to stop the children from working and to place them in education'), value: 1},
        2: {name: $translate.instant('Children below the minimum age are working on the farm, and no deliberate and evidenced efforts were made to stop the children from working and to place them in education'), value: 2}
      };
    },
    noChildrenBelowMinimumAge: function() {
      return {
        1: {name: $translate.instant('They perform light, age appropriate duties'), value: 1},
        2: {name: $translate.instant('The work is not harmful to their health and development'), value: 2},
        3: {name: $translate.instant('The work does not interfere with their education'), value: 3},
        4: {name: $translate.instant('The work does not exceed 14 hours per week'), value: 4},
        5: {name: $translate.instant('They are always supervised by an adult'), value: 5},
      };
    },
    evidenceBelow18: function() {
      return {
        1: {name: $translate.instant('There are no children below 18 years working on the farm'), value: 1},
        2: {name: $translate.instant('Children below 18 years are working on the farm and all listed conditions are met'), value: 2},
        3: {name: $translate.instant('Children below 18 years are working on the farm and they use harvest knives, but all of the other listed conditions are met'), value: 3},
        4: {name: $translate.instant('Children below 18 years are working on the farm, and one or more of the other listed conditions are not met'), value: 4}
      };
    },
    facilityApplicators: function() {
      return {
        1: {name: $translate.instant('There are no workers employed who apply pesticides'), value: 1},
        2: {name: $translate.instant('Washing and changing facilities are available'), value: 2},
        3: {name: $translate.instant('A washing or changing facility is available'), value: 3},
        4: {name: $translate.instant('No washing or changing facility is available'), value: 4}
      };
    },
    fertilizerApplication: function() {
      return {
        1: {name: $translate.instant('Leaf color chart(LCC)'), value: 1},
        2: {name: $translate.instant('RCM recommendation'), value: 2},
        3: {name: $translate.instant('Government recommendation'), value: 3},
        4: {name: $translate.instant('Neighboring friend\'s recommendation'), value: 4},
        5: {name: $translate.instant('Own past experiences'), value: 5},
        6: {name: $translate.instant('Others (specify)'), value: 6}
      };
    },
    fertilizerTypes: function() {
      return [
        {name: $translate.instant('Urea'), value: 'urea'},
        {name: $translate.instant('DAP'), value: 'dap'},
        {name: $translate.instant('MOP'), value: 'mop'},
        {name: $translate.instant('Ammonium sulphate'), value: 'ammoniumSulphate'},
        {name: $translate.instant('Complete'), value: 'complete'},
        {name: $translate.instant('Solophos'), value: 'solophos'}
      ];
    },
    graphTypes: function() {
      return [
        {name: $translate.instant('Radar'), value: 'radar'},
        {name: $translate.instant('Bar'), value: 'bar'}
      ];
    },
    gender: function() {
      return [
        {name: $translate.instant('Male'), value: 1},
        {name: $translate.instant('Female'), value: 2}
      ];
    },
    harvestingMethod: function() {
      return {
        1: {name: $translate.instant('Combine harvesting and threshing'), value: 1},
        2: {name: $translate.instant('Manual cutting and manual threshing'), value: 2},
        3: {name: $translate.instant('Manual cutting and mechanical threshing'), value: 3},
        4: {name: $translate.instant('Mechanical cutting and mechanical threshing'), value: 4}
      };
    },
    herbicideLeftOver: function() {
      return {
        1: {name: $translate.instant('1/2'), value: 1},
        2: {name: $translate.instant('2/3'), value: 2},
        3: {name: $translate.instant('1/3'), value: 3},
        4: {name: $translate.instant('1/4'), value: 4},
        5: {name: $translate.instant('None'), value: 5}
      };
    },
    householdTraining: function() {
      return {
        1: {name: $translate.instant('General agriculture'), value: 1},
        2: {name: $translate.instant('Rice (anything related)'), value: 2},
        3: {name: $translate.instant('Pesticide use'), value: 3},
        4: {name: $translate.instant('Vegetable crops'), value: 4},
        5: {name: $translate.instant('None-agriculture (Specify)'), value: 5}
      };
    },
    inputInformation: function() {
      return {
        1: {name: $translate.instant('Seed rate'), value: 'seedRate'},
        2: {name: $translate.instant('Nitrogen amount'), value: 'nitrogenAmount'},
        3: {name: $translate.instant('Phosphorus amount'), value: 'phosphorusAmount'},
        4: {name: $translate.instant('Potassium amount'), value: 'potassiumAmount'},
        5: {name: $translate.instant('No. of N application (Nitrogen count)'), value: 'nApplication'},
        6: {name: $translate.instant('Number of irrigation'), value: 'nIrrigation'}
      };
    },
    irrigationMethod: function() {
      return {
        1: {name: $translate.instant('Irrigated - continuously flooded'), value: 1},
        2: {name: $translate.instant('Irrigated - Intermittently flooded - single aeration'), value: 2},
        3: {name: $translate.instant('Irrigated - Intermittently flooded - multiple aeration'), value: 3},
        4: {name: $translate.instant('Regular rainfed'), value: 4},
        5: {name: $translate.instant('Regular drought prone'), value: 5},
        6: {name: $translate.instant('Deep water'), value: 6},
        7: {name: $translate.instant('Irrigated - but water regime during rice cultivation unknown'), value: 7},
        8: {name: $translate.instant('Rainfed or deep water and water regime during the rice cultivation period unknown'), value: 8},
        9: {name: $translate.instant('Upland'), value: 9},
      };
    },
    irrigationRegime: function() {
      return {
        1: {name: $translate.instant('Irrigated'), value: 1},
        2: {name: $translate.instant('Rainfed'), value: 2}
      };
    },
    irrigationSource: function() {
      return {
        1: {name: $translate.instant('Canal or river'), value: 1},
        2: {name: $translate.instant('Groundwater'), value: 2},
        3: {name: $translate.instant('Pumping from the nearby cancal or reservoir'), value: 3}
      };
    },
    irrigationPumpSource: function() {
      return {
        1: {name: $translate.instant('Electric'), value: 1},
        2: {name: $translate.instant('Diesel'), value: 2}
      };
    },
    laborTypes: function() {
      return {
        1: {name: $translate.instant('Family labor'), value: 1},
        2: {name: $translate.instant('Hired labor'), value: 2},
        3: {name: $translate.instant('Both'), value: 3},
      };
    },
    landCropEstablishment: function() {
      return {
        1: {name: $translate.instant('Direct sowing'), value: 1},
        2: {name: $translate.instant('Transplanting'), value: 2}
      };
    },
    landRental: function() {
      return {
        1: {name: $translate.instant('Rented'), value: 1},
        2: {name: $translate.instant('Own'), value: 2},
        3: {name: $translate.instant('Contract'), value: 3},
        4: {name: $translate.instant('Share tenant'), value: 4}

      };
    },
    literacy: function() {
      return {
        1: {name: $translate.instant('Cannot read and write'), value: 1},
        2: {name: $translate.instant('Can sign only'), value: 2},
        3: {name: $translate.instant('Can read only'), value: 3},
        4: {name: $translate.instant('Can read and write'), value: 4}
      };
    },
    machineries: function() {
      return {
        1: {name: $translate.instant('Four wheel tractor'), value: 1},
        2: {name: $translate.instant('Two-wheel tractor/power tiller'), value: 2},
        3: {name: $translate.instant('Truck'), value: 3},
        4: {name: $translate.instant('Blade harrow'), value: 4},
        5: {name: $translate.instant('Treadle harrow'), value: 5},
        6: {name: $translate.instant('Rower pump'), value: 6},
        7: {name: $translate.instant('Sprinkler'), value: 7},
        8: {name: $translate.instant('Submersible pump'), value: 8},
        9: {name: $translate.instant('Electric motor pump'), value: 9},
        10: {name: $translate.instant('Diesel motor pump'), value: 10},
        11: {name: $translate.instant('Rice transplanting machine'), value: 11},
        12: {name: $translate.instant('Seed drill'), value: 12},
        13: {name: $translate.instant('Drum seeder'), value: 13},
        14: {name: $translate.instant('Rotovator'), value: 14},
        15: {name: $translate.instant('Weeder'), value: 15},
        16: {name: $translate.instant('Power sprayer'), value: 16},
        17: {name: $translate.instant('Harvester'), value: 17},
        18: {name: $translate.instant('Thresher'), value: 18},
        19: {name: $translate.instant('Mechanical thresher'), value: 19},
        20: {name: $translate.instant('Combined harvester and thresher'), value: 20}
      };
    },
    maritalStatus: function() {
      return {
        1: {name: $translate.instant('Single (never married)'), value: 1},
        2: {name: $translate.instant('Married'), value: 2},
        3: {name: $translate.instant('Divorced'), value: 3},
        4: {name: $translate.instant('Widow/widower'), value: 4}
      };
    },
    nurseryAreaField: function() {
      return {
        1: {name: $translate.instant('Together'), value: 1},
        2: {name: $translate.instant('Separately'), value: 2}
      };
    },
    operationName: function() {
      return {
        1: {name: $translate.instant('Plouging'), value: 1},
        2: {name: $translate.instant('Harrowing'), value: 2},
        3: {name: $translate.instant('Puddling'), value: 3},
        4: {name: $translate.instant('Levelling'), value: 4},
        5: {name: $translate.instant('Rotovator'), value: 5}
      };
    },
    organicMaterials: function() {
      return {
        1: {name: $translate.instant('Previous crop\'s straw'), real_name: 'Previous crop\'s straw', value: 1},
        2: {name: $translate.instant('Fresh compost'), real_name: 'Compost', value: 2},
        3: {name: $translate.instant('Fresh weight of cattle manure'), real_name: 'FYM', value: 3},
        4: {name: $translate.instant('Green manure'), real_name: 'Green manure', value: 4}
      };
    },
    ownershipStatus: function() {
      return {
        1: {name: $translate.instant('Own operated'), value: 1},
        2: {name: $translate.instant('Rented/leased in cash/kind'), value: 2},
        3: {name: $translate.instant('Rented/leased in/share'), value: 3},
        4: {name: $translate.instant('Rented leased out/share'), value: 4},
        5: {name: $translate.instant('Rented leased/out cash'), value: 5},
        6: {name: $translate.instant('Mortgaged in'), value: 6},
        7: {name: $translate.instant('Mortgaged out'), value: 7}
      };
    },
    pesticideApplied: function() {
      return {
        1: {name: $translate.instant('There is no use of pesticide'), value: 1},
        2: {name: $translate.instant('Pesticides are not applied by pregnant or lactating women or by children below 18 years age, or by person who suffer from chronic or respiratory diseases'), value: 2},
        3: {name: $translate.instant('Pesticides are applied by pregnant or lactating women or children below 18 years, or by person who suffer from chronic or respiratory diseases'), value: 3}
      };
    },
    pesticideApplication: function() {
      return {
        1: {name: $translate.instant('Knap Sac spray'), value: 1},
        2: {name: $translate.instant('Power spray'), value: 2},
        3: {name: $translate.instant('Boom spray'), value: 3},
        4: {name: $translate.instant('Tank mix and motorized spray'), value: 4},
        5: {name: $translate.instant('Other (specify)'), value: 5}
      };
    },
    pesticideApplicatorUse: function() {
      return {
        1: {name: $translate.instant('There is no use of pesticide'), value: 1},
        2: {name: $translate.instant('Pesticide applicators use at least three among (glove, mask, boots, protective clothing), but always use gloves of good quality, and clothing is washed after use'), value: 2},
        3: {name: $translate.instant('Pesticide applicator use at least two (gloves, masks, boots, protective clothing), but always gloves of good quality, and clothing is washed after use'), value: 3},
        4: {name: $translate.instant('Pesticide applicators use fewer than two of the four items, or do not use gloves, or use items of low quality, or clothing is not washed after use'), value: 4}
      };
    },
    pesticideCalibrated: function() {
      return {
        1: {name: $translate.instant('Few days ago'), value: 1},
        2: {name: $translate.instant('One month ago'), value: 2},
        3: {name: $translate.instant('1 year ago'), value: 3},
        4: {name: $translate.instant('2 years ago'), value: 4}
      };
    },
    pesticideCategory: function() {
      return {
        1: {name: $translate.instant('Insecticide'), value: 1},
        2: {name: $translate.instant('Fungicide'), value: 2},
        3: {name: $translate.instant('Molluscicide'), value: 3},
        4: {name: $translate.instant('Rodenticide'), value: 4},
      };
    },
    pesticideDisposed: function() {
      return {
        1: {name: $translate.instant('There is no use of pesticide'), value: 1},
        2: {name: $translate.instant('Farmer participate in a collection, return, or disposal system'), value: 2},
        3: {name: $translate.instant('Empty containers are rinsed three times with water and made unusable by crushing or puncturing before burying them on the farm and are not recycled'), value: 3},
        4: {name: $translate.instant('Surplus spray and wash water is applied over an unmanaged part of the farm, away from water bodies'), value: 4},
        5: {name: $translate.instant('Obsolete pesticides (date expired and banned) are returned to dealers or, if not possible, disposed of in a manner that minimize exposure to humans and environment'), value: 5},
        6: {name: $translate.instant('There is a collection, return, or disposal system, but it is not used. In the absence of such a system, empty pesticide containers and obsolete pesticides are not disposed as explained above'), value: 6}
      };
    },
    previousCrop: function() {
      return {
        1: {name: $translate.instant('Rice'), value: 1},
        2: {name: $translate.instant('Wheat'), value: 2},
        3: {name: $translate.instant('Maize'), value: 3},
        4: {name: $translate.instant('Vegetable'), value: 4},
        5: {name: $translate.instant('Potato'), value: 5},
        6: {name: $translate.instant('Fallow'), value: 6},
      };
    },
    primaryOccupation: function() {
      return {
        1: {name: $translate.instant('Jobless'), value: 1},
        2: {name: $translate.instant('Farmer'), value: 2},
        3: {name: $translate.instant('Tailor/weaver/sewer'), value: 3},
        4: {name: $translate.instant('Agriculture laborer'), value: 4},
        5: {name: $translate.instant('Carpentry/masonry'), value: 5},
        6: {name: $translate.instant('Driver'), value: 6},
        7: {name: $translate.instant('Community/village officer'), value: 7},
        8: {name: $translate.instant('Teacher'), value: 8},
        9: {name: $translate.instant('Factory worker'), value: 9},
        10: {name: $translate.instant('Other (Specify)'), value: 10}
      };
    },
    protectiveEquipments: function() {
      return {
        1: {name: $translate.instant('Gloves'), value: 1},
        2: {name: $translate.instant('Masks'), value: 2},
        3: {name: $translate.instant('Boots'), value: 3},
        4: {name: $translate.instant('Protective clothing'), value: 4}
      };
    },
    recommendedReEntry: function() {
      return {
        1: {name: $translate.instant('There is no use of pesticide'), value: 1},
        2: {name: $translate.instant('The recommendation, or re-entry after 48 hours is observed and communicated by placing warning signs in the field'), value: 2},
        3: {name: $translate.instant('The recommendation, or re-entry after 48 hours is observed and communicated verbally'), value: 3},
        4: {name: $translate.instant('The recommendation, or re-entry after 48 hours is not observed or not communicated'), value: 4}
      };
    },
    religion: function() {
      return {
        1: {name: $translate.instant('Buddhist'), value: 1},
        2: {name: $translate.instant('Christian'), value: 2},
        3: {name: $translate.instant('Hindu'), value: 3},
        4: {name: $translate.instant('Muslim'), value: 4},
        5: {name: $translate.instant('No religion'), value: 5},
        6: {name: $translate.instant('Others (Specify)'), value: 6},
      };
    },
    removedStraw: function() {
      return {
        1: {name: $translate.instant('Livestock feeding'), value: 1},
        2: {name: $translate.instant('Bioenergy'), value: 2},
        3: {name: $translate.instant('Mushroom production'), value: 3},
        4: {name: $translate.instant('Mulching material for other vegetable crops'), value: 4},
        5: {name: $translate.instant('Incorporated in the field'), value: 5}
      };
    },
    riceFieldProblems: function() {
      return [
        {name: $translate.instant('Insect'), value: 'insect'},
        {name: $translate.instant('Disease'), value: 'disease'},
        {name: $translate.instant('Snails'), value: 'snails'},
        {name: $translate.instant('Rats'), value: 'rats'},
        {name: $translate.instant('Birds'), value: 'birds'}
      ];
    },
    riceStrawHarvestManagement: function() {
      return {
        1: {name: $translate.instant('Retained in pile, not returned to field, and not burnt?'), value: 1},
        2: {name: $translate.instant('Retained in pile, and burnt'), value: 2},
        3: {name: $translate.instant('Removed from field and used for other purposes'), value: 3},
        4: {name: $translate.instant('Returned to field and spread across'), value: 4},
        5: {name: $translate.instant('50% (20-30 cm standing stubble) retained in the field and all incorporated'), value: 5},
        6: {name: $translate.instant('50% (20-30 cm standing stubble) retained in the field and all burned'), value: 6}
      };
    },
    safetyActivities: function() {
      return {
        1: {name: $translate.instant('No workers or working family members but first aid supplies are available on-farm'), value: 1},
        2: {name: $translate.instant('Workers, including working household members, receive regular safety instruction and first aid supplies are available on-farm'), value: 2},
        3: {name: $translate.instant('Workers, including working household members, receive regular safety instruction, but no first aid supplies are available on-farm'), value: 3},
        4: {name: $translate.instant('There is no safety instruction and no first aid supplies are available on-farm'), value: 4}
      };
    },
    schoolChildren: function() {
      return {
        1: {name: $translate.instant('There are no children living on the farm within the age of compulsory schooling'), value: 1},
        2: {name: $translate.instant('Children living on the farm within the age of compulsory schooling go to school all year long'), value: 2},
        3: {name: $translate.instant('Children living on the farm within the age of compulsory schooling, but not all year long'), value: 3},
        4: {name: $translate.instant('Children do not go to school but deliberate and evidenced efforts are made to place them in education, for example, by lobbying for a nearby school or by providing on-site schooling'), value: 4},
        5: {name: $translate.instant('Children do not go to school and on deliberate and evidenced efforts are made to place them in education'), value: 5},
      };
    },
    seasons: function() {
      return {
        1: {name: $translate.instant('Wet'), value: 1},
        2: {name: $translate.instant('Dry'), value: 2},
        3: {name: $translate.instant('Early'), value: 3},
        4: {name: $translate.instant('Late'), value: 4},
        5: {name: $translate.instant('Monsoon'), value: 5},
        6: {name: $translate.instant('Summer'), value: 6}
      };
    },
    secondaryOccupation: function() {
      return {
        1: {name: $translate.instant('Jobless'), value: 1},
        2: {name: $translate.instant('Farmer'), value: 2},
        3: {name: $translate.instant('Tailor/weaver/sewer'), value: 3},
        4: {name: $translate.instant('Agriculture laborer'), value: 4},
        5: {name: $translate.instant('Carpentry/masonry'), value: 5},
        6: {name: $translate.instant('Driver'), value: 6},
        7: {name: $translate.instant('Community/village officer'), value: 7},
        8: {name: $translate.instant('Teacher'), value: 8},
        9: {name: $translate.instant('Factory worker'), value: 9},
        10: {name: $translate.instant('Other (Specify)'), value: 10}
      };
    },
    seedTypes: function() {
      return {
        1: {name: $translate.instant('Hybrid'), value: 1},
        2: {name: $translate.instant('Own saved'), value: 2},
        3: {name: $translate.instant('Local variety'), value: 3},
        4: {name: $translate.instant('Government released variety'), value: 4},
        5: {name: $translate.instant('Farmer to farmer exchange'), value: 5}
      };
    },
    soilCondition: function() {
      return {
        1: {name: $translate.instant('Dry soil'), value: 1},
        2: {name: $translate.instant('Wet soil'), value: 2},
        3: {name: $translate.instant('Puddled Soil'), value: 3}
      };
    },
    soilFertility: function() {
      return {
        1: {name: $translate.instant('Highly fertile'), value: 1},
        2: {name: $translate.instant('Medium fertility'), value: 2},
        3: {name: $translate.instant('Low fertility'), value: 3}
      };
    },
    sowingPowerSource: function() {
      return {
        1: {name: $translate.instant('Carabao/Cow/Bullock'), value: 1},
        2: {name: $translate.instant('2 Wheel hand tractor'), value: 2},
        3: {name: $translate.instant('4 wheel tractor'), value: 3},
        4: {name: $translate.instant('Other (specify)'), value: 4}
      };
    },
    storage: function() {
      return {
        1: {name: $translate.instant('There is no use of pesticide or inorganic fertilizers'), value: 1},
        2: {name: $translate.instant('Pesticides and inorganic fertilizers are labeled and stored in a locked and separate place'), value: 2},
        3: {name: $translate.instant('Pesticide and inorganic fertilizers are labeled and stored in a general farm storage area'), value: 3},
        4: {name: $translate.instant('Pesticides and inorganic fertilizers are not labeled or stored'), value: 4}
      };
    },
    strawManagement: function() {
      return {
        1: {name: $translate.instant('Retained in pile, not returned to field, and not burnt'), value: 1},
        2: {name: $translate.instant('Retained in pile, and burnt'), value: 2},
        3: {name: $translate.instant('Removed from field and used for other purposes'), value: 3},
        4: {name: $translate.instant('Returned to field and spread across'), value: 4},
        5: {name: $translate.instant('50% (20-30 cm standing stubble) retained in the field and all incorporated'), value: 5},
        6: {name: $translate.instant('50% (20-30 cm standing stubble) retained in the field and all burned'), value: 6}
      };
    },
    strawUsage: function() {
      return {
        1: {name: $translate.instant('Incorporated in the field'), value: 1},
        2: {name: $translate.instant('Animal feeding'), value: 2},
        3: {name: $translate.instant('Mushroom cultivation'), value: 3},
        4: {name: $translate.instant('Burned'), value: 4}
      };
    },
    sustainabilityIndicators: function() {
      return {
        1: {name: $translate.instant('Net profit'), value: 'netProfit'},
        2: {name: $translate.instant('Labor productivity'), value: 'laborProductivity'},
        3: {name: $translate.instant('Grain yield'), value: 'grainYield'},
        4: {name: $translate.instant('Water use efficiency'), value: 'waterUseEfficiency'},
        5: {name: $translate.instant('Nitrogen use efficiency'), value: 'nitrogenUseEffiency'},
        6: {name: $translate.instant('Phosphorus use efficiency'), value: 'phosphorusUseEfficiency'},
        7: {name: $translate.instant('Pesticide use'), value: 'pesticideUse'},
        8: {name: $translate.instant('Total pesticide score (IRRI method)'), value: 'pesticideScore'},
        9: {name: $translate.instant('Greenhouse gas'), value: 'greenhouseGas'},
        10: {name: $translate.instant('Workers health and safety'), value: 'workersHealthSafety'},
        11: {name: $translate.instant('Child labor'), value: 'childLabor'},
        12: {name: $translate.instant('Women empowerment'), value: 'womenEmpowerment'}
      };
    },
    sustainabilityIndicatorGraph: function() {
      return {
        1: {name: $translate.instant('Net profit'), value: 'netProfit'},
        2: {name: $translate.instant('Labor productivity'), value: 'laborProductivity'},
        3: {name: $translate.instant('Grain yield'), value: 'grainYield'},
        4: {name: $translate.instant('Water use efficiency'), value: 'waterUseEfficiency'},
        5: {name: $translate.instant('Nitrogen use efficiency'), value: 'nitrogenUseEffiency'},
        6: {name: $translate.instant('Phosphorus use efficiency'), value: 'phosphorusUseEfficiency'},
        7: {name: $translate.instant('Pesticide use'), value: 'pesticideUse'},
        8: {name: $translate.instant('Total pesticide score (IRRI method)'), value: 'pesticideScore'},
        9: {name: $translate.instant('Greenhouse gas'), value: 'greenhouseGas'},
        10: {name: $translate.instant('Workers health and safety'), value: 'workersHealthSafety'},
        11: {name: $translate.instant('Child labor'), value: 'childLabor'},
        12: {name: $translate.instant('Women empowerment'), value: 'womenEmpowerment'},
        13: {name: $translate.instant('Seed rate'), value: 'seedRate'},
        14: {name: $translate.instant('Nitrogen amount'), value: 'nitrogenAmount'},
        15: {name: $translate.instant('Phosphorus amount'), value: 'phosphorusAmount'},
        16: {name: $translate.instant('Potassium amount'), value: 'potassiumAmount'},
        17: {name: $translate.instant('No. of N application (Nitrogen count)'), value: 'nApplication'},
        18: {name: $translate.instant('Number of irrigation'), value: 'nIrrigation'}
      };
    },
    toolCalibrated: function() {
      return {
        1: {name: $translate.instant('Calibration and maintenance within current crop cycle'), value: 1},
        2: {name: $translate.instant('Calibration and maintenance within the past 2 years'), value: 2},
        3: {name: $translate.instant('No Calibration and maintenance within the past 2 years'), value: 3}
      };
    },
    trainingPesticide: function() {
      return {
        1: {name: $translate.instant('There is no use of pesticides'), value: 1},
        2: {name: $translate.instant('Pesticide applicators participated in a training session in the past 3 years'), value: 2},
        3: {name: $translate.instant('Pesticide applicators participated in a training session in the past 5 years'), value: 3},
        4: {name: $translate.instant('Pesticide applicators did not participate in a training session in the past 5 year'), value: 4}
      };
    },
    transplantingMethod: function() {
      return {
        1: {name: $translate.instant('Transplanting by the labor'), value: 1},
        2: {name: $translate.instant('Transplanting by machine'), value: 2}
      };
    },
    transplantingNurserySelf: function() {
      return {
        1: {name: $translate.instant('Yes, I prepared myself'), value: 1},
        2: {name: $translate.instant('No, I purchased from custom hiring'), value: 0}
      };
    },
    transplantingType: function() {
      return {
        1: {name: $translate.instant('Own transplanting machine'), value: 1},
        2: {name: $translate.instant('Hired transplanting machine'), value: 2},
        3: {name: $translate.instant('Custom hiring of seeding and transplanting machine (together)'), value: 3}
      };
    },
    waterCondition: function() {
      return {
        1: {name: $translate.instant('The field had standing water continuously'), value: 1},
        2: {name: $translate.instant('The field was continously dry'), value: 2},
        3: {name: $translate.instant('The field was alternative wetting and drying'), value: 3}
      };
    },
    waterRegime: function() {
      return {
        1: {name: $translate.instant('Non flooded pre-season was less than 180 days'), value: 1, image: 'image31.png'},
        2: {name: $translate.instant('Non flooded pre-season was more than 180 days'), value: 2,  image: 'image32.png'},
        3: {name: $translate.instant('Flooded preseason was more than 30 days'), value: 3,  image: 'image33.png'},
        4: {name: $translate.instant('I do not know the condition'), value: 4,  image: null}
      };
    },
    weedingHerbicide: function() {
      return {
        1: {name: $translate.instant('Manual weeding'), value: 1},
        2: {name: $translate.instant('Herbicide application'), value: 2},
        3: {name: $translate.instant('Both manual weeding and herbicide'), value: 3}
      };
    },
    womenAccess: function() {
      return {
        1: {name: $translate.instant('Women have equal access'), value: 1},
        2: {name: $translate.instant('Women have less access'), value: 2},
        3: {name: $translate.instant('Women have no access'), value: 3}
      };
    },
    womenControlDecisionMaking: function() {
      return {
        1: {name: $translate.instant('Women have at least equivalent decision-making power'), value: 1},
        2: {name: $translate.instant('Women have some but less than equivalent decision-making power'), value: 2},
        3: {name: $translate.instant('Women have no or marginal decision making power'), value: 3}
      };
    },
    womenControlPersonalIncome: function() {
      return {
        1: {name: $translate.instant('Women have equivalent or greater control'), value: 1},
        2: {name: $translate.instant('Women have some but less than equivalent control'), value: 2},
        3: {name: $translate.instant('Women have no or very limited control'), value: 3}
      };
    },
    womenDecision: function() {
      return {
        1: {name: $translate.instant('Women have at least equivalent decision-making power'), value: 1},
        2: {name: $translate.instant('Women have some but less than equivalent decision-making power'), value: 2},
        3: {name: $translate.instant('Women have no or marginal decision-making power'), value: 3}
      };
    },
    womenParticipationDecision: function() {
      return {
        1: {name: $translate.instant('Women participation in group leadership, are active in group decision, and their voices are valued'), value: 1},
        2: {name: $translate.instant('Women are present during group decision, but their contributions are not given full weight'), value: 2},
        3: {name: $translate.instant('Women are excluded from group decision-making'), value: 3}
      };
    },
    womenSatisfaction: function() {
      return {
        1: {name: $translate.instant('Women are satisfied'), value: 1},
        2: {name: $translate.instant('Women are partly satisfied (e.g., no balance during peak labor-requirement periods)'), value: 2},
        3: {name: $translate.instant('Women are structurally unsatisfied'), value: 3}
      };
    },
    womenSeasonalResources: function() {
      return {
        1: {name: $translate.instant('Women have at least equivalent decision-making power and equal access'), value: 1},
        2: {name: $translate.instant('Women have some but less than equivalent decision-making power and less than equivalent access'), value: 2},
        3: {name: $translate.instant('Women have no or marginal decision-making power and no access'), value: 3}
      };
    },
    womenViolence: function() {
      return {
        1: {name: $translate.instant('There are no cases of violence'), value: 1},
        2: {name: $translate.instant('There is at least one case of violence'), value: 2}
      };
    },
    workInjuries: function() {
      return {
        1: {name: $translate.instant('No minor or major work-related injuries or ill health'), value: 1},
        2: {name: $translate.instant('No major work-related injuries or ill health, but minor cases in a lower frequency than in the last crop cycle'), value: 2},
        3: {name: $translate.instant('Any major work-related injuries or minor cases in an equal or higher frequency than in the last crop cycle'), value: 3}
      };
    },
    yesNo: function() {
      return [
        {name: $translate.instant('Yes'), value: 1},
        {name: $translate.instant('No'), value: 0}
      ];
    },
    useRegisteredProductions: function() {
      return [
        {name: $translate.instant('There is no use of pesticide'), value: 1},
        {name: $translate.instant('Compliance with all of the listed elements for purchased or farm-produced pesticide'), value: 2},
        {name: $translate.instant('Noncompliance with one or more of the listed elements for purchased or farm-produced pesticides '), value: 3}
      ];
    },
    targetedApplication: function() {
      return [
        {name: $translate.instant('Managed without pesticide'), value: 1},
        {name: $translate.instant('Compliance with all listed conditions'), value: 2},
        {name: $translate.instant('Noncompliance with one or more of the listed elements for purchased or farm-produced pesticides'), value: 3}
      ];
    },
    labelInstructions: function() {
      return [
        {name: $translate.instant('There is no use of pesticide'), value: 1},
        {name: $translate.instant('Instructions followed on application method, pre-harvest intervals, and doses'), value: 2},
        {name: $translate.instant('Instructions followed on application method and pre-harvest intervals, but suboptimal doses'), value: 3},
        {name: $translate.instant('Incorrect application method, dosage in excess of labeled amount, or incorrect timing'), value: 4}
      ];
    },
    pesticideEquipmentCalibrated: function() {
      return [
        {name: $translate.instant('There is no use of pesticides '), value: 1},
        {name: $translate.instant('Calibration and maintenance within current crop cycle'), value: 2},
        {name: $translate.instant('Calibration and maintenance within the past 2 years'), value: 3},
        {name: $translate.instant('No calibration and maintenance within the past 2 years'), value: 4}
      ];
    },
    weedManagementCarriedOut: function() {
      return [
        {name: $translate.instant('Weeds are controlled without herbicides '), value: 1},
        {name: $translate.instant('Weeds are controlled with a combination of physical and chemical techniques, with a maximum of one herbicide application per season'), value: 2},
        {name: $translate.instant('Weeds are controlled with up to 4 herbicide applications per crop cycle'), value: 3},
        {name: $translate.instant('Weeds are not effectively controlled or are managed with inappropriate herbicide use'), value: 4}
      ];
    },
    diseaseManagementCarriedOut: function() {
      return [
        {name: $translate.instant('Disease are managed without the use of chemical control '), value: 1},
        {name: $translate.instant('Fungal panicle diseases (e.g., false smut, dirty panicle, neck and panicle blast)are managed with 1 fungicide application'), value: 2},
        {name: $translate.instant('Fungal diseases are managed with a maximum of 2 fungicide applications per crop cycle'), value: 3},
        {name: $translate.instant('Diseases are not effectively managed or fungicides are  applied in excess of requirement'), value: 4}
      ];
    },
    insectManagementCarriedOut: function() {
      return [
        {name: $translate.instant('Insect pests were managed without the use of chemical insecticides'), value: 1},
        {name: $translate.instant('Insect pests are managed with a maximum of one application of insecticide per crop cycle'), value: 2},
        {name: $translate.instant('Insect pests are managed with a maximum of two insecticides per crop cycle'), value: 3},
        {name: $translate.instant('Insect pests are not effectively managed or are not used appropriately and or are applied before heading'), value: 4}
      ];
    },
    molluskManagementCarriedOut: function() {
      return [
        {name: $translate.instant('Mollusk pests are managed without the use of molluscicides'), value: 1},
        {name: $translate.instant('Mollusk pests are managed with a maximum of 1 application of molluscicide per crop cycle, but only if applied for rice younger than 30 days'), value: 2},
        {name: $translate.instant('Mollusk pests are managed with a maximum of 1 molluscicide application per crop cycle, but it is done during fallow '), value: 3},
        {name: $translate.instant('Mollusk pests are not managed effectively, i.e., molluscicide is over applied or applied on rice older than 30 days'), value: 4}
      ];
    },
    rodentManagementCarriedOut: function() {
      return [
        {name: $translate.instant('Rodent pests are managed without the use of rodenticides'), value: 1},
        {name: $translate.instant('Rodent pests are managed with a maximum of 1 application of rodenticide per crop cycle, but only if used before heading '), value: 2},
        {name: $translate.instant('Rodent pests are managed with >1 application of rodenticide per crop cycle, but only if used before heading'), value: 3},
        {name: $translate.instant('Rodents are not managed effectively or rodenticide is used too late to provide effective protection'), value: 4}
      ];
    },
    birdManagementCarriedOut: function() {
      return [
        {name: $translate.instant('Bird pests are managed without the use of lethal control'), value: 1},
        {name: $translate.instant('Bird pests are managed by live trapping and all nonpest species are released alive'), value: 2},
        {name: $translate.instant('Birds are indiscriminately persecuted by killing, poisoning or hunting'), value: 3}
      ];
    },
    yieldGapNames: function() {
      return {
        1: {name: $translate.instant('Top 10%'), value: 1},
        2: {name: $translate.instant('Middle 80%'), value: 2},
        3: {name: $translate.instant('Bottom 10%'), value: 3},
      };
    },
  };
});
