
$(function () {
    testlogin();
    loadcomment();
    
    
    $("#dialog").dialog({
        autoOpen: false,
        show: {
            effect: "blind",
            duration: 1000
        },
        hide: {
            effect: "explode",
            duration: 1000
        },
        buttons: {
            OK: function () {
                $(this).dialog("close");
            }
        },
        modal: true

    }).prev(".ui-dialog-titlebar").css("background", "rgb(79, 242, 236)");


    $("#dialog1").dialog({
        autoOpen: false,
        show: {
            effect: "blind",
            duration: 1000
        },
        hide: {
            effect: "explode",
            duration: 1000
        },
        buttons: {
            OK: function () {
                $(this).dialog("close");
            }
        },
        modal: true

    }).prev(".ui-dialog-titlebar").css("background", "rgb(79, 242, 236)");

});







