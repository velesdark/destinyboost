<?php
  $path = "common/home";
  $url = $_SERVER['REQUEST_URI'];
  if ($url == "/" or strripos($url, $path)) {
    $is_home = TRUE;
  }else{
    $is_home = false;
  }   
?>
<div class="clear"></div>

<div class="clear"></div>
<div class="main_footer">
    <div class="footer m_row">
        <div class="footer_top">
            <div class="f_logo">
                <a href="/"><img src="/catalog/view/theme/destiny/images/logo.png"/></a>
            </div>
            <div class="footer_menu">
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
        </div>
        <div class="clear"></div>
        <div class="footer_middle">
            <div class="footer_middle_left">
                <div class="footer_middle_contacts">
                    <div class="footer_middle_title">
                        Сontact us:
                    </div>
                    <div class="footer_skype">
                        <a href="live:support_41115">live:support_41115</a>
                    </div>
                    <div class="footer_mail">
                        <a href="mailto:mail@destinyboost.pro">mail@destinyboost.pro</a>
                    </div>

                </div>
            </div>
            <div class="footer_middle_right">
                <div class="footer_middle_title">
                    Follow us:
                </div>
                <a href="http://facebook.com" target="_blank"><img src="/images/face.png"/></a>
                <a href="http://twitter.com" target="_blank"><img src="/images/tw.png"/></a>
            </div>

        </div>
        <div class="clear"></div>
        <div class="copy">
            <a href="/index.php?route=information/information&information_id=10"><span
                        class="c_other">Terms of Use.</span></a> © 2017 destinyboost.pro – All Rights Reserved<br/>
            <span>destinyboost.pro is owned and operated by IP Glukhikh Nikita, Russia </span>
        </div>
    </div>
    <div class="clear"></div>
</div>

<div class="over_all"></div>
<div id="thank_form">
    <div class="thank_text">
        asdsadasd was added to you cart!
    </div>
    <div class="form_buttons">
        <a class="btn_white cont_link">Continue shopping</a>
        <a class="btn_blue" href="/index.php?route=checkout/simplecheckout">Show cart</a>
    </div>
    <div class="form_close"></div>
</div>

</body>
</html>
