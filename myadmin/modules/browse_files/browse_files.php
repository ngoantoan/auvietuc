<?php
include_once("modules/ModuleAdminBase.php");

class browse_file extends ModuleAdminBase {
var $uploadDir;
var $upload;
public function __construct()
{
	parent::baseModule();
}
	function browse_file(){
		global $upload;
		$this->uploadDir = "../upload";
		$this->upload = $upload;
		parent::baseModule();
	}
/**
 * 
 * @return 
 * @param object $dirArray
 */
function getFileToArray($dirArray){
	$filearray = array();
	for($i=0; $i<count($dirArray); $i++){
		$folder = opendir($dirArray[$i]);
		if($folder){
			while(false !== ($file = readdir($folder))){
				$path = pathinfo($file);
				if(isset($path["extension"]) && $path["extension"]!="db" ){
					$items['name'] = $file;
					$items['location'] = $dirArray[$i];
					$file_size = filesize($dirArray[$i].'/'.$file);
					$items['size'] = round($file_size/ 1204) .'KB';
					if($items['size'] > 0){
						$filearray[] = $items;
					}
				}
			}
		}
	}
	return $filearray;
}



	/**
	 * 
	 * @return 
	 * @param object $folder[optional]
	 * @param object $perpage[optional]
	 * @param object $pagenumber[optional]
	 */
	function view_file($folder="all", $perpage="", $pagenumber=""){
		
		$tpl = $this->getTemplatePath("view");
				
		$tpl->assignGlobal('targetElement', strval( mosGetParam( $_GET, 'targetElement', '' ) ));
		
		$dirArray[0] = $this->uploadDir .'/images';
		$dirArray[1] = $this->uploadDir .'/video';
		$dirArray[2] = $this->uploadDir .'/document';

		$filearray = $this->getFileToArray($dirArray);
		/// NEU THU MUC TRUYEN VAO LA ALL - LIET KE TAT CA CAC FILE TRONG THU MUC
		if($folder == "all"){
			$index=0;
			for($i=0; $i<count($filearray); $i++){
				$index = $i + 1;
				$tpl->newBlock('file');
				($i % 2 != 0)?$tpl->assign('row_odd', 'alternate'):"";
				$tpl->assign('image_src', "templates/" . $this->website->GetAdministratorDefaultTemplate() . "/images/publish_x.png");
				$tpl->assign('stt', $index);
				//$tpl->assign('file_name', $filearray[$i]['name'].'/'.$filearray[$i]['size']);
				$filePath = $filearray[$i]['location'].'/'.$filearray[$i]['name'];
				$path_parts = pathinfo($filePath);
						if(strtolower($path_parts['extension'])=="png" 
					|| strtolower($path_parts['extension'])=="gif"
					|| strtolower($path_parts['extension'])=="jpg"
					|| strtolower($path_parts['extension'])=="bmp"
				){
					$strToolTip="<span onmouseout=\"UnTip()\" onmouseover=\"Tip('<img src=$filePath width=150 height=102>', WIDTH, 150, PADDING, 6, BGCOLOR, '#ffffff')\" >"	. $filearray[$i]['name'].'/'.$filearray[$i]['size'] . "</span>";
					$tpl->assign('file_name', $strToolTip);
				} else {
					$tpl->assign('file_name', $filearray[$i]['name'].'/'.$filearray[$i]['size']);
				}
				
				//$tpl->assign('folder', $filearray[$i]['location']);
				//$tpl->assign('size', $filearray[$i]['size']);
				//$tpl->assign('file_name_for_delete', $filearray[$i]['name']);
				$file_name_and_folder = explode("/", $filearray[$i]['location']);
				$file_name_and_folder = $file_name_and_folder[count($file_name_and_folder)-1];
				$tpl->assign('file_name_and_folder', $file_name_and_folder.'/'.$filearray[$i]['name']);
				
				
			}
			unset($filePath, $path_parts);
		}
	///// KET THUC PHAN XU LY KHI THU MUC TRUYEN VAO LA ALL -LIET KE TAT CA CAC FILE TRONG BA THUC MUC
	
	/// NEU THU MUC TRUYEN VAO KHONG PHAI  LA ALL - LIET KE TAT CA CAC FILE TRONG THU MUC DUOC TRUYEN VAO
	if($folder != "all"){
		$tpl->assignGlobal('selected_attribute_'.$folder, 'selected');
		$index=0;
		for($i=0; $i<count($filearray); $i++){
			if($this->uploadDir .'/'.$folder == $filearray[$i]['location']){
					$index = $index + 1;
					$tpl->newBlock('file');
					($i % 2 != 0)?$tpl->assign('row_odd', 'alternate'):"";
					$tpl->assign('image_src', "templates/" . $this->website->GetAdministratorDefaultTemplate() . "/images/publish_x.png");
					$tpl->assign('stt', $index);
					//$tpl->assign('file_name', $filearray[$i]['name'] .'/'.$filearray[$i]['size']);
					
					$filePath = $filearray[$i]['location'].'/'.$filearray[$i]['name'];
					$path_parts = pathinfo($filePath);
					if(strtolower($path_parts['extension'])=="png" 
					|| strtolower($path_parts['extension'])=="gif"
					|| strtolower($path_parts['extension'])=="jpg"
					|| strtolower($path_parts['extension'])=="bmp"
					){
						$strToolTip="<span onmouseout=\"UnTip()\" onmouseover=\"Tip('<img src=$filePath width=150 height=102>', WIDTH, 150, PADDING, 6, BGCOLOR, '#ffffff')\" >"	. $filearray[$i]['name'].'/'.$filearray[$i]['size'] . "</span>";
						$tpl->assign('file_name', $strToolTip);
					} else {
						$tpl->assign('file_name', $filearray[$i]['name'].'/'.$filearray[$i]['size']);
					}
					//$tpl->assign('folder', $filearray[$i]['location']);
					//$tpl->assign('size', $filearray[$i]['size']);
					//$tpl->assign('file_name_for_delete', $filearray[$i]['name']);
					$file_name_and_folder = explode("/", $filearray[$i]['location']);
					$file_name_and_folder = $file_name_and_folder[count($file_name_and_folder)-1];
					$tpl->assign('file_name_and_folder', $file_name_and_folder.'/'.$filearray[$i]['name']);
					
				}
		}
	}
	///// KET THUC PHAN XU LY KHI THU MUC TRUYEN VAO KHONG PHAI  LA ALL - LIET KE TAT CA CAC FILE TRONG THU MUC DUOC TRUYEN VAO
	
	
	return  $tpl->getOutputContent();
	}

	/**
	 * 
	 * @return 
	 * @param object $ajax_javascript[optional]
	 * @param object $content[optional]
	 * @param object $message[optional]
	 */
	function main($ajax_javascript="", $content="", $message=""){
		$tpl = $this->getTemplatePath("browse_files");
		$tpl->assignGlobal(Array(
				// text
				"site_js_url"						=> $this->front_end_url . "/" . $this->folder_javascript,
				"site_title"						=> $this->website->GetWebsiteNameByLanguage($this->sess->get("lang")),
                "language" 						=> $this->website->GetAdministratorDefaultLanguage(),
				"javascript"						=> $ajax_javascript
			));
	
		if($content) $tpl->assignGlobal("page_content", $content);
		
		$tpl->printToScreen();
	}
}

$q = strval( mosGetParam( $_GET, 'r', '' ) );
$action = strval( mosGetParam( $_POST, 'action', '' ) );
$c = new browse_file();

$phplivex = new PHPLiveX();
$phplivex->AjaxifyObjectMethods(array("c" => array("view_file")));
switch ($q){
	case "delete":
	break;
	default:
	$c->main($phplivex->Run(false), $c->view_file("all", "", ""), "");
	break;
}

?>