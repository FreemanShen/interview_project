<?php
include("../conn.php");
mysqli_set_charset($conn,"utf8");
//更新两个表：art的点赞数，和agree表新加一列

//接收Post信息 'job='+job+'&userId='+userId
$room_id = $_POST['room_id'];
$pwd = $_POST['pwd'];
$sql = 'select * from group_chat_room where room_id = '.$room_id.' and password = "'.$pwd.'"';
$res = mysqli_query($conn,$sql);
if(mysqli_num_rows($res)!=0){
    echo 'success';
    die();
}else{
    echo 'fail';
    die();
}
?>
