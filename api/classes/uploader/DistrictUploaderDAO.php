<?php

class DistrictUploaderDAO {
  const MAIN_TABLE = 'province_districts';

  public function save($data) {
    DB::startTransaction();

    $sql = 'INSERT INTO `' . self::MAIN_TABLE . '`
      (name, is_province, region_provinces_id)
      VALUES
      ("%s", 0, 76)';

    $params = array($data);

    $result = DB::queryMaster($sql, $params);
    $id = $result->insertId();

    DB::commit();
    return $id;
  }
}
