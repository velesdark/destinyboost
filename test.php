<?php

//header('Location: https://secure.gate2shop.com/ppp/purchase.do?currency=EUR&item_name_1=PLACEMENT+MATCHES+%7C+Matches%3A+1&item_number_1=1&item_quantity_1=1&item_amount_1=4.00&numberofitems=1&invoice_id=3&encoding=utf-8&merchant_id=8053711458694541868&merchant_site_id=155886&time_stamp=2017-10-20.02%3A48%3A01&version=4.0.0&user_token_id=59e9e271d936e&user_token=auto&total_amount=4.00&success_url=http%3A%2F%2Foverwatchboost.pro%2Fgate%3Fmessage%3Dsuccess%26hash%3DQhG3NHzh&pending_url=http%3A%2F%2Foverwatchboost.pro%2Fgate%3Fmessage%3Dpending%26hash%3DQhG3NHzh&error_url=http%3A%2F%2Foverwatchboost.pro%2Fgate%3Fmessage%3Derror%26hash%3DQhG3NHzh&back_url=http%3A%2F%2Foverwatchboost.pro%2Fgate%3Fmessage%3Dback%26hash%3DQhG3NHzh&checksum=9ef909a05dda0f7e96782b9d4980243c');
$payload = array(
    //Merchant Details
    'merchant_id' => '4398371783281359887',
    'merchant_unique_id' => 1,
    'merchant_site_id' => '143503',

    //Merchant Site Details
    'customSiteName' => 'test',

    //Navigation Parameters
    //'skip_billing_tab'    => true,
    //'skip_review_tab'     => true,
    //'payment_method'			=> 'cc_card',

    'success_url' => 'http://destinyboost.pro',//$this->gate2shop_ipn_url, //WC_Payment_Gateway::get_return_url( $order ),
    'error_url' => 'http://destinyboost.pro',//$this->gate2shop_ipn_url,
    'pending_url' => 'http://destinyboost.pro',//$this->gate2shop_ipn_url,
    'back_url' => 'http://destinyboost.pro',//$woocommerce->cart->get_checkout_url(), //WC_Payment_Gateway::get_return_url( $order ),

    //Item Details
    //'discount'            => $order->get_total_discount(),
    //'shipping'            => '4.00',
    //'handling'            =>  $total_tax , // Note: Total Tax of cart items included in handling param becuase tax calculuation g2s is different.
    //'total_tax'           =>  $wc_tax_rate, // This is not worked in G2S. Tax calc is not the same in woocommerce if total shipping is included.
    'total_amount' => '4.00',//$order->get_total() ,

    //Customer Details
    'first_name' => 'test',//$order->billing_first_name,
    'last_name' => 'test',//$order->billing_last_name,
    'email' => 'test@test.ru',//$order->billing_email,
    'address1' => 'test',//$order->billing_address_1,
    'address2' => 'test',//$order->billing_address_2,
    'city' => 'test',//$order->billing_city,
    'country' => 'test',//$order->billing_country,
    'state' => 'test',//$order->billing_state,
    'zip' => 'test',//$order->billing_postcode,
    'phone1' => 'test',//$order->billing_phone,

    //Other Parameters
    'version' => '4.0.0',//$this->http_request_version,
    'time_stamp' => date("Y-m-d.H:i:s", time()),
    'currency' => 'EUR',//get_woocommerce_currency() ,
    'invoice_id' => 1,//$order_id ,
    //'merchantLocale'      => $this->merchant_locale,
    //'userid'              => $order->user_id,
    //'user_token_id'       => $order->billing_email,
    'user_token' => 'auto', // user_token=register or if exist user_token=auto
    'encoding' => 'utf-8'//$this->encoding
);

$cart_line_items = array(
    'item_name_1' => 'test_name',
    'item_number_1' => 1,
    'item_quantity_1' => 1,
    'item_amount_1' => '4.00',//$order->get_subtotal(),
    'numberofitems' => 1
);

$payload = array_merge($cart_line_items, $payload);
$payload = array_map('trim', $payload);

$secret_key = 'DvFFuHkmUznPJ9PFyMdvNXi9DZ5TtxL2LDGsCvBZ5Zsc9J4KGvpTtgUr68gPCBjd';
$joined_info = join('', array_values($payload));
$results["checksum"] = hash("md5", $secret_key . $joined_info);

