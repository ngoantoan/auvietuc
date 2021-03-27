<?php

include_once ("modules/ModuleAdminBase.php");
/**
 * Class common categories
 */
class c_comments extends ModuleAdminBase
{
    public function __construct()
	{
		parent::baseModule();
    }
    
    function c_comments()
    {
        parent::baseModule();
    }

    function main()
    {
        if($this->check_role("ROLE_COMMENT")) {
        $q = strval(mosGetParam($_GET, 'r', ''));

        switch ($q) {
            case 'getJsonList':
                return $this->getJsonList();
                break;
            case 'show':
                return $this->show();
                break;
            case 'update':
                return $this->update();
                break;
            default:
                return $this->showList();
                break;
        }
        } else {
            return "<h1 class='text-center'>ACCESS DENIED</h1>";
        }
    }

    function showList(){
        $tpl = $this->getTemplatePath('list');
        global $ckfinder_path;
        $tpl->assign('folder_lib',$this->site_folder.'/upload/');
        $tpl->assign('ckfinder_path',$ckfinder_path);
        return $tpl->getOutputContent();
    }

    function show($id = 0, $msg=""){
        $tpl = $this->getTemplatePath('edit');
        global $ckfinder_path;
        $tpl->assign('folder_lib',$this->site_folder.'/upload/');
        $tpl->assign('ckfinder_path',$ckfinder_path);
        $tpl->assign('action',"?q=comments&r=update");

        $tpl->assign('msg',$msg);

        $id = getRequest("id");
        if($id > 0) {
//            $this->db->debug=true;
            $comments = $this->db->getRow("select * from comments where id=?", $id);
            $tpl->assign('oper',"edit");
            $tpl->assign('id',$id);
            $tpl->assign('fullname', $comments['fullname']);
            $tpl->assign('title', $comments['title']);
            $tpl -> assign("contents",  $comments['contents']);
            $tpl -> assign("rate", $comments['rate']);
            $tpl -> assign("created_date", $comments['created_date']);

        } else {
            $tpl->assign('oper',"add");
            $tpl -> assign("fullname", '');
            $tpl->assign('title', '');
            $tpl -> assign("contents",  '');
            $tpl -> assign("rate", '');
            $tpl -> assign("created_date", '');
        }
        return $tpl->getOutputContent();
    }

    function getJsonList(){
//        $lang = getRequest("lang");
        //$this->db->debug = true;
        $sql = fMakeSqlQuery("select id, fullname,title, contents, rate, created_date from comments");
        $this->loadClass("class.jqgrid_json_service.php");
        $jqg = new jqgridJsonService($sql);
        return $jqg->renderJson();
    }

    function update(){
//        $this->db->debug = true;
        $id = getRequest("id");
      //  $lang = getRequest("lang");
        $oper = getRequest('oper');
        $fullname = getRequest('fullname');
        $contents = getRequest('contents');
        $rate = getRequest('rate');
        $created_date = getRequest('created_date');
        $title = getRequest('title');
//        $status = getRequest('status');

        $bool = false;
        switch ($oper){
            case "edit":
                $bool = $this->db->Execute("UPDATE comments SET fullname=?, title=?, contents=?, rate=? , created_date=? WHERE id=?",
                    array($fullname,$title, $contents, $rate,$created_date, $id));
                break;
            case "add":
                $bool = $this->db->Execute("INSERT INTO comments(fullname,title, contents, rate, created_date)
						VALUES (?,?,?,?,?)", array($fullname,$title, $contents, $rate,$created_date));
                break;
            case "del":
                $bool = $this->db->Execute("delete from comments where id in (".$id.")");
                break;
        }

        if($bool) {
            header("Location: ".$this->site_folder."/myadmin/?q=comments");
        } else {
            return $this->show($id, "Lỗi");
        }

    }
}
?>