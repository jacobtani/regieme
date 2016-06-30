// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require flash_messages
//= require owl.carousel
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
$(document).ready(function() { 

  $("#owl-demo").owlCarousel({
       autoPlay: 6000, //Set AutoPlay to 3 seconds
       items : 4,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3]
   });

  $('.cross-off-gift-button').on('click', function () {
    $('#modal-window').removeClass('hidden');
  });

    $("#rsvp_attending").change(function(){
        if($("#rsvp_attending").val() == "Yes"){
          $('.optional-elements').removeClass('hidden');
        }
        else if($("#rsvp_attending").val() == "No"){
          $('.optional-elements').addClass('hidden');
        }
    });

//Months is zero-based, so April being the fourth month uses 3.
var date = new Date(2017, 3, 22);
var now = new Date();
var diff = (date.getTime()/1000) - (now.getTime()/1000);
var clock = $('.your-clock').FlipClock(diff, {
 clockFace: 'DailyCounter',
 countdown: true
});


});
