<?php
/**
 * NPortal Framework
 * Base Module For Admin Zone: Contain common function & abstract functions
 * Created: 15/12/2008 
 * Author: Nguyen Thanh Cong
 */
defined( '_VALID_MOS' ) or die( 'Restricted access' );
require_once("includes/constants.php");
require_once("includes/class.routing.php");
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
abstract class ModuleBase {
	var $db;
	var $tree;
	var $source_array = array();
	var $website;
	var $folder_templates;
	var $template_location;
	var $includes_location;
	var $tpl;
	var $usess;
	var $setting;
	var $arrLayout = array();
	var $site_folder;
	var $server_url;
	var $routing;
    var $LANGS = array();

	public function __construct()
    {
        global $db, $website, $folder_templates, $server_url, $site_folder, $usess, $role_usess, $setting, $arrLayout, $folder_includes;
		$this->db = $db;
		$this->usess = $usess;
		$this->role_usess = $role_usess;
		$this->website = $website;
		$this->folder_templates = $folder_templates;
		$this->template_location = $site_folder."/".$folder_templates.'/'.$website->GetDefaultTemplate();
		$this->includes_location = $folder_includes;
		$this->setting = $setting;
		$this->arrLayout = $arrLayout;
		$this->site_folder = $site_folder;
		$this->server_url = $server_url;
		$this->routing = new Routing();
	}
	
	function ModuleBase(){
		global $db, $website, $folder_templates, $server_url, $site_folder, $usess, $role_usess, $setting, $arrLayout, $folder_includes;
		$this->db = $db;
		$this->usess = $usess;
		$this->role_usess = $role_usess;
		$this->website = $website;
		$this->folder_templates = $folder_templates;
		$this->template_location = $site_folder."/".$folder_templates.'/'.$website->GetDefaultTemplate();
		$this->includes_location = $folder_includes;
		$this->setting = $setting;
		$this->arrLayout = $arrLayout;
		$this->site_folder = $site_folder;
		$this->server_url = $server_url;
		$this->routing = new Routing();
	}
	

	abstract function getContent($lang);


    function send_email($subject, $body, $to, $to_name) {
        global $mail_contact, $mail_mailfrom, $mail_Bcc, $mail_BccName, $mail_fromname, $mail_smtphost, $mail_smtpuser, $mail_smtppass;
        $mail = new PHPMailer(true);
        $mail->IsSMTP(); // Using SMTP.
        $mail->CharSet = 'utf-8';
        $mail->SMTPDebug = 0;
        $mail->SMTPAuth = true;
        //$mail->SMTPSecure = "tls";
        $mail->Host       = $mail_smtphost;
        $mail->Username   = $mail_smtpuser;
        $mail->Password   = $mail_smtppass;
        $mail->AddReplyTo($to,  $to_name);
        $mail->AddAddress($to, $to_name);
        $mail->AddCC($mail_Bcc, $mail_BccName);
        $mail->SetFrom($mail_mailfrom, $mail_fromname);
        $mail->Subject = $subject;
        $mail->MsgHTML($body);
        return $mail->Send();
    }

    function send_email_attached($subject, $body, $file, $to, $to_name) {
        global $mail_contact, $mail_mailfrom, $mail_fromname, $mail_smtphost, $mail_smtpuser, $mail_smtppass;
        $mail = new PHPMailer(true);
        $mail->IsSMTP(); // Using SMTP.
        $mail->CharSet = 'utf-8';
        $mail->SMTPDebug = 0;
        $mail->SMTPAuth = false;
        $mail->SMTPSecure = "tls";
        $mail->Host       = $mail_smtphost;
        $mail->Username   = $mail_smtpuser;
        $mail->Password   = $mail_smtppass;

        $mail->AddAttachment($file['tmp_name'], $file['name']);

        $mail->AddReplyTo($mail_contact,  $mail_fromname);
        $mail->AddAddress($to, $to_name);
        $mail->AddCC($mail_contact, $mail_fromname);
        $mail->SetFrom($mail_mailfrom, $mail_fromname);
        $mail->Subject = $subject;
        $mail->MsgHTML($body);

        return $mail->Send();
    }

