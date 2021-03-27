<?php
include_once ("modules/ModuleBase.php");
require_once ("includes/class.pager.php");
class contact extends ModuleBase {
	
	public function __construct()
    {
        parent::ModuleBase();
	}
	
	function contact() {
		parent::ModuleBase();
	}

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
		$tpl = $this -> getTemplatePath("contact", "contact");
		return $tpl -> getOutputContent();
    }
    
	function submit($language) {
        $name = GetRequest('name');
        $phone = GetRequest('phone');
        $company = GetRequest('company');
        $email = GetRequest('email');
        $body = GetRequest('body');

        $st = $this->db->Execute("insert into contact(name, company, email, phone, body) values (?,?,?,?,?)",
				                array($name, $company, $email, $phone, $body));
        if ($st) {
            return 1;
        } else {
            return 0;
        }
    }
}
