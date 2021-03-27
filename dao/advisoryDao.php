<?php
class advisoryDao{
  var $db;
  public function __construct(){
    global $db;
    $this->db = &$db;
  }

  public function advisoryDao(){
    global $db;
    $this->db = &$db;
  }

  function getAdvisory($id){
    return $this->db->GetRow("SELECT * FROM advisory WHERE id = ?", $id);
  }

  function getSqlAdmin3($title = NULL) {
      $sql = " SELECT a.id as id_onoff, a.id, a.title, a.image, a.status, a.created_at FROM advisory as a";
      if ($title != NULL) {
          $sql .= "  AND a.title like '%" . $title . "%'   ";
      }
      $sql .= "  ORDER BY a.id DESC  ";
      return fMakeSqlQuery($sql);
  }

  function insertAdvisoryBE($title,$description,$image,$status){
    $created_at=date("Y-m-d H:i:s");
    $ok = $this->db->Execute("INSERT INTO advisory(title,description,image,`status`,created_at) 
                              VALUES (?,?,?,?,?)",
                              array($title,$description,$image,$status,$created_at));
    if($ok)
      return $this->db->Insert_ID();
    else
      return 0;
  }
  
  function updateAdvisoryBE($id,$title,$image,$description,$status){
    $sql = "UPDATE advisory SET title='".$title."',image='".$image."',description='".$description."',`status`='".$status."' WHERE id=".$id;
    $ok = $this->db->Execute($sql);
    if($ok)
      return "1";
    else
      return "0";
  }
}
?>