<?php
/**
 * NPortal: Setting page with module
 * Date:24/12/2008
 */
// load the language file
global $admin_usess;
include_once ("modules/ModuleAdminBase.php");
include_once ("../includes/class.layouts.php");
include_once ("../dao/PagesDao.php");
class c_page_setting extends ModuleAdminBase {
    var $layouts;
    var $upload_path;
    var $pagesDao;
    public function __construct()
	{
        parent::baseModule();
        $this -> layouts = new Layouts();
        $this -> upload_path = $this -> site_folder . '/upload/';
        $this -> pagesDao = new PagesDao();
    }
    
    // constructor
    function c_page_setting() {
        parent::baseModule();
        $this -> layouts = new Layouts();
        $this -> upload_path = $this -> site_folder . '/upload/';
        $this -> pagesDao = new PagesDao();
    }

    function main() {
        $q = strval(mosGetParam($_GET, 'r', ''));
        switch ($q) {
            case 'configPage' :
                return $this -> configPage();
                break;
            case 'configModule' :
                return $this -> configModule();
                break;
            case 'updateConfigModule' :
                return $this -> updateConfigModule();
                break;
            case 'updateStaticModule' :
                return $this -> updateStaticContentModule();
                break;
            case 'savePage' :
                return $this -> savePage();
                break;
            default :
                return $this -> configPage();
        }
    }

    /**
     * Get Position Array from XML configuration
     * @return array
     */
    function getPositionFromXmlFile() {
        $results = $this -> xml -> parse('../templates/' . $this -> website -> getDefaultTemplate() . '/template.configuration.xml', 'FILE');
        return $results;
    }

    /**
     *
     * @return
     * @param object $position_id
     * @param object $pages_id
     */
    function getLayouts($position_id, $pages_id) {
        $sqlQuery = 'SELECT id, positions_id, pages_id, modules_id';
        $sqlQuery .= ' FROM npt_layouts';
        $sqlQuery .= ' WHERE positions_id=' . $position_id . ' AND pages_id=' . $pages_id . ' ORDER BY modules_order';
        $recordSet = $this -> db -> Execute($sqlQuery);
        if (!$recordSet) {
            return false;
        }
        else {
            $page_setting_info = array();
            while (!$recordSet -> EOF) {
                $page_setting_info[] = array(
                    'id' => $recordSet -> fields['id'],
                    'positions_id' => $recordSet -> fields['positions_id'],
                    'modules_id' => $recordSet -> fields['modules_id']
                );
                $recordSet -> MoveNext();
            }
            return $page_setting_info;
        }
    }

    /**
     *
     * @return
     * @param object $page_id
     */
    function checkLayout($page_id) {
        $sqlQuery = 'SELECT id FROM npt_layouts WHERE pages_id="' . $page_id . '"';
        $recordSet = $this -> db -> Execute($sqlQuery);
        if ($recordSet -> RecordCount() < 1) {
            return false;
        }
        else {
            return true;
        }
    }

    /**
     *
     * @return
     * @param object $position_id
     * @param object $pages_id
     * @param object $modules_id
     */
    function getModuleOrder($position_id, $pages_id, $modules_id) {
        $sqlQuery = 'SELECT modules_order FROM npt_layouts';
        $sqlQuery .= ' WHERE modules_id=' . $modules_id . ' and pages_id =' . $pages_id . ' and positions_id=' . $position_id . '';
        //echo $sqlQuery;
        $recordSet = $this -> db -> Execute($sqlQuery);
        if ($recordSet -> RecordCount() < 1) {
            return false;
        }
        else {
            return $recordSet -> fields['modules_order'];
        }
    }

    /**
     *
     * @return
     * @param object $position_name
     */
    function getPositionId($position_name) {
        $sqlQuery = 'SELECT id FROM npt_positions';
        $sqlQuery .= ' WHERE name="' . $position_name . '"';
        $recordSet = $this -> db -> Execute($sqlQuery) or die("Load Postion ID Fail.");
        if ($recordSet -> RecordCount() < 1) {
            return false;
        }
        else {
            return $recordSet -> fields['id'];
        }
    }

