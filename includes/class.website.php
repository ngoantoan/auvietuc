<?php

// ensure this file is being included by a parent file
defined( '_VALID_MOS' ) or die( 'Restricted access' );

/**
* Author: Nguyen Thanh Cong
* Date created: Jan 03, 2008
*
* Class to get Website information
* @package neoPortal
*/
class Website {
	private $website_name = array();
	private $default_language = "vn";
	private $default_template = "";
	private $site_keywords = array();
	private $admin_default_language = "";
	private $admin_default_template ="";
	private $site_home_page = "";
	private $site_logo = "";
	private $site_description = array();
	private $site_email_from_name = array();
	private $site_email_from = array();
	private $mailer = 0;
	private $send_mail_path = "";
	private $smtp_auth = 0;
	private $smtp_user = "";
	private $smtp_pass = "";
	private $smtp_host = "";
	private $site_footer = array();
	
	public function __construct()
	{
		global $db, $default_lang;
		$query = fMakeSqlQuery("SELECT t1.*, t2.code FROM #__website_config t1 LEFT JOIN #__languages t2 ON t1.languages_id = t2.id");

		$rs = $db->Execute($query);
		while (!$rs->EOF) {
			switch ($rs->fields["key"]) {
				case "website_name":
					$this->website_name[$rs->fields["code"]] = $rs->fields["value"];
					break;
				case "site_footer":
					$this->site_footer[$rs->fields["code"]] = $rs->fields["value"];
					break;
				case "default_language":
					$this->default_language = $rs->fields["value"];
					if(isset($this->default_language)){
						$this->default_language = $default_lang;
					}
					break;
				case "default_template":
					$this->default_template = $rs->fields["value"];
					break;
				case "site_keywords":
					$this->site_keywords[$rs->fields["code"]] = $rs->fields["value"];
					break;
				case "admin_default_language":
					$this->admin_default_language = $rs->fields["value"];
					break;
				case "admin_default_template":
					$this->admin_default_template = $rs->fields["value"];
					break;
				case "site_home_page":
					$this->site_home_page = $rs->fields["value"];
					break;
				case "site_logo":
					$this->site_logo = $rs->fields["value"];
					break;
				case "site_description":
					$this->site_description[$rs->fields["code"]] = $rs->fields["value"];
					break;
			}
			$rs->MoveNext();
		}
	}
	// Constructor
	function Website() {
		//$this->db->debug=true;
		global $db, $default_lang;
		$query = fMakeSqlQuery("SELECT t1.*, t2.code FROM #__website_config t1 LEFT JOIN #__languages t2 ON t1.languages_id = t2.id");

		$rs = $db->Execute($query);
		while (!$rs->EOF) {
			switch ($rs->fields["key"]) {
				case "website_name":
					$this->website_name[$rs->fields["code"]] = $rs->fields["value"];
					break;
				case "site_footer":
					$this->site_footer[$rs->fields["code"]] = $rs->fields["value"];
					break;
				case "default_language":
					$this->default_language = $rs->fields["value"];
					if(isset($this->default_language)){
						$this->default_language = $default_lang;
					}
					break;
				case "default_template":
					$this->default_template = $rs->fields["value"];
					break;
				case "site_keywords":
					$this->site_keywords[$rs->fields["code"]] = $rs->fields["value"];
					break;
				case "admin_default_language":
					$this->admin_default_language = $rs->fields["value"];
					break;
				case "admin_default_template":
					$this->admin_default_template = $rs->fields["value"];
					break;
				case "site_home_page":
					$this->site_home_page = $rs->fields["value"];
					break;
				case "site_logo":
					$this->site_logo = $rs->fields["value"];
					break;
				case "site_description":
					$this->site_description[$rs->fields["code"]] = $rs->fields["value"];
					break;
			}
			$rs->MoveNext();
		}
	}
	
	function GetWebsiteName() {
		return $this->website_name;
	}
	
