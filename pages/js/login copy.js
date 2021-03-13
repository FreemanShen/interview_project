function login(){
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
    if(check(username,password)){
        sessionStorage.setItem('login','true')
        sessionStorage.setItem('username',username)
        //console.log(sessionStorage.getItem('login'))
        //console.log(sessionStorage.getItem('username'))
        window.open('./post_discuss.html','_self')
    }else{
        alert('用户名/密码错误！');
    }   
}

function check(username,password){
    if(password == localStorage.getItem(username)){
        return true
    }else{
        return false
    }
}