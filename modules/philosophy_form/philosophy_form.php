<?php
include_once("modules/ModuleBase.php");

class philosophy_form extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function philosophy_form()
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
        $tpl = $this->getTemplatePath("philosophy_form", "philosophy_form");
        $advisory_text = $this->db->getRow("select * from advisory_text");
        if ($advisory_text) {
            $tpl->assign("title", $advisory_text['title']);
            $tpl->assign("detail", $advisory_text['detail']);
        }
        return $tpl -> getOutputContent();
    }
}

?>