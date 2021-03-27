<?php

include_once ("modules/ModuleAdminBase.php");
/**
 * Class common categories
 */
class c_infosetting extends ModuleAdminBase
{
    public function __construct()
    {
        parent::baseModule();
    }

    function c_infosetting()
    {
        parent::baseModule();
    }
	
	function main() {
		//if($this->check_role("ROLE_infosetting")) {
        $q = strval(mosGetParam($_GET, 'r', ''));
					
        switch ($q) {
			case 'getJsonList':
				 return $this->getJsonList();
				 break;
			case 'update':
				 return $this->update();
				 break;
            default:
                return $this->showList();
				break;
        }
//		} else {
//			return "<h1 class='text-center'>ACCESS DENIED</h1>";
//		}
    }
	function showList(){
        $tpl = $this->getTemplatePath('list');
		global $ckfinder_path;
		$tpl->assign('folder_lib',$this->site_folder.'/upload/');
		$tpl->assign('ckfinder_path',$ckfinder_path);
		return $tpl->getOutputContent();
	}

	function getJsonList(){
		$sql = fMakeSqlQuery("select id, code, title, status from info_setting ORDER BY id DESC");
		$this->loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($sql);
		return $jqg->renderJson();
	}
    function update() {
        $oper = getRequest('oper');
        $id = getRequest('id');
        $code = getRequest('code');
        $title = getRequest('title');
        $status = getRequest('status');
//$this->db->debug = true;
        switch ($oper) {
            case "edit" :
                $bool=$this->db->Execute("UPDATE info_setting SET title=?, status=? WHERE id=?", array( $title, $status ,$id));
                break;
            case "add" :
                $bool = $this -> db->Execute("INSERT INTO info_setting (code, title, status) VALUES (?,?,?)", array($code, $title, $status));
                $bool = true;
                break;
            case "del" :
                $this -> db -> Execute("DELETE FROM info_setting WHERE id in ($id)");
                return 1;
                break;
        }
        if($bool) {
            // header("Location: ".$this->site_folder."/myadmin/?q=news_items");
            //  return $this->show($id, "Update successfully.");
            header("Location: ".$this->site_folder."/myadmin/?q=infosetting");
        } else {
            return $this->show($id, "Update Error");
        }
    }
}

?>
