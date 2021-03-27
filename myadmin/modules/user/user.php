<?php
defined( '_VALID_MOS' ) or die( 'Restricted access' );
include_once ("../dao/UserDao.php");
include_once ("modules/ModuleAdminBase.php");
class c_user extends ModuleAdminBase {
	var $userDao;
	
	public function __construct()
	{
		parent::baseModule();
		$this->userDao = new UserDao();
		$this->loadClass("class.jqgrid_json_service.php");
	}
	
	function c_user() {		
		parent::baseModule();
		$this->userDao = new UserDao();
		$this->loadClass("class.jqgrid_json_service.php");
	}

	function main() {
		//if($this->check_role("ROLE_USER")) {
			$q = strval(mosGetParam($_GET, 'r', ''));
			switch ($q) {
				case 'getJsonList':
					return $this->getJsonList();
					break;
				case 'getSubGridJsonList':
					return $this->getSubGridJsonList();
					break;
				case 'show':
					return $this->show();
					break;
				case 'update':
					return $this->update();
					break;
				default:
					return $this->showList();
					break;
			}
		// } else {
		// 	return "<h1 class='text-center'>ACCESS DENIED</h1>";
		// }
    }

	function showList(){
        $tpl = $this->getTemplatePath("user_list");
		return $tpl->getOutputContent();
	}

	function getJsonList(){
		//$this->db->debug=true;
		$sql = fMakeSqlQuery("select npt_users.id, login_name, fullname, email, phone,  password,  is_active from npt_users where supper_admin = 0");
		$jqg = new jqgridJsonService($sql);
		return $jqg->renderJson();
	}

    function getSubGridJsonList(){
        //$this->db->debug=true;
        $id = getRequest("id");
        $sql = fMakeSqlQuery("select distinct r.id, r.description from npt_roles as r inner join user_role as ur on r.id =ur.role_id where ur.user_id = ".$id);
        $jqg = new jqgridJsonService($sql);
        return $jqg->renderJson();
    }

	function show($msg = ""){
		$tpl = $this->getTemplatePath('user', "user");
		global $ckfinder_path;
		$tpl->assign('folder_lib',$this->site_folder.'/upload/');
		$tpl->assign('ckfinder_path',$ckfinder_path);
		$tpl->assign('action',"?q=user&r=update");
		$tpl->assign('msg',$msg);
		$id = getRequest("id");


		if($id > 0) {
			$user = $this->db->getRow("select login_name, fullname, email,phone,  password,  is_active from npt_users where id=?", $id);
			$tpl->assign('oper',"edit");
			$tpl->assign('id',$id);
			$tpl->assign('login_name', $user['login_name']);
			$tpl->assign('fullname', $user['fullname']);
			$tpl->assign('email', $user['email']);
			$tpl->assign('password', $user['password']);
			$tpl->assign('phone', $user['phone']);
			if($user['is_active'] == 1){
				$tpl -> assign("sactive", 'checked="checked"');
			}else{
				$tpl -> assign("sunactive", 'checked="checked"');
			}

            $tpl -> assign('roles', $this -> generateOptions("npt_roles",  "id", "description", "", "", ""));

            $roles_select = $this->db->GetArray("select role_id from user_role where user_id=?", $id);
            $str = "";
            foreach($roles_select as $s) {
                $str .= $s['role_id'].",";
            }
            $tpl->assign("roles_selected", $str);

		} else {
			$tpl->assign('oper',"add");
            $tpl -> assign('roles', $this -> generateOptions("npt_roles",  "id", "description", "", "", ""));
		}
		return  $tpl->getOutputContent().$msg;
	}

	function update(){
		//$this->db->debug = true;
		$id	= (int)getRequest('id');
		$oper = getRequest('oper');
		$username	= getRequest('username');
		$fullname	= getRequest('fullname');
		$email	= getRequest('email');
		$password	= getRequest('password');
		$phone	= getRequest('phone');
		$is_active = getRequest('is_active');
		$is_active = ($is_active == 'on')?1:0;
        $role = array();
        $role = getRequest("role");

		switch ($oper){
			case "edit":
			    if($password != "") {
                    $this->db->Execute("UPDATE npt_users SET login_name=?,password=?, fullname=?,phone=?,email=?, is_active=? WHERE id=?", array($username, md5($password), $fullname, $phone, $email, $is_active, $id));
                } else {
                    $this->db->Execute("UPDATE npt_users SET login_name=?, fullname=?,phone=?,email=?, is_active=? WHERE id=?", array($username, $fullname, $phone, $email, $is_active, $id));
                }

                if($role && count($role) > 0) {
                    $this->db->Execute("delete from user_role where user_id=?", $id);

                        foreach($role as $b) {
                            $this->db->Replace('user_role',
                                array('role_id'=>(int)$b,'user_id'=>$id),
                                array('role_id','user_id'),
                                $autoquote = true);
                        }
                }
				break;
			case "add":
				$this->db->Execute("INSERT INTO npt_users(login_name, password, fullname, phone, email, is_active) VALUES (?,?,?,?,?,?)", array($username, md5($password), $fullname, $phone, $email, $is_active));
                $id = $this->db->Insert_ID();
                if($role && count($role) > 0) {
                    //$this->db->Execute("delete from user_role where user_id=?", $id);
                    foreach($role as $r) {
                            $this->db->Replace('user_role',
                                array('role_id'=>(int)$r,'user_id'=>$id),
                                array('role_id','user_id'),
                                $autoquote = true);

                    }
                }
				break;
			case "del":
                $this->db->Execute("delete from user_role where user_id in (".$id.")");
				$this->db->Execute("delete from npt_users where id in (".$id.")");
				break;
		}
		return $this->showList();
	}
}
?>