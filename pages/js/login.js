"use strict";

function redirect(){
    window.location.href="https://github.com";
    console.log('redirect detected....');
}


/*
该函数需要实现这样的功能：
    向Info_check.php发送ajax,发送内容为userJob和userId
    如果返回的内容是'success'
    根据userJob,href到不同的页面
    如果返回的内容是'fail'
    window.alert()
*/
function login(){
  var password = document.getElementById('password').value;
  var userId = document.getElementById('userid').value;
  console.log(userId); console.log(password);

  //@todo:添加一下正则校验。

  var response;
  var checkHttp = new XMLHttpRequest();
  checkHttp.onreadystatechange = function(){
      if(checkHttp.readyState == 4 && checkHttp.status == 200){
        response = checkHttp.responseText;
        //test
        //console.log(checkHttp.responseText);
        if(response!="fail"){

          let obj = JSON.parse(response);
          //跳转页面
          //window.alert('登陆成功！');
          //使用sessiong,暂存用户登录信息
          sessionStorage.setItem('login','true')
          sessionStorage.setItem('username',obj.userName)
          sessionStorage.setItem('userId',userId)
          sessionStorage.setItem('isAdmin',obj.admin);
          sessionStorage.setItem('pic_path',obj.pic_path);
          sessionStorage.setItem('user_json',response);
          window.location.href="../html/index.html";
        }else if(response == "fail"){
          //console.log(response);
          window.alert('请检查输入的账号和密码是否正确');
          location.reload();
        }
      }
    }
    //@todo:post地址可以更改
    checkHttp.open('POST',"http://localhost/interview-project/server/login.php",true);
    checkHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
    checkHttp.send('userId='+userId+'&password='+password);
}