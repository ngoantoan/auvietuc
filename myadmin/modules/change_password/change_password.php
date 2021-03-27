<?php
defined( '_VALID_MOS' ) or die( 'Restricted access' );
include_once ("modules/ModuleAdminBase.php");
class c_change_password extends ModuleAdminBase {
    // constructor
    public function __construct()
	{
		parent::baseModule();
    }
    
	function c_change_password() {		
		parent::baseModule();
	}

	function main() {
        $q = strval(mosGetParam($_GET, 'r', ''));
        switch ($q) {
			case 'update':
				 return $this->update();
				 break;
            default:
                return $this->showList();
				break;
        }
    }

	function showList($msg=""){
        $tpl = $this->getTemplatePath("list");
        $tpl->assign('action',"?q=change_password&r=update");
        if($msg != ""){
        $tpl->assign("msg",$msg);
        }
		return $tpl->getOutputContent();
	}
	function update(){
        global $admin_usess;
		$id	= (int)$admin_usess["login_id"];
		$password	= getRequest('password');
        $newpassword	= getRequest('newpassword');
        $renewpassword	= getRequest('renewpassword');
        if($password != "" && $newpassword == $renewpassword  &&  $admin_usess['USER']['password'] == md5($password)) {
            $this->db->Execute("UPDATE npt_users SET password=? WHERE id=?", array(md5($newpassword), $id));
            $msg="<p class='alert alert-success'>Đổi mật khẩu thành công.</p>";
        }else{
            $msg="<p class='warning alert-warning'>Vui lòng thử lại, bạn đã nhập mật khẩu không chính xác.</p>";
        }

		return $this->showList($msg);
	}
}
?>