    function send_email_attacheds($subject, $body, $file,$file2, $to, $to_name) {
        global $mail_contact, $mail_mailfrom, $mail_fromname, $mail_smtphost, $mail_smtpuser, $mail_smtppass;
        $mail = new PHPMailer(true);
        $mail->IsSMTP(); // Using SMTP.
        $mail->CharSet = 'utf-8';
        $mail->SMTPDebug = 0;
        $mail->SMTPAuth = true;
        $mail->SMTPSecure = "tls";
        $mail->Host       = $mail_smtphost;
        $mail->Username   = $mail_smtpuser;
        $mail->Password   = $mail_smtppass;

        $mail->AddAttachment($file['tmp_name'], $file['name']);
        $mail->AddAttachment($file2['tmp_name'], $file2['name']);

        $mail->AddReplyTo($mail_contact,  $mail_fromname);
        $mail->AddAddress($to, $to_name);
        $mail->AddCC($mail_contact, $mail_fromname);
        $mail->SetFrom($mail_mailfrom, $mail_fromname);
        $mail->Subject = $subject;
        $mail->MsgHTML($body);

        return $mail->Send();
    }

    function randomPass($length=6) {
        $salt 		= "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        $makepass	= '';
        mt_srand(10000000*(double)microtime());
        for ($i = 0; $i < $length; $i++)
            $makepass .= $salt[mt_rand(0,61)];
        return $makepass;
    }

    function getStaticContent($code) {
        $ret = $this->db->GetOne("select detail from agent where code=?", $code);
        if($ret) {
            return $ret;
        }
        return "";
    }

    function getLanguageCode($id){
		$language_array = $id;
		if(empty($id)) {
			//Get Default languages
			$language_array = $this->usess->get('lang');
		}
		$sqlQuery = "select `code` from npt_languages where id=".$language_array['id'];
		$code = $this->db->GetOne($sqlQuery);
		return $code;
	}

    function getLangCodeByPageName($page_name) {
        $sqlQuery = "select nl.code from npt_languages nl INNER JOIN npt_pages_attributes npa ON (nl.id=npa.languages_id ) where npa.pages_title='" . $page_name . "'";
        return $this -> db -> GetOne($sqlQuery);
    }

    function getParentCodeByPageName($page_name) {
        return $this -> db -> GetOne("select p.code from npt_pages as p inner join npt_pages_attributes pa on p.id = pa.pages_id where pa.pages_title=?", $page_name);
    }

	function getTemplatePath($module_name, $tplFilename) {
		try{
			if(empty($module_name)) {
				throw new Exception("Modulebase: Module name is null");
			}
            $lang_code = $this -> getLangCodeByPageName($this -> routing -> getPageName());
			$tpl = new TemplatePower(
				$this->folder_templates
				.'/'
				.$this->website->GetDefaultTemplate()
				.'/modules/'
				.$module_name
				.'/'
				.$tplFilename.'.tpl');
			$tpl->prepare();
			$tpl->assignGlobal('template_location', $this->template_location);
			$tpl->assignGlobal('site_folder', $this->site_folder);
            $LANGS = array();
             $file_module_lang = "languages/modules/$module_name/$module_name" . "_" . $lang_code . ".php";
            if (file_exists($file_module_lang)) {
                require ($file_module_lang);
                $tpl -> assignGlobal($LANGS);
            }
			return $tpl;
			
		} catch(Exception $ex) {
			throw $ex;
		}
	}
	/**
	 * Get Array Setting of Modules with $this->setting['Setting_Key'] => Setting_Value
	 * @return array Setting
	 */
	function getModuleSetting() {
		if(!empty($this->setting)){
			return $this->setting;
		}
	}
	/**
	 * 
	 * @return 
	 * @param object $key
	 */
	function getSetting($key) {
		if(!empty($this->setting)){
			if (array_key_exists($key, $this->setting)) {
			    return  $this->setting[$key];
			} else {
				return NULL;
			}
		}
		return NULL;
	}
	/**
	 * Get Template path
	 * @return path string
	 */
	function getTemplateLocation() {
		return $this->template_location;
	}
	/**
	 * 
	 * @return 
	 */
	function getWebsiteLink(){
		return $this->site_folder.'/';
	}
	/***
	 * 
	 * @return 
	 */
	function getIncludesLocation(){
		return $this->site_folder.'/'. $this->includes_location;
	}

