function validate(str) {
    if(str=="" || (str.length>32)) {
        return false;
    }
    var list = ['*', '/', "'", '"', ';', '&', '|', '$', '(', ')', '#', '@', '<', '>'];
    for(var i=0; i<list.length; i++) {
        if(str.indexOf(list[i])>=0) {
            return false;
        }
    }
    return true;
}