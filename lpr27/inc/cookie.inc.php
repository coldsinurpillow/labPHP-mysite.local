<?
$visitCounter = 0;
$lastVisit = "";
if(date('d-m-Y', $_COOKIE['lastVisit']) != date('d-m-Y')) {
    if(isset($_COOKIE["visitCounter"])) {
        $visitCounter = (int)$_COOKIE["visitCounter"];
        $visitCounter += 1;
    }
    if(isset($_COOKIE["lastVisit"])) {
        $lastVisit = date("Y-m-d H:i:s", $_COOKIE["lastVisit"]);
    } 
}