    function getAvatarPath(){
        return $this->site_folder.'/upload/images/avatar/';
    }

	function getLibraryPath(){
		return $this->site_folder.'/upload/';
	}
    function getPathFile(){
        return $this->site_folder.'/upload/files/';
    }
    function getPath(){
        return $this->site_folder.'/upload/images/';
    }

    function getPath800(){
        return $this->site_folder.'/upload/images/800x800/';
    }
    function getPath500(){
        return $this->site_folder.'/upload/images/500x500/';
    }
	

	function getPageId(){
		global $page_id;
		return $page_id;
	}
	/**
	 * 
	 * @return 
	 */
	function getPageName(){
		global $page_name;
		return $page_name;
	}
	/**
	 * Get Language Array
	 * @return array Languages id, code
	 */
	function getLanguageArray() {
		return $this->usess['lang'];
	}
	
		/**
	 * date diff
	 * @param object $dformat
	 * @param object $endDate (yyyy-mm-dd)
	 * @param object $beginDate (yyyy-mm-dd)
	 * @return 
	 */
	function dateDiff($endDate, $beginDate)
	{
		return (strtotime($endDate) - strtotime($beginDate))/86400;
	}
	
	/**
	 * news was post out of 2 days, is old news
	 * @param object $news_date
	 * @return 
	 */
	function isNew($news_date){
		$today = date("Y-m-d H:i:s");
		if ($this->dateDiff($today, $news_date) <= 2){
			return true;
		}
		return false;
	}
	/**
	 * Remove HTML tags, including invisible text such as style and
	 * script code, and embedded objects.  Add line breaks around
	 * block-level tags to prevent word joining after tag removal.
	 */
	function strip_html_tags( $text )
	{
	    $text = preg_replace(
	        array(
	          // Remove invisible content
	            '@<head[^>]*?>.*?</head>@siu',
	            '@<style[^>]*?>.*?</style>@siu',
	            '@<script[^>]*?.*?</script>@siu',
	            '@<object[^>]*?.*?</object>@siu',
	            '@<embed[^>]*?.*?</embed>@siu',
	            '@<applet[^>]*?.*?</applet>@siu',
	            '@<noframes[^>]*?.*?</noframes>@siu',
	            '@<noscript[^>]*?.*?</noscript>@siu',
	            '@<noembed[^>]*?.*?</noembed>@siu',
	          // Add line breaks before and after blocks
	            '@</?((address)|(blockquote)|(center)|(del))@iu',
	            '@</?((div)|(h[1-9])|(ins)|(isindex)|(p)|(pre))@iu',
	            '@</?((dir)|(dl)|(dt)|(dd)|(li)|(menu)|(ol)|(ul))@iu',
	            '@</?((table)|(th)|(td)|(caption))@iu',
	            '@</?((form)|(button)|(fieldset)|(legend)|(input))@iu',
	            '@</?((label)|(select)|(optgroup)|(option)|(textarea))@iu',
	            '@</?((frameset)|(frame)|(iframe))@iu',
	        ),
	        array(
	            ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
	            "\n\$0", "\n\$0", "\n\$0", "\n\$0", "\n\$0", "\n\$0",
	            "\n\$0", "\n\$0",
	        ),
	        $text );
	    return strip_tags( $text );
	}
	
