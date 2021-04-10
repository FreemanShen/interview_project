<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

//返回标题和主题
$art_id = $_POST['art_id'];
$sql;
$result;

$sql = "select content,topic,agreeNum from article where art_id = ".$art_id;
$result = mysqli_query($conn,$sql);
$dbrow = mysqli_fetch_array($result);
$obj = new stdClass();
if(mysqli_num_rows($result)!=0){
    $obj->topic = $dbrow['topic'];
    $obj->content = $dbrow['content'];
    $obj->agreeNum = $dbrow['agreeNum'];
    echo json_encode($obj);    
    die();
}else{
    $obj->topic = 'not found';
    $obj->content = 'not found';
    $obj->agreeNum = 0;
    echo json_encode($obj);
    die();
}


?>