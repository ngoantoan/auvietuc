<?php
include_once("modules/ModuleBase.php");

class base_system extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function base_system()
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
        $tpl = $this->getTemplatePath("base_system", "base_system");
        $tpl->assign("link_education_program", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']),""));
        $tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));
        return $tpl -> getOutputContent();
    }
}

?>