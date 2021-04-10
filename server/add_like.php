<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");
//返回success和fail

//更新两个表：art的点赞数，和agree表新加一列

//接收Post信息 'job='+job+'&userId='+userId
$review_id = $_POST['review_id'];
$user_id = $_POST['user_id'];
$sql;
$result;

/*
$sql = 'select * from article';
$result = mysqli_query($conn,$sql);
$row = mysqli_num_rows($result);
*/

$sql = "insert into likes(review_id,user_id) values(".$review_id.",".$user_id.")";
$result = mysqli_query($conn,$sql);
if(!$result){
    echo 'fail';
    die();
}else{
    echo 'success';
    die();
}  

?>
