<?php
/**
 * Nguyen Thanh Cong
 * 26/12/2008
 */
// ensure this file is being included by a parent file
defined('_VALID_MOS') or die('Restricted access');
// include the page navigation
global $admin_usess;
include_once ("../includes/lib.xml.php");
include_once ("../includes/constants.php");
include_once ("../includes/class.adm_ckeditor.php");
define ("THU", 1);
define ("CHI", 2);

abstract class ModuleAdminBase {
	static $search_keywords = "";
	var $db;
	var $website;
	var $sess;
	var $LANGUAGE_TEXT;
	var $xml;
	var $front_end_url;
	var $admin_url;
	var $language_code;
	var $users_rights;
	var $site_js_url;
	var $folder_templates;
	var $template_location;
	var $site_folder;
	var $folder_modules;
	var $server_url;
	var $folder_javascript;
	var $ckfinder_path;
	var $folder_includes;
	
	public function __construct()
	{
		global $db, $users_rights, $server_url, $folder_administrator, $site_folder, $website, $admin_usess, $LANGUAGE_TEXT, $front_end_url, $folder_javascript, $folder_templates, $template_location, $folder_modules, $ckfinder_path, $folder_includes;
		$this -> db = $db;
		$this -> website = $website;
		$this -> sess = $admin_usess;
		$this -> LANGUAGE_TEXT = $LANGUAGE_TEXT;
		$this -> xml = new Xml;
		$this -> users_rights = $users_rights;
		$this -> front_end_url = $front_end_url;
		$this -> admin_url = $server_url . $site_folder . '/' . $folder_administrator;
		$this -> site_js_url = $front_end_url . "/" . $folder_javascript;
		$this -> folder_templates = $folder_templates;
		$this -> template_location = $template_location;
		$this -> site_folder = $site_folder;
		$this -> ckfinder_path = $ckfinder_path;
		$this -> folder_includes = $folder_includes;

		$this -> folder_modules = $folder_modules;
		$this -> server_url = $server_url;
		$this -> language_code = $admin_usess -> get("lang");
		$this -> folder_javascript = $folder_javascript;
	}
	
	function baseModule() {
		global $db, $users_rights, $server_url, $folder_administrator, $site_folder, $website, $admin_usess, $LANGUAGE_TEXT, $front_end_url, $folder_javascript, $folder_templates, $template_location, $folder_modules, $ckfinder_path, $folder_includes;
		$this -> db = $db;
		$this -> website = $website;
		$this -> sess = $admin_usess;
		$this -> LANGUAGE_TEXT = $LANGUAGE_TEXT;
		$this -> xml = new Xml;
		$this -> users_rights = $users_rights;
		$this -> front_end_url = $front_end_url;
		$this -> admin_url = $server_url . $site_folder . '/' . $folder_administrator;
		$this -> site_js_url = $front_end_url . "/" . $folder_javascript;
		$this -> folder_templates = $folder_templates;
		$this -> template_location = $template_location;
		$this -> site_folder = $site_folder;
		$this -> ckfinder_path = $ckfinder_path;
		$this -> folder_includes = $folder_includes;
		$this -> folder_modules = $folder_modules;
		$this -> server_url = $server_url;
		$this -> language_code = $admin_usess -> get("lang");
		$this -> folder_javascript = $folder_javascript;
	}

	abstract function main();


    function check_role($page_role) {
        $_user = $this -> sess->get("USER");
        if($_user) {
            $roles = $this->db->GetArray("select r.code from npt_users as u inner join user_role as ur on u.id = ur.user_id inner join npt_roles as r on r.id = ur.role_id where u.id = ? and r.code =?",
                array($_user['id'], $page_role));
            if($roles && count($roles) > 0) {

                    return true;

            }
        }
        return false;
    }

	function SetKeywords() {
		$this -> search_keywords = strval(mosGetParam($_POST, 'search_keywords', ''));
	}

