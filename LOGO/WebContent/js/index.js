$(function () {


    $(".ticketCon, .shopCon").hide();
    var inText = document.getElementById("linkbtn");

    $('#music').click(function () {
        $('.musicCon').show();
        $(".ticketCon, .shopCon").hide();
        inText.innerHTML = '<form><a  href="musicMain.html"> <input type = "button" value = "Music바로가기" class="btn" ></form>';
    });
    $('#ticket').click(function () {
        $(".ticketCon").show();
        $(".musicCon, .shopCon").hide();
        inText.innerHTML = '<form><a  href="ticketmain.html"> <input type = "button" value = "Ticket바로가기" class="btn" ></form>';
    });
    $('#shopping').click(function () {
        $('.shopCon').show();
        $(".ticketCon, .musicCon").hide();
        inText.innerHTML = '<form><a  href="shoppingMain.html"> <input type = "button" value = "Shop바로가기" class="btn" ></form>';

    });




})

