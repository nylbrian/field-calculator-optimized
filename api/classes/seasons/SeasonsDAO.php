<?php

class SeasonsDAO {
  public function add($data) {
    DB::startTransaction();

    $result = DB::queryMaster('
      INSERT INTO farmer_seasons(farmers_id, seasons_id, year, sowing_date)
      VALUES(%d, %d, %d, "%s")', array(
      $data['farmers_id'],
      $data['seasons_id'],
      $data['year'],
      $data['sowing_date']
    ));

    if (!$result->insertId()) {
      DB::rollback();
      throw new SeasonsDAOException('Failed to add season');
    }

    $data['id'] = $result->insertId();
    DB::commit();
    return $data;
  }

  public function edit($id, $data) {
    DB::startTransaction();

    $result = DB::queryMaster('
      UPDATE farmer_seasons
      SET seasons_id = %d, year = %d, sowing_date = "%s"
      WHERE id = %d', array(
        $data['seasons_id'],
        $data['year'],
        $data['sowing_date'],
        $id,
      ));

    DB::commit();
    return $data;
  }

  public function get($id) {
    $result = DB::queryMaster('SELECT * FROM farmer_seasons WHERE id = %d', array($id));

    if ($result->numRows() < 0) {
      throw new SeasonsDAOException('Season doesn\'t exist');
    }

    $result = $result->fetch();
    return $result[0];
  }

  public function getAllByFarmerId($id) {
    $result = DB::queryMaster('
      SELECT * FROM farmer_seasons WHERE farmers_id = %d
    ', array($id));

    return $result->fetch();
  }
}
