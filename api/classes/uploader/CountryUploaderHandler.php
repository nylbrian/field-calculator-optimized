<?php

class CountryUploaderHandler {
  private $dao;

  public function __construct() {
    $path = __DIR__ . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'files' . DIRECTORY_SEPARATOR . 'Countries.txt';
    $this->dao = new CountryUploaderDAO();
    $this->reader = new File($path);
  }

  public function getAll() {
    try {
      return array('data' => $this->dao->getAll());
    } catch (DBException $e) {
      return array('error' => $e->getMessage());
    }
  }

  public function save() {
    try {
      $lines = $this->reader->readPerLine();
      foreach ($lines as $line) {
        $this->dao->save(str_replace("\n", "", $line));
      }
      return array('message' => 'Data inserted', 'id' => 1);
    } catch (FileException $e) {
      return array('error' => $e->getMessage());
    } catch (DBException $e) {
      DB::rollback();
      return array('error' => $e->getMessage());
    }
  }
}
