<?php
/**
 * NeoPortal
 * written by Nguyen Thanh Cong
 * cong.nguyen@bantayso.com
 * at Ban Tay So Co., Ltd.
 * 25/02/2009
 */
defined( '_VALID_MOS' ) or die( 'Restricted access' );
global $site_folder;
require_once("../configuration.php");
/**
* CKeditor
*/
class CKEditor
{
	private $name;
	private $value;
	private $ckeditor_path;
	private $col;
	private $rows;
	private $toolbar;
	
	/**
	 * Contructor
	 * @param object $name
	 * @param object $value
	 * @param object $ckeditor_path [optional]
	 * @param object $col [optional]
	 * @param object $rows [optional]
	 * @param object $toolbar [optional] Full or Basic
	 */
	public function __construct( $name, $value, $col = 80, $rows = 10, $toolbar="Full")
 	{
 		global $ckeditor_path;
		$this->name				= $name;
		$this->value			= stripslashes($value);
		$this->ckeditor_path	= $ckeditor_path;
		$this->col				= $col;
		$this->row				= $rows;
		$this->toolbar			= $toolbar;
	}
	/**
	 * gen html
	 * @return string html output
	 */
	public function getResource(){
		$str = '<textarea cols="'.$this->col.'" id="'.$this->name.'" name="'.$this->name.'" rows="'.$this->row.'">'. $this->value.'</textarea>';
		$str .= '<script type="text/javascript"> ';
		$str .= 'CKEDITOR.replace( \''.$this->name.'\', ';
		$str .= '	{ ';
		$str .= '		toolbar : \''.$this->toolbar.'\', ';
		$str .= '		filebrowserBrowseUrl : \''.$this->ckeditor_path.'filemanagement/ckfinder.html\', ';
		$str .= '		filebrowserImageBrowseUrl : \''.$this->ckeditor_path.'filemanagement/ckfinder.html?Type=images\', ';
		$str .= '		filebrowserFlashBrowseUrl : \''.$this->ckeditor_path.'filemanagement/ckfinder.html?Type=flash\', ';
		$str .= '		filebrowserUploadUrl : \''.$this->ckeditor_path.'filemanagement/core/connector/php/connector.php?command=QuickUpload&type=files\', ';
		$str .= '		filebrowserImageUploadUrl : \''.$this->ckeditor_path.'filemanagement/core/connector/php/connector.php?command=QuickUpload&type=images\', ';
		$str .= '		filebrowserFlashUploadUrl : \''.$this->ckeditor_path.'filemanagement/core/connector/php/connector.php?command=QuickUpload&type=flash\'';
		$str .= '	} );';
		$str .= '</script>';
		return 	$str;
	}
    public function getResourceAfterScript(){
    $str = '<textarea cols="'.$this->col.'" id="'.$this->name.'" name="'.$this->name.'" rows="'.$this->row.'">'. $this->value.'</textarea>';
    return 	$str;
}
	/**
	 * Set CKEditor path
	 * @param object $path
	 * @return 
	 */
	public function setCKEditorPath($path){
		$this->ckeditor_path	= $path;
	}
}
?>