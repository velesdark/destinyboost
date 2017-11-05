<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <div class="dropdown" style="display: inline-block;">

                    <button class="btn btn-primary dropdown-toggle" type="button" id="edit-module"
                            title="<?php echo $text_setting_form; ?>" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="true">
                        <i class="fa fa-cogs"></i>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="edit-module">
                        <?php if (isset($feedback_module_options)) { ?>
                        <?php foreach ($feedback_module_options as $module_edit) { ?>
                        <li>
                            <a href="<?php echo $module_edit['module_url']; ?>"><?php echo $module_edit['module_name']; ?></a>
                        </li>
                        <?php }
              /*echo "<pre>";
                        var_dump($feedback_module_options);
                        echo "</pre>";*/
                        ?>
                        <?php } else { ?>
                        <li class="text-danger"><?php echo $error_nomodule; ?></li>
                        <?php } ?>
                    </ul>

                </div>
                <a href="<?php echo $add_module; ?>" form="form-account" data-toggle="tooltip"
                   title="<?php echo $button_create_form; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                   class="btn btn-default"><i class="fa fa-reply"></i></a>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger"
                        onclick="confirm('<?php echo $button_text_confirm; ?>') ? $('#form-list').submit() : false;"><i
                            class="fa fa-trash-o"></i></button>
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
                <h3 class="panel-title"><i class="fa fa-list-ol"></i> <?php echo $text_feedback_list; ?></h3>
            </div>
            <div class="panel-body">
                <div class="well">
                    <div class="row">
                        <!-- Селект фильтр по имени формы -->
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="control-label"
                                       for="input-name"><?php echo $text_filter_name_form; ?></label>
                                <?php
                     /*echo '<pre>';
                                var_dump($filter_name);
                                echo '</pre>';*/
                                ?>
                                <select class="form-control" name="filter_name">
                                    <option value=""><?php echo $text_filter_all_form; ?></option>
                                    <?php foreach ($module_names as $feedback_name) { ?>
                                    <?php if ($filter_name == $feedback_name['module_name']){ ?>
                                    <option value="<?php echo $feedback_name['module_name'] ?>"
                                            selected="selected"><?php echo $feedback_name['module_name'] ?></option>
                                    <?php } else { ?>
                                    <option value="<?php echo $feedback_name['module_name'] ?>"><?php echo $feedback_name['module_name'] ?></option>
                                    <?php } ?>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <!-- Поиск по тексту форм -->
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="control-label"
                                       for="input-name"><?php echo $text_filter_text_form; ?></label>
                                <input type="text" name="filter_text" value="<?php echo $filter_text; ?>"
                                       placeholder="<?php echo $text_entry_text; ?>" id="input-name"
                                       class="form-control" autocomplete="off">
                                <ul class="dropdown-menu"></ul>
                            </div>
                        </div>
                        <!-- Фильтр по статусу -->
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label class="control-label"
                                       for="filter_noread"><?php echo $text_filter_status; ?></label>
                                <select name="filter_noread" class="form-control">
                                    <?php if ($filter_noread == 'noread') { ?>
                                    <option value=""><?php echo $text_filter_allstatus; ?></option>
                                    <option value="noread"
                                            selected="selected"><?php echo $text_status_noread; ?></option>
                                    <option value="read"><?php echo $text_status_read; ?></option>
                                    <?php } elseif ($filter_noread == 'read') { ?>
                                    <option value=""><?php echo $text_filter_allstatus; ?></option>
                                    <option value="noread"><?php echo $text_status_noread; ?></option>
                                    <option value="read" selected="selected"><?php echo $text_status_read; ?></option>
                                    <?php } else { ?>
                                    <option value="" selected="selected"><?php echo $text_filter_allstatus; ?></option>
                                    <option value="noread"><?php echo $text_status_noread; ?></option>
                                    <option value="read"><?php echo $text_status_read; ?></option>
                                    <?php } ?>
                                </select>

                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <button type="button" id="button-filter" class="btn btn-primary pull-right"><i
                                            class="fa fa-search"></i><?php echo $button_filter; ?></button>
                            </div>
                        </div>
                    </div>
                </div>
                <form role="form" action="<?php echo $deleteFeedback; ?>" method="post" enctype="multipart/form-data"
                      id="form-list" class="form-horizontal">
                    <!--    Лист список фидбеков -->
                    <div>
                        <?php if (isset($feedbacks)) { ?>
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <td style="width: 1px;" class="text-center"><input type="checkbox"
                                                                                   onclick="$('input[name*=\'selected\']').prop('checked', this.checked);">
                                </td>
                                <td style="width: 1px;" class="text-center"><?php if ($sort == 'fedback_id') { ?>
                                    <a href="<?php echo $sort_id; ?>" class="<?php echo strtolower($order); ?>">ID</a>
                                    <?php } else { ?>
                                    <a href="<?php echo $sort_id; ?>">ID</a>
                                    <?php } ?>
                                </td>
                                <td><?php if ($sort == 'date') { ?>
                                    <a href="<?php echo $sort_date; ?>"
                                       class="<?php echo strtolower($order); ?>"><?php echo $text_date; ?></a>
                                    <?php } else { ?>
                                    <a href="<?php echo $sort_date; ?>"><?php echo $text_date; ?></a>
                                    <?php } ?>
                                </td>
                                <td><?php if ($sort == 'module_name') { ?>
                                    <a href="<?php echo $sort_name; ?>"
                                       class="<?php echo strtolower($order); ?>"><?php echo $text_name_form; ?></a>
                                    <?php } else { ?>
                                    <a href="<?php echo $sort_name; ?>"><?php echo $text_name_form; ?></a>
                                    <?php } ?>
                                </td>
                                <td><?php echo $text_page_send; ?></td>
                                <td><?php echo $entry_status; ?></td>
                                <td>Полная информация</td>
                                </thead>
                                <tbody>
                                <?php foreach ($feedbacks as $feedback) { ?>
                                <tr>
                                    <td><input type="checkbox" name="selected[]"
                                               value="<?php echo $feedback['fedback_id'] ?>"></td>
                                    <td><?php echo $feedback['fedback_id'] ?></td>
                                    <td><?php echo $feedback['date'] ?></td>
                                    <td><?php echo $feedback['module_name'] ?></td>
                                    <td><a href="<?php echo $feedback['page_link'] ?>"
                                           target="_blank"><?php echo $text_page_link; ?></a></td>
                                    <td><?php echo $feedback['status'] ?></td>
                                    <td>
                                        <?php if ($feedback['status'] == $text_status_noread) { ?>
                                        <button type="button" class="btn btn-warning" data-toggle="modal"
                                                title="<?php echo $text_more; ?>"
                                                data-target="#feedbackMore_<?php echo $feedback['fedback_id'] ?>">
                                            <i class="fa fa-eye"></i>
                                        </button>
                                        <?php } else { ?>
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                title="<?php echo $text_more; ?>"
                                                data-target="#feedbackMore_<?php echo $feedback['fedback_id'] ?>">
                                            <i class="fa fa-eye"></i>
                                        </button>
                                        <?php } ?>
                                    </td>

                                </tr>

                                <?php } ?>
                                </tbody>
                            </table>
                        </div>
                        <?php } else { ?>
                        <h2><?php echo $text_nomassage; ?></h2>
                        <?php } ?>
                    </div>


                </form>
                <?php if (isset($feedbacks)) { ?>
                <?php foreach ($feedbacks as $feedback) { ?>
                <!-- Modal -->

                <div class="modal fade" id="feedbackMore_<?php echo $feedback['fedback_id'] ?>" tabindex="-1"
                     role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title"
                                    id="feedbackMoreLabel"><?php echo $feedback['module_name'] ?></h4>
                                <h5 class="modal-title"><?php echo $text_massage_number; ?><?php echo $feedback['fedback_id'] ?></h5>
                            </div>
                            <div class="modal-body">

                                <form role="form" action="<?php echo $saveFeedback; ?>" method="post"
                                      enctype="multipart/form-data"
                                      id="form-feedback<?php echo $feedback['fedback_id'] ?>" class="form-horizontal">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered">
                                            <thead>
                                            <td><?php echo $text_popup_value; ?></td>
                                            <td><?php echo $text_popup_data; ?></td>
                                            </thead>
                                            <tbody>
                                            <?php if ($feedback['feedback_array']) {
                                 foreach ($feedback['feedback_array'] as $field_values) { ?>
                                            <tr>
                                                <?php foreach ($field_values as $field_name => $field_value) { ?>
                                                <?php if ($field_name != 'required'){ ?>
                                                <td> <?php echo $field_name; ?></td>
                                                <td> <?php echo $field_value; ?> </td>
                                                <?php } ?>
                                                <?php } ?>
                                            </tr>

                                            <?php } ?>
                                            <?php  } ?>
                                            <tr>
                                                <td><?php echo $text_popup_date ?></td>
                                                <td><?php echo $feedback['date'] ?></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $text_page_send; ?></td>
                                                <td><a href="<?php echo $feedback['page_link'] ?>"
                                                       target="_blank"><?php echo $text_page_link; ?></a></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $entry_status; ?></td>
                                                <td>
                                                    <select name="feedback_status" class="form-control">
                                                        <?php if ($feedback['status'] == $text_status_noread) { ?>
                                                        <option value="noread"
                                                                selected="selected"><?php echo $text_status_noread; ?></option>
                                                        <option value="read"><?php echo $text_status_read; ?></option>
                                                        <?php } else { ?>
                                                        <option value="noread"><?php echo $text_status_noread; ?></option>
                                                        <option value="read"
                                                                selected="selected"><?php echo $text_status_read; ?></option>
                                                        <?php } ?>
                                                    </select>
                                                    <input type="hidden" name="feedback_id"
                                                           value="<?php echo $feedback['fedback_id'] ?>"/>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal"><?php echo $text_popup_close; ?></button>
                                <button type="button"
                                        onclick="$('#form-feedback<?php echo $feedback['fedback_id'] ?>').submit();"
                                        class="btn btn-primary"><?php echo $button_save; ?></button>

                            </div>
                        </div>
                    </div>
                </div>

                <?php } ?>
                <?php } ?>
                <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript"><
    !--
        $('#button-filter').on('click', function () {
            var url = 'index.php?route=extension/module/sobfeedback/getlist&token=<?php echo $token; ?>';

            var filter_name = $('select[name=\'filter_name\']').val();

            if (filter_name) {
                url += '&filter_name=' + encodeURIComponent(filter_name);
            }
            var filter_text = $('input[name=\'filter_text\']').val();

            if (filter_text) {
                url += '&filter_text=' + encodeURIComponent(filter_text);
            }
            var filter_noread = $('select[name=\'filter_noread\']').val();

            if (filter_noread) {
                url += '&filter_noread=' + encodeURIComponent(filter_noread);
            }

            location = url;
        });
</script>
<?php echo $footer; ?>