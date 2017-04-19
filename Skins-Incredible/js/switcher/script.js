jQuery(document).ready(function () {

    $('#fonts').coreUISelect();

    /* reproduce cookies*/
    /*color*/
    if (getCookie("coo_color")) {
        var current_color = getCookie("coo_color");
        var current = scriptsPathCustom + "/css/color_themes/" + current_color + ".css";
        var l = document.getElementById("current_style");
        l.href = current;

        var $active_color = 'a[data-color *=' + current_color + ']';
        $(".switcher_part .color_list a").siblings().removeClass("active");
        $(".switcher_part .color_list").find($active_color).addClass("active");
    }
    else {

    }

    /*pattern*/
    if (getCookie("coo_bg")) {
        var current_bg = getCookie("coo_bg");
        patternDiv = $("#body_pattern");
        patternDiv.attr({ style: "" });
        patternDiv.css({ backgroundImage: "url(" + scriptsPathCustom + "/img/patterns/" + current_bg + ".png)" });

        var $active_bg = 'a[data-pattern *=' + current_bg + ']';
        $(".switcher_part .pattern_list a").removeClass("active");
        $(".switcher_part .pattern_list").find($active_bg).addClass("active");

    }
    else {

    }

    if ($('a.close_panel').length) {
        $('a.close_panel').click(function () {

            if ($(this).hasClass('panel_open')) {

                $('#style-switcher').animate({
                    left: '-=189'
                }, 300, function () {
                    $('.switcher_list').hide();
                    $('a.close_panel.panel_open').removeClass('panel_open');
                });
            }
            else {
                $('.switcher_list').show();
                $('#style-switcher').animate({
                    left: '+=189'
                });
                $(this).addClass('panel_open');
            }
            return false;
        });
    }


    /* Color
    ------------------------------------------------------------------------- */
    $(".switcher_part .color_list a").live('click', function (event) {
        event.preventDefault();

        $(this).addClass("active").siblings().removeClass("active");

        //replace the css with the current color to the chosen one
        var current = scriptsPathCustom + "/css/color_themes/" + $(this).data("color") + ".css";
        var l = document.getElementById("current_style");
        l.href = current;
        setCookie("coo_color", $(this).data("color"));
    });


    /* Pattern texture
    ------------------------------------------------------------------------- */
    $(".switcher_part .pattern_list a").each(function () {
        $(this).css({ backgroundImage: "url(" + scriptsPathCustom + "/img/patterns/" + $(this).data("pattern") + ".png)" });

    });

    $(".switcher_part .pattern_list a").live('click', function (event) {
        event.preventDefault();

        patternDiv = $("#body_pattern");
        patternDiv.attr({ style: "" });

        $(this).addClass("active").siblings().removeClass("active");
        patternDiv.css({ backgroundImage: "url(" + scriptsPathCustom + "/img/patterns/" + $(this).data("pattern") + ".png)" });
        setCookie("coo_bg", $(this).data("pattern"));

    });

    $(".switcher_part a#no_pattern").live('click', function (event) {
        event.preventDefault();

        patternDiv = $("#body_pattern");
        patternDiv.attr({ style: "" });

        $(".switcher_part .pattern_list a").removeClass("active");
        patternDiv.css({ backgroundImage: "none" });
        setCookie("coo_bg", "");

    });


    /* View
    ------------------------------------------------------------------------- */

    $(".switcher_part .chosee_device a").live('click', function (event) {
        event.preventDefault();
        var childWin = window.open(window.location.href, '_ self', 'width=' + $(this).data("size") + ', height=700, scrollbars = yes, toolbar = yes');
        childWin.resizeTo($(this).data("size"), 700);
    });


    initPIE();

});


function initPIE(){
	 if (window.PIE) {
	 	var selectors = 'a.switcher_off,p.switch_on,p.choose_list a, .switcher_list';
		jQuery(selectors).each(function() {
			PIE.attach(this);
		});
	}
}

function setCookie(name, value, expires, path, domain, secure) {
    document.cookie = name + "=" + escape(value) +
        ((expires) ? "; expires=" + expires : "") +
        ((path) ? "; path=" + path : "") +
        ((domain) ? "; domain=" + domain : "") +
        ((secure) ? "; secure" : "");
}

function getCookie(cookie_name) {
    var results = document.cookie.match('(^|;) ?' + cookie_name + '=([^;]*)(;|$)');

    if (results)
        return (unescape(results[2]));
    else
        return null;
}



