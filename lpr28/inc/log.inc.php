<?
$date = new DateTime();
$dt = $date->getTimestamp();
$page = $_SERVER["REQUEST_URI"];
$ref = $_SERVER["HTTP_REFERER"];
$path = "$dt|$page|$ref\n";

$fd = fopen("log/".PATH_LOG, 'a') or die("не удалось создать файл");
fwrite($fd, $path);
fclose($fd);

