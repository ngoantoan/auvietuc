<?php
define('_VALID_MOS', 1);
ini_set('display_errors', '1');
require_once __DIR__ . '/../bootstrap.php';
require_once ("../configuration.php");
$front_end_url = $server_url . $site_folder;
$back_end_url = $server_url . $site_folder ."/". $folder_administrator;
require_once ("includes/functions.php");
$absolute_path = str_replace($folder_administrator, "", getcwd());
// Back-end absolute path
//$absolute_administrator_path = getcwd();

$admin_usess = patSession::create('current_admin_user'.$server_url.$site_folder, 'Native', $patSession_options);
$lang_code = $admin_usess->get("lang");
if($lang_code == null) {
    $lang_code = 1;
}
if ($admin_usess->get('login_id') == "") {
	echo "<script> document.location.href ='".$back_end_url."'; </script>";
}
    
/**
 * Content claSS
 */
class content {
    /**
     *
     * @return
     * @param object $name
     */
    function getModuleContent($name) {
        include ("modules/".$name."/".$name.".php");
        $class_name = 'c_'.$name;
        $class = new $class_name;
        return $class->main();
        
    }
} //end class

$c = new content();
$out = $c->getModuleContent($_GET['q']);
print $out;
usleep(400000);
?>
