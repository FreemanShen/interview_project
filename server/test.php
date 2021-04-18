<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

/*
insert into exercise(type,question,ansa,ansb,ansc,ansd,correct,reason)
values(2,"c++ question 3","c++ question 3 answer a","c++ question 3 answer b"
,"c++ question 3 answer c","c++ question 3 answer d",3,"question 3 reason")
*/

$sql;
$result;
$me = md5('bestzjs666');
echo $me;
// insert user(id,name,password) values(865366186,"Freeman","bestzjs666");
/*
"INSERT INTO Persons (FirstName, LastName, Age) 
VALUES ('Peter', 'Griffin', '35')"
*/
/*
for($type = 1;$type<21;$type++){
    for($counter = 1;$counter<10;$counter++){
        $question = "type ".$type." question ".$counter."";
        $ansa = "type ".$type." question ".$counter." ansa ";
        $ansb = "type ".$type." question ".$counter." ansb ";
        $ansc = "type ".$type." question ".$counter." ansc ";
        $ansd = "type ".$type." question ".$counter." ansd ";
        $reason = "type ".$type." question ".$counter." reason ";
        $number = floor(mt_rand(1,4.9));
        $sql = "insert into exercise(type,question,ansa,ansb,ansc,ansd,correct,reason) values(".$type.",'".$question."','".$ansa."','".$ansb."','".$ansc."','".$ansd."',".$number.",'".$reason."')";
        $result = mysqli_query($conn,$sql);
        //echo $sql;
        if(!$result){
            echo 'fail';
            //echo $sql;
            die();
        }else{
            echo 'success number: '.$number.'<br>';
            //die();
        }  
    }
}
die();
*/
?>
