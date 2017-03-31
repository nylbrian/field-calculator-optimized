<?php

define('CLASSES_DIRECTORY', 'classes' . DIRECTORY_SEPARATOR);
include_once(CLASSES_DIRECTORY . 'ImportHousehold.php');

foreach ($_FILES as $file) {
  $excel = new ImportHousehold($file);
  $excel->importFile();
}