    /**
     *
     * @return
     * @param object $page_id
     */
    function getHtmlFileToRepareXmlFile($page_id) {
        $sqlQuery = 'select html_file from npt_pages where id=' . $page_id . '';
        $recordSet = $this -> db -> Execute($sqlQuery);
        if (!$recordSet) {
            return false;
        }
        else {
            return fLeftToStringPattern($recordSet -> fields['html_file'], '.tpl');
        }
    }

    function deletePositions($page_id) {
        $sqlQuery = 'delete';
        $sqlQuery .= ' from npt_layouts';
        $sqlQuery .= ' where pages_id=' . $page_id . '';
        $recordSet = $this -> db -> Execute($sqlQuery);
        return $recordSet;
    }

    /**
     *
     * @return
     * @param object $data
     * @param object $page_id
     */
    function insertPositions($data, $page_id) {
        $recordSet = false;
        $strLayoutId = "";
        if ($data == null)
            $this -> db -> Execute("DELETE FROM npt_layouts where pages_id='" . $page_id . "' ");
        for ($i = 0; $i < count($data); $i++) {
            $info = (array)$data[$i];
            $pos_id = (isset($info['positions_id'])) ? $info['positions_id'] : '';
            $modstr = (isset($info['modules_id'])) ? $info['modules_id'] : '';
            $mod_order = (isset($info['modules_order'])) ? $info['modules_order'] : '';
            $modarr = array();
            $modarr = explode('@@', $modstr);
            $mod_id = $modarr[1];
            $layout_id = $modarr[0];
            if (!empty($layout_id)) {
                $strLayoutId .= $layout_id . ",";
                //Update
                $sqlQuery = "UPDATE npt_layouts SET positions_id='$pos_id', pages_id ='$page_id', modules_id='$mod_id', modules_order='$mod_order' WHERE id='$layout_id'";
                // if($i==2) die($sqlQuery);
                $recordSet = $this -> db -> Execute($sqlQuery);
            }
            else {
                //Insert new
                $sqlQuery = "insert into npt_layouts (positions_id, pages_id, modules_id, modules_order)";
                $sqlQuery .= " values ('$pos_id', '$page_id', '$mod_id','$mod_order')";
                $recordSet = $this -> db -> Execute($sqlQuery);
                $strLayoutId .= $this -> db -> Insert_ID() . ",";
            }
            unset($mod_order, $info, $sqlQuery);
        }//end for
        //Remove All layout at npt_laouts, npt_layouts_setting, npt_layouts_static_content
        $strLayoutIdfinal = substr($strLayoutId, 0, -1);
        $sqlQuery = "delete from npt_layouts";
        $sqlQuery .= " where pages_id='$page_id' and id not in ($strLayoutIdfinal)";

        $recordSet = $this -> db -> Execute($sqlQuery);

        //Sure layout id are not exist alone
        $sqlQuery = "delete from  npt_layouts_setting where layout_id not in (select id from npt_layouts)";
        $recordSet = $this -> db -> Execute($sqlQuery);

        $sqlQuery = "delete from  npt_layouts_static_content where layout_id not in (select id from npt_layouts)";
        $recordSet = $this -> db -> Execute($sqlQuery);
        unset($strLayoutId, $strLayoutIdfinal, $sqlQuery, $modarr);
        return $recordSet;
    }

    /**
     *
     * @return
     * @param object $id
     */
    function getModule($id) {
        $sqlQuery = 'select name from npt_modules where id="' . $id . '"';
        $recordSet = $this -> db -> Execute($sqlQuery);
        if ($recordSet -> RecordCount() < 1) {
            return false;
        }
        else {
            return $recordSet -> fields['name'];
        }
    }

    /**
     *
     * @return
     * @param object $layout_id
     * @param object $lang_id
     */
    function checkLayoutStaticExist($layout_id, $lang_id) {
        $sqlQuery = "select * from npt_layouts_static_content where language_id='$lang_id' and layout_id='$layout_id' ";
        $recordSet = $this -> db -> Execute($sqlQuery);
        if ($recordSet -> RecordCount() < 1) {
            return false;
        }
        else {
            return true;
        }
    }

