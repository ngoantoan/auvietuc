<?php
class service_resortDao{
  var $db;
  public function __construct(){
    global $db;
    $this->db = &$db;
  }

  public function service_resortDao(){
    global $db;
    $this->db = &$db;
  }
  
 //************ NEWS CATEGORY ****************/
//**********************************************/
/*duyen hoang*/
	function getNewsCateggoryActiveList($parent_id=null){
  	if($parent_id){
  		return $this->db->Execute("SELECT * FROM service_resort_categories WHERE parent_id = $parent_id AND `status` = 1 ");
  	}
	else		
  		return $this->db->Execute("SELECT * FROM service_resort_categories WHERE parent_id IS null AND `status`=1 LIMIT 0,4");
  } 
  function getParentNewsSql($language_id){
    $sql = "SELECT * FROM service_resort_categories WHERE  parent_id IS NULL";
    return fMakeSqlQuery($sql);
  }
    function getActivedParentLis(){
        $sql = "SELECT title,id FROM category_product WHERE status =1 and ISNULL(parent_id)  ORDER BY `id`";
        return $this->db->Execute($sql);
    }
    function getChildrensByNod($parentId){
        $sql = "SELECT id,parent_id,title,status
         FROM category_product WHERE status =1 and parent_id = $parentId ORDER BY `id`";
        return $this->db->Execute($sql);
    }
  function getthuvien(){
    $sql = "SELECT li.title,li.image,li.description as link,lc.description as des FROM library_items li LEFT JOIN library_categories lc ON (li.id_categories=lc.id) WHERE li.status=1 ORDER BY li.created_at DESC";
    return $sql;
  }
  function getthuvien_danhsach($cate){
    $sql = "SELECT li.title,li.image,li.description as link,lc.description as des FROM library_items li LEFT JOIN library_categories lc ON (li.id_categories=lc.id) WHERE li.status=1 AND li.id_categories='".$cate."' ORDER BY li.created_at DESC";
    return $sql;
  }
  function getActivedParentList($lang){
    $sql = "SELECT title,id FROM service_resort_categories WHERE status =1 and ISNULL(parent_id) AND lang='".$lang."' ORDER BY `id`";
    return $this->db->Execute($sql);
  }
    function getActivedParentListService(){
        $sql = "SELECT title,id FROM category_service WHERE status =1 and ISNULL(parent_id)  ORDER BY `id`";
        return $this->db->Execute($sql);
    }
    function getActivedParentList3(){
        $sql = "SELECT title,id FROM service_resort_categories WHERE status =1 and ISNULL(parent_id)  ORDER BY `id`";
        return $this->db->Execute($sql);
    }
    function getActivedParentSolutionList($lang){
            $sql = "SELECT title,id FROM solutions WHERE status =1  ORDER BY `id`";
            return $this->db->Execute($sql);
    }
    function getActivedParentList5($parentId){
        $sql = "SELECT title,id FROM category_product WHERE status =1 and parent_id='".$parentId."'  ORDER BY `id`";
        return $this->db->Execute($sql);
    }
    function getActivedParentSolutionListSub($parentId, $lang){
        $sql = "SELECT title,id FROM solution_functions WHERE status =1 and solution_id='".$parentId."'  ORDER BY `id`";
        return $this->db->Execute($sql);
    }
    function getActivedParentList4(){
        $sql = "SELECT title,id FROM category_product WHERE status =1 and ISNULL(parent_id)  ORDER BY `id`";
        return $this->db->Execute($sql);
    }
  function getProvinces(){
  	
    $sql = "SELECT title,id FROM provinces WHERE published=1  ORDER BY ordering";
    return $this->db->Execute($sql);
  }
  function getActivedParentList2(){
    $sql = "SELECT title,id FROM npt_services_category WHERE status =1 and ISNULL(parent_id)  ORDER BY `id`";
    return $this->db->Execute($sql);
  }

  function getChildrensByNode($lang,$parentId){
    $sql = "SELECT id,parent_id,title,description,status
         FROM service_resort_categories WHERE status =1 and parent_id = $parentId AND lang= $lang ORDER BY `id`";
    return $this->db->Execute($sql);
  }
    function getChildrensByNodeService($parentId){
        $sql = "SELECT id,parent_id,title
         FROM category_service WHERE status =1 and parent_id = $parentId ORDER BY `id`";
        return $this->db->Execute($sql);
    }

  function getChildrensByNode2($parentId){   
    $sql = "SELECT id,parent_id,title,description,status
         FROM npt_services_category WHERE status =1 and parent_id = $parentId ORDER BY `id`";
    return $this->db->Execute($sql);
  }

  function getSqlListByCateId($language_id=1, $category_id ){
    $sql=" SELECT a.id,ac.title as category,a.title,a.image,a.order,view_number,a.status,a.news_date".
            " FROM service_resort a ,service_resort_categories ac".
            " where a.categories_id=ac.id AND a.categories_id = $category_id and a.languages_id= $language_id ORDER BY a.order,a.news_date";
    if ($category_id == 'NULL'){// get all item
        $sql = "SELECT a.id,ac.title as category,a.title,a.image,a.order,view_number,a.status,a.news_date".
                " FROM service_resort a ,service_resort_categories ac".
                " where a.categories_id=ac.id AND a.languages_id = $language_id ORDER BY a.order,a.news_date";
    }    
    return $sql;
  }
  
