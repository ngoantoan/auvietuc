<?php
class communicate_confidentlyDao{
  var $db;
  public function __construct(){
    global $db;
    $this->db = &$db;
  }

  public function communicate_confidentlyDao(){
    global $db;
    $this->db = &$db;
  }

  function getCommunicate_Confidently($id){
    return $this->db->GetRow("SELECT * FROM communicate_confidently WHERE id = ?", $id);
  }

  function getSqlAdmin3($title = NULL) {
      $sql = " SELECT a.id as id_onoff,a.id, a.title, a.image, a.status, a.created_at FROM communicate_confidently as a";
      if ($title != NULL) {
          $sql .= "  AND a.title like '%" . $title . "%'   ";
      }
      $sql .= "  ORDER BY a.id DESC  ";
      return fMakeSqlQuery($sql);
  }

  function insertCommunicate_ConfidentlyBE($title,$image_path, $video_path, $status){
    $created_at=date("Y-m-d H:i:s");
    $ok = $this->db->Execute("INSERT INTO communicate_confidently(title,image,video,`status`,created_at) 
                              VALUES (?,?,?,?,?)",
                              array($title,$image_path,$video_path,$status,$created_at));
    if($ok)
      return $this->db->Insert_ID();
    else
      return 0;
  }
  function updateCommunicate_ConfidentlyBE($id,$title,$image_path,$video_path,$status){
    
    $sql = "UPDATE communicate_confidently SET title='".$title."',image='".$image_path."',video='".$video_path."',`status`='".$status."' WHERE id=".$id;
    $ok = $this->db->Execute($sql);
    if($ok)
      return "1";
    else
      return "0";
  }
}
?>