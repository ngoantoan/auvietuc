<?php
// ensure this file is being included by a parent file
defined( '_VALID_MOS' ) or die( 'Restricted access' );
error_reporting( E_ALL );
// include the TemplatePower
include("../" . $folder_includes . "/class.TemplatePower.inc.php");
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

################################### CONNECT DB #########################################
// include factory/loader
require_once "../" . $folder_includes . "/patSession.php";

// include the input filter
//require_once( "../" . $folder_includes . "/class.inputfilter.php" );
//$input_filter_all = new InputFilter();

// include the json library
require_once ( "../" . $folder_includes . '/json.php' );
$json = new Services_JSON();
// include the main functions file
require_once( "../" . $folder_includes . "/class.portal.php" );

// include classes file
require_once( "../" . $folder_includes . "/class.website.php" );
// object for website configuration
$website = new Website();

//OBJECT FOR USER_RIGHT_CHECK
require_once( "../" . $folder_includes . "/users_rights.php" );
require_once( "../" . $folder_includes . "/push.php" );
require_once( "../" . $folder_includes . "/gcm.php" );
$users_rights = new users_rights();
$gcm = new GCM();
$push = new Push();
?>