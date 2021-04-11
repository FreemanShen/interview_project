<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

$poster_id = $_POST['poster_id'];
$topic = str_replace(" "," ",str_replace("\n","<br/>",$_POST['topic']));
$content = str_replace(" "," ",str_replace("\n","<br/>",$_POST['content']));

//call add_article(865366186,'求考研二战研友','我想去清华大学交叉信息学院或浙江大学计算机学院读研究生');
//call add_review(5,865366186,'我是深圳大学的郑景深，请问我可以做你的研友吗？');
$sql = "call add_article(".$poster_id.",'".$topic."','".$content."')";
$result = mysqli_query($conn,$sql);
if($result){
    echo 'success';
}else{
    echo 'fail';
}

?>
