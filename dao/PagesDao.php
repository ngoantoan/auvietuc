<?php
defined( '_VALID_MOS' ) or die( 'Restricted access' );
/**************  DAO Pages  *********/
/******************************************/
class PagesDao{
	var $db;
	public function __construct(){
		global $db;
		$this->db = &$db;
	}

	public function PagesDao(){
		global $db;
		$this->db = &$db;
	}
	
	/**
	 * Using: style_cuisine fe
	 * @param object $style_id
	 * @param object $style_status [optional]
	 * @return 
	 */
	function getPageName($page_id, $style_status = 1){
		$sql = "SELECT `code` FROM npt_pages WHERE id='".$page_id. "'";
		return $this->db->GetOne($sql);	
	}
	
	function getSqlList(){
		return fMakeSqlQuery("SELECT id,`code`, html_file FROM #__pages");
	}
	
	function getSqlPageLangListByPageId($pages_id){
		$sql = "SELECT  npa.id, pages_title, pages_description, seo_title, seo_keyword, seo_description, npa.languages_id as lang ";
		$sql .= "FROM #__pages_attributes npa LEFT JOIN #__languages nl ON npa.languages_id = nl.id WHERE pages_id = $pages_id";
		return fMakeSqlQuery($sql);
	}
	
	/**
	 * 
	 * @param object $code
	 * @param object $html_file
	 * @return T/F
	 */
	function insert($code,$html_file){
		$sql = fMakeSqlQuery('insert into #__pages (code,html_file) values("'.$code.'", "'.$html_file.'")');
		$ok = $this->db->Execute($sql);
		if ($ok) {
			//$sql = fMakeSqlQuery('select max(id) as id from #__pages');
			$pages_id = $this->db->Insert_ID();// GetOne($sql);
			//loop all languague for initialize page_of_languages
			$sql = fMakeSqlQuery("SELECT id from npt_languages");
			$rs_languages = $this->db->GetArray($sql);
			//die(var_dump($rs_languages));
			//$stmt = $this->db->Prepare(fMakeSqlQuery('INSERT INTO npt_pages_attributes (languages_id, pages_id) VALUES (?,?)'));
			for($i=0; $i < count($rs_languages); $i++) {
				$sql = fMakeSqlQuery('INSERT INTO npt_pages_attributes (languages_id, pages_id) VALUES ('.$rs_languages[$i]["id"].','.$pages_id.')');
				$this->db->Execute($sql);
			}
			/*while ($rs_languages && !$rs_languages->EOF) {
				//$sql = fMakeSqlQuery('INSERT INTO #__pages_attributes (languages_id, pages_id) VALUES ('.$rs_languages->fields['id'].', '.$pages_id.')');
				$this->db->Execute($stmt,array($rs_languages->fields['id'], $pages_id));
				//$ok = $this->db->Execute($sql);
				$rs_languages->moveNext();
			}*/
			unset($sql, $rs_languages);
		}
		return $ok;
	}
	
	/**
	 * 
	 * @param object $pages_id
	 * @return 
	 */
	function delete($pages_id){
		//delele page_language
		$sql = fMakeSqlQuery("DELETE FROM #__pages_attributes WHERE pages_id = $pages_id");
		$this->db->Execute($sql);
		//delele page
		$sql = fMakeSqlQuery("DELETE FROM #__pages WHERE id = $pages_id");
		$this->db->Execute($sql);	
	}
	
	function update($pages_id,$code,$html_file){
		$sql = fMakeSqlQuery('UPDATE #__pages SET `code`="'.$code.'", `html_file`="'.$html_file.'" where id='.$pages_id);
		return $this->db->Execute($sql);
	}
	
	function updatePageLang($id, $lang,$pages_title, $pages_description, $seo_title, $seo_keyword, $seo_description){
		$sql = fMakeSqlQuery('UPDATE #__pages_attributes SET `pages_title`="'.$pages_title.'", 
									`pages_description`="'.$pages_description.'", 
									`seo_title`="'.$seo_title.'", 
									`seo_keyword`="'.$seo_keyword.'",
									`languages_id`="'.$lang.'", 
									`seo_description`="'.$seo_description.'"  
									where id='.$id);
									//$this->db->debug = true;
		return $this->db->Execute($sql);
	}
	function InsertPageLang($page,$lang, $pages_title, $pages_description, $seo_title, $seo_keyword, $seo_description){
		$sql = fMakeSqlQuery("INSERT INTO #__pages_attributes (pages_id,pages_title,pages_description,languages_id,seo_title,seo_keyword,seo_description) VALUES ('".$page."','".$pages_title."','".$pages_description."','".$lang."','".$seo_title."','".$seo_keyword."','".$seo_description."')");  
									
									//$this->db->debug = true;
		return $this->db->Execute($sql);
	}
}
?>