/*https://www.cnblogs.com/justdoitba/p/7634895.html */
function _x(STR_XPATH) {
    var xresult = document.evaluate(STR_XPATH, document, null, XPathResult.ANY_TYPE, null);
    var xnodes = [];
    var xres;
    while (xres = xresult.iterateNext()) {
        xnodes.push(xres);
    }
    return xnodes;
}
let nodeArr = _x('/html/body/div[4]/div/div[1]/div[2]/p');
let len = nodeArr.length;


newArr = Array(); 
for(let i=0;i<len;i++){
    if(nodeArr[i].innerText.indexOf('、')==-1&&nodeArr[i].innerText.indexOf('A.')==-1&&nodeArr[i].innerText.indexOf('B.')==-1&&nodeArr[i].innerText.indexOf('C.')==-1&&nodeArr[i].innerText.indexOf('D.')==-1){
        continue;
    }
    newArr.push(nodeArr[i]);
}
titleArr = Array();
ansAArr = Array();
ansBArr = Array();
ansCArr = Array();
ansDArr = Array();

len = newArr.length;
for(let i=0;i<len;i++){
    if(newArr[i].innerText.indexOf('A、')==-1&&newArr[i].innerText.indexOf('B、')==-1&&newArr[i].innerText.indexOf('C、')==-1&&newArr[i].innerText.indexOf('D、')==-1&&newArr[i].innerText.indexOf('E、')==-1&&newArr[i].innerText.indexOf('F、')==-1&&newArr[i].innerText.indexOf('A.')==-1&&newArr[i].innerText.indexOf('B.')==-1&&newArr[i].innerText.indexOf('C.')==-1&&newArr[i].innerText.indexOf('D.')==-1&&newArr[i].innerText.indexOf('E.')==-1){
        titleArr.push(newArr[i]);
    }else{
        if(newArr[i].innerText.indexOf('A、')!=-1||newArr[i].innerText.indexOf('A.')!=-1)
            ansAArr.push(newArr[i]);
        if(newArr[i].innerText.indexOf('B、')!=-1||newArr[i].innerText.indexOf('B.')!=-1)
            ansBArr.push(newArr[i]);
        if(newArr[i].innerText.indexOf('C、')!=-1||newArr[i].innerText.indexOf('C.')!=-1)
            ansCArr.push(newArr[i]);
        if(newArr[i].innerText.indexOf('D、')!=-1||newArr[i].innerText.indexOf('D.')!=-1)
            ansDArr.push(newArr[i]);
        }
}
//titleArr里有50题
correctArr = Array();
for(let i=0;i<titleArr.length;i++){
    if($($(ansAArr[i]).find('span')[0]).css('color') == 'rgb(255, 0, 0)'){
        correctArr.push(1);
    }else if($($(ansBArr[i]).find('span')[0]).css('color') == 'rgb(255, 0, 0)'){
        correctArr.push(2);
    }else if($($(ansCArr[i]).find('span')[0]).css('color') == 'rgb(255, 0, 0)'){
        correctArr.push(3);
    }else if($($(ansDArr[i]).find('span')[0]).css('color') == 'rgb(255, 0, 0)'){
        correctArr.push(4);
    }else{
        correctArr.push(1);
    }
}
let sqlArr = Array();
let sql = '';
let title;
let ansA;
let ansB;
let ansC;
let ansD;
for(let i=0;i<titleArr.length;i++){
    let length = $(titleArr[i]).find('span').length;
    for(let j =1;j<length;j++){
        if(j==1){
            title = $(titleArr[i]).find('span')[j].innerText;
        }else{
            title += $(titleArr[i]).find('span')[j].innerText;
        }
    }
    length = $(ansAArr[i]).find('span').length;
    for(let j =1;j<length;j++){
        if(j==1){
            ansA = $(ansAArr[i]).find('span')[j].innerText;
        }else{
            ansA += $(ansAArr[i]).find('span')[j].innerText;
        }
    }
    length = $(ansBArr[i]).find('span').length;
    for(let j =1;j<length;j++){
        if(j==1){
            ansB = $(ansBArr[i]).find('span')[j].innerText;
        }else{
            ansB += $(ansBArr[i]).find('span')[j].innerText;
        }
    }
    length = $(ansCArr[i]).find('span').length;
    for(let j =1;j<length;j++){
        if(j==1){
            ansC = $(ansCArr[i]).find('span')[j].innerText;
        }else{
            ansC += $(ansCArr[i]).find('span')[j].innerText;
        }
    }
    length = $(ansDArr[i]).find('span').length;
    for(let j =1;j<length;j++){
        if(j==1){
            ansD = $(ansDArr[i]).find('span')[j].innerText;
        }else{
            ansD += $(ansDArr[i]).find('span')[j].innerText;
        }
    }
    /*
    ansAArr[i] = $(ansAArr[i]).find('span')[1].innerText;
    ansBArr[i] = $(ansBArr[i]).find('span')[1].innerText;
    ansCArr[i] = $(ansCArr[i]).find('span')[1].innerText;
    ansDArr[i] = $(ansDArr[i]).find('span')[1].innerText;
    */
    sqlArr.push("call add_exercises(1,'"+title+"','"+ansA+"','"+ansB+"','"+ansC+"','"+ansD+"',"+correctArr[i]+",'reason is that.....');");
    sql +="call add_exercises(1,'"+title+"','"+ansA+"','"+ansB+"','"+ansC+"','"+ansD+"',"+correctArr[i]+",'reason is that.....');"
}
