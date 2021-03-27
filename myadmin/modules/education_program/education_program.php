<?php
include_once ("modules/ModuleAdminBase.php");
require_once ("../dao/EducationProgramDao.php");
class c_education_program extends ModuleAdminBase {
	var $EducationProgramDao;

	public function __construct()
	{
		parent::baseModule();
		$this->EducationProgramDao = new EducationProgramDao();
	}

	function c_education_program() {
		parent::baseModule();
		$this->EducationProgramDao = new EducationProgramDao;
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
			case 'showBlogEducation' :
				return $this -> showBlogEducation();
				break;
			case 'updateEducationBlog' :
				return $this -> updateEducationBlog();
				break;
			case 'getSubGridJsonList' :
				return $this -> getSubGridJsonList();
				break;
			case 'getEducationCategoryGridJsonList' :
				return $this -> getEducationCategoryGridJsonList();
				break;
			case 'showEducationCategoryBlog' :
				return $this -> showEducationCategoryBlog();
				break;
			case 'updateEducationCategoryBlog' :
				return $this -> updateEducationCategoryBlog();
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
		$jqg = new jqgridJsonService($this->EducationProgramDao->getSqlAdmin3($title));
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
        $tpl->assign('action',"?q=education_program&r=update&lang=" .$lang);
		$tpl -> assignGlobal("site_folder", $this -> site_folder);
		$tpl -> assignGlobal("ckfinder_path", $this -> ckfinder_path);
		$tpl -> assignGlobal("folder_lib", $this -> site_folder . '/upload/');
		if ($id > 0) {//case edit
			$arr = $this->EducationProgramDao->getEducationProgram($id);
			if ($arr != NULL) {
				$tpl -> assign("title", htmlspecialchars($arr['title']));
				$tpl -> assign("title1", htmlspecialchars($arr['title1']));
				$oFCKeditor = new CKEditor('description1', $arr['description1']);
                $tpl->assign("ck_description1", $oFCKeditor->getResourceAfterScript());
				$oFCKeditor = new CKEditor('detail', $arr['detail']);
                $tpl->assign("ck_content", $oFCKeditor->getResourceAfterScript());
                $tpl->assign("description", $arr['description']);
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
			$oFCKeditor = new CKEditor('description1', '');
            $tpl->assign("ck_description1", $oFCKeditor->getResourceAfterScript());
            $oFCKeditor = new CKEditor('detail', '');
            $tpl->assign("ck_content", $oFCKeditor->getResourceAfterScript());
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
		$code 			= $this->make_seo_link($title);
		$title1 		= getRequest('title1');
		$description 	= getRequest('description');
		$description1 	= getRequest('description1');
		$detail 		= getRequest('detail');
		$image_path 	= getRequest('image');
		$status 		= getRequest('status');
		$sort 		= getRequest('sort');
		switch ($oper) {
			case "update_status" :
				$bool=$this->db->Execute("UPDATE education_program SET status=? WHERE id=?", array($status,$id));
				break;
			case "editdetail" :
				$bool = $this->EducationProgramDao->updatesliderBE($id, $title, $title1, $code, addslashes($description), addslashes($description1), addslashes($detail), $image_path, $status, $sort);
				break;
			case "add" :
				$bool = $this->EducationProgramDao->insertsliderBE($title, $title1, $code, addslashes($description), addslashes($description1), addslashes($detail), $image_path, $status, $sort);
                $bool = true;
				break;
			case "del" :
				$this->db->Execute("DELETE FROM education_program WHERE id in ($id)");
				return 1;
				break;
		}
        if($bool) {
           // header("Location: ".$this->site_folder."/myadmin/?q=news_items");
          //  return $this->show($id, "Update successfully.");
		// header("Location: ".$this->site_folder."/myadmin/?q=news_items");
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
	
	function showBlogEducation() {
		$id = getRequest("id");
		$category_id = getRequest("category_id");
        if($id>0){
			$tpl = $this -> getTemplatePath("edit_education_blog");
        }else{
            $tpl = $this -> getTemplatePath("add_education_blog");
		}
		$lang = getRequest('lang');
        $tpl->assign('action',"?q=education_program&r=updateEducationBlog&lang=" .$lang);
		$tpl -> assignGlobal("site_folder", $this -> site_folder);
		$tpl -> assignGlobal("ckfinder_path", $this -> ckfinder_path);
		$tpl -> assignGlobal("folder_lib", $this -> site_folder . '/upload/');
		if ($id > 0) {//case edit
			$arr = $this->EducationProgramDao->getEducationBlog($id);
			if ($arr != NULL) {
				$tpl -> assign("title", htmlspecialchars($arr['title']));
				$oFCKeditor = new CKEditor('detail', $arr['detail']);
                $tpl->assign("ck_content", $oFCKeditor->getResourceAfterScript());
				$tpl->assign("description", $arr['description']);
				$tpl->assign("detail", $arr['detail']);
				
                if ($arr['status'] == 1) {
                    $tpl -> assign("sactive", 'checked="checked"');
                } else {
                    $tpl -> assign("sunactive", 'checked="checked"');
                }
                $tpl -> assign("oper", 'editdetail');
                $tpl -> assign("id", $arr['id']);
			}
		}else{
            $oFCKeditor = new CKEditor('detail', '');
			$tpl->assign("ck_content", $oFCKeditor->getResourceAfterScript());
			$tpl->assign("category_id", $category_id);
            $tpl -> assign("sactive", 'checked="checked"');
            $tpl -> assign("oper", 'add');
		}

		return $tpl -> getOutputContent();
	}

	function updateEducationBlog() {
		$oper 			= getRequest('oper');
		$category_id 	= getRequest('category_id');
		$id 			= getRequest('id');
        $description 	= getRequest('description');
        $detail 		= getRequest('detail');
        $status 		= getRequest('status');
        $title 			= getRequest('title');
		$code 			= $this->make_seo_link($title);
        switch ($oper) {
            // case "update_status" :
            //     $bool = $this->db->Execute("UPDATE advisory_blog SET status=? WHERE id=?", array($status, $id));
            //     if ($bool)
            //         return nl2br(1);
            //     else
            //         return nl2br(0);
            //     break;
            case "editdetail" :
                $bool = $this->EducationProgramDao->updateEducationBlogBE($id, $title, $code, addslashes($description), addslashes($detail), $status);
                if ($bool)
                    return nl2br(1);
                else
                    return nl2br(0);
                break;
            case "add" :
                $bool = $this->EducationProgramDao->insertEducationBlog($category_id, $title, $code, addslashes($description), addslashes($detail), $status);  
                if ($bool)
                    return nl2br(1);
                else
                    return nl2br(0);
                break;
            case "del" :
                $this->db->Execute("DELETE FROM education_blog WHERE id in ($id)");
                header("location: ?q=education_program");
                break;
        }
	}
	
	function getSubGridJsonList() {
		$id = $_REQUEST['category_id'];
		$sql = fMakeSqlQuery("select id,title,description,`status` from education_blog where category_id ='".$id."' " );
		$this->loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($sql);
		return $jqg->renderJson();
	}

	function getEducationCategoryGridJsonList() {
		$id = $_REQUEST['education_id'];
		$sql = fMakeSqlQuery("select id, title,`status` from education_blog_categories where education_id ='".$id."' " );
		$this->loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($sql);
		return $jqg->renderJson();
	}

	function showEducationCategoryBlog() {
		$id = getRequest("id");
		$education_id = getRequest("education_id");
        if($id>0){
			$tpl = $this -> getTemplatePath("edit_education_category_blog");
        }else{
            $tpl = $this -> getTemplatePath("add_education_category_blog");
		}
		$lang = getRequest('lang');
        $tpl->assign('action',"?q=education_program&r=updateEducationCategoryBlog&lang=" .$lang);
		$tpl -> assignGlobal("site_folder", $this -> site_folder);
		$tpl -> assignGlobal("ckfinder_path", $this -> ckfinder_path);
		$tpl -> assignGlobal("folder_lib", $this -> site_folder . '/upload/');
		if ($id > 0) {//case edit
			$arr = $this->EducationProgramDao->getEducationCategoryBlog($id);
			if ($arr != NULL) {
				$tpl -> assign("title", htmlspecialchars($arr['title']));
				$tpl->assign("education_id", $arr['education_id']);
                if ($arr['status'] == 1) {
                    $tpl -> assign("sactive", 'checked="checked"');
                } else {
                    $tpl -> assign("sunactive", 'checked="checked"');
                }
                $tpl -> assign("oper", 'editdetail');
                $tpl -> assign("id", $arr['id']);
			}
		}else{
			$tpl -> assign("education_id", $education_id);
            $tpl -> assign("sactive", 'checked="checked"');
            $tpl -> assign("oper", 'add');
		}

		return $tpl -> getOutputContent();
	}

	function updateEducationCategoryBlog() {
        $oper 			= getRequest('oper');
		$id 			= getRequest('id');
		$education_id 	= getRequest('education_id');
        $status 		= getRequest('status');
        $title 			= getRequest('title');
		$code 			= $this->make_seo_link($title);
        switch ($oper) {
            // case "update_status" :
            //     $bool = $this->db->Execute("UPDATE advisory_blog SET status=? WHERE id=?", array($status, $id));
            //     if ($bool)
            //         return nl2br(1);
            //     else
            //         return nl2br(0);
            //     break;
            case "editdetail" :
                $bool = $this->EducationProgramDao->updateEducatioCategorynBlogBE($id, $title, $code, $status);
                if ($bool)
                    return nl2br(1);
                else
                    return nl2br(0);
                break;
            case "add" :
                $bool = $this->EducationProgramDao->insertEducationCategoryBlog($education_id, $title, $code, $status);  
                if ($bool)
                    return nl2br(1);
                else
                    return nl2br(0);
                break;
			case "del" :
				$education_blog = $this->db->getArray("select * from education_blog where category_id = $id");
				if ($education_blog) {
					return 0;
				} else {
					$this->db->Execute("DELETE FROM education_blog_categories WHERE id in ($id)");
					return 1;
				}
                break;
        }
	}

}// end class
?>
