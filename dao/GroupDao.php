<?php
defined( '_VALID_MOS' ) or die( 'Restricted access' );
/**************  DAO Group  *********/
/******************************************/
class GroupDao{
	var $db;
	public function __construct(){
		global $db;
		$this->db = &$db;
	}

	public function GroupDao(){
		global $db;
		$this->db = &$db;
	}
	
	function getSqlList(){
		return 'SELECT `id`, `name`, `description` FROM npt_groups';
	}
	
	function get($group_id){
		return $this->db->GetRow("SELECT * FROM npt_groups WHERE id= $group_id");
	}
	
	/**
	 * 
	 * @param object $groups_name
	 * @param object $groups_des
	 * @param object $features_rights_string
	 * @param object $groups_id
	 * @return String $msg
	 */
	function update($groups_name,$groups_des, $features_rights_string, $group_id){	
		$sqlQuery = fMakeSqlQuery('update #__groups set `name`="'.$groups_name.'", `description`="'.$groups_des.'" where id='.$group_id);
		$this->db->BeginTrans();
		$re = $this->db->Execute($sqlQuery);
	
		if($re){
			$sqlQuery = fMakeSqlQuery('delete from #__features_code_groups_rights where groups_id='.$group_id);
			$re = $this->db->Execute($sqlQuery);
			if($re){
				$stringArray = explode("|", $features_rights_string);
				for($i=0; $i<count($stringArray); $i++){
					$tempArray = explode(":",$stringArray[$i]);
					$sqlQuery = fMakeSqlQuery('insert into #__features_code_groups_rights (features_code_id, groups_id, rights_id) values('.$tempArray[0].','.$group_id.','.$tempArray[1].')');
					$re = $this->db->Execute($sqlQuery);
					if(!$re){
						break;
					}
				}
			}
		}
		
		if($re){
			$this->db->CommitTrans(); 
			return '<div id="message" class="updated fade"><p><strong>Update Successfully!</strong></p></div>';
		}else{
			$this->db->RollbackTrans(); 
			return '<div id="message" class="updated fade"><p><strong>Failure! Please Try Again.</strong></p></div>';
		}
	}
	
	/**
	 * 
	 * @param object $groups_name
	 * @param object $groups_des
	 * @param object $features_rights_string
	 * @return String $msg
	 */
	function insert($groups_name, $groups_des, $features_rights_string){	
		$this->db->BeginTrans();
		$insertCheckGroups = true;
		$insertCheckData = true;
		$sqlQuery = fMakeSqlQuery('insert into #__groups (name, description) values("'.$groups_name.'", "'.$groups_des.'")');
		$re = $this->db->Execute($sqlQuery);
		
		if($re){
			$sqlQuery = fMakeSqlQuery('select max(id) as id from #__groups');
			$re = $this->db->Execute($sqlQuery);
			$id;
			if($re) $id = $re->fields['id'];
			$stringArray = explode("|", $features_rights_string);
			for($i=0; $i<count($stringArray); $i++){
				$tempArray = explode(":",$stringArray[$i]);
				$sqlQuery = fMakeSqlQuery('insert into #__features_code_groups_rights (features_code_id, groups_id, rights_id) values('.$tempArray[0].','.$id.','.$tempArray[1].')');
				$re = $this->db->Execute($sqlQuery);
				if (!$re){
					$insertCheckData=false;
					break;
				}		
			}
		} else {
			$insertCheckGroups = false;
		}
		if($insertCheckGroups == true && $insertCheckData == true){
			$this->db->CommitTrans(); 
		}else{
			$this->db->RollbackTrans(); 
		}

		if ($insertCheckGroups == true && $insertCheckData == true){
			return '<div id="message" class="updated fade"><p><strong>New Group Have Been Added!</strong></p></div>';
		} else {
			return '<div id="message" class="updated fade"><p><strong>Failure! Please try again</strong></p></div>';
		}	
	}
	
	function delete($groups_id){
		$this->db->BeginTrans();
		$checkDeleteGroup = true;
		$checkDeleteGroupData = true;
		$sqlQuery = fMakeSqlQuery('delete from #__groups where id='.$groups_id);
		//$this->db->debug = true;
		$re = $this->db->Execute($sqlQuery);
		if($re){
			$sqlQuery = fMakeSqlQuery('delete from #__features_code_groups_rights where groups_id='.$groups_id);
			$re = $this->db->Execute($sqlQuery);
			if(!$re) $checkDeleteGroupData = false;
		} else {
			$checkDeleteGroup = false;
		}
		if ($checkDeleteGroup == true && $checkDeleteGroupData == true){
			$this->db->CommitTrans(); 
		} else {
			$this->db->RollbackTrans(); 
		}
		if ($checkDeleteGroup == true && $checkDeleteGroupData == true){
			return true;
		} else {
			return false;
		}
	}
	
}
?>