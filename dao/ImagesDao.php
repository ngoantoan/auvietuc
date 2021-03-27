<?php

class ImagesDao {
	var $db;
	public function __construct(){
		global $db;
		$this->db = $db;
	}

	public function ImagesDao(){
		global $db;
		$this->db = $db;
	}

	function getImagesListQuery($gallery_id){
		return "SELECT image_id, title, image_path, image_status,add_date 
				FROM images where gallery_id = '".$gallery_id."'";
	}
	
	function getActivedListImage($gallery_id){
		$sql = "SELECT image_id,title, image_path, image_status,add_date 
				FROM images where gallery_id = '".$gallery_id."' and image_status = 1";
		return $this->db->Execute($sql);
	}

	function deleteImage($image_id){
		$sql = "DELETE FROM images where image_id = '".$image_id."'";
		return $this->db->Execute($sql);
	}
	

	function insertImage($gallery_id,$title, $image_path, $image_status ){
		$sql = "INSERT INTO images (`gallery_id`,`title`, `image_path`, `image_status`, `add_date`) 
				values ('".$gallery_id."', '".$title."', '".$image_path."', '".$image_status."', '".date("Y-m-d H:i:s")."')";
		return $this->db->Execute($sql);
	}


	function updateImage($title, $image_path,$image_status, $image_id){
		$sql = "UPDATE images SET `title`= '".$title."',`image_path`= '".$image_path."', `image_status`= '".$image_status."' WHERE `image_id`= '".$image_id."'";
		return $this->db->Execute($sql);
	}
}
?>