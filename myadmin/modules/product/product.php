<?php
include_once("modules/ModuleAdminBase.php");
require_once("../dao/ProductDao.php");

class c_product extends ModuleAdminBase
{
    var $ProductDaoDao;

    public function __construct()
	{
		parent::baseModule();
        $this->ProductDao = new ProductDao();
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
            case 'getCategory' :
                return $this->buildCategoryOption(NULL);
                break;
            case 'getCategory3' :
                return $this->buildCategoryOption(NULL);
                break;
            case 'getCategoryWithLang' :
                    $lang=getRequest("lang");
                return $this->buildCategoryOption($lang);
                break;
            case 'get_category_step2' :
                $category = getRequest("category_id");
                return $this->generateOptions("product_category", "id", "title", " parent_id =" . $category);
                break;
            case 'show' :
                return $this->show();
                break;
            case 'show_small' :
                return $this->show_small();
                break;
            case 'show_copy' :
                return $this->show_copy();
                break;
            default :
                return $this->showList();
        }
    }

    function showList()
    {
        $tpl = $this->getTemplatePath("list");
        global $ckfinder_path, $admin_usess;
        $lang = $admin_usess->get("lang");
        if (getRequest('lang')) {
            $lang = getRequest('lang');
        }
        $tpl->assignGlobal('path', $ckfinder_path);
        $tpl->assign(Array(
            "category_step1" => $this->generateOptions("product_category", "id", "title", " parent_id IS NULL "),
            "folder_lib" => $this->site_folder . '/upload/',
            "ckfinder_path" => $ckfinder_path));
        return $tpl->getOutputContent();
    }

    function getJsonList() {
        $category_id = getRequest('category_id');
        $lang = getRequest('lang');
        $title = getRequest('title');
        $username = getRequest('username');
        $type = getRequest('type');
        $this->loadClass("class.jqgrid_json_service.php");
        $jqg = new jqgridJsonService($this->ProductDao->getSqlAdmin3($title, $username, $type, $category_id, $lang));
        echo $jqg->renderJson("id");
    }

    function getSubGridJsonList()
    {
        $id = getRequest('id');
        $sql = fMakeSqlQuery("SELECT comments.id,username, contents,avatar,comments.created_date,rate, comments.status FROM comments INNER JOIN member on comments.member_id=member.id WHERE product_id=" . $id);
        $this->loadClass("class.jqgrid_json_service.php");
        $jqg = new jqgridJsonService($sql);
        return $jqg->renderJson();
    }

    function show($msg = "", $reload = 0) {
        $id = getRequest("id");
        $category_id = getRequest("category_id");
        if( $id > 0 ){
            $tpl = $this->getTemplatePath("edit");
        } else {
            $tpl = $this->getTemplatePath("add");
        }
        $tpl->assignGlobal("msg", $msg);
        $lang = getRequest('lang');
        $tpl->assign('action', "?q=product&r=update&lang=" . $lang);
        $tpl->assignGlobal("site_folder", $this->site_folder);
        $tpl->assignGlobal("ckfinder_path", $this->ckfinder_path);
        $tpl->assignGlobal("folder_lib", $this->site_folder . '/upload/');

        if ($id > 0) {//case edit
            $arr = $this->ProductDao->getproduct($id);
            if ($arr != NULL) {
                $parent_cate=$this->db->getOne("SELECT parent_id FROM product_category WHERE id=?", $arr['category_id']);
                if($parent_cate){
                    $tpl -> assign('category_step2',  $this->generateOptions("product_category", "id", "title", "parent_id = ".$parent_cate." " , "" ,$arr['category_id']));
                    $tpl -> assign('category_step1',  $this->generateOptions("product_category", "id", "title", " parent_id IS NULL " ,"", $parent_cate));
                }else{
                    $tpl -> assign('category_step2',  $this->generateOptions("product_category", "id", "title", "parent_id =".$arr['category_id']." " , "" ));
                    $tpl -> assign('category_step1',  $this->generateOptions("product_category", "id", "title", " parent_id IS NULL " ,"", $arr['category_id']));
                }
                $tpl->assign("title", htmlspecialchars($arr['title']));
                $tpl->assign("price", $arr['price']);
                $tpl->assign("image_path", $arr['image']);
                $oFCKeditor = new CKEditor('detail', $arr['detail']);
                $tpl->assign("ck_content", $oFCKeditor->getResourceAfterScript());
                $tpl->assign("description", $arr['description']);
                if ($arr['status'] == 1) {
                    $tpl->assign("sactive", 'checked="checked"');
                } else {
                    $tpl->assign("sunactive", 'checked="checked"');
                }
                $tpl->assign("oper", 'editdetail');
                $tpl->assign("id", $arr['id']);
                $image = $this->db->getArray("SELECT * FROM images WHERE product_id=?", $arr['id']);
                $index = 1;
                if ($image) {
                    $tpl->assign("update_image","
                    <div class=\"form-group\">
                            <label><input type=\"radio\" name=\"update_image\" value=\"0\" checked=\"checked\" style=\"display: inline;\"/>   Không</label>
                            <label><input type=\"radio\" name=\"update_image\" value=\"1\"  style=\"display: inline;\"/>  Cập nhật</label>
                        </div>
                    ");
                    foreach ($image as $item) {
                        $tpl->newBlock("IMAGE-LIST");
                        $tpl->assign("index", $index);
                        $tpl->assign("image_path", $item['path']);
                        $tpl->assignGlobal("current_index", $index);
                        $index++;
                    }
                } else {
                    $tpl->newBlock("IMAGE-DEFAULT");
                    $tpl->assignGlobal("current_index", "4");
                }
            }
        } else {//case new
            $tpl -> assign('category_step1',  $this->generateOptions("product_category", "id", "title", " parent_id IS NULL"));
            $oFCKeditor = new CKEditor('detail', '');
            $tpl->assign("ck_content", $oFCKeditor->getResourceAfterScript());
            $tpl->assign("sactive", 'checked="checked"');
            $tpl->assign("sort", '1');
            $tpl->assign("vi_selected", 'selected="selected"');
            $tpl->assign("css_display","style=\"display: none;\"");
            $tpl->assign("12_thang_selected", 'checked="checked"');
            $tpl->assign("oper", 'add');
            $tpl->newBlock("IMAGE-DEFAULT");
        }
        return $tpl->getOutputContent();
    }

    function show_small($msg = "", $reload = 0) {
        $tpl = $this->getTemplatePath("update_small");
        $tpl->assignGlobal("msg", $msg);
        $lang = getRequest('lang');
        $tpl->assign('action', "?q=product&r=update&lang=" . $lang);
        $tpl->assignGlobal("site_folder", $this->site_folder);
        $tpl->assignGlobal("ckfinder_path", $this->ckfinder_path);
        $tpl->assignGlobal("folder_lib", $this->site_folder . '/upload/');
        $id = getRequest("id");
        $category_id = getRequest("category_id");
        if ($id > 0) {//case edit
            $arr = $this->ProductDao->getproduct($id);
            if ($arr != NULL) {
                $tpl->assign("sort", $arr['sort']);
                if ($arr['status'] == 1) {
                    $tpl->assign("sactive", 'checked="checked"');
                } else {
                    $tpl->assign("sunactive", 'checked="checked"');
                }
                $tpl->assign("oper", 'edit');
                $tpl->assign("id", $arr['id']);
            }
        }
        return $tpl->getOutputContent();
    }

    function show_copy($msg = "", $reload = 0) {
        $tpl = $this->getTemplatePath("copy");
        $tpl->assignGlobal("msg", $msg);
        $lang = getRequest('lang');
        $tpl->assign('action', "?q=product&r=update&lang=" . $lang);
        $tpl->assignGlobal("site_folder", $this->site_folder);
        $tpl->assignGlobal("ckfinder_path", $this->ckfinder_path);
        $tpl->assignGlobal("folder_lib", $this->site_folder . '/upload/');
        $id = getRequest("id");
        $category_id = getRequest("category_id");
        if ($id > 0) {//case edit
            $arr = $this->ProductDao->getproduct($id);
            if ($arr != NULL) {
                $parent_cate=$this->db->getOne("SELECT parent_id FROM product_category WHERE id=?", $arr['category_id']);
                if($parent_cate){
                    $tpl -> assign('category_step2',  $this->generateOptions("product_category", "id", "title", "parent_id = ".$parent_cate." " , "" ,$arr['category_id']));
                    $tpl -> assign('category_step1',  $this->generateOptions("product_category", "id", "title", " parent_id IS NULL " ,"", $parent_cate));
                    $tpl->assign("css_display","style=\"display: none;\"");
                }else{
                    $tpl -> assign('category_step2',  $this->generateOptions("product_category", "id", "title", "parent_id =".$arr['category_id']." " , "" ));
                    $tpl -> assign('category_step1',  $this->generateOptions("product_category", "id", "title", " parent_id IS NULL " ,"", $arr['category_id']));
                }
                $tpl->assign("price", $arr['price']);
                $tpl->assign("title", htmlspecialchars($arr['title'])."(copy)");
                $tpl->assign("image_path", $arr['image']);
                $oFCKeditor = new CKEditor('detail', $arr['detail']);
                $tpl->assign("ck_content", $oFCKeditor->getResourceAfterScript());
                $tpl->assign("description", $arr['description']);
                if ($arr['status'] == 1) {
                    $tpl->assign("sactive", 'checked="checked"');
                } else {
                    $tpl->assign("sunactive", 'checked="checked"');
                }
                $tpl->assign("oper", 'copydetail');
                $tpl->assign("id", $arr['id']);
                $image = $this->db->getArray("SELECT * FROM images WHERE product_id=?", $arr['id']);
                $index = 1;
                if ($image) {
                    $tpl->assign("update_image","
                    <div class=\"form-group\">
                            <label><input type=\"radio\" name=\"update_image\" value=\"0\" checked=\"checked\" style=\"display: inline;\"/>   Không</label>
                            <label><input type=\"radio\" name=\"update_image\" value=\"1\"  style=\"display: inline;\"/>  Cập nhật</label>
                        </div>
                    ");
                    foreach ($image as $item) {
                        $tpl->newBlock("IMAGE-LIST");
                        $tpl->assign("index", $index);
                        $tpl->assign("image_path", $item['path']);
                        $tpl->assignGlobal("current_index", $index);
                        $index++;

                    }
                } else {
                    $tpl->newBlock("IMAGE-DEFAULT");
                    $tpl->assignGlobal("current_index", "4");
                }
            }
        }

        return $tpl->getOutputContent();
    }

    function update() {
        global $admin_usess;
        $oper = getRequest('oper');
        $id = getRequest('id');
        $category_step1 = getRequest('category_step1_modal');
        $category_step2 = getRequest('category_step2_modal');
        if($category_step2 != ""){
            $category_id = $category_step2;
        } else {
            $category_id = $category_step1;
        }
        $description = getRequest('description');
        $detail = getRequest('detail');
        $image_path = getRequest('image');
        $status = getRequest('status');
        $title = getRequest('title');
        $code = $this->make_seo_link($title);
        $price = getRequest('price');
        $current_index = getRequest('current_index');
        $update_image = getRequest('update_image');
        $user_id = $admin_usess->get('USER')['id'];
        switch ($oper) {
            case "update_status" :
                $bool = $this->db->Execute("UPDATE products SET status=? WHERE id=?", array($status, $id));
                if ($bool)
                    return nl2br(1);
                else
                    return nl2br(0);
                break;
            case "edit" :
                $bool = $this->db->Execute("UPDATE products SET status=?, sort=? WHERE id=?", array($status, $sort, $id));
                if ($bool)
                    return nl2br(1);
                else
                    return nl2br(0);
                break;
            case "editdetail" :
                $bool = $this->ProductDao->updateproductBE($id, $category_id, $title, $code, addslashes($description), addslashes($detail), $image_path, $status, $price);
                    $this->db->Execute("DELETE FROM images WHERE product_id =?", $id);
                    for ($i = 1; $i <= $current_index; $i++) {
                        $image = getRequest('image_' . $i);
                        if ($image != '') {
                            $this->db->Execute("insert into images (product_id,`path`) values (?,?)", array($id, $image));
                        }
                    }
                if ($bool)
                    return nl2br(1);
                else
                    return nl2br(0);
                break;
            case "add" :
                $bool = $this->ProductDao->insertproductBE($category_id, $title, $code, addslashes($description), addslashes($detail), $image_path, $status, $user_id, $price);
                $product_id = $this->db->Insert_ID();
                $this->db->Execute("DELETE FROM images WHERE product_id =?", $product_id);
                for ($i = 1; $i <= $current_index; $i++) {
                    $image = getRequest('image_' . $i);
                    if ($image != '') {
                        $this->db->Execute("insert into images (product_id,`path`) values (?,?)", array($product_id, $image));
                    }
                }
                if ($bool)
                    return nl2br(1);
                else
                    return nl2br(0);
                break;
             case "copydetail" :
                $bool = $this->ProductDao->insertproductBE($category_id, $title, $code, addslashes($description), addslashes($detail), $image_path, $status, $user_id, $price);
                $product_id = $this->db->Insert_ID();
                $this->db->Execute("DELETE FROM images WHERE product_id =?", $product_id);
                for ($i = 1; $i <= $current_index; $i++) {
                    $image = getRequest('image_' . $i);
                    if ($image != '') {
                        $this->db->Execute("insert into images (product_id,`path`) values (?,?)", array($product_id, $image));
                    }
                }
                if ($bool)
                    return nl2br(1);
                else
                    return nl2br(0);
                break;
            case "del" :
                $this->db->Execute("DELETE FROM products WHERE id in ($id)");
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
