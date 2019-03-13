function initMapnew() {
  var options = {
    zoom: 15,
    center: {
      lat: 21.0170075,
      lng: 105.7824571
    }
  }

  var map = new google.maps.Map(document.getElementById('lease-map'), options);

  var marker = new google.maps.Marker({
    position: {
      lat: 21.017069199999998,
      lng: 105.7823701
    },
    map: map,
    draggable: true
  });

  var searchBox = new google.maps.places.SearchBox(document.getElementById('address'));
  google.maps.event.addListener(searchBox, 'places_changed', function() {
    var places = searchBox.getPlaces();
    var bounds = new google.maps.LatLngBounds();
    var i, place;
    for (i = 0; place = places[i]; i++) {
      document.getElementById('lat').value = place.geometry.location.lat();
      document.getElementById('lng').value = place.geometry.location.lng();
      bounds.extend(place.geometry.location);
      marker.setPosition(place.geometry.location);
    }
    map.fitBounds(bounds);
    map.setZoom(15);
  });
}

$(document).ready(function() {
  load_image($('.upload-main-img'), $('#main_img'))
  load_image($('.upload-sub-img'), $('#sub_img'))

  function load_image(abc, img) {
    abc.change(function(event) {
      var input = $(event.currentTarget);
      var file = input[0].files[0];
      var reader = new FileReader();
      reader.onload = function(e) {
        image_base64 = e.target.result;
        img.attr('src', image_base64);
      };
      reader.readAsDataURL(file);
   })
  };

  $('#img-main-big-sp').elevateZoom({
    gallery: 'list-img-sub',
    cursor: 'pointer',
    zoomType: "window",
    galleryActiveClass: 'active',
    zoomWindowWidth:"300",
    zoomWindowHeight:"300",
    lensSize: 300,
    zoomLens: false,
  });

  $('[data-toggle="tooltip"]').tooltip();

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
