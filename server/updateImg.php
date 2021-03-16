<?php
include('conn.php');
mysqli_set_charset($conn,'utf8');

$id = $_POST["userId"];
if(isset($_FILES["myfile"]))
{
$ret = array();
//$uploadDir = 'images'.DIRECTORY_SEPARATOR.date("Ymd").DIRECTORY_SEPARATOR;
//$uploadDir = 'uploads'.DIRECTORY_SEPARATOR;
//$dir = dirname(__FILE__).DIRECTORY_SEPARATOR.$uploadDir;
$dir = "../pages/html/headpic/";
file_exists($dir) || (mkdir($dir,0777,true) && chmod($dir,0777));
if(!is_array($_FILES["myfile"]["name"])) //single file
{
//$fileName = time().uniqid().'.'.pathinfo($_FILES["myfile"]["name"])['extension'];
//@修改这里
//$fileName = $_FILES["myfile"]["name"];
$fileName = "head_pic_".$id.".jpg";

$sql = "update user set pic_path = '".$fileName."' where id = ".$id;
$result = mysqli_query($conn,$sql);
if(!$result){
    echo 'fail';
    die();
}

move_uploaded_file($_FILES["myfile"]["tmp_name"],$dir.$fileName);
//$ret['file'] = DIRECTORY_SEPARATOR.$uploadDir.$fileName;
}
//echo $dir.$fileName;
//echo "console.log('id value = '".$id.")";
echo 'success';
}
?>