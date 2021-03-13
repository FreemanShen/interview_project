<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

//接收Post信息 'job='+job+'&userId='+userId
$userId = $_POST['userId'];
$password = $_POST['password'];
$username = $_POST['username'];
$sql;
$result;

// insert into user(id,name,password) values(865366186,"Freeman","bestzjs666");
/*
"INSERT INTO Persons (FirstName, LastName, Age) 
VALUES ('Peter', 'Griffin', '35')"
*/
$sql = "insert into user(id,name,password) values(".$userId.",'".$username."','".$password."')";

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
