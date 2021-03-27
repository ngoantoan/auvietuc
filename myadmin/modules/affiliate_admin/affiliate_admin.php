<?php
defined( '_VALID_MOS' ) or die( 'Restricted access' );
include_once ("modules/ModuleAdminBase.php");
class c_affiliate_admin extends ModuleAdminBase {
    
    public function __construct()
	{
		parent::baseModule();
    }
    
	function c_affiliate_admin() {		
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
        $tpl->assign('action',"?q=affiliate_admin&r=update");
        if($msg != ""){
        $tpl->assign("msg",$msg);
        }
		return $tpl->getOutputContent();
	}
	function update(){
        global $admin_usess;
		$id	= (int)getRequest('id');
		$password	= getRequest('password');
        $newpassword	= getRequest('newpassword');
        $renewpassword	= getRequest('renewpassword');
        if($password != "" && $newpassword == $renewpassword  &&  $admin_usess['USER']['password'] == md5($password)) {
            $this->db->Execute("UPDATE npt_user SET password=? WHERE id=?", array(md5($newpassword), $id));
            $msg="<p class='alert alert-success'>Đổi mật khẩu thành công.</p>";
        }else{
            $msg="<p class='warning alert-warning'>Vui lòng thử lại, bạn đã nhập mật khẩu không chính xác.</p>";
        }

		return $this->showList($msg);
	}
}
?>