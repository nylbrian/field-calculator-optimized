<?php

class HouseholdGraphicsDAOFactory {
  public static function generate($data) {
    switch ($data['graphType']) {
      case 'radar':
        $graph = new HouseholdRadar();
      break;
      case 'bar':
        $graph = new Bar();
      break;
      default:
        throw new HouseholdGraphicsDAOException('Unsupported graph type');
    }

    return $graph->generate($data);
  }
}
