<?php
include_once ("modules/ModuleAdminBase.php");
require_once ("../dao/jobDao.php");
class c_job extends ModuleAdminBase {
	var $jobDao;

	public function __construct()
	{
		parent::baseModule();
		$this->jobDao = new jobDao();
	}

	function c_job() {
		parent::baseModule();
		$this->jobDao = new jobDao;
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
		$jqg = new jqgridJsonService($this->jobDao->getSqlAdmin3($title));
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
        $tpl->assign('action',"?q=job&r=update&lang=" .$lang);
		$tpl -> assignGlobal("site_folder", $this -> site_folder);
		$tpl -> assignGlobal("ckfinder_path", $this -> ckfinder_path);
		$tpl -> assignGlobal("folder_lib", $this -> site_folder . '/upload/');
		if ($id > 0) {//case edit
			$arr = $this->jobDao->getnews_items($id);
			if ($arr != NULL) {
                $tpl -> assign("title", htmlspecialchars($arr['title']));
                $oFCKeditor = new CKEditor('detail', $arr['detail']);
                $tpl -> assign("ck_content", $oFCKeditor -> getResourceAfterScript());
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
		$title 			= getRequest('title');
		$user_id 		= $admin_usess->get('USER')['id'];
		$user_edit 		= $admin_usess->get('USER')['fullname'];
		switch ($oper) {
			case "update_status" :
				$bool=$this->db->Execute("UPDATE job SET status=? WHERE id=?", array($status,$id));
				break;
			case "editdetail" :
				$bool = $this->jobDao->updateJobBE($id, $title, addslashes($detail));
				break;
			case "add" :
				$bool = $this->jobDao->insertJobBE($title, addslashes($detail));
                $bool = true;
				break;
			case "del" :
				$this -> db -> Execute("DELETE FROM job WHERE id in ($id)");
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
