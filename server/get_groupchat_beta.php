<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

$room_id = $_POST['room_id'];
$sql = "select *,date_format(chattime,'%Y-%m-%d %r') as cdt from groupchat where room_id='".$room_id."'order by msg_id desc limit 20";
$sql = "select * from (".$sql.") as ch order by msg_id";

$result = mysqli_query($conn,$sql);
$row = mysqli_num_rows($result);

$obj;
$objArr = array();

if($row){
    for($i=0;$i<$row;$i++){
      /*
    查询groupchat表，以json形式返回数据
    {
        sender_id:,
        sender_name:,
        msg:,
        chattime:,
    }
    */  
      $dbrow = mysqli_fetch_array($result); 
      $obj = new stdClass();
      $obj->msg = $dbrow['msg'];
      $obj->sender_id = $dbrow['sender_id'];
      $obj->sender_name = $dbrow['sender_name'];
      $obj->chattime = $dbrow['cdt'];

      $get_pic_Sql = 'select pic_path from user where id = '.$obj->sender_id;
      $get_pic_Res = mysqli_query($conn,$get_pic_Sql);
      $pic_row = mysqli_fetch_array($get_pic_Res);
      $obj->sender_pic_path = $pic_row['pic_path'];

      array_push($objArr,$obj);
    }
}else{
    echo 'fail';
    die();
} 

echo json_encode($objArr);
?>