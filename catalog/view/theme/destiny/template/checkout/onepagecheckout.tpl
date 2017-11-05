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
    </div>
    <div class="cart_body">
        <table cellspacing="0">
            <tr>
                <th>
                    Name
                </th>
                <th>
                </th>
                <th>
                    Sku
                </th>
                <th>
                    Price
                </th>
                <th>
                    QUANTITY
                </th>
                <th>
                    Subtotal
                </th>

            </tr>

            <?php foreach ($products as $product) { ?>
            <tr>
                <td>
                    <div class="cart_img">
                        <img src="/image/<?php print_r($product['image']);?>"/>
                    </div>
                </td>
                <td>
                    <?php print_r($product['name']);?>
                </td>
                <td>
                    <?php print_r($product['model']);?>
                </td>
                <td>
                    <?php print_r($product['price']);?>
                </td>
                <td>
                    <?php print_r($product['quantity']);?>
                </td>
                <td>
                    $ <?php print_r($product['total']);?>
                </td>

            </tr>

            <?php } ?>
        </table>
        <div class="modules">
            <div class="modules_left">
                <div class="modules_title">
                    Promotional Codes
                </div>
                <div class="modules_subtitle">
                    If you have a promotional code, enter it here:
                </div>
                <?php foreach ($modules as $module) { ?>
                <?php print_r($module); ?>
                <?php } ?>
            </div>
            <div class="modules_right">
                <div class="modules_title">
                    Order Summary
                </div>
                <?php foreach ($totals as $total) { ?>

                <div class="total_line <?php if($total['title']=='Total') echo 'last'; ?>">
                    <div class="total_left">
                        <?php print_r($total['title']);?>
                    </div>
                    <div class="total_right">
                        <?php print_r($total['text']);?>
                    </div>

                </div>
                <?php } ?>


            </div>
        </div>
        <div class="ch_left">
            <div class="ch_block hidden">
                <div class="ch_block_title region">
                    Регион доставки
                </div>
                <div class="ch_block_cont">
                    <div class="ch_block_cont_title">
                        Местоположение<span>*</span>
                    </div>
                    <div class="ch_cities">
                        <div class="ch_city active">Москва</div>
                        <div class="ch_city">Санкт-Петербург</div>
                        <div class="ch_city">Екатеринбург</div>
                        <div class="ch_city">Челябинск</div>

                    </div>

                    <div class="payment-data">
                        <input type="text" id="city-ch" name="city" value="City"
                               class="form-control large-field">
                        <span class="error"></span>
                    </div>

                </div>
            </div>
            <div class="ch_block hidden">
                <div class="ch_block_title dost">
                    Доставка
                </div>
                <div class="ch_block_cont">
                    <div class="ch_block_cont_title">
                        Вид доставки<span>*</span>
                    </div>
                    <div class="payment-data dost_c">
                        <?php $k=0; foreach ($shippig_methods as $shipping_method) { ?>
                        <label><input type="radio" <?php if($k==0) echo 'checked'; ?> name="shipping_method"
                            id="shipping-method" class="form-control large-field"
                            value='{"title": "<?php echo $shipping_method['title'] ?>", "code": "<?php echo $shipping_method['value'] ?>", "comment":"", "shipping_method":"<?php echo $shipping_method['value'] ?>", "cost":"<?php echo $shipping_method['cost'] ?>","tax_class_id":""}
                            '><?php echo $shipping_method['title'] ?></label>
                        <?php $k++; } ?>
                    </div>

                </div>
            </div>
            <div class="ch_block hidden">
                <div class="ch_block_title pay">
                    Оплата
                </div>
                <div class="ch_block_cont">
                    <div class="ch_block_cont_title">
                        Вид оплаты
                    </div>
                    <div class="payment-data pay_c">
                        <?php $k=0; foreach ($payment_methods as $payment_method) {  ?>
                        <label><input type="radio" <?php if($k==0) echo 'checked'; ?> id="payment_select"
                            name="payment_method" class="form-control large-field"
                            value='{"title": "<?php echo $payment_method['title'] ?>", "code": "<?php echo $payment_method['code'] ?>"}
                            '><?php echo $payment_method['title'] ?></label>
                        <?php $k++; } ?>
                    </div>

                </div>
            </div>
            <div class="ch_block">
                <div class="ch_block_title user hidden">
                    Покупатель
                </div>
                <div class="ch_block_cont user">
                    <div class="ch_block_cont_line_all_left">
                        <div class="c_title">
                            Bill to
                        </div>
                        <div class="ch_block_cont_line">
                            <div class="ch_block_cont_line_left">
                                Name<span>*</span>
                            </div>
                            <div class="ch_block_cont_line_right payment-data">
                                <input type="text" id="firstname-ch" name="firstname" value="user"
                                       class="form-control large-field">
                                <span class="error"></span>

                            </div>
                        </div>
                        <div class="ch_block_cont_line">
                            <div class="ch_block_cont_line_left">
                                E-mail
                            </div>
                            <div class="ch_block_cont_line_right payment-data">
                                <input type="text" id="email-ch" name="email" value="<?php echo $email; ?>"
                                       class="form-control large-field">
                                <span class="error"></span>

                            </div>
                        </div>
                        <div class="ch_block_cont_line">
                            <div class="ch_block_cont_line_left">
                                Your Skype
                            </div>
                            <div class="ch_block_cont_line_right payment-data">
                                <input type="tel" id="telephone-ch" name="telephone"
                                       value="<?php echo $telephone; ?>" class="form-control large-field">
                                <span class="error"></span>

                            </div>
                        </div>
                        <div class="ch_block_cont_line">
                            <div class="ch_block_cont_line_left">
                                Other Area
                            </div>
                            <div class="ch_block_cont_line_right payment-data">
                                <input type="text" name="address_1" id="address_1" value="<?php echo $address_1 ?>"
                                       class="form-control large-field" placeholder="">
                                <span class="error"></span>
                            </div>
                        </div>

                    </div>
                    <div class="ch_block_cont_line_all_right">
                        <div class="c_title">
                            Notes and special requests
                        </div>
                        <div class="ch_block_cont_line" style="width:350px;">
                            <div class="ch_block_cont_line_left" style="width:150px;">
                                Notes and special requests:
                            </div>
                            <div class="ch_block_cont_line_right payment-data">
                                <input type="text" id="comment_field" class="form-control large-field" name="comment"
                                       value="<?php echo $comment ?>" placeholder="">
                            </div>
                        </div>
                        <div id="ajax-button-confirm" style="float:left;margin-left:20px;background:#bdf7fd;"
                             class=" btn_check btn btn-lg btn-success">
                            Confirm Purchase
                        </div>


                    </div>


                </div>
            </div>


        </div>


    </div>
