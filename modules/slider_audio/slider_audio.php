<?php
include_once("modules/ModuleBase.php");

class slider_audio extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }

    function getContent($language)
    {
        $action = $this->routing->action;
        if (getRequest("action") != NULL)
            $action = getRequest("action");
        switch ($action) {
            default :
                return $this->view($language);
                break;
        }
    }

    function view($language) 
    {
        global $webSiteName;
        $tpl = $this->getTemplatePath("slider_audio", "slider_audio");
        $tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));

        $audio_parent_categories = $this->routing->getFullAction();
        $code_slider_audio_category = $this->routing->getFullParam1();

        $parent_category = $this->db->getRow("select id, title, code from slider_audio_parent_categories where code = ? ", $audio_parent_categories);
        if ($parent_category) {
            $tpl->assign("title_parent_category", $parent_category['title']);
        }

        // danh sách category cha
        $slider_audio_parent_categories = $this->db->getArray("select * from slider_audio_parent_categories where status = 1");
        if ($slider_audio_parent_categories) {
            foreach ($slider_audio_parent_categories as $item) {
                $tpl->newBlock("slider_audio_parent_categories");
                $tpl->assign("title", $item['title']);

                // lấy category con đầu tiên
                $id_parent = $item['id'];
                $first_slider_audio_category = $this->db->getRow("select code from slider_audio_categories where parent_id = $id_parent order by created_at desc");

                if ($first_slider_audio_category) {
                    $tpl->assign("link_audio_parent_categories",  $this->server_url . "/" . $this->routing->getPageCode() . "/" . $item['code'] . '/' . $first_slider_audio_category['code']);
                } else {
                    $tpl->assign("link_audio_parent_categories",  $this->server_url . "/" . $this->routing->getPageCode() . "/" . $item['code']);
                }
                
                if ($audio_parent_categories == $item['code']) {
                    $tpl->assign("active_parent_category", "active");
                }
            }
        }

        if ($parent_category) {
            // danh sách category con
            $parent_id = $parent_category['id'];
            $slider_audio_categories = $this->db->getArray("select * from slider_audio_categories where status = 1 and parent_id = $parent_id order by created_at desc");
            if ($slider_audio_categories) {
                foreach ($slider_audio_categories as $item) {
                    $tpl->newBlock("slider_audio_categories");
                    $tpl->assign("title", $item['title']);
                    $tpl->assign("link_audio_categories",  $this->server_url . "/" . $this->routing->getPageCode() . "/" . $parent_category['code'] . "/" . $item['code']);
                    if ($code_slider_audio_category == $item['code']) {
                        $tpl->assign("active_category", "active");
                    }
                }
            }
        }

        // danh sách slider
        $slider_audio_category = $this->db->getRow("select id from slider_audio_categories where code = ? ", $code_slider_audio_category);
        if ($slider_audio_category) { // nếu chọn category con
            $category_id = $slider_audio_category['id'];
            $slider_audio = $this->db->getArray("select * from slider_audio where status = 1 and category_id = $category_id order by created_at desc");
            if ($slider_audio) {
                foreach ($slider_audio as $item) {
                    $tpl->newBlock("slider_audio");
                    $tpl->assign("title", $item['title']);
                    $tpl->assign("code", $item['code']);
                    $tpl->assign("spelling", $item['spelling']);
                    $tpl->assign("description", $item['description']);
                    $tpl->assign("image", $item['image']);
                    $tpl->assign("mp3", $item['mp3']);
                }
            }
        } else { // nếu chưa chọn mặc định sẽ lấy id đầu tiên
            $slider_audio_category = $this->db->getRow("select id from slider_audio_categories order by created_at desc");
            if ($slider_audio_category) {
                $category_id = $slider_audio_category['id'];
                $slider_audio = $this->db->getArray("select * from slider_audio where status = 1 and category_id = $category_id order by created_at desc");
                if ($slider_audio) {
                    foreach ($slider_audio as $item) {
                        $tpl->newBlock("slider_audio");
                        $tpl->assign("title", $item['title']);
                        $tpl->assign("code", $item['code']);
                        $tpl->assign("spelling", $item['spelling']);
                        $tpl->assign("description", $item['description']);
                        $tpl->assign("image", $item['image']);
                        $tpl->assign("mp3", $item['mp3']);
                    }
                }
            }
        }
        
        return $tpl -> getOutputContent();
    }
}

?>