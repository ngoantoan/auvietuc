<?php
/***
 * Class.Routing.php
 * Nguyen Thanh Cong
 * 
 */
// ensure this file is being included by a parent file
defined( '_VALID_MOS' ) or die( 'Restricted access' );
require_once("class.portal.php");
require_once("configuration.php");
class Routing {
	var $page_code = "";
	var $lang = "";
	var $action = "";
	var $para_1 = "";
	var $para_2 = "";
	var $para_3 = "";

	public function __construct()
	{
		global $page_code, $action, $parameters, $default_page_code, $default_action, $default_lang,$seo_extention;
		$arrUrl = $this->fUrlToArray();
		if(is_array($arrUrl)){
			if(!empty($arrUrl[0])){
				if (endswith($arrUrl[0],$seo_extention)) $this->page_code = getSubStrByEndsWith($arrUrl[0],$seo_extention);			
				else $this->page_code = $arrUrl[0];
			} else {
				$this->page_code = $default_page_code;
			}
			
			$this->lang = $default_lang;
			if(!empty($arrUrl[1])){
				$this->action = $arrUrl[1];
			}
			
			if(!empty($arrUrl[2])){
				$this->para_1 = $arrUrl[2];
			} else {
				$this->para_1 = "";
			}
			if(!empty($arrUrl[3])){
				$this->para_2 = $arrUrl[3];
			} else {
				$this->para_2 = "";
			}
			if(!empty($arrUrl[4])){
				$this->para_3 = $arrUrl[4];
			} else {
				$this->para_3 = "";
			}			
		}
	}
	
	function Routing() {
		global $page_code, $action, $parameters, $default_page_code, $default_action, $default_lang,$seo_extention;
		$arrUrl = $this->fUrlToArray();
		if(is_array($arrUrl)){
			if(!empty($arrUrl[0])){
				if (endswith($arrUrl[0],$seo_extention)) $this->page_code = getSubStrByEndsWith($arrUrl[0],$seo_extention);			
				else $this->page_code = $arrUrl[0];
			} else {
				$this->page_code = $default_page_code;
			}
			
			$this->lang = $default_lang;
			if(!empty($arrUrl[1])){
				$this->action = $arrUrl[1];
			} else {
				//$this->action = $default_action;
			}
			if(!empty($arrUrl[2])){
				$this->para_1 = $arrUrl[2];
			} else {
				$this->para_1 = "";
			}
			if(!empty($arrUrl[3])){
				$this->para_2 = $arrUrl[3];
			} else {
				$this->para_2 = "";
			}
			if(!empty($arrUrl[4])){
				$this->para_3 = $arrUrl[4];
			} else {
				$this->para_3 = "";
			}			
		}
	}

	/***
	 * 
	 * @param object $page_code
	 * @param object $action
	 * @param object $var1
	 * @param object $var2
	 * @param object $seo_string
	 * @return 
	 */
	function buildLink($page_code, $lang, $action, $var1, $var2, $seo_string){
		global $server_url, $site_folder, $default_action, $default_seo_string, $seo_extention;
		
		$query = $site_folder."/".$page_code;
		if(!empty($action)){
			$query .= "/".$action;
		}
		if(!empty($var1)){
			$query .= "/".$var1;
		}
		if(!empty($var2)){
			$query .= "/".$var2;
		}
		
		if(!empty($seo_string)){
			$query .= "-".$this->make_seo_link($seo_string).$seo_extention;
		} else {
			$query .= "-".$default_seo_string.$seo_extention;
		}
		
		return $query;
	}

	/***
	 * 
	 * @param object $page_code
	 * @param object $action
	 * @param object $var1
	 * @param object $var2
	 * @param object $var3 [optional]
	 * @param object $seo_string
	 * @return 
	 */
	function buildLink_3_para($page_code, $lang, $action, $seo_string, $var1, $var2, $var3){
		global $server_url, $site_folder, $default_action, $default_seo_string, $seo_extention;
		
		$query = $site_folder."/".$page_code;
		
		if(!empty($action)){
			$query .= "/".$action;
		}

		if(!empty($seo_string)){
			$query .= "/".$this->make_seo_link($seo_string).$seo_extention;
		} else {
			$query .= "".$default_seo_string.$seo_extention;
		}
		if(!empty($var1)){
			$query .= "-".$var1;
		}
		if(!empty($var2)){
			$query .= "-".$var2;
		}
		if(!empty($var3)){
			$query .= "?key=".$var3;
		}
		return $query;
	}
	/**
	 * Get page code
	 * @return string
	 */
	function getPageName(){
		return $this->page_code;
	}
	function getPageCode(){
		return $this->page_code;
	}
	/**
	 * Get Action (default: list)
	 * @return string
	 */
	function getAction(){
		$para = explode("-", $this->action, 2);
		return $para[0];
	}

	/***
	 * 
	 * @return 
	 */
	function getLang(){
		global $default_lang;
		return $default_lang;
	}
	/**
	 * get parameter string
	 * @return string
	 */
	function getVar1(){
		$para = explode("-", $this->para_1, 2);
		return $para[0];
	}
    function getIdVar1(){
        $para = explode("-", $this->para_1);
        return $para[count($para)-1];
    }
	/**
	 * 
	 * @return 
	 */
	function getVar2(){
		$para = explode("-", $this->para_2, 2);
		return $para[0];
	}
	
	function getVar3(){
		$para = explode("-", $this->para_3, 2);
		return $para[0];
	}

