<?php

class DBConfig {
  protected static $config = array(
    'master' => array(
      'server' => 'localhost',
      'username' => 'root',
      'password' => 'root',
      'database' => 'field_calculator',
    ),
    'slave' => array(
      'server' => 'localhost',
      'username' => 'root',
      'password' => 'root',
      'database' => 'field_calculator',
    ),
  );

  public static function getConfig() {
    return self::$config;
  }
}
