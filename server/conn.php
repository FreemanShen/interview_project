<?php 
$hostname = "localhost";
$user = "root";
$password = "";
$database = "interview_project";
$conn = mysqli_connect($hostname,$user,$password,$database);
if($conn){
 //echo "数据库连接成功";
}else{
 //echo "数据库连接失败";
  die(mysqli_connect_error());
}
?>