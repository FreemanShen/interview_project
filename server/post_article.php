<?php
include('conn.php');
mysqli_set_charset($conn,'utf8');

$article_info = json_decode($_POST['articleInfo']);
$poster_id;$content;$topic;$job;$loc;$company;
$poster_id = $article_info->author_id;
$content = $article_info->article;
$topic = $article_info->title;
$job = $article_info->job;
$loc = $article_info->location;
$company = $article_info->company_name;

/*
insert into article(poster_id,content,time,topic,job,loc,company)
values(865366186,"我是天选，也是唯一",now(),"卢本伟","游戏主播","深圳","克莱登")
*/
$sql = "insert into article(poster_id,content,time,topic,job,loc,company) values(".$poster_id.",'".$content."',now(),'".$topic."','".$job."','".$loc."','".$company."')";
$result = mysqli_query($conn,$sql);
if(!$result){
    echo 'fail';
    die();
}else{
    echo 'success';
} 

?>