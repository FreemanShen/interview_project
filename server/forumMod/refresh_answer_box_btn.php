<?php
//该文件用来向数据库中插入元组
include("../conn.php");
mysqli_set_charset($conn,"utf8");
/*
返回一组状态码
array[0] : agree
argee[1] : focus
agree[2] : collect
*/
/*
review_id: obj[i].review_id,user_id:sessionStorage.getItem('userId')
*/
$review_id = $_POST['review_id'];
$user_id = $_POST['user_id'];
$star = $_POST['star'];
$art_id = $_POST['art_id'];

$arr = array();
$sql = 'select * from likes where review_id = '.$review_id.' and user_id = '.$user_id;
$res = mysqli_query($conn,$sql);

$row = mysqli_num_rows($res);
if($row==0){
    array_push($arr,0);
}else{
    array_push($arr,1);
}


$sql = 'select * from follower where star = '.$star.' and fans = '.$user_id;
$res = mysqli_query($conn,$sql);

$row = mysqli_num_rows($res);
if($row==0){
    array_push($arr,0);
}else{
    array_push($arr,1);
}


$sql = 'select * from review_collect where art_id = '.$art_id.' and user_id = '.$user_id.' and review_id = '.$review_id;
$res = mysqli_query($conn,$sql);

$row = mysqli_num_rows($res);
if($row==0){
    array_push($arr,0);
}else{
    array_push($arr,1);
}

echo json_encode($arr);

?>