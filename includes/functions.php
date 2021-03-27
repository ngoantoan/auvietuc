<?php
defined( '_VALID_MOS' ) or die( 'Restricted access' );
error_reporting( E_ALL );
include($folder_includes."/class.TemplatePower.inc.php");
$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC;
$ADODB_CACHE_DIR = $cache_cachepath;

if ($database_driver == 'mysql') {
	// Connect to the database
	$db = NewADOConnection($database_driver);
	$db->Connect($database_server, $database_user, $database_password, $database_name);
	$rs = $db->Execute("SET NAMES 'utf8'");
} else if ($database_driver == 'mysqli') {
	// 1=ADODB_FETCH_NUM, 2=ADODB_FETCH_ASSOC, 3=ADODB_FETCH_BOTH
	$dsn_options='?persist=0&fetchmode=2';
	$dsn = "$database_driver://$database_user:$database_password@$database_server/$database_name$dsn_options";
	$db = NewADOConnection($dsn);
	$rs = $db->Execute("SET NAMES 'utf8'");
} else {
	$db = NewADOConnection($database_driver);
	$db->Connect($database_server, $database_user, $database_password, $database_name);
}

require_once($folder_includes.'/patSession.php');
require_once( $folder_includes . '/json.php' );
require_once( $folder_includes . "/class.portal.php" );
require_once( $folder_includes . "/class.website.php" );
require_once( $folder_includes . "/class.layouts.php" );
require_once( $folder_includes . "/class.positions.php" );
require_once( $folder_includes . "/class.page.php" );
require_once( $folder_includes . "/class.modules.php" );
require_once( $folder_includes . "/class.languages.php" );
require_once( $folder_includes . "/class.routing.php" );
//$absolute_path = getcwd();
//if (preg_match("/\/" . $folder_includes . "/i", "$absolute_path"))
//	$absolute_path = str_replace('/' . $folder_includes,"",$absolute_path);
//else
//	$absolute_path = str_replace('\\' . $folder_includes,"",$absolute_path);
//CCache::getCache();
$website = new Website();
$json = new Services_JSON();
function getPageURL() {
	$pageURL = 'http';
	if ($_SERVER["SERVER_PORT"] != "80") {
		$pageURL .= "s";
		$pageURL .= "://";
		$pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
	} else {
		$pageURL .= "://";
		$pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
	}
	return $pageURL;
}
?>