    /**
     *
     * @return Array
     * @param object $layout_id
     * @param object $lang_id
     */
    function getLayoutStatic($layout_id, $lang_id) {
        $sqlQuery = "select title,image, content from npt_layouts_static_content where language_id='$lang_id' and layout_id='$layout_id' ";
        $static_content = $this -> db -> GetRow($sqlQuery);
        if ($static_content != NULL)
            $ret = array(
                $static_content['title'],
                $static_content['image'],
                $static_content['content']
            );
        else
            $ret = array(
                '',
                ''
            );
        return $ret;
    }

    /// ENDING USER DEFINE FUNCTION
    /**
     *
     * @return
     * @param object $data[optional]
     * @param object $page_id[optional]
     */
    function getModulesOfPage($page_id) {
        //Get all position name from XML configuration file
        $positions_info = $this -> getPositionFromXmlFile();
        $html_file = $this -> getHtmlFileToRepareXmlFile($page_id);
        //// DONG NAY CO THE SUA queeen thanh ten khac
        $positions_info = &$positions_info[$html_file];
        if (isset($positions_info['filename']) && file_exists('../templates/' . $this -> website -> getDefaultTemplate() . '/' . $positions_info['filename'])) {
            $tpl = new TemplatePower('../templates/' . $this -> website -> getDefaultTemplate() . '/' . $positions_info['filename']);
            // DONG NAY CO THE SUA queeen thanh ten khac
            $tpl -> prepare();
        }
        else {
            return $this -> LANGUAGE_TEXT["page_setting"]["MESSAGE_FOR_FILE_NOT_EXITS"] . "ABC";
        }
        for ($i = 0; $i < count($positions_info['positions']['name']); $i++) {
            $pos_id = $this -> getPositionId($positions_info['positions']['name'][$i]);
            if ($pos_id) {
                $page_setting_info = $this -> getLayouts($pos_id, $page_id);
                if ($page_setting_info) {
                    $content = '<div style="-moz-user-select: none;" unselectable="on" class="column ui-sortable" id="' . $pos_id . '">';
                    for ($z = 0; $z < count($page_setting_info); $z++) {
                        $module_order = $this -> getModuleOrder($pos_id, $page_id, $page_setting_info[$z]['modules_id']);
                        $modules = $this -> getModule($page_setting_info[$z]['modules_id']);
                        //Link config module
                        //						$content .= '<li id="'.$page_setting_info[$z]['id'].'@@'.$page_setting_info[$z]['modules_id'].'">'.$modules
                        //						." <a href=\"javascript:configModule(".$page_setting_info[$z]['id'].");\">Config</a></li>";
                        //$content .= '<div class="portlet module" id="' . $page_setting_info[$z]['id'] . '@@' . $page_setting_info[$z]['modules_id'] . '"><div class="portlet-header">' . $modules . '<a href="#" id="' . $page_setting_info[$z]['id'] . '" title="config this module" class="ui-icon ui-icon-wrench">Config</a></div></div>';

                        //$rel_static_content = 'href="#"';
                        $rel_static_content = 'href="?q=page_setting&r=configModule&layout_id='.$page_setting_info[$z]['id'].'" target="_blank"';
                        if($modules == "agent") {

                            $content .= '<div class="portlet module" id="' . $page_setting_info[$z]['id'] . '@@' . $page_setting_info[$z]['modules_id'] . '"><div class="portlet-header">' . $modules . '<br/><a ' . $rel_static_content . ' id="' . $page_setting_info[$z]['id'] . '" title="config this module" style="color:red;" onclick="return true;" class="ui-icon-wrench">Edit</a></div></div>';
                        } else {
                            $content .= '<div class="portlet module" id="' . $page_setting_info[$z]['id'] . '@@' . $page_setting_info[$z]['modules_id'] . '"><div class="portlet-header">' . $modules . '<a ' . $rel_static_content . ' id="' . $page_setting_info[$z]['id'] . '" title="config this module" class="ui-icon ui-icon-wrench">Config</a></div></div>';
                        }

                    }
                    $content .= '</div>';
                }
                else {//If this page is not assign module yet.
                    $content = '<div style="-moz-user-select: none;" unselectable="on" class="column ui-sortable" id="' . $pos_id . '"></div>';
                }
                //$content .= "<script>makeDrap();</script>";
                //Assign data
                $tpl -> assignGlobal($positions_info['positions']['name'][$i], $content);

            }
        }

        return $tpl -> getOutputContent();
    }

