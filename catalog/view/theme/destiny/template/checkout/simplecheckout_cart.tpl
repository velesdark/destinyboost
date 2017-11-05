<div class="simplecheckout-block"
     id="simplecheckout_cart" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $has_error ? 'data-error="true"' : '' ?>>
<?php if ($display_header) { ?>
<div class="checkout-heading panel-heading"><?php echo $text_cart ?></div>
<?php } ?>
<?php if ($attention) { ?>
<div class="alert alert-danger simplecheckout-warning-block"><?php echo $attention; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="alert alert-danger simplecheckout-warning-block"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="cart_body">
    <table cellspacing="0">

        <thead>
        <tr>
            <th>

            </th>
            <th>
                Name
            </th>
            <th>

            </th>
            <th>
                QUANTITY

            </th>
            <th>
                Price
            </th>
            <th>
                Subtotal
            </th>

        </tr>
        </thead>
        <tbody>
        <?php foreach ($products as $product) { ?>
        <?php if (!empty($product['recurring'])) { ?>
        <tr>
            <td class="simplecheckout-recurring-product" style="border:none;"><img
                        src="<?php echo $additional_path ?>catalog/view/theme/default/image/reorder.png" alt="" title=""
                        style="float:left;"/>
                <span style="float:left;line-height:18px; margin-left:10px;">
                            <strong><?php echo $text_recurring_item ?></strong>
                    <?php echo $product['profile_description'] ?>
                            </span>
            </td>
        </tr>
        <?php } ?>
        <tr>
            <td class="image">
                <div class="cart_img">
                    <img src="/image/<?php print_r($product['image']);?>"/>
                </div>
            </td>
            <td class="name">
                <?php echo $product['name']; ?>
                <?php if (!$product['stock'] && ($config_stock_warning || !$config_stock_checkout)) { ?>
                <span class="product-warning">***</span>
                <?php } ?>
                <?php if ($product['reward']) { ?>
                <small><?php echo $product['reward']; ?></small>
                <?php } ?>
            </td>
            <td class="model"><?php // echo $product['model']; ?></td>
            <td class="quantity q_cart">
                <div class="input-group btn-block" style="max-width: 200px;">
                            <span class="input-group-btn">
                                <button class="c_minus" data-onclick="decreaseProductQuantity" data-toggle="tooltip"
                                        type="submit">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </span>
                    <input type="text"
                           data-onchange="changeProductQuantity" <?php echo $quantity_step_as_minimum ? 'onfocus="$(this).blur()" data-minimum="' . $product['minimum'] . '"' : '' ?>
                    name="quantity[<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key']; ?>]"
                    value="<?php echo $product['quantity']; ?>" size="1" />
                    <span class="input-group-btn">
                                <button class="c_plus" data-onclick="increaseProductQuantity" data-toggle="tooltip"
                                        type="submit">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </span>
                </div>
            </td>
            <td class="price"><?php echo $product['price']; ?></td>
            <td class="total td_del">
                <?php echo $product['total']; ?>
                <button class="btn_del" data-onclick="removeProduct"
                        data-product-key="<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key'] ?>"
                        data-toggle="tooltip" type="button">
                    <i class="fa fa-times-circle"></i>
                </button>


            </td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher_info) { ?>
        <tr>
            <td class="image"></td>
            <td class="name"><?php echo $voucher_info['description']; ?></td>
            <td class="model"></td>
            <td class="quantity">
                <div class="input-group btn-block" style="max-width: 200px;">
                    <input class="form-control" type="text" value="1" disabled size="1"/>
                    <span class="input-group-btn">
                                    <button class="btn btn-danger" data-onclick="removeGift"
                                            data-gift-key="<?php echo $voucher_info['key']; ?>" type="button">
                                        <i class="fa fa-times-circle"></i>
                                    </button>
                                </span>
                </div>
            </td>
            <td class="price"><?php echo $voucher_info['amount']; ?></td>
            <td class="total"><?php echo $voucher_info['amount']; ?></td>
            <td class="remove"></td>
        </tr>
        <?php } ?>
        </tbody>
    </table>
</div>
<div class="modules">
    <div class="modules_left">
        <div class="modules_title">
            Promotional Codes
        </div>
        <div class="modules_subtitle">
            If you have a promotional code, enter it here:
        </div>
        <?php if (isset($modules['coupon'])) { ?>

        <input class="form-control" type="text" data-onchange="reloadAll" name="coupon" value="<?php echo $coupon; ?>"/>

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


<input type="hidden" name="remove" value="" id="simplecheckout_remove">
<div style="display:none;" id="simplecheckout_cart_total"><?php echo $cart_total ?></div>
<?php if ($display_weight) { ?>
<div style="display:none;" id="simplecheckout_cart_weight"><?php echo $weight ?></div>
<?php } ?>
<?php if (!$display_model) { ?>
<style>
    .simplecheckout-cart col.model,
    .simplecheckout-cart th.model,
    .simplecheckout-cart td.model {
        display: none;
    }
</style>
<?php } ?>
</div>