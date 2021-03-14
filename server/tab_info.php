<?php
//该文件用来逐行生成数据
include("conn.php");
mysqli_set_charset($conn,'utf8');
$table_name = $_GET['table_name'];
//@change here
$sql = "select * from ".$table_name;
/******** */
//echo $sql."<br>";
$res = mysqli_query($conn,$sql);
$row = mysqli_num_rows($res);
/********** */
//echo $row."<br>";
/*
搜索某张表的字段数，可以得到其长度是多少
在遍历表中所有行数据时，通过一个循环，返回每一行的所有列数据，并用echo输出
*/
$query = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = '".$table_name."' and table_schema ='interview_project'";
//echo $query."<br>";
//以行的形式返回字段
$result = mysqli_query($conn,$query);
//获取字段的长度
$count = mysqli_num_rows($result);
//以行的形式返回字段
$first_column_result = mysqli_query($conn,$query);
//返回第一行
$first_column_row = mysqli_fetch_array($first_column_result,MYSQLI_NUM);
//返回第一行的第一列,即Primary Key
$first_column = $first_column_row[0];
//$column_array存储所有的字段名
$column_array = array();
$column_array[] = $first_column;
for($n=1;$n<$count;$n++){
  $column_row = mysqli_fetch_array($first_column_result,MYSQLI_NUM);
  $column_array[] = $column_row[0];
}
echo '<h4 class="card-title">'.$table_name.'</h4>';
echo '<p class="card-description">'.$table_name.'的具体内容</p>';
echo '<table class="table table-hover tab_info" id="tab">
        <thead>
          <tr>';
for($k = 0; $k<$count; $k++){
  $titleRow = mysqli_fetch_array($result,MYSQLI_NUM);
  echo "<th>".$titleRow[0].'</th>';
}
echo "<th>删除</th>";
echo "<th>编辑</th>";
echo '  </tr>
      </thead>
      <tbody>';
if($row){
  for($i=0;$i<$row;$i++){
    $dbrow = mysqli_fetch_array($res,MYSQLI_NUM); 
    echo '<tr>';
    for($j=0;$j<$count;$j++){
      echo "<td><span>".$dbrow[$j].'</span></td>';
    }
    echo "<td><button class='btn  btn-rounded btn-danger btn-sm' name='$first_column' id='$dbrow[0]' onclick='del(this)'>删除</button></td>";
    if($table_name=='purchases')
      echo "<td><button class='btn  btn-rounded btn-primary btn-sm' name='$first_column' id='$dbrow[0]'>编辑</button></td>";
    else
      echo "<td><button class='btn  btn-rounded btn-primary btn-sm' name='$first_column' id='$dbrow[0]' onclick='edit(this)'>编辑</button></td>";  
    echo '</tr>';
  } 
}else{
  //@提示信息可以再完善一点
  echo '<tr><th>无相关信息</th></tr>';
}
echo '  </tbody>
      </table>';
echo '<p style="text-align:center;margin-top:2.5%;"><button class="btn btn-rounded btn-success btn-fw" id="insert" onclick="insert('."'".$table_name."'".')">插入新数据</button></p>';
//为button添加样式，添加Info.php
//注意要在增删改里面添加错误提醒信息！！！
?>
