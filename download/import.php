<?php

define('CLASSES_DIRECTORY', 'classes' . DIRECTORY_SEPARATOR);
include_once(CLASSES_DIRECTORY . 'ImportSeasonLong.php');

foreach ($_FILES as $file) {
  $excel = new ImportSeasonLong($file);
  $excel->importFile();
}

