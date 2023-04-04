

$(function () {
    $("#gnb").hide();
    $("#stop-icon").hide();

    $("header nav").click(function () {
        $("#gnb").slideDown("1");
    });

    $("#gnb").mouseleave(function () {
        $("#gnb").slideUp("1");
    });

    $('.my-text').mouseenter(function () {
        $(this).animate({
            fontSize: '13px'
        }, 200);
    }).mouseleave(function () {
        $(this).animate({
            fontSize: '12px'
        }, 200);
    });


    


})



