<?php
if(!defined('RG_EMULATION')) { define('RG_EMULATION', 0); }
ini_set("memory_limit","128M");
// Database information
$database_driver = "mysqli";		// Database driver mysql
$database_server = "localhost";	// for most cases, it is localhost 192.168.1.99
$database_name = "auvietuc";
$database_user = "root";
$database_password = "";
$database_port = 3306; // default: 3306
$database_table_prefix = 'npt_'; // default: npt_
// Server (host) information
$server_url = "http://localhost/auvietuc";
// Site information
$site_folder = "/auvietuc";
$ckeditor_path = $server_url.$site_folder.'/editor/';
$ckfinder_path = $ckeditor_path.'filemanagement/';
$site_icon = "favicon.ico";
$site_secret = 'O2EpDQ4dJd5Nzkgt';
$mail_mailer = 'mail';
$mail_contact = 'auvie672@auvietuc.edu.vn';
$mail_Bcc ='huytqcntt@gmail.com';
$mail_BccName ='Ngo Toan';
$mail_send='';
$mail_mailfrom = 'auvie672@auvietuc.edu.vn';
$mail_fromname = 'AuVietUc';
$mail_sendmail = '/usr/sbin/sendmail';
$mail_smtpauth = '0';
$mail_smtpuser = '_mainaccount@auvietuc.edu.vn';
$mail_smtppass = 'PhuocLocTho0810$';
$mail_smtphost = 'mail.auvietuc.edu.vn';

$cache_caching = '0';
$cache_cachepath = $_SERVER['DOCUMENT_ROOT'].$site_folder.'/cache';
$cache_cachetime = '900';
$folder_administrator = "myadmin";
$folder_includes = "includes";
$folder_images = "images";
$folder_javascript = "js";
$folder_templates = "templates";
$folder_modules = "modules";
$folder_languages = "languages";
//Routing configuration
$default_page_code	= "trang-chu";
$default_action		= "list";
$default_lang		= "vn";
$default_seo_string	= "";
$seo_extention		= "";
// Set options for session variable
$patSession_options = array('security' => 'fix_browser, fix_ip', 'empty-referer'   => 'allow');
?>