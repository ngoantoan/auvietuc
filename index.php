<?php
date_default_timezone_set("Asia/Ho_Chi_Minh");
header('X-Frame-Options: GOFORIT');
ini_set('display_errors', 1);
ob_start();
define('_VALID_MOS', 1 );
require_once("configuration.php");
require_once __DIR__ . '/bootstrap.php';
require_once($folder_includes . "/functions.php");
$usess	= patSession::create( 'current_user' . $server_url . $site_folder, 'Native', $patSession_options );
global $template_location;
$page_id = 1;
// $db->debug = true;

$html_file = "default.tpl";
$setting = array();
$routing = new Routing();

if($site_folder == ''){
	$globalurl = "";
}else{
	$globalurl = $site_folder;
}
$template_location = $globalurl.'/'.$folder_templates.'/'.$website->GetDefaultTemplate();
$page = new Page();
$layouts = new Layouts();
$positions = new Positions();
$module = new Modules();
$pagename = $routing->getPageName();
if($pagename == "upload" || $pagename == "templates") exit();
//Languages

$language_array = $website->getArrLanguages($pagename);
if(count($language_array) <= 0) {
    if($usess->get("lang")) {
        $language_array = $usess->get("lang");
    } else {
        $language_array = $website->GetDefaultLanguage();
    }
}
$usess->set("lang", $language_array);

$page_info = $page->GetPage($pagename, $language_array['id']); // page info can be interger - page_id or string value-lang;
if(!empty($page_info["seo_title"])){
	$webSiteName = $page_info["seo_title"];
} else {
	$webSiteName=$website->GetWebsiteNameByLanguage($language_array['code']);
}
if(!empty($page_info["seo_keyword"])){
	$Web_keywords = $page_info["seo_keyword"];
} else {
	$Web_keywords=$website->GetSiteKeywordsByLanguage($language_array['code']);
}
if(!empty($page_info["seo_description"])) {
	$Web_description = $page_info["seo_description"];
} else {
	$Web_description=$website->GetSiteDescriptionByLanguage($language_array['code']);
}

if(empty($page_info["id"])){
	$html_file = $page->getHTML($page->getDefaultPage($language_array['code']));
	$page_id = $page->getDefaultPage($language_array['code']);
} else {
	$html_file = $page->getHTML($page_info["id"]);
	$page_id = $page_info["id"];
}

$positions_array = $positions->getPositions($html_file);
$maintpl = new TemplatePower($folder_templates.'/'.$website->GetDefaultTemplate().'/'.$html_file);
$maintpl-> prepare();
$maintpl->assignGlobal('template_location', $template_location);
$maintpl->assignGlobal('website_name', $webSiteName);
$maintpl->assignGlobal('site_keywords', $Web_keywords);
$maintpl->assignGlobal('site_description', $Web_description);
$maintpl->assignGlobal('site_folder', $site_folder);
$maintpl->assignGlobal('IMAGE_LINK', "http://www.neolock.asia/upload/images/banner/neolock_banner.jpg");
$maintpl->assignGlobal('RAW_LINK', getPageURL());
$maintpl->assignGlobal('LANG', $language_array["code"]);

if($webSiteName == ''){
    $globalurl = "";
}else{
    $globalurl = $webSiteName;
}
/**
 * Loop all modules and bind data for each position
 */

if(isset($page_id)) {
	$setting = array();
	$arrLayout = array();
	$positions_array_number = count($positions_array);
	for($i=0; $i < $positions_array_number; $i++){
		$layout_array = $layouts->getLayouts($positions_array[$i]['id'], $page_id);
		if(is_array($layout_array) && count($layout_array)>0){
			for($x=0; $x < count($layout_array); $x++){
				$arrLayout = $layout_array[$x];
				$maintpl->newBlock($positions_array[$i]['name']);
				$maintpl->assign('content', $module->getModules($arrLayout, $language_array));
			}
			unset($layout_array, $arrLayout);
		}
	}
}
//Print HTML source into screen
$db->Close();
$maintpl->printToScreen();
?>