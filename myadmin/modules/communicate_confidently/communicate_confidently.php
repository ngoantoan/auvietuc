<?php
include_once ("modules/ModuleAdminBase.php");
require_once ("../dao/communicate_confidentlyDao.php");
class c_communicate_confidently extends ModuleAdminBase {
	var $communicate_confidentlyDao;

	public function __construct()
	{
		parent::baseModule();
		$this->communicate_confidentlyDao = new communicate_confidentlyDao();
	}

	function c_communicate_confidently() {
		parent::baseModule();
		$this->communicate_confidentlyDao = new communicate_confidentlyDao;
	}

	function main() {  
		$q = strval(mosGetParam($_GET, 'r', ''));
		switch ($q) {
			case 'getJsonListCategory' :
                return $this->getJsonListCategory();
				break;
			case 'updateCategory' :
				return $this->updateCategory();
				break;
			case 'getJsonList' :
				return $this -> getJsonList();
				break;
			case 'update' :
				return $this -> update();
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
			case 'showEdit' :
				return $this -> showEdit();
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
	
	function getJsonList() {
		$title = getRequest('title');
		$id_category = getRequest('id_category');
		$this -> loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($this->communicate_confidentlyDao->getSqlAdmin3($title,$id_category));
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
        $tpl->assign('action',"?q=communicate_confidently&r=update&lang=" .$lang);
		$tpl -> assignGlobal("site_folder", $this -> site_folder);
		$tpl -> assignGlobal("ckfinder_path", $this -> ckfinder_path);
		$tpl -> assignGlobal("folder_lib", $this -> site_folder . '/upload/');
		if ($id > 0) {//case edit
			$arr = $this->communicate_confidentlyDao->getCommunicate_Confidently($id);
			if ($arr != NULL) {
                $tpl -> assign("title", htmlspecialchars($arr['title']));
				$tpl -> assign("image_path", $arr['image']);
				$tpl -> assign("video_path", $arr['video']);

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

	function showEdit() {
		$id = getRequest("id");
		if ($id > 0) {//case edit
			$arr = $this->communicate_confidentlyDao->getCommunicate_Confidently($id);
			if ($arr != NULL) {
                return json_encode($arr);
			}
		}

	}

	function update() {
		global $admin_usess;
		$oper 			= getRequest('oper');
		$id 			= getRequest('id');
		$lang 			= getRequest('lang');
		$image_path 	= getRequest('image');
		$video_path 	= getRequest('video');
		$status 		= getRequest('status');
		$title 			= getRequest('title');
		$code 			= $this->make_seo_link($title);
		$user_id 		= $admin_usess->get('USER')['id'];
		$user_edit 		= $admin_usess->get('USER')['fullname'];
		$video_upload = $this->db->getRow("select video_upload from communicate_confidently where id = " . $id);
		switch ($oper) {
			case "update_status" :
				$bool=$this->db->Execute("UPDATE communicate_confidently SET status=? WHERE id=?", array($status,$id));
				break;
			case "editdetail" :
				$bool = $this->communicate_confidentlyDao->updateCommunicate_ConfidentlyBE($id, $title, $image_path, $video_path, $status);
				break;
			case "add" :
				$bool = $this->communicate_confidentlyDao->insertCommunicate_ConfidentlyBE($title, $image_path, $video_path, $status);
                $bool = true;
				break;
			case "del" :
				if ($video_upload['video_upload'] !== "") {
					$link = $_SERVER['DOCUMENT_ROOT'] . '/upload/videos/' . $video_upload['video_upload'];
					unlink($link);
				}
				$this->db ->Execute("DELETE FROM communicate_confidently WHERE id in ($id)");
				return 1;
				break;
		}
        if($bool) {
           // header("Location: ".$this->site_folder."/myadmin/?q=news_items");
          //  return $this->show($id, "Update successfully.");
        } else {
            return $this->show($id, "Update Error");
        }
	}

	function add() {
		$id_category	= getRequest('id_category');
		$image_path 	= getRequest('image');
		$video_path 	= getRequest('video');
		$video_upload 	= getRequest('video_upload');
		$status 		= getRequest('status');
		$title 			= getRequest('title');

		if ($title == "" || $image_path == "") {
			return header("Location: ".$this->site_folder."/myadmin/?q=communicate_confidently");
		}

		if ($video_path !== "") {
			$bool = $this->communicate_confidentlyDao->insertCommunicate_ConfidentlyBE($id_category ,$title, $image_path, $video_path, $status);
			// if ($bool) {
			// 	return $this->showList('1');
			// } else {
			// 	return $this->showList('0');
			// }
			return header("Location: ".$this->site_folder."/myadmin/?q=communicate_confidently");
		} else {
			// $name = $_FILES['file']['name'];
			// $tmp_name = $_FILES['file']['tmp_name'];
			// $position = strpos($name, ".");
			// $fileextension= substr($name, $position + 1);
			// $fileextension= strtolower($fileextension);
			// if (isset($name)) {
			// 	$path = $_SERVER['DOCUMENT_ROOT'] . '/upload/videos/';
			// 	if (!empty($name)) {
			// 		if (($fileextension !== "mp4")) {
			// 			return $this->showList('Vui lòng chọn tệp .mp4');
			// 		} else if (($fileextension == "mp4")) {

			// 			// upload video
			// 			if (move_uploaded_file($tmp_name, $path.$name)) {
			// 				$bool = $this->communicate_confidentlyDao->insertCommunicate_Confidently_UploadVideoBE($title, $image_path, $name, $status);
			// 				if ($bool) {
			// 					return $this->showList('1');
			// 				} else {
			// 					return $this->showList('0');
			// 				}
			// 			} else {
			// 				return $this->showList('5');
			// 			}
			// 		}
			// 	}
			// }
			

			// upload video từ filezilla
			$bool = $this->communicate_confidentlyDao->insertCommunicate_Confidently_UploadVideoBE($id_category ,$title, $image_path, $video_upload, $status);
			// if ($bool) {
			// 	return $this->showList('1');
			// } else {
			// 	return $this->showList('0');
			// }
			return header("Location: ".$this->site_folder."/myadmin/?q=communicate_confidently");
		}
	}

	function edit() {
		$id 	= getRequest('id_edit');
		$image_path 		= getRequest('image_edit');
		$video_path 		= getRequest('video_edit');
		$video_upload_edit	= getRequest('video_upload_edit');
		$status 			= getRequest('status_edit');
		$title 				= getRequest('title_edit');

		if ($video_path !== "") {
			$video_upload = $this->db->getRow("select video_upload from communicate_confidently where id = " . $id);
			$bool = $this->communicate_confidentlyDao->updateCommunicate_ConfidentlyBE($id, $title, $image_path, $video_path, $status);
			if ($bool) {
				if ($video_upload['video_upload'] !== "") {
					$link = $_SERVER['DOCUMENT_ROOT'] . '/upload/videos/' . $video_upload['video_upload'];
					unlink($link);
				}
				return $this->showList('3');
			} else {
				return $this->showList('4');
			}
		} else {
			// $name = $_FILES['file_edit']['name'];
			// $tmp_name = $_FILES['file_edit']['tmp_name'];
			// $position = strpos($name, ".");
			// $fileextension= substr($name, $position + 1);
			// $fileextension= strtolower($fileextension);

			// $video_upload = $this->db->getRow("select video_upload from communicate_confidently where id = " . $id);
			// if (isset($name)) {
			// 	$path = $_SERVER['DOCUMENT_ROOT'] . '/upload/videos/';
			// 	if (!empty($name)) {
			// 		if (($fileextension !== "mp4")) {
			// 			return $this->showList('Vui lòng chọn tệp .mp4');
			// 		} else if (($fileextension == "mp4")) {
			// 			if (move_uploaded_file($tmp_name, $path.$name)) {
			// 				// upload video
			// 				$bool = $this->communicate_confidentlyDao->updateCommunicate_Confidently_UploadVideoBE($id, $title, $image_path, $name, $status);
			// 				if ($bool) {
			// 					if ($video_upload['video_upload'] !== "") {
			// 						$link = $_SERVER['DOCUMENT_ROOT'] . '/upload/videos/' . $video_upload['video_upload'];
			// 						unlink($link);
			// 					}
			// 					return $this->showList('3');
			// 				} else {
			// 					return $this->showList('4');
			// 				}
			// 			} else {
			// 				return $this->showList('5');
			// 			}
			// 		}
			// 	} else {
			// 		if ($video_upload) {
			// 			$bool = $this->communicate_confidentlyDao->updateCommunicate_Confidently_NullBE($id, $title, $image_path, $status);
			// 			if ($bool) {
			// 				return $this->showList('3');
			// 			} else {
			// 				return $this->showList('4');
			// 			}
			// 		} else {
			// 			return $this->showList('6');
			// 		}
			// 	}
			// }
			// upload video từ filezilla
			$bool = $this->communicate_confidentlyDao->updateCommunicate_Confidently_UploadVideoBE($id, $title, $image_path, $video_upload_edit, $status);
			if ($bool) {
				return $this->showList('3');
			} else {
				return $this->showList('4');
			}
		}
	}

	function getJsonListCategory() {
        $lang = getRequest('lang');
        $sql = fMakeSqlQuery("SELECT id, title, `status` FROM communicate_confidently_categories where 1=1");
        $this->loadClass("class.jqgrid_json_service.php");
        $jqg = new jqgridJsonService($sql);
        return $jqg->renderJson();
	}
	
	function updateCategory() {
        $oper = getRequest('oper');
        $title = getRequest('title');
        $status = getRequest('status');
        $id = getRequest('id');
        $code = $this->make_seo_link($title);
        $lang = getRequest('lang');
        switch ($oper) {
			case "add" :
                $sql = "INSERT INTO communicate_confidently_categories (`title`, `code`, `status`)
                        VALUES ('" . $title . "', '" . $code . "', '" . $status . "')";

                $bool = $this->db->Execute($sql);
                if ($bool)
                    return '1';
                else
                    return '0';

                break;
            case "edit" :
                $sql = "UPDATE communicate_confidently_categories SET `title`='$title',`code`='$code',`status`=$status where `id`='" . $id . "'";
                $this->db->Execute($sql);
                break;
			case "del" :
				$communicate_confidently = $this->db->getArray("select * from communicate_confidently where id_category = $id");
				if ($communicate_confidently) {
					return 0;
				} else {
					$this->db->Execute("DELETE FROM communicate_confidently_categories WHERE id in ($id)");
					return 1;
				}
                break;
        }
    }
}// end class
?>
