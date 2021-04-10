<?php
//该文件用来向数据库中插入元组
include("conn.php");
mysqli_set_charset($conn,"utf8");

/*
review_id: obj[i].review_id,user_id:sessionStorage.getItem('userId')
*/
$review_id = $_POST['review_id'];
$user_id = $_POST['user_id'];

$sql = 'select * from likes where review_id = '.$review_id.' and user_id = '.$user_id;
$res = mysqli_query($conn,$sql);

$row = mysqli_num_rows($res);
if($row==0){
    echo 'fail';
    die();
}else{
    echo 'success';
    die();
}

?>