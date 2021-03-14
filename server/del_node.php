<?php
include('conn.php');
mysqli_set_charset($conn,'utf8');
$id = $_POST['id'];
$name = $_POST['name'];
$table_name = $_POST['table_name'];
$sql = "delete from ".$table_name." where ".$name." = ".$id;
$res = mysqli_query($conn,$sql);
if($res){
}else{
  $sql = "delete from ".$table_name." where ".$name." = '".$id."'";
  $res = mysqli_query($conn,$sql);
  if(!$res){
    echo "fail";
  }
}
echo "success";
?>