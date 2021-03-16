window.onload = function(){
    //页面渲染之后，查看一下sessionStorage的登陆状态，如果是已登录，修改button里的内容，做一个跳转
    if(sessionStorage.getItem('login') == 'true'){
        document.getElementById('userInfoBtn').innerHTML="欢迎,"+sessionStorage.getItem('username');
        document.getElementById('userInfoBtn').setAttribute("disabled", true);
    }
    if(sessionStorage.getItem("isAdmin")=="1"){
        let aNode = document.createElement('a');
        aNode.innerHTML= "管理"
        aNode.setAttribute("href","./admin.html");
        document.getElementById('nav').appendChild(aNode);
    }
}

function backTologin(){
    window.location.href ="../html/login.html";
}

function loadToQuestion(node){
    console.log(node.id);
    let type = 1;
    switch(node.id){
        case "java": type = 1; break;
        case "c++": type = 2;  break;
        case "algorithm": type = 3; break;
        case "html": type = 4; break;
        default:break;
    }
    sessionStorage.setItem('exercise_type',type);
    window.location.href="./question_bank.html";
}