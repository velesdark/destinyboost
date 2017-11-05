<?php

class ModelExtensionModuleSobfeedback extends Model
{


    public function getTotalFeedbacks($data = array())
    {

        if ($this->isInstallModule()) {

            $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sob_feedback";


            if (!empty($data['filter_name'])) {
                $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sob_feedback WHERE 1";
                $sql .= " AND module_name LIKE '" . $this->db->escape($data['filter_name']) . "%'";

            }
            if (!empty($data['filter_text'])) {
                $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sob_feedback WHERE 1";
                $sql .= " AND feedback_array LIKE '%" . $this->db->escape($data['filter_text']) . "%'";

            }
            if (!empty($data['filter_noread'])) {
                $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sob_feedback WHERE 1";
                $sql .= " AND status LIKE '%" . $this->db->escape($data['filter_noread']) . "%'";

            }


            $query = $this->db->query($sql);
            return $query->row['total'];
        } else {
            return false;
        }


    }

    private function isInstallModule()
    {
        $query = $this->db->query("SHOW TABLES LIKE '%feedback%'");

        return $query->num_rows;
    }


    public function getFeedbackAll($data = array())
    {
        $sql = "SELECT * FROM " . DB_PREFIX . "sob_feedback WHERE 1";

        if (!empty($data['filter_name'])) {
            $sql .= " AND module_name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
        }
        if (!empty($data['filter_text'])) {
            $sql .= " AND feedback_array LIKE '%" . $this->db->escape($data['filter_text']) . "%'";
        }
        if (!empty($data['filter_noread'])) {
            $sql .= " AND status LIKE '" . $this->db->escape($data['filter_noread']) . "%'";

        }

        $sort_data = array(
            'module_name',
            'date',
            'fedback_id'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY date";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }


        $query = $this->db->query($sql);
        return $query->rows;
    }


    public function getFeedbackOptions($column)
    {


        $sql = "SELECT * FROM " . DB_PREFIX . "module WHERE 1";
        $sql .= " AND code LIKE 'sobfeedback'";

        if ($column) {
            $sql = "SELECT * FROM " . DB_PREFIX . "sob_feedback WHERE 1 GROUP BY " . $column . " ";
        }


        $query = $this->db->query($sql);


        return $query->rows;
    }


    public function getFedback($fedback_id)
    {


        return $query->row;
    }

    public function updateFeedback($fedback_id, $upadtes = array())
    {

    }

    public function saveFeedback($data)
    {

        $this->db->query("UPDATE " . DB_PREFIX . "sob_feedback SET status = '" . $data['feedback_status'] . "' WHERE fedback_id = '" . $data['feedback_id'] . "'");

    }

    public function deleteFeedback($fedback_id)
    {

        $this->db->query("DELETE FROM " . DB_PREFIX . "sob_feedback WHERE fedback_id = '" . (int)$fedback_id . "'");

    }

    public function install()
    {

        $sql = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "sob_feedback` (";
        $sql .= "`fedback_id` int(255) NOT NULL AUTO_INCREMENT ,";
        $sql .= "`feedback_array` text NOT NULL ,";
        $sql .= "`date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL ,";
        $sql .= "`module_name` VARCHAR(255) NOT NULL ,";
        $sql .= "`module_id` int(20) NOT NULL ,";
        $sql .= "`page_link` text NOT NULL ,";
        $sql .= "`status` VARCHAR(20) NOT NULL DEFAULT 'noread' ,";
        $sql .= "PRIMARY KEY (`fedback_id`)";
        $sql .= ") ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_general_ci";


        $this->db->query($sql);
    }
}