    /**
     * Get Modules List and assign {layouts_left}
     * @return String
     */
    function assignModulesToTpl($tpl) {
        $sqlQuery = "select id, `name`,`description` from npt_modules where active=1 order by name";
        $recordSet = $this -> db -> Execute($sqlQuery);
        if ($recordSet -> RecordCount() > 0) {
            while (!$recordSet -> EOF) {
                $tpl -> newBlock('modules_item');
                $tpl -> assign('id', $recordSet -> fields['id']);
                $tpl -> assign('name', $recordSet -> fields['name']);
                $tpl -> assign('description', $recordSet -> fields['description']);
                $recordSet -> MoveNext();
            }
        }
        else {
            $tpl -> newBlock('no_modules_item');
            $tpl -> assign('no_module_items_text', $this -> LANGUAGE_TEXT["page_setting"]["NO_MODULE_ITEMS_TEXT"]);
        }
        return $tpl -> getOutputContent();
    }

    /**
     *
     * @param object $message [optional]
     * @return
     */
    function configPage($message = "") {
        $tpl = $this -> getTemplatePath("page_setting", "page_setting");
        if ($message != '') {
            $tpl -> newBlock("messages");
            $tpl -> assign('message', $message);
        }

        $this -> assignModulesToTpl($tpl);
        $page_id = strval(mosGetParam($_GET, 'id', ''));
        $page_name = $this -> pagesDao -> getPageName($page_id);
        $tpl -> assignGlobal(Array(
            //"location" => "templates/" . $this -> website -> GetAdministratorDefaultTemplate(),
            "PAGE_NAME" => $page_name,
            "modules_of_page" => $this -> getModulesOfPage($page_id),
            "page_id" => $page_id
        ));

        return $tpl -> getOutputContent();
    }

    /**
     *
     * @return
     * @param object $module_id
     * @param object $paraModule_name
     */
    function checkModuleStyle($module_id, $paraModule_name) {
        $sqlQuery = "SELECT name FROM npt_modules where id='$module_id'";
        $Module_name = $this -> db -> GetOne($sqlQuery);
        if ($Module_name == $paraModule_name) {
            return true;
        }
        return false;
    }


    /**
     * Get Module Setting From XML
     * @return String: $results['description']
     * @return Array: $results['setting']['key']
     * @param object $moduleName
     */
    function getModuleSettingFromXmlFile($module_id) {
        global $absolute_path;
        $sqlQuery = "SELECT name FROM npt_modules where id='$module_id'";
        $Module_name = $this -> db -> GetOne($sqlQuery);
        if (!empty($Module_name)) {
            $xmlFile = $absolute_path . $this -> folder_modules . '/' . $Module_name . '/' . $Module_name . '.xml';
            $results = array();
            $results = $this -> xml -> parse($xmlFile, 'FILE');
            unset($xmlFile);
            return $results;
        }
        return null;
    }

