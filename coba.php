<?php
include './config.php';
$req = $_REQUEST;
$nama = "";
$alamat = "";
$q = "select * from member where id='1'";
$r = mysql_query($q);
$d = mysql_fetch_array($r);

$nama = $d['username'];
$alamat = $d['email'];


?>

<form action="" name="form">
    nama <input type="text" name="nama" value="<?php echo $nama; ?>">
    alamat <input type="text" name="nama" value="<?php echo $alamat; ?>">
</form>