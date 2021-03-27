<?php
include_once ("modules/ModuleAdminBase.php");
require_once ("../dao/news_itemsDao.php");
class c_news_items extends ModuleAdminBase {
	var $news_itemsDao;

	public function __construct()
	{
		parent::baseModule();
		$this->news_itemsDao = new news_itemsDao();
	}

	function c_news_items() {
		parent::baseModule();
		$this->news_itemsDao = new news_itemsDao;
	}

	function main() {  
		$q = strval(mosGetParam($_GET, 'r', ''));
		switch ($q) {
			case 'getJsonList' :
				return $this -> getJsonList();
				break;
			case 'update' :
				return $this -> update();
				break;
			case 'show' :
				return $this -> show();
				break;
			default :
				return $this -> showList();
		}
	}

	function showList() {
		$tpl = $this -> getTemplatePath("list");
		global $ckfinder_path;
        $lang = 1;
        if(getRequest('lang')) {
            $lang = getRequest('lang');
		}
		$tpl -> assignGlobal('path', $ckfinder_path);
		$tpl -> assign(Array(
            "folder_lib" => $this -> site_folder . '/upload/',
            "ckfinder_path" => $ckfinder_path));
		return $tpl -> getOutputContent();
	}
	
	function getJsonList() {
		$title = getRequest('title');
		$this -> loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($this->news_itemsDao->getSqlAdmin3($title));
		echo $jqg -> renderJson("id");
	}

	function getSubGridJsonList(){
        $id=getRequest('id');
		$sql = fMakeSqlQuery("SELECT comments.id,username, contents, avatar, comments.created_date, rate, comments.status FROM comments INNER JOIN member on comments.member_id=member.id WHERE news_items_id=".$id);
		$this->loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($sql);
		return $jqg->renderJson();
	}
	
	function show($msg = "", $reload = 0) {
        $id = getRequest("id");
        if($id>0){
		$tpl = $this -> getTemplatePath("edit");
        }else{
            $tpl = $this -> getTemplatePath("add");
		}
		$tpl -> assignGlobal("msg", $msg);
		$lang = getRequest('lang');
        $tpl->assign('action',"?q=news_items&r=update&lang=" .$lang);
		$tpl -> assignGlobal("site_folder", $this -> site_folder);
		$tpl -> assignGlobal("ckfinder_path", $this -> ckfinder_path);
		$tpl -> assignGlobal("folder_lib", $this -> site_folder . '/upload/');
		if ($id > 0) {//case edit
			$arr = $this->news_itemsDao->getnews_items($id);
			if ($arr != NULL) {
                $tpl -> assign("title", htmlspecialchars($arr['title']));
				$tpl -> assign("image_path", $arr['image']);
				$tpl -> assign("description", $arr['description']);
				$tpl -> assign("sort", $arr['sort']);
                $oFCKeditor = new CKEditor('detail', $arr['detail']);
                $tpl -> assign("ck_content", $oFCKeditor -> getResourceAfterScript());

                if ($arr['status'] == 1) {
                    $tpl -> assign("sactive", 'checked="checked"');
                } else {
                    $tpl -> assign("sunactive", 'checked="checked"');
                }
                $tpl -> assign("oper", 'editdetail');
                $tpl -> assign("id", $arr['id']);
			}
		}else{
            $oFCKeditor = new CKEditor('detail', "");
            $tpl -> assign("ck_content", $oFCKeditor -> getResourceAfterScript());
            $tpl -> assign("sactive", 'checked="checked"');
            $tpl -> assign("oper", 'add');
		}

		return $tpl -> getOutputContent();
	}

	function update() {
		global $admin_usess;
		$oper 			= getRequest('oper');
		$id 			= getRequest('id');
		$lang 			= getRequest('lang');
		$detail 		= getRequest('detail');
		$description 	= getRequest('description');
		$image_path 	= getRequest('image');
		$status 		= getRequest('status');
		$sort 		= getRequest('sort');
		$title 			= getRequest('title');
		$code 			= $this->make_seo_link($title);
		$user_id 		= $admin_usess->get('USER')['id'];
		$user_edit 		= $admin_usess->get('USER')['fullname'];
		switch ($oper) {
			case "update_status" :
				$bool=$this->db->Execute("UPDATE news_items SET status=? WHERE id=?", array($status,$id));
				break;
			case "editdetail" :
				$bool = $this->news_itemsDao->updatenews_itemsBE($id, $title, $code, addslashes($description), addslashes($detail), $image_path, $status, $sort);
				break;
			case "add" :
				$bool = $this->news_itemsDao->insertnews_itemsBE($title, $code, addslashes($description), addslashes($detail), $image_path, $status, $sort);
                $bool = true;
				break;
			case "del" :
				$this -> db -> Execute("DELETE FROM news_items WHERE id in ($id)");
				return 1;
				break;
		}
        if($bool) {
           // header("Location: ".$this->site_folder."/myadmin/?q=news_items");
          //  return $this->show($id, "Update successfully.");
//			header("Location: ".$this->site_folder."/myadmin/?q=news_items");
        } else {
            return $this->show($id, "Update Error");
        }
	}

}// end class
?>
