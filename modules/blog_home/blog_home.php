<?php
include_once("modules/ModuleBase.php");

class blog_home extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function blog_home()
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
        $tpl = $this->getTemplatePath("blog_home", "blog_home");
        $tpl->assign("link_blog", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_BLOG, $language['id']),""));
        $blogs = $this->db->getArray("select * from news_items where status = 1 order by sort asc limit 0,6");
        if ($blogs) {
            foreach ($blogs as $item) {
                $tpl->newBlock("blogs");
                $tpl->assign("title", $item['title']);
                $tpl->assign("description", substr(substr($item["description"], 0, 80), 0, -1) . '...');
                $tpl->assign("created_at", date("d/m/Y", strtotime($item['created_at'])));
                $tpl->assign("image", $this->getPath() . $item['image']);
                $tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_BLOG, $language['id']), $item['code'], ""));
            }
        }
        return $tpl -> getOutputContent();
    }
}

?>