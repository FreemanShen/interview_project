<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");
//更新两个表：art的点赞数，和agree表新加一列

//接收Post信息 'job='+job+'&userId='+userId
$user_id = $_POST['user_id'];
$art_id = $_POST['art_id'];
$sql;
$result;


$sql = "insert into good(art_id,user_id) values(".$art_id.",".$user_id.")";
$result = mysqli_query($conn,$sql);
if(!$result){
    echo 'fail';
    die();
}else{
    //$updateSql = "update article set agreeNum = agreeNum +1 where art_id = ".$art_id;
    //$updateRes = mysqli_query($conn,$updateSql);
    //if($updateRes){
    $getSql = "select agreeNum from article where art_id = ".$art_id;
    $getRes = mysqli_query($conn,$getSql);
    $dbrow = mysqli_fetch_array($getRes);
    echo $dbrow["agreeNum"];
    //}
    //echo 'success';
    die();
}  
?>
