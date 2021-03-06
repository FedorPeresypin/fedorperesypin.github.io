$(document).ready(function(){
    $('.carousel__inner').slick({        
        infinite: true,
        speed: 1000,
        slidesToShow: 1,
        autoplay: true,
        autoplaySpeed: 1000,
        prevArrow:'<img src="img/slider/chevron_left.png" class="slick-prev"></img>',
        nextArrow:'<img src="img/slider/chevron_right.png" class="slick-next"></img>',
        responsive: [
            {
              breakpoint: 1024,
              settings: {
                  arrows: false
              }
            }
          ]
    });

    $('ul.catalog__tabs').on('click', 'li:not(.catalog__tab_active)', function() {
        $(this)
          .addClass('catalog__tab_active').siblings().removeClass('catalog__tab_active')
          .closest('div.container').find('div.catalog__content').removeClass('catalog__content_active').eq($(this).index()).addClass('catalog__content_active');
      });
    
    function toggleSlide(item) {
        $(item).each(function(i) {
            $(this).on('click', function(e) {
                e.preventDefault();
                $('.catalog-item__content').eq(i).toggleClass('catalog-item__content_active');
                $('.catalog-item__list').eq(i).toggleClass('catalog-item__list_active');
            });
        });
    }
    toggleSlide('.catalog-item__link');
    toggleSlide('.catalog-item__back');

    //Modal
    $('[data-modal="consultation"]').on('click', function(){
        $('.overlay, #consultation').fadeIn();
    });
    $('.modal__close').on('click', function(){
        $('.overlay, #consultation, #order, #thanks').fadeOut();
    });

    // $('.button_submit').on('click', function(){
    //     $('#consultation, #order').fadeOut();
    //     $('.overlay, #thanks').fadeIn();
    // });
    $('.button_mini').each(function(i){
        $(this).on('click', function(){
            $('#order .modal__descr').text($('.catalog-item__subtitle').eq(i).text());
            $('.overlay, #order').fadeIn();
        });
    });
 
    
    function validateForms(form) {
        $(form).validate({
            rules: {
                name: "required",
                phone: "required",
                email: {
                    required: true,
                    email: true
                }
            },
            messages: {
                name: "?????????????? ???????? ??????",
                email: {
                  required: "?????????????? ???????? ??????????",
                  email: "?????????????? ?????????? ?? ?????????????? name@domain.com"
                },
                phone: "?????????????? ???????? ?????????? ????????????????"
            }
        });
    }
    validateForms("#consultation-form");
    validateForms("#consultation form");
    validateForms("#order form");

    $("input[name=phone]").mask("+7(999) 999-9999");

    //scroll up
    $(window).scroll(function(){
        if ($(this).scrollTop() > 1600) {
            $(".pageup").fadeIn();
        }else{
            $(".pageup").fadeOut();
        }
    });
    $("a[href^='#up']").click(function(){
        var _href = $(this).attr("href");
        $("html, body").animate({scrollTop: $(_href).offset().top+"px"});
        return false;
});
        
    
});