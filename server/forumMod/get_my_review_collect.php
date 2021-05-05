<?php
include("../conn.php");
mysqli_set_charset($conn,"utf8");

$objArr = array();
$obj;

$user_id = $_GET['user_id'];

$sql = 'select * from review where review_id in (select review_id from review_collect where user_id = '.$user_id.')';
$result = mysqli_query($conn,$sql);
$row = mysqli_num_rows($result);

if($row){
    /*
        art_id:
        poster:
        question:
        description:
        agreeNum:
        reviewNum:    
        time:  
        select count()
    */

    for($i=0;$i<$row;$i++){
        $obj = new stdClass();
        $dbrow = mysqli_fetch_array($result);
        //文章id
        $obj->art_id = $dbrow['art_id'];
        $obj->review_id = $dbrow['review_id'];
        $obj->ctime = $dbrow['time'];
        
        //作者名称
        $sql_1 = 'select name,intro,pic_path from user where id ='.$dbrow['viewer_id'].'';
        $res = mysqli_query($conn,$sql_1);
        $dbrow_1=mysqli_fetch_array($res);
        $obj->poster_id = $dbrow['viewer_id'];
        $obj->poster=$dbrow_1['name']; 
        $obj->intro=$dbrow_1['intro'];
        if($obj->intro==null){
            $obj->intro = '&nbsp;';
        }
        $obj->pic_path = $dbrow_1['pic_path'];

        //question内容：
        //$obj->question = $dbrow['topic'];
        $sql_getArt = 'select topic from article where art_id = '.$obj->art_id;
        $getTopicRes = mysqli_query($conn,$sql_getArt);
        $getArtRow = mysqli_fetch_array($getTopicRes);
        $obj->question = $getArtRow['topic'];
        
        //description描述：
        $obj->description = $dbrow['content'];

        //agreeNum
        $agreeSql = 'select count(*) as agreeNum from likes where review_id = '.$obj->review_id;
        $agreeRes = mysqli_query($conn,$agreeSql);
        $agreeRow = mysqli_fetch_array($agreeRes);
        $obj->agreeNum = $agreeRow['agreeNum'];   
        /*
            获取图片路径
            $sql_2 = 'select pic_path from user where id ='.$poster_id.'';
            $res = mysqli_query($conn,$sql_2);
            $dbrow_2=mysqli_fetch_array($res);
            $pic_path=$dbrow_2['pic_path']; 
        */
        array_push($objArr,$obj);
    }
}else{
    echo 'fail';
    die();
} 

echo json_encode($objArr);


?>