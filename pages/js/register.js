var regID = -1;
function register() {
    var userId = document.getElementById("userid").value;
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var sePassword = document.getElementById('surepassword').value;
    var code = document.getElementById('mailCode').value;
    var mail = document.getElementById('mail').value;
   if(password!=sePassword){
     window.alert('两次密码不一致');
     document.getElementById("password").value = "";
     document.getElementById('surepassword').value = "";
     return;
   }
   if(regID == -1){
      window.alert('请先绑定邮箱');
      return;
   }
   if(validate(userId)&&validate(username)&&validate(password)&&validate(sePassword)&&validate(code)&&validate(mail)){
      var response;
      var registerHttp = new XMLHttpRequest();
      registerHttp.onreadystatechange = function(){
          if(registerHttp.readyState == 4 && registerHttp.status == 200){
            response = registerHttp.responseText;
            //test
            //console.log(registerHttp.responseText);
            if(response=="success"){
              //跳转页面
              window.alert('注册成功!');
              window.location.href="../html/login.html";
            }else if(response == "fail"){
              //console.log(response);
              window.alert('输入内容不合法');
              //location.reload();
              clearForm();
            }else if(response == "101"){
              window.alert('验证码不正确!');
              clearForm();
            }
          }
        }
        //@todo:post地址可以更改
        registerHttp.open('POST',"http://localhost/interview-project/server/register.php",true);
        registerHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
        registerHttp.send('userId='+userId+'&password='+md5(password)+'&username='+username+'&mail='+mail+'&code='+code+'&regID='+regID);
   }
   else{
      window.alert('输入内容包含非法字符！请重新输入');
      //document.getElementById("password").value = "";
      //document.getElementById('surepassword').value = "";
      return;     
   }
   //console.log(userid); console.log(username); console.log(password);
    
}
function send_mail(){
  let mailStr = document.getElementById('mail').value;
  if(mail_valid(mailStr)){
    regID = Math.round(Math.random()*100000000);
    //向php发东西
    $.ajax({
      url: "http://localhost/interview-project/server/LRMod/register_mail.php",
      data: {regID:regID,mailTo:mailStr},
      type: "GET",
      //dataType: "json",
      success: function(data) {
        if(data=='success'){
          window.alert('验证码已发送，请注意查收,一分钟内有效');
          $('#send_mail').attr("disabled",true);
          //1分钟后恢复
          setTimeout(()=>{
            $('#send_mail').attr("disabled",false);
          },60000)
        }else if(data == '100'){
          window.alert('请检查邮箱是否有误');
        }
      }
    });
  }else{
    window.alert('请检查邮箱是否有误');
  }
}

function clearForm(){
  document.getElementById("userid").value ="";
  document.getElementById("username").value="";
  document.getElementById("password").value="";
  document.getElementById('surepassword').value = "";
  document.getElementById('mailCode').value = "";
  document.getElementById('mail').value = "";
}