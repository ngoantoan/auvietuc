<?php
require_once("class.routing.php");
Class CustomerRole {
	static $instance;
	var $arr_role_page = array( //role   page_code
						Constants::ROLE_MEMBER =>array(Constants::PAGE_PUBLISHED_NEWS),
						Constants::ROLE_MEMBER_VIP =>array(Constants::PAGE_PUBLISHED_NEWS),
						Constants::ROLE_SHOP =>array(Constants::PAGE_ADD_PRODUCTS,Constants::PAGE_REGISTER),
						Constants::ROLE_SHOP_VIP =>array(Constants::PAGE_ADD_PRODUCTS,Constants::PAGE_REGISTER)
							   );
	function CustomerRole(){
		if (self::$instance != NULL) {
			self::$instance = new CustomerRole;	
		}
		return self::$instance;
	}
	
	/**
	 * 
	 * @return mixed
	 */
	function checkRole(){
		global $usess;
		if ($usess == NULL) die('SESSION TIME OUT!');//do something here
		$user = $usess->get('USER');
		if ($user == NULL) die('SESSION TIME OUT!');//do something here
		
		$routing = new Routing();
		$current_page_code = $routing->getPageCode();
		$role_id = $user['role_id'];
		//echo $role_id;
		if (!in_array($current_page_code, $this->arr_role_page[$role_id]) ){
			echo '<script>alert("Bạn không có đủ quyền vào khu vực này");</script>';
			echo '<script>window.location="/sanmuaban/trang-chu/vn_vi/view/1/1/1-trang-chu.html";</script>  ';
		}
		return TRUE;
	}
	
}
?>