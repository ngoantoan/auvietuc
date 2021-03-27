<?php
include_once("modules/ModuleBase.php");

class advisory extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function advisory()
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
        global $maintpl;
        $code = "";
        $code = $this->routing->getFullAction();
        if ($code != "") {
            $tpl = $this->getTemplatePath("advisory", "advisory_detail");
            $tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));
			$tpl->assign("link_study_abroad", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_STUDY_ABROAD, $language['id']),""));
            $advisory_blog = $this->db->getRow("SELECT * FROM advisory_blog WHERE code=?", $code);
			if ($advisory_blog) {
				$tpl->assign("id", $advisory_blog['id']);
				$tpl->assign("title", $advisory_blog['title']);
				$tpl->assign("detail", $advisory_blog['detail']);
                
                $maintpl->assignGlobal('website_name', $advisory_blog['title']);
				$maintpl->assignGlobal('site_description', $advisory_blog['title']);
            }

            // tin mới nhất
            // $news = $this->db->getArray("select * from news_items where status = 1 limit 0,4");
            // if ($news) {
            //     foreach ($news as $item) {
            //         $tpl->newBlock("news");
            //         $tpl->assign("title", $item['title']);
            //         $tpl->assign("image", $this->getPath() . $item["image"]);
            //         $tpl->assign("created_at", date("d/m/Y", strtotime($item["created_at"])));
            //         $tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_BLOG, $language['id']), $item['code'], ""));
            //     }
            // }

        } else {
            $tpl = $this->getTemplatePath("advisory", "advisory");
            $tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));
            // danh sách quốc gia
            $country = $this->db->getArray("select * from country where status = 1");
            if ($country) {
                foreach ($country as $item) {
                    $tpl->newBlock("country");
                    $tpl->assign("title", $item['title']);
                }
            }

            
            $advisory_blog_categories = $this->db->getArray("select * from advisory_blog_categories where status = 1");
            if ($advisory_blog_categories) {
                $i = 1;
                // danh mục blog du học
                foreach ($advisory_blog_categories as $item) {
                    $tpl->newBlock("advisory_blog_categories");
                    if ($i == 1) {
                        $tpl->assign("active", 'active');
                    }
                    $i++;
                    $tpl->assign("title", $item['title']);
                    $tpl->assign("code", $item['code']);
                }

                $j = 1;
                // danh sachs blog du học
                foreach ($advisory_blog_categories as $item) {
                    $tpl->newBlock("categories");
                    if ($j == 1) {
                        $tpl->assign("active", 'active');
                    }
                    $j++;
                    $tpl->assign("code", $item['code']);
                    $advisory_blog = $this->db->getArray("select * from advisory_blog where category_id = ? and status = 1", $item['id']);
                    if ($advisory_blog) {
                        $k = 1;
                        foreach ($advisory_blog as $b) {
                            $tpl->newBlock("advisory_blog");
                            $tpl->assign("title", $b['title']);
                            $tpl->assign("description", $b['description']);
                            $tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_STUDY_ABROAD, $language['id']), $b['code'], ""));
                            $tpl->assign("k", $k);
                            if ($k == 1) {
                                $tpl->assign("in", 'in');
                            } else {
                                $tpl->assign("in", '');
                            }
                            $code = $this->db->getRow("select code from advisory_blog_categories where status = 1 and id = ?", $b['category_id']);
                            if ($code) {
                                $tpl->assign("code", $code['code']);
                            }
                            $k++;
                        }
                    }
                }
            }
        }
        
        return $tpl -> getOutputContent();
    }
}

?>