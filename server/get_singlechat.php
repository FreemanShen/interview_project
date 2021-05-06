<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

$sender_id = $_POST['sender_id'];
$receiver_id = $_POST['receiver_id'];


$sql = "select *,date_format(chattime,'%Y-%m-%d %r') as cdt from singlechat where (sender_id = ".$sender_id." and receiver_id = ".$receiver_id.") or (sender_id =".$receiver_id." and receiver_id = ".$sender_id.") order by chattime desc limit 20";
$sql = "select * from (".$sql.") as ch order by chattime";

$result = mysqli_query($conn,$sql);
if(!$result){
    echo 'fail';
    die();
}
$row = mysqli_num_rows($result);

$obj;
$objArr = array();

if($row){
    for($i=0;$i<$row;$i++){
        /*
        查询singlechat表，以json形式返回数据
        {
            sender_id:,
            sender_name:,
            msg:,
            chattime:,
            receiver_id:,
            receiver_name:,
        }
        */  
        $dbrow = mysqli_fetch_array($result); 
        $obj = new stdClass();
        $obj->msg = $dbrow['msg'];
        $obj->sender_id = $dbrow['sender_id'];
        $obj->chattime = $dbrow['cdt'];
        $obj->receiver_id = $dbrow['receiver_id'];      


        //获取sendername和receivername
        $receiverSql = 'select name,pic_path from user where id = '.$dbrow['receiver_id'].'';
        $senderSql = 'select name,pic_path from user where id ='.$dbrow['sender_id'].'';
        $reRes = mysqli_query($conn,$receiverSql);
        $sdRes = mysqli_query($conn,$senderSql);

        if(!$reRes || !$sdRes){
            echo 'fail';
            die();
        }  
        $rerow = mysqli_num_rows($reRes);
        if($rerow){
            $rerow=mysqli_fetch_array($reRes);
            $obj->receiver_name=$rerow['name']; 
            $obj->recevier_pic_path = $rerow['pic_path'];
        }else{
            echo 'fail';
            die();
        }

        $sdrow = mysqli_num_rows($sdRes);
        if($sdrow){
            $sdrow=mysqli_fetch_array($sdRes);
            $obj->sender_name=$sdrow['name']; 
            $obj->sender_pic_path = $sdrow['pic_path'];

        }else{
            echo 'fail';
            die();
        }

      array_push($objArr,$obj);
    }
}else{
    echo 'fail';
    die();
} 

echo json_encode($objArr);
?>