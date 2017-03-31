<?php

class HouseholdGraphicsDAO {

  public function generate($data) {
    if (!isset($data['category_name'])) {
      throw new HouseholdGraphicsDAOException('Category name is required.');
    }

    if (!isset($data['graphType'])) {
      throw new HouseholdGraphicsDAOException('Graph type is required.');
    }

    if (!isset($data['yValues']) || !is_array($data['yValues']) || count($data['yValues']) <= 0) {
      throw new HouseholdGraphicsDAOException('Sustainability indicator is required');
    }

    return HouseholdGraphicsDAOFactory::generate($data);
  }

}
