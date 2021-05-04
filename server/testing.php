<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");
$regID = 12345;
$code =generateCode();
$sql = "insert into registersession(regID,code,cTime) values(".$regID.",'".$code."',unix_timestamp(now()))";
$result = mysqli_query($conn,$sql);
if(!$result){
    echo 'fail';
    //echo $sql;
    die();
}else{
    echo 'success';
    die();
}     

function generateCode(){
    $vertify = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    $sd = '';
    for ($i = 0; $i < 8; $i++) {
        //向下取整 
        $random = rand(0,strlen($vertify)-1);
        //1：初始化验证码 空字符  res长度为6
        $sd = $sd.$vertify[$random];
    }
    return $sd;
}
?>