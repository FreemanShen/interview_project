var interval;


function show(){
    // 获取需要使用到的元素
    let mask = document.getElementsByClassName("mask")[0];
    let modal = document.getElementsByClassName("modal")[0];
    let closes = document.getElementsByClassName("close");
    if(closes[0]!=null)
        closes[0].onclick = close;
    //if(closes[1]!=null)
      //closes[1].onclick = close;

    if(mask!=null && modal!=null){
        mask.style.display = "block";
        modal.style.display = "block";    
    }
}
function close(){   
    if(mask!=null && modal!=null){
        mask.style.display = "none";
        modal.style.display = "none";
    }
}

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
            /*
            let obj = JSON.parse(response);
            sessionStorage.setItem("interviewee",obj.interviewee);
            if(window.confirm(obj.interviewee+'邀请您进入面试房间'+obj.room_id)){
              window.location.href="../html/facetime.html";
            }
            */
            //@todo:结点的获取应该放在window.onload中执行
            let obj = JSON.parse(response);
            sessionStorage.setItem("interviewee",obj.interviewee);
            document.getElementById('interview_info').innerHTML = obj.interviewee+'邀请您进入面试房间'+obj.room_id;
            show();
            console.log(new Date()+"detect :"+obj.interviewee+'邀请您进入面试房间'+obj.room_id);
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

function accept_interview(){
  window.location.href="../html/facetime.html";
}