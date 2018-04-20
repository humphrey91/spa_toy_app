
$(document).on('turbolinks:load', function() {
  if ($.isEmptyObject($.find('#sidebar'))) {
    return
  }
  var $sidebar =       $('#sidebar');
  var $stickySidebar = $('#sidebar').offset().top;

  function removeFixed() {
    $sidebar.removeClass('affix');
  }
  $(window).scroll(function() {  
    if ($(window).width() > 752) {
      if ($(window).scrollTop() > $stickySidebar) {
        $sidebar.addClass('affix').width($('.parent-profile').width());
      }
      else {
        removeFixed();
      }  
    }
  });

  $(window).resize(function() {
    if ($(window).width() > 752) {
      if ($(window).scrollTop() > $stickySidebar) {
        $sidebar.addClass('affix');  
      } else {
        removeFixed();
      }
      $sidebar.width($('.parent-profile').width());
    } else {
      removeFixed();
      $sidebar.width('100%');
    }
  });
});
