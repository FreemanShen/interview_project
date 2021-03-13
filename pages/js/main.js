var screenHeight = $(window).height();
var screenWidth = $(window).width();
console.log(screenHeight)
console.log(screenWidth)
$(document).ready(function(){
    $('body').css('height',screenHeight+'px')
    $('body').css('width',screenWidth+'px')
})
window.onresize = function(){
    let screenHeight = $(window).height();
    let screenWidth = $(window).width();
    $('body').css('height',screenHeight+'px')
    $('body').css('width',screenWidth+'px')
}