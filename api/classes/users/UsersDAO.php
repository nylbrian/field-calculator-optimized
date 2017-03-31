<?php

class UsersDAO {
  const MAIN_TABLE = 'users';

  public function login($data) {
    $result = DB::querySlave('
      SELECT * FROM `' . self::MAIN_TABLE . '`
      WHERE username = "%s" AND password = "%s" ', array(
      $data['username'],
      sha1($data['password'])
    ));

    if ($result->numRows() <= 0) {
      throw new UsersDAOException('Incorrect username / password');
    }

    return $result->fetchFirstRow();
  }

  public function register($data) {
    DB::startTransaction();

    $sql = 'INSERT INTO `' . self::MAIN_TABLE . '`
      (`email`, `username`, `password`, `countries_id`, `profession`, `organization`, `role`)
      VALUES ("%s", "%s", "%s", "%s", "%s", "%s", %d)';
    $params = array(
      $data['email'],
      $data['username'],
      sha1($data['password']),
      $data['countries_id'],
      $data['profession'],
      $data['organization'],
      2
    );
    $result = DB::queryMaster($sql, $params);

    $farmerId = $result->insertId();
    if (!$farmerId) {
      DB::rollback();
      throw new UsersDAOException('Failed to insert user');
    }

    DB::commit();
    return $data;
  }

  public function get($id) {
    return DB::querySlave('SELECT * FROM ' . self::MAIN_TABLE . ' WHERE id = %d', array($id))->fetchFirstRow();
  }

}
