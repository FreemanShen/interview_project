
<?php
include("../conn.php");
mysqli_set_charset($conn,"utf8");
//更新两个表：art的点赞数，和agree表新加一列

/*
返回的内容:                  
pic_path:  
user_name:
likeNum:
content:
time:
art_id:
question:
*/

$id = $_GET['id'];
$sql;
$result;
$obj;
$objArray = array();
$sql = "select * from review where viewer_id = ".$id." order by time desc limit 10";    

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
        $obj->viewer_id = $dbrow['viewer_id'];
        $userSql = "select pic_path,name from user where id = ".$dbrow['viewer_id'];
        $userRes = mysqli_query($conn,$userSql);
        $user = mysqli_fetch_array($userRes);
        $obj->pic_path = $user['pic_path'];
        $obj->user_name = $user['name'];
        $artSql = 'select topic from article where art_id = '.$dbrow['art_id'];
        $artRes = mysqli_query($conn,$artSql);
        $artRow = mysqli_fetch_array($artRes);
        $obj->question = $artRow['topic'];
        $obj->art_id = $dbrow['art_id'];

        array_push($objArray,$obj);
    }
    echo json_encode($objArray);
    die();
}else{
    /*
    $obj = new stdClass();
    $obj->likeNum = 'not found';
    $obj->content = 'not found';
    $obj->time = 'not found';
    $obj->pic_path = 'not found';
    $obj->user_name = 'not found';
    $obj->review_id = '0';
    $obj->viewer_id = 'not found';
    array_push($objArray,$obj);
    echo json_encode($objArray);
    */
    echo 400;
    die();
}

?>
