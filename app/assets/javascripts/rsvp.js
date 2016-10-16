$(document).ready(function() {
  $('#rsvp_attending').change(function(){
    if($('#rsvp_attending').val() == 'Yes'){
      $('.optional-elements').removeClass('hidden');
    }
    else if($('#rsvp_attending').val() == 'No'){
      $('.optional-elements').addClass('hidden');
    }
  });
});
