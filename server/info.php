<?php
//该Php文件用来返回例如表名，列数目等常用信息，方便前端调用
include("conn.php");
mysqli_set_charset($conn,'utf8');
$table_name = $_GET['table_name'];
$sql = "select * from ".$table_name;
/******** */
//echo $sql."<br>";
$res = mysqli_query($conn,$sql);
$row = mysqli_num_rows($res);
/********** */
//echo $row."<br>";
/*
搜索某张表的字段数，可以得到其长度是多少
在遍历表中所有行数据时，通过一个循环，返回每一行的所有列数据，并用echo输出
*/
$query = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = '".$table_name."' and table_schema ='interview_project'";
//echo $query."<br>";
//以行的形式返回字段
$result = mysqli_query($conn,$query);
//获取字段的长度
$count = mysqli_num_rows($result);
//以行的形式返回字段
$first_column_result = mysqli_query($conn,$query);
//返回第一行
$first_column_row = mysqli_fetch_array($first_column_result,MYSQLI_NUM);
//返回第一行的第一列,即Primary Key
$first_column = $first_column_row[0];
//$column_array存储所有的字段名
$column_array = array();
$column_array[] = $first_column;
for($n=1;$n<$count;$n++){
  $column_row = mysqli_fetch_array($first_column_result,MYSQLI_NUM);
  $column_array[] = $column_row[0];
}

$response_arr = array();
$response_arr[] = $table_name;
$response_arr[] = count($column_array);
$response_arr[] = json_encode($column_array);
$response_arr[] = $first_column;

echo json_encode($response_arr);
?>