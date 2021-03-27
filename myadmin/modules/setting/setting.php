<?php

include_once ("modules/ModuleAdminBase.php");
/**
 * Class common categories
 */
class c_setting extends ModuleAdminBase
{
    public function __construct()
	{
		parent::baseModule();
    }
    
    function c_setting()
    {
        parent::baseModule();
    }

    function main()
    {
        if($this->check_role("ROLE_SETTING")) {
        $q = strval(mosGetParam($_GET, 'r', ''));

        switch ($q) {
            case 'getJsonList':
                return $this->getJsonList();
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
        $tpl = $this->getTemplatePath('setting');
        global $ckfinder_path;
        $tpl->assign('folder_lib',$this->site_folder.'/upload/');
        $tpl->assign('ckfinder_path',$ckfinder_path);
        return $tpl->getOutputContent();
    }
    function getJsonList(){
        $sql =fMakeSqlQuery("select id,phi_giai_bai,phi_giai_bai_en,bai_kho, meta, google_analytics from settings ");
        $this->loadClass("class.jqgrid_json_service.php");
        $jqg = new jqgridJsonService($sql);
        return $jqg->renderJson();
    }
    function update(){
        //$this->db->debug=true;
        $id = getRequest("id");
        $oper = getRequest('oper');
        $phi_giai_bai = getRequest('phi_giai_bai');
        $phi_giai_bai_en = getRequest('phi_giai_bai_en');
        $bai_kho = getRequest('bai_kho');
        $meta = getRequest('meta');
        $google_analytics = getRequest('google_analytics');
        switch ($oper){
            case "edit":
                 $this->db->Execute("UPDATE settings SET phi_giai_bai=?,phi_giai_bai_en=?,bai_kho=?,meta=?,google_analytics=? WHERE  id=?",
                    array($phi_giai_bai, $phi_giai_bai_en,$bai_kho,$meta,$google_analytics, $id));
                break;
            case "add":
                 $this->db->Execute("INSERT INTO settings(phi_giai_bai,phi_giai_bai_en,bai_kho,meta,google_analytics)
  VALUES (?,?,?,?,?,?,?,?,?)", array($phi_giai_bai,$phi_giai_bai_en,$bai_kho, $meta,$google_analytics));
                break;
            case "del":
                 $this->db->Execute("delete from settings where id in ($id)");
                break;
        }
    }
}
?>