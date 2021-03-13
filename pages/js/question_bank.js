var screenHeight = $(window).height();
var screenWidth = $(window).width();

window.onresize = function(){
    let screenHeight = $(window).height();
    let screenWidth = $(window).width();
    $('body').css('height',screenHeight+'px')
    $('body').css('width',screenWidth+'px')
}

window.onload = function(){
  
    console.log("onload exectuing...");

    //页面渲染之后，查看一下sessionStorage的登陆状态，如果是已登录，修改button里的内容，做一个跳转
    if(sessionStorage.getItem('login') == 'true'){
        document.getElementById('userInfoBtn').innerHTML="欢迎,"+sessionStorage.getItem('username');
        document.getElementById('userInfoBtn').setAttribute("disabled", true);
    }
}

function backTologin(){
    window.location.href ="../html/login.html";
}


var response;var QuestionJson;


var HH = 0;//时
var mm = 0;//分
var ss = 0;//秒
var timeState = true;//时间状态 默认为true 开启时间
//这里有问题
var questions;
var itemList=["A","B","C","D"]
var activeQuestion=0; //当前操作的考题编号
var questioned = 0; //
var checkQues = []; //已做答的题的集合
/*实现计时器*/
var time = setInterval(function () {
    if (timeState) {
        if (HH == 24) HH = 0;
        str = "";
        if (++ss == 60) {
            if (++mm == 60) { HH++; mm = 0; }
            ss = 0;
        }
        str += HH < 10 ? "0" + HH : HH;
        str += ":";
        str += mm < 10 ? "0" + mm : mm;
        str += ":";
        str += ss < 10 ? "0" + ss : ss;
        $(".time").text(str);
    } else {
        $(".time").text(str);
    }
}, 1000);
//展示考卷信息
function showQuestion(id){
    $(".questioned").text(id+1);
    questioned = (id+1)/questions.length
    if(activeQuestion!=undefined){
        $("#ques"+activeQuestion).removeClass("question_id").addClass("active_question_id");
    }
    activeQuestion = id;
    $(".question").find(".question_info").remove();
    var question = questions[id];
    $(".question_title").html("<strong>第 "+(id+1)+" 题 、</strong>"+question.questionTitle);
    var items = question.questionItems.split(";");
    var item="";
    for(var i=0;i<items.length-1;i++){
        item ="<li class='question_info' onclick='clickTrim(this)' id='item"
                +i+"'><input type='radio' name='item' value='"+itemList[i]+"'>&nbsp;"+itemList[i]+"."+items[i]+"</li>";
        $(".question").append(item);
    }
    $(".question").attr("id","question"+id);
    $("#ques"+id).removeClass("active_question_id").addClass("question_id");
    for(var i=0;i<checkQues.length;i++){
        if(checkQues[i].id==id){
            $("#"+checkQues[i].item).find("input").prop("checked","checked");
            $("#"+checkQues[i].item).addClass("clickTrim");
            $("#ques"+activeQuestion).removeClass("question_id").addClass("clickQue");
        }
    }
    progress();
}

//展示答案解析
var wrongQuestionCounter = 0;
function showReason(reasonArray,index=0){
    
    if(reasonArray.length==0){
        /*
        输出太棒了。。全答对了
        */
        var akItem = "<li class='question_info' onload='clickTrim(this)'>恭喜你!!!!答对了所有的题目！！！</li>";
        $(".question").append(akItem);
        return;
    }
    // let obj = {id:QuestionJson[i].questionId,question:,correctAnswer:QuestionJson[i].questionAnswer,reason:QuestionJson[i].reason};
    let id = reasonArray[index].id;
    $(".question").find(".question_info").remove();
    $(".question_title").html("<strong>答案解析：第 "+id+" 题 、</strong>"+reasonArray[index].question);
    var item ="<li class='question_info' onload='clickTrim(this)'><input type='radio' name='item'>&nbsp;正确答案:"+reasonArray[index].correctAnswer+"."+reasonArray[index].questionContent+"</li>";
    $(".question").append(item);
    var reasonItem = "<li class='question_info' onload='clickTrim(this)'>解析:"+reasonArray[index].reason+"</li>";
    $(".question").append(reasonItem);
}


/*答题卡*/
function answerCard(){
    $(".question_sum").text(questions.length);
    for(var i=0;i<questions.length;i++){
        var questionId ="<li id='ques"+i+"'onclick='saveQuestionState("+i+")' class='questionId'>"+(i+1)+"</li>";
        $("#answerCard ul").append(questionId);
    }
}

