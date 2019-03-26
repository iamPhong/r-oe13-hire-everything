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

  upload_image($('.cfi-common-upload'), $('.edit-img img'))
  upload_image($('.rent-pic-upload'), $('#rent-pic'))

  function upload_image(abc, img) {
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

  $(document).on("turbolinks:load", function() {
    execute();
  });

  function execute() {
    $(".pagination a").on("click", function() {
      history.pushState(null, null, $(this).attr("href"));
    });
  }

  $(window).on("popstate", function() {
   $.get(location.href);
  });

  $('.owl-carousel').owlCarousel({
    items: 8,
    loop: true,
    margin: 0,
    dots: false,
    responsiveClass: true,
    autoplay: 100,
    responsive: {
      0: {
        items: 2,
        nav: false
      },
      600: {
        items: 4,
        nav: false
      },
      700: {
        items: 5,
        nav: false
      },
      1000: {
        items: 8,
        nav: false,
        loop: true
      }
    }
  });

  $(".nav-tabs li").click(function () {
      if(!$(this).hasClass('active'))
      {
        $("li active").removeClass("active");
        $(this).addClass("active");
      }
  });
});
