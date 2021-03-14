<?php
//返回统计信息
include("conn.php");
mysqli_set_charset($conn,"utf8");

//使用联合来实现多表查询
$sql = '
  select sum(userNum) as userSum,sum(articleNum) as articleSum,sum(interviewNum) as interviewSum
  from(
  select count(*) userNum,0 articleNum,0 interviewNum from user
  UNION all
  select 0 userNum,count(*) articleNum,0 interviewNum from article
  UNION all
  select 0 userNum,0 articleNum,count(*) interviewNum from sessionlogs
  ) t;
';

$res = mysqli_query($conn,$sql);
if(!$res){
  echo '<script>console.log(statis wrong!)</script>';
}

$returnInfo = mysqli_fetch_array($res);
$info = json_encode($returnInfo);
echo $info;
?>