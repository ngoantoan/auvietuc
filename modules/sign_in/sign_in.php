<?php
include_once ("modules/ModuleBase.php");
class sign_in extends ModuleBase {

	public function __construct()
    {
		parent::ModuleBase();
	}

	function sign_in() {
		parent::ModuleBase();
	}

	/**
	 *
	 * @return
	 * @param object $page_name
	 */
	function getContent($page_name) {
		$action = $this->routing->getAction();
		if (getRequest("action") != NULL)
			$action = getRequest("action");
		switch($action) {
			case "submit" :
				return $this -> signin($page_name);
                break;
            case "logout" :
				return $this -> logout($page_name);
				break;
			default :
				return $this -> load($page_name);
				break;
		}
	}

	function load($page_name, $msg = "") {
	    global $is_device;
        $dangky = GetSpecialPageURL(Constants::PAGE_LOGIN, $page_name["id"]);
        $tpl = $this->getTemplatePath("sign_in", "sign_in");

        $tpl -> assignGlobal('login_url', $this -> routing -> buildLink_3_para($dangky, $page_name['code'], "submit", "", "", "", ""));
			
        if(getRequest("msg")) {
            $msg = $this->routing->getAction();
        }
        if ($msg != "") {
            $tpl -> newBlock('msg');
            $tpl -> assign('msg', $msg);
        }
        return $tpl -> getoutputcontent();
	}

	function signin($page_name) {
		$email = getRequest('email');
        $password = getRequest('password');
		
		$rs = $this->db->GetRow("SELECT id, fullname, phone, email, password, status FROM members WHERE email=? AND `password` = ?", array($email, $password));
		if ($rs != NULL) {
			if ($rs && $rs['status'] == 0) {
				$msg = "Tài khoản của bạn đã bị khóa, bạn hãy liên hệ BQT website để biết thêm chi tiết.";
				return $this -> load($page_name, $msg);
			}
			$this -> usess -> set('USER', $rs);
			return header("Location: " . $this->routing->buildLink_3_para("dai-ly", $page_name['id'], '', '', '', '', ''));
		} else {
			$msg = "Email đăng nhập/mật khẩu chưa đúng!";
            return $this->load($page_name, $msg);
        }
    }
    
    function logout($page_name, $msg = ""){
		$home = GetSpecialPageURL(constants::PAGE_HOME, $page_name['id']);
		if ($this -> isSignIn("USER", "email") == true) {
			$this -> usess -> set('USER', NULL);
			header('Location: '.$this -> routing -> buildLink_3_para($home, $page_name['code'], '', '', '', '', '', ''));
			exit();
		}
    }
    
    function isSignIn($session_name, $key) {
		if ($this -> usess -> getState() === 'active') {
			if ($this -> usess -> has("$session_name")) {
				$check = $this -> usess -> get("$session_name");
				if (isset($check["$key"]) && !empty($check["$key"]))
					return true;
				return false;
			}
			return false;
		}
		return false;
	}
} //end class
?>