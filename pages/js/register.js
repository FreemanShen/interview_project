function register() {
    var userId = document.getElementById("userid").value;
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var sePassword = document.getElementById('surepassword').value;

   if(password!=sePassword){
     window.alert('两次密码不一致');
     document.getElementById("password").value = "";
     document.getElementById('surepassword').value = "";
     return;
   }
    console.log(userid); console.log(username); console.log(password);
    
    var response;
    var registerHttp = new XMLHttpRequest();
    registerHttp.onreadystatechange = function(){
        if(registerHttp.readyState == 4 && registerHttp.status == 200){
          response = registerHttp.responseText;
          //test
          //console.log(registerHttp.responseText);
          if(response=="success"){
            /*
            if(job=='boss'){
              window.location.href="http://localhost/retail_system_demo/myretail/bossIndex.html";
            }else if(job=='customer'){
              window.location.href="http://localhost/retail_system_demo/retailmain/customerIndex.html?id="+userId;
            }else if(job=='employee'){
              window.location.href="http://localhost/retail_system_demo/myretail/employeeIndex.html?id="+userId;
            }
            */
            //跳转页面
            window.location.href="../html/login.html";
          }else if(response == "fail"){
            //console.log(response);
            window.alert('输入内容不合法');
            //location.reload();
            document.getElementById("userid").value ="";
            document.getElementById("username").value="";
            document.getElementById("password").value="";
          }
        }
      }
      //@todo:post地址可以更改
      registerHttp.open('POST',"http://localhost/interview-project/server/register.php",true);
      registerHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
      registerHttp.send('userId='+userId+'&password='+password+'&username='+username);
}