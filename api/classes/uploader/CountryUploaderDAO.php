<?php

class CountryUploaderDAO {
  const MAIN_TABLE = 'countries';

  public function save($data) {
    DB::startTransaction();

    $sql = 'INSERT INTO `' . self::MAIN_TABLE . '`
      (name)
      VALUES
      ("%s")';

    $params = array($data);

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    DB::commit();
    return $id;
  }
}