	function GetWebsiteNameByLanguage($language) {
		// $language is array('id'->valueid, 'code'->valuecode)		 
		//$language = $language['code'];
		return ((!isset($this->website_name[$language]) || (isset($this->website_name[$language]) && $this->website_name[$language] == "")) ? $this->website_name[$this->default_language] : $this->website_name[$language]);
	}
	
	function GetSiteFooter() {
		return $this->site_footer;
	}
	
	function GetSiteFooterByLanguage($language) {
		// $language is array('id'->valueid, 'code'->valuecode) 
		if(isset($this->site_footer[$language['code']])){
			return $this->site_footer[$language['code']];
		} else {
			if(isset($this->default_language)){
				return $this->site_footer[$this->default_language];
				//return $this->default_language[$language];
			} else {
				return $this->default_language[$language];
			}
		}
		//return ((!isset($this->site_footer[$language]) || (isset($this->site_footer[$language]) && $this->site_footer[$language] == "")) ? $this->site_footer[$this->default_language] : $this->site_footer[$language]);
	}
		
	function GetDefaultTemplate() {
		return $this->default_template;
	}
		/***
	 * 
	 * @return 
	 */
	function GetDefaultLanguage() {
		global $db;
		$sqlQuery =  "select * from npt_languages where `code`='".$this->default_language."'";
		$lang = $db->GetRow($sqlQuery);
		$languages['id'] 	= $lang['id'];
		$languages['code'] 	= $lang['code'];
		return $languages;
	}
	
	function getArrLanguages($page_name){
		global $db;
		$sqlQuery = "select nl.code as code,nl.id as id from npt_languages nl INNER JOIN npt_pages_attributes npa ON (nl.id=npa.languages_id ) where npa.pages_title='".$page_name."'";	
		return $db->getRow($sqlQuery);
		
	}
	function GetAdministratorDefaultTemplate() {
		return $this->admin_default_template;
	}
	
	function GetAdministratorDefaultLanguage() {
		return $this->admin_default_language;
	}
	
	function GetSiteKeywords() {
		return $this->site_keywords;
	}
	
	function GetSiteKeywordsByLanguage($language) {
		//$language="en";
		return ((!isset($this->site_keywords[$language]) || (isset($this->site_keywords[$language]) && $this->site_keywords[$language] == "")) ? $this->site_keywords[$this->default_language] : $this->site_keywords[$language]);
	}
	
	function GetSiteHomePage() {
		return $this->site_home_page;
	}
	
	function GetSiteLogo() {
		return $this->site_logo;
	}
	
	function GetSiteDescription() {
		return $this->site_description;
	}
	
	function GetSiteDescriptionByLanguage($language) {
		$language="en";
		return ((!isset($this->site_description[$language]) || (isset($this->site_description[$language]) && $this->site_description[$language] == "")) ? $this->site_description[$this->default_language] : $this->site_description[$language]);
	}

	function GetSiteEmailFromName() {
		return $this->site_email_from_name;
	}
	
	function GetSiteEmailFromNameByLanguage($language) {
		return ((!isset($this->site_email_from_name[$language]) || (isset($this->site_email_from_name[$language]) && $this->site_email_from_name[$language] == "")) ? $this->site_email_from_name[$this->default_language] : $this->site_email_from_name[$language]);
	}

	function GetSiteEmailFrom() {
		return $this->site_email_from;
	}
	
	function GetSiteEmailFromByLanguage($language) {
		return ((!isset($this->site_email_from[$language]) || (isset($this->site_email_from[$language]) && $this->site_email_from[$language] == "")) ? $this->site_email_from[$this->default_language] : $this->site_email_from[$language]);
	}
	
	function GetMailer() {
		return (int) $this->mailer;
	}
	
	function GetSendMailPath() {
		return $this->send_mail_path;
	}
	
	function GetSmtpAuth() {
		return (int) $this->smtp_auth;
	}
	
	function GetSmtpUser() {
		return $this->smtp_user;
	}
	
