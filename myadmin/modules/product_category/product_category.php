<?php
defined('_VALID_MOS') or die('Restricted access');
include_once("modules/ModuleAdminBase.php");

class c_product_category extends ModuleAdminBase
{
    public function __construct()
	{
		parent::baseModule();
    }
    

    function c_product_category()
    {
        parent::baseModule();
    }

    function main()
    {
        $q = strval(mosGetParam($_GET, 'r', ''));
        switch ($q) {
            case 'getJsonList' :
                return $this->getJsonList();
                break;
            case 'getSubGridJsonList' :
                return $this->getSubGridJsonList();
                break;
            case 'update' :
                return $this->update();
                break;
            case 'updatesub' :
                return $this->updatesub();
                break;
            case 'getLanguages' :
                return $this->getLanguages();
                break;
            default :
                return $this->showList();
        }
    }

    function getLanguages() {
        $lang_id = getRequest("lang_id");
        return $this->generateList('npt_languages', "id", 'description', $lang_id);
    }

    function showList() {
        $tpl = $this->getTemplatePath("list");
        global $ckfinder_path;
        $tpl->assign(Array(
            "folder_lib" => $this->site_folder . '/upload/',
            "ckfinder_path" => $ckfinder_path));
        return $tpl->getOutputContent();
    }

    function getJsonList() {
        $lang = getRequest('lang');
        $where = "";
        $sql = fMakeSqlQuery("SELECT id, title, code,`status`, sort FROM product_category where 1=1 and parent_id IS NULL $where ");
        $this->loadClass("class.jqgrid_json_service.php");
        $jqg = new jqgridJsonService($sql);
        return $jqg->renderJson();
    }

    function getSubGridJsonList() {
        $lang = getRequest('lang');
        $where = "";
        // if ($lang != "") {
        //     $where .= " AND lang=" . $lang;
        // }
        $parent_id = $_REQUEST['id'];
        $sql = fMakeSqlQuery("SELECT id, title, `code`, `status`, sort FROM product_category where parent_id = $parent_id $where");
        $this->loadClass("class.jqgrid_json_service.php");
        $jqg = new jqgridJsonService($sql);
        return $jqg->renderJson();
    }

    function update() {
        $oper = getRequest('oper');
        $title = getRequest('title');
        $status = getRequest('status');
        $sort = getRequest('sort');
        $id = getRequest('id');
        $code = getRequest('code');
        $lang = getRequest('lang');
        switch ($oper) {
            case "edit" :
                $sql = "UPDATE product_category SET `title`='$title',`status`=$status,
				`sort`=$sort,`code`='$code' where `id`='" . $id . "'";

                $this->db->Execute($sql);
                break;
            case "add" :
                $sql = "INSERT INTO product_category (`title`,`code`, `status`, `sort`)
                        VALUES ('" . $title . "', '" . $code . "', '" . $status . "','" . $sort . "')";

                $bool = $this->db->Execute($sql);
                if ($bool)
                    return '1';
                else
                    return '0';

                break;
            case "del" :
                $sql = 'delete from product_category where id in (' . $id . ")";
                $this->db->Execute($sql);
                return 1;
                break;
        }
    }

    function updatesub() {
        $parent_id = $_REQUEST['parent_id'];
        $oper = getRequest('oper');
        $title = getRequest('title');
        $status = getRequest('status');
        $sort = getRequest('sort');
        $id = getRequest('id');
        $code = getRequest('code');
        $lang = getRequest('lang');
        switch ($oper) {
            case "edit" :
                $sql = "UPDATE product_category SET parent_id = $parent_id, `title`='$title', `status`=$status,
				`sort`=$sort, `code`='$code' where `id`='" . $id . "'";
                $this->db->Execute($sql);
                break;
            case "add" :
                $sql = "INSERT INTO product_category (parent_id, `title`, `code`, `status`, `sort`)
                        VALUES ('" . $parent_id . "','" . $title . "', '" . $code . "', '" . $status . "','" . $sort . "')";
                $bool = $this->db->Execute($sql);
                if ($bool)
                    return '1';
                else
                    return '0';
                break;
            case "del" :
                $sql = 'delete from product_category where id in (' . $id . ")";
                $this->db->Execute($sql);
                return 1;
                break;
        }
    }

    function buildCategoryOption($selectedCate = NULL, $parentId = NULL, $expand = '', $is_raquo = true) {
        $html = '';
        if ($is_raquo) $expand .= '&raquo;';

        if ($parentId == NULL) $rs = $this->service_resortDao->getActivedParentList3();
        else {
            $rs = $this->service_resortDao->getActivedParentList3();
        }
        while ($rs && !$rs->EOF) {
            if ($parentId == NULL) {

                $html .= "<optgroup label='&nbsp;" . $rs->fields['title'] . "'>";
            }

            if ($selectedCate == $rs->fields['id'])
                $html .= '<option value="' . $rs->fields['id'] . '" selected="selected">' . $expand . ' ' . $rs->fields['title'] . '</option>';
            else
                $html .= '<option value="' . $rs->fields['id'] . '">' . $expand . ' ' . $rs->fields['title'] . '</option>';
            $rs->MoveNext();
        }
        return $html;
    }


    /**
     * @param: $selectedCateId = NULL
     * @param: $is_option_root = TRUE
     * @param: $language_id: $_REQUEST['lang_id']
     */
    function renderSelCate($is_option_root = TRUE)
    {
        $this->db->debug = true;
        if (!$is_option_root) return '' . $this->buildCategoryOption() . '';
        return '' . $this->buildCategoryOption() . '';
    }
}

?>
