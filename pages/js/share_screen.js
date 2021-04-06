
const client = TRTC.createClient({
    mode: 'rtc',
    sdkAppId:1400494399,
    userId:"95588",
    userSig:genTestUserSig("95588").userSig
});


//注册客户端相关事件
client.on('stream-added', event => {
    const remoteStream = event.stream;
    console.log('远端流增加: ' + remoteStream.getId());
    //订阅远端流
    client.subscribe(remoteStream);
});

//订阅远端流成功时播放远端流
client.on('stream-subscribed', event => {
    const remoteStream = event.stream;
    console.log('远端流订阅成功：' + remoteStream.getId());
    // 播放远端流
    remoteStream.play('opposite_viewer');
});    

client.on('peer-leave', event => {
    const userId = event.userId;
    document.getElementById('opposite_viewer').innerHTML= "";
});

//连接房间
//@todo:roomId根据建房处而定
client.join({ roomId:10086}).catch(error => {
    console.error('进房失败 ' + error);
    }).then(() => {
    console.log('进房成功');

    //使用 TRTC.createStream() 方法创建本地音视频流。
    //const localStream = TRTC.createStream({ userId:client.userId, audio: true, video: true });
    const localStream = TRTC.createStream({ userId:client.userId,audio: false, screen: true });
    //调用 LocalStream.initialize() 初始化本地音视频流。

    // 监听屏幕分享停止事件
    localStream.on('screen-sharing-stopped', event => {
        console.log('screen sharing was stopped');
    });

    // 初始化屏幕分享流
    localStream.initialize().then(() => {
        console.log('screencast stream init success');
        // 发布屏幕分享流
        client.publish(localStream).then(() => {
        console.log('screen casting');
        });
    })
})


// 使用一个独立的用户 ID 进行推送屏幕分享
const shareId = 'share-userId';
const shareClient = TRTC.createClient({ mode: 'rtc', sdkAppId, userId, shareId, userSig });

// 指明该 shareClient 不接收任何远端流 （它只负责发送屏幕分享流）
shareClient.on('stream-added', event => {
  const remoteStream = event.stream;
  shareClient.unsubscribe(remoteStream);
});

shareClient.join({ roomId }).then(() => {
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

// 主 Client 中指定取消订阅 shareId 的远端流
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

