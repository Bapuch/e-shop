// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require jquery3
//= require jquery_ujs

//x= require popper
//xx= require boxotstrap

//= require easing
//= require responsiveslides.min
//= require jquery.flexisel
//= require jquery.etalage.min

//xx= require bootstrap-sprockets


$(document).on('turbolinks:load', function () {

  addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){window.scrollTo(0, 1); }

  jQuery(function ($) {
    $(".scroll").click(function (event) {
      event.preventDefault(); $('html,body').animate({
        scrollTop: $(this.hash).offset().top
      }, 900);
    });
  });


  $(function () {
    $("#slider").responsiveSlides({
      auto: true, nav: true, speed: 500, namespace: "callbacks", pager: true,
    });
  });

  jQuery(function ($) {
    $("#flexiselDemo1").flexisel({
      visibleItems: 3,
      animationSpeed: 1000,
      autoPlay: true,
      autoPlaySpeed: 3000,
      pauseOnHover: true,
      enableResponsiveBreakpoints: true,
      responsiveBreakpoints: {
        portrait: {
          changePoint: 480,
          visibleItems: 1
        },
        landscape: {
          changePoint: 640,
          visibleItems: 2
        },
        tablet: {
          changePoint: 768,
          visibleItems: 3
        }
      }
    });
  });

  jQuery(function ($) {

    $('#etalage').etalage({
      thumb_image_width: 400,
      thumb_image_height: 400,
      source_image_width: 800,
      source_image_height: 1000,
      show_hint: true,
      click_callback: function (image_anchor, instance_id) {
        alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
      }
    });

  });

  jQuery(function (c) {
    $('.close1').on('click', function (c) {
      $('.cart-header').fadeOut('slow', function (c) {
        $('.cart-header').remove();
      });
    });
    });

  // MODAL *****************************
  // Get the modal
  var modal = document.getElementById('myModal');

  // Get the button that opens the modal
  var buttons = document.getElementsByClassName('modal-btn');

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close");

  // When the user clicks on one of the dropdown buttons, open the modal
  for (var i = 0, len = buttons.length; i < len; i++) {
    buttons[i].onclick = function () {
      modal.style.display = "flex";
    }
  }

  // When the user clicks on <span> (x), close the modal
  for (var i = 0, len = span.length; i < len; i++) {
    span[i].onclick = function () {
      modal.style.display = "none";
    }
  }

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }

  // pour le cart
    jQuery(function (c) {
      let closeBtn = $('.close-btn');
      closeBtn.on('click', function (event) {
        var $i = event.target.id.split("_")[1];
        $('#cart-header' + $i).fadeOut('slow', function (c) {
          $('#cart-header' + $i).remove();
        });
      });
    });

});
