<?php
include_once("modules/ModuleAdminBase.php");
require_once("../dao/about_usDao.php");

class c_about_us extends ModuleAdminBase
{
    var $about_usDao;

    public function __construct() {
		parent::baseModule();
        $this->about_usDao = new about_usDao();
    }
    
    function c_about_us() {
        parent::baseModule();
        $this->about_usDao = new about_usDao();
    }

    function main() {
        $q = strval(mosGetParam($_GET, 'r', ''));
        switch ($q) {
            case 'getJsonList' :
                return $this->getJsonList();
                break;
            case 'update' :
                return $this->update();
                break;
            case 'show' :
                return $this->show();
                break;
            default :
                return $this->showList();
        }
    }

    function showList() {
        $tpl = $this->getTemplatePath("list");
        global $ckfinder_path, $admin_usess;
        $lang = $admin_usess->get("lang");
        if (getRequest('lang')) {
            $lang = getRequest('lang');
        }
        $tpl->assignGlobal('path', $ckfinder_path);
        $tpl->assign(Array(
            "folder_lib" => $this->site_folder . '/upload/',
            "ckfinder_path" => $ckfinder_path));
        return $tpl->getOutputContent();
    }

    function getJsonList() {
        $category_id = getRequest('category_id');
        $lang = getRequest('lang');
        $title = getRequest('title');
        $this->loadClass("class.jqgrid_json_service.php");
        $jqg = new jqgridJsonService($this->about_usDao->getSqlAdmin3($title));
        echo $jqg->renderJson("id");
    }

    function show($msg = "", $reload = 0) {
        $id = getRequest("id");
        if($id>0){
            $tpl = $this->getTemplatePath("edit");
        }else{
            $tpl = $this->getTemplatePath("add");
        }
        $tpl->assignGlobal("msg", $msg);
        $lang = getRequest('lang');
        $tpl->assign('action', "?q=about_us&r=update&lang=" . $lang);
        $tpl->assignGlobal("site_folder", $this->site_folder);
        $tpl->assignGlobal("ckfinder_path", $this->ckfinder_path);
        $tpl->assignGlobal("folder_lib", $this->site_folder . '/upload/');

        if ($id > 0) {//case edit
            $arr = $this->about_usDao->getproject($id);
            if ($arr != NULL) {
                $tpl->assign("title", htmlspecialchars($arr['title']));
                $oFCKeditor = new CKEditor('detail', $arr['detail']);
                $tpl->assign("ck_content", $oFCKeditor->getResourceAfterScript());
                if ($arr['status'] == 1) {
                    $tpl->assign("sactive", 'checked="checked"');
                } else {
                    $tpl->assign("sunactive", 'checked="checked"');
                }
                $tpl->assign("oper", 'editdetail');
                $tpl->assign("id", $arr['id']);
            }
        } else {//case new
            $oFCKeditor = new CKEditor('detail', '');
            $tpl->assign("ck_content", $oFCKeditor->getResourceAfterScript());
            $tpl->assign("sactive", 'checked="checked"');
            $tpl->assign("sort", '1');
            $tpl->assign("vi_selected", 'selected="selected"');
            $tpl->assign("css_display","style=\"display: none;\"");
            $tpl->assign("oper", 'add');
        }

        return $tpl->getOutputContent();
    }

    function update()
    {
        global $admin_usess;
        $oper = getRequest('oper');
        $id = getRequest('id');
        $detail = getRequest('detail');
        $status = getRequest('status');
        $title = getRequest('title');
        $code = $this->make_seo_link($title);
        $lang_id = getRequest('lang');
        $current_index = getRequest('current_index');
        $user_id = $admin_usess->get('USER')['id'];
        switch ($oper) {
            case "update_status" :
                $bool = $this->db->Execute("UPDATE about_us SET status=? WHERE id=?", array($status, $id));
                if ($bool)
                    return nl2br(1);
                else
                    return nl2br(0);
                break;
            case "edit" :
                $bool = $this->db->Execute("UPDATE about_us SET status=? WHERE id=?", array($status, $id));
                if ($bool)
                    return nl2br(1);
                else
                    return nl2br(0);
                break;
            case "editdetail" :
                $bool = $this->about_usDao->updateproductBE($id, $title, addslashes($detail), $status);
                if ($bool)
                    return nl2br(1);
                else
                    return nl2br(0);
                break;
            case "add" :
                $bool = $this->about_usDao->insertproductBE($title, $code, addslashes($detail), $status);
                if ($bool)
                    return nl2br(1);
                else
                    return nl2br(0);
                break;
            case "del" :
                $this->db->Execute("DELETE FROM about_us WHERE id in ($id)");
                return 1;
                break;
        }
    }

