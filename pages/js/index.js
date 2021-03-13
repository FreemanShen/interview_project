window.onload = function(){
    //页面渲染之后，查看一下sessionStorage的登陆状态，如果是已登录，修改button里的内容，做一个跳转
    if(sessionStorage.getItem('login') == 'true'){
        document.getElementById('userInfoBtn').innerHTML="欢迎,"+sessionStorage.getItem('username');
        document.getElementById('userInfoBtn').setAttribute("disabled", true);
    }
}

function backTologin(){
    window.location.href ="../html/login.html";
}