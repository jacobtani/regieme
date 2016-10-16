var dropdown = $('#main-navbar li.dropdown');

$('a[data-toggle="dropdown"]').click(function(){
  dropdown.addClass('active');
  $('.dropdown-element').addClass('open');

});
