<?php

class ControllerExtensionModuleSobfeedback extends Controller
{


    public function index($setting)
    {
        $this->load->language('extension/module/sobfeedback');

        $data['button_text'] = $this->language->get('button_text');
        $data['button_send'] = $this->language->get('button_send');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_phone'] = $this->language->get('entry_phone');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['enntry_text'] = $this->language->get('enntry_text');

        $data['module_id'] = $setting['module_id'];
        $this->form_id = $setting['module_id'];
        $fields = $setting['sobfeedback_field'];
        //$fields = $this->config->get('sobfeedback_field');
        if ($setting['form_name'][$this->config->get('config_language_id')]) {
            $data['module_name'] = $setting['form_name'][$this->config->get('config_language_id')];
        } else {
            $data['module_name'] = $setting['name'];
        }

        if (isset($setting['sobfeedback_modal'])) {
            $data['button_name'] = $setting['modal_button'][$this->config->get('config_language_id')];
        }

        $this->session->data['sobfeedback_email'] = $setting['sobfeedback_email'];

        if ($setting['form_success'][$this->config->get('config_language_id')]) {
            $data['form_success'] = $setting['form_success'][$this->config->get('config_language_id')];
        } else {
            $data['form_success'] = $this->language->get('text_succes');
        }


        if (isset($fields)) {
            foreach ($fields as $field) {
                //якщо статус не прийшов то присвоъм нуль
                if (!isset($field['field_status'])) {
                    $field['field_status'] = 0;
                }

                //якщо реквайред не прйшов то нуль
                if (!isset($field['required'])) {
                    $field['required'] = 0;
                }
                //якщо опції не прийшли то нуль инакше робим масив
                if (!isset($field['option'])) {
                    $field['option'][$this->config->get('config_language_id')] = 0;
                } else {
                    $field['option'][$this->config->get('config_language_id')] = explode(':', $field['option'][$this->config->get('config_language_id')]);
                }


                //перебор масива для виводу полів
                $data['fields'][] = array(
                    'name' => $field['name'][$this->config->get('config_language_id')],
                    'type' => $field['type'],
                    'field_status' => $field['field_status'],
                    'required' => $field['required'],
                    'option' => $field['option'][$this->config->get('config_language_id')],
                );

            }


        }
        $data['domain'] = $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];

