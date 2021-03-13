var interval;

function receive(){
    var response;
    var receiveInviationHttp = new XMLHttpRequest();
    receiveInviationHttp.onreadystatechange = function(){
        if(receiveInviationHttp.readyState == 4 && receiveInviationHttp.status == 200){
          response = receiveInviationHttp.responseText;
          //test
          //console.log(receiveInviationHttp.responseText);
          if(response!="fail"){
            clearInterval(interval);
            let obj = JSON.parse(response);
            sessionStorage.setItem("interviewee",obj.interviewee);
            window.alert(obj.interviewee+'邀请您进入面试房间'+obj.room_id);
            window.location.href="../html/facetime.html";
          }else{
            console.log(new Date()+"未收到面试邀请");
          }
        }
      }
      //@todo:post地址可以更改
      receiveInviationHttp.open('POST',"http://localhost/interview-project/server/get_interview.php",true);
      receiveInviationHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
      receiveInviationHttp.send('interviewer='+sessionStorage.getItem('userId'));

}

if(sessionStorage.getItem('login')=='true' &&sessionStorage.getItem('isAdmin')=='0'){
    var interval = setInterval(receive,1000);
}
