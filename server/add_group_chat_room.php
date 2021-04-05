<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");


$room_id = $_POST['room_id'];
$user_id = $_POST['user_id'];
$description = $_POST['description'];


$sql = "insert into group_chat_room(room_id,user_id,description) values(".$room_id.",".$user_id.",'".$description."')";

$result = mysqli_query($conn,$sql);
if(!$result){
    echo 'fail';
    die();
}else{
    echo 'success';
    die();
}  
?>