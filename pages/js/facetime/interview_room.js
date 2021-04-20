
//启用客户端
var roomId = parseInt(sessionStorage.getItem('room_id'));
var userId = sessionStorage.getItem('userId');

//sessionStorage更改为localStorage
var  sender_id = sessionStorage.getItem('userId');
var  sender_name = sessionStorage.getItem('username');
//user_id存的是面试方的信息
var receiver_id = sessionStorage.getItem('user_id');


// 使用一个独立的用户 ID 进行推送屏幕分享
const shareId = 'share-'+userId;
const shareClient = TRTC.createClient({
    mode: 'rtc',
    sdkAppId:1400494399,
    userId:shareId,
    userSig:genTestUserSig(shareId).userSig
});


//创建专属的共享流，用于推送屏幕
// 指明该 shareClient 不接收任何远端流 （它只负责发送屏幕分享流）
shareClient.on('stream-added', event => {
    const remoteStream = event.stream;
    shareClient.unsubscribe(remoteStream);
});


//let userId = sessionStorage.getItem('user_id');
//console.log("room_id's value : "+roomId+"typeof roomid="+typeof(roomId)+"; user_id's value : "+userId+"typeof userid="+typeof(userId));
//@todo:client的userid应取决于超级用户是谁，以及输入的用户名。
//@todo:房间id同样需要从建房处获取
if(roomId==null||userId==null||roomId==""||sender_id==null||sender_name==null){
    window.alert('没有权限访问该页面！')
    window.location.href = "../../html/login.html";
}

const client = TRTC.createClient({
    mode: 'rtc',
    sdkAppId:1400494399,
    userId:userId,
    userSig:genTestUserSig(userId).userSig
});


//注册客户端相关事件
client.on('stream-added', event => {
    const remoteStream = event.stream;
    const remoteUserId = remoteStream.getUserId();
    if (remoteUserId === shareId) {
      // 取消订阅自己的屏幕分享流
      client.unsubscribe(remoteStream);
    } else {
      // 订阅其他一般远端流
      client.subscribe(remoteStream);
    }
});

//订阅远端流成功时播放远端流
client.on('stream-subscribed', event => {
    const remoteStream = event.stream;
    console.log('远端流订阅成功：' + remoteStream.getId());
    // 播放远端流
    if(remoteStream.getUserId().indexOf('share')==-1){
        remoteStream.play('opposite_viewer');
        get_receiver_info();    
    }else{
        show();
        //$('#shareScreenModal').modal('show');
        remoteStream.play('share_screen')
    }

});    

client.on('peer-leave', event => {
    if(event.userId.indexOf('share')==-1){
        document.getElementById('opposite_viewer').innerHTML= "";
    }else{
        document.getElementById('share_screen').innerHTML="";
        close();
    }
});

//连接房间
//@todo:roomId根据建房处而定
client.join({ roomId:roomId }).catch(error => {
    console.error('进房失败 ' + error);
    }).then(() => {
    console.log('进房成功');

    //使用 TRTC.createStream() 方法创建本地音视频流。
    const localStream = TRTC.createStream({ userId:client.userId, audio: true, video: true });

    //调用 LocalStream.initialize() 初始化本地音视频流。
    //在本地流初始化成功的回调中，或远端流订阅成功事件回调中，通过调用 Stream.play() 方法在网页中播放音视频。
    //play方法接受一个 div 元素 ID 作为参数，SDK 内部会在该 div 元素下自动创建相应的音视频标签并在其上播放音视频。
    //初始化本地流成功时播放本地流
    localStream.initialize()
    .catch(error => {
        console.error('初始化本地流失败 ' + error);
    })
    .then(() => {
        console.log('初始化本地流成功');
        localStream.play('my_viewer');
        //发布本地流
        client.publish(localStream)
    .catch(error => {
        console.error('本地流发布失败 ' + error);
    })
    .then(() => {
        console.log('本地流发布成功');
    });
    });
    //console.log("本地流发布...");
    });



window.onunload = function(){
client
.leave()
.then(() => {
// 退房成功，可再次调用client.join重新进房开启新的通话。
})
.catch(error => {
console.error('退房失败 ' + error);
// 错误不可恢复，需要刷新页面。
});
}



