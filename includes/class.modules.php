<?php
#####################################
# Module Library					#
# (C) Copyright 2008 Cong Nguyen	#
# Home Page: www.bantayso.com	#
# Contact: cong.nguyen@bantayso.com	#
# Release Date: 15.12.2008			#
#####################################
// ensure this file is being included by a parent file
defined( '_VALID_MOS' ) or die( 'Restricted access' );

class Modules {

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

	function Modules() {
		global $db, $website, $usess;
		$this->db = $db;
		$this->website = $website;
		$this->sess = $usess;
	}
	/**
	 * 
	 * @return 
	 * @param object $modules_name
	 * @param object $lang[optional]
	 */
	function getModules($arrLayout, $lang=""){
		global $folder_modules, $page_id, $setting;
		$modules_id = $arrLayout['modules_id'];
		//Get Setting for Module
		$setting = $this->getSetting($arrLayout);
		$modules_name = $this->getName($modules_id);
		if($modules_name){
			if(file_exists($folder_modules.'/'.$modules_name.'/'.$modules_name.'.php')){
				require_once($folder_modules.'/'.$modules_name.'/'.$modules_name.'.php');
				$modules = new $modules_name;
				return $modules->getContent($lang);
			}
			//TODO: Neu khong tim thay module=> view screen for setup module
			///DOAN COMMENT DUOI DAY NEU BO DI NEU CO LOI THI HE THONG SE BAO LOI
			/*else{
			//return 'Modules name:'.$modules_name.'<br/> File not exists';
			//}
		//}else{
			//return 'Module name in table modules is not exists please check that.';
			*/
			unset($modules);
		}
	}
	/**
	 * Load Setting for modules
	 * @return 
	 * @param object $page_id
	 * @param object $module_id
	 */
	function getSetting($arrLayout) {
		$layout_id = $arrLayout['id'];
        $setting = array();
        if($layout_id > 0) {
            $settingQuery = "select * from npt_layouts_setting where layout_id='$layout_id'";
            $rsSetting = $this->db->Execute($settingQuery);
            if ($rsSetting->RecordCount() > 0) {
                //Build Array KEY=>VALUE
                while (!$rsSetting->EOF) {
                    $items = array($rsSetting->fields['setting_key'] => $rsSetting->fields['setting_value']);
                    $this->array_push_associative($setting, $items);
                    $rsSetting->MoveNext();
                }
            }
            unset($items, $settingQuery);
            if ($rsSetting) $rsSetting->Close();
        }
		return $setting;
	}
	/**
	 * 
	 * @return 
	 * @param object $id
	 */
	function getName($id){
        if($id > 0) {
            $sqlQuery = fMakeSqlQuery('select name from #__modules where `id` = ' . $id . '');
            $re = $this->db->Execute($sqlQuery);
            if ($re) {
                return $re->fields['name'];
            }
        }
        return false;
	}
	
	/**
	 * Append associative array elements
	 * @return array
	 * @param object $arr
	 */
	function array_push_associative(&$arr) {
		$ret=0;
	   $args = func_get_args();
	   foreach ($args as $arg) {
	       if (is_array($arg)) {
	           foreach ($arg as $key => $value) {
	               $arr[$key] = $value;
	               $ret++;
	           }
	       }else{
	           $arr[$arg] = "";
	       }
	   }
	   return $ret;
	}
}

?>