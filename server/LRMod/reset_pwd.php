<?php
include("../conn.php");
mysqli_set_charset($conn,"utf8");

$mail = $_POST['mail'];
$code = $_POST['code'];
$resID = $_POST['regID'];
$id = $_POST['user'];
$sql;
$result;
//检查Code
$ckSql = "select * from resetsession where mail = '".$mail."' and code = '".$code."' and resetID = ".$resID." and user = ".$id;
$ckRes = mysqli_query($conn,$ckSql);
if(mysqli_num_rows($ckRes)==0){
    echo '101';
    die();
}else{
    echo 'success';
}
?>
