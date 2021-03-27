<?php
include_once("modules/ModuleBase.php");

class philosophy_home extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function philosophy_home()
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
        $tpl = $this->getTemplatePath("philosophy_home", "philosophy_home");
        $philosophy = $this->db->getArray("select * from philosophy");
        if ($philosophy) {
            $tpl->assign("title1", $philosophy[0]['title']);
            $tpl->assign("description1", $philosophy[0]['description']);
            $tpl->assign("title2", $philosophy[1]['title']);
            $tpl->assign("description2", $philosophy[1]['description']);
            $tpl->assign("title3", $philosophy[2]['title']);
            $tpl->assign("description3", $philosophy[2]['description']);
            $tpl->assign("title4", $philosophy[3]['title']);
            $tpl->assign("description4", $philosophy[3]['description']);
            $tpl->assign("title5", $philosophy[4]['title']);
            $tpl->assign("description5", $philosophy[4]['description']);
            $tpl->assign("title6", $philosophy[5]['title']);
            $tpl->assign("description6", $philosophy[5]['description']);
        }
        return $tpl -> getOutputContent();
    }
}

?>