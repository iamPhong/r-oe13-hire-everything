var rent_preview = $('#rent-pic');

$('.rent-pic-upload').change(function(event) {
  var input = $(event.currentTarget);
  var file = input[0].files[0];
  var reader = new FileReader();
  reader.onload = function(e) {
    image_base64 = e.target.result;
    rent_preview.attr('src', image_base64);
  };
  reader.readAsDataURL(file);
});