  /**
   * @param $language_id
   * @param $category_id
   */
  function getSqlAdmin($title=NULL,$username=NULL, $type,$category_id=NULL ){
    $sql=" SELECT a.id,ac.title as title_cate,a.title,a.image ,a.description,a.detail,a.tag,a.type,a.status,a.created_at  ".
            " FROM service_resort as a ,service_resort_categories ac ".
            " where a.categories_id=ac.id   ";
    if ($category_id != 'NULL') $sql .= "  AND a.categories_id = $category_id  "; 
    if ($type != NULL) $sql .= "  AND a.type = $type  ";           
    if ($title != NULL)  $sql .= "  AND a.title like '%".$title."%'   "; 
    if ($username != NULL)  $sql .= "  AND m.username like '%".$username."%' ";        
    $sql.="  ORDER BY a.id DESC  ";
    return fMakeSqlQuery($sql);
  }
function getSqlServicesAdmin($title=NULL,$category_id=NULL ){
	
    $sql=" SELECT a.id,ac.title as title_cate,a.title,a.loai,a.image ,a.description,a.detail,a.tag,a.status,a.created_at  ".
            " FROM npt_services as a ,npt_services_category ac ".
            " where a.cate_id=ac.id   ";
    if ($category_id != 'NULL') $sql .= "  AND a.cate_id = $category_id  "; 
          
    if ($title != NULL)  $sql .= "  AND a.title like '%".$title."%'   "; 
            
    $sql.="  ORDER BY a.id DESC  ";
    return fMakeSqlQuery($sql);
  }


    function getSqlProductAdmin($name = NULL, $code = NULL, $category_id = 0, $brand_id = 0) {

        $sql = "SELECT a.category_id, a.id,a.sku,a.name, price, price_promotion, image, a.`status`, a.created_date FROM products as a where 1=1 ";
        if ($category_id > 0) {
            $sql .= "  AND a.category_id = $category_id";
        }
        if ($brand_id > 0) {
            $sql .= "  AND a.brand_id = $brand_id";
        }
        if ($name != NULL)
            $sql .= "  AND a.name like '%" . $name . "%'";
        if ($code != NULL) {
            $sql .= "  AND a.code like '%" . $code . "%'";
        }
        $sql .= " group by a.id ORDER BY a.id DESC ";
        return $sql;
    }


  function getservice_resort($id){
    return $this->db->GetRow("SELECT * FROM service_resort WHERE id = ?", $id);
  }
    function getservice($id){
        return $this->db->GetRow("SELECT * FROM service WHERE id = ?", $id);
    }
    function getsolution_items($id){
        return $this->db->GetRow("SELECT * FROM solution WHERE id = ?", $id);
    }


    function getSqlAdmin3($title = NULL, $username = NULL, $type, $category_id = NULL, $lang) {

        $sql = " SELECT a.id as id_onoff, a.id, a.title, a.image, u.fullname, a.visit, a.status,a.sort, a.created_at FROM service_resort as a inner join npt_users as u on a.user_id = u.id where 1=1 ";
        if ($category_id != 0)
            $sql .= "  AND a.categories_id = $category_id  ";
        if ($type != NULL)
            $sql .= "  AND a.type = $type  ";
        if ($title != NULL) {
            $sql .= "  AND a.title like '%" . $title . "%'   ";
        }
        if ($username != NULL) {
            $sql .= "  AND m.username like '%" . $username . "%' ";
        }
        if ($lang != NULL) {
            $sql .= "  AND a.lang= ".$lang;
        }
        $sql .= "  ORDER BY a.id DESC  ";
        return fMakeSqlQuery($sql);
    }
    function getListService($title = NULL, $username = NULL, $type, $category_id = NULL, $lang=1) {
//$this->db->debug=true;
        $sql = " SELECT a.id as i,a.id, a.title, a.price, a.price_promotion, a.image, u.fullname, a.visit, a.tag, a.status, a.created_at FROM service as a inner join npt_users as u on a.user_id = u.id where lang= ".$lang;
        if ($category_id != 0)
            $sql .= "  AND a.category_id = $category_id  ";
        if ($type != NULL)
            $sql .= "  AND a.type = $type  ";
        if ($title != NULL) {
            $sql .= "  AND a.title like '%" . $title . "%'   ";
        }
        if ($username != NULL) {
            $sql .= "  AND m.username like '%" . $username . "%' ";
        }
        $sql .= "  ORDER BY a.id DESC  ";
        return fMakeSqlQuery($sql);
    }

