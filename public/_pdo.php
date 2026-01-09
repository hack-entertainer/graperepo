<?php
header('Content-Type: text/plain');

echo "PHP: " . PHP_VERSION . PHP_EOL;
echo "PDO class exists: ";
var_dump(class_exists('PDO'));
echo "PDO extension loaded: ";
var_dump(extension_loaded('pdo'));
