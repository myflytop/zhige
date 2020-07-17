/*------------------------------------------------------------------
[Master JavaScript]
Project Name: Tienda - Digital Products Store eCommerce Bootstrap 4 Template
Version: 1.0.0
Author: HasTech
Website: http://devitems.com
Last Update: 09.10.2018
-------------------------------------------------------------------*/
/*global jQuery */
(function ($) {
    "use strict";

    jQuery(document).ready(function ($) {

        // Mini Cart Hide Show JS
        $('.btn-minicart').on('click', function () {
            $('.minicart-content').stop().slideToggle(300);
        });

        // Categories Item Show Hide
        $(".btn-category").on('click', function () {
            $(".category-list-menu").stop().slideToggle();
        });

        $(".category-item-parent.hidden").hide();
        $(".category-item.btn-more").on('click', function (e) {
            e.preventDefault();
            $(".category-item-parent.hidden").toggle(500);
            var htmlAfter = "折叠分类";
            var htmlBefore = "更多分类";

            $(this).html($(this).text() == htmlAfter ? htmlBefore : htmlAfter);
            $(this).toggleClass("minus");
        });

        // Home 1 Slider Carousel
        var banner_owl = $('.home-slider-carousel');
        banner_owl.owlCarousel({
            items: 1,
            loop: true,
            nav: true,
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            dots: false,
            smartSpeed: 1000,
            autoplay: true,
            autoplayTimeout: 3000,
            autoplayHoverPause: true
        });

        // Slider Carousel
        $('.slider-carousel').owlCarousel({
            items: 1,
            loop: true,
            dots: false,
            nav: true,
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            smartSpeed: 500
        });

        // Home 1 Products Carousel
        $('.product-carousel').owlCarousel({
            items: 4,
            loop: true,
            dots: false,
            nav: true,
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            smartSpeed: 500,
            margin: 30,
            responsive: {
                0: {
                    items: 1
                },
                576: {
                    items: 2
                },
                992: {
                    items: 4
                }
            }
        });

        // Home 3 Products Carousel
        $('.product-carousel-home3').owlCarousel({
            items: 3,
            loop: true,
            dots: false,
            nav: true,
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            smartSpeed: 500,
            margin: 30,
            responsive: {
                0: {
                    items: 1
                },
                576: {
                    items: 2
                },
                992: {
                    items: 3
                }
            }
        });

        // Home 1 Category Products Carousel
        $('.cat-pro-carousel').owlCarousel({
            items: 2,
            loop: true,
            dots: false,
            nav: true,
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            smartSpeed: 500,
            margin: 30,
            responsive: {
                0: {
                    items: 1
                },
                576: {
                    items: 2
                }
            }
        });

        // Brand Carousel
        $('.brand-logo-carousel').owlCarousel({
            items: 5,
            loop: true,
            dots: false,
            autoplay: true,
            autoplayTimeout: 1500,
            autoplayHoverPause: true,
            nav: false,
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            smartSpeed: 700,
            rtl: true,
            margin: 20,
            responsive: {
                0: {
                    items: 1
                },
                480: {
                    items: 2
                },
                768: {
                    items: 3
                },
                992: {
                    items: 5
                }
            }
        });

        // Recent Post Carousel JS
        $('.recent-post-carousel').owlCarousel({
            items: 1,
            loop: false,
            rewind: true,
            dots: true,
            nav: false,
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            smartSpeed: 700,
            responsive: {
                768: {
                    items: 2,
                    margin: 30
                }
            }
        });

        // Client Says Carousel JS
        $('.reviews-carousel').owlCarousel({
            items: 1,
            loop: true,
            dots: true,
            nav: false,
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            smartSpeed: 700
        });

        // Product Thumbnail Carousel JS
        $('.product-thumb-carousel').owlCarousel({
            loop: true,
            items: 1,
            dots: false,
            smartSpeed: 500,
            nav: true,
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            thumbs: true,
            thumbImage: true,
            thumbContainerClass: 'owl-thumbs',
            thumbItemClass: 'owl-thumb-item'
        });

        // Product Thumbnail Carousel JS
        $('.product-thumb-carousel-demo').owlCarousel({
            loop: true,
            items: 3,
            dots: false,
            smartSpeed: 500,
            nav: true,
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            margin: 15,
            thumbs: false,
            responsive: {
                0: {
                    items: 1
                },
                576: {
                    items: 2
                },
                992: {
                    items: 3
                }
            }
        });

        // Latest Product Carousel  // index2.html
        $('.latest-product-carousel').owlCarousel({
            items: 3,
            loop: true,
            dots: false,
            nav: true,
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            smartSpeed: 500,
            margin: 30,
            responsive: {
                0: {
                    items: 1
                },
                576: {
                    items: 2
                },
                992: {
                    items: 3
                }
            }
        });

        // Sidebar Product Carousel  // index2.html
        $('.sidebar-product-carousel').owlCarousel({
            items: 1,
            loop: false,
            dots: false,
            nav: false,
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            smartSpeed: 500,
            responsive: {
                0: {
                    items: 1
                },
                576: {
                    items: 2
                },
                992: {
                    items: 1
                }
            }
        });

        // Sidebar Post Carousel  // index3.html
        $('.sidebar-post-carousel').owlCarousel({
            items: 1,
            loop: false,
            dots: true,
            nav: false,
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            smartSpeed: 500,
            responsive: {
                0: {
                    items: 1
                },
                576: {
                    items: 2,
                    margin: 30
                },
                992: {
                    items: 1
                }
            }
        });

        // Spacial Offer carousel  // index3.html
        $('.spacial-product-carousel').owlCarousel({
            items: 1,
            loop: false,
            dots: false,
            nav: false,
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            smartSpeed: 500,
            responsive: {
                576: {
                    items: 2,
                    margin: 20
                },
                768: {
                    items: 3,
                    margin: 10
                },
                992: {
                    items: 1,
                    margin: 0
                }
            }
        });

        // Sale Products Countdown
        $(".sale-countdown").each(function (index, element) {
            var $element = $(element),
                $date = $element.data('date');

            $element.countdown($date, function (event) {
                var $this = $(this).html(event.strftime(''

                    + '<div class="countdown-item"><span class="countdown-time">%D</span><span class="countdown-label">Days</span></div>'
                    + '<div class="countdown-item"><span class="countdown-time">%H</span><span class="countdown-label">Hours</span></div>'
                    + '<div class="countdown-item"><span class="countdown-time">%M</span><span class="countdown-label">Mins</span></div>'
                    + '<div class="countdown-item"><span class="countdown-time">%S</span><span class="countdown-label">Secs</span></div>'));
            });
        });

        // Scroll to top
        $('.scrolltotop').smoothScroll({
            direction: 'top',
            scrollTarget: 'html',
            speed: 600
        });

        //Header Fix JS
        if ($('#fixheader').length) {
            var header = document.getElementById("fixheader"),
                sticky = header.offsetTop;
        }

        function headerfix() {
            if (window.pageYOffset >= sticky) {
                header.classList.add("fixed");
            } else {
                header.classList.remove("fixed");
            }
        }

        // Responsive Menu Slicknav
        $('.mainmenu').slicknav({
            label: '',
            prependTo: '.navigation-area',
            closedSymbol: '+',
            openedSymbol: '-',
            init: function () {
                $('.slicknav_nav').find('ul').removeClass('dropdown-nav');
                $('.slicknav_nav').find('li').removeClass('dropdown-show');
                $('.slicknav_nav').find('a').removeClass('arrow-toggle');
            }
        });

        // Responsive Category Menu
        $('.category-list-menu').slicknav({
            label: 'Categories',
            prependTo: '.categories-list-wrap',
            closedSymbol: '+',
            openedSymbol: '-',
            init: function () {
                $('.slicknav_nav').find('ul').removeClass('dropdown-nav');
                $('.slicknav_nav').find('li').removeClass('dropdown-show');
                $('.slicknav_nav').find('a').removeClass('arrow-toggle');
            }
        });

        /// Nice Select JS
        $('select').niceSelect();

        // Product View Style JS
        var view_style_wrap = $('.shop-page-products-wrap > .products-wrapper');

        $('.product-view li.box-gird').on('click', function () {
            view_style_wrap.removeClass('products-list-view');
        });

        $('.product-view li.list').on('click', function () {
            view_style_wrap.addClass('products-list-view');
        });

        $('.product-view li').on('click', function () {
            $('.product-view li').removeClass('current');
            $(this).addClass('current');
        });

        // Checkout Page Checkbox
        $("#create_pwd").on("change", function () {
            $(".account-create").slideToggle("100");
        });

        $("#ship_to_different").on("change", function () {
            $(".ship-to-different").slideToggle("100");
        });

        // Payment Method Accordion
        $('input[name="paymentmethod"]').on('click', function () {

            var $value = $(this).attr('value');

            $('.payment-method-details').slideUp();
            $('[data-method="' + $value + '"]').slideDown();
        });


        // Gallery Magnific Popup JS
        $('.single-gallery-item').magnificPopup({
            type: 'image',
            gallery: {
                enabled: true
            }
        });


        // Single Product Sticky Sidebar
        var windowWidth = $(window).width();
        if (992 <= windowWidth) {
            $('.sidebar-active').stickySidebar({
                topSpacing: 80,
                bottomSpacing: 30,
                minWidth: 767
            });
        }

        //Map Js
        var map_id = $('#map_content');
        if (map_id.length > 0) {
            var $lat = map_id.data('lat'),
                $lng = map_id.data('lng'),
                $zoom = map_id.data('zoom'),
                $maptitle = map_id.data('maptitle'),
                $mapaddress = map_id.data('mapaddress'),
                mymap = L.map('map_content').setView([$lat, $lng], $zoom);

            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
                attribution: 'Map',
                maxZoom: 18,
                id: 'mapbox.streets',
                scrollWheelZoom: false,
                accessToken: 'pk.eyJ1Ijoic2hha2lsYWhtbWVlZCIsImEiOiJjamk4anF6NDgwMGd5M3BwM2c4eHU5dmIzIn0.yBLGUAB8kV1I1yGGonxzzg'
            }).addTo(mymap);

            var marker = L.marker([$lat, $lng]).addTo(mymap);
            marker.bindPopup('<b>' + $maptitle + '</b><br>' + $mapaddress).openPopup();
            mymap.scrollWheelZoom.disable();
        }
        //Map Js end


        //Email Ajax Submission
        $('#subscribe-form').submit(function () {
            var action = $(this).attr('action'),
                result = $('#subscribeResult');

            $.ajax({
                url: action,
                type: 'POST',
                data: {
                    email: $('#address').attr('value')
                },
                success: function (data) {
                    result.html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>");
                    result.append(data);
                    result.removeClass('alert alert-danger');
                    result.addClass('alert alert-success');
                    //clear all fields
                    $('#subscribe-form').trigger("reset");
                },
                error: function () {
                    result.html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>");
                    result.append('Sorry, an error occurred.');
                    result.removeClass('alert alert-success');
                    result.addClass('alert alert-danger');
                    //clear all fields
                    $('#subscribe-form').trigger("reset");
                }
            });
            return false;
        });

        // All Window Scroll Function
        $(window).scroll(function () {
            //Scroll top Hide Show
            if ($(window).scrollTop() >= 400) {
                $('.scrolltotop').addClass('show');
            } else {
                $('.scrolltotop').removeClass('show');
            }

            //Header Fix JS
            if ($('#fixheader').length > 0) {
                headerfix();
            }

        });

    }); //Ready Function End

    jQuery(window).on('load', function () {

    }); //window load End
}(jQuery));