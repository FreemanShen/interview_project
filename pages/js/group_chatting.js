var send_msg;

//sessionStorage更改为localStorage
var  sender_id = sessionStorage.getItem('userId');
var  sender_name = sessionStorage.getItem('username');
var  room_id = GetRequest().room_id;
function GetRequest()
{
    var url = location.search;
    var theRequest = new Object();
    if (url.indexOf("?") != -1)
    {
    var str = url.substr(1);
    strs = str.split("&");
    for(var i = 0; i < strs.length; i ++)
    {
    theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
    }
    }
    return theRequest;
}

function get_msg(){
/*
<div class="messages">


                    <div class="message-item outgoing-message">
                        <div class="message-avatar">
                            <figure class="avatar">
                                <img src="./dist/media/img/women_avatar5.jpg" class="rounded-circle" alt="image">
                            </figure>
                            <div>
                                <h5>Mirabelle Tow</h5>
                                <div class="time">01:20 PM <i class="ti-double-check text-info"></i></div>
                            </div>
                        </div>
                        <div class="message-content">
                            Hello how are you?
                        </div>
                    </div>
                    <div class="message-item">
                        <div class="message-avatar">
                            <figure class="avatar">
                                <img src="./dist/media/img/man_avatar3.jpg" class="rounded-circle" alt="image">
                            </figure>
                            <div>
                                <h5>Byrom Guittet</h5>
                                <div class="time">01:35 PM</div>
                            </div>
                        </div>
                        <div class="message-content">
                            I'm fine, how are you 😃
                        </div>
                    </div>
*/
    //@todo:添加一个用户头像
    let response;
    let getMsgHttp = new XMLHttpRequest();
    getMsgHttp.onreadystatechange = function(){
        if(getMsgHttp.readyState == 4 && getMsgHttp.status == 200){
            response = getMsgHttp.responseText;
            if(response!="fail"){
                let msgNode = document.getElementById('messages')
                msgNode.innerHTML = "";
                let objArr = JSON.parse(response);
                if(objArr!=null && objArr.length!=0){
                    for(let i =0;i<objArr.length;i++){
                        /*
                        {   sender_id:,
                            sender_name:,
                            msg:,
                            chattime:,
                            imgSrc:
                        }
                        @todo- -:
                        导入用户图片
                        */
                        //textNode.value += objArr[i].chattime+"  ;"+objArr[i].sender_name+" : \n"+objArr[i].msg+" \n";      
                        /*
                        @todo:
                        宁还没有登录，请先登录。。。。。
                        */
                        if(objArr[i].sender_id != sender_id && objArr[i].sender_id != parseInt(sender_id)){
                            msgNode.innerHTML += '<div class="message-item">\
                                                        <div class="message-avatar">\
                                                            <figure class="avatar">\
                                                                <img src="./headpic/'+objArr[i].sender_pic_path+'" class="rounded-circle" alt="image">\
                                                            </figure>\
                                                            <div>\
                                                                <h5>'+objArr[i].sender_name+'</h5>\
                                                                <div class="time">'+objArr[i].chattime+'</div>\
                                                            </div>\
                                                        </div>\
                                                        <div class="message-content">'+objArr[i].msg+'\
                                                        </div>\
                                                 </div>';

                        }else{
                            msgNode.innerHTML +=    '<div class="message-item outgoing-message">\
                                                        <div class="message-avatar">\
                                                            <div>\
                                                                <h5 align="right">'+objArr[i].sender_name+'</h5>\
                                                                <div class="time">'+objArr[i].chattime+'</div>\
                                                            </div>\
                                                            <figure class="avatar my_avatar">\
                                                            <img src="./headpic/'+objArr[i].sender_pic_path+'" class="rounded-circle" alt="image">\
                                                            </figure>\
                                                        </div>\
                                                        <div class="message-content my_content">'+objArr[i].msg+'\
                                                        </div>\
                                                    </div>';
                        }
                    }
                }
            }else if(response == "fail"){
            }
        }
    }
    //@还有一个状态校验
    if(room_id!=null&&sender_id!=null){
        //@todo:post地址可以更改
        getMsgHttp.open('POST',"http://localhost/interview-project/server/get_groupchat_beta.php",true);
        getMsgHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
        getMsgHttp.send('room_id='+room_id);
    }
}
/*
校验
if(){

}
*/
setInterval(get_msg,200);

function send_message(){
    send_msg = document.getElementById('msg_to_send').value;

    if(send_msg!='' && send_message!=null){
        //发ajax
        let response;
        let sendMsgHttp = new XMLHttpRequest();
        sendMsgHttp.onreadystatechange = function(){
            if(sendMsgHttp.readyState == 4 && sendMsgHttp.status == 200){
                response = sendMsgHttp.responseText;
                //test
                //console.log(sendMsgHttp.responseText);
                if(response!="fail"){
                    }else if(response == "fail"){
                }
                document.getElementById('msg_to_send').value = '';    
            }
        }

        if(room_id!=null&&sender_id!=null){ 
            //@todo:post地址可以更改
            sendMsgHttp.open('POST',"http://localhost/interview-project/server/add_groupchat_beta.php",true);
            sendMsgHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
            sendMsgHttp.send('sender_id='+sender_id+'&sender_name='+sender_name+'&send_msg='+send_msg+'&room_id='+room_id);
        }    
    }else{
        window.alert('发送信息不能为空!');
    }
}

//console.dir(GetRequest())
window.onload = function(){
    if(GetRequest().room_id == null){
        window.alert('没有权限访问该页面！');
        window.location.href="../html/login.html";
        //@todo:不显示东西或者回退
    }
    if(sender_id==null){
        window.alert('请先登陆！');
        window.location.href="../html/login.html";
    }

    //获取楼主和房间名
    document.getElementById('single_chat_head_user').innerHTML = room_id+"号房间";
    document.getElementById('author_name').innerHTML='愉快的交谈~';
}