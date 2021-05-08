<?php
  $num1 = (int)$_POST["num1"];
  $num2 = (int)$_POST["num2"];
  $operator = $_POST["operator"];
  $error = NULL;
  $res = NULL;
  switch($operator) {
    case "+":
      $res = $num1 + $num2;
    break;
    case "-":
      $res = $num1 - $num2;
    break;
    case "/":
      if($num2 == 0) {
        $error = "На ноль делить нельзя!";
      }
      else {
        $res = $num1 / $num2;
      }
      
    break;
    case "*":
      $res = $num1 * $num2;
    break;

    default: $error = "Нет такого оператора";

  }


?>
<!DOCTYPE html>
<html>

<head>
  <title>Калькулятор</title>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="style.css" />
</head>

<body>
  <!-- Область основного контента -->
  <h3><?= $error;?> </h3>
  <h3><?= $res; ?> </h3>
  <form action='' method="POST">
    <label>Число 1:</label>
    <br />
    <input name='num1' type='text' />
    <br />
    <label>Оператор: </label>
    <br />
    <input name='operator' type='text' />
    <br />
    <label>Число 2: </label>
    <br />
    <input name='num2' type='text' />
    <br />
    <br />
    <input type='submit' value='Считать'>
  </form>
  
  <!-- Область основного контента -->
</body>

</html>