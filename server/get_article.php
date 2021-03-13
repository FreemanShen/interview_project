<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

$objArr = array();
$obj;
if($_POST['getArticle'] !='article'){
    echo 'fail';
    die();
}else{
    $sql = 'select * from article';
    $result = mysqli_query($conn,$sql);
    $row = mysqli_num_rows($result);

    if($row){
        for($i=0;$i<$row;$i++){
          $dbrow = mysqli_fetch_array($result); 
          $poster_id=$dbrow['poster_id']; 
          $content = $dbrow['content'];
          $topic = $dbrow['topic'];
          $job = $dbrow['job'];
          $loc = $dbrow['loc'];
          $company = $dbrow['company'];
          $time = $dbrow['time'];

          $sql_1 = 'select name from user where id ='.$poster_id.'';
          $res = mysqli_query($conn,$sql_1);
          $dbrow_1=mysqli_fetch_array($res);
          $poster_name=$dbrow_1['name']; 

          $sql_2 = 'select pic_path from user where id ='.$poster_id.'';
          $res = mysqli_query($conn,$sql_2);
          $dbrow_2=mysqli_fetch_array($res);
          $pic_path=$dbrow_2['pic_path']; 

          $obj = new stdClass();
          $obj->poster_id = $poster_id;
          $obj->content = $content;
          $obj->topic = $topic;
          $obj->job = $job;
          $obj->loc = $loc;
          $obj->company = $company;
          $obj->time = $time;
          $obj->poster_name = $poster_name;
          $obj->pic_path = $pic_path;
          array_push($objArr,$obj);
        }
    }else{
        echo 'fail';
        die();
    } 

    echo json_encode($objArr);
}

?>