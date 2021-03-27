<?php
include_once("modules/ModuleBase.php");

class study_space extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function study_space()
    {
        parent::ModuleBase();
    }

    function getContent($language)
    {
        $action = $this->routing->action;
        if (getRequest("action") != NULL)
            $action = getRequest("action");
        switch ($action) {
            case "getmail":
                return $this->getmail($language);
                break;
            default :
                return $this->view($language);
                break;
        }
    }

    function view($language)
    {
        global $maintpl;
		$code = "";
        $code = $this->routing->getFullAction();
        
        if ($code != "") {
			$tpl = $this->getTemplatePath('study_space', 'study_space_detail');
			$tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));
			$tpl->assign("link_study_space", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_STUDY_SPACE, $language['id']),""));
			$study_space = $this->db->getRow("SELECT * FROM study_space WHERE code=?", $code);
			if ($study_space) {
				$tpl->assign("title", $study_space['title']);
                $tpl->assign("detail", $study_space['detail']);
                
                $maintpl->assignGlobal('website_name', $study_space['title']);
				$maintpl->assignGlobal('site_description', $study_space['title']);
				$maintpl->assignGlobal("IMAGE_LINK", $this->server_url. $this->getPath() . $study_space['image']);
            }
        } else {
            $tpl = $this->getTemplatePath("study_space", "study_space");
            $study_space = $this->db->getArray("select * from study_space where status = 1 order by created_at desc");
            $tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));
            if ($study_space) {
                foreach ($study_space as $item) {
                    $tpl->newBlock("study_space");
                    $tpl->assign("title", $item['title']);
                    $tpl->assign("description", $item['description']);
                    $tpl->assign("image", $this->getPath() . $item['image']);
                    $tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_STUDY_SPACE, $language['id']), $item['code'], ""));
                }
            }
        }
        return $tpl -> getOutputContent();
    }
}

?>