<?php
include_once ("modules/ModuleBase.php");
require_once ("includes/class.pager.php");
class agent_register extends ModuleBase {
	
	public function __construct()
    {
        parent::ModuleBase();
	}
	
	function agent_register() {
		parent::ModuleBase();
	}

	/**
	 * Override: Get banner content
	 * @return String
	 * @param object $page_name
	 */
	function getContent($language) {
		$action = $this -> routing -> getAction();
		if (getRequest('action') != null)
			$action = getRequest('action');
		switch($action) {
			case 'submit' :
				return $this -> submit($language);
				break;
			default :
				return $this -> view($language);
				break;
		}
	}

	function view($language) {
		$tpl = $this -> getTemplatePath("agent_register", "agent_register");
		$tpl -> assign("action", $this -> routing -> GetLink("dang-ky-dai-ly", "submit", ""));
		return $tpl -> getOutputContent();
    }
    
	function submit($language, $msg = "") {
        $tpl = $this -> getTemplatePath("agent_register", "email");
		$lang = $language['id'];
		$name = GetRequest('name');
		$phone = GetRequest('phone');
		$email = GetRequest('email');
		$address = GetRequest('address');
		$company = GetRequest('company');
        $content = GetRequest('content');
        
        $tpl -> assign('name', $name);
        $tpl -> assign('email', $email);
		$tpl -> assign('phone', $phone);
		$tpl -> assign('address', $address);
		$tpl -> assign('company', $company);
        $tpl -> assign('content', $content);

        if ($email) {
            $check = $this->db->GetArray("select id from agent_register where name = '".$name."' and phone = '".$phone."' and email = '".$email."' and address = '".$address."' and company = '".$company."' and content = '".$content."'");
            if (count($check) > 0) {
                if ($lang == 2) {
					$msg = "The content of this mail has been sent by you, we will respond as soon as we receive the information. Thank you!";
				} else {
					$msg = "Nội dung mail này đã được bạn gửi trước đó, chúng tôi sẽ phản hồi ngay khi nhận thông tin. Cảm ơn bạn!";
				}
            } else {
                $this->db->Execute("INSERT INTO agent_register (name, phone, email, address, company, content, created_at) VALUES ('$name', '$phone', '$email', '$address', '$company', '$content', NOW())");
                if ($lang == 2) {
                    $msg = "Thank you for your inquiry. We will contact you soon!";
                } else {
                    $msg = "Gửi email liên hệ thành công, chúng tôi sẽ phản hồi ngay khi nhận thông tin. Cám ơn bạn.";
                }
            }
        }        

        $tpl -> assign('message', $msg);

        return $tpl -> getOutputContent();
    }
}
