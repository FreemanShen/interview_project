<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

$user_id = $_POST['user_id'];
$art_id = $_POST['art_id'];
$content = str_replace(" "," ",str_replace("\n","<br/>",$_POST['content']));

//call add_review(5,865366186,'我是深圳大学的郑景深，请问我可以做你的研友吗？');
$sql = "call add_review(".$art_id.",".$user_id.",'".$content."')";
$result = mysqli_query($conn,$sql);
if($result){
    echo 'success';
}else{
    echo 'fail';
}

?>
