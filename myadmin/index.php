<?php
ini_set('post_max_size', 500);
ini_set('upload_max_filesize', 500);
define('_VALID_MOS', 1);
ini_set('display_errors', '1');
require_once __DIR__ . '/../bootstrap.php';
require_once("../configuration.php");
require_once("includes" . "/functions.php");
$default_module = "contact";
$front_end_url = $server_url . $site_folder;
$back_end_url = $server_url . $site_folder . "/" . $folder_administrator;
$admin_usess = patSession::create('current_admin_user' . $server_url . $site_folder, 'Native', $patSession_options);
// Front-end url
$front_end_url = $server_url . $site_folder;
// Back-end url
$back_end_url = $server_url . $site_folder . "/" . $folder_administrator;
// Front-end absolute path
$absolute_path = str_replace($folder_administrator, "", getcwd());
// Back-end absolute path
$absolute_administrator_path = getcwd();
$lang_code = $admin_usess->get("lang");
if (getRequest("lang")) {
    $admin_usess->set("lang", getRequest("lang"));
    $lang_code = $admin_usess->get("lang");
}
if ($lang_code == null || empty($lang_code)) {
    $lang_code = 1;
    $admin_usess->set("lang", $lang_code);
}

if ($admin_usess->get('login_id') == "") {
    require_once("modules/login/login.php");
} else {
    $tpl = new TemplatePower("main.tpl");
    $tpl->prepare();
    $tpl->assign("BACKEND_USERNAME", $admin_usess->get('login_name'));
    if ($admin_usess->get('login_name') == 'superadmin') {
        $tpl->newBlock("superadmin");
    }
    $tpl->assignGlobal("ckfinder_path", $ckfinder_path);
    $tpl->assignGlobal("ckeditor_path", $ckeditor_path);
    $tpl->assignGlobal("site_folder", $site_folder);
    $languages = $db->getArray("select id, code, description from npt_languages where status=1");
    if ($languages && count($languages)) {
        $str = "";
        $str_lang = "";
        $query_string = $default_module;
        foreach ($languages as $l) {
            if ($lang_code == $l['id']) {
                $str_lang .= "<span class=\"iti-flag " . $l['code'] . "\"></span> " . $l['description'];
                $tpl->assignGlobal("lang_selected", $str_lang);
                $str .= "<option selected='selected' value='" . $l['id'] . "'>" . $l['description'] . "</option>";
            }else{
                $str .= "<option value='" . $l['id'] . "'>" . $l['description'] . "</option>";
            }
            if (isset($_GET['q'])) {
                $query_string=$_GET['q'];
            }
            $tpl->assignGlobal("link_lang_" . $l['code'], $back_end_url . "/?q=" . $query_string . "&lang=" . $l['id']);
            $tpl->assignGlobal("LANGUAGES", $str);
        }
    }
    $tpl->assignGlobal('location', $site_folder . "/" . $folder_administrator);

    if (isset($_GET['q']) && ($_GET['q'] == "login" || $_GET['q'] == "logout")) {
        require_once("modules/login/login.php");
    } else {
        $query_string = $default_module;
        if (isset($_GET['q'])) {
            $query_string = $_GET['q'];
            $tpl->assign($query_string . "_active", "active");
        }
        include("modules/" . $query_string . "/" . $query_string . ".php");
        $class_name = 'c_' . $query_string;
        $class = new $class_name;
        $tpl->assignGlobal("CONTAINER", $class->main());
        $tpl->printToScreen();
    }
}
?>