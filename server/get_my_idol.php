<?php
//type: "GET"
//dataType: "json",
/*
    pic_path:
    star_name:
    star_sign:
*/
include("conn.php");
mysqli_set_charset($conn,"utf8");

$obj;
$objArr = array();
$id = $_GET['user_id'];
$sql = 'select star from follower where fans = '.$id;
$result = mysqli_query($conn,$sql);
$row = mysqli_num_rows($result);
if($row == 0){
    echo 'fail';
    die();
}else{
    for($i=0;$i<$row;$i++){
        $obj = new stdClass();
        $dbrow = mysqli_fetch_array($result);
        $getStarSql = 'select pic_path,name as star_name,sign as star_sign from user where id = '.$dbrow['star'];
        $getStarRes = mysqli_query($conn,$getStarSql);
        $getStarRow = mysqli_fetch_array($getStarRes);
        $obj->pic_path = $getStarRow['pic_path'];
        $obj->star_name = $getStarRow['star_name'];
        $obj->star_sign = $getStarRow['star_sign'];
        array_push($objArr,$obj);     
    }
    echo json_encode($objArr);
    die();
}
?>