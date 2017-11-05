<div class="content m_row row780">
    <div class="main_cat_title">Choose your boost</div>
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
</div>