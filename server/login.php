<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

//接收Post信息 'job='+job+'&userId='+userId
$userId = $_POST['userId'];
$password = $_POST['password'];
$dbPassword;
$userName;
$sql;
$result;
$obj;


$sql = 'select * from user where id = '.$userId.'';
$result = mysqli_query($conn,$sql);
if(!$result){
    echo 'fail';
    die();
}  
$row = mysqli_num_rows($result);
if($row){
    $dbrow=mysqli_fetch_array($result);
    $dbPassword=$dbrow['password']; 
    if($password == $dbPassword){
        //切换登录状态
        
        $updateSql = "update user SET last_login = now() WHERE id = ".$userId."";
        $res = mysqli_query($conn,$updateSql);
        if(!$res){
            echo 'fail';
            die();
        } 
        //@超级用户怎么说?
        //返回用户名
        $userName = $dbrow['name'];        
        $obj = new stdClass();
        $obj->userName = $userName;        
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
        die();
    }else{
        echo 'fail';
        die();
    }
}else{
    echo 'fail';
    die();
}
    
?>
