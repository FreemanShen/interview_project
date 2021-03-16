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
    /*
    // 获取需要使用到的元素
    var toggleModal = document.getElementById("toggleModal");
    var container = document.getElementsByClassName("container")[0];
    var mask = document.getElementsByClassName("mask")[0];
    var modal = document.getElementsByClassName("modal")[0];
    var closes = document.getElementsByClassName("close");
    toggleModal.onclick = show;
    closes[0].onclick = close;
    closes[1].onclick = close;
    function show(){
        mask.style.display = "block";
        modal.style.display = "block";
    }
    function close(){
        mask.style.display = "none";
        modal.style.display = "none";
    }
    */
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