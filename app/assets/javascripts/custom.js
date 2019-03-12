$(document).ready(function() {
  $('body').on('click', function() {
    $('.sidebar').removeClass('opened');
  });

  $('body').on('click', '.is-hover #btn-list-lease', function(e) {
    e.stopPropagation();
    $(this).parents('.sidebar:first').toggleClass('opened');
  });

  $('body').on('click', '.is-hover .list-lease-box', function(e) {
    e.stopPropagation();
  });

  $('.is-hover').hover(function() {
    $(this).parents('.sidebar:first').addClass('opened');
  }, function() {
    $(this).parents('.sidebar:first').removeClass('opened');
  });

  var preview = $(".edit-img img");

  $(".cfi-common-upload").change(function(event) {
    var input = $(event.currentTarget);
    var file = input[0].files[0];
    var reader = new FileReader();
    reader.onload = function(e) {
      image_base64 = e.target.result;
      preview.attr("src", image_base64);
    };
    reader.readAsDataURL(file);
  });

  $('#cb-money').on('change', function() {
    if ($(this).is(':checked')) {
      $('#tb-money').attr('required', '');
      return $('#tb-money').removeAttr('disabled');
    }
    $('#tb-money').removeAttr('required');
    return $('#tb-money').attr('disabled', '');
  });

  $('#cb-pp').on('change', function() {
    if ($(this).is(':checked')) {
      $('#tb-pp').attr('required', '');
      return $('#tb-pp').removeAttr('disabled');
    }
    $('#tb-pp').removeAttr('required');
    return $('#tb-pp').attr('disabled', '');
  });

  $('#cb-buy').on('change', function() {
    if ($(this).is(':checked')) {
      $('#label-price_buy').html('(*)');
      $('.sells').show();
      return $('#tb-buy').removeAttr('disabled').attr('required', '');
    }
    $('.sells').hide();
    $('#label-price_buy').html('');
    return $('#tb-buy').attr('disabled', '');
  });

  $('.clickable').click(function() {
    $(this).submit();
  });

  $('.list-type-price li').click(function() {
    $('.btn-select-type-price').html($(this).find('a').text() + ' <span class="caret"></span>');
    $('input[id="price_type"]').val($(this).find('a').attr('value'));
  });
});
