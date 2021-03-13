/*
设置Body宽高 和 侦听屏幕宽度变化
*/

var screenHeight = $(window).height();
var screenWidth = $(window).width();

$(function(){
    $('body').css('height',screenHeight+'px')
    $('body').css('width',screenWidth+'px')
    $('#parent').css('height',screenHeight+'px')
    $('#parent').css('width',screenWidth+'px')
})　

window.onresize = function(){
    let screenHeight = $(window).height();
    let screenWidth = $(window).width();
    $('body').css('height',screenHeight+'px')
    $('body').css('width',screenWidth+'px')
    $('#parent').css('height',screenHeight+'px')
    $('#parent').css('width',screenWidth+'px')
}

