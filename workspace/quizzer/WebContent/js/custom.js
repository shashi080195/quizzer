$(function(){function getPageName(url){url=url.split("/");url=url[url.length-1];url=url.split("#");url=url[0];return url;}var currentUrl=window.location.href;var pageName=getPageName(currentUrl);$(".navbar-nav li > a[href$='"+pageName+"']").parent("li").first().addClass("active");$(".navbar-nav > li").has(".active").first().addClass("active");});$(function(){function stickyFooter(){var footer=$("footer");var footerHeight=footer.outerHeight(true);$("body").css("margin-bottom",footerHeight);};setTimeout(stickyFooter,200);$(window).resize(function(){setTimeout(stickyFooter,200);});});$(function(){function addAnimation(parent){var elements=$(parent).find("[data-animation]");elements.each(function(){var animation=$(this).data("animation");$(this).addClass(animation);});};function removeAnimation(parent){var elements=$(parent).find("[data-animation]");elements.each(function(){var animation=$(this).data("animation");$(this).removeClass(animation);});};$('#showcase-carousel').on({"slid.bs.carousel":function(){addAnimation("#showcase-carousel .item.active");},"slide.bs.carousel":function(){setTimeout(function(){removeAnimation("#showcase-carousel .item.active");},600);}});});$(function(){$('a[href*=#]').not('[href=#], [data-toggle], [data-slide]').click(function(){if(location.pathname.replace(/^\//,'')==this.pathname.replace(/^\//,'')&&location.hostname==this.hostname){var target=$(this.hash);target=target.length?target:$('[name='+this.hash.slice(1)+']');if(target.length){$('html,body').animate({scrollTop:(target.offset().top-20)},1000);return false;}}});});$(function(){$("#ui-categories").affix({offset:{top:function(){var elem=$("#ui-categories");return(this.top=elem.offset().top-20);},bottom:function(){return(this.bottom=$('footer').outerHeight(true))}}}).on("affix.bs.affix",function(){var blockWidth=$(this).width();$(this).css("width",blockWidth);});});$(function(){if($(".isotope-container").length){var $container=$('.isotope-container').imagesLoaded(function(){$container.isotope({itemSelector:'.isotope-item',layoutMode:'fitRows'});});$(".gallery__nav > li").click(function(){var filterValue=$(this).children("a").attr('data-filter');$container.isotope({filter:filterValue});$(this).addClass("active").siblings("li").removeClass("active");return false;});}});$(function(){$("form[name='comments__new'] textarea").on({focus:function(){if(!$(this).val()){$(this).data("original-height",$(this).outerHeight());}$(this).animate({"height":"68px"},300);},blur:function(){if(!$(this).val()){$(this).animate({"height":$(this).data("original-height")},300);$(this).parents("form").find("button[type='submit']").attr("disabled","disabled");}},input:function(){$(this).parents("form").find("button[type='submit']").removeAttr("disabled");}});});$(function(){function getPageName(url){url=url.split("/");url=url[url.length-1];url=url.split("#");url=url[0];return url;}var currentUrl=window.location.href;var pageName=getPageName(currentUrl);var isActive="";pageName=="index.html"?isActive="active":isActive="";$("body").append(setupBlock);$(".setup__trigger").click(function(){$(".setup").toggleClass("active");});$(document).click(function(e){if($(".setup").hasClass("active")){var target=$(e.target);if(!target.closest(".setup").length)$(".setup").toggleClass("active");}});$(".setup__layout").click(function(){$(".setup__layout").removeClass("active");$(this).addClass("active");if($(this).data("layout-boxed")){$("html").addClass("html_boxed");}else{$("html").removeClass("html_boxed");}});$(".setup__navbar").click(function(){$(".setup__navbar").removeClass("active");$(this).addClass("active");if($(this).data("navbar-fixed")){$("body").addClass("body_navbar-fixed-top");$(".navbar").addClass("navbar-fixed-top");}else{$("body").removeClass("body_navbar-fixed-top");$(".navbar").removeClass("navbar-fixed-top");}});$(".setup__color").click(function(){$(".setup__color").removeClass("active");$(this).addClass("active");var newStylesheet="styles_"+$(this).data("color")+".css";var newStylesheetTag='<link href="assets/css/'+newStylesheet+'" rel="stylesheet">';$("body").append(newStylesheetTag);});});



$(window).bind('load', function() {
$('img').each(function() {
    if((typeof this.naturalWidth != "undefined" &&
        this.naturalWidth == 0 )
        || this.readyState == 'uninitialized' ) {
        $(this).attr('src', 'assets/img/missing.png');
    }
}); })