	/*
 	* Get Summary From a Long Paragraph
	*/
	function get_summary($text, $wordnum = 15) {
		if(empty($text)) return "";
      /* count multiple spaces as one space */
      $text  = preg_replace("/ +/", " ", $text);
      $pos   = 0;
      $count = 0;
      
      while(($pos = strpos($text, ' ', $pos + 1)) !== false) {
          if (++$count >= $wordnum) {
              break;
          }
      }
      if ($pos<=$wordnum)  return($text);       
      $summary = substr($text, 0, $pos);
      return($summary.' ...');
	}
	

	function generateOptions($table_name, $key_column, $val_column, $condition ="",$option1 ="", $selected_key = ""){
        $sqlQuery = "select ".$key_column .", ". $val_column ." from ".$table_name;
		if ($condition != "") $sqlQuery .= " where $condition";
		$re = $this->db->Execute($sqlQuery);
		$html ="";
		if (!$re) return "Error! invalid table or column name";
		if ($option1 != "") $html .='<option value="">'.$option1.'</option>';
		while(!$re->EOF){
				if($selected_key == $re->fields[$key_column]){
					$html .= "<option value='".$re->fields[$key_column]."' selected>".$re->fields[$val_column]."</option>";
				}else{
					$html .= "<option value='".$re->fields[$key_column]."'>".$re->fields[$val_column]."</option>";
				}
			$re->MoveNext();
		}
		return $html;
	}
	
	function currencyFormat($number, $decimals = 0 , $suffix = "đ"){
		return number_format($number, $decimals, ',', '.').' '.$suffix;
	}

