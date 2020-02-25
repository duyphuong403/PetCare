
(function ($) {
  "use strict";


  /*==================================================================
   [ Focus input ]*/
  $('.input100').each(function () {
    $(this).on('blur', function () {
      if ($(this).val().trim() != "") {
        $(this).addClass('has-val');
      } else {
        $(this).removeClass('has-val');
      }
    })
  })


  /*==================================================================
   [ Validate ]*/
  var input = $('.validate-input .input100');

  $('.validate-form').on('submit', function () {
    var check = true;

    for (var i = 0; i < input.length; i++) {
      if (validate(input[i]) == false) {
        showValidate(input[i]);
        check = false;
      }
    }

    return check;
  });


  $('.validate-form .input100').each(function () {
    $(this).focus(function () {
      hideValidate(this);
    });
  });

  function validate(input) {
    if ($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
      if ($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
        return false;
      }
    } else {
      if ($(input).val().trim() == '') {
        return false;
      }
    }
  }

  function showValidate(input) {
    var thisAlert = $(input).parent();

    $(thisAlert).addClass('alert-validate');
  }

  function hideValidate(input) {
    var thisAlert = $(input).parent();

    $(thisAlert).removeClass('alert-validate');
  }

  /*==================================================================
   [ Show pass ]*/
  var showPass = 0;
  $('.btn-show-pass').on('click', function () {
    if (showPass == 0) {
      $(this).next('input').attr('type', 'text');
      $(this).find('i').removeClass('zmdi-eye');
      $(this).find('i').addClass('zmdi-eye-off');
      showPass = 1;
    } else {
      $(this).next('input').attr('type', 'password');
      $(this).find('i').addClass('zmdi-eye');
      $(this).find('i').removeClass('zmdi-eye-off');
      showPass = 0;
    }

  });

  (function () {

    $(".search-icon").on('click', function () {
      if ($(this).hasClass('opened')) {
        $(this).removeClass('opened');
        $('.search-icon i').removeClass('active-search').addClass('fa-search');
        $('.search-form').fadeOut('slow').removeClass('').addClass('');
      } else {
        $(this).addClass('opened');
        $('.search-icon i').addClass('active-search').removeClass('fa-search');
        $(".search-form").fadeIn('slow').removeClass('').addClass('');
      }
    });
    $("body").on('click', function () {
      $('.search-icon').removeClass('opened');
      $('.search-icon i').removeClass('active-search').addClass('fa-search');
      $('.search-form').fadeOut('slow').removeClass('').addClass('');
    });
    $('.tr-search').on('click', function (e) {
      e.stopPropagation();
    });

  }());

  // -------------------------------------------------------------
  //  Toggle Menu for Mobile
  // -------------------------------------------------------------

  mobileDropdown();
  function mobileDropdown() {
    if ($('.tr-menu .navbar-nav').length) {
      $('.tr-menu .navbar-nav .tr-dropdown').append(function () {
        return '<i class="fa fa-angle-down icon" aria-hidden="true"></i>';
      });
      $('.tr-menu .navbar-nav .tr-dropdown .icon').on('click', function () {
        $(this).parent('li').children('ul').slideToggle();
      });
    }
  }

  // -------------------------------------------------------------
  //  Slick Slider
  // -------------------------------------------------------------  

  (function () {

    $(".product-slider, .blog-slider").slick({
      infinite: true,
      dots: true,
      slidesToShow: 1,
      autoplay: true,
      autoplaySpeed: 10000,
      slidesToScroll: 1
    });

    $(".brand-slider").slick({
      infinite: true,
      dots: true,
      slidesToShow: 4,
      autoplay: true,
      autoplaySpeed: 10000,
      slidesToScroll: 1,
      responsive: [
        {
          breakpoint: 1025,
          settings: {
            slidesToShow: 3,
          }
        },
        {
          breakpoint: 768,
          settings: {
            slidesToShow: 2,
          }
        },
        {
          breakpoint: 475,
          settings: {
            slidesToShow: 1,
          }
        }
      ]
    });

  }());

  // -------------------------------------------------------------
  //  Countdown
  // -------------------------------------------------------------

  (function () {

    $(".countdown").countdown({
      date: "29 Dec 2019 12:00:00",
      format: "on"
    });

  }());

  // -------------------------------------------------------------
  //  Remove Item
  // -------------------------------------------------------------

  (function () {

    $(".remove-icon").on('click', function () {
      $(this).parents('.remove-item').fadeOut();
    });

  }());


  // -------------------------------------------------------------
  //  MagnificPopup
  // -------------------------------------------------------------

  (function () {

    $('.popup-one .image-link').magnificPopup({
      type: 'image',
      gallery: {
        enabled: true
      }
    });

    $('.popup-two .image-link').magnificPopup({
      type: 'image',
      gallery: {
        enabled: true
      }
    });

    $('.video-link').magnificPopup({type: 'iframe'});

  }());


  // -------------------------------------------------------------
  //  Jquery Ui priceRange
  // -------------------------------------------------------------

  $(function () {

    $("#price_slider").slider({
      range: true,
      min: 0,
      max: 1050,
      values: [0, 1050],
      slide: function (event, ui) {
        $("#amount").val("$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ]);
      }
    });
    $("#amount").val("$" + $("#price_slider").slider("values", 0) +
            " - $" + $("#price_slider").slider("values", 1));

  });

  // -------------------------------------------------------------
  //  Jquery Ui priceRange
  // -------------------------------------------------------------

  $(function () {

    $('#home-carousel').bsTouchSlider();

  });



  /*==============================================================*/
  // Animationend
  /*==============================================================*/

  (function ($) {

    //Function to animate slider captions 
    function doAnimations(elems) {
      //Cache the animationend event in a variable
      var animEndEv = 'webkitAnimationEnd animationend';

      elems.each(function () {
        var $this = $(this),
                $animationType = $this.data('animation');
        $this.addClass($animationType).one(animEndEv, function () {
          $this.removeClass($animationType);
        });
      });
    }

    //Variables on page load 
    var $myCarousel = $('#home-carousel'),
            $firstAnimatingElems = $myCarousel.find('.item:first').find("[data-animation ^= 'animated']");

    //Initialize carousel 
    $myCarousel.carousel();

    //Animate captions in first slide on page load 
    doAnimations($firstAnimatingElems);

    //Pause carousel  
    $myCarousel.carousel('pause');

    //Other slides to be animated on carousel slide event 
    $myCarousel.on('slide.bs.carousel', function (e) {
      var $animatingElems = $(e.relatedTarget).find("[data-animation ^= 'animated']");
      doAnimations($animatingElems);
    });

  })(jQuery);


// script end
})(jQuery);