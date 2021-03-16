<?php
include("conn.php");
mysqli_set_charset($conn,"utf8");

//用一个页面显示所有的表名，即要求用户点击该表名显示出该表所有记录
$sql = "select table_name from information_schema.tables where table_schema = 'interview_project'";
$result = mysqli_query($conn,$sql);

//设置格式
if($result){
  /*
  echo'
  <!-- 显示用户 -->
  <li class="nav-item nav-profile">
    <a href="#" class="nav-link">
      <!--图片-->
      <div class="profile-image">
        <img class="img-xs rounded-circle userpic" src="../html/admin/images/faces/bossFace.jpg" alt="profile image">
      </div>
      <!--客户名字-->
      <div class="text-wrapper">
        <p class="profile-name username">Freeman</p>
        <p class="designation">admin</p>
      </div>
      <div class="icon-container">
        <i class="icon-user"></i>
      </div>
    </a>
  </li>
  <!-- 导航页面dashboard,此处可以用来更新 -->
  <li class="nav-item nav-category">
    <span class="nav-link">TABLE INFORMATION</span>
  </li>
  ';
  */
  //显示表名
  $row = mysqli_num_rows($result);
  if($row){
    for($i =0;$i<$row;$i++){
      $dbrow = mysqli_fetch_array($result,MYSQLI_ASSOC);
      $table_name = $dbrow['table_name'];
      echo '<li class="nav-item">
              <a class="nav-link" href="javascript:void(0);" onclick="showTable(this)">
                <span class="menu-title">'.$table_name.'</span>
                <i class="icon-emotsmile menu-icon"></i>    
              </a>
            </li>';
    }
  }else{
    //echo '无相关数据';
    echo '<li class="nav-item">
            <a class="nav-link" href="javascript:void(0);">
              <span class="menu-title">'.'无数据表名'.'</span>
              <i class="icon-emotsmile menu-icon"></i>    
            </a>
          </li>';
          die();
  }
  echo '
    <li class="nav-item nav-category"><span class="nav-link">FUNCTION</span></li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
        <span class="menu-title">Monthly Report</span>
        <i class="icon-magnifier menu-icon"></i>
      </a>
      <!--这一部分可以用来做下拉框-->
      <div class="collapse" id="auth">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> 
            <input type="text" class="search-form d-none d-md-block form-control" placeholder="Search Here" title="Search here" id="pid">    
          </li>
          <li class="nav-item" style="text-align:center;margin-top:5%;"> 
            <button type="button" class="btn btn-success btn-rounded btn-fw" onclick="generateMonthlyReport()">生成月报表</button>
          </li>    
        </ul>
      </div>
    </li>
  ';
}else{
  //echo '显示失败';
  die();
}
?>
