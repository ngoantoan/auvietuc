<?php
include_once("modules/ModuleBase.php");
require_once ("includes/class.pager.php");

class education extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function education()
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
        $keyword = '';
        $keyword = getRequest("keyword");
        $code = "";
        $code = $this->routing->getFullAction();
        if ($keyword != "") {
            $tpl = $this->getTemplatePath('education', 'education_search');
			$tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));
            $tpl->assign("keyword", str_replace("-", " ", $keyword));
            $where = "";
            if ($keyword != "") {
                $key = str_replace('-', ' ', $keyword);
                $where .= " and ( title like '%$key%' or description like '%$key%' or detail like '%$key%')";
            }

            $limit = "6";
            if ($this->getSetting("LIMIT") != "" ) {
                $limit = $this->getSetting("LIMIT");
            }
            $pageNo = 1;
            $pageNo = str_replace('/page/', '', strstr($keyword, '/page/'));
            $page_oto = $this->routing->getPageName();
            $cate_code_lang = GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']);
            $pager = new Pager("SELECT * FROM education_program WHERE status = 1 $where ORDER BY created_at DESC", $limit);
            $rs = $pager->getPageArray($pageNo);
            if ($rs) {
                $tpl->newBlock('PAGING');
                $tpl->assign('paging', $pager->renderNavigateHtmlSearch($cate_code_lang . "?keyword=" . $key, ''));
                foreach ($rs as $item) {
                    $tpl->newBlock("education_search");
                    $tpl->assign("title", $item["title"]);
                    $tpl->assign("description", $item["description"]);
                    $tpl->assign("image", $this->getPath() . $item["image"]);
                    $tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']), $item['code'], ""));
                }
            } else {
                $tpl->newBlock("NOT-FOUND");
            }


        } else if ($code != "") {
            $education_code = $this->routing->getFullParam1();
            // lấy id của chương trình đào tạo
            $education = $this->db->GetRow("select id, title, code, description1 from education_program where code = '$code'");

            if ($education_code != "") { // nếu tồn tại code của tin tức chương trình học
                $tpl = $this->getTemplatePath('education', 'education_detail');
                $tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));
                $tpl->assign("link_education_program", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']),""));
                $new_detail = $this->db->getRow("SELECT * FROM education_blog WHERE code=?", $education_code);
                if ($new_detail) {
                    $tpl->assign("id", $new_detail['id']);
                    $tpl->assign("title", $new_detail['title']);
                    $tpl->assignGlobal("education_title", $education['title']);
                    $tpl->assignGlobal("education_link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']), $education['code'], ""));
                    $tpl->assign("detail", $new_detail['detail']);
                    
                    $maintpl->assignGlobal('website_name', $new_detail['title']);
                	$maintpl->assignGlobal('site_description', $new_detail['description']);
                	// tin mới nhất
                	$news = $this->db->getArray("select * from news_items where status = 1 and id != ? limit 0,4", $new_detail['id']);
                	if ($news) {
                		foreach ($news as $item) {
                			$tpl->newBlock("news");
                			$tpl->assign("title", $item['title']);
                			$tpl->assign("image", $this->getPath() . $item["image"]);
                			$tpl->assign("created_at", date("d/m/Y", strtotime($item["created_at"])));
                        	$tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_BLOG, $language['id']), $item['code'], ""));
                		}
                    }
                    
                    // hiển thị danh sách thẻ tag
                    $tag = $this->db->getArray("select * from tag_education where status = 1");
                    if ($tag) {
                        foreach ($tag as $item) {
                            $tpl->newBlock("tag");
                            $tpl->assign("title", $item['title']);
                            $tpl->assign("link_tag", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']) . "?keyword=" . str_replace(" ", "-", $item['title']), ""));
                        }
                    }

                    // hiển thị comment khóa học
                    $comments = $this->db->getArray("select e.id as id_comment, e.contents, c.* from comments_education as e inner join customer as c on c.id = e.id_customer where status = 1 and e.id_education = ? order by e.created_at desc limit 0,4", $new_detail['id']);
                    if ($comments) {
                        $tpl->assignGlobal("id_comment", $comments[count($comments) - 1]['id_comment']);
                        foreach ($comments as $item) {
                            $tpl->newBlock("comments");
                            $tpl->assign("contents", $item['contents']);
                            $tpl->assign("name", $item['name']);
                            $tpl->assign("created_at", date("d/m/Y",strtotime($item['created_at'])));
                        }
                    }

                    // danh sách khóa học
                    $i = 1;
                    $education_program = $this->db->getArray("select * from education_program where status = 1");
                    if ($education_program) {
                        foreach ($education_program as $item) {
                            $tpl->newBlock("education_program");
                            $tpl->assign("title", $item['title']);
                            $tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']), $item['code'], ""));
                            if ($i < 10) {
                                $tpl->assign("i", '0' . $i);
                            } else {
                                $tpl->assign("i", $i);
                            }
                            $i++;
                        }
                    }
                }
            } else {
                // tin tức trong mỗi chương trình đào tạo
                $tpl = $this->getTemplatePath('education', 'education_blog');
                
                $tpl->assignGlobal("education_title", $education['title']);
                $tpl->assignGlobal("education_description1", $education['description1']);
                $tpl->assignGlobal("link_education_program", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']),""));

                $education_blog_categories = $this->db->getArray("select * from education_blog_categories where status = 1 and education_id = ?", $education['id']);
                if ($education_blog_categories) {
                    $i = 1;
                    // danh mục tin tức chương trình đào tạo
                    foreach ($education_blog_categories as $item) {
                        $tpl->newBlock("education_blog_categories");
                        if ($i == 1) {
                            $tpl->assign("active", 'active');
                        }
                        $i++;
                        $tpl->assign("title", $item['title']);
                        $tpl->assign("code", $item['code']);
                    }

                    // danh sách tin tức của mỗi danh mục
                    $j = 1;
                    foreach ($education_blog_categories as $item) {
                        $tpl->newBlock("categories");
                        if ($j == 1) {
                            $tpl->assign("active", 'active');
                        }
                        $j++;
                        $tpl->assign("code", $item['code']);
                        $education_blog = $this->db->getArray("select * from education_blog where category_id = ? and status = 1", $item['id']);
                        if ($education_blog) {
                            $k = 1;
                            foreach ($education_blog as $b) {
                                $tpl->newBlock("education_blog");
                                $tpl->assign("title", $b['title']);
                                $tpl->assign("description", $b['description']);
                                $tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']), $education['code'], $b['code'], ""));
                                $tpl->assign("k", $k);
                                if ($k == 1) {
                                    $tpl->assign("in", 'in');
                                } else {
                                    $tpl->assign("in", '');
                                }
                                $code = $this->db->getRow("select code from education_blog_categories where status = 1 and id = ?", $b['category_id']);
                                if ($code) {
                                    $tpl->assign("code", $code['code']);
                                }
                                $k++;
                            }
                        }
                    }
                }

                // video trong trang chương trình đào tạo
                $education_video = $this->db->GetRow('select * from education_video where status = 1');
                if ($education_video) {
                    $tpl->assignGlobal("link_video", $education_video['link']);
                    $tpl->assignGlobal("description_video", $education_video['description']);
                }
            }

        } else {
            $tpl = $this->getTemplatePath("education", "education");
            $tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));
            $education_program = $this->db->getArray("select * from education_program where status = 1");
            if ($education_program) {
                foreach ($education_program as $item) {
                    $tpl->newBlock("education_program");
                    $tpl->assign("title", $item['title']);
                    $tpl->assign("title1", $item['title1']);
                    $tpl->assign("description", $item['description']);
                    $tpl->assign("image", $this->getPath() . $item['image']);
                    $tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']), $item['code'], ""));
                }
            }
        }
        return $tpl -> getOutputContent();
    }
}

?>