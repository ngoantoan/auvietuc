<?php
include_once ("modules/ModuleAdminBase.php");
require_once ("../dao/advisoryDao.php");
class c_advisory extends ModuleAdminBase {
	var $advisoryDao;

	public function __construct()
	{
		parent::baseModule();
		$this->advisoryDao = new advisoryDao();
	}

	function c_advisory() {
		parent::baseModule();
		$this->advisoryDao = new advisoryDao;
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
		$jqg = new jqgridJsonService($this->advisoryDao->getSqlAdmin3($title));
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
        $tpl->assign('action',"?q=advisory&r=update&lang=" .$lang);
		$tpl -> assignGlobal("site_folder", $this -> site_folder);
		$tpl -> assignGlobal("ckfinder_path", $this -> ckfinder_path);
		$tpl -> assignGlobal("folder_lib", $this -> site_folder . '/upload/');
		if ($id > 0) {//case edit
			$arr = $this->advisoryDao->getAdvisory($id);
			if ($arr != NULL) {
				$tpl -> assign("title", htmlspecialchars($arr['title']));
				$tpl->assign("image_path", $arr['image']);
                $tpl->assign("description", $arr['description']);

                if ($arr['status'] == 1) {
                    $tpl -> assign("sactive", 'checked="checked"');
                } else {
                    $tpl -> assign("sunactive", 'checked="checked"');
                }
                $tpl -> assign("oper", 'editdetail');
                $tpl -> assign("id", $arr['id']);
			}
		}else{
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
		$title 			= getRequest('title');
		$image 			= getRequest('image');
		$description 	= getRequest('description');
		$status 		= getRequest('status');
		switch ($oper) {
			case "update_status" :
				$bool=$this->db->Execute("UPDATE advisory SET status=? WHERE id=?", array($status,$id));
				break;
			case "editdetail" :
				$bool = $this->advisoryDao->updateAdvisoryBE($id, $title, $image, addslashes($description), $status);
				break;
			case "add" :
				$bool = $this->advisoryDao->insertAdvisoryBE($title, addslashes($description), $image, $status);
                $bool = true;
				break;
			// case "del" :
			// 	$this->db->Execute("DELETE FROM philosophy WHERE id in ($id)");
			// 	return 1;
			// 	break;
		}
        if($bool) {
           // header("Location: ".$this->site_folder."/myadmin/?q=news_items");
          //  return $this->show($id, "Update successfully.");
//			header("Location: ".$this->site_folder."/myadmin/?q=news_items");
        } else {
            return $this->show($id, "Update Error");
        }
	}

	function make_seo_link($string) {
        $string_replace = trim($string);

        $marTViet = array("??", "??", "???", "???", "??", "??", "???", "???", "???", "???", "???", "??", "???", "???", "???", "???", "???", "??", "??", "???", "???", "???", "??", "???", "???", "???", "???", "???", "??", "??", "???", "???", "??", "??", "??", "???", "???", "??", "??", "???", "???", "???", "???", "???", "??", "???", "???", "???", "???", "???", "??", "??", "???", "???", "??", "??", "???", "???", "???", "???", "???", "???", "??", "???", "???", "???", "??", "??", "??", "???", "???", "??", "??", "???", "???", "???", "???", "???", "??", "???", "???", "???", "???", "???", "??", "??", "???", "???", "???", "??", "???", "???", "???", "???", "???", "??", "??", "???", "???", "??", "??", "??", "???", "???", "??", "??", "???", "???", "???", "???", "???", "??", "???", "???", "???", "???", "???", "??", "??", "???", "???", "??", "??", "???", "???", "???", "???", "???", "???", "??", "???", "???", "???", "??", "?", "'", " ", "/", ",", "#", ".", "???", "???", "%", "--", '"', "'", "(", ")");

        $marKoDau = array("a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "i", "i", "i", "i", "i", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u", "y", "y", "y", "y", "y", "d", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "I", "I", "I", "I", "I", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "U", "U", "U", "U", "U", "U", "U", "U", "U", "U", "U", "Y", "Y", "Y", "Y", "Y", "D", "", "", "-", "", "", "", "-", "", "", "", "", "", "", "", "");
        return strtolower(str_replace($marTViet, $marKoDau, $string_replace));
    }

}// end class
?>
