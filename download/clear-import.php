<?php

define('CLASSES_DIRECTORY', 'classes' . DIRECTORY_SEPARATOR);
include_once(CLASSES_DIRECTORY . 'ImportSeasonLong.php');

$import = new ImportSeasonLong('');
$import->clearImport();
