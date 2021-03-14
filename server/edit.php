<?php
include('conn.php');
mysqli_set_charset($conn,'utf8');

$table_name = $_POST['table_name'];
$column_name = json_decode($_POST['column_name'],true);
$column_value = json_decode($_POST['column_value'],true);
$length = count($column_name);

for($i=1;$i<$length;$i++){
  $sql = "update ".$table_name." set ".$column_name[$i]." = '".$column_value[$i]."' where ".$column_name[0]." = ".$column_value[0];
  $res = mysqli_query($conn,$sql);
  if(!$res){
    $sql = "update ".$table_name." set ".$column_name[$i]." = '".$column_value[$i]."' where ".$column_name[0]." = '".$column_value[0]."'";
    $res =mysqli_query($conn,$sql);
    if(!$res){
      $output = 'fail';
      echo $output;
      die("mysql_request_error");
    }
  }
}
$output = 'success';
echo $output;

?>