$(document).ready(function() {
  $('.question').click(function (e) {
    e.preventDefault();
    var content_id = $(this).attr('class');
    $('.answer').addClass('hidden');
    var numb = content_id.match(/\d/g).join("");
    var total = ".a" + numb;
    $(total).removeClass('hidden');
  });
});
