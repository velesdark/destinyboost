<?php

/**
 * Платежная система Wallet One (Единая касса)
 *
 * @cms       ocStore 2.3
 * @author    ocStore Team
 * @support   https://opencartforum.com/profile/3463-shoputils
 * @version   1.0
 * @copyright  Copyright (c) 2016 ocStore Team (https://myopencart.com , https://opencartforum.com)
 */
class ControllerExtensionPaymentOcstoreW1 extends Controller
{
    private $order;
    private $iso4271 = array(
        'RUR' => '810',
        'RUB' => '643',
        'USD' => '840',
        'EUR' => '978',
        'ZAR' => '710',
        'UAH' => '980',
        'KZT' => '398',
        'BYR' => '974',
        'BYN' => '974',
        'AZN' => '944',
        'PLN' => '985',
        'GEL' => '981',
        'TJS' => '972'
    );

    public function index()
    {
        $data['button_confirm'] = $this->language->get('button_confirm');

        $data['action'] = 'https://wl.walletone.com/checkout/checkout/Index';
        $data['confirm'] = $this->url->link('extension/payment/ocstore_w1/confirm', '', 'SSL');

        $this->load->model('checkout/order');
        $products = $this->cart->getProducts();

        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

        $currency_code = $this->config->get('ocstore_w1_currency');
        $currency_number = $this->getCurrencyNumberByCode($currency_code);
        $merchant_id = $this->config->get('ocstore_w1_shop_id');
        $amount = number_format($this->currency->convert($order_info['total'], $this->config->get('config_currency'), $currency_code), 2, '.', '');
        $payment_id = $order_info['order_id'];

        $timeZone = date_default_timezone_get();
        date_default_timezone_set('Europe/Dublin');
        /*$data['params'] = array(
            'WMI_MERCHANT_ID'     => $merchant_id,
            'WMI_PAYMENT_AMOUNT'  => $amount,
            'WMI_PAYMENT_NO'      => $payment_id,
            'WMI_CURRENCY_ID'     => $currency_number,
            'WMI_DESCRIPTION'     => sprintf('OrderID: %d; Total: %s (%s)', $payment_id, $amount, $currency_code),
            'WMI_SUCCESS_URL'     => $this->url->link('extension/payment/ocstore_w1/success', '', 'SSL'),
            'WMI_FAIL_URL'        => $this->url->link('extension/payment/ocstore_w1/fail', '', 'SSL'),
            'WMI_EXPIRED_DATE'    => date("Y-m-d\TH:i:s", time() + 60 * 43200)   //1 month
        );*/


        date_default_timezone_set($timeZone);
        //$data['params']=array();
        require_once($_SERVER['DOCUMENT_ROOT'] . '/pay_config.php');


        //$data['params']['WMI_SIGNATURE'] = $this->calculateSignature($data['params']);

        $cart_line_items = array();
        $k = 1;
        $sum = 0;
        foreach ($products as $prod) {
            $cart_line_items['item_name_' . $k] = $prod['name'];
            $cart_line_items['item_number_' . $k] = $prod['product_id'];
            $cart_line_items['item_quantity_' . $k] = $prod['quantity'];
            $cart_line_items['item_amount_' . $k] = number_format($prod['price'], 2, '.', '');
            $sum += $prod['price'] * $prod['quantity'];
            $k++;
        }

        $cart_line_items['numberofitems'] = count($products);
        $data['params'] = array(
            //Merchant Details
            'merchant_id' => MERCHANT_ID,
            'merchant_unique_id' => $order_info['order_id'],
            'merchant_site_id' => MERCHANT_SITE_ID,

            //Merchant Site Details
            'customSiteName' => 'test',

            //Navigation Parameters
            //'skip_billing_tab'    => true,
            //'skip_review_tab'     => true,
            //'payment_method'			=> 'cc_card',

            'success_url' => $this->url->link('checkout/success', '', 'SSL'),//'http://destinyboost.pro',//$this->gate2shop_ipn_url, //WC_Payment_Gateway::get_return_url( $order ),
            'error_url' => $this->url->link('checkout/failure', '', 'SSL'),//'http://destinyboost.pro',//$this->gate2shop_ipn_url,
            'pending_url' => $this->url->link('checkout/success', '', 'SSL'),//$this->gate2shop_ipn_url,
            'back_url' => $this->url->link('checkout/checkout', '', 'SSL'),//'http://destinyboost.pro',//$woocommerce->cart->get_checkout_url(), //WC_Payment_Gateway::get_return_url( $order ),

            //Item Details
            'discount' => number_format($sum - $order_info['total'], 2, '.', ''),//$order->get_total_discount(),
            //'shipping'            => '4.00',
            //'handling'            =>  number_format($sum-$order_info['total'], 2, '.', ''),//$total_tax , // Note: Total Tax of cart items included in handling param becuase tax calculuation g2s is different.
            //'total_tax'           =>  number_format($sum-$order_info['total'], 2, '.', ''),//$wc_tax_rate, // This is not worked in G2S. Tax calc is not the same in woocommerce if total shipping is included.
            'total_amount' => number_format($order_info['total'], 2, '.', ''),//'4.00',//$order->get_total() ,

            //Customer Details
            'first_name' => $order_info['firstname'],//$order->billing_first_name,
            'last_name' => '',//$order->billing_last_name,
            'email' => $order_info['email'],//$order->billing_email,
            'address1' => '',//$order->billing_address_1,
            'address2' => '',//$order->billing_address_2,
            'city' => '',//$order->billing_city,
            'country' => '',//$order->billing_country,
            'state' => '',//$order->billing_state,
            'zip' => '',//$order->billing_postcode,
            'phone1' => '',//$order->billing_phone,

            //Other Parameters
            'version' => '4.0.0',//$this->http_request_version,
            'time_stamp' => date("Y-m-d.H:i:s", time()),
            'currency' => $order_info['currency_code'],//get_woocommerce_currency() ,
            'invoice_id' => $order_info['order_id'],//$order_id ,
            //'merchantLocale'      => $this->merchant_locale,
            'userid' => 1,
            'user_token_id' => $order_info['email'],
            'user_token' => 'register', // user_token=register or if exist user_token=auto
            'encoding' => 'utf-8'//$this->encoding
        );


        $data['params'] = array_merge($cart_line_items, $data['params']);
        $data['params'] = array_map('trim', $data['params']);

        $secret_key = SECRET_KEY;
        $joined_info = join('', array_values($data['params']));
        $results["checksum"] = hash("md5", $secret_key . $joined_info);

        $data['params'] = array_merge($data['params'], $results);
//print_R($order_info);


        if (TEST_SITE)
            $data['url'] = 'https://ppp-test.gate2shop.com/ppp/purchase.do';
        else
            $data['url'] = 'https://secure.gate2shop.com/ppp/purchase.do';

        //$args 				= add_query_arg( $gate2shop_payload, $endpoint_url );
        //$location 		= esc_url_raw($args);


        return $this->load->view('extension/payment/ocstore_w1.tpl', $data);
    }

