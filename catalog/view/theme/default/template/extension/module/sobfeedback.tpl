<div class="panel panel-default">
    <div class="panel-heading"><?php echo $module_name; ?></div>
    <div class="panel-body">
        <form role="form" data-toggle="validator" enctype="multipart/form-data"
              id="form-sobfeedback<?php echo $module_id; ?>">
            <?php if (isset($fields)) { ?>
            <?php $field_row = 0; ?>
            <?php foreach ($fields as $field) { ?>
            <?php $field_row ++; ?>
            <?php if ($field['type'] == 'input' && $field['field_status']) { ?>
            <?php if ($field['required']) { ?>
            <div class="form-group required">
                <label class="control-label"
                       for="sob_input[<?php echo $field_row; ?>]"><?php echo $field['name']; ?></label>
                <input type="text" class="form-control"
                       name="sob_input[<?php echo $field_row; ?>][<?php echo $field['name']?>]"
                       id="sobInput[<?php echo $field_row; ?>]" data-minlength="3" required=""
                       placeholder="<?php echo $field['name']; ?>">
                <div class="help-block with-errors"></div>
                <input type="hidden" class="form-control" name="sob_input[<?php echo $field_row; ?>][required]"
                       id="sobInput[<?php echo $field_row; ?>]" value="input">
            </div>
            <?php } else { ?>
            <div class="form-group">
                <label for="sob_input[<?php echo $field_row; ?>]"><?php echo $field['name']; ?></label>
                <input type="text" class="form-control"
                       name="sob_input[<?php echo $field_row; ?>][<?php echo $field['name']; ?>]"
                       id="sobInput[<?php echo $field_row; ?>]" placeholder="<?php echo $field['name']; ?>">
            </div>
            <?php } ?>
            <?php } elseif ($field['type'] == 'textarea' && $field['field_status']) { ?>
            <?php if ($field['required']) { ?>
            <div class="form-group required">
                <label class="control-label" for="sobInputText"><?php echo $field['name']; ?></label>
                <textarea class="form-control"
                          name="sob_input[<?php echo $field_row; ?>][<?php echo $field['name']; ?>]" id="sobInputText"
                          rows="3" data-minlength="5" required=""
                          placeholder="<?php echo $field['name']; ?>"></textarea>
                <div class="help-block with-errors"></div>
                <input type="hidden" class="form-control" name="sob_input[<?php echo $field_row; ?>][required]"
                       id="sobInputText[<?php echo $field_row; ?>]" value="textarea">
            </div>
            <?php } else { ?>
            <div class="form-group">
                <label for="sobInputText"><?php echo $field['name']; ?></label>
                <textarea class="form-control"
                          name="sob_input[<?php echo $field_row; ?>][<?php echo $field['name']; ?>]" id="sobInputText"
                          rows="3" placeholder="<?php echo $field['name']; ?>"></textarea>
            </div>
            <?php } ?>
            <?php } elseif ($field['type'] == 'select' && $field['field_status']) { ?>
            <?php if ($field['required']){ ?>
            <div class="form-group required">
                <label for="sobInputSelect" class="control-label"><?php echo $field['name']; ?></label>
                <select class="form-control" name="sob_input[<?php echo $field_row; ?>][<?php echo $field['name']; ?>]"
                        id="sobInputSelect">
                    <?php for ($i=0; $i < count($field['option']); $i++) { ?>
                    <option><?php echo $field['option'][$i] ?></option>
                    <?php } ?>
                </select>

            </div>
            <?php } else { ?>
            <div class="form-group">
                <label for="sobInputSelect"><?php echo $field['name']; ?></label>
                <select class="form-control" name="sob_input[<?php echo $field_row; ?>][<?php echo $field['name']; ?>]"
                        id="sobInputSelect">
                    <?php for ($i=0; $i < count($field['option']); $i++) { ?>
                    <option><?php echo $field['option'][$i] ?></option>
                    <?php } ?>
                </select>
            </div>
            <?php } ?>
            <?php } elseif ($field['type'] == 'radio' && $field['field_status']) { ?>
            <?php if ($field['required']){ ?>
            <div class="form-group required">
                <label for="sobInputRadio" class="control-label"><?php echo $field['name']; ?></label>
                <div class="radio form-control" id="sobInputRadio">
                    <?php for ($i=0; $i < count($field['option']); $i++) { ?>
                    <label><input required="" type="radio"
                                  name="sob_input[<?php echo $field_row; ?>][<?php echo $field['name']; ?>]"
                                  value="<?php echo $field['option'][$i] ?>"><?php echo $field['option'][$i] ?></label>
                    <?php } ?>
                </div>
                <input type="hidden" class="form-control" name="sob_input[<?php echo $field_row; ?>][required]"
                       id="sobInputRadio[<?php echo $field_row; ?>]" value="radio">
            </div>
            <?php } else { ?>
            <div class="form-group">
                <label for="sobInputRadio"><?php echo $field['name']; ?></label>
                <div class="radio form-control" id="sobInputRadio">
                    <?php for ($i=0; $i < count($field['option']); $i++) { ?>
                    <label><input type="radio"
                                  name="sob_input[<?php echo $field_row; ?>][<?php echo $field['name']; ?>]"
                                  value="<?php echo $field['option'][$i] ?>"><?php echo $field['option'][$i] ?></label>
                    <?php } ?>
                </div>
            </div>
            <?php } ?>
            <?php }  elseif ($field['type'] == 'checkbox' && $field['field_status']) { ?>
            <?php if ($field['required']){ ?>
            <div class="form-group required">
                <label for="sobInputCheckbox" class="control-label"><?php echo $field['name']; ?></label>
                <div class="checkbox form-control" id="sobInputCheckbox">
                    <?php for ($i=0; $i < count($field['option']); $i++) { ?>
                    <label> <input required="" data-fv-choice="true" data-fv-choice-min="1" type="checkbox"
                                   name="sob_input[<?php echo $field_row; ?>][<?php echo $field['name']; ?>]"
                                   value="<?php echo $field['option'][$i] ?>"><?php echo $field['option'][$i] ?></label>
                    <?php } ?>
                </div>
                <div class="help-block with-errors"></div>
                <input type="hidden" class="form-control" name="sob_input[<?php echo $field_row; ?>][required]"
                       id="sobInputCheckbox[<?php echo $field_row; ?>]" value="checkbox">
            </div>
            <?php } else { ?>
            <div class="form-group">
                <label for="sobInputCheckbox"><?php echo $field['name']; ?></label>
                <div class="checkbox form-control" id="sobInputCheckbox">
                    <?php for ($i=0; $i < count($field['option']); $i++) { ?>
                    <label><input type="checkbox"
                                  name="sob_input[<?php echo $field_row; ?>][<?php echo $field['name']; ?>]"
                                  value="<?php echo $field['option'][$i] ?>"><?php echo $field['option'][$i] ?></label>
                    <?php } ?>
                </div>
            </div>
            <?php } ?>
            <?php } elseif ($field['type'] == 'date' && $field['field_status']) { ?>
            <?php if ($field['required']) { ?>
            <div class="form-group required">
                <label class="control-label"
                       for="sob_input<?php echo $field_row; ?>"><?php echo $field['name']; ?></label>
                <input type="text" class="form-control"
                       name="sob_input[<?php echo $field_row; ?>][<?php echo $field['name']?>]"
                       id="sobInput<?php echo $field_row; ?>" data-minlength="3" required=""
                       placeholder="<?php echo $field['name']; ?>">
                <div class="help-block with-errors"></div>
                <input type="hidden" class="form-control" name="sob_input[<?php echo $field_row; ?>][required]"
                       id="sobInput[<?php echo $field_row; ?>]" value="input">
            </div>
            <?php } else { ?>
            <div class="form-group">
                <label for="sob_input<?php echo $field_row; ?>"><?php echo $field['name']; ?></label>
                <input type="text" id="sobInput<?php echo $field_row; ?>" class="form-control"
                       name="sob_input[<?php echo $field_row; ?>][<?php echo $field['name']; ?>]"
                       placeholder="<?php echo $field['name']; ?>">
            </div>
            <?php } ?>
            <script type="text/javascript">
                $(function () {
                    $('#sobInput<?php echo $field_row; ?>').datepicker({
                        language: 'ru',
                    });
                });
            </script>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <div class="hidden-inputs">
                <input type="hidden" name="link_page" value="http://<?php echo $domain; ?>"/>
                <input type="hidden" name="module_name" value="<?php echo $module_name; ?>"/>
                <input type="hidden" name="module_id" value="<?php echo $module_id; ?>"/>
                <input type="hidden" name="form_success" value="<?php echo $form_success; ?>"/>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-success pull-right"><?php echo $button_send; ?> <i
                            class="fa fa-paper-plane-o"></i></button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="catalog/view/javascript/bootstrap/js/validator.js"></script>
<script type="text/javascript">
    $('#form-sobfeedback<?php echo $module_id; ?>').on('submit', function (e) {
        e.preventDefault();
        var that = $(e.target);
        $.ajax({
            url: 'index.php?route=extension/module/sobfeedback/send',
            type: 'post',
            data: $(this).serialize(),
            dataType: 'json',
            success: function (data) {
                if (data['error']) {
                    $('#feedbackModal .text-danger').remove();
                    if (data['error']) {
                        var error = $('<span class="text-danger">' + data['error'] + '</span>');
                        $('#feedbackModal .modal-body').prepend(error);
                    }
                    return;
                }
                $('#feedbackModal .text-danger').remove();
                alertForm({form: that, msg: data['success']});
                that.find('input[type=\'text\']').val('');
                that.find('input[type=\'email\']').val('');
                that.find('textarea').val('');
            },
        });
    });

    function alertForm(alert) {
        var div = $('<div class="text-left alert alert-success" style="display: none;">' + alert.msg + '</div>');
        alert.form.prepend(div);
        div.slideDown(400).delay(4000).slideUp(400, function () {
            alert.form.closest('.modal').modal('hide');
            div.remove();
        });
    }
</script>
