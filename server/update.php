<?php
include('conn.php');
mysqli_set_charset($conn,'utf8');

$obj = json_decode($_POST['obj']);

//echo '$obj->name:'.$obj->name.'$obj->sex:'.$obj->sex.'$obj->tel:'.$obj->tel.'$obj->mail:'.$obj->mail.'$obj->school:'.$obj->school.'$obj->city:'.$obj->city.'$obj->salary:'.$obj->salary;

$sql = "update user set name = '".$obj->name."',sex = '".$obj->sex."',tel = ".$obj->tel.",mail = '".$obj->mail."',school = '".$obj->school."',city ='".$obj->city."',salary = '".$obj->salary."', job = '".$obj->job."',sign = '".$obj->sign."',intro = '".$obj->intro."' where id = ".$obj->id;
//echo 'console.log('.$sql.")";
$result = mysqli_query($conn,$sql);
if(!$result){
    echo 'fail';
    die();
}else{
    echo 'success';
} 

?>