    public function confirm()
    {
        if (!empty($this->session->data['order_id']) && ($this->session->data['payment_method']['code'] == 'ocstore_w1')) {
            $this->load->model('checkout/order');
            $this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('ocstore_w1_order_confirm_status_id'));
        }
    }

    public function fail()
    {
        if ($this->validate(false, false)) {
            $created = isset($this->request->post['WMI_ORDER_STATE']) && ($this->request->post['WMI_ORDER_STATE'] == 'Created');
            if ($this->order['order_status_id'] && !$created) {
                $this->model_checkout_order->addOrderHistory($this->order['order_id'], $this->config->get('ocstore_w1_order_fail_status_id'), 'W1: Payment Fail', true);
            }
        }

        $this->response->redirect($this->url->link('checkout/failure', '', 'SSL'));
    }

    public function success()
    {
        $this->load->model('checkout/order');
        $this->model_checkout_order->addOrderHistory($this->order['order_id'], $this->config->get('ocstore_w1_order_status_id'));

        $this->sendOk();

        $this->response->redirect($this->url->link('checkout/success', '', 'SSL'));
    }

    public function callback()
    {
        //$this->log->Write('CallbackURL: ');
        //$this->log->Write('  POST:' . var_export($this->request->post, true));
        //$this->log->Write('  GET:' . var_export($this->request->get, true));
        if (!$this->validate()) {
            return;
        }

        /*if ($this->request->post['WMI_ORDER_STATE'] == 'Processing' ||
            $this->request->post['WMI_ORDER_STATE'] == 'Accepted') {
            if ($this->order['order_status_id']) {
                $this->model_checkout_order->addOrderHistory($this->order['order_id'], $this->config->get('ocstore_w1_order_status_id'), 'W1: Order ' . $this->request->post['WMI_ORDER_ID'], true);
            }
        }*/
        $this->model_checkout_order->addOrderHistory($this->order['order_id'], $this->config->get('ocstore_w1_order_status_id'), 'W1: Order ' . $this->request->post['WMI_ORDER_ID'], true);

        $this->sendOk();
    }

    protected function calculateSignature($params)
    {
        /* foreach ($params as $name => $val) {
             if (is_array($val)) {
                 usort($val, "strcasecmp");
                 $params[$name] = $val;
             }
         }
         uksort($params, "strcasecmp");
         $paramValues = "";

         foreach ($params as $value) {
             if (is_array($value)) {
                 foreach ($value as $v) {
                     $v = iconv("utf-8", "windows-1251", $v);
                     $paramValues .= $v;
                 }
             } else {
                 $value = iconv("utf-8", "windows-1251", $value);
                 $paramValues .= $value;
             }
         }*/

        return 1;
    }

    protected function getCurrencyNumberByCode($value)
    {
        return isset($this->iso4271[$value]) ? $this->iso4271[$value] : false;
    }

    protected function validate($check_sign_hash = true, $check_request_method = true)
    {
        $this->load->model('checkout/order');

        if ($check_request_method) {
            if ($this->request->server['REQUEST_METHOD'] != 'POST') {
                $this->sendForbidden('HTTP method should be POST');
                return false;
            }
        } else {
            //Fix от 19.12.2016. На Fail URL W1 может прислать пустой GET-запрос. В этом случае попытаемся получить order_id из сессии.
            if ($this->request->server['REQUEST_METHOD'] != 'POST') {
                if (isset($this->session->data['order_id'])) {
                    $this->request->post['WMI_PAYMENT_NO'] = $this->session->data['order_id'];
                } else {
                    $this->sendForbidden('Unknown Order ID');
                    return false;
                }
            }
        }

        /* if ($check_sign_hash) {
             $params = array();
             foreach ($this->request->post as $key => $value) {
                 if ($key !== "WMI_SIGNATURE") $params[$key] = urldecode($value);
             }

             $signature = $this->calculateSignature($params);

             if ($this->request->post['WMI_SIGNATURE'] != $signature) {
                 $this->sendForbidden(sprintf('Wrong signature: %s', $signature));
                 return false;
             }
         }

         $this->order = $this->model_checkout_order->getOrder($this->request->post['WMI_PAYMENT_NO']);

         if (!$this->order) {
             $this->sendForbidden(sprintf('Order ID: %s', $this->request->post['WMI_PAYMENT_NO']));
             return false;
         }*/

        return true;
    }

    protected function sendForbidden($error)
    {
        //$this->log->Write('ERROR: ' . $error);
        ob_start();
        echo 'WMI_RESULT=RETRY&WMI_DESCRIPTION=' . urlencode($error);
        ob_end_flush();
    }

    protected function sendOk()
    {
        //$this->log->Write('SEND OK');
        ob_start();
        echo "WMI_RESULT=OK";
        ob_end_flush();
    }
}

?>