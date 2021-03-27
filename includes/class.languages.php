<?php

// ensure this file is being included by a parent file
defined( '_VALID_MOS' ) or die( 'Restricted access' );

class languages {

	var $db;
	var $website;
	var $sess;
	public function __construct() {
		global $db, $website, $usess;
		$this->db = $db;
		$this->website = &$website;
		$this->sess = &$usess;
	}
	
	function languages() {
		global $db, $website, $usess;
		$this->db = $db;
		$this->website = &$website;
		$this->sess = &$usess;
	}
	
	function getLanguages($code){
		$language = "";
		$sqlQuery = "select * from npt_languages where `code`='".$code."'";
		$re = $this->db->Execute($sqlQuery);
		if($re && $re->RecordCount()>0){
			$language['id'] = $re->fields['id'];
			$language['code'] = $re->fields['code'];
			return $language;
		}else{
			return $language;
		}
	}
	
}

?>