<?php
  $path = "common/home";
  $url = $_SERVER['REQUEST_URI'];
  if ($url == "/" or strripos($url, $path)) {
    $is_home = TRUE;
  }else{
    $is_home = false;
  }   
?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, user-scalable=yes"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title;  ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <meta property="og:title" content="<?php echo $title; ?>"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="<?php echo $og_url; ?>"/>

    <meta property="og:site_name" content="<?php echo $name; ?>"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&amp;subset=cyrillic"
          rel="stylesheet">
    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <!--<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />-->
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="/catalog/view/theme/destiny/stylesheet/jquery.formstyler.css" rel="stylesheet">
    <link href="/catalog/view/theme/destiny/stylesheet/template.css" rel="stylesheet">
    <link href="/catalog/view/theme/destiny/stylesheet/media.css" rel="stylesheet">
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/jquery.formstyler.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/template.js" type="text/javascript"></script>


    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
          media="<?php echo $style['media']; ?>"/>
    <?php } ?>
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>

</head>
<body>


<div class="main_header">
    <?php

global $cur; 
$cur= $currency;

?>
    <div class="header m_row">
        <div class="logo">
            <a href="/"><img src="/catalog/view/theme/destiny/images/logo.png"/></a>
        </div>
        <div class="main_menu">
            <?php // wp_nav_menu( array( 'theme_location' => 'main_menu' ) ); ?>
            <div>
                <ul>
                    <?php
						foreach($headermenu as $menu)
						{ ?>
                    <li>
                        <a href="<?php echo $menu['link']; ?>"><?php echo $menu['title']; ?></a>
                    </li>
                    <? }
					?>
                </ul>
            </div>
        </div>
        <div class="header_cart">
            <?php echo $cart; ?>
        </div>
        <div class="header_contact">
            <div class="header_mail">
                <a href="mailto:mail@destinyboost.pro">mail@destinyboost.pro</a>
            </div>
            <div class="header_skype">
                live:support_41115
            </div>

        </div>
    </div>

    <div class="clear"></div>
</div>
<div class="clear"></div>
