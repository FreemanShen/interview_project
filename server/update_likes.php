<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");
//该Php文件用来初始化review表中的点赞数量一行的内容。

$sql = 'select review_id from review';
$result = mysqli_query($conn,$sql);
$row = mysqli_num_rows($result);

if($row){
    for($i=0;$i<$row;$i++){        
        $dbrow = mysqli_fetch_array($result);
        //agreeNum
        $agreeSql = 'select count(*) as agreeNum from likes where review_id = '. $dbrow['review_id'];
        $agreeRes = mysqli_query($conn,$agreeSql);
        $agreeRow = mysqli_fetch_array($agreeRes);
        $agreeNum = $agreeRow['agreeNum']; 
        
        $updateSql = 'update review set likeNum = '.$agreeNum.' where review_id = '.$dbrow['review_id'];
        $updateRes = mysqli_query($conn,$updateSql); 
        if($updateRes){
            echo 'success';
        }else{
            echo 'update die';
            die();
        }
    }
}else{
    echo 'row :'.$row;
    echo 'select review_id die';
    die();
}
?>