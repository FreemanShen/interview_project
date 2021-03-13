<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");
$interviewer = $_POST['interviewer'];
$time = time();
$obj;
/*
计算时间差
如果发现有在10分钟内发起的会话，就反馈信息给客户，这时双方进入房间，并且计时器关闭。
select * from sessionlogs where time()-create_time < 180 and interviewer =  
*/
$sql = "select * from sessionlogs where ".$time."-create_time < 30 and interviewer = '".$interviewer."'";
$result = mysqli_query($conn,$sql);
if(!$result){
    echo 'fail';
    die();
}  
$row = mysqli_num_rows($result);
if($row){
    $dbrow=mysqli_fetch_array($result);
    $room_id=$dbrow['room_id']; 
    $interviewee = $dbrow['interviewee'];
    $obj = new stdClass();
    $obj->room_id = $room_id;
    $obj->interviewer = $interviewer;
    $obj->interviewee = $interviewee;
    echo json_encode($obj);
}else{
    echo 'fail';
    die();
}
?>