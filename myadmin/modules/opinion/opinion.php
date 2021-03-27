<?php
include_once ("modules/ModuleAdminBase.php");
require_once ("../dao/opinionDao.php");
class c_opinion extends ModuleAdminBase {
	var $opinionDao;

	public function __construct()
	{
		parent::baseModule();
		$this->opinionDao = new opinionDao();
	}

	function c_opinion() {
		parent::baseModule();
		$this->opinionDao = new opinionDao;
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
		$jqg = new jqgridJsonService($this->opinionDao->getSqlAdmin3($title));
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
        $tpl->assign('action',"?q=opinion&r=update&lang=" .$lang);
		$tpl -> assignGlobal("site_folder", $this -> site_folder);
		$tpl -> assignGlobal("ckfinder_path", $this -> ckfinder_path);
		$tpl -> assignGlobal("folder_lib", $this -> site_folder . '/upload/');
		if ($id > 0) {//case edit
			$arr = $this->opinionDao->getAdvisory($id);
			if ($arr != NULL) {
				$tpl -> assign("title", htmlspecialchars($arr['title']));
				$tpl -> assign("name", htmlspecialchars($arr['name']));
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
		$name 			= getRequest('name');
		$image 			= getRequest('image');
		$description 	= getRequest('description');
		$status 		= getRequest('status');
		switch ($oper) {
			case "update_status" :
				$bool=$this->db->Execute("UPDATE opinion SET status=? WHERE id=?", array($status,$id));
				break;
			case "editdetail" :
				$bool = $this->opinionDao->updateOpinionBE($id, $title, $name, $image, addslashes($description), $status);
				break;
			case "add" :
				$bool = $this->opinionDao->insertOpinionBE($title, $name, addslashes($description), $image, $status);
                $bool = true;
				break;
			case "del" :
				$this->db->Execute("DELETE FROM opinion WHERE id in ($id)");
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

	function make_seo_link($string) {
        $string_replace = trim($string);

        $marTViet = array("à", "á", "ạ", "ả", "ã", "â", "ầ", "ấ", "ậ", "ẩ", "ẫ", "ă", "ằ", "ắ", "ặ", "ẳ", "ẵ", "è", "é", "ẹ", "ẻ", "ẽ", "ê", "ề", "ế", "ệ", "ể", "ễ", "ì", "í", "ị", "ỉ", "ĩ", "ò", "ó", "ọ", "ỏ", "õ", "ô", "ồ", "ố", "ộ", "ổ", "ỗ", "ơ", "ờ", "ớ", "ợ", "ở", "ỡ", "ù", "ú", "ụ", "ủ", "ũ", "ư", "ừ", "ứ", "ự", "ử", "ữ", "ỳ", "ý", "ỵ", "ỷ", "ỹ", "đ", "À", "Á", "Ạ", "Ả", "Ã", "Â", "Ầ", "Ấ", "Ậ", "Ẩ", "Ẫ", "Ă", "Ằ", "Ắ", "Ặ", "Ẳ", "Ẵ", "È", "É", "Ẹ", "Ẻ", "Ẽ", "Ê", "Ề", "Ế", "Ệ", "Ể", "Ễ", "Ì", "Í", "Ị", "Ỉ", "Ĩ", "Ò", "Ó", "Ọ", "Ỏ", "Õ", "Ô", "Ồ", "Ố", "Ộ", "Ổ", "Ỗ", "Ơ", "Ờ", "Ớ", "Ợ", "Ở", "Ỡ", "Ù", "Ú", "Ụ", "Ủ", "Ũ", "Ư", "Ừ", "Ứ", "Ự", "Ử", "Ữ", "Ỳ", "Ý", "Ỵ", "Ỷ", "Ỹ", "Đ", "?", "'", " ", "/", ",", "#", ".", "“", "”", "%", "--", '"', "'", "(", ")");

        $marKoDau = array("a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "i", "i", "i", "i", "i", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u", "y", "y", "y", "y", "y", "d", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "I", "I", "I", "I", "I", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "U", "U", "U", "U", "U", "U", "U", "U", "U", "U", "U", "Y", "Y", "Y", "Y", "Y", "D", "", "", "-", "", "", "", "-", "", "", "", "", "", "", "", "");
        return strtolower(str_replace($marTViet, $marKoDau, $string_replace));
    }

}// end class
?>
