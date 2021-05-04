function validate(str) {
    if(str=="" || (str.length>32)) {
        return false;
    }
    var list = ['*', '/', "'", '"', ';', '&', '|', '$', '(', ')', '#', '<', '>'];
    for(var i=0; i<list.length; i++) {
        if(str.indexOf(list[i])>=0) {
            return false;
        }
    }
    return true;
}
function mail_valid(mailStr){
    　　var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
    　　if(mailStr === ""){ //输入不能为空
    　　　　alert("邮箱输入不能为空!");
    　　　　return false;
    　　}else if(!reg.test(mailStr)){ //正则验证不通过，格式不对
    　　　　alert("请检查邮箱是否正确!");
    　　　　return false;
    　　}else{
    　　　　//alert("通过！");
    　　　　return true;
    　　}    
    }