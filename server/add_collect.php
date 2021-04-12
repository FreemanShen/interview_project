<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");
//更新两个表：art的点赞数，和agree表新加一列

//接收Post信息 'job='+job+'&userId='+userId
$user_id = $_POST['user_id'];
$art_id = $_POST['art_id'];

$sql = 'call add_collect('.$art_id.','.$user_id.')';
$res = mysqli_query($conn,$sql);
if($res){
    echo 'success';
    die();
}else{
    echo 'fail';
}
?>