</div>

<script type="text/javascript"><!--

    function updateShipping(s) {
        shp = JSON.parse(s.value)
        $.ajax({
                url: 'index.php?route=checkout/shipping_method/save',
                type: 'post',
                data: shp,
                dataType: 'json',
                beforeSend: function () {
                    $('#shipping-method').addClass('loading');
                },
                success: function (json) {
                    $('.alert, .text-danger').remove();

                    //if (json['redirect']) {
                    //    location = json['redirect'];
                    //}
                    if (json['error']) {
                        if (json['error']['warning']) {
                            // Error ylanyrkkaan....
                            alert(json['error']['warning']);
                        }
                    } else {
                        $.ajax({
                            url: 'index.php?route=checkout/onepagecheckout/totals',
                            type: 'get',
                            success: function (json) {
                                $('#totals tbody').remove();
                                $('#totals').append('<tbody></tbody');
                                for (t in json['totals']) {
                                    $('#totals tbody').append('<tr class="name subtotal"><td class="name subtotal"><strong>' + json['totals'][t]['title'] + '</strong></td><td class="price">' + json['totals'][t]["text"] + '</td></tr>');
                                }
                            }
                        });
                        // Update Totalsi!
                    }
                    $('#shipping-method').removeClass('loading');
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            }
        ); //ajax
    }

    $(document).ready(function () {

        $(' #LoginModal .submit-login-form ').on('click', function () {
            $.ajax({
                    url: 'index.php?route=checkout/onepagecheckout/AjaxLogin',
                    type: 'post',
                    data: $('#LoginModal #input-email, #LoginModal #input-password '),
                    dataType: 'json',
                    beforeSend: function () {

                    },
                    success: function (json) {
                        console.log(json);
                        if (json.errors != 0) {
                            if (typeof json.errors.warning != 'undefined' && json.errors.warning != '')
                                $('#LoginModal .errors-block').html(json.errors.warning);
                            if (typeof json.errors.errors != 'undefined' && json.errors.errors != '')
                                $('#LoginModal .errors-block').append('<br>' + json.errors.error);
                        }
                        else if (json.errors == 0) {
                            $('#firstname-ch').prop('value', json.c_name);
                            $('#city-ch').prop('value', json.city);
                            $('#address_1').prop('value', json.address_1);
                            $('#email-ch').prop('value', json.email);
                            $('#telephone-ch').prop('value', json.telephone);
                            $('#LoginModal').modal('hide');
                            $('#login_warning').html('');
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                }
            ); //ajax
            return false;
        });

        $('#ajax-button-confirm').on('click', function () {

            $.ajax({
                url: 'index.php?route=checkout/onepagecheckout',
                type: 'post',
                data: $('.payment-data input[type=\'text\'],  .payment-data input[type=\'tel\'],  .payment-data input[type=\'radio\']:checked,  .payment-datainput input[type=\'checkbox\']:checked, .payment-data  select '),
                dataType: 'json',
                beforeSend: function () {
                    $('#ajax-button-confirm').addClass('preloader');

                },
                complete: function () {
                    $('#ajax-button-confirm').removeClass('preloader');

                },
                success: function (json) {
                    console.log(json);

                    if (json.error) {
                        if (json['error']['firstname']) {
                            $('#firstname-ch+.error').html(json['error']['firstname']);
                            $('#firstname-ch').addClass('error');
                            $('#firstname-ch').removeClass('ok');
                        }
                        else {
                            $('#firstname-ch').removeClass('error');
                            $('#firstname-ch').addClass('ok');
                        }


                        if (json['error']['email']) {
                            $('#email-ch+.error').html(json['error']['email']);
                        }

                        if (json['error']['telephone']) {
                            $('#telephone-ch+.error').html(json['error']['telephone']);
                        }

                        if (json['error']['address_1']) {
                            $('#address_1+.error').html(json['error']['address_1']);
                        }

                        if (json['error']['city']) {
                            $('#city-ch+.error').html(json['error']['city']);
                        }
                    }

                    else if (json['cod']) {
                        $.ajax({
                            type: 'get',
                            url: 'index.php?route=extension/payment/cod/confirm',
                            cache: false,
                            beforeSend: function () {
                                $('#ajax-button-confirm').button('loading');
                            },
                            complete: function () {
                                $('#ajax-button-confirm').button('reset');
                            },
                            success: function () {
                                location = 'index.php?route=checkout/success';
                            }
                        });
                    }

                    else if (json['payment']) {
                        $('.hiden_payment_info').html(json['payment']);
                        console.log($('.hiden_payment_info a').attr('href'));
                        location = $('.hiden_payment_info a').attr('href');
                    }
                    else {
                        if (json.credit)
                            credit_confirm('/index.php?route=checkout/part_payment_cart/getResult&from_privat24=true');
                        /* else
                             location = 'index.php?route=checkout/success'*/

                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });


        });


    });
    //--></script>

<?php echo $footer; ?>
