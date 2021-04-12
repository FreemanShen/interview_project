<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");
//更新两个表：art的点赞数，和agree表新加一列

//接收Post信息 'job='+job+'&userId='+userId
//返回JSON对象，有agreed,followed,collected三列，用Boolean值表示 
$star = $_POST['star'];
$user_id = $_POST['user_id'];
$art_id = $_POST['art_id'];


$sql;
$result;
$obj = new stdClass();
$obj->agreed = false;
$obj->followed = false;
$obj->collected = false;

//echo $star;

$sql = "select * from good where art_id = ".$art_id." and user_id = ".$user_id;
$result = mysqli_query($conn,$sql);
$row = 0;
$row = mysqli_num_rows($result);
if($row!=0){
    $obj->agreed = true;
}

$sql = "select * from collect where art_id = ".$art_id." and collecter = ".$user_id;
$result = mysqli_query($conn,$sql);
$row = 0;
$row = mysqli_num_rows($result);
if($row!=0){
    $obj->collected = true;
}

$sql = "select * from follower where star = ".$star." and fans = ".$user_id;
$result = mysqli_query($conn,$sql);
$row = 0;
$row = mysqli_num_rows($result);
if($row!=0){
    $obj->followed = true;
}
echo json_encode($obj);

?>
