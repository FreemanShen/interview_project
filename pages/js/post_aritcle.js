function postForum(){
    console.log('connect');
    if(!(sessionStorage.getItem('login') === 'true')){
        window.alert('您还未登录，请先登录！')
        window.open('./login.html','_self')
    }
    else{
        let input_title = document.getElementById('input_title').value;
        let business_name = document.getElementById('business_name').value;
        let job_type = document.getElementById('job_type').value; 
        let location_type = document.getElementById('location').value;
        let article_text = document.getElementById('article_text').value;
        let author_text = sessionStorage.getItem('username')
        let author_id = sessionStorage.getItem('userId')
        let insert_value = {
            title:input_title,
            company_name:business_name,
            job:job_type,
            location:location_type,
            article:article_text,
            author:author_text,
            author_id:author_id
        }
        //localStorage.setItem('innerValue',JSON.stringify(objArr))
        
        //发布成功
        //window.open('./discuss.html','_self');    
    
        var postHttp = new XMLHttpRequest();
        postHttp.onreadystatechange = function(){
            if(postHttp.readyState == 4 && postHttp.status == 200){
              response = postHttp.responseText;
              //test
              //console.log(postHttp.responseText);
              if(response!="fail"){
                //跳转页面
                //window.alert('登陆成功！');
                window.location.href="../html/discuss.html";
              }else if(response == "fail"){
                //console.log(response);
                window.alert('请检查输入的账号和密码是否正确');
                location.reload();
              }
            }
          }
          //@todo:post地址可以更改
          postHttp.open('POST',"http://localhost/interview-project/server/post_article.php",true);
          postHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
          postHttp.send('articleInfo='+JSON.stringify(insert_value));
    }
}
