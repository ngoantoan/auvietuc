<?php
include_once ("modules/ModuleAdminBase.php");
class c_slider_audio extends ModuleAdminBase {
	public function __construct()
	{
		parent::baseModule();
	}

	function main() {  
		$q = strval(mosGetParam($_GET, 'r', ''));
		switch ($q) {
			case 'getJsonListSliderAudioParentCategory':
                return $this->getJsonListSliderAudioParentCategory();
				break;
			case 'updateSliderAudioParentCategory' :
				return $this->updateSliderAudioParentCategory();
				break;
			case 'getSliderAudioCategories':
				return $this -> getSliderAudioCategories();
				break;
			case 'updateSliderAudioCategories':
				return $this -> updateSliderAudioCategories();
				break;
			case 'show' :
				return $this -> show();
				break;
			case 'add' :
				return $this -> add();
				break;
			case 'edit' :
				return $this -> edit();
				break;
			case 'showEditSliderAudio' :
				return $this -> showEditSliderAudio();
				break;
			case 'getSliderAudio' :
				return $this->getSliderAudio();
				break;
			case 'updateSliderAudio' :
				return $this -> updateSliderAudio();
				break;
			default :
				return $this -> showList();
		}
	}

	function showList($msg = "") {
		$tpl = $this -> getTemplatePath("list");
		global $ckfinder_path;
        $lang = 1;
        if(getRequest('lang')) {
            $lang = getRequest('lang');
		}
		$tpl -> assignGlobal('path', $ckfinder_path);
		$tpl -> assign(Array(
            "folder_lib" => $this->site_folder . '/upload/',
			"ckfinder_path" => $ckfinder_path,
			"msg" => $msg));
		return $tpl -> getOutputContent();
	}
	
	function getSliderAudioCategories() {
		$parent_id = getRequest('parent_id');
		$sql = fMakeSqlQuery("SELECT id, title, `status` FROM slider_audio_categories where parent_id = $parent_id");
        $this->loadClass("class.jqgrid_json_service.php");
        $jqg = new jqgridJsonService($sql);
        return $jqg->renderJson("id");
	}

	function updateSliderAudioCategories() {
        $oper 		= getRequest('oper');
		$parent_id 	= getRequest('parent_id');
        $title 		= getRequest('title');
		$code 		= $this->make_seo_link($title);
        $status 	= getRequest('status');
        $id 		= getRequest('id');
        switch ($oper) {
			case "add" :
                $sql = "INSERT INTO slider_audio_categories (`parent_id`, `title`, `code`, `status`)
                        VALUES ('" . $parent_id . "', '" . $title . "', '" . $code . "', '" . $status . "')";

                $bool = $this->db->Execute($sql);
                if ($bool)
                    return '1';
                else
                    return '0';

                break;
            case "edit" :
                $sql = "UPDATE slider_audio_categories SET `title`='$title',`code`='$code',`status`=$status where `id`='" . $id . "'";
                $this->db->Execute($sql);
                break;
			case "del" :
				$slider_audio = $this->db->getArray("select * from slider_audio where category_id = $id");
				if ($slider_audio) {
					return 0;
				} else {
					$this->db->Execute("DELETE FROM slider_audio_categories WHERE id in ($id)");
					return 1;
				}
                break;
        }
    }

	function getSubGridJsonList(){
        $id=getRequest('id');
		$sql = fMakeSqlQuery("SELECT comments.id,username, contents, avatar, comments.created_date, rate, comments.status FROM comments INNER JOIN member on comments.member_id=member.id WHERE news_items_id=".$id);
		$this->loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($sql);
		return $jqg->renderJson();
	}

	function getSliderAudio(){
        $id_category = getRequest('id_category');
		$sql = fMakeSqlQuery("SELECT sl.id as id_onoff, sl.id, sl.title, sl.spelling, sl.description, sl.image, sl.status, sl.created_at FROM slider_audio sl WHERE sl.category_id =" . $id_category);
		$this->loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($sql);
		return $jqg->renderJson();
	}

	function showEditSliderAudio() {
		$id = getRequest("id");
		if ($id > 0) {//case edit
			$arr = $this->db->GetRow("SELECT * FROM slider_audio WHERE id = ?", $id);
			if ($arr != NULL) {
                return json_encode($arr);
			}
		}

	}

