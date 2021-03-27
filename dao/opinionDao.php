<?php
class opinionDao{
  var $db;
  public function __construct(){
    global $db;
    $this->db = &$db;
  }

  public function opinionDao(){
    global $db;
    $this->db = &$db;
  }

  function getAdvisory($id){
    return $this->db->GetRow("SELECT * FROM opinion WHERE id = ?", $id);
  }

  function getSqlAdmin3($title = NULL) {
      $sql = " SELECT a.id as id_onoff, a.id, a.title, a.name, a.image, a.status, a.created_at FROM opinion as a";
      if ($title != NULL) {
          $sql .= "  AND a.title like '%" . $title . "%'   ";
      }
      $sql .= "  ORDER BY a.id DESC  ";
      return fMakeSqlQuery($sql);
  }

  function insertOpinionBE($title,$name,$description,$image,$status){
    $created_at=date("Y-m-d H:i:s");
    $ok = $this->db->Execute("INSERT INTO opinion(title,name,description,image,`status`,created_at) 
                              VALUES (?,?,?,?,?,?)",
                              array($title,$name,$description,$image,$status,$created_at));
    if($ok)
      return $this->db->Insert_ID();
    else
      return 0;
  }
  
  function updateOpinionBE($id,$title,$name,$image,$description,$status){
    $sql = "UPDATE opinion SET title='".$title."',name='".$name."',image='".$image."',description='".$description."',`status`='".$status."' WHERE id=".$id;
    $ok = $this->db->Execute($sql);
    if($ok)
      return "1";
    else
      return "0";
  }
}
?>