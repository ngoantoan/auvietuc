<?php
include_once("modules/ModuleBase.php");

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class form_register extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function form_register()
    {
        parent::ModuleBase();
    }

    function getContent($language)
    {
        $action = $this->routing->action;
        if (getRequest("action") != NULL)
            $action = getRequest("action");
        switch ($action) {
            case "ajaxRegisterContact":
                return $this->ajaxRegisterContact($language);
                break;
            default :
                return $this->view($language);
                break;
        }
    }

    function view($language)
    {
        global $webSiteName;
        $tpl = $this->getTemplatePath("form_register", "form_register");
        $education_program = $this->db->getArray("select * from education_program where status = 1");
        if ($education_program) {
            foreach ($education_program as $item) {
                $tpl->newBlock("education_program");
                $tpl->assign("title", $item['title']);
            }
        }
        return $tpl -> getOutputContent();
    }

    function ajaxRegisterContact($language) {
        global $mail_mailfrom, $mail_fromname, $mail_smtphost, $mail_smtpuser, $mail_smtppass, $mail_Bcc;
        $html = "";
        $name               = getRequest("name");
		$birthday           = getRequest("birthday");
		$email              = getRequest("email");
        $address            = getRequest("address");
        $phone              = getRequest("phone");
		$education_program  = getRequest("education_program");
		$body               = getRequest("body");
        $register_id = $this->db->GetOne("select * from contact where name = ? and phone = ? and body = ?", array($name, $phone, $body));
		if ($register_id) {
			return 2;
		}else {
			$st = $this->db->Execute("insert into contact(name, birthday, email, address, phone, education_program, body) values (?,?,?,?,?,?,?)",
				                                        array($name, $birthday, $email, $address, $phone, $education_program, $body));
			if ($st) {
                $subject = "[Âu Việt Úc] Đăng ký tư vấn";
                $tplMail = $this -> getTemplatePath("form_register", "email");
                $tplMail->assign("name",                $name);
                $tplMail->assign("birthday",            $birthday);
                $tplMail->assign("email",               $email);
                $tplMail->assign("address",             $address);
                $tplMail->assign("phone",               $phone);
                $tplMail->assign("education_program",   $education_program);
                $tplMail->assign("body",                $body);
                $html = $tplMail -> getOutputContent();
                
                $mail = new PHPMailer;
                $mail->SMTPDebug = 0; // Enables SMTP debug information - SHOULD NOT be active on production servers!
                $mail->IsSMTP(); // Using SMTP.
                $mail->Host = $mail_smtphost;
                $mail->SMTPAuth = true; // Enables SMTP authentication.
                $mail->Username = $mail_smtpuser;
                $mail->Password = $mail_smtppass;
                $mail->SMTPSecure = "ssl";
                $mail->Port = 465;
                $mail->isHTML(true);
                $mail->CharSet = 'UTF-8';
                $mail->FromName = 'Âu Việt Úc';
                $mail->AddAddress($email, "Âu Việt Úc");
                $mail->AddReplyTo($mail_mailfrom, "Âu Việt Úc");
                $mail->addBCC($mail_Bcc);
                $mail->SetFrom($mail_mailfrom, "Âu Việt Úc");
                $mail->Subject = $subject;
                $mail->Body    = $html;
                // $mail->addAttachment($pdf_path);
                $mail->Send();
				return 1;
			} else {
				return 0;
			}
		}
    }
}

?>