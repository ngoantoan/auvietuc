<?php
class npt_upload{
	function Execute($destination, $file_name){
		$capacity = ($_FILES[$file_name]["size"]/2024)/1024;
		ini_set('post_max_size', $capacity+10);
		ini_set('upload_max_filesize', $capacity+10);
		//die($capacity+10);
		if($_FILES[$file_name]["error"] > 0){
			$upload[0] = false;
			$upload[1] = $_FILES[$file_name]["error"];
			$upload[2] = $_FILES[$file_name]["name"];
			$upload[3] = $destination;
			return $upload;
		}else if(file_exists($destination.'/'.$_FILES[$file_name]["name"])){
			$upload[0] = false;
			$upload[1] = 'File name is existing...Please rename file you want to upload';
			$upload[2] = $_FILES[$file_name]["name"];
			$upload[3] = $destination;
			return $upload;
		}else{
			$result = move_uploaded_file($_FILES[$file_name]["tmp_name"], $destination.'/'.str_replace(" ", "_", $_FILES[$file_name]["name"]));
			if($result){
				$upload[0] = true; 
				$upload[1] = 'Upload sucessfully'; 
				$upload[2] = $_FILES[$file_name]["name"];
				$upload[3] = $destination;
			}else{ 
				$upload[0] = true; 
				$upload[1] = 'File name: '.$_FILES[$file_name]["name"].' uploaded failed...'; 
				$upload[2] = $_FILES[$file_name]["name"];
				$upload[3] = $destination;
			}
			return $upload;
		}

	}
}
?>