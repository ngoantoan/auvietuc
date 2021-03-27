<?php
class EducationProgramDao{
  var $db;
  public function __construct(){
    global $db;
    $this->db = &$db;
  }

  public function EducationProgramDao(){
    global $db;
    $this->db = &$db;
  }

  function getEducationProgram($id){
    return $this->db->GetRow("SELECT * FROM education_program WHERE id = ?", $id);
  }

  function getSqlAdmin3($title = NULL) {
      $sql = " SELECT a.id as id_onoff, a.id, a.title, a.image, a.status, a.created_at FROM education_program as a";
      if ($title != NULL) {
          $sql .= "  AND a.title like '%" . $title . "%'   ";
      }
      $sql .= "  ORDER BY a.id DESC  ";
      return fMakeSqlQuery($sql);
  }

  function insertsliderBE($title,$title1,$code,$description,$detail,$image_path,$status){
    $created_at=date("Y-m-d H:i:s");
    $ok = $this->db->Execute("INSERT INTO education_program(title,title1,code,description,detail,image,`status`,created_at) 
                              VALUES (?,?,?,?,?,?,?,?)",
                              array($title,$title1,$code,$description,$detail,$image_path,$status,$created_at));
    if($ok)
      return $this->db->Insert_ID();
    else
      return 0;
  }
  
  function updatesliderBE($id,$title,$title1,$code,$description,$detail,$image_path,$status){
    $sql = "UPDATE education_program SET title='".$title."',title1='".$title1."',code='".$code."',description='".$description."',detail='".$detail."',image='".$image_path."',`status`='".$status."' WHERE id=".$id;
    $ok = $this->db->Execute($sql);
    if($ok)
      return "1";
    else
      return "0";
  }
}
?>