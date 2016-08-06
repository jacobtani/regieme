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

  $('#owl-demo').owlCarousel({
       autoPlay: 6000, //Set AutoPlay to 3 seconds
       items : 4,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3]
   });

  $('.cross-off-gift-button').on('click', function () {
    $('#modal-window').removeClass('hidden');
  });

    $('#rsvp_attending').change(function(){
        if($('#rsvp_attending').val() == 'Yes'){
          $('.optional-elements').removeClass('hidden');
        }
        else if($('#rsvp_attending').val() == 'No'){
          $('.optional-elements').addClass('hidden');
        }
    });

//Months is zero-based, so April being the fourth month uses 3.
var date = new Date(2017, 1, 25);
var now = new Date();
var diff = (date.getTime()/1000) - (now.getTime()/1000);
var clock = $('.your-clock').FlipClock(diff, {
 clockFace: 'DailyCounter',
 countdown: true
});

var items = document.querySelectorAll('.timeline li');

function isElementInViewport(el) {
  var rect = el.getBoundingClientRect();
  return (
    rect.top >= 0 &&
    rect.left >= 0 &&
    rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
    rect.right <= (window.innerWidth || document.documentElement.clientWidth)
  );
}

function callbackFunc() {
  for (var i = 0; i < items.length; i++) {
    if (isElementInViewport(items[i])) {
      items[i].classList.add('in-view');
    }
  }
}

window.addEventListener('load', callbackFunc);
window.addEventListener('scroll', callbackFunc);
$('.our-story-button').on('click', callbackFunc ());

