<?php
include("conn.php");    
mysqli_set_charset($conn,"utf8");

$id = $_POST['userId'];
$sql = 'select * from user where id = '.$id.'';
$result = mysqli_query($conn,$sql);
$row = mysqli_num_rows($result);
$obj = new stdClass();

if($row){
    $dbrow = mysqli_fetch_array($result); 
    $obj->pic_path = $dbrow['pic_path'];
    echo json_encode($obj);
}else{
    echo 'fail';
    die();
}

?>