<?php

class ProvinceUploaderDAO {
  const MAIN_TABLE = 'region_provinces';

  public function get($id) {
    $sql = 'SELECT * FROM ' . self::MAIN_TABLE . ' WHERE `id` = %d';
    $result = DB::queryMaster($sql, array($id));

    return $result->fetch();
  }

  public function save($data) {
    DB::startTransaction();

    $sql = 'INSERT INTO `' . self::MAIN_TABLE . '`
      (name, is_region, countries_id)
      VALUES
      ("%s", 1, 12)';

    $params = array($data);

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    DB::commit();
    return $id;
  }
}