	function GetSmtpPassword() {
		return $this->smtp_pass;
	}
	
	function GetSmtpHost() {
		return $this->smtp_host;
	}
	
	function UpdateWebsiteName($configArray) {
		global $db;
		$queryLanguages = fMakeSqlQuery("SELECT * FROM #__languages");
		$rsLanguages = $db->Execute($queryLanguages);
		while (!$rsLanguages->EOF) {
			$ret = $db->Replace(fMakeSqlQuery("#__website_config"), 
				array(
					"`key`" 		=> "website_name", 
					"value" 		=> isset($configArray[$rsLanguages->fields["code"]]) ? $configArray[$rsLanguages->fields["code"]] : "", 
					"languages_id" 	=> (int) $rsLanguages->fields["id"]
				),
				array("`key`", "languages_id"), $autoquote = true);
			$rsLanguages->MoveNext();
		}
	}
	/**
	 * 
	 * @return 
	 * @param object $configArray
	 */
	function UpdateSiteKeywords($configArray) {
		global $db;
		$queryLanguages = fMakeSqlQuery("SELECT * FROM #__languages");
		$rsLanguages = $db->Execute($queryLanguages);
		while (!$rsLanguages->EOF) {
			$ret = $db->Replace(fMakeSqlQuery("#__website_config"), 
				array(
					"`key`" 		=> "site_keywords", 
					"value" 		=> isset($configArray[$rsLanguages->fields["code"]]) ? $configArray[$rsLanguages->fields["code"]] : "", 
					"languages_id" 	=> (int) $rsLanguages->fields["id"]
				),
				array("`key`", "languages_id"), $autoquote = true);
				
			$rsLanguages->MoveNext();
		}
	}
	/**
	 * 
	 * @return 
	 * @param object $configArray
	 */
	function UpdateSiteDescription($configArray) {
		global $db;
		$queryLanguages = fMakeSqlQuery("SELECT * FROM #__languages");
		$rsLanguages = $db->Execute($queryLanguages);
		while (!$rsLanguages->EOF) {
			$ret = $db->Replace(fMakeSqlQuery("#__website_config"), 
				array(
					"`key`" 		=> "site_description", 
					"value" 		=> isset($configArray[$rsLanguages->fields["code"]]) ? $configArray[$rsLanguages->fields["code"]] : "", 
					"languages_id" 	=> (int) $rsLanguages->fields["id"]
				),
				array("`key`", "languages_id"), $autoquote = true);
			$rsLanguages->MoveNext();
		}
	}
	
	function UpdateSiteFooter($configArray) {
		global $db;
		$queryLanguages = fMakeSqlQuery("SELECT * FROM #__languages");
		$rsLanguages = $db->Execute($queryLanguages);
		while (!$rsLanguages->EOF) {
			$ret = $db->Replace(fMakeSqlQuery("#__website_config"), 
				array(
					"`key`" 		=> "site_footer", 
					"value" 		=> isset($configArray[$rsLanguages->fields["code"]]) ? $configArray[$rsLanguages->fields["code"]] : "", 
					"languages_id" 	=> (int) $rsLanguages->fields["id"]
				),
				array("`key`", "languages_id"), $autoquote = true);
			$rsLanguages->MoveNext();
		}
	}
	
	function UpdateSiteDefaultLanguage($language_code) {
		global $db;
		$query = fMakeSqlQuery("UPDATE #__website_config SET value = '" . $language_code . "' WHERE `key` = 'default_language'");
		$rs = $db->Execute($query);
		if ($rs) return true; else return false;
	}
	
	function UpdateAdministratorDefaultLanguage($language_code) {
		global $db;
		$query = fMakeSqlQuery("UPDATE #__website_config SET value = '" . $language_code . "' WHERE `key` = 'admin_default_language'");
		$rs = $db->Execute($query);
		if ($rs) return true; else return false;
	}
	
