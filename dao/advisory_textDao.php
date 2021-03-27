<?php
class advisory_textDao{
    var $db;
    public function __construct(){
        global $db;
        $this->db = &$db;
    }

    public function advisory_textDao(){
        global $db;
        $this->db = &$db;
    }

    function getSqlAdmin3($title = NULL) {
        $sql = " SELECT a.id as id_onoff, a.id, a.title, a.status, a.created FROM advisory_text as a where 1=1 ";
        if ($title != NULL) {
            $sql .= "  AND a.title like '%" . $title . "%'   ";
        }
        $sql .= "  ORDER BY a.id DESC  ";
        return fMakeSqlQuery($sql);
    }

    function getproject($id){
        return $this->db->GetRow("SELECT * FROM advisory_text WHERE id = ?", $id);
    }

    function updateproductBE($id,$title,$content,$status){
        $sql = "UPDATE advisory_text SET title='".$title."',detail='".$content."',`status`='".$status."' WHERE id=".$id;
        $ok = $this->db->Execute($sql);
        if($ok)
            return "1";
        else
            return "0";
    }

    function insertproductBE($title,$code,$content,$status){
        $created_at=date("Y-m-d H:i:s");
        $sql = "INSERT INTO advisory_text(title,code,detail,`status`,created)";
        $sql .= " VALUES ('".$title."','".$code."','".$content."','".$status."','".$created_at."')";
        $ok = $this->db->Execute($sql);
        if($ok)
            return $this->db->Insert_ID();
        else
            return 0;
    }
}
?>