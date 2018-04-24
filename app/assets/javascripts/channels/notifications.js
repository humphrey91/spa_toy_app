$( document ).on('turbolinks:load', function() {

  App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
    connected: function() {
      // Called when the subscription is ready for use on the server
    },

    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      if (data['notification']) {
        if ($(window).outerWidth() > 991) {
          var maxWidth = $('.parent-profile').width()
        } else {
          var maxWidth = $('.parent-profile').width() / 2
        }
        $('#flash-messages').css({
          "max-width": maxWidth,
        })
        $('#flash-messages').html(data['notification']).addClass('flash');
        setTimeout(function() {
          $('#flash-messages').addClass("flash-out"); 
          setTimeout(function() {
            $('#flash-messages').html("").removeClass("flash flash-out"); 
          },1000);
        },5000);
      };
    },
   
  });

});


