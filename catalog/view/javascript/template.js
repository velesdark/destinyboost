jQuery(document).ready(function () {
    var url = document.location.href;
    jQuery(".main_menu a").each(function () {
        if (this.href == url) {
            jQuery(this).addClass('active');
        }
    });

    jQuery('.quest_title').click(function () {

        if (jQuery(this).next().css('display') == 'none') {
            jQuery(this).next().slideDown();
            jQuery(this).addClass('active');
        }
        else {
            jQuery(this).next().slideUp();
            jQuery(this).removeClass('active');
        }

    });
    jQuery('.plus').click(function () {
        jQuery('[name="quantity"]').val(parseInt(jQuery('[name="quantity"]').val()) + 1);

    });
    jQuery('.minus').click(function () {
        if (parseInt(jQuery('[name="quantity"]').val()) > 1)
            jQuery('[name="quantity"]').val(parseInt(jQuery('[name="quantity"]').val()) - 1);
    });
    jQuery('.c_plus').click(function () {
        jQuery(this).prev().val(parseInt(jQuery(this).prev().val()) + 1);

    });
    jQuery('.c_minus').click(function () {
        if (parseInt(jQuery(this).next().val()) > 1)
            jQuery(this).next().val(parseInt(jQuery(this).next().val()) - 1);
    });
    //jQuery('.prod_block select').styler();
    jQuery('.main_header').append(jQuery('.block1'));
    jQuery('.contact_form input[type="text"]:eq(0)').addClass('first');
    jQuery('.contact_form input[type="text"]:eq(1)').addClass('second');

    jQuery('.simplecheckout-block-content').append(jQuery('#agreement_checkbox'));
    jQuery('.over_all,.form_close,.cont_link').click(function () {
        jQuery('.over_all').hide();
        jQuery('#thank_form').hide();
    });
});