<?php
include("../conn.php");
mysqli_set_charset($conn,"utf8");
$id = $_POST['id'];
$mail = $_POST['mail'];

$sql = "select * from user where id = ".$id." and mail = '".$mail."'";
$result = mysqli_query($conn,$sql);
$num = mysqli_num_rows($result);
if($num == 0){
    echo 'fail';
}else{
    echo 'success';
}

?>