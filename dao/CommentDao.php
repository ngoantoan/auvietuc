<?php
defined( '_VALID_MOS' ) or die( 'Restricted access' );
/**************  DAO Banner/Banner_category  *********/
/******************************************/
class CommentDao{
    var $db;
    public function __construct(){
        global $db;
        $this->db = &$db;
    }

    public function CommentDao(){
        global $db;
        $this->db = &$db;
    }
    /*
     * COMMENT FOR NEWS
     * 
     */
    function getCommentByNewsId($news_id){        
        return $sql  = "SELECT comment.*,DATE_FORMAT(comment.created_at,'%h:%i:%s - %d/%m/%Y') AS ngaytao, member.logo AS user_logo,member.role_id AS user_role,member.username AS user_fullname, member.email AS user_email,member.status AS user_status ,member.type FROM comment INNER JOIN member ON comment.user_id = member.user_id WHERE news_id = $news_id AND active = 1 ORDER BY created_at DESC";        
    }
    function AddCommentNews($news_id,$content, $user_id, $is_active=0){
        if($is_active){
            $sql ="INSERT INTO comment(news_id, user_id, content, active) VALUES($news_id, $user_id, '$content',$is_active);";    
        }
        else{
            $sql ="INSERT INTO comment(news_id, user_id, content, active) VALUES($news_id, $user_id, '$content',$is_active);";
        }        
        return $this->db->Execute($sql);
    }
    /*
     * COMMENT FOR FAQ
     * 
     */
    function getCommentByFaqId($faq_id,$limit=""){
        $limit = "";
        if(!empty($limit)){
            $limit = "LIMIT 0,$limit";
        }
        $sql  = "SELECT comment.*,DATE_FORMAT(comment.created_at,'%h:%i:%s - %d/%m/%Y') AS ngaytao, member.logo AS user_logo,member.role_id AS user_role,member.fullname AS user_fullname, member.email AS user_email,member.status AS user_status FROM comment INNER JOIN member ON comment.user_id = member.user_id WHERE news_id = $faq_id AND active = 1 $limit";
        return $this->db->Execute($sql);
    }
}