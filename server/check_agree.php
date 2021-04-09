<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");
//更新两个表：art的点赞数，和agree表新加一列

//接收Post信息 'job='+job+'&userId='+userId
$user_id = $_POST['user_id'];
$art_id = $_POST['art_id'];
$sql;
$result;
/*
$sql = 'select * from article';
$result = mysqli_query($conn,$sql);
$row = mysqli_num_rows($result);
*/

$sql = "select * from good where art_id = ".$art_id." and user_id = ".$user_id;
$result = mysqli_query($conn,$sql);
$row = 0;
$row = mysqli_num_rows($result);
if($row!=0){
    $getSql = "select agreeNum from article where art_id = ".$art_id;
    $getRes = mysqli_query($conn,$getSql);
    $dbrow = mysqli_fetch_array($getRes);
    echo $dbrow["agreeNum"];
}else{
    echo 'fail';
}

?>
