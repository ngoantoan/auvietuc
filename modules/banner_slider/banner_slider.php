<?php
include_once ("modules/ModuleBase.php");
include_once("dao/BannerDao.php");
class banner_slider extends ModuleBase
{

    public function __construct()
    {
        parent::ModuleBase();
        $this->bannerDao = new BannerDao;
    }

    function banner_slider()
    {
        parent::ModuleBase();
		$this->bannerDao = new BannerDao;
    }
    /**
     * Override: Get banner content
     * @return String
     * @param object $lang
     */
    function getContent($language,$msg="")
    {
        $tpl = $this->getTemplatePath('banner_slider', 'banner_slider');
        $slider = $this->db->getArray("select * from slider where status = 1 order by sort asc");
        if($slider) {
            foreach($slider as $item) {
                $tpl->newBlock("SLIDER");
                $tpl->assign("title", $item['title']);
                $tpl->assign("description", $item['description']);
                $tpl->assign("image", $this->getPath(). $item['image']);
                $tpl->assign("link", $item['link']);
            }
        }
       return $tpl->getOutputContent();
    }
 
} //end class
?>
