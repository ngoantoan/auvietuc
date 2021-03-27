<?php
class jobDao{
  var $db;
  public function __construct(){
    global $db;
    $this->db = &$db;
  }

  public function jobDao(){
    global $db;
    $this->db = &$db;
  }

  function getnews_items($id){
    return $this->db->GetRow("SELECT * FROM job WHERE id = ?", $id);
  }

  function getSqlAdmin3($title = NULL) {
      $sql = " SELECT a.id, a.title FROM job as a";
      if ($title != NULL) {
          $sql .= "  AND a.title like '%" . $title . "%'   ";
      }
      $sql .= "  ORDER BY a.id DESC  ";
      return fMakeSqlQuery($sql);
  }

  function insertJobBE($title,$detail){
    $created_at=date("Y-m-d H:i:s");
    $ok = $this->db->Execute("INSERT INTO job(title,detail,created_at) 
                              VALUES (?,?,?)",
                              array($title,$detail,$created_at));
    if($ok)
      return $this->db->Insert_ID();
    else
      return 0;
  }

  function updateJobBE($id,$title,$detail){
    
    $sql = "UPDATE job SET title='".$title."',detail='".$detail."' WHERE id=".$id;
    $ok = $this->db->Execute($sql);
    if($ok)
      return "1";
    else
      return "0";
  }
}
?>