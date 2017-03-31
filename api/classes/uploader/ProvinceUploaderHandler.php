<?php

class ProvinceUploaderHandler {
  private $dao;

  public function __construct() {
    $path = __DIR__ . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'files' . DIRECTORY_SEPARATOR . 'Province.txt';
    $this->dao = new ProvinceUploaderDAO();
    $this->reader = new File($path);
  }

  public function get($id) {
    $result = $this->dao->get($id);
    return array('data' => $result[0]);
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