	function Paging($total, $current_page, $page_code, $lang, $action, $var1, $seo_string){
			if($current_page==0) {
				$current_page = 1;
			}
			$end	= $current_page+4;
			$start	= $current_page-4;
			$first	= 1;
			//Previous page
			$paging_string ="";
			$paging_link = "";
			if($current_page>1){
				$pagepr=$current_page-1;
				$paging_link = $this->routing->buildLink($page_code, $lang, $action, $var1, $pagepr, $seo_string);
				$paging_string .='<SPAN><A class="pagelink" title="Previous"  href="'.$paging_link.'"><<<</A></SPAN>';
			}else{
				$paging_string .=" <SPAN class='pages_disabled'><<<</SPAN>";
			}
			
			//Paging number
			if ($start<$first) {
			 $start=$first;
			} else {
				if($start > $first){
					$paging_link = $this->routing->buildLink($page_code, $lang, $action, $var1, $first, $seo_string);
					$paging_string .='<SPAN><a  class="pagelink"  href="'.$paging_link.'">';
			    	$paging_string .= $first . '</a></SPAN>';
					if ($start>$first+1) $paging_string .='<SPAN >&nbsp;...&nbsp;</SPAN>';
				}
			}
			if ($end>$total) $end=$total;
			
			for ($i = $start; $i <= $end; $i ++) {
				  if ($i == $current_page) {
					$paging_string .='<SPAN class="pages_current">' . $i . '</SPAN>';
				  } else {
				  	$paging_link = $this->routing->buildLink($page_code, $lang, $action, $var1, $i, $seo_string);
					$paging_string .='<SPAN ><a class="pagelink"  href="'.$paging_link.'">';
					$paging_string .= $i . '</a></SPAN> ';		  
				  }
			}
			
			if($end < $total) {
				if ($end < $total-1) $paging_string .='<SPAN >&nbsp;...&nbsp;</SPAN>';
				$paging_link = $this->routing->buildLink($page_code, $lang, $action, $var1, $end, $seo_string);
				$paging_string .='<SPAN><a class="pagelink" href="'.$paging_link.'">'; 
				$paging_string .= $total . '</a></SPAN>';
			}
			
			//Next page
			if($current_page<$total){
				$pagepr=$current_page+1;
				$paging_link = $this->routing->buildLink($page_code, $lang, $action, $var1, $pagepr, $seo_string);
				$paging_string .='<SPAN ><a class="pagelink" href="'.$paging_link.'" title="Next">>>></a></SPAN>';
			}else{
				$paging_string .=" <SPAN class='pages_disabled'>>>></SPAN>";
			}
			$strStyle="<style>/*Paging Style*/
					.bluelink{	color:#444444;
					font-weight:bold;	text-decoration:none;}
					.pagelink{border:1px solid #B7D8EE;font-weight:bold;
					cursor:pointer;
					display:inline;
					margin:0.25em;
					padding:0.3em 0.5em;
					text-align:center;}
					.pages_disabled { 
					border:1px solid #B7D8EE;
					display:inline;
					margin:0.25em;
					padding:0.3em 0.5em;
					text-align:center; COLOR: #c6d6e6; BACKGROUND-COLOR: #fafdfd;}
					.pages_current {
					background-color:#D2EAF6;
					border:1px solid #B7D8EE;
					cursor:pointer;
					display:inline;
					margin:0.25em;
					padding:0.3em 0.5em;
					text-align:center;
			}</style>";
		return $strStyle.$paging_string;
	}

    function CheckSignIn($session_name, $key){        
        if($this->usess->getState()=== 'active'){            
            if($this->usess->has("$session_name")){                                
                $check = $this->usess->get("$session_name");
                if(isset($check["$key"]) && !empty($check["$key"])) 
                    return true;
                return false; 
            }
            return false;
        }
        return false;
    }

    function getRoot($webfolder = "") {
        $whitelist = array(
            '127.0.0.1',
            '::1'
        );

        $path = "";

        if(in_array($_SERVER['REMOTE_ADDR'], $whitelist)){
            $path = $_SERVER["DOCUMENT_ROOT"] . $this->site_folder."/". $webfolder;
        } else {
            $path = $_SERVER["DOCUMENT_ROOT"] . $webfolder;
        }

        return $path;
    }
    function star($rate)
    {
        switch ($rate) {
            case "1":
                return "<span class=\"fa fa-star\" data-rating=\"1\"></span>
                    <span class=\"fa fa-star-o\" data-rating=\"2\"></span>
                    <span class=\"fa fa-star-o\" data-rating=\"3\"></span>
                    <span class=\"fa fa-star-o\" data-rating=\"4\"></span>
                    <span class=\"fa fa-star-o\" data-rating=\"5\"></span>";
                break;
            case "2":
                return "<span class=\"fa fa-star\" data-rating=\"1\"></span>
                    <span class=\"fa fa-star\" data-rating=\"2\"></span>
                    <span class=\"fa fa-star-o\" data-rating=\"3\"></span>
                    <span class=\"fa fa-star-o\" data-rating=\"4\"></span>
                    <span class=\"fa fa-star-o\" data-rating=\"5\"></span>";
                break;
            case "3":
                return "<span class=\"fa fa-star\" data-rating=\"1\"></span>
                    <span class=\"fa fa-star\" data-rating=\"2\"></span>
                    <span class=\"fa fa-star\" data-rating=\"3\"></span>
                    <span class=\"fa fa-star-o\" data-rating=\"4\"></span>
                    <span class=\"fa fa-star-o\" data-rating=\"5\"></span>";
                break;
            case "4":
                return "<span class=\"fa fa-star\" data-rating=\"1\"></span>
                    <span class=\"fa fa-star\" data-rating=\"2\"></span>
                    <span class=\"fa fa-star\" data-rating=\"3\"></span>
                    <span class=\"fa fa-star\" data-rating=\"4\"></span>
                    <span class=\"fa fa-star-o\" data-rating=\"5\"></span>";
                break;
            case "5":
                return "<span class=\"fa fa-star\" data-rating=\"1\"></span>
                    <span class=\"fa fa-star\" data-rating=\"2\"></span>
                    <span class=\"fa fa-star\" data-rating=\"3\"></span>
                    <span class=\"fa fa-star\" data-rating=\"4\"></span>
                    <span class=\"fa fa-star\" data-rating=\"5\"></span>";
                break;
        }
    }
    function getInfoSetting($key){
        return $info_setting=$this->db->getOne("SELECT title FROM info_setting WHERE status=1 AND code=?",$key);
    }
} //end class
?>