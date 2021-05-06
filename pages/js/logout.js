/*
登出函数，当sessionStorage中的值为null，发ajax，更新
*/
function logout(){
    if(sessionStorage.length != 0){
        sessionStorage.clear();
        window.location.href = "../html/login.html"    
    }
}