    /**
     * Configuartion modules
     * @return
     * @param object $page_id
     * @param object $module_id
     */
    /**
     * Configuartion modules
     * @return
     * @param object $page_id
     * @param object $module_id
     */
    function configModule() {
        $layout_id = $_GET['layout_id'];
        $tpl = $this -> getTemplatePath("setting_module", "page_setting");
        //$tpl->assignGlobal("TITLE", $this->LANGUAGE_TEXT["page_setting"]["TITLE"]);
        //$tpl->assignGlobal("STATIC_CONTENT", $this->LANGUAGE_TEXT["page_setting"]["STATIC_CONTENT"]);
        //$tpl->assignGlobal("UPDATE", $this->LANGUAGE_TEXT["page_setting"]["UPDATE"]);
        //$tpl->assignGlobal("SAVE", $this->LANGUAGE_TEXT["page_setting"]["SAVE"]);
        $tpl->assignGlobal("CONFIG_PARA", $this->LANGUAGE_TEXT["page_setting"]["CONFIG_PARA"]);
        $tpl -> assignGlobal("UPDATE", "Save Changes");
        $tpl -> assignGlobal("folder_lib", $this -> site_folder . '/upload/');
        $tpl -> assignGlobal("site_folder", $this -> site_folder );
        $tpl -> assignGlobal("SAVE", "INSERT");
        //
        //		if($message !=''){
        //			$tpl->newBlock("messages");
        //			$tpl->assign('message', $message);
        //		}
        $arrLayout = array();
        $arrLayout = $this -> layouts -> getLayoutById($layout_id);
		//var_dump($arrLayout);
        $tpl -> assignGlobal(array("LAYOUT_ID" => $layout_id, ));
        $tpl -> assignGlobal("site_folder", $this -> site_folder);

        //Load Setting from Module Setting XML file
        $arrSetting = array();
        //die( $arrLayout['modules_id']);
        $arrXML = $this -> getModuleSettingFromXmlFile($arrLayout['modules_id']);

        if (is_array($arrXML)) {
            $description = $arrXML['description'];
            if (is_array($description)) {
                $descriptionstring = implode(" ", $description);
                $tpl -> newBlock("module_description");
                $tpl -> assign('MODULE_DESCRIPTION', $descriptionstring);
            }
            else
            if (!empty($description)) {
                $tpl -> newBlock("module_description");
                $tpl -> assign('MODULE_DESCRIPTION', $description);

            }
            //Get array setting for module
            $arrSetting = $arrXML['setting'];
            //TODO: IF setting have 1 setting => return array 1 dimensional, else return 2 dimensional
            //return "==>".count($arrXML['setting']);;
            //die(var_dump($arrXML));
            unset($arrXML);
        }

        //TODO: Define agent modules with contants
        if ($this -> checkModuleStyle($arrLayout['modules_id'], 'agent')) {
            $tpl -> assignGlobal("STATUS", 'display:none');
            $tpl -> assignGlobal("STATIC_STATUS", 'display:block');

            $tpl -> assignGlobal("action", '?q=page_setting&r=updateStaticModule');
            $sqlQuery = fMakeSqlQuery('SELECT `id`, `code`, `icon` from #__languages where `status`=1');
            $re = $this -> db -> Execute($sqlQuery);
            if ($re) {
                while (!$re -> EOF) {
                    $staticcontent = $this -> getLayoutStatic($layout_id, $re -> fields['id']);
                    $tpl -> newBlock('static_content_title');
                    $tpl -> assign('language_icon_url', $this -> admin_url . '/languages/' . $re -> fields['code'] . '/' . $re -> fields['icon']);
                    $tpl -> assign('static_content_title', $staticcontent[0]);
                    $tpl -> assign('language_code_sufix', $re -> fields['id']);
                    $tpl -> newBlock('static_content_image');
                    $tpl -> assign('language_icon_url', $this -> admin_url . '/languages/' . $re -> fields['code'] . '/' . $re -> fields['icon']);
                    $tpl -> assign('static_content_image', $staticcontent[1]);
                    $tpl -> assign('language_code_sufix', $re -> fields['id']);

                    $tpl -> newBlock('agent');
                    $tpl -> assign('language_icon_url', $this -> admin_url . '/languages/' . $re -> fields['code'] . '/' . $re -> fields['icon']);
                    //$tpl->assign('static_content_value', $staticcontent[1]);
                    $tpl -> assign('language_code_sufix', $re -> fields['id']);

                    //$oFCKeditor = new MyEditor('static_content_'.$re->fields['id']);
                    //$oFCKeditor->Value = $staticcontent[1];
                    //$tpl->assign("STATIC_VALUE", $oFCKeditor->getResource());
                    $static_module_name = 'static_content_' . $re -> fields['id'];
                    $myEditor = new CKEditor($static_module_name, $staticcontent[2]);
                    $tpl -> assign("CK_STATIC_VALUE", $myEditor -> getResource());

                    $re -> MoveNext();
                }
            }

        }
        else {//Load Screen for inputting setting key => vaule
            $tpl -> assignGlobal("STATUS", 'display:block');
            $tpl -> assignGlobal("STATIC_STATUS", 'display:none');
            $sqlQuery = fMakeSqlQuery("select * from #__layouts_setting where layout_id='$layout_id'");
            $strtest = "";
            $recordSet = $this -> db -> Execute($sqlQuery);
            global $ckfinder_path;
            $tpl -> assignGlobal("ckfinder_path", $ckfinder_path);
            $tpl -> assignGlobal("upload_path", $this -> site_folder . '/upload/');
            if ($recordSet -> RecordCount() > 0) {
                $index = 0;
                while (!$recordSet -> EOF) {
                    $tpl -> newBlock('modules_item');
                    $tpl -> assign('INDEX', $index);
                    $key_value = $recordSet -> fields['setting_key'];
                    $tpl -> assign('KEY_VALUE', $key_value);
                    $tpl -> assign('VALUE_VALUE', $recordSet -> fields['setting_value']);
                    $tpl -> assign('ID', $recordSet -> fields['id']);
                    $tpl -> assign("LAYOUT_ID", $recordSet -> fields['layout_id']);
                    $tpl -> assign('TYPE', $recordSet -> fields['setting_type']);
                    //Load Type for module setting
                    if ($recordSet -> fields['setting_type'] == "FILE") {
                        $tpl -> newBlock('type_browser_file');
                        $function = "BrowseImageFromServer('images:/','txtValue" . $index . "')";
                        $tpl -> assign('FUNCTION', $function);
                    }
                    else
                    if ($recordSet -> fields['setting_type'] == "DATA") { //SQL
                        $tpl -> newBlock('type_browser_file');
                        $function = "browse_data('txtValue" . $index . "','". $recordSet -> fields['setting_data']."')";
                        $tpl -> assign('FUNCTION', $function);
                    }
                    $index++;
                    $recordSet -> MoveNext();
                    
                }
            }
            else {
                //Because of COUNT function count element into array, If return array => more 2 setting
				//var_dump($arrSetting);
				if (is_array($arrSetting)) {
                    if (isset($arrSetting[0]) && is_array($arrSetting[0])){
                        for ($i = 0; $i < count($arrSetting); $i++) {
                            $tpl -> newBlock('modules_xml_item');
                            $tpl -> assign('INDEX', $i);
                            $tpl -> assign('KEY_VALUE', $arrSetting[$i]['key']);
                            $tpl -> assign('TYPE', $arrSetting[$i]['type']);
                          
                            
                            if ($arrSetting[$i]['type'] == "FILE") {
                                $tpl -> newBlock('type_xml_browser_file');
                                $function = "BrowseImageFromServer('files:/','txtValue" . $i . "')";
                                $tpl -> assign('FUNCTION', $function);
                            }

                            else
                            if ($arrSetting[$i]['type'] == "BANNER") {
                                $tpl -> newBlock('type_xml_browser_file');
                                $function = "browse_object('txtValue" . $i . "', 'banner_categories')";
                                $tpl -> assign('FUNCTION', $function);
                            }

                            else
                                if ($arrSetting[$i]['type'] == "DATA") { //SQL
                                  if($arrSetting[$i]['data'] != null) {
                                        $tpl -> assign('DATA', $arrSetting[$i]['data']);
                                    }
                                    $tpl -> newBlock('type_xml_browser_file');
                                    $function = "browse_data('txtValue" . $i . "','".$arrSetting[$i]['data']."')";
                                    $tpl -> assign('FUNCTION', $function);
                                }

                        }
                    } else {
                        //Have only 1 setting
                        //die(var_dump($arrSetting));
                        $tpl -> newBlock('modules_xml_item');
                        $tpl -> assign('INDEX', 0);
                        $tpl -> assign('KEY_VALUE', $arrSetting['key']);
                        $tpl -> assign('TYPE', $arrSetting['type']);
						if(isset($arrSetting['data'])) {
							$tpl -> assign('DATA', $arrSetting['data']);
						}
                        if ($arrSetting['type'] == "FILE") {
                            global $ckfinder_path;
                            $tpl -> newBlock('type_xml_browser_file');
                            $function = "BrowseImageFromServer('images:/','txtValue0')";
                            $tpl -> assign('FUNCTION', $function);
                        }
                        else if ($arrSetting['type'] == "DATA") { //SQL
                                $tpl -> newBlock('type_xml_browser_file');
                                $function = "browse_data('txtValue0', ".$arrSetting['data'].")";
                                $tpl -> assign('FUNCTION', $function);
                            }
                    }
                }
                else {
                    $tpl -> newBlock('no_modules_item');
                    $tpl -> assign('INDEX', 0);
                }
            }
        }
        unset($arrKeys);
        return $tpl -> getOutputContent();
    }

