<?php
// ensure this file is being included by a parent file
defined('_VALID_MOS') or die('Restricted access');
require_once ("class.portal.php");
class Page {

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
	
	function Page() {
		global $db, $website, $usess;
		$this -> db = $db;
		$this -> website = $website;
		$this -> sess = $usess;
	}

	/**
	 * Get language ID, if null will return id of vietnamese
	 * @return Integer
	 * @param object $code
	 */
	function getLanguageId($code) {
		if ($code != "") {
			$sqlQuery = fMakeSqlQuery('select id from #__languages where `code` = "' . $code . '"');
			$lang_id = $this -> db -> getOne($sqlQuery);
			if ($lang_id != "") {
				return $lang_id;
			} else {
				return 1;
				//die('Languages code is not valid in database');
			}
		}
		return 1;
	}

	/**
	 * Get page ID from URL
	 * @return Page ID
	 * @param object $page_name[optional]
	 * @param object $language_code[optional]
	 */
	function GetPage($page_name = "", $lang_id = "") {
		global $folder_templates;
		if ($page_name == "") {
			$sqlQuery = fMakeSqlQuery('select value from #__website_config where `key` = "default_page_code"');
			$value = $this -> db -> getOne($sqlQuery);
			if ($value != "") {
				$sqlQuery = fMakeSqlQuery('SELECT p.id, seo_title, seo_keyword, seo_description FROM #__pages AS p,  #__pages_attributes AS pa 
WHERE  p.id = pa.pages_id AND `code` =  "' . $value . '"');
				$page_info = $this -> db -> GetRow($sqlQuery);
				if (is_array($page_info)) {
					return $page_info;
				} else {
					$this -> redirect_to_page_not_found($lang_id, $page_name);
				}
			} else {
				die('Check table npt_website_config whether or not record with "default_page_code" value in field key');
			}
		} else if ($page_name != "" && fLeft($page_name, 1) != "?") {
			$pa = explode("?", $page_name);

			$sqlQuery = fMakeSqlQuery("select p.id as id, seo_title, seo_keyword, seo_description 
				from #__pages p inner join #__pages_attributes pa on p.id = pa.pages_id 
				inner join #__languages lang on pa.languages_id = lang.id 
				where pa.pages_title = '" . $pa[0] . "'");
			$page_info = $this -> db -> GetRow($sqlQuery);

			if (is_array($page_info) && $page_info) {
				return $page_info;
			} else {
				//echo "LANG ID+> ".$lang_id;
				$this -> redirect_to_page_not_found($lang_id, $page_name);
			}
		}
	}

	/**
	 *
	 * @return
	 */
    function redirect_to_page_not_found($lang_id, $page_name) {
        global $server_url, $site_folder;
        //$page_not_found = GetSpecialPageURL(Constants::PAGE_NOT_FOUND, $lang_id);
        //header("Location: " . $server_url . $site_folder . '/' . $page_not_found);
        //echo "<body onload=\"window.location='" . $page_not_found . "'\"></body>";
        //return "";
        //$page_not_found = GetSpecialPageURL("404", $lang_id);
		// die($page_name);
        header("HTTP/1.1 404 Not Found");
        header('Location: '.$site_folder.'/404.html');
        exit();
    }

	/**
	 *
	 * @return
	 * @param object $page_id
	 */
	function getHTML($page_id) {

		$sqlQuery = fMakeSqlQuery('select html_file from #__pages where `id` = ' . $page_id . '');
		$html_file = $this -> db -> getOne($sqlQuery);
		if ($html_file != "") {
			return $html_file;
		} else {
			die('Get html_file from pages is not exist.');
		}
	}

	/**
	 *
	 * @return
	 */
	function getDefaultPage($lang_id) {
		$sqlQuery = fMakeSqlQuery('select value from #__website_config where `key` = "default_page_code"');
		$value = $this -> db -> getOne($sqlQuery);
		if ($value != "") {
			$sqlQuery = fMakeSqlQuery('select id from #__pages where `code` = "' . $value . '"');
			$page_id = $this -> db -> getOne($sqlQuery);
			if ($page_id != "") {
				return (int)$page_id;
			} else {
				$this -> redirect_to_page_not_found($lang_id);
			}
		} else {
			die('Check table npt_website_config whether or not record with "default_page_code" value in field key');
		}
	}

}
?>