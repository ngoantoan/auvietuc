<?php
///AUTHOR NAME:DANH HAU
///DATE: 04/12/08
///DESCRIPTION: USE FOR CHECK USER RIGHTS
///LOCATION: TIA CHOP VIET

defined( '_VALID_MOS' ) or die( 'Restricted access' );
//require_once("languages/" . $admin_usess->get("lang") . "/modules/users_rights.php");
class users_rights{
	var $db;
	var $website;
	var $sess;
	//var $LANGUAGE_TEXT;
	//var $xml;
	//var $language_code;
	// constructor
	public function __construct() {
		global $db, $website, $admin_usess, $LANGUAGE_TEXT;
		$this->db = $db;
		$this->website = &$website;
		$this->sess = &$admin_usess;
		//$this->LANGUAGE_TEXT = $LANGUAGE_TEXT;
		//$this->xml =& new Xml;
		//$this->language_code=$admin_usess->get("lang");
	}

	function users_rights() {
		global $db, $website, $admin_usess, $LANGUAGE_TEXT;
		$this->db = $db;
		$this->website = &$website;
		$this->sess = &$admin_usess;
		//$this->LANGUAGE_TEXT = $LANGUAGE_TEXT;
		//$this->xml =& new Xml;
		//$this->language_code=$admin_usess->get("lang");
	}
	

function get_features_code_id($code){
	$sqlQuery = fMakeSqlQuery('SELECT `id` from #__features_code where `code`="'.$code.'"');
	$re = $this->db->Execute($sqlQuery);
	if($re && $re->RecordCount()>0){
		return $re->fields['id'];
	}else{
		return false;
	}
}


function get_right_id($code){
	$sqlQuery = fMakeSqlQuery('SELECT `id` from #__roles where `code`='.$code.'');
	$re = $this->db->Execute($sqlQuery);
	if($re && $re->RecordCount()>0){
		return $re->fields['id'];
	}else{
		return false;
	}
}

function check_right($feature_code_id, $group_id, $right_id){
	$sqlQuery = fMakeSqlQuery('SELECT id from #__features_code_groups_rights where features_code_id='.$feature_code_id.' 
							  and groups_id='.$group_id.' and rights_id='.$right_id.'');
	$re = $this->db->Execute($sqlQuery);
	if($re && $re->RecordCount()>0){
		return true;
	}else{
		return false;
	}
}

function message($error_title,$message){
	$tpl = new TemplatePower('templates/'.$this->website->getAdministratorDefaultTemplate().'/modules/error_page/error_page.tpl');
	// DONG NAY CO THE SUA queen thanh ten khac
	$tpl->prepare();
	$tpl->assign("location","templates/" . $this->website->GetAdministratorDefaultTemplate());
	$tpl->assign('page_title', $error_title);
	$tpl->assign('errors_description', $message);
	return  $tpl->getOutputContent();
}

/*
* Check permission for access for each features
*/
function check($user_id, $right_code, $feature_code){
$value = false;
$sqlQuery = fMakeSqlQuery('SELECT * from #__users where supper_admin = 1 and id ='.$user_id);
$re = $this->db->Execute($sqlQuery);

	if($re && $re->RecordCount()>0){
		return true;
	} else {
			$sqlQuery = fMakeSqlQuery('SELECT `groups_id` from #__users_rel_groups where `users_id`='.$user_id.'');
			$re = $this->db->Execute($sqlQuery);
				if($re && $re->RecordCount()>0){
					while(!$re->EOF){
						if(!$this->get_features_code_id($feature_code)){
							die("Error for website developer. You have to check table npt_features_code whether 
							or not have record that fields code include value'".$feature_code."'");
						} else if(!$this->get_right_id($right_code)){
							die("Error for website developer. You have to check table npt_roles 
							whether or not have record that fields 'code' include value'".$right_code."'");
						} else {
							$values = $this->check_right(
														 $this->get_features_code_id($feature_code)
														 , $re->fields['groups_id']
														 , $this->get_right_id($right_code));
							if($values){
								return $values;
							}
						}
					$re->MoveNext();
					}
				}
		}
	return $value;
	}
} //End Class

?>