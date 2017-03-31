<?php

class GraphicsDAO {

  public function generate($data) {
    if (!isset($data['category_name'])) {
      throw new GraphicsDAOException('Category name is required.');
    }

    if (!isset($data['graphType'])) {
      throw new GraphicsDAOException('Graph type is required.');
    }

    if (!isset($data['yValues']) || !is_array($data['yValues']) || count($data['yValues']) <= 0) {
      throw new GraphicsDAOException('Sustainability indicator is required');
    }

    return GraphicsDAOFactory::generate($data);
  }

}
