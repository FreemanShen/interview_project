<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

$art_id = $_GET['art_id'];
$sql = 'select count(*) as number from review where art_id = '.$art_id;
$res = mysqli_query($conn,$sql);
$row = mysqli_fetch_array($res);
echo $row['number'];
die();
?>
