<?php
require_once "./classes/CategoriesMap.php";
$categoriesMap = new CategoriesMap();
$edit_category;
$id = 0;
if (isset($_GET["id"])) {
  $id = (int)$_GET["id"];
  $edit_category = $categoriesMap->findById($id);
}
$categories = $categoriesMap->findAll();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <form action="save.php" method="GET" id="category-form">
    <input type="hidden" name="id" value=<?=$id;?>>
    <input type="text" placeholder="name" name="name" value=<?=$edit_category->name;?>>
    <select name="parent_id" form="category-form" value=<?=$edit_category->parent_id?>>
      <option value="0">No parant category</option>
      <?php
        foreach ($categories as $category) {
          if ($edit_category && $edit_category->parent_id == $category->id) {
            echo "<option selected value=\"".$category->id."\">".$category->name."</option>";
          }
          echo "<option value=\"".$category->id."\">".$category->name."</option>";
        }
      ?>
    </select>
    <button>Save</button>
  </form>

  <p>All categories</p>
  <ul>
    <?php
      foreach ($categories as $category) {
        echo "<li value=\"".$category->id."\"><a href=\"index.php?id=".$category->id."\">".$category->name."</a> <a href=\"delete.php?id=".$category->id."\">x</a></li>";
      }
    ?>
  </ul>
</body>
</html>