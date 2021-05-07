<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");


$type = $_POST['type'];


/*可以加一个条件判断，保证题目是xxx么做过的 通过where实现 */
$sql = 'select * from exercise where type ='.$type.' order by  rand() limit 7 ';
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
      $reason=$dbrow['reason'];

      $obj = new stdClass();
      $obj->questionId = $i+1;
      $obj->questionTitle = $question;
      $obj->questionItems = $ansa.";".$ansb.";".$ansc.";".$ansd.";";
      $obj->reason = $reason;
        
      switch ($correct){
        case 1:
            $obj->questionAnswer = 'A';
            $obj->correctContent = $ansa;
            break;
        case 2:
            $obj->questionAnswer = 'B';
            $obj->correctContent = $ansb;
            break;
        case 3:
            $obj->questionAnswer = 'C';
            $obj->correctContent = $ansc;
            break;
        case 4:
            $obj->questionAnswer = 'D';
            $obj->correctContent = $ansd;
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