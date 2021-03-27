<?php
include_once("modules/ModuleBase.php");

class communicate_confidently extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function communicate_confidently()
    {
        parent::ModuleBase();
    }

    function getContent($language)
    {
        $action = $this->routing->action;
        if (getRequest("action") != NULL)
            $action = getRequest("action");
        switch ($action) {
            case "check_login":
                return $this->check_login($language);
                break;
            default :
                return $this->view($language);
                break;
        }
    }

    function view($language) {
        global $webSiteName;
        $tpl = $this->getTemplatePath("communicate_confidently", "communicate_confidently");
        $tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));

        // danh sách categories image
        $communicate_confidently_categories = $this->db->getArray("select * from communicate_confidently_categories where status = 1");
        if ($communicate_confidently_categories) {
            foreach ($communicate_confidently_categories as $item) {
                $tpl->newBlock("communicate_confidently_categories");
                $tpl->assign("title", $item['title']);
                $tpl->assign("code", $item['code']);
            }
        }

        $communicate_confidently = $this->db->getArray("select * from communicate_confidently where status = 1 order by created_at desc");
        if ($communicate_confidently) {
            foreach ($communicate_confidently as $item) {
                $tpl->newBlock("communicate_confidently");
                $tpl->assign("title", $item['title']);
                $tpl->assign("image", $this->getPath() . $item['image']);
                if (!empty($item['video'])) {
                    $tpl->assign("video", 'https://www.youtube.com/embed/' . $item['video']);
                    $tpl->assign("id_modal", 'watching-video');
                    $tpl->assign("data-toggle", 'data-toggle="modal"');
                    $tpl->assign("check_login_video", '');
                } else {
                    $tpl->assign("video", $item['video_upload']);
                    $tpl->assign("id_modal", 'watching-video-upload');
                    $tpl->assign("data-toggle", '');
                    $tpl->assign("check_login_video", 'check-login-video');
                }
                $code = $this->db->getRow("select code from communicate_confidently_categories where id = ? ", $item['id_category']);
                if ($code) {
                    $tpl->assign("code_video", $code['code']);
                }
            }
        }
        return $tpl -> getOutputContent();
    }

    function check_login() {
        global $usess;
        $cus = $usess->get("LOGIN");
		if ($cus) {
			return 1;
		} else {
			return 0;
        }
    }
}

?>