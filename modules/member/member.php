<?php
include_once("modules/ModuleBase.php");

class member extends ModuleBase
{
    /**
     * Constructor
     * @return common variable
     */
    function __construct()
    {
        parent::ModuleBase();
    }

    function member()
    {
        parent::ModuleBase();
    }

    function getContent($language)
    {
        $action = $this->routing->getFullAction();
        if (getRequest('action') != null)
            $action = getRequest('action');
        switch ($action) {
            case 'login':
                return $this->login($language);
                break;
            case 'register':
                return $this->register($language);
                break;
            case 'signout' :
                return $this->dang_thoat($language);
                break;
            default :
                return $this->view($language);
                break;
        }
    }

    function view($language, $msg = "") {
        $tpl = $this->getTemplatePath("member", "dang_nhap");
        return $tpl->getOutputContent();
    }

    function login($language) {
        global $usess;
        $email = getRequest("email");
        $password = getRequest("password");
        $cus = $this->db->getRow("select * from customer WHERE `email`=? and `password`=?", array($email, $password));
        if ($cus) {
            if ($cus['status'] == 0) {
                return 2;
            } else {
                $usess->set("LOGIN", $cus);
                return 1;
            }   
        } else {
            return 0;
        }
    }
    
    function register($lang)
    {
        global $usess;
        $name = getRequest("name");
        $email = getRequest("email");
        $password = getRequest("password");
        $address = getRequest("address");
        $phone = getRequest("phone");
        $checkmail = $this->db->getOne("select email from customer WHERE email=?", $email);
        if ($checkmail) {
            return -1;
        } else {
            $cuccess = $this->db->Execute("insert into customer (name, email, password, address, phone) VALUES (?,?,?,?,?)",
                array($name, $email, $password, $address, $phone));
            if ($cuccess) {
                $id = $this->db->Insert_ID();
                $user = $this->db->getRow("select * from customer where id=?", $id);
                // $usess->set("LOGIN", $user);
                return 1;
            } else {
                return 0;
            }
        }
    }

    function dang_thoat($language) {
        global $usess;
        $usess->set("LOGIN", null);
        unset($usess);
        exit();
    }

} //end class
