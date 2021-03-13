<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");
/*
sendMsgHttp.send('sender_id='+sender_id+'&sender_name='+sender_name+'&send_msg='+send_msg);  
*/
$sender_id = $_POST['sender_id'];
$sender_name = $_POST['sender_name'];
$msg = $_POST['send_msg'];

$sql = "insert into groupchat(sender_id,sender_name,msg,chattime) values(".$sender_id.",'".$sender_name."','".$msg."',now())";

$result = mysqli_query($conn,$sql);
if(!$result){
    echo 'fail';
    die();
}else{
    echo 'success';
    die();
}  
?>