    function send_email($subject, $body, $to, $to_name) {
        global $mail_contact, $mail_mailfrom, $mail_fromname, $mail_smtphost, $mail_smtpuser, $mail_smtppass;
        $mail = new PHPMailer(true);
        $mail->IsSMTP(); // Using SMTP.
        $mail->CharSet = 'utf-8';
        $mail->SMTPDebug = 0;
        $mail->SMTPAuth = true;
        $mail->Port       = 25;
        $mail->Host       = $mail_smtphost;
        $mail->Username   = $mail_smtpuser;
        $mail->Password   = $mail_smtppass;
        $mail->AddReplyTo($mail_contact,  $mail_fromname);
        $mail->AddAddress($to, $to_name);
        $mail->AddCC($mail_contact, $mail_fromname);
        $mail->SetFrom($mail_mailfrom, $mail_fromname);
        $mail->Subject = $subject;
        $mail->MsgHTML($body);
        return $mail->Send();
    }

	function checkarray($arr, $id) {
		$exist = FALSE;
		foreach ($arr as $key => $value) {
			if ($value == $id) {
				$exist = TRUE;
				break;
			}
		}
		return $exist;
	}

	function BuildStringToArray($giaiarray = "", $number = 0, $exp = ",", $prefix = ",") {
		$giaistr = "";
		if (is_array($giaiarray)) {
			foreach ($giaiarray as $key => $value) {
				$k = key(array_slice($giaiarray, -1, 1, TRUE));

				if ($k == $key) {
					$giaistr .= $value;
				} else {
					$giaistr .= $value . $prefix;
				}
			}
			return $giaistr;
		} else {
			return "";
		}
	}

	function generateCheckBoxTour($selected_key = "", $category_id = 0) {
		$sqlQuery = "select id, name, sku from products where `status`=1 ";
        if($category_id > 0) {
            $sqlQuery .= " and category_id =".$category_id;
        }
		$rs = $this -> db -> Execute($sqlQuery);

		$check = "";
		if ($selected_key != "") {
			$selected_key = explode(",", trim($selected_key));
		} else {
			$selected_key = 0;
		}
		$html = '';
		if (!$rs)
			return "Error! invalid table or column name ";
		$i = 1;
		while (!$rs -> EOF) {

			$html .= '<div class="child">';
			if (is_array($selected_key)) {
				if ($this -> checkarray($selected_key, $rs -> fields['id'])) {

					$html .= "<input id='products' checked='checked' class='products' style='margin-right:5px;margin-bottom:5px' type='checkbox' name='products[]' value='" . $rs -> fields['id'] . "' ><label style='padding-right:5px;'> " . $rs -> fields['name']." - ". $rs-> fields['sku']. "</label>";
					$html .= '<div class="clear"></div>';

				} else {
					$html .= "<input id='products'  class='products' style='margin-right:5px;margin-bottom:5px' type='checkbox' name='products[]' value='" . $rs -> fields['id'] . "' ><label style='padding-right:5px;'> " . $rs -> fields['name']." - ". $rs-> fields['sku'] . "</label>";
					$html .= '<div class="clear"></div>';
				}
			} else {

				$html .= "<input id='products'  class='products' style='margin-right:5px;margin-bottom:5px' type='checkbox' name='products[]' value='" . $rs -> fields['id'] . "' ><label style='padding-right:5px;'> " . $rs -> fields['name']." - ". $rs-> fields['sku'] . "</label>";
				$html .= '<div class="clear"></div>';

			}
			$html .= "</div>";
			$rs -> MoveNext();
		}
		if ($rs)
			$rs -> Close();
		return $html;
	}

	function getLibraryPath() {
		return $this -> site_folder . '/upload/';
	}

	function getLibraryPath500x500() {
		return $this -> site_folder . '/upload/images/500x500/';
	}

	function getLibraryPath375x250() {
		return $this -> site_folder . '/upload/images/375x250/';
	}

	function getHtmlFile() {
		$results = $this -> xml -> parse('../templates/' . $this -> website -> GetDefaultTemplate() . '/template.configuration.xml', 'FILE');
		return $results;
	}

