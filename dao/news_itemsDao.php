<?php
class news_itemsDao{
  var $db;
  public function __construct(){
    global $db;
    $this->db = &$db;
  }

  public function news_itemsDao(){
    global $db;
    $this->db = &$db;
  }

  function getnews_items($id){
    return $this->db->GetRow("SELECT * FROM news_items WHERE id = ?", $id);
  }

  function getSqlAdmin3($title = NULL) {
      $sql = " SELECT a.id as id_onoff,a.id, a.title, a.image, a.status, a.created_at FROM news_items as a";
      if ($title != NULL) {
          $sql .= "  AND a.title like '%" . $title . "%'   ";
      }
      $sql .= "  ORDER BY a.id DESC  ";
      return fMakeSqlQuery($sql);
  }

  function insertnews_itemsBE($title,$code,$description,$detail,$image_path,$status){
    $created_at=date("Y-m-d H:i:s");
    $ok = $this->db->Execute("INSERT INTO news_items(title,code,description,detail,image,`status`,created_at) 
                              VALUES (?,?,?,?,?,?,?)",
                              array($title,$code,$description,$detail,$image_path,$status,$created_at));
    if($ok)
      return $this->db->Insert_ID();
    else
      return 0;
  }
  function updatenews_itemsBE($id,$title,$code,$description,$detail,$image_path,$status){
    
    $sql = "UPDATE news_items SET title='".$title."',code='".$code."',description='".$description."',detail='".$detail."',image='".$image_path."',`status`='".$status."' WHERE id=".$id;
    $ok = $this->db->Execute($sql);
    if($ok)
      return "1";
    else
      return "0";
  }
}
?>