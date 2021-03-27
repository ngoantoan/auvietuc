<?php

include_once("modules/ModuleAdminBase.php");

/**
 * Class common categories
 */
class c_policy extends ModuleAdminBase
{
    function c_policy()
    {
        parent::baseModule();
    }

    function main()
    {
        if ($this->check_role("ROLE_POLICY")) {
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

    function showList()
    {
        $tpl = $this->getTemplatePath('list');
        global $ckfinder_path;
        $tpl->assign('folder_lib', $this->site_folder . '/upload/');
        $tpl->assign('ckfinder_path', $ckfinder_path);
        return $tpl->getOutputContent();
    }

    function show($id = 0, $msg = "")
    {
        $tpl = $this->getTemplatePath('edit');
        global $ckfinder_path;
        $tpl->assign('folder_lib', $this->site_folder . '/upload/');
        $tpl->assign('ckfinder_path', $ckfinder_path);
        $tpl->assign('action', "?q=policy&r=update&lang=" . getRequest("lang"));

        $tpl->assign('msg', $msg);

        $id = getRequest("id");
        if ($id > 0) {
            $policy = $this->db->getRow("select * from policies where id=?", $id);
            $tpl->assign('oper', "edit");
            $tpl->assign('id', $id);
            $tpl->assign('title', $policy['title']);
            $tpl->assign('code', $policy['code']);
            $oFCKeditor = new CKEditor('detail', $policy['detail']);
            $tpl->assign("ck_detail", $oFCKeditor->getResource());

            if ($policy['status'] == 1) {
                $tpl->assign("sactive", 'checked="checked"');
            } else {
                $tpl->assign("sunactive", 'checked="checked"');
            }

        } else {
            $tpl->assign('oper', "add");
            $oFCKeditor = new CKEditor('detail', '');
            $tpl->assign("ck_detail", $oFCKeditor->getResource());
            $tpl->assign("sunactive", 'checked="checked"');
        }
        return $tpl->getOutputContent();
    }

    function getJsonList()
    {
        $lang = getRequest("lang");
        //$this->db->debug = true;
        $sql = fMakeSqlQuery("select id, code, title, status from policies where lang = " . $lang);
        $this->loadClass("class.jqgrid_json_service.php");
        $jqg = new jqgridJsonService($sql);
        return $jqg->renderJson();
    }

    function update()
    {
        //$this->db->debug = true;
        $id = getRequest("id");
        $lang = getRequest("lang");
        $oper = getRequest('oper');
        $title = getRequest('title');
        $code = getRequest('code');
        $detail = getRequest('detail');
        $status = getRequest('status');

        $bool = false;
        switch ($oper) {
            case "edit":
                $bool = $this->db->Execute("UPDATE policies SET code=?, title=?, detail=?, `status`=?, lang=? WHERE id=?",
                    array($code, $title, $detail, $status, $lang, $id));
                break;
            case "add":
                $bool = $this->db->Execute("INSERT INTO policies(code, title, detail, lang, `status`)
						VALUES (?,?,?,?,?)", array($code, $title, $detail, $lang, $status));
                break;
            case "del":
                $bool = $this->db->Execute("delete from policies where id in (" . $id . ")");
                break;
        }

        if ($bool) {
            header("Location: " . $this->site_folder . "/myadmin/?q=policy");
        } else {
            return $this->show($id, "Lỗi");
        }

    }
}

?>