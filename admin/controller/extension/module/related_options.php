<?php

class ControllerExtensionModuleRelatedOptions extends Controller
{
    private $error = array();

    public function install()
    {
        $this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option`
			ADD `master_option` int(11) NOT NULL DEFAULT '0',
			ADD `master_option_value` int(11) NOT NULL DEFAULT '0';");
        $this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option_value`
			ADD `master_option_value` int(11) NOT NULL DEFAULT '0';");
    }

    public function uninstall()
    {
        $this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option`
			DROP COLUMN `master_option`;");
        $this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option`
			DROP COLUMN `master_option_value`;");
        $this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option_value`
			DROP COLUMN `master_option_value`;");
    }

    public function index()
    {
        $this->load->language('extension/module/related_options');

        $this->load->model('setting/setting');

        $this->document->setTitle(strip_tags($this->language->get('heading_title')));

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('related_options', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_settings'] = $this->language->get('text_settings');
        $data['text_residue'] = $this->language->get('text_residue');
        $data['text_price'] = $this->language->get('text_price');
        $data['text_animate_price'] = $this->language->get('text_animate_price');
        $data['text_show_disabled'] = $this->language->get('text_show_disabled');
        $data['help_instructions'] = $this->language->get('help_instructions');
        $data['help_price'] = $this->language->get('help_price');
        $data['decimal_places'] = $this->language->get('decimal_places');
        $data['help_decimal_places'] = $this->language->get('help_decimal_places');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/exchange_1c', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['action'] = $this->url->link('extension/module/related_options', 'token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');

        $data['token'] = $this->session->data['token'];


        if (isset($this->request->post['related_options'])) {
            $data['module_data'] = $this->request->post['related_options'];
        } elseif ($this->config->get('related_options')) {
            $data['module_data'] = $this->config->get('related_options');
        } else {
            $data['module_data'] = array(
                'price_residue' => 2,
                'price_show_disabled' => 2,
                'price_animate_price' => 2,
                'price_adjustment_on' => false,
                'residue_on' => false,
            );
        }


        $data['header'] = $this->load->controller('common/header');
        $data['menu'] = $this->load->controller('common/menu');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/related_options.tpl', $data));

    }

    private function validate()
    {
        if (!$this->user->hasPermission('modify', 'extension/module/related_options')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}

?>
