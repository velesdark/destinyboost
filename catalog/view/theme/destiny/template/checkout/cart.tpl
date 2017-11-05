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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
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
                <?php foreach ($products as $product) {?>
                <tr>
                <td>
                <div class="cart_img">
                <img src="/image/<?php print_r($product['thumb']);?>" />
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
                <td class="q_cart">
                <button type="submit" data-toggle="tooltip"  class="c_minus"></button>
                <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                <button type="submit" data-toggle="tooltip"  class="c_plus"></button>
                </td>
                <td class="td_del">
                <?php print_r($product['total']);?>
                <button type="button" data-toggle="tooltip" class="btn_del" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"></button>
                </td>

                </tr>
                <?php } ?>
            </table>

            <div class="modules">
                <div class="modules_left">
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
            <div class="cart_btns">
                <a href="/index.php?route=checkout/simplecheckout" class="btn_check">Checkout</a>
            </div>


        </form>
    </div>
</div>
<?php echo $footer; ?>
