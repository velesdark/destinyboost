<div class="panel panel-default">
    <div id="collapse-coupon" class="panel-collapse collapse">
        <div class="panel-body">

            <div class="input-group">
                <input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="PromoDestuny"
                       id="input-coupon" class="form-control"/>
                <span class="input-group-btn">
        <!--<input type="button" value="<?php // echo $button_coupon; ?>" id="button-coupon" data-loading-text="<?php // echo $text_loading; ?>"  class="btn btn-primary" />-->
        </span></div>
            <script type="text/javascript"><!--
                $('[name="coupon"]').on('keyup', function () {
                    $.ajax({
                        url: 'index.php?route=extension/total/coupon/coupon',
                        type: 'post',
                        data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
                        dataType: 'json',
                        beforeSend: function () {
                            $('#button-coupon').button('loading');
                        },
                        complete: function () {
                            $('#button-coupon').button('reset');
                        },
                        success: function (json) {
                            $('.alert').remove();

                            if (json['error']) {
                                $('[name="coupon"]').addClass('error');
                                //$('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                                //$('html, body').animate({ scrollTop: 0 }, 'slow');
                            }
                            else {
                                $('[name="coupon"]').removeClass('error');
                                $('[name="coupon"]').addClass('ok');
                                window.location.reload();
                            }

                            if (json['redirect']) {
                                //location = json['redirect'];
                            }
                        }
                    });
                });
                //--></script>
        </div>
    </div>
</div>
