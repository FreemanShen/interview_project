<?php
include("../conn.php");
mysqli_set_charset($conn,"utf8");

$id = $_POST['id'];
$password = $_POST['password'];

$sql = "update user set password = '".$password."' where id = ".$id;
$result = mysqli_query($conn,$sql);
if(!$result){
    echo 'fail';
    die();
}else{
    echo 'success';
    die();
}  
?>