<?php

class Sobfeedback
{
    private $registry;

    public function __construct($registry)
    {
        $this->registry = $registry;
    }

    public function __get($name)
    {
        return $this->registry->get($name);
    }

    public function initFeedback($feedback_id)
    {
        $this->load->model('extension/module');
        $setting_info = $this->model_extension_module->getModule($feedback_id);
        if (isset($setting_info['status']) && $setting_info['status'] && isset($setting_info['custom_position'])) {
            $form = $this->load->controller('extension/module/sobfeedback', $setting_info);
        } else {
            $form = '';
        }
        return $form;
    }
}