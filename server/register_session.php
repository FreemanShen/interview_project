<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");


//接收Post信息 
$interviewer = $_POST['interviewerId'];
$interviewee = $_POST['intervieweeId'];
$room_id = $_POST['roomId'];

//执行sql语句，向表中插入会议 
//INSERT INTO `sessionlogs` ( `room_id`, `interviewer`, `interviewee`, `create_time`) VALUES ('8888', '865366186', '864738697', now());
$sql = "INSERT INTO sessionlogs ( room_id, interviewer, interviewee, create_time) VALUES (".$room_id.",'".$interviewer."','".$interviewee."',unix_timestamp(now()))";
$result = mysqli_query($conn,$sql);
if(!$result){
    echo 'fail';
    die();
}else{
    echo 'success';
    die();
} 

?>