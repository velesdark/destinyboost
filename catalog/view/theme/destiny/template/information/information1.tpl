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

    <div class="info_body">
        <div class="main_cat_title contact_title"><?php echo $heading_title; ?></div>

        <?php echo $description; ?>


        <div class="contact_form">
            <?php echo $content_bottom; ?>
        </div>


    </div>
</div>
<?php echo $footer; ?>