<?php
// ensure this file is being included by a parent file
defined( '_VALID_MOS' ) or die( 'Restricted access' );
class c_login {

	var $db;
	var $website;
	var $sess;

	public function __construct()
	{
		global $db, $website, $admin_usess;
		$this->db = $db;
		$this->website = $website;
		$this->sess = $admin_usess;
	}
	
	// constructor
	function c_login() {
		global $db, $website, $admin_usess;
		$this->db = $db;
		$this->website = $website;
		$this->sess = $admin_usess;
	}
	
	/**
	 * Display the login form
	 * @param array The message want to be display with the login form
	 */
	function ShowLoginForm($withMessage = "") {
		global $front_end_url, $folder_javascript;
		$tpl = new TemplatePower("modules/login/login.tpl");
		$tpl->prepare();

		$tpl->assignGlobal(Array(
			"site_js_url"				=> $front_end_url . "/" . $folder_javascript,
			"language"					=> $this->sess->get("lang"),
			"location"					=> "templates/" . $this->website->GetAdministratorDefaultTemplate(),
			"site_title"				=> $this->website->GetWebsiteNameByLanguage($this->sess->get("lang")),
			"login_action"				=> "?q=login",
			"lost_password_link"		=> "?q=lost_password",
		));
        $tpl->assignGlobal("login_message", $withMessage);
		$tpl->printToScreen();
		unset($tpl);
	}
	
	/**
	 * Process the login progress
	 */
	function ProcessLogin() {
		global $back_end_url;
		include("../includes/captcha/securimage.php");
		// $img = new Securimage();
        $valid = true;
        if($_POST && $_POST['code']) {
            $valid = true;
           	// $valid = $img->check($_POST['code']);
        }
		if($valid == true) 
		{
			$login_name = strval( mosGetParam( $_POST, 'username', '' ) );
			$password = strval( mosGetParam( $_POST, 'password', '' ) );
			
			//Need using?
			if ($login_name == '' || $password == '') {
				die( 'Restricted access' );
			}
            $pass_hash = md5($password);
			$sql = "SELECT * FROM #__users WHERE login_name = '" . trim($login_name) . "' AND password = '$pass_hash'";
			$sql = fMakeSqlQuery($sql);
			$rs = $this->db->GetRow($sql);

			if (!empty($rs)) {
				if ($rs['id']) {
				    $this->sess->set('login_id', $rs['id']);
				    $this->sess->set('login_name', $login_name);
        		    $this->sess->set('USER',$rs);
				    $_SESSION['IsAuthorized'] = true;
                    header('location: '.$back_end_url);
                    exit();
				}
			}

            $_SESSION['IsAuthorized'] = false;
            $message = "Nhập thông tin tài khoản không chính xác.";
            return $this->ShowLoginForm($message);

		} else {
			$_SESSION['IsAuthorized'] = null;
			$message = "Nhập mã bảo mật không chính xác.";
			return $this->ShowLoginForm($message);
		}
	
	}
	
	/**
	 * Process the logout progress
	 */
	function Logout() {
		$_SESSION['IsAuthorized'] = null;
		//$current_language = $this->sess->get( 'lang' );
		$this->sess->restart();
		//$this->sess->set( 'lang', $current_language );
		$message = "Đăng xuất thành công";
		$this->ShowLoginForm($message);
		
	}

}

$q = strval( mosGetParam( $_GET, 'q', '' ) );
$login = new c_login();
switch ($q) {
	case "login":
		$login->ProcessLogin();
		break;
	case "logout":
		$login->Logout();
		break;
	default:
		$login->ShowLoginForm();
}
?>