<?php
require_once "classes/CategoriesMap.php";
if(isset($_GET["id"])) {
  $categoriesMap = new CategoriesMap();
  $categoriesMap->delete((int)$_GET["id"]);
}
header('Location: index.php');
exit();