    function buildCategoryOption($lang, $selectedCate = NULL, $parentId = NULL, $expand = '', $is_raquo = true)
    {
        $html = '';
        if ($is_raquo)
            $expand .= '&raquo;';

        if ($parentId == NULL)
            $rs = $this->ProductDao->getActivedParentList($lang);
        else
            $rs = $this->ProductDao->getChildrensByNode($lang, $parentId);

        while ($rs && !$rs->EOF) {
            if ($parentId == NULL) {
                $html .= "<optgroup label='&nbsp;" . $rs->fields['title'] . "'>";
            }
            if ($selectedCate == $rs->fields['id'])
                $html .= '<option value="' . $rs->fields['id'] . '" selected>' . $expand . ' ' . $rs->fields['title'] . '</option>';
            else
                $html .= '<option value="' . $rs->fields['id'] . '">' . $expand . ' ' . $rs->fields['title'] . '</option>';
            $html .= $this->buildCategoryOption($lang, $selectedCate, $rs->fields['id'], $expand, $is_raquo);
            $rs->MoveNext();
        }
        return $html;
    }

    function renderSelCate($lang_id, $is_option_root = TRUE)
    {
        if (!$is_option_root)
            return '' . $this->buildCategoryOption($lang_id) . '';
        return '' . $this->buildCategoryOption($lang_id) . '';
    }

    function renderSelCate3($lang_id, $is_option_root = TRUE)
    {
        if (!$is_option_root)
            return '<option value="NULL">--Select category--' . $this->buildCategoryOption($lang_id) . '</option>';
        return '<option value="NULL">--Select category--' . $this->buildCategoryOption($lang_id) . '</option>';
    }

    function make_seo_link($string)
    {
        $string_replace = trim($string);

        $marTViet = array("à", "á", "ạ", "ả", "ã", "â", "ầ", "ấ", "ậ", "ẩ", "ẫ", "ă", "ằ", "ắ", "ặ", "ẳ", "ẵ", "è", "é", "ẹ", "ẻ", "ẽ", "ê", "ề", "ế", "ệ", "ể", "ễ", "ì", "í", "ị", "ỉ", "ĩ", "ò", "ó", "ọ", "ỏ", "õ", "ô", "ồ", "ố", "ộ", "ổ", "ỗ", "ơ", "ờ", "ớ", "ợ", "ở", "ỡ", "ù", "ú", "ụ", "ủ", "ũ", "ư", "ừ", "ứ", "ự", "ử", "ữ", "ỳ", "ý", "ỵ", "ỷ", "ỹ", "đ", "À", "Á", "Ạ", "Ả", "Ã", "Â", "Ầ", "Ấ", "Ậ", "Ẩ", "Ẫ", "Ă", "Ằ", "Ắ", "Ặ", "Ẳ", "Ẵ", "È", "É", "Ẹ", "Ẻ", "Ẽ", "Ê", "Ề", "Ế", "Ệ", "Ể", "Ễ", "Ì", "Í", "Ị", "Ỉ", "Ĩ", "Ò", "Ó", "Ọ", "Ỏ", "Õ", "Ô", "Ồ", "Ố", "Ộ", "Ổ", "Ỗ", "Ơ", "Ờ", "Ớ", "Ợ", "Ở", "Ỡ", "Ù", "Ú", "Ụ", "Ủ", "Ũ", "Ư", "Ừ", "Ứ", "Ự", "Ử", "Ữ", "Ỳ", "Ý", "Ỵ", "Ỷ", "Ỹ", "Đ", "?", "'", " ", "/", ",", "#", ".", "“", "”", "%", "--", '"', "'", "(", ")");

        $marKoDau = array("a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "i", "i", "i", "i", "i", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "o", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u", "y", "y", "y", "y", "y", "d", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "A", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "I", "I", "I", "I", "I", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "U", "U", "U", "U", "U", "U", "U", "U", "U", "U", "U", "Y", "Y", "Y", "Y", "Y", "D", "", "", "-", "", "", "", "-", "", "", "", "", "", "", "", "");
        return strtolower(str_replace($marTViet, $marKoDau, $string_replace));
    }
}// end class
?>
