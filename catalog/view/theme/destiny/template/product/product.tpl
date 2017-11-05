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
                        <div class="prod_block_option1">

                            <?php foreach ($options as $option) { ?>
                            <div class="check_block input-group"
                                 id="input-option<?php echo $option['product_option_id']; ?>">

                                <?php if($option['type']=='select'){ ?>
                                <select name="option[<?php echo $option['product_option_id']; ?>]"
                                        id="input-option<?php echo $option['product_option_id']; ?>"
                                        class="form-control">
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                    <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                                    <?php } ?>

                                </select>
                                <?php } ?>
                            </div>
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
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>

                                <input id="checkbox<?php echo $option_value['product_option_value_id']; ?>"
                                       class="checkbox" type="checkbox"
                                       name="option[<?php echo $option['product_option_id']; ?>][]"
                                       value="<?php echo $option_value['product_option_value_id']; ?>"/>

                                <label for="checkbox<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?></label>
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
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>


                                <input id="radio<?php echo $option_value['product_option_value_id']; ?>" class="radio"
                                       type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                       value="<?php echo $option_value['product_option_value_id']; ?>"/>

                                <label for="radio<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?></label>
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
                    }
                    console.log(json['error']);

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

<?php echo $footer; ?>
