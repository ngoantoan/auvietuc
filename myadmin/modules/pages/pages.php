<?php 
// ensure this file is being included by a parent file
defined('_VALID_MOS') or die('Restricted access');
include_once ("modules/ModuleAdminBase.php");
require_once ("../dao/PagesDao.php");
class c_pages extends ModuleAdminBase {
	var $pagesDao;
	public function __construct()
	{
		parent::baseModule();
		$this->pagesDao = new PagesDao;
	}
	
    function c_pages() {
        parent::baseModule();
		$this->pagesDao = new PagesDao;
    }
    
    function main() {
		
        $action = strval(mosGetParam($_GET, 'r', ''));
        switch ($action) {
			case 'update':
                return $this->update();
                break;
			case 'updatePageLang':
                return $this->updatePageLang();
                break;
			case 'getJsonList'://Page
				 return $this->getJsonList();
				 break;
			case 'getSubGridJsonList'://Page with language
				 return $this->getSubGridJsonList();
				 break;
            default:
                return $this->ShowPagesList();
				break;
        }
		
    }

    function ShowPagesList() {
        $tpl = $this->getTemplatePath("pages_list");
        $tpl->assign('languages',$this->generateList("npt_languages", 'id', 'description'));
        return $tpl->getOutputContent();
    }
	
	/**
	 * 
	 * @return 
	 */
	function update(){
		$code		= getRequest('code');
		$html_file	= getRequest('html_file');
		$pages_id	= getRequest('id');
		$oper 		= getRequest('oper');
        // $this->db->debug = true;
		switch ($oper){
			case "edit":
				$this->pagesDao->update($pages_id, $code, $html_file);
				break;
			case "add":
				$this->pagesDao->insert($code, $html_file);
				break;
			case "del":
				$this->pagesDao->delete($pages_id);
				break;				
		}
	}
	

	function updatePageLang(){
		$id	= getRequest('id');
		$page=getRequest('pages_id');
		$pages_description	= getRequest('pages_description');
		$pages_title	= getRequest('pages_title');
		$seo_description	= getRequest('seo_description');
		$seo_keyword	= getRequest('seo_keyword');
		$seo_title	= getRequest('seo_title');
		$lang=getRequest('lang');
		$oper = getRequest('oper');
        //$this->db->debug = true;
		switch ($oper){
			case "add":				
				$this->pagesDao->InsertPageLang($page,$lang, $pages_title, $pages_description, $seo_title, $seo_keyword, $seo_description);
				break;
			case "edit":
				$this->pagesDao->updatePageLang($id,$lang, $pages_title, $pages_description, $seo_title, $seo_keyword, $seo_description);
				break;
			case"del":
			    $this->db->Execute("DELETE FROM npt_pages_attributes  WHERE id=$id");
		}	
	}
	

	function getJsonList(){
		$this->loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($this->pagesDao->getSqlList());
		return $jqg->renderJson();
	}
	

	function getSubGridJsonList(){
        //$this->db->debug = true;
		$pages_id = $_REQUEST['id'];
		$this->loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($this->pagesDao->getSqlPageLangListByPageId($pages_id));
		return $jqg->renderJson();
	}
}
?>
