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

  $(".question").click(function (e) {
       e.preventDefault();
       var content_id = $(this).attr("class");
       $(".answer").addClass("hidden");
       var numb = content_id.match(/\d/g).join("");
       var total = ".a" + numb;
       $(total).removeClass("hidden");
   });

  $('#owl-demo').owlCarousel({
       autoPlay: 3000,
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

  // If a link has a dropdown, add sub menu toggle.
  $('nav ul li a:not(:only-child)').click(function(e) {
    $(this).siblings('.nav-dropdown').toggle();
    // Close one dropdown when selecting another
    $('.nav-dropdown').not($(this).siblings()).hide();
    e.stopPropagation();
  });
  // Clicking away from dropdown will remove the dropdown class
  $('html').click(function() {
    $('.nav-dropdown').hide();
  });
  // Toggle open and close nav styles on click
  $('#nav-toggle').click(function() {
    $('nav ul').slideToggle();
  });
  // Hamburger to X toggle
  $('#nav-toggle').on('click', function() {
    this.classList.toggle('active');
  });

});
