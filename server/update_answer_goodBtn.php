<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");
//返回success和fail

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
    //已有数据，返回fail
    echo 'fail';
    die();
}else{

    $sql = "insert into good(art_id,user_id) values(".$art_id.",".$user_id.")";
    $result = mysqli_query($conn,$sql);
    if(!$result){
        echo 'fail';
        die();
    }else{
        /*
        $updateSql = "update article set agreeNum = agreeNum +1 where art_id = ".$art_id;
        $updateRes = mysqli_query($conn,$updateSql);
        if($updateRes){
            echo 'success';
        }else{
            echo 'fail';
        }
        */
        
        echo 'success';
        die();
    }  

    echo 'fail';
}

?>
