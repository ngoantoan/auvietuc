<?php
defined( '_VALID_MOS' ) or die( 'Restricted access' );
/**************  DAO Banner/Banner_category  *********/
/******************************************/
class BannerDao{
  var $db;
  public function __construct(){
    global $db;
    $this->db = $db;
  }
  
  public function BannerDao(){
    global $db;
    $this->db = $db;
  }
  
  /**
   * Using : banner.php fontend
   * @param object $lang_id
   * @return recordset
   */
  function getActivedList($number_record, $offset = 0){
    $sql = "select * from banner where `status` = 1 LIMIT ".$offset.",".$number_record;
    return $this->db->Execute($sql);
  }
  

  function getActivedListByCategory($category_id, $lang_id, $number_record , $offset = 0){
    return $this->db->Execute("select *,b.description,b.title as t_banner,b.image as image_banner from banner b INNER JOIN banner_categories bc ON b.categories_id = bc.id
       WHERE b.`status` = 1 AND b.lang=? and bc.id = ? LIMIT ?,?", array($lang_id, $category_id, $offset, (int)$number_record));
  }

  function getActivedListByType($limit){
  	
    $sql = "SELECT * FROM tour WHERE type=3 AND status=1 ORDER BY `sort` LIMIT 0,$limit ";
    return $this->db->Execute($sql);
  }
    function getActivedListByCategoryID($category_id, $limit){
        $sql = "select * from banner b INNER JOIN banner_categories bc ON b.categories_id = bc.id 
                WHERE b.`status` = 1 AND  bc.id = '".$category_id."' LIMIT 0,$limit";
        return $this->db->Execute($sql);
    }
    
}
?>