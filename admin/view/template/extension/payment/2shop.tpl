<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid heading">
            <div class="pull-right">
                <?php if ($permission) { ?>
                <button type="submit" form="form-shoputils-ik" id="button_save" class="btn btn-primary"><i
                            class="fa fa-save"></i> <?php echo $button_save; ?></button>
                <?php } ?>
                <a href="<?php echo $cancel; ?>" class="btn btn-default"><i
                            class="fa fa-reply"></i> <?php echo $button_cancel; ?></a></div>
            <h1><img src="view/image/payment/shoputils_ik23x30.gif"> <?php echo $heading_title; ?></h1>

        </div>
    </div>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-2shop"
          class="form-horizontal">
        <div class="tab-content">
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php //echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="test" value="<?php echo $test; ?>"
                           placeholder="<?php //echo $entry_sort_order; ?>" id="input-test" class="form-control"/>
                </div>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript"><!--
    $(document).delegate('#button-clear', 'click', function () {
        if (confirm('<?php echo $text_confirm; ?>')) {
            $.ajax({
                url: '<?php echo $clear_log; ?>',
                type: 'post',
                dataType: 'json',
                beforeSend: function () {
                    $('#button-clear').after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
                },
                complete: function () {
                    $('.loading').remove();
                },
                success: function (json) {
                    $('.alert-success, .alert-danger').remove();

                    if (json['error']) {
                        $('#content > .container-fluid').before('<div class="alert alert-danger" style="display: none;"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                        $('.alert-danger').fadeIn('slow');
                    }

                    if (json['success']) {
                        $('#content > .container-fluid').before('<div class="alert alert-success" style="display: none;"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                        $('#pre-log').empty();
                        $('.alert-success').fadeIn('slow');
                    }

                    $('html, body').animate({scrollTop: 0}, 'slow');
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        }
    });
    //--></script>
<?php echo $footer; ?>
