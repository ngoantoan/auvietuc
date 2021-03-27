<?php
defined( '_VALID_MOS' ) or die( 'Restricted access' );
/**************  DAO Banner/Banner_category  *********/
/******************************************/
class UserDao{
	var $db;
	public function __construct(){
		global $db;
		$this->db = &$db;
	}

	public function UserDao(){
		global $db;
		$this->db = &$db;
	}
	
	/*
	 * get all user (except superadmin)
	 */
	function getSqlList(){
		return 'SELECT id, login_name, password, email, is_active FROM npt_users WHERE supper_admin != 1';
	}
	
//	function getSqlListByGroupId($group_id){
//		return 'SELECT id,login_name,password,email,is_active FROM npt_users u INNER JOIN npt_users_rel_groups urg ON u.id = urg.users_id WHERE urg.groups_id ='.$group_id;
//	}

	/**
	 * 
	 * @param object $user_name
	 * @param object $user_password
	 * @param object $user_email
	 * @param object $supper_admin
	 * @param object $groups_selected_string
	 * @param object $users_id
	 * @return String $msg
	 */
	function update($user_name,$user_password, $user_email,$is_active, $groups_selected, $users_id){	
		$sqlQuery = fMakeSqlQuery('update #__users set `login_name`="'.$user_name.'", `password`=md5("'.$user_password.'"), email="'.$user_email.'",is_active="'.$is_active.'", supper_admin=0 where id='.$users_id);
		if ($user_password == '') $sqlQuery = fMakeSqlQuery('update #__users set `login_name`="'.$user_name.'", email="'.$user_email.'",is_active="'.$is_active.'", supper_admin=0 where id='.$users_id);
		$re = $this->db->Execute($sqlQuery);
		if($re && $groups_selected != NULL){
			$sqlQuery = fMakeSqlQuery('delete from #__users_rel_groups where users_id='.$users_id);
			$this->db->Execute($sqlQuery);
			foreach ($groups_selected as $key=>$value){
						$sqlQuery = fMakeSqlQuery('insert into #__users_rel_groups (users_id, groups_id) values('.$users_id.', '.$value.')');
					$res = $this->db->Execute($sqlQuery);
					if(!$res) break;
			}
		}
		
		if ($re){
			return '<div id="message" class="updated fade"><p><strong>User Updated!</strong></p></div>';
		}else{
			return '<div id="message" class="updated fade"><p><strong>Update Failure! Please Try Again</strong></p></div>';
		}
	}
	
	/**
	 * 
	 * @param object $user_name
	 * @param object $user_password
	 * @param object $user_email
	 * @param object $groups_selected
	 * @return String $msg
	 */
	function insert($user_name, $user_password, $user_email,$is_active,$groups_selected){
		$this->db->BeginTrans();
		$sqlQuery = fMakeSqlQuery('insert into #__users (login_name, password, email, is_active, supper_admin) values("'.$user_name.'", md5("'.$user_password.'"), "'.$user_email.'", "'.$is_active.'",0)');
		$re = $this->db->Execute($sqlQuery);		
		if($re && $groups_selected != ''){
			$sqlQuery = fMakeSqlQuery('select max(id) as id from #__users where login_name ="'.$user_name.'"');
			$re = $this->db->Execute($sqlQuery);
			foreach ($groups_selected as $key=>$value){
				$sqlQuery = fMakeSqlQuery('insert into #__users_rel_groups (users_id, groups_id) values('.$re->fields['id'].', '.$value.')');
				$res = $this->db->Execute($sqlQuery);
				if(!$res) break;
			}
		}	
		if($re){
			$this->db->CommitTrans(); 
			return '<div id="message" class="updated fade"><p><strong>New User Have Been Added!</strong></p></div>';
		}else{
			$this->db->RollbackTrans(); 
			return '<div id="message" class="updated fade"><p><strong>Insert Failure! Please Try Again</strong></p></div>';
		}
	}
	
	/**
	 * 
	 * @param object $user_id
	 * @return T/F
	 */
	function delete($user_id){
		$this->db->BeginTrans();
		$sqlQuery = fMakeSqlQuery('delete from #__users where id='.$user_id);
		$re = $this->db->Execute($sqlQuery);
		if($re){
			$sqlQuery = fMakeSqlQuery('delete from #__users_rel_groups where users_id='.$user_id);
			$re = $this->db->Execute($sqlQuery);		
		}
		if($re) $this->db->CommitTrans(); 
		else $this->db->RollbackTrans();
		if($re) return true;
		else return false;
	}
	
}
?>