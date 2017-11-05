<div class="simplecheckout-block"
     id="simplecheckout_customer" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $display_error && $has_error ? 'data-error="true"' : '' ?>>
<div class="c_title">
    Bill to
</div>

<?php if ($display_registered) { ?>
<div class="alert alert-success"><?php echo $text_account_created ?></div>
<?php } ?>
<?php if ($display_you_will_registered) { ?>
<div class="you-will-be-registered"><?php echo $text_you_will_be_registered ?></div>
<?php } ?>
<?php foreach ($rows as $row) { ?>

<?php echo $row ?>
<?php } ?>

</div>