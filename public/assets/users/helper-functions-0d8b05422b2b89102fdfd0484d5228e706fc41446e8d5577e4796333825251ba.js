$( document ).on('turbolinks:load', function() {
  App.setMaxWidth = function() {
    if ($(window).outerWidth() > 991)
      $('.parent-profile').width()
    else {
      $('.parent-profile').width() / 2
    }
  }
})
;
