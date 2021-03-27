<?php
/**
 * NeoPortal
 * written by Nguyen Thanh Cong
 * cong.nguyen@bantayso.com
 * at Ban Tay So Co., Ltd.
 */
ini_set('display_errors', 1);
// Set flag that this is a parent file
define('_VALID_MOS', 1 );
// Include the Global declaration file
require_once __DIR__ . '/bootstrap.php';
require_once("configuration.php");
// Include the main function file
require_once($folder_includes . "/functions.php");
//global $usess;
/**
 * Content claSS
 */
// Start a user session
$usess	=  patSession::create( 'current_user' . $server_url . $site_folder, 'Native', $patSession_options );
$lang = $usess->get('lang');
class content{
	/**
	 * 
	 * @return 
	 * @param object $name
	 */
	function getModuleContent($name){
		if($name!="") {
			global $lang;
			include('modules/'.$name.'/'.$name.'.php');
			$m = new $name;
			$language_id = $lang['id'];
			if(!is_null($language_id)) {
				return $m->getContent($language_id);
			}
			//default VN
			return $m->getContent("1");
		} else {
			return "Module Name is invalid. PLease check!";
		}
	}
} //end class

$c = new content();
//response HTML content when ajax callback
$out = $c->getModuleContent($_GET['module_name']);
print $out;
usleep(40000);
?>
