<?php
include_once("modules/ModuleBase.php");

class advisory_home extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function advisory_home()
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
        global $webSiteName;
        $tpl = $this->getTemplatePath("advisory_home", "advisory_home");
        $advisorys = $this->db->getArray("select * from advisory where status = 1");
        if ($advisorys) {
            foreach ($advisorys as $item) {
                $tpl->newBlock("advisorys");
                $tpl->assign("title", $item['title']);
                $tpl->assign("image", $this->getPath() . $item['image']);
                $tpl->assign("description", $item['description']);
                $tpl->assign("link_study_abroad", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_STUDY_ABROAD, $language['id']),""));

            }
        }
        return $tpl -> getOutputContent();
    }
}

?>