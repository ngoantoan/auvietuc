<?php

// ensure this file is being included by a parent file
defined( '_VALID_MOS' ) or die( 'Restricted access' );
/**
 * Nguyen Thanh Cong
 */
class Layouts {

	var $db;
	var $website;
	var $sess;
	public function __construct()
	{
		global $db, $website, $usess;
		$this->db = $db;
		$this->website = $website;
		$this->sess = $usess;
	}
	
	function Layouts() {
		global $db, $website, $usess;
		$this->db = $db;
		$this->website = $website;
		$this->sess = $usess;
	}
	/**
	 * 
	 * @return 
	 * @param object $positions_id
	 * @param object $pages_id
	 */
	function getLayouts($positions_id, $pages_id){
		$sqlQuery = fMakeSqlQuery('select id, positions_id, pages_id, modules_id from #__layouts where `positions_id` = '.$positions_id.' and `pages_id` = '.$pages_id. ' order by modules_order');	
		$re = $this->db->Execute($sqlQuery);
		
		if($re && $re->RecordCount()>0){
		$layouts = array();
			while(!$re->EOF){
			$layouts[] = array("id"=>$re->fields['id']
					,"positions_id"=>$re->fields['positions_id']
					,"pages_id"=>$re->fields['pages_id']
					, "modules_id"=>$re->fields['modules_id']);
			$re->MoveNext();
			}
			return $layouts;
		}else{
			return false;
		}
	}
	
	/**
	 * 
	 * @return 
	 * @param object $position_id
	 * @param object $pages_id
	 */
	function getLayoutById($layout_id){
		$sqlQuery  = 'select id, positions_id, pages_id, modules_id from npt_layouts';
		$sqlQuery .= " where id='$layout_id'";
		$recordSet = $this->db->GetRow($sqlQuery);
		$page_setting_info = array();
		if($recordSet){
			$page_setting_info = array("id"=>$recordSet['id'], 'positions_id'=>$recordSet['positions_id'],"pages_id"=>$recordSet['pages_id'], 'modules_id'=>$recordSet['modules_id']);
		}
		return $page_setting_info;
		
	}
}

?>