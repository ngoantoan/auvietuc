<?php
include_once ("modules/ModuleBase.php");
require_once ("includes/class.cookies.php");
require_once ("includes/class.pager.php");
class header extends ModuleBase {

    public function __construct()
	{
		parent::ModuleBase();
    }
    
	function header() {
		parent::ModuleBase();
	}

	function getContent($lang) {

		$action = $this->routing->action;
		if(getRequest("action") != NULL)
			$action = getRequest("action");
		switch ($action) {
			default :
				return $this -> display($lang);
				break;
		}
	}
	function display($language) {
		global $usess;
		$tpl = $this -> getTemplatePath('header', 'header');
		$tpl->assign("link_home", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_HOME, $language['id']),""));
		$tpl->assign("link_about_us", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_ABOUT, $language['id']),""));
		$tpl->assign("link_base_system", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_BASE_SYSTEM, $language['id']),""));
		$tpl->assign("link_education_program", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']),""));
		$tpl->assign("link_study_space", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_STUDY_SPACE, $language['id']),""));
		$tpl->assign("link_communicate_confidently", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_COMMUNICATE_CONFIDENTLY, $language['id']),""));
		$tpl->assign("link_student", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_STUDENT, $language['id']),""));

		$first_slider_audio_parent_categories = $this->db->getRow("select id, code from slider_audio_parent_categories order by created_at asc");
		if ($first_slider_audio_parent_categories) {
			$id_parent = $first_slider_audio_parent_categories['id'];
			$first_slider_audio_category = $this->db->getRow("select code from slider_audio_categories where parent_id = $id_parent order by created_at asc");
			if ($first_slider_audio_category) {
				$tpl->assign("link_slider_audio", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_SLIDER_AUDIO, $language['id']), $first_slider_audio_parent_categories['code'], $first_slider_audio_category['code']));
			} else {
				$tpl->assign("link_slider_audio", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_SLIDER_AUDIO, $language['id']), $first_slider_audio_parent_categories['code'], ""));
			}
		} else {
			$tpl->assign("link_slider_audio", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_SLIDER_AUDIO, $language['id']), "", ""));
		}

		$tpl->assign("link_study_abroad", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_STUDY_ABROAD, $language['id']),""));
		$tpl->assign("link_blog", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_BLOG, $language['id']),""));
		$tpl->assign("link_job", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_JOB, $language['id']),""));

		$page_name = $this->routing->getPageName();
		
		switch ($page_name) {
			case 'trang-chu':
				$tpl->assign("home", "active");
				break;
			case 'gioi-thieu-evas':
				$tpl->assign("gioi_thieu_evas", "active");
				break;
			case 'he-thong-co-so':
				$tpl->assign("gioi_thieu_evas", "active");
				break;
			case 'chuong-trinh-dao-tao':
				$tpl->assign("chuong_trinh_dao_tao", "active");
				break;
			case 'goc-hoc-tap':
				$tpl->assign("goc_hoc_tap", "active");
				break;
			case 'tu-tin-giao-tiep':
				$tpl->assign("tu_tin_giao_tiep", "active");
				break;
			case 'goc-hoc-vien':
				$tpl->assign("tu_tin_giao_tiep", "active");
				break;
			case 'tu-van-du-hoc':
				$tpl->assign("tu_van_du_hoc", "active");
				break;
			case 'tin-tuc':
				$tpl->assign("tin_tuc", "active");
				break;
			case 'tuyen-dung':
				$tpl->assign("tuyen_dung", "active");
				break;
			default:
				$tpl->assign("home", "active");
				break;
		}

		// kiểm tra đăng nhập
		$cus = $usess->get("LOGIN");
		if ($cus) {
			$tpl->newBlock("Logout");
			$tpl->assign("name", "Chào " . $cus['name']);
		} else {
			$tpl->newBlock("Login");
		}
		
		// chương trình đào tạo
		$education_program = $this->db->getArray("select * from education_program where status = 1");
		if ($education_program) {
			foreach ($education_program as $item) {
				$tpl->newBlock("education_program");
				$tpl->assign("title", mb_strtoupper($item['title'], 'UTF-8'));
				$tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_EDUCATION_PROGRAM, $language['id']), $item['code'], ""));
			}
		}
		return $tpl -> getOutputContent();
	}
}
?>