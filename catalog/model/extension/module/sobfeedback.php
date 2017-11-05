<?php

class ModelExtensionModuleSobfeedback extends Model
{
    public function addFeedback($data, $options)
    {
        $this->db->query("INSERT INTO " . DB_PREFIX . "sob_feedback SET module_name = '" . $options['module_name'] . "', module_id = '" . $options['module_id'] . "', page_link = '" . $options['page_link'] . "', feedback_array = '" . serialize($data['sob_input']) . "'");
    }
}