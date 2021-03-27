<?php
include_once ("modules/ModuleAdminBase.php");
require_once ("../dao/sliderDao.php");
class c_slider extends ModuleAdminBase {
	var $sliderDao;

	public function __construct()
	{
		parent::baseModule();
		$this->sliderDao = new sliderDao();
	}

	function c_slider() {
		parent::baseModule();
		$this->sliderDao = new sliderDao;
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
            "folder_lib" => $this->site_folder . '/upload/',
            "ckfinder_path" => $ckfinder_path));
		return $tpl -> getOutputContent();
	}
	
	function getJsonList() {
		$title = getRequest('title');
		$this -> loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($this->sliderDao->getSqlAdmin3($title));
		echo $jqg -> renderJson("id");
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
        $tpl->assign('action',"?q=slider&r=update&lang=" .$lang);
		$tpl -> assignGlobal("site_folder", $this -> site_folder);
		$tpl -> assignGlobal("ckfinder_path", $this -> ckfinder_path);
		$tpl -> assignGlobal("folder_lib", $this -> site_folder . '/upload/');
		if ($id > 0) {//case edit
			$arr = $this->sliderDao->getslider($id);
			if ($arr != NULL) {
				$tpl -> assign("title", htmlspecialchars($arr['title']));
				$tpl -> assign("link", $arr['link']);
				$tpl -> assign("description", $arr['description']);
				$tpl -> assign("image_path", $arr['image']);
				$tpl -> assign("sort", $arr['sort']);

                if ($arr['status'] == 1) {
                    $tpl -> assign("sactive", 'checked="checked"');
                } else {
                    $tpl -> assign("sunactive", 'checked="checked"');
                }
                $tpl -> assign("oper", 'editdetail');
                $tpl -> assign("id", $arr['id']);
			}
		}else{
            $oFCKeditor = new CKEditor('description', "");
            $tpl -> assign("ck_content", $oFCKeditor->getResourceAfterScript());
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
		$description 	= getRequest('description');
		$image_path 	= getRequest('image');
		$status 		= getRequest('status');
		$sort 			= getRequest('sort');
		$title 			= getRequest('title');
		$link 			= getRequest('link');
		switch ($oper) {
			case "edit" :
				$bool=$this->db->Execute("UPDATE slider SET title=? WHERE id=?", array($title, $id));
				break;
			case "update_status" :
				$bool=$this->db->Execute("UPDATE slider SET status=? WHERE id=?", array($status,$id));
				break;
			case "editdetail" :
				$bool = $this->sliderDao->updatesliderBE($id, $title, $link, addslashes($description), $image_path,  $status, $sort);
				break;
			case "add" :
				$bool = $this->sliderDao->insertsliderBE($title, $link, addslashes($description), $image_path, $status, $sort);
                $bool = true;
				break;
			case "del" :
				$this->db->Execute("DELETE FROM slider WHERE id in ($id)");
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
