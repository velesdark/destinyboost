<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a onclick="$('#form').submit();" class="btn btn-primary" title="<?php echo $button_save; ?>"><i
                            class="fa fa-save"></i></a>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                   class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>

    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                    <?php echo $help_instructions; ?>
                    <h2><?php echo $text_settings; ?></h2>
                    <table class="form">
                        <tbody>
                        <tr>
                            <td><?php echo $text_price; ?></td>
                            <td>
                                <select name="related_options[price_adjustment_on]">
                                    <?php if ($module_data['price_adjustment_on']) { ?>
                                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                    <option value="0"><?php echo $text_no; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_yes; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                            <td><span class="help"><?php echo $help_price; ?></span></td>
                        </tr>
                        <tr id="animate_price"
                        <?php echo ($module_data['price_adjustment_on']) ? '' : 'style="display: none;"'; ?>>
                        <td><?php echo $text_animate_price; ?></td>
                        <td>
                            <select name="related_options[animate_price]">
                                <?php if ($module_data['animate_price']) { ?>
                                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                <option value="0"><?php echo $text_no; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_yes; ?></option>
                                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td></td>
                        </tr>
                        <tr>
                            <td><?php echo $text_residue; ?></td>
                            <td>
                                <select name="related_options[residue_on]">
                                    <?php if ($module_data['residue_on']) { ?>
                                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                    <option value="0"><?php echo $text_no; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_yes; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr id="show_disabled"
                        <?php echo ($module_data['residue_on']) ? '' : 'style="display: none;"'; ?>>
                        <td><?php echo $text_show_disabled; ?></td>
                        <td>
                            <select name="related_options[show_disabled]">
                                <?php if ($module_data['show_disabled']) { ?>
                                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                <option value="0"><?php echo $text_no; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_yes; ?></option>
                                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td></td>
                        </tr>
                        <tr>
                            <td><?php echo $decimal_places; ?></td>
                            <td>
                                <input type="text" name="related_options[price_residue]"
                                       value="<?php echo $module_data['price_residue'] ?>"/>
                            </td>
                            <td><span class="help"><?php echo $help_decimal_places; ?></span></td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>

    </div>
</div>
<script>
    $('select[name="related_options[price_adjustment_on]"]').on('change', function () {
        if ($(this).val() == 1) {
            $('#animate_price').show()
        } else {
            $('#animate_price').hide()
        }
    });
    $('select[name="related_options[residue_on]"]').on('change', function () {
        if ($(this).val() == 1) {
            $('#show_disabled').show()
        } else {
            $('#show_disabled').hide()
        }
    });
</script>
<style>
    .htabs {
        padding: 0px 0px 0px 10px;
        height: 41px;
        line-height: 16px;
        border-bottom: 1px solid #DDDDDD;
        margin-bottom: 15px;
    }

    .htabs a {
        border-top: 1px solid #DDDDDD;
        border-left: 1px solid #DDDDDD;
        border-right: 1px solid #DDDDDD;
        background: #FFFFFF url('../image/tab.png') repeat-x;
        padding: 7px 15px 6px 15px;
        float: left;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 13px;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
        color: #000000;
        margin-right: 2px;
        display: none;
    }

    .htabs a.selected {
        border-top: 1px solid #DDDDDD;
        border-left: 1px solid #DDDDDD;
        border-right: 1px solid #DDDDDD;
        border-bottom: 0px solid #DDDDDD;
        font-weight: bold;
        color: #333;
        padding-bottom: 12px;
    }

    .vtabs {
        padding: 10px 0px;
        min-height: 40px;
        display: block;
        border-bottom: 1px solid #DDDDDD;
        padding-top: 0px;
    }

    .vtabs a {
        display: none;
    }

    .vtabs a, .vtabs span {
        display: block;
        float: left;
        width: 160px;
        clear: both;
        border-top: 1px solid #DDDDDD;
        border-left: 1px solid #DDDDDD;
        border-right: 1px solid #DDDDDD;
        background: #F7F7F7;
        padding: 6px 14px 7px 15px;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 13px;
        font-weight: bold;
        text-align: right;
        text-decoration: none;
        color: #000000;
    }

    .vtabs a.selected {
        padding-right: 15px;
        background: #FFFFFF;

    }

    .vtabs a {
        text-align: center;
        height: 40px;
    }

    .vtabs a img, .vtabs span img {
        position: relative;
        top: 3px;
        cursor: pointer;
    }

    .vtabs-content {
        margin-left: 20px;
        margin-top: 30px;
    }

    table.form {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    table.form > tbody > tr > td:first-child {
        width: 200px;
    }

    table.form > tbody > tr > td {
        padding: 10px;
        color: #000000;
        border-bottom: 1px dotted #CCCCCC;
    }

    .scrollbox {
        border: 1px solid #CCCCCC;
        width: 350px;
        height: 100px;
        background: #FFFFFF;
        overflow-y: scroll;
    }

    .scrollbox img {
        float: right;
        cursor: pointer;
    }

    nav.nav-tabs > li > a {
        border-bottom: 1px solid #DDDDDD;
    }

    .nav-tabs {
        border-bottom: 0px solid #dddddd;
    }

    .help {
        color: #666;
        font-size: 11px;
        font-weight: normal;
        font-family: Verdana, Geneva, sans-serif;
        display: block;
    }
</style>
<?php echo $footer; ?>