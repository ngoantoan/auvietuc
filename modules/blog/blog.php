<?php
include_once ("modules/ModuleBase.php");
require_once ("includes/class.pager.php");
class blog extends ModuleBase {

	public function __construct()
	{
	  parent::ModuleBase();
	}

	function blog() {
		parent::ModuleBase();
	}

	function getContent($page_name) {
		$action = $this->routing->getAction();
		if (getRequest('action') != null)
			$action = getRequest('action');
		switch($action) {
			case 'submit' :
				return $this -> viewdetail($page_name);
				break;
			case 'page' :
			default :
				return $this -> viewlist($page_name);
				break;
		}
	}
	function viewlist($language)
	{
		global $maintpl;
		$code = "";
		$code = $this->routing->getFullAction();
		$keyword = '';
        $keyword = getRequest("keyword");
		if ($keyword != "") {
			$tpl = $this->getTemplatePath('blog', 'blog_search');
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
            $cate_code_lang = GetSpecialPageURL(Constants::PAGE_BLOG, $language['id']);
            $pager = new Pager("SELECT * FROM news_items WHERE status = 1 $where ORDER BY sort ASC", $limit);
            $rs = $pager->getPageArraySort($pageNo);
            if ($rs) {
                $tpl->newBlock('PAGING');
                $tpl->assign('paging', $pager->renderNavigateHtmlSearch($cate_code_lang . "?keyword=" . $key, ''));
                foreach ($rs as $item) {
                    $tpl->newBlock("blog_search");
                    $tpl->assign("title", $item["title"]);
                    $tpl->assign("description", $item["description"]);
                    $tpl->assign("image", $this->getPath() . $item["image"]);
                    $tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_BLOG, $language['id']), $item['code'], ""));
                }
            } else {
                $tpl->newBlock("NOT-FOUND");
            }


        } else if ($code != "") {
			$tpl = $this->getTemplatePath('blog', 'blog_detail');
			$tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));
			$tpl->assign("link_blog", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_BLOG, $language['id']),""));
			$new_detail = $this->db->getRow("SELECT * FROM news_items WHERE code=?", $code);
			if ($new_detail) {
				$tpl->assign("id", $new_detail['id']);
				$tpl->assign("title", $new_detail['title']);
				$tpl->assign("detail", $new_detail['detail']);
                
                $maintpl->assignGlobal('website_name', $new_detail['title']);
				$maintpl->assignGlobal('site_description', $new_detail['title']);
				$maintpl->assignGlobal("IMAGE_LINK", $this->server_url. $this->getPath() . $new_detail['image']);
				// tin mới nhất
				$news = $this->db->getArray("select * from news_items where status = 1 and id != ? ORDER BY sort ASC limit 0,4", $new_detail['id']);
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
                $tag = $this->db->getArray("select * from tag_blog where status = 1");
                if ($tag) {
                    foreach ($tag as $item) {
                        $tpl->newBlock("tag");
						$tpl->assign("title", $item['title']);
						$tpl->assign("link_tag", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_BLOG, $language['id']) . "?keyword=" . str_replace(" ", "-", $item['title']), ""));
                    }
				} 
				
				// hiển thị comment blog
                $comments = $this->db->getArray("select b.id as id_comment, b.contents, c.* from comments_blog as b inner join customer as c on c.id = b.id_customer where status = 1 and b.id_blog = ? order by b.created_at desc limit 0,4", $new_detail['id']);
                if ($comments) {
                    $tpl->assignGlobal("id_comment", $comments[count($comments) - 1]['id_comment']);
                    foreach ($comments as $item) {
                        $tpl->newBlock("comments");
                        $tpl->assign("contents", $item['contents']);
                        $tpl->assign("name", $item['name']);
                        $tpl->assign("created_at", date("d/m/Y",strtotime($item['created_at'])));
                    }
                }
            }

        } else {
			$tpl = $this->getTemplatePath('blog', 'blog');
			$tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));
            $limit = "12";
            if ($this->getSetting("LIMIT") != "" ) {
                $limit = $this->getSetting("LIMIT");
            }
            $pageNo = 1;
            if (getRequest("page") > 0) {
                $pageNo = getRequest("page");
            }
            $tpl->assign("page_num", $limit*$pageNo);
            $tpl->assign("page_num_prev", $limit*($pageNo-1) + 1);
            $cate_code_lang = GetSpecialPageURL(Constants::PAGE_BLOG, $language['id']);
            $pager = new Pager("SELECT * FROM news_items WHERE status = 1 ORDER BY sort ASC", $limit);
            $rs = $pager->getPageArraySort($pageNo);
            if ($rs) {
                $tpl->newBlock('PAGING');
                $tpl->assign('paging', $pager->renderNavigateHtml($cate_code_lang,""));
                foreach ($rs as $item) {
                    $tpl->newBlock("news");
					$tpl->assign("title", $item["title"]);
					if (strlen($item["description"]) > 80 ) {
                        $tpl->assign("description", substr(substr($item["description"], 0, 80), 0, -1) . '...');
					} else {
						$tpl->assign("description", $item["description"]);
					}
					
                    $tpl->assign("image", $this->getPath() . $item["image"]);
                    $tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_BLOG, $language['id']), $item['code'], ""));
                }
            }
		}
		return $tpl->getOutputContent();
	}

} //end class