$gate2shop_payload = array_merge($payload, $results);
print_R($gate2shop_payload);


$endpoint_url = 'https://ppp-test.gate2shop.com/ppp/purchase.do';
$args = add_query_arg($gate2shop_payload, $endpoint_url);
$location = esc_url_raw($args);
//return $location;

print_r($location);
?>

    <a href="<?php echo $location; ?>">test</a>


<?php
function add_query_arg()
{
    $args = func_get_args();
    if (is_array($args[0])) {
        if (count($args) < 2 || false === $args[1])
            $uri = $_SERVER['REQUEST_URI'];
        else
            $uri = $args[1];
    } else {
        if (count($args) < 3 || false === $args[2])
            $uri = $_SERVER['REQUEST_URI'];
        else
            $uri = $args[2];
    }

    if ($frag = strstr($uri, '#'))
        $uri = substr($uri, 0, -strlen($frag));
    else
        $frag = '';

    if (0 === stripos($uri, 'http://')) {
        $protocol = 'http://';
        $uri = substr($uri, 7);
    } elseif (0 === stripos($uri, 'https://')) {
        $protocol = 'https://';
        $uri = substr($uri, 8);
    } else {
        $protocol = '';
    }

    if (strpos($uri, '?') !== false) {
        list($base, $query) = explode('?', $uri, 2);
        $base .= '?';
    } elseif ($protocol || strpos($uri, '=') === false) {
        $base = $uri . '?';
        $query = '';
    } else {
        $base = '';
        $query = $uri;
    }

    //wp_parse_str( $query, $qs );
    parse_str($query, $qs);
    if (get_magic_quotes_gpc())
        $qs = stripslashes_deep($qs);


    $qs = urlencode_deep($qs); // this re-URL-encodes things that were already in the query string
    if (is_array($args[0])) {
        foreach ($args[0] as $k => $v) {
            $qs[$k] = $v;
        }
    } else {
        $qs[$args[0]] = $args[1];
    }

    foreach ($qs as $k => $v) {
        if ($v === false)
            unset($qs[$k]);
    }

    $ret = build_query($qs);
    $ret = trim($ret, '?');
    $ret = preg_replace('#=(&|$)#', '$1', $ret);
    $ret = $protocol . $base . $ret . $frag;
    $ret = rtrim($ret, '?');
    return $ret;
}


function wp_parse_str($string, &$array)
{
    parse_str($string, $array);
    if (get_magic_quotes_gpc())
        $array = stripslashes_deep($array);
    /**
     * Filters the array of variables derived from a parsed string.
     *
     * @since 2.3.0
     *
     * @param array $array The array populated with variables.
     */
    //$array = apply_filters( 'wp_parse_str', $array );
}


function urlencode_deep($value)
{
    return map_deep($value, 'urlencode');
}

function map_deep($value, $callback)
{
    if (is_array($value)) {
        foreach ($value as $index => $item) {
            $value[$index] = map_deep($item, $callback);
        }
    } elseif (is_object($value)) {
        $object_vars = get_object_vars($value);
        foreach ($object_vars as $property_name => $property_value) {
            $value->$property_name = map_deep($property_value, $callback);
        }
    } else {
        $value = call_user_func($callback, $value);
    }

    return $value;
}

function build_query($data)
{
    return _http_build_query($data, null, '&', '', false);
}

function _http_build_query($data, $prefix = null, $sep = null, $key = '', $urlencode = true)
{
    $ret = array();

    foreach ((array)$data as $k => $v) {
        if ($urlencode)
            $k = urlencode($k);
        if (is_int($k) && $prefix != null)
            $k = $prefix . $k;
        if (!empty($key))
            $k = $key . '%5B' . $k . '%5D';
        if ($v === null)
            continue;
        elseif ($v === false)
            $v = '0';

        if (is_array($v) || is_object($v))
            array_push($ret, _http_build_query($v, '', $sep, $k, $urlencode));
        elseif ($urlencode)
            array_push($ret, $k . '=' . urlencode($v));
        else
            array_push($ret, $k . '=' . $v);
    }

    if (null === $sep)
        $sep = ini_get('arg_separator.output');

    return implode($sep, $ret);
}