    function GetLink($page_name, $action, $var1="", $var2=""){
        global $site_folder;
        $query = $site_folder."/".$page_name;
        if(!empty($action)){
            $query .= "/".$action;
        }

        if(!empty($var1) && !empty($var2)){
            $query .= "/".$var1. "/".$this->make_seo_link($var2);
        } else if(!empty($var1)) {
            $query .= "/".$this->make_seo_link($var1);
        }
        return $query;
    }

    function getFullAction(){
        return $this->action;
    }

    function getParam(){
        $para = explode("-", $this->action);
        return $para[count($para) - 1];
    }

	function getParam1(){
		$para = explode("-", $this->para_1);
		return $para[count($para) - 1];
	}
    function getParam2(){
        $para = explode("-", $this->para_2);
        return $para[count($para) - 1];
    }
    function getFullParam1(){
        return $this->para_1;
    }
	/***
	 * 
	 * @param object $string
	 * @return 
	 */
	function make_seo_link($string) {
		$string_replace = trim($string);
		
		$marTViet=array("à","á","ạ","ả","ã","â","ầ","ấ","ậ","ẩ","ẫ","ă",
		"ằ","ắ","ặ","ẳ","ẵ","è","é","ẹ","ẻ","ẽ","ê","ề"
		,"ế","ệ","ể","ễ",
		"ì","í","ị","ỉ","ĩ",
		"ò","ó","ọ","ỏ","õ","ô","ồ","ố","ộ","ổ","ỗ","ơ"
		,"ờ","ớ","ợ","ở","ỡ",
		"ù","ú","ụ","ủ","ũ","ư","ừ","ứ","ự","ử","ữ",
		"ỳ","ý","ỵ","ỷ","ỹ",
		"đ","Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J",
		"K","L","Z","X","C","V","B","N","M",
		"À","Á","Ạ","Ả","Ã","Â","Ầ","Ấ","Ậ","Ẩ","Ẫ","Ă"
		,"Ằ","Ắ","Ặ","Ẳ","Ẵ",
		"È","É","Ẹ","Ẻ","Ẽ","Ê","Ề","Ế","Ệ","Ể","Ễ",
		"Ì","Í","Ị","Ỉ","Ĩ",
		"Ò","Ó","Ọ","Ỏ","Õ","Ô","Ồ","Ố","Ộ","Ổ","Ỗ","Ơ"
		,"Ờ","Ớ","Ợ","Ở","Ỡ",
		"Ù","Ú","Ụ","Ủ","Ũ","Ư","Ừ","Ứ","Ự","Ử","Ữ",
		"Ỳ","Ý","Ỵ","Ỷ","Ỹ",
		"Đ", "?","&",  "'", " ", "/", ",", "#", ".", "“", "”", "%", "--", "(", ")");
		
		$marKoDau=array("a","a","a","a","a","a","a","a","a","a","a"
		,"a","a","a","a","a","a",
		"e","e","e","e","e","e","e","e","e","e","e",
		"i","i","i","i","i",
		"o","o","o","o","o","o","o","o","o","o","o","o"
		,"o","o","o","o","o",
		"u","u","u","u","u","u","u","u","u","u","u",
		"y","y","y","y","y",
		"D","q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j",
		"k","l","z","x","c","v","b","n","m",
		"a","a","a","a","a","a","a","a","a","a","a","a"
		,"a","a","a","a","a",
		"e","e","e","e","e","e","e","e","e","e","e",
		"i","i","i","i","i",
		"o","o","o","o","o","o","o","o","o","o","o","o"
		,"o","o","o","o","o",
		"u","u","u","u","u","u","u","u","u","u","u",
		"y","y","y","y","y",
		"d", "","-","", "-", "", "", "", "-", "", "", "", "", "", "");
		return str_replace($marTViet,$marKoDau,$string_replace);
	}

function make_seo_link2($string) {
		$string_replace = trim($string);
		
		$marTViet=array( "?", "'", " ", "/", ",", "#", ".", "“", "”", "%", "--");
		
		$marKoDau=array( "","", "-", "", "", "", "-", "", "", "", "");
		return str_replace($marTViet,$marKoDau,$string_replace);
	}
	/**
	 * 
	 * @return 
	 */
	function fGetSelfUrl() { 
		$s = empty($_SERVER["HTTPS"]) ? '' : ($_SERVER["HTTPS"] == "on") ? "s" : ""; 
		$protocol = fLeftToStringPattern(strtolower($_SERVER["SERVER_PROTOCOL"]), "/") . $s; 
		$port = ($_SERVER["SERVER_PORT"] == "80") ? "" : (":" . $_SERVER["SERVER_PORT"]);
		$_SERVER["REQUEST_URI"] = $_SERVER['PHP_SELF'] . '?' . $_SERVER['QUERY_STRING'];
		return $protocol . "://" . $_SERVER['SERVER_NAME'] . $port . $_SERVER["REQUEST_URI"]; 
	}
	/**
	 * 
	 * @param object $fullURL [optional]
	 * @return 
	 */
	function fUrlToArray($fullURL = false) {
		global $site_folder;	
		$site_folder1 = substr($site_folder, 1, strlen($site_folder)-1);
		$query_string = "";
		if(isset($_GET["query"])) {
			$query_string = $_GET["query"];//$_SERVER['PHP_SELF'] . '?' . $_SERVER['QUERY_STRING'];
		}
		return explode("/",(($fullURL) ? fGetSelfUrl() : (($site_folder1)? str_replace("/" . $site_folder1 . "/", "", $query_string) : fRight($query_string, strlen($query_string)))));
		//return explode("/",(($fullURL) ? fGetSelfUrl() : (($site_folder1)? str_replace("/" . $site_folder1 . "/", "", $query_string) : fRight($query_string, strlen($query_string) - 0))));
	} 

}
?>