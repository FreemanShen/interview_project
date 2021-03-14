<?php
//该文件用来向数据库中插入元组
include("conn.php");
mysqli_set_charset($conn,"utf8");

$table_name = $_POST['table_name'];
$column_name = json_decode($_POST['column_name'],true);
$column_value = json_decode($_POST['column_value'],true);
$length = count($column_name);
/*
$table_name = $_POST['table_name'];
$column_name = json_decode($_POST['column_name'],true);
$column_value = json_decode($_POST['column_value'],true);
$length = count($column_name);
*/
$sql = "insert into ".$table_name."(";
for($i=0;$i<$length;$i++){
  if($i<$length-1)
    $sql = $sql.$column_name[$i].",";
  else
    $sql = $sql.$column_name[$i].")VALUES(";
}
$flag = false;
for($i=0;$i<$length;$i++){
  if($i<$length-1){
    //判断是否为数字
    if(is_numeric($column_value[$i])){
      $sql = $sql.$column_value[$i].",";
    }
    else{
      $sql = $sql."'".$column_value[$i]."',";
    }
  }else{
    if(is_numeric($column_value[$i]) && ($table_name =='logs' || $table_name =='suppliers')){
      $sql = $sql."'".$column_value[$i]."')";
    }else if(is_numeric($column_value[$i])){
      $sql = $sql.$column_value[$i].")";  
    }else{
      $sql = $sql."'".$column_value[$i]."')";
    }
  }
}
$res = mysqli_query($conn,$sql);
if($res){
  echo 'success';
}else{
  echo 'fail';
}
?>