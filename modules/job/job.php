<?php
include_once("modules/ModuleBase.php");

class job extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function job()
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
        $tpl = $this->getTemplatePath("job", "job");
        $tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));
        $job = $this->db->getRow("select * from job");
        if ($job) {
            $tpl->assign("detail", $job["detail"]);
        }
        return $tpl -> getOutputContent();
    }
}

?>