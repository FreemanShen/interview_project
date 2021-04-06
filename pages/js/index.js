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
        case "java_server": type = 1; break;
        case "c++_server": type = 2;  break;
        case "go_server": type = 3; break;
        case "html": type = 4; break;

        case "java_android": type = 5; break;
        case "kotlin_android": type = 6;  break;
        case "ios": type = 7; break;
        case "test": type = 8; break;

        case "protect": type = 9; break;
        case "hardware": type = 10;  break;
        case "ee": type = 11; break;
        case "inside": type = 12; break;

        case "algorithm": type = 13;  break;
        case "ai": type = 14; break;
        case "data_sci": type = 15; break;

        case "opsys": type = 16;  break;
        case "csnet": type = 17; break;
        case "ccp": type = 18; break;
        case "data_structure": type = 19;  break;
        case "database": type = 20; break;

        
        default: type=-1; break;
    }
    sessionStorage.setItem('exercise_type',type);
    window.location.href="./question_bank.html?type="+type;
}