	function generateOptions2($table_name, $key_column, $val_column, $condition = "", $option1 = "", $selected_key = "") {
		$sqlQuery = "select " . $key_column . ", " . $val_column . " from " . $table_name;
		if ($condition != "")
			$sqlQuery .= " where $condition";
		$re = $this -> db -> Execute(fMakeSqlQuery($sqlQuery));
		$html = "";
		if (!$re)
			return "Error! invalid table or column name";
		if ($option1 != "")
			$html .= '<option value="NULL">' . $option1 . '</option>';
		while (!$re -> EOF) {
			if ($selected_key == $re -> fields[$key_column]) {
				$html .= "<option value='" . $re -> fields[$key_column] . "' selected>" . $re -> fields[$val_column] . "</option>";
			} else {
				$html .= "<option value='" . $re -> fields[$key_column] . "'>" . $re -> fields[$val_column] . "</option>";
			}
			$re -> MoveNext();
		}
		return $html;
	}

	function make_seo_link($string) {
		$string_replace = trim($string);

		$marTViet = array("à", "á", "ạ", "ả", "ã", "â", "ầ", "ấ", "ậ", "ẩ", "ẫ", "ă", "ằ", "ắ", "ặ", "ẳ", "ẵ", "è", "é", "ẹ", "ẻ", "ẽ", "ê", "ề", "ế", "ệ", "ể", "ễ", "ì", "í", "ị", "ỉ", "ĩ", "ò", "ó", "ọ", "ỏ", "õ", "ô", "ồ", "ố", "ộ", "ổ", "ỗ", "ơ", "ờ", "ớ", "ợ", "ở", "ỡ", "ù", "ú", "ụ", "ủ", "ũ", "ư", "ừ", "ứ", "ự", "ử", "ữ", "ỳ", "ý", "ỵ", "ỷ", "ỹ", "đ", "À", "Á", "Ạ", "Ả", "Ã", "Â", "Ầ", "Ấ", "Ậ", "Ẩ", "Ẫ", "Ă", "Ằ", "Ắ", "Ặ", "Ẳ", "Ẵ", "È", "É", "Ẹ", "Ẻ", "Ẽ", "Ê", "Ề", "Ế", "Ệ", "Ể", "Ễ", "Ì", "Í", "Ị", "Ỉ", "Ĩ", "Ò", "Ó", "Ọ", "Ỏ", "Õ", "Ô", "Ồ", "Ố", "Ộ", "Ổ", "Ỗ", "Ơ", "Ờ", "Ớ", "Ợ", "Ở", "Ỡ", "Ù", "Ú", "Ụ", "Ủ", "Ũ", "Ư", "Ừ", "Ứ", "Ự", "Ử", "Ữ", "Ỳ", "Ý", "Ỵ", "Ỷ", "Ỹ", "Đ", "?", "'", " ", "/", ",", "#", ".", "“", "”", "%", "--", '"', "'", "(", ")","&");

		$marKoDau = array("a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "i", "i", "i", "i", "i", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u", "y", "y", "y", "y", "y", "d", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "I", "I", "I", "I", "I", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "U", "U", "U", "U", "U", "U", "U", "U", "U", "U", "U", "Y", "Y", "Y", "Y", "Y", "D", "", "", "-", "", "", "", "-", "", "", "", "", "", "", "", "","");
		return strtolower(str_replace($marTViet, $marKoDau, $string_replace));
	}

