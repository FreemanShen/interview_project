var screenHeight = $(window).height();
var screenWidth = $(window).width();

$(function(){
    $('body').css('height',screenHeight+'px')
    $('body').css('width',screenWidth+'px')

    var top1=$("#left_content").offset().top;
    $(window).scroll(function(){
        var  win_top=$(this).scrollTop();
        //console.log("win_top: ",win_top);
        // var  top=$(".c").offset().top;
        // console.log("top: ",top);

        if(win_top>=top1){
            // $(".c").addClass("sfixed");
            $("#left_content").css({"position":"fixed","top":"0"})
            $("#article").css({"margin-left":"244px"})
        }
        if(win_top<top1){
            // $(".c").removeClass("sfixed");
            $("#left_content").css({"position":"static"})
            $("#article").css({"margin-left":"0%"})
        
        }
    })
})　

window.onresize = function(){
    let screenHeight = $(window).height();
    let screenWidth = $(window).width();
    $('body').css('height',screenHeight+'px')
    $('body').css('width',screenWidth+'px')
}

window.onload = function(){
  
    console.log("onload exectuing...");

    if(sessionStorage.getItem("isAdmin")=="1"){
        let aNode = document.createElement('a');
        aNode.innerHTML= "管理"
        aNode.setAttribute("href","./admin.html");
        document.getElementById('nav').appendChild(aNode);
    }

    //页面渲染之后，查看一下sessionStorage的登陆状态，如果是已登录，修改button里的内容，做一个跳转
    if(sessionStorage.getItem('login') == 'true'){
        document.getElementById('userInfoBtn').innerHTML="欢迎,"+sessionStorage.getItem('username');
        document.getElementById('userInfoBtn').setAttribute("disabled", true);
    }


    /*
        ajax获取内容
    */
    var getArticleHttp = new XMLHttpRequest();
    getArticleHttp.onreadystatechange = function(){
        if(getArticleHttp.readyState == 4 && getArticleHttp.status == 200){
          response = getArticleHttp.responseText;
          //test
          //console.log(getArticleHttp.responseText);
          if(response!="fail"){
            var obj = JSON.parse(this.response);
            for(let i = 0; i<obj.length;i++){
                var ulNode = document.getElementById('article_list');
                var newNode = document.createElement('li');              
                newNode.innerHTML = "<div class='forum'><div class='forum_main'><p><img src='./headpic/"+obj[i].pic_path+"'>"+"</p><p>"+obj[i].poster_name+"</p></div> <h2 class='title'>"+obj[i].topic+"</h2>"+"<h5 class='time'>"+obj[i].time.toString()+"</h5><h5 class='brief'><span>"+obj[i].company+"</span>&nbsp;&nbsp;&nbsp;<span>"+obj[i].loc+"</span>&nbsp;&nbsp;&nbsp;<span>校招/秋招/社招</span></h5>"+"<p class='intro'>"+obj[i].content+"</p>"+"</div>"
                ulNode.appendChild(newNode);
            }
    
        }else if(response == "fail"){
            
          }
        }
      }
      //@todo:post地址可以更改
      getArticleHttp.open('POST',"http://localhost/interview-project/server/get_article.php",true);
      getArticleHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
      getArticleHttp.send('getArticle=article');
    
}

function backTologin(){
    window.location.href ="../html/login.html";
}