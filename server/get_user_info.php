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
    $obj->name = $dbrow['name'];
    $obj->online = $dbrow['online'];
    $obj->admin = $dbrow['admin'];
    $obj->last_login = $dbrow['last_login'];
    $obj->sex = $dbrow['sex'];
    $obj->tel = $dbrow['tel'];
    $obj->mail = $dbrow['mail'];
    $obj->school = $dbrow['school'];
    $obj->city = $dbrow['city'];
    $obj->salary = $dbrow['salary'];
    $obj->job = $dbrow['job'];
    $obj->sign = $dbrow['sign'];
    $obj->intro = $dbrow['intro'];
    
    echo json_encode($obj);
}else{
    echo 'fail';
    die();
}

?>