<?php

include_once ("modules/ModuleAdminBase.php");
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

/**
 * Class common categories
 */
class c_contact extends ModuleAdminBase
{
	public function __construct()
	{
		parent::baseModule();
	}
	
    function  c_contact()
    {
        parent::baseModule();
    }
	
	function main() {
        $q = strval(mosGetParam($_GET, 'r', ''));
        switch ($q) {
			case 'getJsonList':
				 return $this->getJsonList();
				 break;			
			case 'update':
				 return $this->update();
				 break;
			case 'show':
				return $this->show();
				break;
			case 'updatedetail':
				return $this->updatedetail();
				break;
			case 'export' :
				return $this -> export();
				break;
            default:
                return $this->showList();
				break;
        }
    }

	function showList(){
        $tpl = $this->getTemplatePath('list');
		global $ckfinder_path;
		$tpl->assign('folder_lib',$this->site_folder.'/upload/');
		$tpl->assign('ckfinder_path',$ckfinder_path);
		return $tpl->getOutputContent();
	}	
	function getJsonList(){
		$sql = fMakeSqlQuery("SELECT id, `name`, birthday, address, phone, email, education_program, `body`  FROM contact");
		$this->loadClass("class.jqgrid_json_service.php");
		$jqg = new jqgridJsonService($sql);
		return $jqg->renderJson();
	}
	function show( $msg=""){
		$tpl = $this->getTemplatePath('update');
		global $ckfinder_path;
		$tpl->assign('folder_lib',$this->site_folder.'/upload/');
		$tpl->assign('ckfinder_path',$ckfinder_path);
		$tpl->assign('action',"?q=contact&r=updatedetail");
		$tpl->assign('msg',$msg);
		$id = getRequest("id");
		if($id > 0) {
			$comment = $this->db->getRow("SELECT id, `name`, company, phone, email, `body`  FROM contact WHERE id=?",$id);
			$tpl->assign('oper',"edit");
			$tpl->assign('id',$id);
			$tpl->assign('username', $comment['name']);
			$tpl->assign('company', $comment['company']);
			$tpl->assign('email', $comment['email']);
			$tpl->assign('phone', $comment['phone']);
			$oFCKeditor = new CKEditor('contents', $comment['body']);
			$tpl -> assign("ck_contents", $oFCKeditor -> getResource());

		} else {
			$tpl->assign('oper',"add");
			$oFCKeditor = new CKEditor('contents', '');
			$tpl -> assign("ck_contents", $oFCKeditor -> getResource());
		}
		return $tpl->getOutputContent();
	}

	function update(){
		$id = getRequest("id");
		$oper = getRequest('oper');
		$name = getRequest('name');
		$company = getRequest('company');
		$phone = getRequest('phone');
		$email = getRequest('email');
		$body = getRequest('body');
		switch ($oper){
			case "edit":
				$this->db->Execute("UPDATE contact SET name=?, company=?, email=?,phone=?, body=? WHERE  id=?",
					array($name,$title,$email, $phone,$body, $id));
				break;
			case "add":
				$this->db->Execute("INSERT INTO contact(`name` ,company, email, phone, body) VALUES (?,?,?,?,?)", array($name, $company, $email, $phone, $body));
				break;
			case "del":
				$this->db->Execute("delete from contact where id in ($id)");
				break;
		}
	}

	function export() {
		$contact = $this->db->getArray("select * from contact");
		if ($contact) {
			$spreadsheet = new Spreadsheet();
			$sheet = $spreadsheet->getActiveSheet();
			$i = 2;
			$sheet->setCellValue('A' . $i, "Họ tên");
			$sheet->setCellValue('B' . $i, "Ngày sinh");
			$sheet->setCellValue('C' . $i, "Đại chỉ");
			$sheet->setCellValue('D' . $i, "Số điện thoại");
			$sheet->setCellValue('E' . $i, "Email");
			$sheet->setCellValue('F' . $i, "Khóa học quan tâm");
			$sheet->setCellValue('G' . $i, "Ghi chú");
			$sheet->setCellValue('H' . $i, "Ngày đăng ký");

				$i = 3;
				foreach ($contact as $c) {
					$sheet->setCellValue('A' . $i, $c["name"]);
					$sheet->setCellValue('B' . $i, $c["birthday"]);
					$sheet->setCellValue('C' . $i, $c["address"]);
					$sheet->setCellValue('D' . $i, $c["email"]);
					$sheet->setCellValue('E' . $i, $c["phone"]);
					$sheet->setCellValue('F' . $i, $c["education_program"]);
					$sheet->setCellValue('G' . $i, $c["body"]);
					$sheet->setCellValue('H' . $i, date('d/m/Y', strtotime($c["created_at"])));
					$i++;
				}
			$writer = new Xlsx($spreadsheet);
			$file ="contacts.xlsx";
			$writer->save('../tmp/'.$file);
			header('Location: ../tmp/'.$file);
			exit();
		}
		echo "Export excel error.";
		exit();
	}
}
