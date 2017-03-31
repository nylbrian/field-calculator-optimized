<?php

class temp {

  protected function getGender($value) {
    switch ($value) {
      case 1:
        return 'Male';
      case 2:
        return 'Female';
      default:
        return '';
    }
  }

  protected function getMaritalStatus($value) {
    switch ($value) {
      case 1:
        return 'Single (never married)';
      case 2:
        return 'Married';
      case 3:
        return 'Divorced';
      case 4:
        return 'Widow/widower';
      default:
        return '';
    }
  }

  protected function getLiteracyLevel($value) {
    switch ($value) {
      case 1:
        return 'Cannot read and write';
      case 2:
        return 'Can sign only';
      case 3:
        return 'Can read only';
      case 4:
        return 'Can read and write';
      default:
        return '';
    }
  }

  protected function getPrimaryOccupation($value, $other) {
    switch ($value) {
      case 1:
        return 'Jobless';
      case 2:
        return 'Farmer';
      case 3:
        return 'Tailor/weaver/sewer';
      case 4:
        return 'Agriculture laborer';
      case 5:
        return 'Carpentry/masonry';
      case 6:
        return 'Driver';
      case 7:
        return 'Community/village officer';
      case 8:
        return 'Teacher';
      case 9:
        return 'Factory worker';
      case 10:
        return $other;
      default:
        return '';
    }
  }

  protected function getReligion($value, $other) {
    switch ($value) {
      case 1:
        return 'Buddhist';
      case 2:
        return 'Christian';
      case 3:
        return 'Hindu';
      case 4:
        return 'Muslim';
      case 5:
        return 'No religion';
      case 6:
        return $other;
      default:
        return '';
    }
  }

  protected function getTraining($value, $other) {
    switch ($value) {
      case 1:
        return 'General agriculture';
      case 2:
        return 'Rice (anything related)';
      case 3:
        return 'Pesticide use';
      case 4:
        return 'Vegetable crops';
      case 5:
        return $other;
      default:
        return '';
    }
  }

  protected function getMachineries($value) {
    switch ($value) {
      case 1:
        return 'Four wheel tractor';
      case 2:
        return 'Two-wheel tractor/power tiller';
      case 3:
        return 'Truck';
      case 4:
        return 'Blade harrow';
      case 5:
        return 'Treadle harrow';
      case 6:
        return 'Rower pump';
      case 7:
        return 'Sprinkler';
      case 8:
        return 'Submersible pump';
      case 9:
        return 'Electric motor pump';
      case 10:
        return 'Diesel motor pump';
      case 11:
        return 'Rice transplanting machine';
      case 12:
        return 'Seed drill';
      case 13:
        return 'Drum seeder';
      case 14:
        return 'Rotovator';
      case 15:
        return 'Weeder';
      case 16:
        return 'Power sprayer';
      case 17:
        return 'Harvester';
      case 18:
        return 'Thresher';
      case 19:
        return 'Mechanical thresher';
      case 20:
        return 'Combined harvester and thresher';
      default:
        return '';
    }
  }

  protected function getOwnership($value) {
    switch ($value) {
      case 1:
        return 'Own operated';
      case 2:
        return 'Rented/leased in cash/kind';
      case 3:
        return 'Rented/leased in/share';
      case 4:
        return 'Rented leased out/share';
      case 5:
        return 'Rented leased/out cash';
      case 6:
        return 'Mortgaged in';
      case 7:
        return 'Mortgaged out';
      default:
        return '';
    }
  }

  protected function getEconomicCondition($value) {
    switch ($value) {
      case 1:
        return 'Rice';
      case 2:
        return 'Average';
      case 3:
        return 'Poor';
      case 4:
        return 'Very poor';
      default:
        return '';
    }
  }

  protected function getEconomicCondition3Years($value) {
    switch ($value) {
      case 1:
        return 'Improve';
      case 2:
        return 'Unchanged';
      case 3:
        return 'Get worse';
      default:
        return '';
    }
  }

  protected function getProblems($id) {
    $result = DB::queryMaster('
      SELECT problem from season_long_general_information_problem
      WHERE season_long_general_information_id = %d
      ', array($id));

    if ($result->numRows() <= 0) {
      return '';
    }

    $result = $result->fetch();

    $return = array();
    foreach ($result as $value) {
      $return[] = $value['problem'];
    }

    return implode($return, ', ');
  }
}








