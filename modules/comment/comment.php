<?php
include_once("modules/ModuleBase.php");

class comment extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function comment()
    {
        parent::ModuleBase();
    }

    function getContent($language)
    {
        $action = $this->routing->action;
        if (getRequest("action") != NULL)
            $action = getRequest("action");
        switch ($action) {
            case "comment_education":
                return $this->comment_education($language);
                break;
            case "load_comment_education":
                return $this->load_comment_education($language);
                break;
            case "comment_blog":
                return $this->comment_blog($language);
                break;
            case "load_comment_blog":
                return $this->load_comment_blog($language);
                break;
            default :
                return $this->view($language);
                break;
        }
    }

    function view($language) {
        $tpl = $this->getTemplatePath("comment", "comment");
        return $tpl -> getOutputContent();
    }

    // comment khóa học
    function comment_education() {
        global $usess;
        $html = "";
        $cus = $usess->get("LOGIN");
		if ($cus) {
            $id         = getRequest("id");
            $content    = getRequest("content");
			$addcmt = $this->db->Execute("insert into comments_education (id_customer, contents, id_education) VALUES (?,?,?)", array($cus['id'], $content, $id));
            $id = $this->db->Insert_ID();
			$comment = $this->db->getRow("SELECT * FROM comments_education WHERE status = 1 and id = $id");
			if ($addcmt) {
				if ($comment) {
                    $html .= '<div class="item-comment">';
                        $html .= '<h4><span>'. $cus['name'] .'</span> - <small>'. date("d/m/Y", strtotime($cus['created_at'])) .'</small></h4>';
                        $html .= '<p class="txt-comment">'. $comment['contents'] .'</p>';
                    $html .= '</div>';
				}
				return $html;
			} else {
				return 0;
			}
		} else {
			return -1;
		}
    }

    // hiển thị thêm comment trang chi tiết khóa học
    function load_comment_education() {
        $id = getRequest("id");
        $comment = $this->db->getRow("SELECT * FROM comments_education WHERE id=?", $id);
        $comments = $this->db->getArray("select e.id as id_comment, e.contents, c.* from comments_education as e inner join customer as c on c.id = e.id_customer 
                                        where status = 1 and e.id_education = ? and e.id < ? order by e.created_at desc limit 0,4", array($comment['id_education'], $id));
        if ($comments) {
            return json_encode($comments);
        } else {
            return 0;
        } 
    }

    // comment khóa học
    function comment_blog() {
        global $usess;
        $html = "";
        $cus = $usess->get("LOGIN");
		if ($cus) {
            $id         = getRequest("id");
            $content    = getRequest("content");
			$addcmt = $this->db->Execute("insert into comments_blog (id_customer, contents, id_blog) VALUES (?,?,?)", array($cus['id'], $content, $id));
            $id = $this->db->Insert_ID();
			$comment = $this->db->getRow("SELECT * FROM comments_blog WHERE status = 1 and id = $id");
			if ($addcmt) {
				if ($comment) {
                    $html .= '<div class="item-comment">';
                        $html .= '<h4><span>'. $cus['name'] .'</span> - <small>'. date("d/m/Y", strtotime($cus['created_at'])) .'</small></h4>';
                        $html .= '<p class="txt-comment">'. $comment['contents'] .'</p>';
                    $html .= '</div>';
				}
				return $html;
			} else {
				return 0;
			}
		} else {
			return -1;
		}
    }

    // hiển thị thêm comment trang chi tiết blog
    function load_comment_blog() {
        $id = getRequest("id");
        $comment = $this->db->getRow("SELECT * FROM comments_blog WHERE id=?", $id);
        $comments = $this->db->getArray("select b.id as id_comment, b.contents, c.* from comments_blog as b inner join customer as c on c.id = b.id_customer 
                                        where status = 1 and b.id_blog = ? and b.id < ? order by b.created_at desc limit 0,4", array($comment['id_blog'], $id));
        if ($comments) {
            return json_encode($comments);
        } else {
            return 0;
        } 
    }
}

?>