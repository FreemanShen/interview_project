var room_id;
var user_id;
function enterRoom(){
    room_id = document.getElementById('room_id').value;
    user_id = document.getElementById('user_id').value;
    
    if(room_id==null||room_id==''){
    /*
        @todo:要做值检测
    */
        
    }

    sessionStorage.setItem('room_id',room_id);
    sessionStorage.setItem('user_id',user_id);
    //console.log("room_id's value : "+room_id+"; user_id's value : "+user_id);
    

    //@todo: 添加一个逻辑判断，如果是suroot,才有权限sendInvite()
    if(sessionStorage.getItem('isAdmin')=='1'){
        sendInvite();
        //@todo:添加一个计时器，当过了多久还没响应。。就。。。
    }else{
        //window.alert('你不是管理员，无法发送邀请！');
        //window.location.href='../../html/index.html';
        //@todo:添加一个查房功能？
        if(sessionStorage.getItem('interviewee')!=user_id){
            window.alert('邀请方id输入错误，请重新输入！');
        }else{
            window.location.href="http://localhost/interview-project/pages/html/interview_room.html"
        }
    }

}



//发送添加请求
function sendInvite(){
    let response;
    let inviteHttp = new XMLHttpRequest();
    inviteHttp.onreadystatechange = function(){
        if(inviteHttp.readyState == 4 && inviteHttp.status == 200){
          response = inviteHttp.responseText;
          if(response=="success"){
            //绝对路径？相对路径？
            //@todo:这里有bug
            window.location.href="http://localhost/interview-project/pages/html/interview_room.html"
          }else if(response == "fail"){
          }
          console.log(new Date()+"sendInvite'response : " + response);
        }
      }
      //@todo:post地址可以更改
      inviteHttp.open('POST',"http://localhost/interview-project/server/register_session.php",true);
      inviteHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
      inviteHttp.send('intervieweeId='+sessionStorage.getItem('userId')+'&interviewerId='+user_id+'&roomId='+room_id);
}

