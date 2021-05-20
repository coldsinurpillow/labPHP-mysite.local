<?php
require_once "classes/Category.php";
require_once "classes/CategoriesMap.php";
if(isset($_GET["id"]) && isset($_GET["name"]) && isset($_GET["parent_id"])){
    $id = (int)$_GET["id"];
    $name = $_GET["name"];
    $parent_id = (int)$_GET["parent_id"];
    //echo $parent_id;
    $category = new Category($id, $name, $parent_id);
    //echo $category->parent_id;
    $categoriesMap = new CategoriesMap();
    $categoriesMap->save($category);
    header('Location: index.php?success=1');
    exit();
}