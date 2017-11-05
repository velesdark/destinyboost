<?php

class ControllerExtensionModuleSobfeedback extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('extension/module/sobfeedback');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        $this->load->model('extension/module');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {


            if (isset($this->request->get['module_id'])) {
                $this->request->post['module_id'] = $this->request->get['module_id'];
            }


            if ($this->validateForm($this->request->post)) {

                if (!isset($this->request->get['module_id'])) {
                    $this->model_extension_module->addModule('sobfeedback', $this->request->post);
                } else {
                    $this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
                }
                $this->cache->delete('product');


                $this->model_setting_setting->editSetting('sobfeedback', $this->request->post);

                $this->session->data['success'] = $this->language->get('text_success');

                if (!isset($this->request->get['module_id'])) {
                    $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
                } else {
                    $this->response->redirect($this->url->link('extension/module/sobfeedback', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true));
                }
            }
        }

        $data['heading_title'] = $this->language->get('heading_title');
        $data['heading_title_form'] = $this->language->get('heading_title_form');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_phone'] = $this->language->get('entry_phone');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_comment'] = $this->language->get('entry_comment');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_module_name'] = $this->language->get('text_module_name');
        $data['text_form_name'] = $this->language->get('text_form_name');
        $data['text_modal'] = $this->language->get('text_modal');
        $data['text_anyplace'] = $this->language->get('text_anyplace');
        $data['error_anyplace'] = $this->language->get('error_anyplace');
        $data['text_paste_controller'] = $this->language->get('text_paste_controller');
        $data['text_paste_temlate'] = $this->language->get('text_paste_temlate');
        $data['placeholder_email'] = $this->language->get('placeholder_email');
        $data['text_form_success'] = $this->language->get('text_form_success');

        $data['table_fiald_name'] = $this->language->get('table_fiald_name');
        $data['table_fiald_type'] = $this->language->get('table_fiald_type');
        $data['table_fiald_status'] = $this->language->get('table_fiald_status');
        $data['table_fiald_required'] = $this->language->get('table_fiald_required');
        $data['table_placeholder_option'] = $this->language->get('table_placeholder_option');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_list'] = $this->language->get('button_list');
        $data['text_modal_button'] = $this->language->get('text_modal_button');

        $this->load->model('localisation/language');
        $data['languages'] = $this->model_localisation_language->getLanguages();


        $this->load->model('extension/module/sobfeedback');
        $fedbacks = $this->model_extension_module_sobfeedback->getFeedbackAll();


        if (isset($this->error['error_module'])) {
            $data['error_warning'] = $this->error['error_module'];
        } else {
            $data['error_warning'] = '';
        }


        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );


        if (!isset($this->request->get['module_id'])) {
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('extension/module/sobfeedback', 'token=' . $this->session->data['token'], true)
            );
        } else {
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('extension/module/sobfeedback', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
            );
        }

        if (!isset($this->request->get['module_id'])) {
            $data['action'] = $this->url->link('extension/module/sobfeedback', 'token=' . $this->session->data['token'], true);
        } else {
            $data['action'] = $this->url->link('extension/module/sobfeedback', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
        }

        $data['feedback_list'] = $this->url->link('extension/module/sobfeedback/getlist', 'token=' . $this->session->data['token'], true);

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);


        if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
        }


        if (isset($this->request->get['module_id'])) {
            $data['module_id'] = $this->request->get['module_id'];
        } else {
            $data['module_id'] = '';
        }


        if (isset($this->request->post['sobfeedback_modal'])) {
            $data['sobfeedback_modal'] = $this->request->post['sobfeedback_modal'];
        } elseif (isset($module_info['sobfeedback_modal'])) {
            $data['sobfeedback_modal'] = $module_info['sobfeedback_modal'];
        } else {
            $data['sobfeedback_modal'] = '';
        }


        if (isset($this->request->post['form_name'])) {
            $data['form_name'] = $this->request->post['form_name'];
        } elseif (isset($module_info['form_name'])) {
            $data['form_name'] = $module_info['form_name'];
        } else {
            $data['form_name'] = '';
        }

        if (isset($this->request->post['form_success'])) {
            $data['form_success'] = $this->request->post['form_success'];
        } elseif (isset($module_info['form_success'])) {
            $data['form_success'] = $module_info['form_success'];
        } else {
            $data['form_success'] = '';
        }

        if (isset($this->request->post['modal_button'])) {
            $data['modal_button'] = $this->request->post['modal_button'];
        } elseif (isset($module_info['modal_button'])) {
            $data['modal_button'] = $module_info['modal_button'];
        } else {
            $data['modal_button'] = '';
        }

        if (isset($this->request->post['custom_position'])) {
            $data['custom_position'] = $this->request->post['custom_position'];
        } elseif (isset($module_info['custom_position'])) {
            $data['custom_position'] = $module_info['custom_position'];
        } else {
            $data['custom_position'] = '';
        }


        if (isset($this->request->post['name'])) {
            $data['name'] = $this->request->post['name'];
        } elseif (!empty($module_info)) {
            $data['name'] = $module_info['name'];
        } else {
            $data['name'] = '';
        }


        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($module_info)) {
            $data['status'] = $module_info['status'];
        } else {
            $data['status'] = '';
        }


        if (isset($this->request->post['sobfeedback_email'])) {
            $data['sobfeedback_email'] = $this->request->post['sobfeedback_email'];
        } elseif (isset($module_info['sobfeedback_email'])) {
            $data['sobfeedback_email'] = $module_info['sobfeedback_email'];
        } else {
            $data['sobfeedback_email'] = '';
        }


        $data['fields'] = array();

        if (isset($this->request->post['sobfeedback_field'])) {
            $data['fields'] = $this->request->post['sobfeedback_field'];
        } elseif (!empty($module_info['sobfeedback_field'])) {
            $data['fields'] = $module_info['sobfeedback_field'];
        } else {
            $data['fields'] = '';
        }


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/sobfeedback.tpl', $data));


    }


    public function getList()
    {
        $this->load->language('extension/module/sobfeedback');


        $this->load->model('extension/module/sobfeedback');
        $data['heading_title'] = $this->language->get('heading_title');

        $data['error_nomodule'] = $this->language->get('error_nomodule');
        $data['button_create_form'] = $this->language->get('button_create_form');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_text_confirm'] = $this->language->get('button_text_confirm');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['text_feedback_list'] = $this->language->get('text_feedback_list');
        $data['text_filter_name_form'] = $this->language->get('text_filter_name_form');
        $data['text_filter_all_form'] = $this->language->get('text_filter_all_form');
        $data['text_filter_text_form'] = $this->language->get('text_filter_text_form');
        $data['text_filter_status'] = $this->language->get('text_filter_status');
        $data['text_filter_allstatus'] = $this->language->get('text_filter_allstatus');
        $data['text_status_noread'] = $this->language->get('text_status_noread');
        $data['text_status_read'] = $this->language->get('text_status_read');
        $data['text_name_form'] = $this->language->get('text_name_form');
        $data['button_filter'] = $this->language->get('button_filter');
        $data['text_date'] = $this->language->get('text_date');
        $data['text_page_send'] = $this->language->get('text_page_send');
        $data['text_page_link'] = $this->language->get('text_page_link');
        $data['text_more'] = $this->language->get('text_more');
        $data['text_nomassage'] = $this->language->get('text_nomassage');
        $data['text_massage_number'] = $this->language->get('text_massage_number');
        $data['text_popup_value'] = $this->language->get('text_popup_value');
        $data['text_popup_data'] = $this->language->get('text_popup_data');
        $data['text_popup_date'] = $this->language->get('text_popup_date');
        $data['button_save'] = $this->language->get('button_save');
        $data['text_popup_close'] = $this->language->get('text_popup_close');
        $data['text_entry_text'] = $this->language->get('text_entry_text');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['text_setting_form'] = $this->language->get('text_setting_form');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
        } else {
            $filter_name = null;
        }
        if (isset($this->request->get['filter_text'])) {
            $filter_text = $this->request->get['filter_text'];
        } else {
            $filter_text = null;
        }
        if (isset($this->request->get['filter_noread'])) {
            $filter_noread = $this->request->get['filter_noread'];
        } else {
            $filter_noread = null;
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'date';
        }
        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }
        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        if (isset($this->request->get['filter_text'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_text'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_text'])) {
            $url .= '&filter_text=' . urlencode(html_entity_decode($this->request->get['filter_text'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_noread'])) {
            $url .= '&filter_noread=' . urlencode(html_entity_decode($this->request->get['filter_noread'], ENT_QUOTES, 'UTF-8'));
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/sobfeedback/getlist', 'token=' . $this->session->data['token'], true)
        );

        $data['action'] = $this->url->link('extension/module/sobfeedback', 'token=' . $this->session->data['token'], true);

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
        $data['add_module'] = $this->url->link('extension/module/sobfeedback', 'token=' . $this->session->data['token'], true);

        $data['deleteFeedback'] = $this->url->link('extension/module/sobfeedback/deleteFeedback', 'token=' . $this->session->data['token'], true);
        $data['saveFeedback'] = $this->url->link('extension/module/sobfeedback/saveFeedback', 'token=' . $this->session->data['token'], true);

        $data['token'] = $this->session->data['token'];


        $filter_data = array(
            'filter_name' => $filter_name,
            'filter_text' => $filter_text,
            'filter_noread' => $filter_noread,
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $feedbacks = $this->model_extension_module_sobfeedback->getFeedbackAll($filter_data);
        $feedback_total = $this->model_extension_module_sobfeedback->getTotalFeedbacks($filter_data);


        $module_options = $this->model_extension_module_sobfeedback->getFeedbackOptions('');
        $data['module_names'] = $this->model_extension_module_sobfeedback->getFeedbackOptions('module_name');

        foreach ($module_options as $module_option) {
            $data['feedback_module_options'][] = array(
                'module_id' => $module_option['module_id'],
                'module_name' => $module_option['name'],
                'module_url' => $this->url->link('extension/module/sobfeedback&module_id=' . $module_option['module_id'], 'token=' . $this->session->data['token'], true),
            );
        }


        foreach ($feedbacks as $feedback) {
            if ($feedback['status'] == 'noread') {
                $status = 'Не прочитан';
            } else {
                $status = 'Прочитан';
            }
            $data['feedbacks'][] = array(
                'fedback_id' => $feedback['fedback_id'],
                'date' => $feedback['date'],
                'module_name' => $feedback['module_name'],
                'page_link' => $feedback['page_link'],
                'status' => $status,
                'feedback_array' => unserialize($feedback['feedback_array']),
            );
        }


        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_text'])) {
            $url .= '&filter_text=' . urlencode(html_entity_decode($this->request->get['filter_text'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_noread'])) {
            $url .= '&filter_noread=' . urlencode(html_entity_decode($this->request->get['filter_noread'], ENT_QUOTES, 'UTF-8'));
        }

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_name'] = $this->url->link('extension/module/sobfeedback/getlist', 'token=' . $this->session->data['token'] . '&sort=module_name' . $url, true);
        $data['sort_date'] = $this->url->link('extension/module/sobfeedback/getlist', 'token=' . $this->session->data['token'] . '&sort=date' . $url, true);
        $data['sort_id'] = $this->url->link('extension/module/sobfeedback/getlist', 'token=' . $this->session->data['token'] . '&sort=fedback_id' . $url, true);

        $url = '';


        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_text'])) {
            $url .= '&filter_text=' . urlencode(html_entity_decode($this->request->get['filter_text'], ENT_QUOTES, 'UTF-8'));
        }
        if (isset($this->request->get['filter_noread'])) {
            $url .= '&filter_noread=' . urlencode(html_entity_decode($this->request->get['filter_noread'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['path'])) {
            $url .= '&path=' . $this->request->get['path'];
        }

        $pagination = new Pagination();
        $pagination->total = $feedback_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('extension/module/sobfeedback/getlist', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();
        $data['filter_name'] = $filter_name;
        $data['filter_text'] = $filter_text;
        $data['filter_noread'] = $filter_noread;

        $data['results'] = sprintf($this->language->get('text_pagination'), ($feedback_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($feedback_total - $this->config->get('config_limit_admin'))) ? $feedback_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $feedback_total, ceil($feedback_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/sobfeedback_list.tpl', $data));

    }

    public function deleteFeedback()
    {
        $url = '';
        $this->load->model('extension/module/sobfeedback');

        if ($this->request->post['selected']) {

            foreach ($this->request->post['selected'] as $feedback_id) {

                $this->model_extension_module_sobfeedback->deleteFeedback($feedback_id);
            }

            $this->response->redirect($this->url->link('extension/module/sobfeedback/getlist', 'token=' . $this->session->data['token'] . $url, true));
        }


    }

    public function saveFeedback()
    {
        $url = '';
        $this->load->model('extension/module/sobfeedback');

        if ($this->request->post) {


            $this->model_extension_module_sobfeedback->saveFeedback($this->request->post);


            $this->response->redirect($this->url->link('extension/module/sobfeedback/getlist', 'token=' . $this->session->data['token'] . $url, true));
        }


    }

    public function validateForm($feedback_forms)
    {
        $this->load->model('localisation/language');

        if (utf8_strlen($feedback_forms['name']) < 2 || utf8_strlen($feedback_forms['name']) > 50) {
            $this->error['error_module'] = $this->language->get('text_error_name_module');
        }


        $languages = $this->model_localisation_language->getLanguages();

        foreach ($languages as $language) {
            $language_id = $language['language_id'];


            if (isset($feedback_forms['sobfeedback_field'])) {
                $feedback_forms = $feedback_forms['sobfeedback_field'];
                foreach ($feedback_forms as $feedback_form) {

                    if (utf8_strlen($feedback_form['name'][$language_id]) < 2 || utf8_strlen($feedback_form['name'][$language_id]) > 50) {
                        $this->error['error_module'] = $this->language->get('text_error_field_name');
                    }

                    if (isset($feedback_form['option'])) {
                        if (utf8_strlen($feedback_form['option'][$language_id]) < 1 || utf8_strlen($feedback_form['option'][$language_id]) > 200) {
                            $this->error['error_module'] = $this->language->get('text_error_field_option');

                        }

                    }

                }
            }
        }


        return !$this->error;


    }


    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'extension/module/sobfeedback')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }


    public function getAll()
    {

    }


    public function delete()
    {


    }


    public function install()
    {
        $this->load->model('extension/module/sobfeedback');

        $this->model_extension_module_sobfeedback->install();
    }


}