/*选中考题*/
var Question;
function clickTrim(source){
    var id = source.id;
    $("#"+id).find("input").prop("checked","checked");
    $("#"+id).addClass("clickTrim");
    $("#ques"+activeQuestion).removeClass("question_id").addClass("clickQue");
    var ques =0;
    for(var i=0;i<checkQues.length;i++){
       if( checkQues[i].id==activeQuestion&&checkQues[i].item!=id){
           ques = checkQues[i].id;
           checkQues[i].item = id;//获取当前考题的选项ID
           checkQues[i].answer =$("#"+id).find("input[name=item]:checked").val();//获取当前考题的选项值
       }
    }
    if(checkQues.length==0||Question!=activeQuestion&&activeQuestion!=ques){
        var check ={};
        check.id=activeQuestion;//获取当前考题的编号
        check.item = id;//获取当前考题的选项ID
        check.answer =$("#"+id).find("input[name=item]:checked").val();//获取当前考题的选项值
        checkQues.push(check);
    }
    $(".question_info").each(function(){
        var otherId =$(this).attr("id");
        if(otherId!=id){
            $("#"+otherId).find("input").prop("checked",false);
            $("#"+otherId).removeClass("clickTrim");
        }
    })
    Question = activeQuestion;
}

/*设置进度条*/
function progress(){
    var prog = ($(".active_question_id").length+1)/questions.length;
    var pro = $(".progress").parent().width() * prog;
    $(".progres").text((prog*100).toString().substr(0,5)+"%")
    $(".progress").animate({
        width: pro,
        opacity: 0.5
    }, 1000);
}

/*保存考题状态 已做答的状态*/
function saveQuestionState(clickId){
    showQuestion(clickId)
}


var correctCounter = 0;
var reasonArray = [];
var submitState = false;
$(function(){

    $('body').css('height',screenHeight+'px')
    $('body').css('width',screenWidth+'px')
    $(".middle-top-left").width($(".middle-top").width()-$(".middle-top-right").width())
    $(".progress-left").width($(".middle-top-left").width()-200);
    

    var getQuestionHttp = new XMLHttpRequest();
    getQuestionHttp.onreadystatechange = function(){
        if(getQuestionHttp.readyState == 4 && getQuestionHttp.status == 200){
          response = getQuestionHttp.responseText;
          //test
          //console.log(getQuestionHttp.responseText);
          if(response!="fail"){
            QuestionJson = JSON.parse(response);
            //console.log(QuestionJosn);
            
            questions = QuestionJson;
            progress();
            answerCard();
            showQuestion(0);

        }else if(response == "fail"){
            /**
             * 
             * print something ....
             */
          }
        }
    }
    
    //@todo:post地址可以更改
    getQuestionHttp.open('POST',"http://localhost/interview-project/server/question.php",true);
    getQuestionHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
    //根据题目类型去确定(type - -)
    getQuestionHttp.send('type=1');
    

    /*alert(QuestionJosn.length);*/
    /*实现进度条信息加载的动画*/
    var str = '';
    /*开启或者停止时间*/
    $(".time-stop").click(function () {
        timeState = false;
        $(this).hide();
        $(".time-start").show();
    });
    $(".time-start").click(function () {
        timeState = true;
        $(this).hide();
        $(".time-stop").show();
    });

    /*收藏按钮的切换*/
    $("#unHeart").click(function(){
        $(this).hide();
        $("#heart").show();
    })
    $("#heart").click(function(){
        $(this).hide();
        $("#unHeart").show();
    })

    /*答题卡的切换*/
    $("#openCard").click(function(){
        $("#closeCard").show();
        $("#answerCard").slideDown();
        $(this).hide();
    })
    $("#closeCard").click(function(){
        $("#openCard").show();
        $("#answerCard").slideUp();
        $(this).hide();
    })

    //提交试卷
    //@todo:可以判断是不是答完题，答完题了和正确答案比对一下，不对的话就跳到解析页面。。
    $("#submitQuestions").click(function(){
        /*alert(JSON.stringify(checkQues));*/
        if(questions.length-($(".clickQue").length)==0){
            correctCounter = 0;
            reasonArray = [];
            wrongQuestionCounter =  0;
            for(let i =0;i<checkQues.length;i++){
                
                if(checkQues[i].answer== QuestionJson[i].questionAnswer){
                    correctCounter++;
                }else{
                    let obj = {id:QuestionJson[i].questionId,question:QuestionJson[i].questionTitle,questionContent:QuestionJson[i].correctContent,correctAnswer:QuestionJson[i].questionAnswer,reason:QuestionJson[i].reason};
                    reasonArray.push(obj);
                }
            }
            submitState = true;
            /*
            跳转到新页面，把解析导出来
            @调用showReason函数
            */
            showReason(reasonArray);
        }else{
            window.alert("您还有"+(questions.length-($(".clickQue").length))+"道题未完成,请完成后再提交~");
        }
        
    })
    //进入下一题
    $("#nextQuestion").click(function(){
        if(!submitState){
            if((activeQuestion+1)!=questions.length) showQuestion(activeQuestion+1);
        }else{
            if(wrongQuestionCounter+1 < reasonArray.length)
                wrongQuestionCounter++;
                showReason(reasonArray,wrongQuestionCounter);
        }
        //showQuestion(activeQuestion)
    })

    //返回上一题
    $("#preQuestion").click(function(){
        if(!submitState){
            if((activeQuestion-1)!=-1) showQuestion(activeQuestion-1);
        }else{
            if(wrongQuestionCounter-1 >= 0){
                wrongQuestionCounter--;
                showReason(reasonArray,wrongQuestionCounter);
            }

        }
        //showQuestion(activeQuestion)
    })
})


