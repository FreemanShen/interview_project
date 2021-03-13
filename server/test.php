<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");


//$type = $_POST['type'];


/*可以加一个条件判断，保证题目是xxx么做过的 通过where实现 */
$sql = 'select * from exercise where type = 1';
$result = mysqli_query($conn,$sql);
$row = mysqli_num_rows($result);
$objArr = array();

/*
{"questionId":"1",
"questionTitle":"下丘脑与腺垂体之间主要通过下列哪条途径联系？ ",
"questionItems":"神经纤维;神经纤维和门脉系统;垂体门脉系统;垂体束;轴浆运输",
"questionAnswer":"c"},
*/


if($row){
    for($i=0;$i<$row;$i++){
      $dbrow = mysqli_fetch_array($result); 
      $question=$dbrow['question']; 
      $ansa=$dbrow['ansa']; 
      $ansb=$dbrow['ansb']; 
      $ansc=$dbrow['ansc']; 
      $ansd=$dbrow['ansd']; 
      $correct=$dbrow['correct']; 

      $obj = new stdClass();
      $obj->questionId = $i+1;
      $obj->questionTitle = $question;
      $obj->questionItems = $ansa.";".$ansb.";".$ansc.";".$ansd.";";
      
      switch ($correct){
        case 1:
            $obj->questionAnswer = 'a';
            break;
        case 2:
            $obj->questionAnswer = 'b';
            break;
        case 3:
            $obj->questionAnswer = 'c';
            break;
        case 4:
            $obj->questionAnswer = 'd';
            break;
      }
      array_push($objArr,$obj);
    }
    echo json_encode($objArr);
}else{
    echo 'fail';
    die();
}
?>