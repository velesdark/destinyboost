<?php echo $header; ?>
<div class="main_content m_row">

    <?php if ($categories) { ?>
    <div class="content m_row row780">
        <div class="main_cat_title">Choose your boost</div>
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
        <div class="cats">
            <?php foreach ($categories as $cat) { ?>
            <div class="cat_block">
                <div class="cat_block_in">
                    <a class="cat_link_all" href="<?php echo $cat['href']; ?>">
                        <div class="cat_block_img">
                            <img src="/image/<?php echo $cat['image']; ?>"/>
                        </div>
                        <div class="cat_block_title">
                            <?php print_R($cat['name']); ?>
                        </div>
                        <div class="cat_block_desc">
                            <?php echo html_entity_decode($cat['description'],ENT_HTML5); ?>
                        </div>
                    </a>
                    <a class="cat_link" href="<?php echo $cat['href']; ?>">order now</a>
                </div>
            </div>
            <?php } ?>
        </div>
        <div class="clear"></div>

    </div>
    <?php } ?>
    <?php if ($products) { ?>
    <div class="content m_row">
        <div class="main_cat_title"><?php echo $heading_title; ?></div>
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


        <div class="products">
            <?php foreach ($products as $product) { ?>
            <div class="product_block">
                <div class="product_block_in">
                    <a href="<?php echo $product['href']; ?>" class="all_link"></a>
                    <div class="product_block_img">
                        <img src="/image/<?php echo $product['full_img']; ?>"/>
                    </div>
                    <div class="product_block_title">
                        <?php echo $product['name']; ?>
                    </div>
                    <div class="product_block_desc">
                        <?php echo $product['description']; ?>
                    </div>
                    <div class="product_block_price">
                        <?php echo $product['price']; ?>
                    </div>
                    <div class="product_block_btn_cart">
                        <button type="button"
                                onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
                            Add to cart(<?php echo $product['price']; ?>)
                        </button>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
        <div class="clear"></div>
        <div class="pag"><?php echo $pagination; ?></div>
        <div class="clear"></div>
    </div>
    <?php } ?>


    <div class="clear"></div>
</div>
<?php echo $footer; ?>