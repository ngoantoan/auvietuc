<?php
include_once("modules/ModuleAdminBase.php");
/**
 * Browse Object List for selection
 */
class c_browse_object extends ModuleAdminBase {
	public function __construct()
	{
		parent::baseModule();
	}
	
	function c_browse_object(){
		parent::baseModule();
	}
	function main() {
        $q = strval(mosGetParam($_GET, 'r', ''));
        switch ($q) {
            case "data" :
                return $this->view_Data();
            default:
                return $this->view_Object();
        }
    }

	function view_Object(){
		$object = strval( mosGetParam( $_GET, 'object', '' ) );
		$fields = strval( mosGetParam( $_GET, 'fields', '' ) );
		$filter = strval( mosGetParam( $_GET, 'filter', '' ) );
		$where = strval( mosGetParam( $_GET, 'where', '' ) );		
		//die('view browser object for news');
		$tpl = $this->getTemplatePath("view");
		$tpl->assignGlobal('targetElement', strval( mosGetParam( $_GET, 'targetElement', '' ) ));
		
		if($object!=""){
			if($fields==null) $fields = "id,title";
			$column = explode(",", $fields);			
			$objectSql = "select ". $fields ." from ". $object .$filter ;
			if($object=='news_categories')
				$objectSql .= " WHERE parent_id IS NULL  ";						
			
			$rs = $this->db->Execute($objectSql);
			$i=1;
			if($rs){
				while(!$rs->EOF){
					$tpl->newBlock('items');
					($i % 2 != 0)? $tpl->assign('row_odd', 'alternate'):"";
					
					$tpl->assign('image_src', "templates/" . $this->website->GetAdministratorDefaultTemplate() . "/images/publish_x.png");
					
					$tpl->assign('OBJECT_ID', $rs->fields[$column[0]]);					
					$tpl->assign('OBJECT_NAME',"<b> >". $rs->fields[$column[1]]."<b>");
					
					$i++;
                    if($object=='news_categories'){
						
					   $rs2=$this->db->Execute("SELECT id,title FROM news_categories WHERE parent_id='".$rs->fields['id']."' ");
					while(!$rs2->EOF){
						$tpl->newBlock('items2');
					   $tpl->assign('OBJECT_ID2',$rs2->fields['id']);
					   $tpl->assign('OBJECT_NAME2',">>". $rs2->fields['title']);
					  $rs3=$this->db->Execute("SELECT id,title FROM news_categories WHERE parent_id='".$rs2->fields['id']."' ");
					while(!$rs3->EOF){
						$tpl->newBlock('items3');
					   $tpl->assign('OBJECT_ID3',$rs3->fields['id']);
					   $tpl->assign('OBJECT_NAME3',">>>". $rs3->fields['title']);
					$rs3->MoveNext();
					}if($rs3)$rs3->Close();
					$rs2->MoveNext();
					}if($rs2)$rs2->Close();
					
					}
					$rs->MoveNext();
				}
			}
		} else {
			$tpl->newBlock('no_items');
			$tpl->assign('NO_ITEM', "Bạn chưa chọn đối tượng cần hiển thị.");
		}
		return  $tpl->getOutputContent();
	}

    function view_Data(){
        $data = strval( mosGetParam( $_GET, 'data', '' ) );
        $tpl = $this->getTemplatePath("view");
        $tpl->assignGlobal('targetElement', strval( mosGetParam( $_GET, 'targetElement', '' ) ));
        if($data!=""){
            $rs = $this->db->Execute($data);
            $i=1;
            if($rs){
                while(!$rs->EOF){
                    $tpl->newBlock('items');
                    ($i % 2 != 0)? $tpl->assign('row_odd', 'alternate'):"";
                    $tpl->assign('image_src', "templates/" . $this->website->GetAdministratorDefaultTemplate() . "/images/publish_x.png");
                    $tpl->assign('OBJECT_ID', $rs->fields["id"]);                 
                    $tpl->assign('OBJECT_NAME',"<b> >". $rs->fields["title"]."<b>");
                    $i++;
                    $rs->MoveNext();
                }
            }
        } else {
            $tpl->newBlock('no_items');
            $tpl->assign('NO_ITEM', "Bạn chưa chọn đối tượng cần hiển thị.");
        }
        return  $tpl->getOutputContent();
    }
} //End class

?>