<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

$sql = "select room_id,user_id,description from group_chat_room";
//order by msg_id desc limit 20
$result = mysqli_query($conn,$sql);
$row = mysqli_num_rows($result);

$obj;
$objArr = array();

if($row){
    for($i=0;$i<$row;$i++){
    /*
    查询group_chat_room表，以json形式返回数据
    {
    }
    */  
      $dbrow = mysqli_fetch_array($result); 
      $obj = new stdClass();
      $obj->room_id = $dbrow['room_id'];
      $obj->user_id = $dbrow['user_id'];
      $obj->description = $dbrow['description'];

      array_push($objArr,$obj);
    }
}else{
    echo 'fail';
    die();
} 

echo json_encode($objArr);
?>