    /**
     * Insert Page Module Setting
     * @return Boolean
     * @param object $data Array with decoding from Json
     * @param object $page_id
     * @param object $module_id
     */
    function updatePageModuleSetting($strdata, $layout_id) {
        $recordSet = false;
        for ($i = 0; $i < count($strdata); $i++) {
            $info = (array)$strdata[$i];
            $id = (isset($info['id'])) ? $info['id'] : '';
            $key = (isset($info['key'])) ? $info['key'] : '';
            $value = (isset($info['value'])) ? $info['value'] : '';
            $type = (isset($info['type'])) ? $info['type'] : '';
            $data = (isset($info['data'])) ? $info['data'] : '';
            if (empty($id)) {
                $sqlQuery = "insert into npt_layouts_setting(layout_id,setting_key,setting_value, setting_type, setting_data) 
                values ('$layout_id', '$key','$value', '$type', '$data')";
            }
            else {
                $sqlQuery = "update npt_layouts_setting set setting_key='$key', setting_value='$value', setting_type='$type', setting_data='$data' where id='$id'";
            }
            
            $recordSet = $this -> db -> Execute($sqlQuery);
        }//end while
        return $recordSet;
    }

    /**
     *
     * @return
     * @param object $data[optional]
     * @param object $page_id
     * @param object $module_id
     */
    function updateConfigModule() {
        $data = $_POST['data'];
        $layout_id = $_POST['layout_id'];
        global $json;
        if ($data != '') {
            $output = (array)$json -> decode($this -> prepareString($data));
            $status = $this -> updatePageModuleSetting($output['items'], $layout_id);
            if ($status) {
                return "Setting modules successful!";
            }
            else {
                return "Update modules fail! Please try again.";
            }
        }
    }

