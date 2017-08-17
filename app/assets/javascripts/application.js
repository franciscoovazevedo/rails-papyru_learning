//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$( document ).ready(function() {
  scaleVideoContainer();

  initBannerVideoSize('.video-container .poster img');
  initBannerVideoSize('.video-container .filter');
  initBannerVideoSize('.video-container video');

  $(window).on('resize', function() {
    scaleVideoContainer();
    scaleBannerVideoSize('.video-container .poster img');
    scaleBannerVideoSize('.video-container .filter');
    scaleBannerVideoSize('.video-container video');
  });
});

function scaleVideoContainer() {
  var height = $(window).height();
  var unitHeight = parseInt(height) + 'px';
}

function initBannerVideoSize(element){
  $(element).each(function(){
      $(this).data('height', $(this).height());
      $(this).data('width', $(this).width());
  });

  scaleBannerVideoSize(element);
}

function scaleBannerVideoSize(element){
  var windowWidth = $(window).width(),
      windowHeight = $(window).height(),
      videoWidth,
      videoHeight;

  console.log(windowHeight);

  $(element).each(function(){
    var videoAspectRatio = $(this).data('height')/$(this).data('width'),
      windowAspectRatio = windowHeight/windowWidth;

    if (videoAspectRatio > windowAspectRatio) {
        videoWidth = windowWidth;
        videoHeight = videoWidth * videoAspectRatio;
       $(this).css({'top' : -(videoHeight - windowHeight) / 2 + 'px', 'margin-left' : 0});
    }
    else {
        videoHeight = windowHeight;
        videoWidth = videoHeight / videoAspectRatio;
        $(this).css({'margin-top' : 0, 'margin-left' : -(videoWidth - windowWidth) / 2 + 'px'});
    }

    $(this).width(videoWidth).height(videoHeight);

    $('.banner .video-container video').addClass('fadeIn animated');
  });
}

$( ".input" ).focusin(function() {
  $( this ).find( "span" ).animate({"opacity":"0"}, 200);
});

$( ".input" ).focusout(function() {
  $( this ).find( "span" ).animate({"opacity":"1"}, 300);
});

$(".login").submit(function(){
  $(this).find(".submit i").removeAttr('class').addClass("fa fa-check").css({"color":"#fff"});
  $(".submit").css({"background":"#2ecc71", "border-color":"#2ecc71"});
  $(".feedback").show().animate({"opacity":"1", "bottom":"-80px"}, 400);
  $("input").css({"border-color":"#2ecc71"});
  return false;
});
