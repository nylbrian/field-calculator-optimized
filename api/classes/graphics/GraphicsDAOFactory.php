<?php

class GraphicsDAOFactory {
  public static function generate($data) {
    switch ($data['graphType']) {
      case 'radar':
        $graph = new Radar();
      break;
      case 'bar':
        $graph = new Bar();
      break;
      default:
        throw new GraphicsDAOException('Unsupported graph type');
    }

    return $graph->generate($data);
  }
}
