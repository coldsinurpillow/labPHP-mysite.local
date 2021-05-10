<?
$fd = fopen("log/".PATH_LOG, 'r') or die("не удалось открыть файл");
echo "<ul>";
while(!feof($fd))
{
    $str = htmlentities(fgets($fd));
    echo "<li>".$str."</li>";
}
echo "</ul>";
fclose($fd);