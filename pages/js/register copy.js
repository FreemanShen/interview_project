function register(){
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
    if(check(username,password)){
        localStorage.setItem(username,password)
    }else{
        alert('用户名/密码不符合规范！');
    }   
}

function check(username,password){
    //用户名正则，8到16位 字母，数字，下划线，减号
    let usernamePattern = /^[a-zA-Z0-9_-]{8,16}$/;
    //密码强度正则，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
    let passwordPattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/
    if(!usernamePattern.test(username)){
        return false;
    }
    if(!passwordPattern.test(passwordPattern)){
        return false;
    }
    return true;
}