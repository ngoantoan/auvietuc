<?php
defined('_VALID_MOS') or die('Restricted access');
include_once("modules/ModuleAdminBase.php");

class c_advisory_blog_categories extends ModuleAdminBase
{
    public function __construct()
	{
		parent::baseModule();
    }
    

    function c_advisory_blog_categories()
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
            case 'update' :
                return $this->update();
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
        $sql = fMakeSqlQuery("SELECT id, title, `status` FROM advisory_blog_categories where 1=1 and status = 1 ");
        $this->loadClass("class.jqgrid_json_service.php");
        $jqg = new jqgridJsonService($sql);
        return $jqg->renderJson();
    }

    function update() {
        $oper = getRequest('oper');
        $title = getRequest('title');
        $code = $this->make_seo_link($title);
        $status = getRequest('status');
        $id = getRequest('id');
        $lang = getRequest('lang');
        switch ($oper) {
            case "edit" :
                $sql = "UPDATE advisory_blog_categories SET `title`='$title',`code`='$code',`status`=$status where `id`='" . $id . "'";
                $this->db->Execute($sql);
                break;
            case "add" :
                $sql = "INSERT INTO advisory_blog_categories (`title`, `code`, `status`)
                        VALUES ('" . $title . "', '" . $code . "', '" . $status . "')";
                $bool = $this->db->Execute($sql);
                if ($bool)
                    return '1';
                else
                    return '0';

                break;
            case "del" :
                $sql = 'delete from advisory_blog_categories where id in (' . $id . ")";
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