	function updateSliderAudio() {
		$oper 			= getRequest('oper');
		$id 			= getRequest('id');
		$title 			= getRequest('title');
		$code 			= $this->make_seo_link($title);
		$spelling 		= getRequest('spelling');
		$image_path 	= getRequest('image');
		$audio_path 	= getRequest('audio');
		$description 	= getRequest('description');
		$status 		= getRequest('status');
		$created_at 	= date("Y-m-d H:i:s");
		switch ($oper) {
			case "update_status" :
				$bool=$this->db->Execute("UPDATE slider_audio SET status=? WHERE id=?", array($status,$id));
				break;
			case "del" :
				$this->db ->Execute("DELETE FROM slider_audio WHERE id in ($id)");
				return 1;
				break;
		}
        if($bool) {
        //    header("Location: ".$this->site_folder."/myadmin/?q=news_items");
        //    return $this->show($id, "Update successfully.");
        } else {
            return $this->show($id, "Update Error");
        }
	}

	function add() {
		$id_category	= getRequest('id_category');
		$title 			= getRequest('title');
		$spelling 		= getRequest('spelling');
		$code 			= $this->make_seo_link($title);
		$image_path 	= getRequest('image');
		$audio_path 	= getRequest('audio');
		$description 	= getRequest('description');
		$status 		= getRequest('status');
		$created_at 	= date("Y-m-d H:i:s");

		$slider_audio = $this->db->Execute("INSERT INTO slider_audio(category_id, title, code, spelling, description, `status`, mp3, image, created_at) 
								VALUES (?,?,?,?,?,?,?,?,?)",
								array($id_category, $title, $code, $spelling, $description, $status, $audio_path, $image_path, $created_at));
		if($slider_audio)
			return header("Location: ".$this->site_folder."/myadmin/?q=slider_audio");
		else
      		return 0;
	}

	function edit() {
		$id 			= getRequest('id_edit');
		$title 			= getRequest('title_edit');
		$spelling 		= getRequest('spelling_edit');
		$code 			= $this->make_seo_link($title);
		$image_path 	= getRequest('image_edit');
		$mp3_path 		= getRequest('mp3_edit');
		$description 	= getRequest('description_edit');
		$status 		= getRequest('status_edit');

		$sql = "UPDATE slider_audio SET title='".$title."',
										code='".$code."',
										spelling='".$spelling."',
										image='".$image_path."',
										mp3='".$mp3_path."',
										description='".$description."',
										status='".$status."' WHERE id=".$id;
		$slider_audio = $this->db->Execute($sql);
		if($slider_audio)
			return header("Location: ".$this->site_folder."/myadmin/?q=slider_audio");
		else
		  	return 0;
	}

	function getJsonListSliderAudioParentCategory() {
        $lang = getRequest('lang');
        $sql = fMakeSqlQuery("SELECT id, title, `status` FROM slider_audio_parent_categories where 1=1");
        $this->loadClass("class.jqgrid_json_service.php");
        $jqg = new jqgridJsonService($sql);
        return $jqg->renderJson();
	}
	
	function updateSliderAudioParentCategory() {
        $oper 	= getRequest('oper');
        $title 	= getRequest('title');
		$code 	= $this->make_seo_link($title);
        $status = getRequest('status');
        $id 	= getRequest('id');
        $lang 	= getRequest('lang');
        switch ($oper) {
			case "add" :
                $sql = "INSERT INTO slider_audio_parent_categories (`title`, `code`, `status`)
                        VALUES ('" . $title . "', '" . $code . "', '" . $status . "')";

                $bool = $this->db->Execute($sql);
                if ($bool)
                    return '1';
                else
                    return '0';

                break;
            case "edit" :
                $sql = "UPDATE slider_audio_parent_categories SET `title`='$title',`code`='$code',`status`=$status where `id`='" . $id . "'";
                $this->db->Execute($sql);
                break;
			case "del" :
				$slider_audio_categories = $this->db->getArray("select * from slider_audio_categories where parent_id = $id");
				if ($slider_audio_categories) {
					return 0;
				} else {
					$this->db->Execute("DELETE FROM slider_audio_parent_categories WHERE id in ($id)");
					return 1;
				}
                break;
        }
    }
}// end class
?>
