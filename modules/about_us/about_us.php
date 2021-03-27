<?php
include_once ("modules/ModuleBase.php");
require_once ("includes/class.pager.php");
class about_us extends ModuleBase {
	
	public function __construct()
    {
        parent::ModuleBase();
	}
	
	function about_us() {
		parent::ModuleBase();
	}

	/**
	 * Override: Get banner content
	 * @return String
	 * @param object $page_name
	 */
	function getContent($language) {
		$action = $this->routing->getAction();
		if (getRequest('action') != null)
			$action = getRequest('action');
		switch($action) {
			default :
				return $this -> view($language);
				break;
		}
	}

	function view($language) {
		$tpl = $this -> getTemplatePath("about_us", "about_us");
		$tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));
		$about_us = $this->db->getRow('SELECT * FROM about_us');
		if ($about_us) {
			$tpl->assign("title", $about_us['title']);
			$tpl->assign("detail", $about_us['detail']);
		}

		// hiển thị ý kiến
		$opinion = $this->db->getArray("select * from opinion where status = 1 order by created_at desc");
		if ($opinion) {
			foreach ($opinion as $item) {
				$tpl->newBlock("opinion");
				$tpl->assign("title", $item['title']);
				$tpl->assign("name", $item['name']);
				$tpl->assign("image", $this->getPath() . $item['image']);
				$tpl->assign("description", $item['description']);
			}
		}
		return $tpl -> getOutputContent();
    }
}