  function insertservice_resortBE($category_id,$title,$code,$description,$description_more,$content,$image_path,$image_2,$banner,$link_book,$link_video, $status,$tag, $sort, $lang_id){
      $created_at=date("Y-m-d H:i:s");
      $sql = "INSERT INTO service_resort(tag,categories_id,title,code,description,description_more,detail,image,image_2,banner,link_book,link_video,`status`, sort,lang,created_at)";
    $sql .= " VALUES ('".$tag."','".$category_id."','".$title."','".$code."','".$description."','".$description_more."','".$content."','".$image_path."','".$image_2."','".$banner."','".$link_book."','".$link_video."','".$status."','".$sort."','".$lang_id."','".$created_at."')";
    $ok = $this->db->Execute($sql);
    if($ok)
      return $this->db->Insert_ID();
    else
      return 0;
  }
    function insertService($category_id,$user_id,$title,$description,$content,$image_path,$status,$tag){
//$this->db->debug=true;
        $created_at=date("Y-m-d H:i:s");
        $sql = "INSERT INTO service(tag,category_id,user_id,title,description,detail,image,`status`, created_at)";
        $sql .= " VALUES ('".$tag."','".$category_id."','".$user_id."','".$title."','".$description."','".$content."','".$image_path."','".$status."', '".$created_at."')";
        $ok = $this->db->Execute($sql);
        if($ok)
            return 1;
        else
            return 0;
    }
  function insertservicesBE($loai,$category_id,$title,$description,$content,$image_path,$status,$tag){
    $sql = "INSERT INTO npt_services (loai,tag,cate_id,title,description,detail,image,`status`,created_at)";
    $sql .= " VALUES ('".$loai."','".$tag."','".$category_id."','".$title."','".$description."','".$content."','".$image_path."','".$status."','".date("Y-m-d H:i:s")."')";
    $ok = $this->db->Execute($sql);
    if($ok)
      return TRUE;
    else
      return FALSE;
  }
  function inserttourBE($price,$price2,$category_id,$title,$description,$content,$image_path,$status,$tag,$diemden,$diadiem,$loaitour,$type,$thoigian){
    $sql = "INSERT INTO tour (price,price2,tag,cate_tour,title,description,detail,image,`status`,created_at,diemden,diadiem,loaitour,type,thoigian)";
    $sql .= " VALUES ('".$price."','".$price2."','".$tag."','".$category_id."','".$title."','".$description."','".$content."','".$image_path."','".$status."','".date("Y-m-d H:i:s")."','".$diemden."','".$diadiem."','".$loaitour."','".$type."','".$thoigian."')";
    $ok = $this->db->Execute($sql);
    if($ok)
      return TRUE;
    else
      return FALSE;
  }
  function insertimageBE($image,$real_image, $title,$order,$status,$cate_id){
    $sql = "INSERT INTO image (hotel_id,title,image, image_real,`status`,sort)";
    $sql .= " VALUES ('".$cate_id."','".$title."','".$image."','".$real_image."','".$status."','".$order."')";
    $ok = $this->db->Execute($sql);
    if($ok)
      return TRUE;
    else
      return FALSE;
  }
  /**
   * @author: Huy Le                                                                              
   * @date: 6/10/2010                                                                                       
   * @using: Huy-  BE article[update]        
   * @param Int $product_id 
   * @param object $lang[optional]                                                                
   * @return True/False                                                                                               
   */
  function updateservice_resortBE($id,$category_id,$title,$code,$description,$description_more,$content,$image_path,$image_2,$banner,$link_book,$link_video,$status,$tag, $sort, $lang_id){
      $this->db->debug=true;
    $sql = "UPDATE service_resort SET categories_id='".$category_id."',title='".$title."',code='".$code."',description='".$description."',description_more='".$description_more."',detail='".$content."',image='".$image_path."',image_2='".$image_2."',banner='".$banner."',link_book='".$link_book."',link_video='".$link_video."',`status`='".$status."',`tag`='".$tag."',`sort`='".$sort."',`lang`='".$lang_id."' WHERE id=".$id;
    $ok = $this->db->Execute($sql);
    if($ok)
      return "1";
    else
      return "0";
  }
    function updateService($id,$category_id,$title,$price, $price_promotion,$description,$content,$image_path,$status,$tag){
//        $this->db->debug=true;
        $sql = "UPDATE service SET category_id='".$category_id."',title='".$title."',price='".$price."', price_promotion='".$price_promotion."',description='".$description."',detail='".$content."',image='".$image_path."',`status`='".$status."',`tag`='".$tag."' WHERE id=".$id;
        $ok = $this->db->Execute($sql);
        if($ok)
            return "1";
        else
            return "0";
    }
  function updateservicesBE($loai,$id,$category_id,$title,$description,$content,$image_path,$status,$tag){
    
    $sql = "UPDATE npt_services SET loai='".$loai."', cate_id='".$category_id."',title='".$title."',description='".$description."',detail='".$content."',image='".$image_path."',`status`='".$status."',`tag`='".$tag."' WHERE id=".$id;
    $ok = $this->db->Execute($sql);
    if($ok)
      return "1";
    else
      return "0";
  }
  function updatetourBE($price,$price2,$id,$category_id,$title,$description,$content,$image_path,$status,$tag,$diemden,$diadiem,$loaitour,$type,$thoigian){
    
    $sql = "UPDATE tour SET price='".$price."',price2='".$price2."',cate_tour='".$category_id."',title='".$title."',description='".$description."',detail='".$content."',diadiem='".$diadiem."',diemden='".$diemden."',loaitour='".$loaitour."',thoigian='".$thoigian."',type='".$type."',image='".$image_path."',`status`='".$status."',`tag`='".$tag."' WHERE id=".$id;
    $ok = $this->db->Execute($sql);
    if($ok)
      return "1";
    else
      return "0";
  }
  
