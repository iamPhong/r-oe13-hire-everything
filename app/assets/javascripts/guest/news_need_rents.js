$(document).ready(function() {
  $('.dropdown').click(function() {
    $('.phone-info').css('display', 'block');
  });

  $('.phone-info i.fa-close').click(function() {
    $('.phone-info').css('display', 'none');
  });

  $('[data-toggle="tooltip"]').tooltip();
});
