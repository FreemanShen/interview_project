<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

//根据点赞数量降序排列
$sql = 'select intro from user where id = 8653666186';
$result = mysqli_query($conn,$sql);
$row = mysqli_fetch_array($result);

if($row['intro']==null){
    echo 'success';
}else{
    echo 'fail';
}



?>