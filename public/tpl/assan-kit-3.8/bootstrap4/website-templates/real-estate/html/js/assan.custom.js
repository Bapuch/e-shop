$(function () {
    /* 
     Custom js file for assan
     */
//preloader
    $(window).preloader({
        delay: 500
    });

//shrink header
    $(document).on("scroll", function () {
        if
                ($(document).scrollTop() > 150) {
            $(".nav-sticky").addClass("nav-stick-top");
        } else
        {
            $(".nav-sticky").removeClass("nav-stick-top");
        }
    });

    /****************
     search inline
     */
    $('.search-open').on('click', function () {
        {
            $('.search-inline').addClass('search-visible');
        }
    });
    $('.search-close').on('click', function () {
        $('.search-inline').removeClass('search-visible');
    });
//back to top
    if ($('#back-to-top').length) {
        var scrollTrigger = 100, // px
                backToTop = function () {
                    var scrollTop = $(window).scrollTop();
                    if (scrollTop > scrollTrigger) {
                        $('#back-to-top').addClass('show');
                    } else {
                        $('#back-to-top').removeClass('show');
                    }
                };
        backToTop();
        $(window).on('scroll', function () {
            backToTop();
        });
        $('#back-to-top').on('click', function (e) {
            e.preventDefault();
            $('html,body').animate({
                scrollTop: 0
            }, 700);
        });
    }

    /**form popup popup**/
    $('.popup-content').magnificPopup({
        type: 'inline',
        mainClass: 'mfp-with-zoom',
        preloader: true
    });
    /**on load modal**/
    setTimeout(function () {
        if ($('#onloadModal').length) {
            $.magnificPopup.open({
                items: {
                    src: '#onloadModal'
                },
                type: 'inline'
            });
        }
    }, 1000);

    wow = new WOW(
            {
                boxClass: 'wow',
                animateClass: 'animated',
                offset: 0,
                mobile: true,
                live: true
            }
    );
    wow.init();

    //tooltip
    $('[data-toggle="tooltip"]').tooltip();
    //popover
    $('[data-toggle="popover"]').popover();
    //smooth scroll
    smoothScroll.init({
        selector: '[data-scroll]', // Selector for links (must be a class, ID, data attribute, or element tag)
        speed: 1000, // Integer. How fast to complete the scroll in milliseconds
        easing: 'easeInOutCubic', // Easing pattern to use
        offset: 0, // Integer. How far to offset the scrolling anchor location in pixels
        callback: function (anchor, toggle) {} // Function to run after scrolling
    });

    //owl nav slider
    $('.owl-nav-slide').owlCarousel({
        loop: true,
        margin: 10,
        nav: true,
        dots:false,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1000: {
                items: 3
            }
        }
    });
  $('.owl-clients').owlCarousel({
    loop:true,
    margin:10,
    nav:false,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:3
        },
        1000:{
            items:5
        }
    }
});
      //owl nav slider
    $('.owl-reviews').owlCarousel({
        loop: true,
        margin: 20,
        nav: false,
        dots:true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 2
            },
            1000: {
                items: 3
            }
        }
    });
    //stop dropdown menu close on inside click
    $('.dropdown-slide').on('click', function (e) {
    $(this).next('.dropdown-menu').toggle();
    e.stopPropagation();
});
$('.masonry-grid').masonry({
  // options
  itemSelector: '.masonry-item'
});
});
