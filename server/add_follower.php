<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");
//更新两个表：art的点赞数，和agree表新加一列

//接收Post信息 'job='+job+'&userId='+userId
$star = $_POST['star'];
$fans = $_POST['fans'];

$sql = 'call add_follower('.$star.','.$fans.')';
$res = mysqli_query($conn,$sql);
if($res){
    echo 'success';
    die();
}else{
    echo 'fail';
}
?>
