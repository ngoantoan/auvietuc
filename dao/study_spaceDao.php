<?php
class study_spaceDao{
  var $db;
  public function __construct(){
    global $db;
    $this->db = &$db;
  }

  public function study_spaceDao(){
    global $db;
    $this->db = &$db;
  }

  function getnews_items($id){
    return $this->db->GetRow("SELECT * FROM study_space WHERE id = ?", $id);
  }

  function getSqlAdmin3($title = NULL) {
      $sql = " SELECT a.id as id_onoff,a.id, a.title, a.image, a.status, a.created_at FROM study_space as a";
      if ($title != NULL) {
          $sql .= "  AND a.title like '%" . $title . "%'   ";
      }
      $sql .= "  ORDER BY a.id DESC  ";
      return fMakeSqlQuery($sql);
  }

  function insertstudy_spaceBE($title,$code,$description,$detail,$image_path,$status){
    $created_at=date("Y-m-d H:i:s");
    $ok = $this->db->Execute("INSERT INTO study_space(title,code,description,detail,image,`status`,created_at) 
                              VALUES (?,?,?,?,?,?,?)",
                              array($title,$code,$description,$detail,$image_path,$status,$created_at));
    if($ok)
      return $this->db->Insert_ID();
    else
      return 0;
  }
  function updatenews_itemsBE($id,$title,$code,$description,$detail,$image_path,$status){
    
    $sql = "UPDATE study_space SET title='".$title."',code='".$code."',description='".$description."',detail='".$detail."',image='".$image_path."',`status`='".$status."' WHERE id=".$id;
    $ok = $this->db->Execute($sql);
    if($ok)
      return "1";
    else
      return "0";
  }
}
?>