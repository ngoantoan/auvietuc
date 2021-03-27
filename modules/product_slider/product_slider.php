<?php
include_once ("modules/ModuleBase.php");
require_once ("includes/class.pager.php");
class product_slider extends ModuleBase {

	public function __construct()
	{
	  parent::ModuleBase();
	}

	function product_slider() {
		parent::ModuleBase();
	}

	function getContent($page_name) {
		$action = $this -> routing -> getAction();
		if (getRequest('action') != null)
			$action = getRequest('action');
		switch($action) {
			// case 'submit' :
			// 	return $this -> viewdetail($page_name);
			// 	break;
			default :
				return $this -> viewlist($page_name);
				break;
		}
	}
	function viewlist($language)
	{
		$tpl = $this->getTemplatePath('product_slider', 'product_slider');
		$product_slider = $this->db->getArray("SELECT p.*, pc.code as ccode FROM products as p INNER JOIN product_category AS pc ON pc.id = p.category_id  WHERE p.status = 1 ORDER BY p.created DESC limit 0,15");
		if ($product_slider) {
			foreach($product_slider as $item) {
				$tpl->newBlock("product_slider");
				$tpl->assign("title", $item["title"]);
				$image = $this->db->getRow("SELECT * FROM images WHERE product_id=? AND status=1", $item['id']);
				$tpl->assign("image", $this->getPath() . $image['path']);
				$tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_PRODUCT, $language['id']), $item['ccode'], $item['code'] . "-" . $item['id']));
			}
		}
		return $tpl->getOutputContent();
	}

} //end class
