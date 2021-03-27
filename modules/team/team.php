<?php
include_once("modules/ModuleBase.php");

class team extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function team()
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
        $tpl = $this->getTemplatePath("team", "team");
        return $tpl -> getOutputContent();
    }
}

?>