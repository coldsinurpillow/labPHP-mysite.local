<?php
function drawTable($cols, $rows, $color) {
  if ($rows != 0 && $cols != 0 && $color != "") {
    echo "<table border=\"1\">";
    echo "<thead><td>";
    for ($i=1; $i <= $cols; $i++) { 
      echo "<th bgcolor=\"".$color."\" align=\"center\"><font color=\"#fff\">".$i."</font></th>";
    }
    echo "</td></thead>";

    for ($i=1; $i <= $rows; $i++) { 
      echo "<tr>";
      echo "<th bgcolor=\"".$color."\" align=\"center\"><font color=\"#fff\">".$i."</font></th>";
      for ($j=1; $j <= $cols; $j++) { 
        echo "<td>".$i*$j."</td>";
      }
      echo "</tr>";
    }
    echo "</table>";
  } 
}
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $cols = abs((int) $_POST['cols']);
  $rows = abs((int) $_POST['rows']);
  $color = trim(strip_tags($_POST['color']));
}
$cols = ($cols) ? $cols : 10;
$rows = ($rows) ? $rows : 10;
$color = ($color) ? $color : 'yellow';
?>

<!DOCTYPE html>
<html>
<style type="text/css">
  table {
    border: 1px solid #121212;
    width: 300px;
  }

  td {
    border: 1px solid #121212;
    text-align: center;
    background-color: #3D3D3D;
    color: #FFF28C;
    font-weight: bold;
  }
</style>

<head>
  <title>Таблица умножения</title>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="style.css" />
</head>

<body>
  <!-- Область основного контента -->
  <form action=' <?= $_SERVER['REQUEST_URI'] ?>' method='POST'>
    <label>Количество колонок: </label>
    <br />
    <input name='cols' type='text' value="" />
    <br />
    <label>Количество строк: </label>
    <br />
    <input name='rows' type='text' value="" />
    <br />
    <label>Цвет: </label>
    <br />
    <input name='color' type='text' value="" />
    <br />
    <br />
    <input type='submit' value='Создать' />
  </form>
  <!-- Таблица -->
  <?
  drawTable($cols, $rows, $color);
  ?>
  <!-- Таблица -->
  <!-- Область основного контента -->
</body>

</html>