	function updateimageBE($id,$image,$real_image, $title,$order,$status,$cate_id){
    
    $sql = "UPDATE image SET hotel_id='".$cate_id."',title='".$title."',image='".$image."',image_real='".$real_image."',`status`='".$status."',`sort`='".$order."' WHERE id=".$id;
    $ok = $this->db->Execute($sql);
    if($ok)
      return "1";
    else
      return "0";
  }
  function insertNewsRecruitt($user_id,$idCity,$category_id, $title, $short_description, $description, $image,$view_number=1, $status){
          
    $sql = "INSERT INTO service_resort (id_user,city_article_id,categories_id, title,short_description,description,image,view_number,status,news_date)";
    $sql .= " VALUES (".$user_id.",".$idCity.",".$category_id.",'".$title."','".$short_description."','".$description."','".$image."','".$view_number."','".$status."','".date("Y-m-d H:i:s")."')";    
    $ok = $this->db->Execute($sql);   
    if($ok)
      return TRUE;
    else 
      return FALSE;
  }
  /*DUYEN HOANG*/
  function getTieuDiem($limit=2){
     
      $sql = "SELECT * FROM service_resort WHERE type=3 AND status = 1 ORDER BY RAND() LIMIT 0,$limit";
      return $this->db->Execute($sql);
  }
  function GetTieuDiemByCate($limit=2,$category_id){
        
      $sql = "SELECT * FROM service_resort WHERE type=3 AND status = 1 AND category_id='".$category_id."' ORDER BY RAND() LIMIT 0,$limit";
      return $this->db->Execute($sql);
  }
  function UpdateLuotXem($news_id){
      $sql = "Update service_resort set visit = visit+1 where id=$news_id";
      return $this->db->Execute($sql);
  }
  function getNewsByCategoryId($category_id = null,$limit=null,$news_type=null, $is_visit=null ){
      $s = "";
      if(!empty($category_id)){
          $s .=" AND (categories_id = $category_id ";
          $s .=" OR categories_id IN(SELECT id FROM service_resort_categories WHERE parent_id = $category_id AND status = 1) ";
          $s .=" OR categories_id IN(SELECT id FROM service_resort_categories WHERE parent_id IN(SELECT id FROM service_resort_categories WHERE parent_id = $category_id AND status = 1))) ";
      }      
      if(!empty($news_type))
        $s .= " AND type=$news_type";
      if(!empty($is_visit))
        $s .= " ORDER BY created_at DESC";
      else
        $s .= " ORDER BY created_at DESC";
        
      $sql = " SELECT * FROM service_resort WHERE status = 1 $s LIMIT 0,$limit ";
      return $this->db->Execute($sql);
  }
  function getNewsByCategoryIdByAdmin($category_id = null,$limit=null,$news_type=null, $is_visit=null ){
      $s = "";
      if(!empty($category_id)){
          $s .=" AND (categories_id = $category_id ";
          $s .=" OR categories_id IN(SELECT id FROM service_resort_categories WHERE parent_id = $category_id ) ";
          $s .=" OR categories_id IN(SELECT id FROM service_resort_categories WHERE parent_id IN(SELECT id FROM service_resort_categories WHERE parent_id = $category_id ))) ";
      }      
      
      if(!empty($is_visit))
        $s .= " ORDER BY status , created_at DESC";
      else
        $s .= " ORDER BY status , created_at DESC";
        
      $sql = " SELECT * FROM service_resort WHERE 1=1 $s LIMIT 0,$limit ";
      return $this->db->Execute($sql);
  }
  function getSqlNewsByCategoryId2($category_id){
  	  
  	   $them="";
  	  if($category_id != 0 && $category_id !=  NULL) $them .=" AND categories_id=$category_id";
      $sql = "SELECT service_resort.*, DATE_FORMAT(service_resort.created_at, '%h:%i:%s - %d/%m/%Y') AS ngaytao";
      $sql .=" FROM service_resort ";
      $sql .=" WHERE status = 1 $them ORDER BY created_at DESC ";
        
      return $sql;
  }
  function getSqlNewsByCategoryId($category_id){  
  	  
      $sql = "SELECT service_resort.*, DATE_FORMAT(service_resort.created_at, '%h:%i:%s - %d/%m/%Y') AS ngaytao";
      $sql .=" FROM service_resort ";
      $sql .=" WHERE status = 1  ORDER BY created_at DESC ";
        
      return $sql;
  }
  function getSqlTour($country,$tp){
  	
      $sql = "SELECT *";
      $sql .=" FROM tour ";
      $sql .=" WHERE status = 1 AND type='".$country."' AND loaitour='".$tp."' AND type !=3 ORDER BY created_at DESC";
      return $sql;
  }
  function getSqlTour2($tp){
  	
      $sql = "SELECT *";
      $sql .=" FROM tour ";
      $sql .=" WHERE status = 1  AND loaitour='".$tp."' AND type !=3 ORDER BY created_at DESC";
      return $sql;
  }
  function getSqlTour4($lich,$tp){
  	
      $sql = "SELECT *";
      $sql .=" FROM tour_category";
      $sql .=" WHERE status = 1  AND loaitour='".$tp."' AND diadiem ='".$lich."' ORDER BY sort";
      return $sql;
  }
  function getSqlTour3($tp,$con){
  	
      $sql = "SELECT *";
      $sql .=" FROM tour ";
      $sql .=" WHERE status = 1  AND cate_tour='".$tp."'AND loaitour='".$con."' AND type !=3 ORDER BY created_at DESC";
      return $sql;
  }
  function getSqlservices($cate){
  	
      $sql = "SELECT *";
      $sql .=" FROM npt_services ";
      $sql .=" WHERE status = 1 AND ( cate_id = $cate ";
      $sql .=" OR cate_id IN(SELECT id FROM npt_services_category WHERE parent_id = $cate AND npt_services_category.status = 1) ";
      $sql .=" OR cate_id IN(SELECT id FROM npt_services_category WHERE parent_id IN(SELECT id FROM npt_services_category";
      $sql .=" WHERE parent_id = $cate AND npt_services_category.status = 1))) ORDER BY created_at DESC";
      return $sql;
  }
  function getSqlNewsByCategoryIdByAdmin($category_id){
      $sql = "SELECT service_resort.*, DATE_FORMAT(service_resort.created_at, '%h:%i:%s - %d/%m/%Y') AS ngaytao,";
      $sql .=" member.username AS user_fullname FROM service_resort LEFT JOIN member ON service_resort.user_id = member.user_id ";
      $sql .=" WHERE member.status = 1 AND ( categories_id = $category_id ";
      $sql .=" OR categories_id IN(SELECT id FROM service_resort_categories WHERE parent_id = $category_id AND service_resort_categories.status = 1) ";
      $sql .=" OR categories_id IN(SELECT id FROM service_resort_categories WHERE parent_id IN(SELECT id FROM service_resort_categories";
      $sql .=" WHERE parent_id = $category_id AND service_resort_categories.status = 1))) ORDER BY service_resort.status ,service_resort.created_at DESC";
      return $sql;
  }
  function getSqlNewsByUserId($user_id, $category_id=""){      
      if(!empty($category_id)){
          $sql = "SELECT service_resort.*, DATE_FORMAT(service_resort.created_at, '%h:%i:%s - %d/%m/%Y') AS ngaytao,";
          $sql .=" member.username AS user_fullname FROM service_resort INNER JOIN member ON service_resort.user_id = member.user_id ";
          $sql .=" WHERE service_resort.status = 1 AND member.status = 1 AND member.user_id = $user_id AND ( categories_id = $category_id ";
          $sql .=" OR categories_id IN(SELECT id FROM service_resort_categories WHERE parent_id = $category_id AND service_resort_categories.status = 1) ";
          $sql .=" OR categories_id IN(SELECT id FROM service_resort_categories WHERE parent_id IN(SELECT id FROM service_resort_categories";
          $sql .=" WHERE parent_id = $category_id AND service_resort_categories.status = 1))) ORDER BY service_resort.created_at DESC";    
      }        
      else{
          $sql = "SELECT service_resort.*, DATE_FORMAT(service_resort.created_at, '%h:%i:%s - %d/%m/%Y') AS ngaytao,";
          $sql .=" member.username AS user_fullname FROM service_resort INNER JOIN member ON service_resort.user_id = member.user_id ";
          $sql .=" WHERE service_resort.status = 1 AND member.status = 1 AND member.user_id = $user_id ORDER BY service_resort.created_at DESC";  
      }
      return $sql;
  }
 
function getSqlNewsByTag($tag){
      $where = "";
      if(!empty($tag)){
          //$where .=" AND (service_resort.title like '%$tag%'";
          //$where .=" OR service_resort.description like '%$tag%'";
          //$where .=" OR service_resort.detail like '%$tag%'";  
          $where .=" AND service_resort.tag like '%$tag%'";
      }
        
      $sql = "SELECT service_resort.*, DATE_FORMAT(service_resort.created_at, '%h:%i:%s - %d/%m/%Y') AS ngaytao,";
      $sql .=" member.username AS user_fullname FROM service_resort LEFT JOIN member ON service_resort.user_id = member.user_id ";
      $sql .=" WHERE service_resort.status = 1 AND member.status = 1 $where ORDER BY service_resort.created_at,service_resort.visit DESC";
      	return $sql;
  }
  function getServices($loai){
  	$sql="SELECT * FROM npt_services WHERE loai='".$loai."' AND status=1 ORDER BY created_at DESC";
	return $sql;
  }
  function getSqlTourByTag($tag){
      $where = "";
      if(!empty($tag)){
          //$where .=" AND (service_resort.title like '%$tag%'";
          //$where .=" OR service_resort.description like '%$tag%'";
          //$where .=" OR service_resort.detail like '%$tag%'";  
          $where .=" AND tag like '%$tag%'";
      }
        
      $sql = "SELECT *";
      $sql .=" FROM tour ";
      $sql .=" WHERE status = 1 AND type!=3 $where ORDER BY created_at DESC";
      	return $sql;
  }
  function getSqlServicesByTag($tag){
      $where = "";
      if(!empty($tag)){
          //$where .=" AND (service_resort.title like '%$tag%'";
          //$where .=" OR service_resort.description like '%$tag%'";
          //$where .=" OR service_resort.detail like '%$tag%'";  
          $where .=" AND tag like '%$tag%'";
      }
        
      $sql = "SELECT *";
      $sql .=" FROM npt_services ";
      $sql .=" WHERE status = 1  $where ORDER BY created_at DESC";
      	return $sql;
  }
  function getSqlProductByTag($tag){
      $where = "";
      if(!empty($tag)){
          //$where .=" AND (service_resort.title like '%$tag%'";
          //$where .=" OR service_resort.description like '%$tag%'";
          //$where .=" OR service_resort.detail like '%$tag%'";  
          $where .=" AND product.tag like '%$tag%'";
      }
        
      $sql = "SELECT product.*, DATE_FORMAT(product.created_at, '%h:%i:%s - %d/%m/%Y') AS ngaytao,";
      $sql .=" member.username AS user_fullname FROM product LEFT JOIN member ON product.user_id = member.user_id ";
      $sql .=" WHERE product.status = 1 AND product.status = 1 $where ORDER BY product.created_at,product.visit DESC";
      	return $sql;
  }
  function searchNews($search){
      $sql = "SELECT service_resort.*, DATE_FORMAT(service_resort.created_at, '%h:%i:%s - %d/%m/%Y') AS ngaytao,";
      $sql .=" member.username AS user_fullname FROM service_resort INNER JOIN member ON service_resort.user_id = member.user_id ";
      $sql .=" WHERE service_resort.status = 1 AND member.status = 1 AND (service_resort.title LIKE  '%".$search."%' OR service_resort.description LIKE  '%".$search."%' OR service_resort.detail LIKE  '%".$search."%' OR service_resort.tag LIKE  '%".$search."%')  ORDER BY service_resort.created_at DESC ";
      return $sql;
  }
  function getNewsById($news_id){
      $sql = "SELECT service_resort.*, member.username as fullname,DATE_FORMAT(service_resort.created_at,'%h:%i:%s %d/%m/%Y') AS ngaytao "; 
      $sql .=" FROM service_resort INNER JOIN member ON service_resort.user_id = member.user_id";
      $sql .=" WHERE service_resort.status = 1 AND id = $news_id ";
      return $this->db->GetRow($sql);
  }
  function getViewNewsById($news_id){
      $sql = "SELECT service_resort.*, DATE_FORMAT(service_resort.created_at,'%h:%i:%s %d/%m/%Y') AS ngaytao "; 
      $sql .=" FROM service_resort ";
      $sql .=" WHERE id = $news_id ";
      return $this->db->GetRow($sql);
  }
  function getViewProductById($news_id, $user_id){
      $sql = "SELECT * FROM product WHERE id = '".$news_id."'";
      return $this->db->GetRow($sql);
  }
  function getOtherNewsById($id, $limit=5){
      $sql = "SELECT *,DATE_FORMAT(service_resort.created_at, '%d/%m/%Y') AS ngaytao, member.username AS user_fullname FROM service_resort INNER JOIN member ON service_resort.user_id = member.user_id  WHERE id != $id AND categories_id IN(SELECT categories_id FROM service_resort WHERE id = $id)AND service_resort.status = 1 AND member.status=1 ORDER BY service_resort.created_at desc LIMIT 0, $limit";
      return $this->db->Execute($sql);
  }
  function getDataCategoryList($parent_id=null){
    $sql = "SELECT * FROM sangiaodich WHERE 1=1 ";
    if(empty($parent_id))
        $sql .= " AND parent_id IS NULL";
    else
        $sql .= " AND parent_id =$parent_id";
    $sql .=" AND status = 1";
    return $this->db->Execute($sql);
  }
  function getwardlist($parent_id=null){
    $sql = "SELECT * FROM wards WHERE 1=1 ";
    if(empty($parent_id))
        $sql .= " ";
    else
        $sql .= " AND province_id =$parent_id";
    
    return $this->db->Execute($sql);
  }
  function getcountrylist($parent_id=null){
    $sql = "SELECT * FROM provinces ORDER BY ordering ";      
    return $this->db->Execute($sql);
  }
    function getCategoryById($category_id){
        return $this->db->GetRow("SELECT * FROM service_resort_categories WHERE id=$category_id LIMIT 0,4");
    }
    function getCategoryById2($category_id){
        return $this->db->GetRow("SELECT * FROM tour_category WHERE id=$category_id LIMIT 0,4");
    }
    function getCategoryByProId($category_id){
        return $this->db->GetRow("SELECT * FROM sangiaodich WHERE id=$category_id");
    }
    function getCategoryByIdProduct($category_id){
        return $this->db->GetRow("SELECT * FROM sangiaodich WHERE id=$category_id");
    }
    function getNewsByUserId($user_id){        
        $sql = "SELECT service_resort.id, service_resort.title, service_resort.description, service_resort.categories_id";
        $sql .=", service_resort.image, service_resort.created_at, service_resort.status";
        $sql .=", service_resort.tag, service_resort.visit, service_resort.type, service_resort_categories.title AS category_name";
        $sql .=",DATE_FORMAT(service_resort.created_at, '%d/%m/%Y') AS ngaytao";
        $sql .=" FROM service_resort INNER JOIN service_resort_categories ON (service_resort.categories_id = service_resort_categories.id)";
        $sql .=" INNER JOIN member ON (service_resort.user_id = member.user_id) WHERE member.user_id = $user_id";
        $sql .=" ORDER BY visit,created_at DESC";
        return $sql;
    }
	 function getProductByUserId($user_id){        
        $sql = "SELECT *,DATE_FORMAT(created_at, '%d/%m/%Y') AS ngaytao FROM product WHERE user_id = '".$user_id."' ORDER BY created_at DESC";
        return $sql;
    }
    function DeleteNewsById($news_id, $user_id){
        $sql = "DELETE FROM service_resort WHERE id=$news_id ";
        return $this->db->Execute($sql);   
    }
    function DeleteProductById($news_id, $user_id){
        $sql = "DELETE FROM product WHERE id=$news_id ";
        return $this->db->Execute($sql);   
    }
	function isExistedMaTin($code){
        if ($this->db->GetOne("SELECT id FROM product WHERE matin='$code'")) return TRUE;
        return false;       
    }
    function InsertProductByUserId($user_id,$email,$phone,$yahoo,$address,$fullname,$duong,$phaply,$image,$image2,$image3,$image4,$image5,$matin, $title,$cate,$ward,$image,$gia,$loaigia,$loaitin,$gioithieu,$detail,$tag,$huongnha,$dientich,$phongngu,$phongtam,$phongkhach,$toilet){
       	if($image=='')$image="images/users/no-image.jpg";
        $sql="INSERT INTO product (user_id,email,phone,yahoo,address,fullname,duongtruocnha,phaply,image,image2,image3,image4,image5,tieude,id_sangiaodich,id_wards,gia,loaigia_id,loaitin,gioithieu,tag,huongnha,dientich,phongngu,phongtam,phongkhach,sotoilet,status,matin,visit,created_at) VALUE 
        ('".$user_id."','".$email."','".$phone."','".$yahoo."','".$address."','".$fullname."','".$duong."','".$phaply."','".$image."','".$image2."','".$image3."','".$image4."','".$image5."','".$title."','".$cate."','".$ward."','".$gia."','".$loaigia."','".$loaitin."','".$gioithieu."','".$tag."','".$huongnha."','".$dientich."','".$phongngu."','".$phongtam."','".$phongkhach."','".$toilet."',0,'".$matin."',1,NOW())";
        
        return $this->db->Execute($sql);    
    }
	function InsertProductByAdmin($user_id,$video,$email,$phone,$yahoo,$address,$fullname,$duong,$phaply,$image,$image2,$image3,$image4,$image5,$matin, $title,$cate,$ward,$image,$gia,$loaigia,$loaitin,$gioithieu,$detail,$tag,$huongnha,$dientich,$phongngu,$phongtam,$phongkhach,$toilet,$status){
       	if($image=='')$image="images/users/no-image.jpg";
        $sql="INSERT INTO product (video,status,user_id,email,phone,yahoo,address,fullname,duongtruocnha,phaply,image,image2,image3,image4,image5,tieude,id_sangiaodich,id_wards,gia,loaigia_id,loaitin,gioithieu,tag,huongnha,dientich,phongngu,phongtam,phongkhach,sotoilet,matin,visit,created_at) VALUE 
        ('".$video."','".$status."','".$user_id."','".$email."','".$phone."','".$yahoo."','".$address."','".$fullname."','".$duong."','".$phaply."','".$image."','".$image2."','".$image3."','".$image4."','".$image5."','".$title."','".$cate."','".$ward."','".$gia."','".$loaigia."','".$loaitin."','".$gioithieu."','".$tag."','".$huongnha."','".$dientich."','".$phongngu."','".$phongtam."','".$phongkhach."','".$toilet."','".$matin."',1,NOW())";
        
        return $this->db->Execute($sql);    
    }
    function InsertNewsByUserIdByAdmin($user_id, $news,$status,$type){
        $sql = "INSERT INTO service_resort(user_id,categories_id,title,description,detail,image,status,type, tag)";
        $sql .= " VALUES ($user_id,".$news['categories_id'].",'".$news['title']."','".$news['description']."','".$news['detail']."',";
        $sql .="'".$news['image']."','".$status."','".$type."','".$news['tag']."')";
        return $this->db->Execute($sql);    
    }
    function UpdateNewsById($user_id, $news){
        $s_image = "";
        if(!empty($news['image']))
            $s_image = "image='".$news['image']."',";
        $sql = "UPDATE service_resort SET categories_id=".$news['categories_id'].",title='".$news['title']."'";
        $sql .=" ,description='".$news['description']."',detail='".$news['detail']."', $s_image";
        $sql .=" tag='".$news['tag']."',created_at = NOW() ";
        $sql .=" WHERE id=".$news['id']."";
        return $this->db->Execute($sql);
    }
	function UpdateProductById($id,$email,$phone,$yahoo,$address,$fullname,$duong,$phaply,$image,$image2,$image3,$image4,$image5,$matin, $title,$cate,$ward,$gia,$loaigia,$loaitin,$gioithieu,$detail,$tag,$huongnha,$dientich,$phongngu,$phongtam,$phongkhach,$toilet){
        $s_image = "";
        if(!empty($image))
            $s_image .= "image='".$image."',";
		else $s_image = "";
		if(!empty($image2))
            $s_image .= "image2='".$image2."',";
		if(!empty($image3))
        	$s_image .= "image3='".$image3."',";
		if(!empty($image4))
        	$s_image .= "image4='".$image4."',";	
		if(!empty($image5))
            $s_image .= "image5='".$image5."',";
        $sql = "UPDATE product SET tieude='".$title."',duongtruocnha='".$duong."',phaply='".$phaply."',fullname='".$fullname."',email='".$email."',phone='".$phone."',address='".$address."',yahoo='".$yahoo."'";
        $sql .=" ,gioithieu='".$gioithieu."', id_sangiaodich='".$cate."',id_wards='".$ward."',gia='".$gia."',loaigia_id='".$loaigia."',huongnha='".$huongnha."',dientich='".$dientich."',phongngu='".$phongngu."',phongtam='".$phongtam."',phongkhach='".$phongkhach."',sotoilet='".$toilet."',$s_image";
        $sql .=" tag='".$tag."',loaitin='".$loaitin."',video='".$video."',created_at = NOW() ";
        $sql .="WHERE id='".$id."' ";       
        
        return $this->db->Execute($sql);
    }
function UpdateProductByAdmin($id,$video,$email,$phone,$yahoo,$address,$fullname,$duong,$phaply,$image,$image2,$image3,$image4,$image5,$matin, $title,$cate,$ward,$gia,$loaigia,$loaitin,$gioithieu,$detail,$tag,$huongnha,$dientich,$phongngu,$phongtam,$phongkhach,$toilet,$status){
        $s_image = "";
        if(!empty($image))
            $s_image .= "image='".$image."',";
		else $s_image = "";
		if(!empty($image2))
            $s_image .= "image2='".$image2."',";
		if(!empty($image3))
        	$s_image .= "image3='".$image3."',";
		if(!empty($image4))
        	$s_image .= "image4='".$image4."',";	
		if(!empty($image5))
            $s_image .= "image5='".$image5."',";
        $sql = "UPDATE product SET tieude='".$title."',duongtruocnha='".$duong."',phaply='".$phaply."',fullname='".$fullname."',email='".$email."',phone='".$phone."',address='".$address."',yahoo='".$yahoo."'";
        $sql .=" ,gioithieu='".$gioithieu."', id_sangiaodich='".$cate."',id_wards='".$ward."',gia='".$gia."',loaigia_id='".$loaigia."',huongnha='".$huongnha."',dientich='".$dientich."',phongngu='".$phongngu."',phongtam='".$phongtam."',phongkhach='".$phongkhach."',sotoilet='".$toilet."',$s_image";
        $sql .=" tag='".$tag."',status='".$status."',loaitin='".$loaitin."',created_at = NOW() ";
        $sql .="WHERE id='".$id."' ";       
        
        return $this->db->Execute($sql);
    }
    function UpdateNewsByAdmin($user_id, $news,$status,$type){
        $s_image = "";
        if(!empty($news['image']))
            $s_image = "image='".$news['image']."',";
        $sql = "UPDATE service_resort SET categories_id=".$news['categories_id'].",status=".$status.",type=".$type.",title='".$news['title']."'";
        $sql .=" ,description='".$news['description']."',detail='".$news['detail']."', $s_image";
        $sql .=" tag='".$news['tag']."'";
        $sql .=" WHERE id=".$news['id']."";
        return $this->db->Execute($sql);
    }
    function getMaxNewsId(){
        $sql = "SELECT MAX(id) FROM product";
        return $this->db->GetOne($sql);
    }
    /* COMMENT */
    function getLatestComment($limit){
        $sql = "SELECT comment.*, service_resort.title FROM COMMENT, service_resort WHERE comment.active = 1 AND comment.news_id = service_resort.id AND comment.news_id IS NOT NULL ";
        $sql .=" ORDER BY comment.created_at DESC LIMIT 0,$limit";
        return $this->db->Execute($sql);
    }
}
?>