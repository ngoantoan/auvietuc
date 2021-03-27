<?php

include_once ("modules/ModuleAdminBase.php");
/**
 * Class common categories
 */
class c_banner extends ModuleAdminBase
{
	public function __construct()
	{
		parent::baseModule();
	}
	
    function c_banner()
    {
        parent::baseModule();
    }
	
	function main() {
        $q = strval(mosGetParam($_GET, 'r', ''));		
        switch ($q) {
			case 'getJsonList':
				 return $this->getJsonList();
				 break;
			case 'getSubGridJsonList':
				 return $this->getSubGridJsonList();
				 break;
			case 'getSubGridJsonList2':
				return $this->getSubGridJsonList2();
				break;
			case 'EditDescription':
				 return $this->EditDescription();
				 break;
			case 'updateBannerCate':
				 return $this->updateBannerCate();
				 break;
			case 'updateBanner':
				 return $this->updateBanner();
				 break;
			case 'updateBanner2':
				return $this->updateBanner2();
				break;
            default:
                return $this->showList();
				break;
        }
    }
	function EditDescription(){
		$tpl = $this->getTemplatePath("banner_update");
		$id = getRequest('id');
		global $admin_usess;    
		$sql="select * from banner where id='".$id."'";
		$arr=$this->db->Execute(fMakeSqlQuery($sql));
		$tpl->assign("id", $arr->fields['id']);		
		$oFCKeditor = new CKEditor('description', $arr->fields['description']);
		$tpl->assign("ck_description", $oFCKeditor->getResource());
		$status="EditDescription";
		$tpl->assignGlobal("action",'?q=banner&r=updateBanner');
		$tpl->assign('oper',$status);
		return $tpl->getOutputContent();
	}
	function showList(){
        $tpl = $this->getTemplatePath('banner');
		global $ckfinder_path;
		$tpl->assign('folder_lib',$this->site_folder.'/upload/');
		$tpl->assign('ckfinder_path',$ckfinder_path);
		return $tpl->getOutputContent();
	}
	function getSubGridJsonList2(){
		$id = $_REQUEST['id'];
		$lang=getRequest("lang");
		$sql = fMakeSqlQuery("select id,title,description,link,image,`status`,`order` from banner where categories_id ='".$id."' and lang='".$lang."' " );
		$this->loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($sql);
		return $jqg->renderJson();
	}
	function getSubGridJsonList(){
		$id = $_REQUEST['id'];
		$lang=getRequest("lang");
		$sql = fMakeSqlQuery("select id,title,description,link,image,`status`,`order` from banner where categories_id ='".$id."' and lang='".$lang."' " );
		$this->loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($sql);
		return $jqg->renderJson();
	}
	function getJsonList(){
		$lang=getRequest("lang");
		$sql = fMakeSqlQuery("select id, title, `status`, `order` from banner_categories");
		$this->loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($sql);
		return $jqg->renderJson();
	}
	function updateBannerCate(){
		$id = getRequest('id');
		$oper = getRequest('oper');
		$order = getRequest('order');	
		$status = getRequest('status');
		$title = getRequest('title');
		$lang=getRequest("lang");
		switch ($oper){
			case "edit":
				$sql = "UPDATE banner_categories SET `title`='".$title."', `status`='".$status."', `order`='".$order."' where `id`='".$id."'";
				$this->db->Execute($sql);
				break;
			case "add":
				 $sql = "INSERT INTO banner_categories(title,`status`, `order`, lang)
				 		 VALUES ('".$title."', ".$status.", ".$order.", ".$lang.")";
				$this->db->Execute($sql);
				break;
			case "del":	
			
				$arr = explode(",",getRequest("id"));
				if(count($arr)){
					foreach ($arr as $key => $value) {
						$sql = "select count(*) from banner where categories_id = $value";
						if($this->db->GetOne($sql)>0){
							$sql = "select title from banner_categories where id = $value";							
							return "Bạn chưa xóa các banner trong danh mục ". $this->db->GetOne($sql); 
						}
						else{
							$sql ="delete from banner_categories where id = $value";
							$this->db->Execute($sql);
						}
							
					}
				}
				return 1;
				break;
		}
	}
	function updateBanner(){		
		$id = isset($_REQUEST['id'])?$_REQUEST['id']:"NULL";
		$oper = getRequest('oper');
		$image = getRequest('image');
		$title = getRequest('title');
		$des = getRequest('description');
		$link = getRequest('link');
		$order = getRequest('order');
		$status = getRequest('status');
		$cate_id = getRequest('cate_id');
		$description=getRequest('description');
		$code = date("dmYHis");
		$lang=getRequest("lang");
		switch ($oper){
			case "EditDescription":
				$sql = "UPDATE banner SET description='".$description."' WHERE `id`=".$id."";
				$this->db->Execute($sql);
				break;
			case "edit":
				$sql = "UPDATE banner SET `image`='".$image."',`title`='".$title."',`description`='".$des."', link='".$link."',
							 `status`=".$status.", `order`=".$order." WHERE `id`=".$id."";
				$this->db->Execute($sql);
				break;
			case "add":
				$sql = "INSERT INTO banner(categories_id,title,description, image, link,`status`,`order`, lang)
						VALUES (".$cate_id.", '".$title."', '".$des."', '".$image."', '".$link."', ".$status.", ".$order.", ".$lang.")";
				$this->db->Execute($sql);
				break;
			case "del":
				$sql = "delete from banner where id in ($id)";
				$this->db->Execute($sql);
				break;
		}
	}
	function updateBanner2(){
		$id = isset($_REQUEST['id'])?$_REQUEST['id']:"NULL";
		$oper = getRequest('oper');
		$image = getRequest('image');
		$title = getRequest('title');
		$des = getRequest('description');
		$link = getRequest('link');
		$order = getRequest('order');
		$status = getRequest('status');
		$cate_id = getRequest('cate_id');
		$description=getRequest('description');
		$code = date("dmYHis");
		$lang=getRequest("lang");
		switch ($oper){
			case "EditDescription":
				$sql = "UPDATE banner SET description='".$description."' WHERE `id`=".$id."";
				$this->db->Execute($sql);
				break;
			case "edit":
				$sql = "UPDATE banner SET `image`='".$image."',`title`='".$title."',`description`='".$des."', link='".$link."',
							 `status`=".$status.", `order`=".$order." WHERE `id`=".$id."";
				$this->db->Execute($sql);
				break;
			case "add":
				$sql = "INSERT INTO banner(categories_id,title,description, image, link,`status`,`order`, lang)
						VALUES (".$cate_id.", '".$title."', '".$des."', '".$image."', '".$link."', ".$status.", ".$order.", ".$lang.")";
				$this->db->Execute($sql);
				break;
			case "del":
				$sql = "delete from banner where id in ($id)";
				$this->db->Execute($sql);
				break;
		}
	}
}

?>
