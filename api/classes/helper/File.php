<?php

class File {
  private $path;

  public function __construct($path) {
    if (!file_exists($path)) {
      throw new FileException('Path ' . $path . ' does not exist');
    }

    $this->path = $path;
  }

  public function readPerLine() {
    $open = $this->openFile('r');
    $lines = array();
    while (($line = fgets($open)) !== false) {
      $lines[] = $line;
    }

    fclose($open);
    return $lines;
  }

  protected function openFile($method) {
    $handle = fopen($this->path, $method);

    if (!$handle) {
      throw new FileException('Could not open file for selected method');
    }

    return $handle;
  }
}
