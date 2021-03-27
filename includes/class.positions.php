<?php

// ensure this file is being included by a parent file
defined( '_VALID_MOS' ) or die( 'Restricted access' );

class Positions {

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
	
	function Positions() {
		global $db, $website, $usess;
		$this->db = $db;
		$this->website = $website;
		$this->sess = $usess;
	}
	/**
	 * Get Array Position with html file & active is true
	 * @return Array
	 * @param object $html_file
	 */
	function getPositions($html_file){
		$sqlQuery = fMakeSqlQuery("select id, name from #__positions where `html_file` = '$html_file' and active='1'");	
		$re = $this->db->Execute($sqlQuery);
		if($re && $re->RecordCount()>0){
		$positions = array();
			while(!$re->EOF){
				$positions[] = array("id"=>$re->fields['id'],"name"=>$re->fields['name']);
				$re->MoveNext();
			}
			return $positions;
		}else{
			die('Positions for this <b>'.$html_file.'</b> html file is not set. Please check in positions table.');
		}
	}
	
}

?>