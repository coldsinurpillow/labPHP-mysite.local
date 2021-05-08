<h2>Навигация по сайту</h2>
<?php
$leftMenu = [
    ['link'=>'Домой', 'href'=>'index.php'],
    ['link'=>'О нас', 'href'=>'about.php'],
    ['link'=>'Контакты', 'href'=>'contact.php'],
    ['link'=>'Таблица умножения', 'href'=>'table.php'],
    ['link'=>'Калькулятор', 'href'=>'calc.php']
  ];

  function drawMenu($menu, $vertical = true) {
    if ($vertical == true) {
      foreach ($menu as $item) {
        if ($item == $menu[0]) {
          echo '<ul><li><a href="'.$item["href"].'">'.$item["link"].'</a></li>';
          continue;
        } elseif ($item == $menu[count($menu)-1]) {
          echo '<li><a href="'.$item["href"].'">'.$item["link"].'</a></li></ul>';
          continue;
        } else {
          echo '<li><a href="'.$item["href"].'">'.$item["link"].'</a></li>';
        }
      }
    }
    }
    drawMenu($leftMenu)
?>
