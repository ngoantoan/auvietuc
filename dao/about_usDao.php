<?php
class about_usDao{
    var $db;
    public function __construct(){
        global $db;
        $this->db = &$db;
    }

    public function about_usDao(){
        global $db;
        $this->db = &$db;
    }

    function getSqlAdmin3($title = NULL) {
        $sql = " SELECT a.id as id_onoff, a.id, a.title, a.status, a.created FROM about_us as a where 1=1 ";
        if ($title != NULL) {
            $sql .= "  AND a.title like '%" . $title . "%'   ";
        }
        $sql .= "  ORDER BY a.id DESC  ";
        return fMakeSqlQuery($sql);
    }

    function getproject($id){
        return $this->db->GetRow("SELECT * FROM about_us WHERE id = ?", $id);
    }

    function updateproductBE($id,$title,$content,$status){
        $sql = "UPDATE about_us SET title='".$title."',detail='".$content."',`status`='".$status."' WHERE id=".$id;
        $ok = $this->db->Execute($sql);
        if($ok)
            return "1";
        else
            return "0";
    }

    function insertproductBE($title,$code,$content,$status){
        $created_at=date("Y-m-d H:i:s");
        $sql = "INSERT INTO about_us(title,code,detail,`status`,created)";
        $sql .= " VALUES ('".$title."','".$code."','".$content."','".$status."','".$created_at."')";
        $ok = $this->db->Execute($sql);
        if($ok)
            return $this->db->Insert_ID();
        else
            return 0;
    }
}
?>