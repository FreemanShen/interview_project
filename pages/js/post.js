window.onresize = function(){
    let screenHeight = $(window).height();
    let screenWidth = $(window).width();
    $('body').css('height',screenHeight+'px')
    $('body').css('width',screenWidth+'px')
}

