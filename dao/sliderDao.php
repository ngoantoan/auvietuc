<?php
class sliderDao{
  var $db;
  public function __construct(){
    global $db;
    $this->db = &$db;
  }

  public function sliderDao(){
    global $db;
    $this->db = &$db;
  }

  function getslider($id){
    return $this->db->GetRow("SELECT * FROM slider WHERE id = ?", $id);
  }

  function getSqlAdmin3($title = NULL) {
      $sql = " SELECT a.id as id_onoff, a.id, a.title, a.link, a.image, a.status, a.created_at FROM slider as a";
      if ($title != NULL) {
          $sql .= "  AND a.title like '%" . $title . "%'   ";
      }
      $sql .= "  ORDER BY a.id DESC  ";
      return fMakeSqlQuery($sql);
  }

  function insertsliderBE($title,$link,$content,$image_path,$status){
    $created_at=date("Y-m-d H:i:s");
    $ok = $this->db->Execute("INSERT INTO slider(title,link,description,image,`status`,created_at) 
                              VALUES (?,?,?,?,?,?)",
                              array($title,$link,$content,$image_path,$status,$created_at));
    if($ok)
      return $this->db->Insert_ID();
    else
      return 0;
  }
  
  function updatesliderBE($id,$title,$link,$content,$image_path,$status){
    $sql = "UPDATE slider SET title='".$title."',link='".$link."',description='".$content."',image='".$image_path."',`status`='".$status."' WHERE id=".$id;
    $ok = $this->db->Execute($sql);
    if($ok)
      return "1";
    else
      return "0";
  }
}
?>