$('.a1').addClass('hidden');
$('.a2').addClass('hidden');
$('.a3').addClass('hidden');
$('.a4').addClass('hidden');
$('.a5').addClass('hidden');
$('.a6').addClass('hidden');
$('.a7').addClass('hidden');
$('.a8').addClass('hidden');
$('.a9').addClass('hidden');
$('.a10').addClass('hidden');
$('.a11').addClass('hidden');
$('.a12').addClass('hidden');
$('.a13').addClass('hidden');

 $('.q1').on('click', function() {
    $('.a1').removeClass('hidden');
    $('.a2').addClass('hidden');
    $('.a3').addClass('hidden');
    $('.a4').addClass('hidden');
    $('.a5').addClass('hidden');
    $('.a6').addClass('hidden');
    $('.a7').addClass('hidden');
    $('.a8').addClass('hidden');
    $('.a9').addClass('hidden');
    $('.a10').addClass('hidden');
    $('.a11').addClass('hidden');
    $('.a12').addClass('hidden');
    $('.a13').addClass('hidden');
 });

 $('.q2').on('click', function() {
    $('.a1').addClass('hidden');
    $('.a2').removeClass('hidden');
    $('.a3').addClass('hidden');
    $('.a4').addClass('hidden');
    $('.a5').addClass('hidden');
    $('.a6').addClass('hidden');
    $('.a7').addClass('hidden');
    $('.a8').addClass('hidden');
    $('.a9').addClass('hidden');
    $('.a10').addClass('hidden');
    $('.a11').addClass('hidden')
    $('.a12').addClass('hidden');
    $('.a13').addClass('hidden');
 });

  $('.q3').on('click', function() {
    $('.a1').addClass('hidden');
    $('.a2').addClass('hidden');
    $('.a3').removeClass('hidden');
    $('.a4').addClass('hidden');
    $('.a5').addClass('hidden');
    $('.a6').addClass('hidden');
    $('.a7').addClass('hidden');
    $('.a8').addClass('hidden');
    $('.a9').addClass('hidden');
    $('.a10').addClass('hidden'); 
    $('.a11').addClass('hidden');
    $('.a12').addClass('hidden');
    $('.a13').addClass('hidden');
  });

  $('.q4').on('click', function() {
    $('.a1').addClass('hidden');
    $('.a2').addClass('hidden');
    $('.a3').addClass('hidden');
    $('.a4').removeClass('hidden');
    $('.a5').addClass('hidden');
    $('.a6').addClass('hidden');
    $('.a7').addClass('hidden');
    $('.a8').addClass('hidden');
    $('.a9').addClass('hidden');
    $('.a10').addClass('hidden'); 
    $('.a11').addClass('hidden');
    $('.a12').addClass('hidden');
    $('.a13').addClass('hidden');
  });

  $('.q5').on('click', function() {
    $('.a1').addClass('hidden');
    $('.a2').addClass('hidden');
    $('.a3').addClass('hidden');
    $('.a4').addClass('hidden');
    $('.a5').removeClass('hidden');
    $('.a6').addClass('hidden');
    $('.a7').addClass('hidden');
    $('.a8').addClass('hidden');
    $('.a9').addClass('hidden');
    $('.a10').addClass('hidden'); 
    $('.a11').addClass('hidden');
    $('.a12').addClass('hidden');
    $('.a13').addClass('hidden');
  });

  $('.q6').on('click', function() {
    $('.a1').addClass('hidden');
    $('.a2').addClass('hidden');
    $('.a3').addClass('hidden');
    $('.a4').addClass('hidden');
    $('.a5').addClass('hidden');
    $('.a6').removeClass('hidden');
    $('.a7').addClass('hidden');
    $('.a8').addClass('hidden');
    $('.a9').addClass('hidden');
    $('.a10').addClass('hidden'); 
    $('.a11').addClass('hidden');
    $('.a12').addClass('hidden');
    $('.a13').addClass('hidden');
  });

  $('.q7').on('click', function() {
    $('.a1').addClass('hidden');
    $('.a2').addClass('hidden');
    $('.a3').addClass('hidden');
    $('.a4').addClass('hidden');
    $('.a5').addClass('hidden');
    $('.a6').addClass('hidden');
    $('.a7').removeClass('hidden');
    $('.a8').addClass('hidden');
    $('.a9').addClass('hidden');
    $('.a10').addClass('hidden'); 
    $('.a11').addClass('hidden');
    $('.a12').addClass('hidden');
    $('.a13').addClass('hidden');
  });

  $('.q8').on('click', function() {
    $('.a1').addClass('hidden');
    $('.a2').addClass('hidden');
    $('.a3').addClass('hidden');
    $('.a4').addClass('hidden');
    $('.a5').addClass('hidden');
    $('.a6').addClass('hidden');
    $('.a7').addClass('hidden');
    $('.a8').removeClass('hidden');
    $('.a9').addClass('hidden');
    $('.a10').addClass('hidden'); 
    $('.a11').addClass('hidden');
    $('.a12').addClass('hidden');
    $('.a13').addClass('hidden');
  });

  $('.q9').on('click', function() {
    $('.a1').addClass('hidden');
    $('.a2').addClass('hidden');
    $('.a3').addClass('hidden');
    $('.a4').addClass('hidden');
    $('.a5').addClass('hidden');
    $('.a6').addClass('hidden');
    $('.a7').addClass('hidden');
    $('.a8').addClass('hidden');
    $('.a9').removeClass('hidden');
    $('.a10').addClass('hidden');
    $('.a11').addClass('hidden');
    $('.a12').addClass('hidden');
    $('.a13').addClass('hidden');
  });

  $('.q10').on('click', function() {
    $('.a1').addClass('hidden');
    $('.a2').addClass('hidden');
    $('.a3').addClass('hidden');
    $('.a4').addClass('hidden');
    $('.a5').addClass('hidden');
    $('.a6').addClass('hidden');
    $('.a7').addClass('hidden');
    $('.a8').addClass('hidden');
    $('.a9').addClass('hidden');
    $('.a10').removeClass('hidden');
    $('.a11').addClass('hidden');
    $('.a12').addClass('hidden');
    $('.a13').addClass('hidden');
  });

  $('.q11').on('click', function() {
    $('.a1').addClass('hidden');
    $('.a2').addClass('hidden');
    $('.a3').addClass('hidden');
    $('.a4').addClass('hidden');
    $('.a5').addClass('hidden');
    $('.a6').addClass('hidden');
    $('.a7').addClass('hidden');
    $('.a8').addClass('hidden');
    $('.a9').addClass('hidden');
    $('.a10').addClass('hidden');
    $('.a11').removeClass('hidden');
    $('.a12').addClass('hidden');
    $('.a13').addClass('hidden');
  });

  $('.q12').on('click', function() {
    $('.a1').addClass('hidden');
    $('.a2').addClass('hidden');
    $('.a3').addClass('hidden');
    $('.a4').addClass('hidden');
    $('.a5').addClass('hidden');
    $('.a6').addClass('hidden');
    $('.a7').addClass('hidden');
    $('.a8').addClass('hidden');
    $('.a9').addClass('hidden');
    $('.a10').addClass('hidden');
    $('.a11').addClass('hidden');
    $('.a12').removeClass('hidden');
    $('.a13').addClass('hidden');
  });
    $('.q13').on('click', function() {
    $('.a1').addClass('hidden');
    $('.a2').addClass('hidden');
    $('.a3').addClass('hidden');
    $('.a4').addClass('hidden');
    $('.a5').addClass('hidden');
    $('.a6').addClass('hidden');
    $('.a7').addClass('hidden');
    $('.a8').addClass('hidden');
    $('.a9').addClass('hidden');
    $('.a10').addClass('hidden');
    $('.a11').addClass('hidden');
    $('.a12').addClass('hidden');
    $('.a13').removeClass('hidden');
  });

});
