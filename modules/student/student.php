<?php
include_once("modules/ModuleBase.php");

class student extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function student()
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
        $tpl = $this->getTemplatePath("student", "student");
        $tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));

        // danh sách categories image
        $student_image_categories = $this->db->getArray("select * from student_image_categories where status = 1");
        if ($student_image_categories) {
            foreach ($student_image_categories as $item) {
                $tpl->newBlock("student_image_categories");
                $tpl->assign("title", $item['title']);
                $tpl->assign("code", $item['code']);
            }
        }

        // danh sách image
        $student_image = $this->db->getArray("select * from student_image where status = 1");
        if ($student_image) {
            foreach ($student_image as $item) {
                $tpl->newBlock("student_image");
                $tpl->assign("title", $item['title']);
                $tpl->assign("image", $this->getPath() . $item['image']);
                $code = $this->db->getRow("select code from student_image_categories where id = ? ", $item['id_category']);
                if ($code) {
                    $tpl->assign("code", $code['code']);
                }
            }
        }
        return $tpl -> getOutputContent();
    }
}

?>