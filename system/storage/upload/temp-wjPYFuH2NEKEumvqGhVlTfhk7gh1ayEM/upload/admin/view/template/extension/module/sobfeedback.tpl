<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">

                <a href="<?php echo $feedback_list; ?>" data-toggle="tooltip" title="<?php echo $button_list; ?>"
                   class="btn btn-primary">
                    <i class="fa fa-list-ol"></i> </a>
                <button type="submit" form="form-account" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                        class="btn btn-primary">
                    <i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                   class="btn btn-default">
                    <i class="fa fa-reply"></i> </a>


            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">

                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-sobfeedback"
                      class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-name"><?php echo $text_module_name; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="name" value="<?php echo $name; ?>"
                                   placeholder="<?php echo $text_module_name; ?>" id="input-name" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-name"><?php echo $text_form_name; ?></label>
                        <?php if ($form_name){ ?>
                        <?php foreach ($languages as $language) { ?>
                        <div class="input-group col-sm-3 pull-left">
                            <span class="input-group-addon"><img
                                        src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"></span>
                            <input type="text" name="form_name[<?php echo $language['language_id'] ?>]"
                                   value="<?php echo $form_name[$language['language_id']]; ?>" class="form-control"
                                   required/>
                        </div>

                        <?php } ?>
                        <?php } else { ?>
                        <?php foreach ($languages as $language) { ?>
                        <div class="input-group col-sm-3 pull-left">
                            <span class="input-group-addon"><img
                                        src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"></span>
                            <input type="text" name="form_name[<?php echo $language['language_id'] ?>]" value=""
                                   class="form-control" required/>
                        </div>
                        <?php } ?>
                        <?php } ?>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                            <select name="status" id="input-status" class="form-control">
                                <?php if ($status) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                        <div class="col-sm-10">
                            <?php if ($sobfeedback_email) { ?>
                            <input type="email" name="sobfeedback_email" value="<?php echo $sobfeedback_email ?>"
                                   class="form-control"/>
                            <?php } else { ?>
                            <input type="email" name="sobfeedback_email" class="form-control"
                                   placeholder="<?php echo $placeholder_email; ?>"/>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-name"><?php echo $text_form_success; ?></label>
                        <?php if ($form_success){ ?>
                        <?php foreach ($languages as $language) { ?>
                        <div class="input-group col-sm-3 pull-left">
                            <span class="input-group-addon"><img
                                        src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"></span>
                            <input type="text" name="form_success[<?php echo $language['language_id'] ?>]"
                                   value="<?php echo $form_success[$language['language_id']]; ?>" class="form-control"
                                   required/>
                        </div>

                        <?php } ?>
                        <?php } else { ?>
                        <?php foreach ($languages as $language) { ?>
                        <div class="input-group col-sm-3 pull-left">
                            <span class="input-group-addon"><img
                                        src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"></span>
                            <input type="text" name="form_success[<?php echo $language['language_id'] ?>]" value=""
                                   class="form-control" required/>
                        </div>
                        <?php } ?>
                        <?php } ?>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="input-module-modal"><?php echo $text_modal; ?></label>
                        <div class="col-sm-10 modal-fom">
                            <?php if ($sobfeedback_modal) { ?>
                            <input type="checkbox" name="sobfeedback_modal" value="on" checked="checked"
                                   class="form-control"/>
                            <div class="modal-info alert pull-left col-sm-3 alert-success">
                                <label class="col-sm-12 control-label"
                                       for="input-email"><?php echo $table_fiald_name; ?></label>
                                <?php foreach ($languages as $language) { ?>
                                <div class="input-group col-sm-12">
                                    <span class="input-group-addon"><img
                                                src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"></span>
                                    <input type="text" name="modal_button[<?php echo $language['language_id'] ?>]"
                                           value="<?php echo $modal_button[$language['language_id']]; ?>"
                                           class="form-control"/>
                                </div>
                                <?php } ?>
                            </div>
                            <?php } else { ?>
                            <input type="checkbox" name="sobfeedback_modal" class="form-control"/>
                            <div class="modal-info alert pull-left col-sm-3 alert-success hidden">
                                <label class="col-sm-12 control-label"
                                       for="input-email"><?php echo $table_fiald_name; ?></label>
                                <?php foreach ($languages as $language) { ?>
                                <div class="input-group col-sm-12">
                                    <span class="input-group-addon"><img
                                                src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"></span>
                                    <input type="text" placeholder="<?php echo $table_fiald_name; ?>"
                                           name="modal_button[<?php echo $language['language_id'] ?>]" value=""
                                           class="form-control"/>
                                </div>
                                <?php } ?>
                            </div>
                            <?php } ?>

                        </div>
                    </div>
                    <?php if ($module_id) { ?>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="input-custom_position"><?php echo $text_anyplace; ?></label>
                        <div class="col-sm-10 anyplace">
                            <?php if ($custom_position) { ?>
                            <input type="checkbox" name="custom_position" value="on" checked="checked"
                                   class="form-control pull-left"/>
                            <?php } else { ?>
                            <input type="checkbox" name="custom_position" class="form-control pull-left"/>
                            <?php } ?>
                            <div class="anyplace-info alert pull-left alert-success hidden">
                                <p><?php echo $text_paste_controller; ?> <br>
                                    <code>
                                        $sobfeedback = new sobfeedback($this->registry);
                                        $data['sobfeedback_id<?php echo $module_id; ?>'] =
                                        $sobfeedback->initFeedback(<?php echo $module_id; ?>);<br>
                                    </code>
                                </p>
                                <p><?php echo $text_paste_temlate; ?> <code> echo
                                        $sobfeedback_id<?php echo $module_id; ?>;</code></p>
                            </div>
                        </div>
                    </div>
                    <?php } else { ?>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="input-custom_position"><?php echo $text_anyplace; ?></label>
                        <div class="col-sm-10 anyplace">
                            <input type="checkbox" name="custom_position" disabled="disabled"
                                   class="form-control pull-left"/>
                            <div class="alert pull-left alert-success">
                                <p><?php echo $error_anyplace; ?></p>
                            </div>
                        </div>
                    </div>
                    <?php } ?>


                    <!-- добавление доп поля -->
                    <table id="field" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <td style="width: 25%;"><?php echo $table_fiald_name; ?></td>
                            <td><?php echo $table_fiald_type; ?></td>
                            <td style="width:10%"><?php echo $table_fiald_status; ?></td>
                            <td style="width:10%"><?php echo $table_fiald_required; ?></td>
                            <td style="width:1px"></td>
                        </tr>
                        </thead>
                        <tbody>

                        <?php $field_row = 0; ?>
                        <?php if (!empty($fields)) { ?>
                        <?php foreach ($fields as $field) { ?>

                        <tr id="field-row<?php echo $field_row; ?>">
                            <td class="text-left">
                                <?php foreach ($languages as $language) { ?>
                                <div class="input-group"><span class="input-group-addon"><img
                                                src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"></span>
                                    <input type="text"
                                           name="sobfeedback_field[<?php echo $field_row; ?>][name][<?php echo $language['language_id']; ?>]; ?>"
                                           value="<?php echo isset($field['name'][$language['language_id']]) ? $field['name'][$language['language_id']] : ''; ?>"
                                           placeholder="<?php echo $table_fiald_name; ?>" class="form-control"/>
                                </div>
                                <?php } ?>
                            </td>
                            <td class="text-left">
                                <div class="input-group select-type<?php echo $field_row; ?>"><span
                                            class="input-group-addon"><?php echo $table_fiald_type; ?></span>
                                    <select name="sobfeedback_field[<?php echo $field_row; ?>][type]; ?>"
                                            data-row="<?php echo $field_row; ?>" onchange="initField($(this));"
                                            class="form-control field-type">
                                        <?php if($field['type']=='input'){ ?>
                                        <option value="input" selected="selected">input</option>
                                        <?php } else { ?>
                                        <option value="input">input</option>
                                        <?php } ?>
                                        <?php if($field['type']=='textarea'){ ?>
                                        <option value="textarea" selected="selected">textarea</option>
                                        <?php } else { ?>
                                        <option value="textarea">textarea</option>
                                        <?php } ?>
                                        <?php if($field['type']=='select'){ ?>
                                        <option value="select" selected="selected">select</option>
                                        <?php } else { ?>
                                        <option value="select">select</option>
                                        <?php } ?>
                                        <?php if($field['type']=='radio'){ ?>
                                        <option value="radio" selected="selected">radio</option>
                                        <?php } else { ?>
                                        <option value="radio">radio</option>
                                        <?php } ?>
                                        <?php if($field['type']=='checkbox'){ ?>
                                        <option value="checkbox" selected="selected">checkbox</option>
                                        <?php } else { ?>
                                        <option value="checkbox">checkbox</option>
                                        <?php } ?>
                                        <?php if($field['type']=='date'){ ?>
                                        <option value="date" selected="selected">date</option>
                                        <?php } else { ?>
                                        <option value="date">date</option>
                                        <?php } ?>
                                    </select>
                                    <?php foreach ($languages as $language) { ?>
                                    <?php if (isset($field['option'])) { ?>
                                    <?php if(empty($field['option'])) { ?>
                                    <div class="input-group" style="width: 100%;">
                                        <span class="input-group-addon"><img
                                                    src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"></span>
                                        <input type="text"
                                               name="sobfeedback_field[<?php echo $field_row; ?>][option][<?php echo $language['language_id'] ?>]"
                                               class="form-control option<?php echo $field_row; ?>"
                                               placeholder="<?php echo $table_placeholder_option; ?>"/>
                                    </div>

                                    <?php } else { ?>
                                    <div class="input-group" style="width: 100%;">
                                        <span class="input-group-addon"><img
                                                    src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"></span>
                                        <input type="text"
                                               name="sobfeedback_field[<?php echo $field_row; ?>][option][<?php echo $language['language_id']; ?>]"
                                               value="<?php echo $field['option'][$language['language_id']] ?>"
                                               class="form-control option<?php echo $field_row; ?>"/>
                                    </div>
                                    <?php } ?>
                                    <?php } ?>
                                    <?php } ?>
                                </div>
                            </td>
                            <td class="text-center">
                                <div>

                                    <?php if (isset($field['field_status'])) { ?>
                                    <input type="checkbox"
                                           name="sobfeedback_field[<?php echo $field_row; ?>][field_status]"
                                           checked="checked" class="form-control"/>
                                    <?php } else { ?>
                                    <input type="checkbox"
                                           name="sobfeedback_field[<?php echo $field_row; ?>][field_status]"
                                           class="form-control"/>
                                    <?php } ?>
                                </div>
                            </td>
                            <td>
                                <?php if (isset($field['required'])) { ?>
                                <input type="checkbox" name="sobfeedback_field[<?php echo $field_row; ?>][required]"
                                       checked="checked" class="form-control"/>
                                <?php } else { ?>
                                <input type="checkbox" name="sobfeedback_field[<?php echo $field_row; ?>][required]"
                                       class="form-control"/>
                                <?php } ?>
                            </td>
                            <td class="text-left">
                                <button type="button" onclick="$('#field-row<?php echo $field_row; ?>').remove();"
                                        data-toggle="tooltip" title="<?php echo $button_delete; ?>"
                                        class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                            </td>
                        </tr>
                        <?php $field_row++; ?>
                        <?php } ?>
                        <?php } ?>

                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="4"></td>
                            <td class="text-left"><a onclick="addfieldRow();" data-toggle="tooltip"
                                                     title="<?php echo $button_add; ?>" class="btn btn-primary"><i
                                            class="fa fa-plus-circle"></i></a></td>
                        </tr>
                        </tfoot>
                    </table>
                    <!-- добавление доп поля -->
                </form>


            </div>
        </div>
    </div>
    <!-- Инструкция в любом месте -->
    <script type="text/javascript">
        $(document).ready(function () {
            //anyplace
            if ($('.anyplace input:checked').length) {
                $('.anyplace .anyplace-info').removeClass('hidden');
                //console.log($(this).length);
            }

            $('.anyplace input').change(function () {
                if ($('.anyplace input:checked').length) {
                    $('.anyplace .anyplace-info').removeClass('hidden');
                    //console.log($(this).length);
                } else {
                    $('.anyplace .anyplace-info').addClass('hidden');
                }

            });
            //anyplace end
            //modal_form
            if ($('.modal-fom input:checked').length) {
                $('.modal-fom .anyplace-info').removeClass('hidden');
                //console.log($(this).length);
            }

            $('.modal-fom input').change(function () {
                if ($('.modal-fom input:checked').length) {
                    $('.modal-fom .modal-info').removeClass('hidden');
                    //console.log($(this).length);
                } else {
                    $('.modal-fom .modal-info').addClass('hidden');
                }

            });
            //modal_form end

        });
    </script>
    <!-- //Инструкция в любом месте -->
    <!-- доп поля -->
    <script type="text/javascript"><!--

        function initField(select) {
            var row = $(select).data('row');
            //console.log(row);
            var html = '';
        <
                ? php foreach($languages as $language)
            {
                    ?
            >

                html += '<div class="input-group option' + row + '" style="width: 100%;"><span class="input-group-addon"><img src="language/<?php echo $language['
                code
                ']; ?>/<?php echo $language['
                code
                ']; ?>.png"></span><input type="text" name="sobfeedback_field[' + row + '][option][<?php echo $language['
                language_id
                '] ?>]" class="form-control" placeholder="<?php echo $table_placeholder_option; ?>"/></div>';

            <
                    ? php
            }
                ?
        >
            if ($(select).val() == 'select' || $(select).val() == 'radio' || $(select).val() == 'checkbox') {
                $('.option' + row).remove();
                $(select).after(html);
            } else {
                $('.option' + row).remove();
            }
        }


        var field_row =
        <
            ? php echo
        $field_row;
            ?
        >
        ;


        function addfieldRow() {
            html = '<tr id="field-row' + field_row + '">';
// name  
            html += '<td class="text-right" >';
        <
                ? php foreach($languages as $language)
            {
                    ?
            >
                html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['
                code
                ']; ?>/<?php echo $language['
                code
                ']; ?>.png"></span><input type="text" name="sobfeedback_field[' + field_row + '][name][<?php echo $language['
                language_id
                '] ?>]" value="" placeholder="<?php echo $table_fiald_name; ?>" class="form-control" /></div>';
            <
                    ? php
            }
                ?
        >
            html += '</td>';
// type
            html += '<td class="text-right select-type' + field_row + '">';
            html += '<select name="sobfeedback_field[' + field_row + '][type]" data-row="' + field_row + '" onchange="initField($(this));" class="form-control field-type">';
            html += '<option value="input" selected="selected">input</option>';
            html += '<option value="textarea">textarea</option>';
            html += '<option value="select">select</option>';
            html += '<option value="radio">radio</option>';
            html += '<option value="checkbox">checkbox</option>';
            html += '<option value="date">date</option>';
            html += '</select>';
            html += '</td>';
            //option type
            html += '';

// status
            html += '  <td class="text-center" style="width:10%"><input type="checkbox" name="sobfeedback_field[' + field_row + '][field_status]" value="on" checked="checked" class="form-control" /></td>';
// required
            html += '<td class="text-center"><input type="checkbox" name="sobfeedback_field[' + field_row + '][required]" class="form-control"/></td>'

            html += '  <td class="text-left"><button type="button" onclick="$(\'#field-row' + field_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
            html += '</tr>';


            $('#field tbody').append(html);
            field_row++;


        }


        // добавление
        function addSelect() {


        }


        //--></script>
    <!-- доп поля -->


</div>

<?php echo $footer; ?>