<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

//接收Post信息 'job='+job+'&userId='+userId
$userId = $_POST['userId'];
$password = $_POST['password'];
$username = $_POST['username'];
$mail = $_POST['mail'];
$code = $_POST['code'];
$regID = $_POST['regID'];

$sql;
$result;
//检查Code
$ckSql = "select * from registersession where mail = '".$mail."' and code = '".$code."' and regID = ".$regID;
$ckRes = mysqli_query($conn,$ckSql);
if(mysqli_num_rows($ckRes)==0){
    echo '101';
    die();
}

// insert into user(id,name,password) values(865366186,"Freeman","bestzjs666");
/*
"INSERT INTO Persons (FirstName, LastName, Age) 
VALUES ('Peter', 'Griffin', '35')"
*/
$sql = "insert into user(id,name,password,mail) values(".$userId.",'".$username."','".$password."','".$mail."')";

$result = mysqli_query($conn,$sql);
if(!$result){
    echo 'fail';
    //echo $sql;
    die();
}else{
    echo 'success';
    die();
}  
?>