        // операции из дополнительными полями
        if (isset($setting['sobfeedback_modal'])) {
            return $this->load->view('extension/module/sobfeedback_modal', $data);
        } else {
            return $this->load->view('extension/module/sobfeedback', $data);
        }


    }

    public function send()
    {

        $this->language->load('extension/module/sobfeedback');    //подключаем языковый пакет

        $json = array(); //создаем масив который будет возвращаться


        //очевидная вещь, пришел ли ТИП запрос ПОСТ
        if ($this->request->server['REQUEST_METHOD'] == 'POST') {

            $feedback_options = array(
                'module_name' => $this->request->post['module_name'],
                'module_id' => $this->request->post['module_id'],
                'page_link' => $this->request->post['link_page'],
            );
            $form_success = $this->request->post['form_success'];


            $json = $this->validate($this->request->post);
            //проверка не появились лы ошибки, если нет то делаем то что внутри - без комментариев
            if (!isset($json['error'])) {
                $json = $this->request->post;

                //specialchartss
                foreach ($json['sob_input'] as $key_fields => $fields) {
                    $json['sob_input'][$key_fields] = '';

                    foreach ($fields as $key_text => $text) {

                        $key_text = str_replace("'", "&#039;", $key_text);
                        $text = str_replace("'", "&#039;", $text);
                        $json['sob_input'][$key_fields][$key_text] = $text;
                    }
                }


                // Запис в бд
                $this->load->model('extension/module/sobfeedback');
                $this->model_extension_module_sobfeedback->addFeedback($json, $feedback_options);
                // Запис в бд


                $link_page = $this->request->post['link_page'] . "\n\n";

                $domain = $_SERVER['SERVER_NAME'];
                $domain = str_replace('http://', '', $domain);
                $domain = str_replace('www.', '', $domain);

                $mail = new Mail();
                $mail->protocol = $this->config->get('config_mail_protocol');
                $mail->parameter = $this->config->get('config_mail_parameter');
                $mail->hostname = $this->config->get('config_smtp_host');
                $mail->username = $this->config->get('config_smtp_username');
                $mail->password = $this->config->get('config_smtp_password');
                $mail->port = $this->config->get('config_smtp_port');
                $mail->timeout = $this->config->get('config_smtp_timeout');
                if ($this->session->data['sobfeedback_email']) {
                    $mail->setTo($this->session->data['sobfeedback_email']);
                } else {
                    $mail->setTo($this->config->get('config_email'));
                }


                //$mail->setFrom($this->config->get('config_email'));
                $mail->setFrom('info@' . $domain);
                $mail->setSender($this->config->get('config_name'));
                $mail->setSubject(html_entity_decode(sprintf($this->language->get('entry_email'), 'NAMEString', ENT_QUOTES, 'UTF-8')));

                //перебор форм
                //$forms_tomail;

                $form = $json['sob_input'];
                foreach ($form as $form_box) {
                    foreach ($form_box as $name => $value) {
                        if ($name != 'required') {
                            if (!isset($forms_tomail)) {
                                $forms_tomail = $name . ': ' . $value . "\n\n";
                            } else {
                                $forms_tomail .= $name . ': ' . $value . "\n\n";
                            }
                        }
                    }
                }


                $mail->setText(
                    html_entity_decode($forms_tomail)
                    . html_entity_decode($this->language->get('message_link') . ' ' . $link_page, ENT_QUOTES, 'UTF-8')
                );


                $mail->send();

                //Send to additional alert emails
                $emails = explode(',', $this->config->get('config_alert_emails'));

                foreach ($emails as $email) {
                    if ($email && preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $email)) {
                        $mail->setTo($email);
                        $mail->send();
                    }
                }


                $json['success'] = $form_success;
            }


        }

        //превращам наш масив с "ошибками" или "успехом" в понятный для jsona формат - json_encode
        //$this->response->setOutput(... - если вкратце, єто как return, тоисть то что возвращает наш метод.
        $this->response->setOutput(json_encode($json));


    }


    public function validate($results)
    {
        $this->language->load('module/sobfeedback');
        $text_error_send = $this->language->get('error_send');
        $out = array();

        //валидация инпутов
        $form = $results['sob_input'];
        foreach ($form as $form_box) {
            if (isset($form_box['required']) && $form_box['required'] == 'input') {
                foreach ($form_box as $name => $value) {
                    if ($name != 'required') {
                        if ((utf8_strlen($value) < 3) || (utf8_strlen($value) > 32)) {
                            $out['error'] = $text_error_send;
                        }
                    }
                }
            }
        }
        //валидация текстареа
        $form = $results['sob_input'];
        foreach ($form as $form_box) {
            if (isset($form_box['required']) && $form_box['required'] == 'textarea') {
                foreach ($form_box as $name => $value) {

                    if ($name != 'required') {
                        if ((utf8_strlen($value) < 5) || (utf8_strlen($value) > 200)) {
                            $out['error'] = $text_error_send;
                        }
                    }
                }
            }
        }
        //валидация radio
        $form = $results['sob_input'];
        foreach ($form as $form_box) {
            if (isset($form_box['required']) && $form_box['required'] == 'radio') {
                if (count($form_box) == 1) {
                    $out['error'] = $text_error_send;
                }
            }
        }
        //валидация checkbox
        $form = $results['sob_input'];
        foreach ($form as $form_box) {
            if (isset($form_box['required']) && $form_box['required'] == 'checkbox') {
                if (count($form_box) == 1) {
                    $out['error'] = $text_error_send;
                }
            }
        }


        return $out;
    }
}
