<?php
include_once("modules/ModuleBase.php");
require_once("includes/class.pager.php");

class product extends ModuleBase
{
    public function __construct()
	{
		parent::ModuleBase();
    }
    
    function product()
    {
        parent::ModuleBase();
    }

    /**
     * Override: Get banner content
     * @return String
     * @param object $page_name
     */
    function getContent($page_name)
    {
        return $this->viewlist($page_name);

    }

    function viewlist($language)
    {
        global $maintpl;
        $code = "";
        $code = $this->routing->getFullAction();
        $code_product = "";
        $code_product = $this->routing->getFullParam1();

        // Hiển thị trang chi tiết sản phẩm
        if ($code_product != "") {
            $tpl = $this->getTemplatePath('product', 'product_detail');
            $product_detail = $this->db->getRow("SELECT * FROM products WHERE code=?", $code_product);
            $tpl->assign("cate", '<a href="' . $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_PRODUCTS, $language['id']),"") . '"> Products </a>');
            $title_category = $this->db->getRow('SELECT title, code FROM product_category WHERE id = ' . $product_detail['category_id']);
            if ($title_category) {
                $tpl->assign("cate1", ' > <a href="' . $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_PRODUCTS, $language['id']), $title_category['code']) . '">' . $title_category['title'] . '</a> > <span>' . $product_detail['title'] . '</span>');
            }

			if ($product_detail) {
                $tpl->assign("price", $product_detail['price']);
                $tpl->assign("title", $product_detail['title']);
                $tpl->assign("detail", $product_detail['detail']);
                
                $tpl->assign("image", $this->getPath() . $product_detail['image']);
                $maintpl->assignGlobal('website_name', $product_detail['title']);
				$maintpl->assignGlobal('site_description', $product_detail['title']);
				$maintpl->assignGlobal("IMAGE_LINK", $this->server_url. $this->getPath() . $product_detail['image']);
            }
            
            // image sản phẩm
            $image = $this->db->getArray("SELECT * FROM images WHERE product_id=? AND status=1", $product_detail['id']);
            if ($image) {
                for ($i = 0; $i < count($image); $i++) {
                    $tpl->newBlock("IMAGE-PRODUCT-SLIDER");
                    $tpl->assign("image", $this->getPath() . $image[$i]['path']);
                }
            }    

        } else if ($code != "") {
            $tpl = $this->getTemplatePath('product', 'product');
            $code_parent_category = $this->db->getRow("SELECT id, parent_id, title FROM product_category WHERE code = '$code'");
            $maintpl->assignGlobal('website_name', $code_parent_category['title']);
            $tpl->assign("cate", '<a href="' . $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_PRODUCTS, $language['id']),"") . '"> Products </a>');
            if ($code_parent_category["parent_id"] == NULL) {
                $tpl->assign("cate1", ' > <span>' . $code_parent_category['title'] . '</span>');
            } else {
                $code_category = $this->db->getRow("SELECT title, code FROM product_category WHERE id = ".$code_parent_category["parent_id"]);
                if ($code_category) {
                    $tpl->assign("cate1", ' > <a href="' . $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_PRODUCTS, $language['id']), $code_category['code']) . '">' . $code_category['title'] . '</a> > <span>' . $code_parent_category['title'] . '</span>');
                }
            }
            // hiển thị category
            $parent_category = $this->db->getArray("SELECT * FROM product_category WHERE parent_id IS NULL AND status = 1");
            if ($parent_category) {
                foreach ($parent_category as $item) {
                    $tpl -> newBlock("parent_category");
                    $tpl->assign("title", $item['title']);
                    $tpl->assign("link_parent_category", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_PRODUCTS, $language['id']), $item['code'], ""));
                    $category = $this->db->getArray("SELECT * FROM product_category WHERE parent_id = ".$item['id']." AND parent_id IS NOT NULL AND status = 1");
                    if ($category) {
                        foreach ($category as $c) {
                            $tpl -> newBlock("category");
                            $tpl->assign("title", $c['title']);
                            $tpl->assign("link_category", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_PRODUCTS, $language['id']), $c['code'], ""));
                        }
                    }
                }	
            }

            // hiển thị sản phẩm
            $limit = "12";
            if ($this->getSetting("LIMIT") != "" ) {
                $limit = $this->getSetting("LIMIT");
            }
            $pageNo = 1;
            if (getRequest("page") > 0) {
                $pageNo = getRequest("page");
            }
            $cate_code_lang = GetSpecialPageURL(Constants::PAGE_PRODUCTS, $language['id']);
            if ($code_parent_category["parent_id"] == NULL) {
                $code_category = $this->db->getArray("SELECT id FROM product_category WHERE parent_id = ".$code_parent_category["id"]);
                if ($code_category) {
                    $where = " AND category_id = ". $code_category[0]['id'];
                    for ($i = 1; $i < count($code_category); $i++) {
                        $where .= " OR category_id = ". $code_category[$i]['id'];
                    }
                }
                $pager = new Pager("SELECT * FROM products WHERE `status` = 1 $where", $limit);
            } else {
                $pager = new Pager("SELECT * FROM products WHERE `status` = 1 AND category_id = ". $code_parent_category["id"], $limit);
            }
            
            $rs = $pager->getPageArray($pageNo);
            if ($rs) {
                $tpl->newBlock('PAGING');
                $tpl->assign('paging', $pager->renderNavigateHtml($cate_code_lang . '/' . $code,""));
                foreach ($rs as $item) {
                    $tpl->newBlock("products");
                    $tpl->assign("title", $item["title"]);
                    $tpl->assign("image", $this->getPath() . $item["image"]);
                    $tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_PRODUCTS, $language['id']), $code, $item['code']));
                }
            }
        } else { // Hiển thị trang danh sách sản phẩm
            $tpl = $this->getTemplatePath('product', 'product');
            $maintpl->assignGlobal('website_name', 'Products');
            $tpl->assign("cate", '<a href="' . $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_PRODUCTS, $language['id']),"") . '"> Products </a>');
            // hiển thị category
            $parent_category = $this->db->getArray("SELECT * FROM product_category WHERE parent_id IS NULL AND status = 1");
            if ($parent_category) {
                foreach ($parent_category as $item) {
                    $tpl -> newBlock("parent_category");
                    $tpl->assign("title", $item['title']);
                    $tpl->assign("link_parent_category", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_PRODUCTS, $language['id']), $item['code'], ""));
                    $category = $this->db->getArray("SELECT * FROM product_category WHERE parent_id = ".$item['id']." AND parent_id IS NOT NULL AND status = 1");
                    if ($category) {
                        foreach ($category as $c) {
                            $tpl -> newBlock("category");
                            $tpl->assign("title", $c['title']);
                            $tpl->assign("link_category", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_PRODUCTS, $language['id']), $c['code'], ""));
                        }
                    }
                }	
            }

            // hiển thị sản phẩm
            $limit = "12";
            if ($this->getSetting("LIMIT") != "" ) {
                $limit = $this->getSetting("LIMIT");
            }
            $pageNo = 1;
            if (getRequest("page") > 0) {
                $pageNo = getRequest("page");
            }
            $tpl->assign("page_num", $limit*$pageNo);
            $tpl->assign("page_num_prev", $limit*($pageNo-1) + 1);
            $cate_code_lang = GetSpecialPageURL(Constants::PAGE_PRODUCTS, $language['id']);
            $pager = new Pager("SELECT * from products where `status` = 1", $limit);
            $rs = $pager->getPageArray($pageNo);
            if ($rs) {
                $tpl->newBlock('PAGING');
                $tpl->assign('paging', $pager->renderNavigateHtml($cate_code_lang,""));
                foreach ($rs as $item) {
                    $tpl->newBlock("products");
                    $tpl->assign("title", $item["title"]);
                    $tpl->assign("image", $this->getPath() . $item["image"]);
                    $category = $this->db->getRow('SELECT code FROM product_category WHERE id = '.$item["category_id"]);
                    $tpl->assign("link", $this->routing->GetLink(GetSpecialPageURL(Constants::PAGE_PRODUCTS, $language['id']), $category['code'], $item['code']));
                }
            }
        }
        return $tpl->getOutputContent();
    }

} //end class