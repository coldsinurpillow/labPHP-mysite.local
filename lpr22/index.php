
<? include('inc/lib.inc.php'); ?>
<? include('inc/data.inc.php');
//Инициализация заголовков страницы
$title = 'Сайт нашей школы';
$header = "$welcome, Гость!";
$id = strtolower(strip_tags(trim($_GET['id'])));
switch ($id) {
  case 'about':
    $title = 'О сайте';
    $header = 'О нашем сайте';
    break;
  case 'contact':
    $title = 'Контакты';
    $header = 'Обратная связь';
    break;
  case 'table':
    $title = 'Таблица умножения';
    $header = 'Таблица умножения';
    break;
  case 'calc':
    $title = 'Он-лайн калькулятор';
    $header = 'Калькулятор';
    break;
}

?>

<!DOCTYPE html>
<html>

<head>
  <title>Сайт нашей школы</title>
  <meta "Content-Type: text/html; charset=utf-8">
  <link rel="stylesheet" href="style.css" />
</head>
<style>
  .nav__list-li--horizon {
    display: inline-block;
    margin-right: 8px;
    margin-left: 8px;
  }
</style>

<body>
  <title><?php echo $title ?></title>
  <div id="header">
    <!-- Верхняя часть страницы -->
    <? include('inc/top.inc.php'); ?>
    <!-- Верхняя часть страницы -->
  </div>

  <div id="content">
    <!-- Заголовок -->
    <h1> <?php echo $header ?><?= $welcome ?>, Гость!</h1>
    <!-- Заголовок -->
    <? include('inc/index.inc.php'); ?>
    <!-- Область основного контента -->
    <?php
    switch ($id) {
      case 'about':
        include 'about.php';
        break;
      case 'contact':
        include 'contact.php';
        break;
      case 'table':
        include 'table.php';
        break;
      case 'calc':
        include 'calc.php';
        break;
      default:
        include 'inc/index.inc.php';
    }
    ?>
  </div>
  <div id="nav">
    <!-- Навигация -->
    <? include('inc/menu.inc.php'); ?>
    <!-- Меню -->
    <!-- Навигация -->
  </div>
  <div id="footer">
    <!-- Нижняя часть страницы -->
    <? include('inc/bottom.inc.php'); ?>
    <!-- Нижняя часть страницы -->
  </div>
</body>

</html>