	function make_seo_link2($string) {
		$string_replace = trim($string);

		$marTViet = array("%20", "%5B", "%5D", "%21", "%22", "%23", "%24", "%25", "%26", "%27", "%28", "%29", "%2A", "%2B", "%2C", "%2D", "%2E", "%2F", "%3A", "%3B", "%3C", "%3D", "%3E", "%3F", "%5C", "%5E", "%5F", "%7B", "%7C", "%7D", "%7E");

		$marKoDau = array(" ", "[", "]", "!", '"', "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "\\", "^", "_", "<", "<", "`", "{", "|", "}", "~");
		return str_replace($marTViet, $marKoDau, $string_replace);
	}

	/**
	 * Get default languages
	 * @return
	 */
	function getLanguageId() {
		$sqlQuery = fMakeSqlQuery('SELECT `id` from #__languages where `code`="' . $this -> language_code . '"');
		$LanguageId = $this -> db -> GetOne($sqlQuery);
		if ($LanguageId) {
			return $LanguageId;
		} else {
			$sqlQuery = fMakeSqlQuery("SELECT `id` from #__languages where `code`='us_en'");
			$LanguageId = $this -> db -> GetOne($sqlQuery);
			if ($LanguageId) {
				return $LanguageId;
			} else {
				return 0;
			}
		}
	}

	/**
	 *
	 * @return
	 * @param object $id
	 */
	function getLanguageCode($id) {
		$sqlQuery = fMakeSqlQuery('SELECT `code` from #__languages where `id`="' . $id . '"');
		$re = $this -> db -> Execute($sqlQuery);
		if ($re) {
			return $re -> fields['code'];
		} else {
			return 0;
		}
	}

	/**
	 *
	 * @return
	 * @param object $id
	 */
	function getLanguageIcon($id) {
		$sqlQuery = fMakeSqlQuery('SELECT `icon` from #__languages where `id`="' . $id . '"');
		$re = $this -> db -> Execute($sqlQuery);
		if ($re) {
			return $re -> fields['icon'];
		} else {
			return 0;
		}
	}

	/**
	 * Get languages List
	 * @return Array List
	 */
	function getLanguages() {
		$lang = "";
		$ret = array();
		$sqlQuery = "select * from npt_languages where `status`=1";
		$re = $this -> db -> Execute($sqlQuery);
		$ret = $re -> getArray();
		return $ret;
	}

	/**
	 *
	 * @return
	 * @param object $tpl
	 * @param object $ajax_javascript[optional]
	 * @param object $message[optional]
	 */
	function bindJSMessage($tpl, $ajax_javascript = "", $message = "") {
		global $json, $front_end_url, $folder_javascript;
		if ($message != '') {
			$tpl -> newBlock("message");
			$tpl -> assign('message', $message);
		}
		$tpl -> assignGlobal(Array(
		// text
		"site_js_url" => $front_end_url . "/" . $folder_javascript, "location" => "templates/" . $this -> website -> GetAdministratorDefaultTemplate(), "site_title" => $this -> website -> GetWebsiteNameByLanguage($this -> sess -> get("lang")), "language" => $this -> website -> GetAdministratorDefaultLanguage(), "javascript" => $ajax_javascript));
	}

	/**
	 *
	 * @return List Option Languages
	 * @param object $selectedLanguage[optional]
	 */
	function listLanguages($selectedLanguage = "") {
		$lang = "";
		$sqlQuery = "select * from npt_languages where `status` = 1";
		$re = $this -> db -> CacheExecute(3600, $sqlQuery);

		while ($re && !$re -> EOF) {
			if ($selectedLanguage != "" && $selectedLanguage == $re -> fields['id']) {
				$lang .= "<option value='" . $re -> fields['id'] . "' selected>" . $re -> fields['description'] . "</option>";
			} else {
				$lang .= "<option value='" . $re -> fields['id'] . "'>" . $re -> fields['description'] . "</option>";
			}
			$re -> MoveNext();
		}
		return $lang;
	}

	/**
	 *
	 * @param object $table_name
	 * @param object $key_column
	 * @param object $val_column
	 * @param object $selected_key [optional]
	 * @return
	 */
	function generateList($table_name, $key_column, $val_column, $selected_key = "", $condition="") {
		$sqlQuery = "select " . $key_column . ", " . $val_column . " from " . $table_name;
        if($condition != "") {
            $sqlQuery .= " where ".$condition;
        }
		$re = $this -> db -> Execute($sqlQuery);
		$html = "";
		if (!$re)
			return "Error! invalid table or column name";
		while (!$re -> EOF) {
			if ($selected_key == $re -> fields[$key_column]) {
				$html .= "<option value='" . $re -> fields[$key_column] . "' selected>" . $re -> fields[$val_column] . "</option>";
			} else {
				$html .= "<option value='" . $re -> fields[$key_column] . "'>" . $re -> fields[$val_column] . "</option>";
			}
			$re -> MoveNext();
		}
		return $html;
	}

	function generateListFromArr($arr, $selected_key = "") {
		$html = "";
		foreach ($arr as $key => $value) {
			if ($selected_key == $key) {
				$html .= "<option value='" . $key . "' selected>" . $value . "</option>";
			} else {
				$html .= "<option value='" . $key . "'>" . $value . "</option>";
			}
		}
		return $html;
	}
	

	function generateOptions($table_name, $key_column, $val_column, $condition = "", $option1 = "", $selected_key = "") {
		$sqlQuery = "select " . $key_column . ", " . $val_column . " from " . $table_name;
		if ($condition != "")
			$sqlQuery .= " where $condition";
		$re = $this -> db -> Execute(fMakeSqlQuery($sqlQuery));
		$html = "";
		if (!$re)
			return "Error! invalid table or column name";
		if ($option1 != "")
			$html .= '<option value="">' . $option1 . '</option>';
		while (!$re -> EOF) {
			if ($selected_key == $re -> fields[$key_column]) {
				$html .= "<option value='" . $re -> fields[$key_column] . "' selected>" . $re -> fields[$val_column] . "</option>";
			} else {
				$html .= "<option value='" . $re -> fields[$key_column] . "'>" . $re -> fields[$val_column] . "</option>";
			}
			$re -> MoveNext();
		}
		return $html;
	}

    function generateOptionsMulti($table_name, $key_column, $val_column, $condition = "", $option1 = "", $selected_key = "") {
        $sqlQuery = "select " . $key_column . ", " . $val_column . " from " . $table_name;
        if ($condition != "")
            $sqlQuery .= " where $condition";
        $re = $this -> db -> Execute(fMakeSqlQuery($sqlQuery));
        $html = "";
        if (!$re)
            return "Error! invalid table or column name";
        if ($option1 != "")
            $html .= '<option value="">' . $option1 . '</option>';
        while (!$re -> EOF) {
            if (in_array($re -> fields[$key_column],$selected_key)) {
                $html .= "<option value='" . $re -> fields[$key_column] . "' selected>" . $re -> fields[$val_column] . "</option>";
            } else {
                $html .= "<option value='" . $re -> fields[$key_column] . "'>" . $re -> fields[$val_column] . "</option>";
            }
            $re -> MoveNext();
        }
        return $html;
    }

	function loadClass($file_name) {
		require_once ("../includes/" . $file_name);
	}

	/**
	 * Get Images From Admin Image zones
	 * @return
	 * @param object $imageName[optional]
	 */
	function getImage($imageName = "") {
		if (empty($imageName)) {
			return "templates/" . $this -> website -> GetAdministratorDefaultTemplate() . "/images/" . $imageName;
		}
	}

	/**
	 *
	 * @return String
	 * @param object $str
	 */
	function prepareString($str) {
		$olds = array('%3A', '%2C', '%7D', '%7B', '%5D', '%22', '%5B', '%20', '%3D', '<plus>');
		$news = array(':', ',', '}', '{', ']', '"', '[', ' ', '=', '+');
		return stripslashes(str_replace($olds, $news, $str));
	}


	function getTemplatePath($tplFilename, $module_name = "") {
        global $default_module, $site_folder;
		try {

            if (empty($module_name)) {
                if(getRequest("q")) {
                    $module_name = getRequest("q");
                } else {
                    $module_name = $default_module;
                }
            }
			$tpl = new TemplatePower('modules/'.$module_name . '/' . $tplFilename . '.tpl');
			$tpl -> prepare();
            $tpl -> assignGlobal('site_folder', $site_folder);
			$tpl -> assignGlobal('location', $site_folder ."/". "myadmin");
			return $tpl;

		} catch(Exception $ex) {
			throw $ex;
		}
	}

	/**
	 *
	 * @return
	 */
	function getThumbImagePath() {
		return $this -> server_url . '/' . $this -> site_folder . 'upload/';
	}

	function currencyFormat($number, $decimals = 0, $suffix = "đ") {
		return number_format($number, $decimals, ',', '.') . ' ' . $suffix;
	}

}//end class
?>