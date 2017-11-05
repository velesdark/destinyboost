<?php echo $header; ?>
<div class="content m_row">
    <div class="bread">
        <span>You are here: </span>
        <ul class="breadcrumb">
            <li><a href="/">Home</a></li>
            <?php foreach ($breadcrumbs as $k=>$breadcrumb) { ?>
            <li
            <?php if($k==count($breadcrumbs)-1) echo ' class="last"'?>><a
                    href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
        <div class="curs">
            <?php global $cur; echo $cur;?>
        </div>

    </div>
    <div class="info_body" id="product">
        <div class="prod_block">
            <div class="prod_block_top">
                <div class="prod_block_top_img">
                    <div class="prod_block_top_img_in">
                        <img src="/image/<?php echo $popup; ?>"/>
                    </div>
                </div>
                <div class="prod_block_top_desc">
                    <div class="prod_block_title">
                        <div class="prod_block_title_in">
                            <?php echo $heading_title; ?>
                        </div>
                        <div class="prod_q">
                            <div class="minus"></div>
                            <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2"
                                   id="input-quantity" class="form-control"/>
                            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
                            <div class="plus"></div>
                        </div>
                    </div>
                    <div class="prod_block_prop1">
                        <div class="prod_block_price">
                            <?php echo $price; ?>
                        </div>
                        <div class="clear"></div>
                        <div class="prod_block_option1">
                            <?php foreach ($options as $option) { ?>

                            <?php if($option['type']=='select'){ //print_r($option);?>
                            <div class="check_block input-group"
                                 id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php if($option['show_title']) { ?>
                                <div class="item_option_title">
                                    <?php print_R($option['name']); ?>
                                </div>
                                <?php } ?>
                                <select parent-id="<?php echo $option['option_id']; ?>"
                                        name="option[<?php echo $option['product_option_id']; ?>]"
                                        id="input-option<?php echo $option['product_option_id']; ?>"
                                        class="form-control">
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                    <option data-id-val="<?php echo $option_value['option_value_id']; ?>"
                                            value="<?php echo $option_value['product_option_value_id']; ?>"
                                            data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>"
                                            data-prefix="<?php echo $option_value['price_prefix']; ?>"
                                            data-price="<?php echo $option_value['price_value']; ?>"><?php echo $option_value['name']; ?>                <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
                                        )
                                        <?php } ?>
                                    </option>
                                    <?php } ?>

                                </select>
                            </div>
                            <?php } ?>

                            <?php } ?>
                        </div>

                    </div>
                    <div class="clear"></div>
                    <div class="prod_block_prop2">
                        <div class="prod_block_option3">
                            <?php foreach ($options as $option) { ?>
                            <?php if($option['type']=='checkbox'){ ?>
                            <div class="check_block input-group"
                                 id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php if($option['show_title']) { ?>
                                <div class="item_option_title">
                                    <?php print_R($option['name']); ?>
                                </div>
                                <?php } ?>
                                <?php foreach ($option['product_option_value'] as $option_value) { //print_r($option_value);?>

                                <input master-id="<?php echo $option['master_option']?>"
                                       data-master-id="<?php echo $option_value['master_option_value']; ?>"
                                       id="checkbox<?php echo $option_value['product_option_value_id']; ?>"
                                       class="checkbox" type="checkbox"
                                       name="option[<?php echo $option['product_option_id']; ?>][]"
                                       value="<?php echo $option_value['product_option_value_id']; ?>"
                                       data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>"
                                       data-prefix="<?php echo $option_value['price_prefix']; ?>"
                                       data-price="<?php echo $option_value['price_value']; ?>"/>

                                <label for="checkbox<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>                <?php if ($option_value['price']) { ?>
                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                    <?php } ?>
                                </label>
                                <?php } ?>
                            </div>
                            <?php } ?>
                            <?php } ?>
                        </div>

                    </div>
                    <div class="clear"></div>
                    <div class="prod_block_prop3">
                        <div class="prod_block_option4">
                            <?php foreach ($options as $option) { ?>
                            <?php if($option['type']=='radio'){ ?>
                            <div class="check_block input-group"
                                 id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php if($option['show_title']) { ?>
                                <div class="item_option_title">
                                    <?php print_R($option['name']); ?>
                                </div>
                                <?php } ?>
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>


                                <input master-id="<?php echo $option['master_option']?>"
                                       data-master-id="<?php echo $option_value['master_option_value']; ?>"
                                       id="radio<?php echo $option_value['product_option_value_id']; ?>" class="radio"
                                       type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                       value="<?php echo $option_value['product_option_value_id']; ?>"
                                       data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>"
                                       data-prefix="<?php echo $option_value['price_prefix']; ?>"
                                       data-price="<?php echo $option_value['price_value']; ?>"/>

                                <label for="radio<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>                <?php if ($option_value['price']) { ?>
                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                    <?php } ?>
                                </label>
                                <?php } ?>
                            </div>
                            <?php } ?>
                            <?php } ?>
                        </div>

                    </div>
                    <div class="clear"></div>
                    <div class="btns_cart">
                        <button type="button" id="button-cart" class="btn btn_cart btn-primary btn-lg btn-block">ADD TO
                            CART
                        </button>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="clear"></div>
            <div class="prod_block_bottom">
                <?php echo $description; ?>
            </div>
        </div>
    </div>


