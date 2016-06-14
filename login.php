<?php

require_once 'config.php';
session_start();
$uName = $_POST['username'];
$pWord = md5($_POST['password']);
$offset = 7 * 60 * 60; //converting 7 hours to seconds.
$dateFormat = "d M Y - H:i:s";
$timeNdate = gmdate($dateFormat, time() + $offset);
//$datenow = Date('Y-m-d H:i:s');
$qry = "SELECT *
FROM `member` u
WHERE u.username='" . $uName . "' AND u.password='" . $pWord . "'";
$res = mysql_query($qry);
$num_row = mysql_num_rows($res);
$row = mysql_fetch_assoc($res);
if ($num_row == 1) {
    echo 'true';
    $id = $row['id'];
//    mysql_query("update user set last_login = '$timeNdate' WHERE (`usrid`='$id')");
    $_SESSION['uName'] = $row['username'];
    $_SESSION['oId'] = $row['id'];
//    $_SESSION['auth'] = $row['oauth'];
//    $_SESSION['pos'] = $row['jabatan'];
} else {
    echo 'false';
}