    //	/**
    //	 * Delete Module's setting
    //	 * @return
    //	 * @param object $id
    //	 */
    //	function deleteConfigModule($id, $layout_id){
    //		if($id != ''){
    //			$sqlQuery = "delete from npt_layouts_setting where id='$id'";
    //			$recordSet = $this->db->Execute($sqlQuery);
    //			if($recordSet) {
    //				return $this->configModule($layout_id, "Xóa cấu hình modules thành công!");
    //			} else {
    //				return $this->configModule($layout_id, "Xóa cấu hình modules thất bại!");
    //			}
    //		}
    //	}
    /**
     * Update data for static content module
     * @return Config module Screen
     * @param object $content Static content will be inputted
     */
    function updateStaticContentModule() {
        $layout_id = $_REQUEST['layout_id'];
        $sqlQuery = fMakeSqlQuery('SELECT `id` from #__languages where `status`=1');
        $re = $this -> db -> Execute($sqlQuery);
        $ret = null;
        if ($re) {
            while (!$re -> EOF) {
                $lang_id = $re -> fields['id'];
                $title = addslashes($_POST['static_content_title_' . $lang_id]);
                $image = addslashes($_POST['static_content_image_' . $lang_id]);
                $content = addslashes($_POST['static_content_' . $lang_id]);
                if (!empty($content)) {
                    if ($this -> checkLayoutStaticExist($layout_id, $lang_id)) {
                        $sqlQuery = "update npt_layouts_static_content set title='$title',image='$image', content='$content' where language_id = '$lang_id' and layout_id='$layout_id'";
                    }
                    else {
                        $sqlQuery = "insert into npt_layouts_static_content(layout_id, title,image, content, language_id) values ('$layout_id', '$title', '$image','$content', '$lang_id')";
                    }
                    $ret = $this -> db -> Execute($sqlQuery);
                }
                $re -> MoveNext();
            }
        }
        if ($ret) {
            return "Update modules successful!";
        }
        else {
            return "Update modules fail! Please try again.";
        }

    }

    function savePage() {
        $in = (array) json_decode(stripcslashes($_REQUEST['items']));
        $page_id = $_REQUEST['page_id'];
        $this -> insertPositions($in, $page_id);
    }

}
?>
