<?php
class philosophyDao{
  var $db;
  public function __construct(){
    global $db;
    $this->db = &$db;
  }

  public function philosophyDao(){
    global $db;
    $this->db = &$db;
  }

  function getPhilosophy($id){
    return $this->db->GetRow("SELECT * FROM philosophy WHERE id = ?", $id);
  }

  function getSqlAdmin3($title = NULL) {
      $sql = " SELECT a.id as id_onoff, a.id, a.title, a.status, a.created_at FROM philosophy as a";
      if ($title != NULL) {
          $sql .= "  AND a.title like '%" . $title . "%'   ";
      }
      $sql .= "  ORDER BY a.id DESC  ";
      return fMakeSqlQuery($sql);
  }

  function insertPhilosophyBE($title,$description,$status){
    $created_at=date("Y-m-d H:i:s");
    $ok = $this->db->Execute("INSERT INTO philosophy(title,description,`status`,created_at) 
                              VALUES (?,?,?,?)",
                              array($title,$description,$status,$created_at));
    if($ok)
      return $this->db->Insert_ID();
    else
      return 0;
  }
  
  function updatePhilosophyBE($id,$title,$description,$status){
    $sql = "UPDATE philosophy SET title='".$title."',description='".$description."',`status`='".$status."' WHERE id=".$id;
    $ok = $this->db->Execute($sql);
    if($ok)
      return "1";
    else
      return "0";
  }
}
?>