	function UpdateSiteDefaultTemplate($template_name) {
		global $db;
		$query = fMakeSqlQuery("UPDATE #__website_config SET value = '" . $template_name . "' WHERE `key` = 'default_template'");
		$rs = $db->Execute($query);
		if ($rs) return true; else return false;
	}
	
	function UpdateAdministratorDefaultTemplate($template_name) {
		global $db;
		$query = fMakeSqlQuery("UPDATE #__website_config SET value = '" . $template_name . "' WHERE `key` = 'admin_default_template'");
		$rs = $db->Execute($query);
		if ($rs) return true; else return false;
	}
	
	function UpdateSiteEmailFromName($configArray) {
		global $db;
		$queryLanguages = fMakeSqlQuery("SELECT * FROM #__languages");
		$rsLanguages = $db->Execute($queryLanguages);
		while (!$rsLanguages->EOF) {
			$ret = $db->Replace(fMakeSqlQuery("#__website_config"), 
				array(
					"`key`" 		=> "site_email_from_name", 
					"value" 		=> isset($configArray[$rsLanguages->fields["code"]]) ? $configArray[$rsLanguages->fields["code"]] : "", 
					"languages_id" 	=> (int) $rsLanguages->fields["id"]
				),
				array("`key`", "languages_id"), $autoquote = true);
			$rsLanguages->MoveNext();
		}
	}
	
	function UpdateSiteEmailFrom($configArray) {
		global $db;
		$queryLanguages = fMakeSqlQuery("SELECT * FROM #__languages");
		$rsLanguages = $db->Execute($queryLanguages);
		while (!$rsLanguages->EOF) {
			$ret = $db->Replace(fMakeSqlQuery("#__website_config"), 
				array(
					"`key`" 		=> "site_email_from", 
					"value" 		=> isset($configArray[$rsLanguages->fields["code"]]) ? $configArray[$rsLanguages->fields["code"]] : "", 
					"languages_id" 	=> (int) $rsLanguages->fields["id"]
				),
				array("`key`", "languages_id"), $autoquote = true);
			$rsLanguages->MoveNext();
		}
	}
	
	function UpdateSendMailPath($send_mail_path) {
		global $db;
		$query = fMakeSqlQuery("UPDATE #__website_config SET value = '" . $send_mail_path . "' WHERE `key` = 'send_mail_path'");
		$rs = $db->Execute($query);
		if ($rs) return true; else return false;
	}
	
	function UpdateMailer($mailer) {
		global $db;
		$query = fMakeSqlQuery("UPDATE #__website_config SET value = " . $mailer . " WHERE `key` = 'mailer'");
		$rs = $db->Execute($query);
		if ($rs) return true; else return false;
	}
	
	function UpdateSmtpAuth($smtp_auth) {
		global $db;
		$query = fMakeSqlQuery("UPDATE #__website_config SET value = " . $smtp_auth . " WHERE `key` = 'smtp_auth'");
		$rs = $db->Execute($query);
		if ($rs) return true; else return false;
	}
	
	function UpdateSmtpUser($smtp_user) {
		global $db;
		$query = fMakeSqlQuery("UPDATE #__website_config SET value = '" . $smtp_user . "' WHERE `key` = 'smtp_user'");
		$rs = $db->Execute($query);
		if ($rs) return true; else return false;
	}
	
	function UpdateSmtpPassword($smtp_pass) {
		global $db;
		$query = fMakeSqlQuery("UPDATE #__website_config SET value = '" . $smtp_pass . "' WHERE `key` = 'smtp_pass'");
		$rs = $db->Execute($query);
		if ($rs) return true; else return false;
	}
	
	function UpdateSmtpHost($smtp_host) {
		global $db;
		$query = fMakeSqlQuery("UPDATE #__website_config SET value = '" . $smtp_host . "' WHERE `key` = 'smtp_host'");
		$rs = $db->Execute($query);
		if ($rs) return true; else return false;
	}
	
//	function UpdateWebsite() {
//		global $db;
//
//	}
}

?>