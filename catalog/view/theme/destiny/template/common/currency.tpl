<?php if (count($currencies) > 1) { ?>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">
    <?php foreach ($currencies as $currency) {
	  if($currency['code']==$code)
		  $class="active";
	  else
		  $class="";
	  ?>
    <button class="currency-select btn btn-link btn-block btn_cur <?php echo $currency['code']; ?> <?php echo $class?>"
            type="button"
            name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_right']; ?> <?php echo $currency['title']; ?></button>
    <?php } ?>

    <input type="hidden" name="code" value=""/>
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>"/>
</form>

<?php } ?>
