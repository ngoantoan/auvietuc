<?php
defined( '_VALID_MOS' ) or die( 'Restricted access' );
/**************  DAO cuisine_news  *********/
/******************************************/
class MenuDao{
	var $db;
	public function __construct(){
		global $db;
		$this->db = &$db;
	}

	public function MenuDao(){
		global $db;
		$this->db = &$db;
	}
	/***
	 * 
	 * @param object $lang_id
	 * @return 
	 */
	function getActivedList($lang_id){
		$sql = "select * from npt_menu where active = 1 and parent_id IS NULL and languages_id = '".$lang_id."' order by sort_order";
		return $this->db->Execute($sql);
	}
	/***
	 * 
	 * @param object $menu_id
	 * @return 
	 */
	function getById($menu_id){
		return $this->db->GetRow("SELECT * FROM npt_menu where id=" .$menu_id);
	}
	/***
	 * 
	 * @param object $parent_id
	 * @param object $menu_name
	 * @param object $seo_title
	 * @param object $page_code
	 * @param object $action
	 * @param object $sort_order
	 * @param object $param
	 * @param object $languages_id
	 * @param object $active
	 * @return 
	 */
	function save($parent_id, $menu_name, $seo_title, $page_code, $action, $sort_order, $param, $languages_id, $active){
		$sql = "INSERT INTO npt_menu (parent_id,menu_name,seo_title,page_code,action,sort_order,param,languages_id,active)";
		$sql .= " VALUES($parent_id, '".$menu_name."', '".$seo_title."', '".$page_code."', '".$action."', '".$sort_order."', '".$param."', '".$languages_id."', '".$active."')";	
		return $this->db->Execute($sql);
	}
	/***
	 * 
	 * @param object $menu_id
	 * @param object $parent_id
	 * @param object $menu_name
	 * @param object $seo_title
	 * @param object $page_code
	 * @param object $action
	 * @param object $sort_order
	 * @param object $param
	 * @param object $active
	 * @return 
	 */
	function update($menu_id, $parent_id, $menu_name, $seo_title, $page_code, $action, $sort_order, $param, $languages_id, $active){
		$sql = "UPDATE npt_menu set parent_id = ".$parent_id.",menu_name = '".$menu_name."',seo_title = '".$seo_title."', ";
		$sql .= " page_code = '".$page_code."',action = '".$action."',sort_order = '".$sort_order."',param = '".$param."',active = '".$active."'";
		$sql .= " WHERE id=".$menu_id;
		return $this->db->Execute($sql);
	}
	/***
	 * 
	 * @param object $menu_id
	 * @return 
	 */
	function delete($menu_id){
		return $this->db->Execute("DELETE FROM npt_menu WHERE id=".$menu_id);
	}
	/***
	 * 
	 * @param object $menu_id
	 * @return 
	 */
	function isExistedChilds($menu_id){
		//$sql = "select count(id) from npt_menu where parent_id  =".$menu_id;
		$count = $this->db->GetOne("select count(id) from npt_menu where parent_id  =".$menu_id);
		if ($count > 0) return true;
		return false;
	}
}
?>