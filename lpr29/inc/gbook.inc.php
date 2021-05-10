<?php
ob_start();
/* Основные настройки */
const DB_HOST="localhost";
const DB_LOGIN="root";
const DB_PASSWORD="root";
const DB_NAME="gbook";
$db;
try {
    $db = new
    PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME, DB_LOGIN, DB_PASSWORD);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $db->exec("set names utf8");
}
catch(PDOException $e) {
    echo $e->getMessage();
}
$name = $_POST["name"];
$email = $_POST["email"];
$msg = $_POST["msg"];



/* Основные настройки */

/* Сохранение записи в БД */
if(isset($_POST["name"]) && isset($_POST["email"]) && isset($_POST["msg"])) {
    if($db->exec("INSERT INTO msgs (name, email, msg) VALUES ('$name', '$email', '$msg')") == 1) {
        
    }
    else {
        throw new Error();
    } 
}

/* Сохранение записи в БД */

/* Удаление записи из БД */
if(isset($_GET["del"])) {
    $id = (int)$_GET["del"];
    if($db->exec("DELETE FROM msgs WHERE id=$id") == 1) {

    }
}

/* Удаление записи из БД */
?>
<h3>Оставьте запись в нашей Гостевой книге</h3>

<form method="post" action="<?= $_SERVER['REQUEST_URI']?>">
Имя: <br /><input type="text" name="name" /><br />
Email: <br /><input type="text" name="email" /><br />
Сообщение: <br /><textarea name="msg"></textarea><br />

<br />

<input type="submit" value="Отправить!" />

</form>
<?php
/* Вывод записей из БД */
$res= $db->query("SELECT id, name, email, msg, UNIX_TIMESTAMP(datetime) as dt
FROM msgs
WHERE name IS NOT NULL AND msg IS NOT NULL
ORDER BY id DESC");

$msgs = $res->fetchAll(PDO::FETCH_OBJ);
$db=NULL;
foreach($msgs as $msg) {
    echo "<p>
    <a href=\"vasya@narod.ru\">".$msg->name."</a> ".$msg->datetime." написал <br/>".$msg->msg."
    </p>
    <p align=\"right\">
    <a href=\""."index.php?id=gbook"."&del=".$msg->id."\"> &gt;Удалить </a> </p>";
}

/* Вывод записей из БД */
ob_end_flush();
?>
