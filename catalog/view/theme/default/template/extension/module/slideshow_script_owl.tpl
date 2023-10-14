<script type="text/javascript">
    // Note.. it supports Animate.css
    // Manual Slider don't support animate css
    $('#slideshow<?= $module; ?>').owlCarousel({
        items: 1,
        <?php if (count($banners) > 1) { ?>
            loop: true,
        <?php } ?>

        autoplay: false,
        autoplayTimeout: 5000,
        
        smartSpeed: 450,
        
        nav: <?= $arrows; ?>,
        navText: ['<div class="pointer absolute position-top-left h100 slider-nav slider-nav-left hover-show"></div>', '<div class="pointer absolute position-top-right h100 slider-nav slider-nav-right hover-show"></div>'],
        
        dots: <?= $dots; ?>,
        dotsClass: 'slider-dots slider-custom-dots absolute position-bottom-left w100 list-inline text-center',
        
        //animateOut: 'slideOutDown',
        //animateIn: 'slideInDown',
    });
</script>