</div>


<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function () {
                $('#recurring-description').html('');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('#button-cart').on('click', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
                //$('#button-cart').button('loading');
            },
            complete: function () {
                $('#button-cart').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().before('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.before('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                        console.log('#input-option' + i.replace('_', '-'));
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    //$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    $('#thank_form .thank_text').html(json['success']);
                    $('#thank_form').show();
                    $('.over_all').show();


                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

                    $('html, body').animate({scrollTop: 0}, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    /*$('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });
    */
    $('button[id^=\'button-upload\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>
<script type="text/javascript"><!--
    $('#review').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function () {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function () {
                $('#button-review').button('loading');
            },
            complete: function () {
                $('#button-review').button('reset');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
        grecaptcha.reset();
    });

    /*$(document).ready(function() {
        $('.thumbnails').magnificPopup({
            type:'image',
            delegate: 'a',
            gallery: {
                enabled:true
            }
        });
    });*/

    $(document).ready(function () {
        var hash = window.location.hash;
        if (hash) {
            var hashpart = hash.split('#');
            var vals = hashpart[1].split('-');
            for (i = 0; i < vals.length; i++) {
                $('#product').find('select option[value="' + vals[i] + '"]').attr('selected', true).trigger('select');
                $('#product').find('input[type="radio"][value="' + vals[i] + '"]').attr('checked', true).trigger('click');
                $('#product').find('input[type="checkbox"][value="' + vals[i] + '"]').attr('checked', true).trigger('click');
            }
        }
    })
    //--></script>


<script type="text/javascript"><!--
    function price_format(price) {
        c =
    <
            ? php echo(empty($autocalc_currency['decimals']) ? "0" : $autocalc_currency['decimals']);
            ?
    >
        ;
        d = '<?php echo $autocalc_currency['
        decimal_point
        ']; ?>'; // decimal separator
        t = '<?php echo $autocalc_currency['
        thousand_point
        ']; ?>'; // thousands separator
        s_left = '<?php echo str_replace("'
        ", "\'", $autocalc_currency['
        symbol_left
        ']); ?>';
        s_right = '<?php echo str_replace("'
        ", "\'", $autocalc_currency['
        symbol_right
        ']); ?>';
        n = price * < ? php echo
        $autocalc_currency['value'];
            ?
    >
        ;
        i = parseInt(n = Math.abs(n).toFixed(c)) + '';
        j = ((j = i.length) > 3) ? j % 3 : 0;
        price_text = s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right;

    <
            ? php
        if (!empty($autocalc_currency2)) {
                ?
        >
            c =
        <
                ? php echo(empty($autocalc_currency2['decimals']) ? "0" : $autocalc_currency2['decimals']);
                ?
        >
            ;
            d = '<?php echo $autocalc_currency2['
            decimal_point
            ']; ?>'; // decimal separator
            t = '<?php echo $autocalc_currency2['
            thousand_point
            ']; ?>'; // thousands separator
            s_left = '<?php echo str_replace("'
            ", "\'", $autocalc_currency2['
            symbol_left
            ']); ?>';
            s_right = '<?php echo str_replace("'
            ", "\'", $autocalc_currency2['
            symbol_right
            ']); ?>';
            n = price * < ? php echo
            $autocalc_currency2['value'];
                ?
        >
            ;
            i = parseInt(n = Math.abs(n).toFixed(c)) + '';
            j = ((j = i.length) > 3) ? j % 3 : 0;
            price_text += '  <span class="currency2">(' + s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right + ')</span>';
        <
                ? php
        }
            ?
    >

        return price_text;
    }

    function calculate_tax(price) {
    <
            ? php // Process Tax Rates
        if (isset($tax_rates) && $tax) {
            foreach($tax_rates as $tax_rate)
            {
                if ($tax_rate['type'] == 'F') {
                    echo
                    'price += '.$tax_rate['rate'].
                    ';';
                }
                elseif($tax_rate['type'] == 'P')
                {
                    echo
                    'price += (price * '.$tax_rate['rate'].
                    ') / 100.0;';
                }
            }
        }
            ?
    >
        return price;
    }

    function process_discounts(price, quantity) {
    <
            ? php
            foreach($dicounts_unf as $discount)
        {
            echo
            'if ((quantity >= '.$discount['quantity'].
            ') && ('.$discount['price'].
            ' < price)) price = '.$discount['price'].
            ';'.
            "\n";
        }
            ?
    >
        return price;
    }


    animate_delay = 20;

    main_price_final = calculate_tax( < ? php echo
    $price_value;
        ?
    >)
    ;
    main_price_start = calculate_tax( < ? php echo
    $price_value;
        ?
    >)
    ;
    main_step = 0;
    main_timeout_id = 0;

    function animateMainPrice_callback() {
        main_price_start += main_step;

        if ((main_step > 0) && (main_price_start > main_price_final)) {
            main_price_start = main_price_final;
        } else if ((main_step < 0) && (main_price_start < main_price_final)) {
            main_price_start = main_price_final;
        } else if (main_step == 0) {
            main_price_start = main_price_final;
        }

        $('.autocalc-product-price').html(price_format(main_price_start));

        if (main_price_start != main_price_final) {
            main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
        }
    }

    function animateMainPrice(price) {
        main_price_start = main_price_final;
        main_price_final = price;
        main_step = (main_price_final - main_price_start) / 10;

        clearTimeout(main_timeout_id);
        main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
    }


    <
        ? php
    if ($special) {
            ?
    >
        special_price_final = calculate_tax( < ? php echo
        $special_value;
            ?
    >)
        ;
        special_price_start = calculate_tax( < ? php echo
        $special_value;
            ?
    >)
        ;
        special_step = 0;
        special_timeout_id = 0;

        function animateSpecialPrice_callback() {
            special_price_start += special_step;

            if ((special_step > 0) && (special_price_start > special_price_final)) {
                special_price_start = special_price_final;
            } else if ((special_step < 0) && (special_price_start < special_price_final)) {
                special_price_start = special_price_final;
            } else if (special_step == 0) {
                special_price_start = special_price_final;
            }

            $('.autocalc-product-special').html(price_format(special_price_start));

            if (special_price_start != special_price_final) {
                special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
            }
        }

        function animateSpecialPrice(price) {
            special_price_start = special_price_final;
            special_price_final = price;
            special_step = (special_price_final - special_price_start) / 10;

            clearTimeout(special_timeout_id);
            special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
        }

    <
            ? php
    }
        ?
    >


    function recalculateprice() {
        var main_price =
    <
            ? php echo(float)
        $price_value;
            ?
    >
        ;
        var input_quantity = Number($('input[name="quantity"]').val());
        var special =
    <
            ? php echo(float)
        $special_value;
            ?
    >
        ;
        var tax = 0;
        discount_coefficient = 1;

        if (isNaN(input_quantity)) input_quantity = 0;

    <
            ? php
        if ($special) {
                ?
        >
            special_coefficient =
        <
                ? php echo((float)
            $price_value / (float)
            $special_value
        )
            ;?
        >
            ;
        <
                ? php
        } else {
                ?
        >
        <
                ? php
            if (empty($autocalc_option_discount)) {
                    ?
            >
                main_price = process_discounts(main_price, input_quantity);
                tax = process_discounts(tax, input_quantity);
            <
                    ? php
            } else {
                    ?
            >
                if (main_price) discount_coefficient = process_discounts(main_price, input_quantity) / main_price;
            <
                    ? php
            }
                ?
        >
        <
                ? php
        }
            ?
    >


        var option_price = 0;

    <
            ? php
        if ($points) {
                ?
        >
            var points =
        <
                ? php echo(float)
            $points_value;
                ?
        >
            ;
            $('input:checked,option:selected').each(function () {
                if ($(this).data('points')) points += Number($(this).data('points'));
            });
            $('.autocalc-product-points').html(points);
        <
                ? php
        }
            ?
    >

        $('input:checked,option:selected').each(function () {
            if ($(this).data('prefix') == '=') {
                option_price += Number($(this).data('price'));
                main_price = 0;
                special = 0;
            }
        });

        $('input:checked,option:selected').each(function () {
            if ($(this).data('prefix') == '+') {
                option_price += Number($(this).data('price'));
            }
            if ($(this).data('prefix') == '-') {
                option_price -= Number($(this).data('price'));
            }
            if ($(this).data('prefix') == 'u') {
                pcnt = 1.0 + (Number($(this).data('price')) / 100.0);
                option_price *= pcnt;
                main_price *= pcnt;
                special *= pcnt;
            }
            if ($(this).data('prefix') == 'd') {
                pcnt = 1.0 - (Number($(this).data('price')) / 100.0);
                option_price *= pcnt;
                main_price *= pcnt;
                special *= pcnt;
            }
            if ($(this).data('prefix') == '*') {
                option_price *= Number($(this).data('price'));
                main_price *= Number($(this).data('price'));
                special *= Number($(this).data('price'));
            }
            if ($(this).data('prefix') == '/') {
                option_price /= Number($(this).data('price'));
                main_price /= Number($(this).data('price'));
                special /= Number($(this).data('price'));
            }
        });

        special += option_price;
        main_price += option_price;

    <
            ? php
        if ($special) {
                ?
        >
        <
                ? php
            if (empty($autocalc_option_special)) {
                    ?
            >
                main_price = special * special_coefficient;
            <
                    ? php
            } else {
                    ?
            >
                special = main_price / special_coefficient;
            <
                    ? php
            }
                ?
        >
            tax = special;
        <
                ? php
        } else {
                ?
        >
        <
                ? php
            if (!empty($autocalc_option_discount)) {
                    ?
            >
                main_price *= discount_coefficient;
            <
                    ? php
            }
                ?
        >
            tax = main_price;
        <
                ? php
        }
            ?
    >

        // Process TAX.
        main_price = calculate_tax(main_price);
        special = calculate_tax(special);

    <
            ? php
        if (!$autocalc_not_mul_qty) {
                ?
        >
            if (input_quantity > 0) {
                main_price *= input_quantity;
                special *= input_quantity;
                tax *= input_quantity;
            }
        <
                ? php
        }
            ?
    >

        // Display Main Price
        animateMainPrice(main_price);

    <
            ? php
        if ($special) {
                ?
        >
            animateSpecialPrice(special);
        <
                ? php
        }
            ?
    >
    }

    $(document).ready(function () {
        $('input[type="checkbox"]').bind('change', function () {
            recalculateprice();
        });
        $('input[type="radio"]').bind('change', function () {
            recalculateprice();
        });
        $('select').bind('change', function () {
            recalculateprice();
        });

        $quantity = $('input[name="quantity"]');
        $quantity.data('val', $quantity.val());
        (function () {
            if ($quantity.val() != $quantity.data('val')) {
                $quantity.data('val', $quantity.val());
                recalculateprice();
            }
            setTimeout(arguments.callee, 250);
        })();

    <
            ? php
        if ($autocalc_select_first) {
                ?
        >
            $('select[name^="option"] option[value=""]').remove();
            last_name = '';
            $('input[type="radio"][name^="option"]').each(function () {
                if ($(this).attr('name') != last_name) $(this).prop('checked', true);
                last_name = $(this).attr('name');
            });
        <
                ? php
        }
            ?
    >


        jQuery('select').change(function () {
            temp = jQuery(this).children('option:selected');

            if (temp.attr('data-id-val') != '') {

                jQuery('input[type="checkbox"][master-id="' + jQuery(this).attr('parent-id') + '"]').each(function () {
                    jQuery(this).attr('checked', false);
                    if (jQuery(this).attr('data-master-id') != '') {


                        if (jQuery(this).attr('data-master-id') != temp.attr('data-id-val')) {
                            console.log(jQuery(this).attr('data-master-id'));
                            console.log(temp.attr('data-id-val'));

                            jQuery(this).hide();

                            jQuery(this).next().hide();
                        }
                        else {
                            jQuery(this).show();
                            jQuery(this).next().show();
                        }
                    }
                });
                jQuery('input[type="radio"][master-id="' + jQuery(this).attr('parent-id') + '"]').each(function () {
                    jQuery(this).attr('checked', false);
                    if (jQuery(this).attr('data-master-id') != '') {


                        if (jQuery(this).attr('data-master-id') != temp.attr('data-id-val')) {
                            console.log(jQuery(this).attr('data-master-id'));
                            console.log(temp.attr('data-id-val'));

                            jQuery(this).hide();

                            jQuery(this).next().hide();
                        }
                        else {
                            jQuery(this).show();
                            jQuery(this).next().show();
                        }
                    }
                });
            }
            recalculateprice();
        });


        jQuery('select').each(function () {
            temp = jQuery(this).children('option:selected');

            if (temp.attr('data-id-val') != '') {

                jQuery('input[type="checkbox"][master-id="' + jQuery(this).attr('parent-id') + '"]').each(function () {
                    jQuery(this).attr('checked', false);
                    if (jQuery(this).attr('data-master-id') != '') {


                        if (jQuery(this).attr('data-master-id') != temp.attr('data-id-val')) {
                            console.log(jQuery(this).attr('data-master-id'));
                            console.log(temp.attr('data-id-val'));

                            jQuery(this).hide();

                            jQuery(this).next().hide();
                        }
                        else {
                            jQuery(this).show();
                            jQuery(this).next().show();
                        }
                    }
                });
                jQuery('input[type="radio"][master-id="' + jQuery(this).attr('parent-id') + '"]').each(function () {
                    jQuery(this).attr('checked', false);
                    if (jQuery(this).attr('data-master-id') != '') {


                        if (jQuery(this).attr('data-master-id') != temp.attr('data-id-val')) {
                            console.log(jQuery(this).attr('data-master-id'));
                            console.log(temp.attr('data-id-val'));

                            jQuery(this).hide();

                            jQuery(this).next().hide();
                        }
                        else {
                            jQuery(this).show();
                            jQuery(this).next().show();
                        }
                    }
                });
            }
            recalculateprice();
        });


        recalculateprice();


    });

    //--></script>

<?php echo $footer; ?>
