
<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");
//更新两个表：art的点赞数，和agree表新加一列

/*
返回的内容:                  
pic_path:  
user_name:
likeNum:
content:
time
*/

$art_id = $_GET['art_id'];
$type = $_GET['type'];
$sql;
$result;
$obj;
$objArray = array();
if($type == 1){
    $sql = "select review_id,content,likeNum,time,viewer_id as id from review where art_id = ".$art_id." order by time desc limit 20";    
}else{
    $sql = "select review_id,content,likeNum,time,viewer_id as id from review where art_id = ".$art_id." order by likeNum desc,time desc limit 20";    
}
$result = mysqli_query($conn,$sql);
$row = 0;
$row = mysqli_num_rows($result);
if($row!=0){
    for($i=0;$i<$row;$i++){
        $dbrow = mysqli_fetch_array($result);
        $obj = new stdClass();
        $obj->likeNum = $dbrow['likeNum'];
        $obj->content = $dbrow['content'];
        $obj->time = $dbrow['time'];
        $obj->review_id = $dbrow['review_id'];

        $userSql = "select pic_path,name from user where id = ".$dbrow['id'];
        $userRes = mysqli_query($conn,$userSql);
        $user = mysqli_fetch_array($userRes);
        $obj->pic_path = $user['pic_path'];
        $obj->user_name = $user['name'];
        array_push($objArray,$obj);
    }
    echo json_encode($objArray);
}else{

    $obj->likeNum = 'not found';
    $obj->content = 'not found';
    $obj->time = 'not found';
    $obj->pic_path = 'not found';
    $obj->user_name = 'not found';
    $obj->review_id = '0';
    array_push($objArray,$obj);
    echo json_encode($objArray);
}

?>