function esc_url_raw($url, $protocols = null)
{
    return esc_url($url, $protocols, 'db');
}

function esc_url($url, $protocols = null, $_context = 'display')
{
    $original_url = $url;

    if ('' == $url)
        return $url;

    $url = str_replace(' ', '%20', $url);
    $url = preg_replace('|[^a-z0-9-~+_.?#=!&;,/:%@$\|*\'()\[\]\\x80-\\xff]|i', '', $url);

    if ('' === $url) {
        return $url;
    }

    if (0 !== stripos($url, 'mailto:')) {
        $strip = array('%0d', '%0a', '%0D', '%0A');
        $url = _deep_replace($strip, $url);
    }

    $url = str_replace(';//', '://', $url);
    /* If the URL doesn't appear to contain a scheme, we
     * presume it needs http:// prepended (unless a relative
     * link starting with /, # or ? or a php file).
     */
    if (strpos($url, ':') === false && !in_array($url[0], array('/', '#', '?')) &&
        !preg_match('/^[a-z0-9-]+?\.php/i', $url))
        $url = 'http://' . $url;

    // Replace ampersands and single quotes only when displaying.
    if ('display' == $_context) {
        $url = wp_kses_normalize_entities($url);
        $url = str_replace('&amp;', '&#038;', $url);
        $url = str_replace("'", '&#039;', $url);
    }

    if ((false !== strpos($url, '[')) || (false !== strpos($url, ']'))) {

        $parsed = wp_parse_url($url);
        $front = '';

        if (isset($parsed['scheme'])) {
            $front .= $parsed['scheme'] . '://';
        } elseif ('/' === $url[0]) {
            $front .= '//';
        }

        if (isset($parsed['user'])) {
            $front .= $parsed['user'];
        }

        if (isset($parsed['pass'])) {
            $front .= ':' . $parsed['pass'];
        }

        if (isset($parsed['user']) || isset($parsed['pass'])) {
            $front .= '@';
        }

        if (isset($parsed['host'])) {
            $front .= $parsed['host'];
        }

        if (isset($parsed['port'])) {
            $front .= ':' . $parsed['port'];
        }

        $end_dirty = str_replace($front, '', $url);
        $end_clean = str_replace(array('[', ']'), array('%5B', '%5D'), $end_dirty);
        $url = str_replace($end_dirty, $end_clean, $url);

    }

    /*if ( '/' === $url[0] ) {
        $good_protocol_url = $url;
    } else {
        if ( ! is_array( $protocols ) )
            $protocols = wp_allowed_protocols();
        $good_protocol_url = wp_kses_bad_protocol( $url, $protocols );
        if ( strtolower( $good_protocol_url ) != strtolower( $url ) )
            return '';
    }*/

    /**
     * Filters a string cleaned and escaped for output as a URL.
     *
     * @since 2.3.0
     *
     * @param string $good_protocol_url The cleaned URL to be returned.
     * @param string $original_url The URL prior to cleaning.
     * @param string $_context If 'display', replace ampersands and single quotes only.
     */
    return $url;//apply_filters( 'clean_url', $good_protocol_url, $original_url, $_context );
}

function _deep_replace($search, $subject)
{
    $subject = (string)$subject;

    $count = 1;
    while ($count) {
        $subject = str_replace($search, '', $subject, $count);
    }

    return $subject;
}

function wp_allowed_protocols()
{
    static $protocols = array();

    if (empty($protocols)) {
        $protocols = array('http', 'https', 'ftp', 'ftps', 'mailto', 'news', 'irc', 'gopher', 'nntp', 'feed', 'telnet', 'mms', 'rtsp', 'svn', 'tel', 'fax', 'xmpp', 'webcal', 'urn');

        /**
         * Filters the list of protocols allowed in HTML attributes.
         *
         * @since 3.0.0
         *
         * @param array $protocols Array of allowed protocols e.g. 'http', 'ftp', 'tel', and more.
         */
        $protocols = $protocols;//apply_filters( 'kses_allowed_protocols', $protocols );
    }

    return $protocols;
}

?>