/**
 * 发送信息
 */
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
        //@todo:post地址可以更改
        sendMsgHttp.open('POST',"http://localhost/interview-project/server/add_singlechat.php",true);
        sendMsgHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
        sendMsgHttp.send('sender_id='+sender_id+'&sender_name='+sender_name+'&send_msg='+send_msg+'&receiver_id='+receiver_id);    
    }else{
        window.alert('发送信息不能为空!');
    }
}


function get_msg(){
    console.log(new Date()+'get msg() executing');
    //@todo:添加一个用户头像
    let response;
    let getMsgHttp = new XMLHttpRequest();
    getMsgHttp.onreadystatechange = function(){
        if(getMsgHttp.readyState == 4 && getMsgHttp.status == 200){
            //let set_head_flag = false;
            response = getMsgHttp.responseText;
            if(response!="fail"){ 
                let msgNode = document.getElementById('messages')
                msgNode.innerHTML = "";
                let objArr = JSON.parse(response);
                console.log(new Date()+'response receving');
                if(objArr!=null && objArr.length!=0){
                    for(let i =0;i<objArr.length;i++){
                        /*
                        {
                            sender_id:,
                            sender_name:,
                            msg:,
                            chattime:,
                            receiver_id:,
                            receiver_name:,
                        }
                        @todo- -:
                        导入用户图片
                        */
                        //textNode.value += objArr[i].chattime+"  ;"+objArr[i].sender_name+" : \n"+objArr[i].msg+" \n";      
                        /*
                        @todo:
                        宁还没有登录，请先登录。。。。。
                        */ 
                        //他方信息
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
                            //己方信息
                            msgNode.innerHTML += '<div class="message-item outgoing-message">\
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
                    //clearInterval(get_msg)
                }


            }else if(response == "fail"){
            }
        }
    }
    //@todo:post地址可以更改
    getMsgHttp.open('POST',"http://localhost/interview-project/server/get_singlechat.php",true);
    getMsgHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
    getMsgHttp.send('sender_id='+sender_id+'&receiver_id='+receiver_id);
}
 
//@todo:添加时间戳，过了一天的内容就去除掉
setInterval(get_msg,1000);

function get_receiver_info(){
    //receiver_id
    let response;
    let getRecevierHttp = new XMLHttpRequest();
    getRecevierHttp.onreadystatechange = function(){
        if(getRecevierHttp.readyState == 4 && getRecevierHttp.status == 200){
    
            response = getRecevierHttp.responseText;
            if(response!="fail"){
                let obj = JSON.parse(response)
                let arr = [];
                arr.push(obj.pic_path)
                arr.push(obj.name)
                document.getElementById('single_chat_img').setAttribute('src','./headpic/'+obj.pic_path);                             
                document.getElementById('single_chat_head_user').innerHTML = obj.name;  
                document.getElementById('user_status').innerHTML = "online";      
                document.getElementById('user_status').classList.remove('text-light');      
                document.getElementById('user_status').classList.add('text-success');                     
                return arr;
            }else if(response == "fail"){
            }
        }
    }
    //@todo:post地址可以更改
    getRecevierHttp.open('POST',"http://localhost/interview-project/server/get_user_info.php",true);
    getRecevierHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
    getRecevierHttp.send('userId='+receiver_id);
    
}

function share_screen(){
    shareClient.join({ roomId:roomId }).then(() => {
        console.log('shareClient join success');
        // 创建屏幕分享流
        const localStream = TRTC.createStream({ audio: false, screen: true });
        localStream.initialize().then(() => {
        // screencast stream init success
            shareClient.publish(localStream).then(() => {
                console.log('screen casting');
            });
        });
    });
}

window.onload = function(){
    get_msg();
}

var mask = document.getElementsByClassName("mask")[0];
var modal = document.getElementsByClassName("modal")[0];
var closes = document.getElementsByClassName("close");
function show(){
    // 获取需要使用到的元素
    mask = document.getElementsByClassName("mask")[0];
    modal = document.getElementsByClassName("modal")[0];
    closes = document.getElementsByClassName("close");
    if(closes[0]!=null)
        closes[0].onclick = close;
    if(closes[1]!=null)
      closes[1].onclick = close;

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