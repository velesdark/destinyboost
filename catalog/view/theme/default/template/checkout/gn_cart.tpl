<table id="cart_table" class="table table-bordered table-hover table-responsive">
    <thead>
    <tr>
        <th class="text-left"><?php echo $column_name; ?></th>
        <th class="text-left hidden-xs"><?php echo $column_model; ?></th>
        <th class="text-right hidden-xs"><?php echo $column_quantity; ?></th>
        <th class="text-right hidden-xs"><?php echo $column_price; ?></th>
        <th class="text-right"><?php echo $column_total; ?></th>
    </tr>
    </thead>
    <tbody>
    <?php foreach ($products as $product) { ?>
    <tr>
        <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php foreach ($product['option'] as $option) { ?>
            <br/>
            &nbsp;<small> - <?php echo $option['name']; ?>
                : <?php if (isset($option['option_value']) && !empty($option['option_value'])) echo $option['option_value'];else if (isset($option['value'])) echo $option['value']; ?></small>
            <?php } ?></td>
        <td class="text-left hidden-xs"><?php echo $product['model']; ?></td>
        <td class="text-right hidden-xs"><?php echo $product['quantity']; ?></td>
        <td class="text-right hidden-xs"><?php echo $product['price']; ?></td>
        <td class="text-right"><?php echo $product['total']; ?></td>
    </tr>
    <?php } ?>
    <?php foreach ($vouchers as $voucher) { ?>
    <tr>
        <td class="text-left"><?php echo $voucher['description']; ?></td>
        <td class="text-left hidden-xs"></td>
        <td class="text-right hidden-xs">1</td>
        <td class="text-right hidden-xs"><?php echo $voucher['amount']; ?></td>
        <td class="text-right"><?php echo $voucher['amount']; ?></td>
    </tr>
    <?php } ?>
    </tbody>
    <tfoot>
    <?php foreach ($totals as $total) { ?>
    <tr>
        <td colspan="4" class="text-right  hidden-xs"><strong><?php echo $total['title']; ?>:</strong></td>
        <td colspan="1" class="text-right  visible-xs"><strong><?php echo $total['title']; ?>:</strong></td>
        <td class="text-right"><?php echo $total['text']; ?></td>
    </tr>
    <?php } ?>
    </tfoot>
</table>
