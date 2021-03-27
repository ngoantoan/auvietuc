<?php
include_once("modules/ModuleBase.php");

//require_once("online.php");
class footer extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function footer()
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

    function view($language) {
        global $webSiteName;
        $tpl = $this->getTemplatePath("footer", "footer");
        $tpl->assign("link_about_us", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_ABOUT, $language['id']),""));
        $tpl->assign("link_base_system", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_BASE_SYSTEM, $language['id']),""));
        $tpl->assign("link_education_program", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']),""));
		$tpl->assign("link_study_space", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_STUDY_SPACE, $language['id']),""));
		$tpl->assign("link_communicate_confidently", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_COMMUNICATE_CONFIDENTLY, $language['id']),""));
        $tpl->assign("link_student", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_STUDENT, $language['id']),""));
        $tpl->assign("link_study_abroad", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_STUDY_ABROAD, $language['id']),""));
		$tpl->assign("link_blog", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_BLOG, $language['id']),""));
        $tpl->assign("link_job", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_JOB, $language['id']),""));
        
        // chương trình đào tạo
		$education_program = $this->db->getArray("select * from education_program where status = 1");
		if ($education_program) {
			foreach ($education_program as $item) {
				$tpl->newBlock("education_program");
				$tpl->assign("title", mb_strtoupper($item['title'], 'UTF-8'));
				$tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']), $item['code'], ""));
            }
            
            foreach ($education_program as $item) {
                $tpl->newBlock("form");
                $tpl->assign("title", $item['title']);
            }
		}
        return $tpl -> getOutputContent();
    }
}

?>