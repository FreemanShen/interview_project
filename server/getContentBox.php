<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

$objArr = array();
$obj;
if($_POST['getArticle'] !='article'){
    echo 'fail';
    die();
}else{
    $user_id = $_POST['user_id'];
    $key = $_POST['key'];
    $methods;
    if($key == 1){
        $methods = ' rand() ';
    }else if($key == 2){
        $methods = ' time desc ';        
    }else if($key == 3){
        $methods = ' agreeNum desc ';
    }else{
        $methods = ' agreeNum desc ';
    }

    $sql = 'select * from article order by '.$methods.' limit 8';
    if($user_id !=-1){
        $sql = 'select * from article where poster_id = '.$user_id.' order by time desc limit 8';    
    }
    $result = mysqli_query($conn,$sql);
    $row = mysqli_num_rows($result);

    if($row){
        //@todo：有很多可以删除掉的
        /*
            art_id:
            poster:
            question:
            description:
            agreeNum:
            reviewNum:      
            select count()
        */

        for($i=0;$i<$row;$i++){
            $obj = new stdClass();
            $dbrow = mysqli_fetch_array($result);
            //文章id
            $obj->art_id = $dbrow['art_id'];
            
            //作者名称
            $sql_1 = 'select name,intro,pic_path from user where id ='.$dbrow['poster_id'].'';
            $res = mysqli_query($conn,$sql_1);
            $dbrow_1=mysqli_fetch_array($res);
            $obj->poster_id = $dbrow['poster_id'];
            $obj->poster=$dbrow_1['name']; 
        
            $obj->intro=$dbrow_1['intro'];
            if($obj->intro==null){
                $obj->intro = '&nbsp;';
            }
            $obj->pic_path = $dbrow_1['pic_path'];

            //question内容：
            $obj->question = $dbrow['topic'];

            //时间
            $obj->ctime = $dbrow['time']; 
            //description描述：
            $obj->description = $dbrow['content'];

            //agreeNum
            $agreeSql = 'select count(*) as agreeNum from good where art_id = '.$obj->art_id;
            $agreeRes = mysqli_query($conn,$agreeSql);
            $agreeRow = mysqli_fetch_array($agreeRes);
            $obj->agreeNum = $agreeRow['agreeNum']; 

            //reviewNum reviewSql
            $reviewSql = 'select count(*) as reviewNum from review where art_id = '.$obj->art_id;
            $reviewRes = mysqli_query($conn,$reviewSql);
            $reviewRow = mysqli_fetch_array($reviewRes);
            $obj->reviewNum = $reviewRow['reviewNum'];   
            
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
}

?>