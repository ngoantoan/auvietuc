<?php
include_once("modules/ModuleBase.php");

class education_home extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function education_home()
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
        $tpl = $this->getTemplatePath("education_home", "education_home");
        $tpl->assign("link_education_program", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']),""));
        $education_program = $this->db->getArray("select * from education_program where status = 1 order by sort asc limit 0,6");
        if ($education_program) {
            $i = 1;
            foreach ($education_program as $item) {
                $tpl->newBlock("education_program");
                $tpl->assign("title", $item['title']);
                $tpl->assign("title1", $item['title1']);
                $tpl->assign("description", $item['description']);
                $tpl->assign("image", $this->getPath() . $item['image']);
                $tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']), $item['code'], ""));
                $tpl->assign("i", $i);
                $i++;
            }
        }
        return $tpl -> getOutputContent();
    }
}

?>