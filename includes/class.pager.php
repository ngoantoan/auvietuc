<?php 
require_once("includes/class.routing.php");
Class Pager {
    private $sql;
	private $db;
	private $totalRecord;
	private $limit;
	private $currentPage = 1;
  
	function __construct($sql, $limit){
		global $db;
		$this->db = $db;
		$this->sql = $sql;
		$this->limit = $limit;
		$this->totalRecord = $this->db->GetOne("SELECT COUNT(*) FROM (".$this->sql.") as temp");
	}
  
  	function Pager($sql, $limit){
      global $db;
      $this->db = $db;
		  $this->sql = $sql;
		  $this->limit = $limit;
		  $this->totalRecord = $this->db->GetOne("SELECT COUNT(*) FROM (".$this->sql.") as temp");
    }

	function getTotalRecord(){
		return $this->totalRecord;
	}
	/**
	 * 
	 * @param object $count
	 * @return 
	 */
    function getTotalPage() {
        return ceil($this->totalRecord / $this->limit);		
    }
	
	function getPage($pageNo){
		if ($pageNo == 0 || $pageNo > $this->getTotalPage()) $pageNo = 1;
		$this->currentPage = $pageNo;
		$start =  $this->limit * $pageNo - $this->limit;
        if ($start < 0) $start = 0;
		$sql = "SELECT * FROM ($this->sql) as temp LIMIT $start , $this->limit";
		return $this->db->Execute($sql);
	}

    function getPageArray($pageNo){
        if ($pageNo == 0 || $pageNo > $this->getTotalPage()) $pageNo = 1;
        $this->currentPage = $pageNo;
        $start =  $this->limit * $pageNo - $this->limit;
        if ($start < 0) $start = 0;
         $sql = "SELECT * FROM ($this->sql) as temp LIMIT $start , $this->limit";
        return $this->db->GetArray($sql);
    }

	function getCurrentPage(){
		return $this->currentPage;
	}
	
	function renderNavigateHtmlKS($page_code,$lang_code, $action, $param ,$param2,  $seo_string ="", $query =""){
		$totalPage = $this->getTotalPage();
		$currentPage = $this->getCurrentPage();
		$routing = new Routing();

    $adjacent = intval($totalPage/4);
    $html = "<div class='phantrang'>";
    $link="";
    for( $i=1; $i<=$totalPage; $i++ ){
      if( $i == $this->currentPage ){
            $link .= "<label>". ($i) ."</label>";
      } else {

         if ($totalPage>10 && $currentPage<($adjacent*2)-3  && $i>($adjacent*2)-3 && $i<$totalPage-5){
            $i=($totalPage-3);
            $link .= "<label>...</label>";
          }
          if ($totalPage>10 && $currentPage>=($adjacent*2)-2  && $i<($adjacent*2)-3 && $i>3){
            $i=($adjacent*2)-3;
            $link .= "<label>...</label>";
          }
          if ($totalPage>10 && $currentPage>=($adjacent*3)-5 && $currentPage<($adjacent*3)  && $i<($adjacent*2)-2 && $i>2){
            $i=($adjacent*2)-2;
            $link .= "<label>...</label>";
          } 
          if ($totalPage>10 && $currentPage>=($adjacent)-3  && $currentPage<=($adjacent*2)-4 && $i>($adjacent*2)-2  && $i<$totalPage-2){
            $i=$this->getTotalPage()-3;
            $link .= "<label>...</label>";
          }             
        $link .= "<a href=\"". $routing->buildLink_3_para($page_code, $lang_code, $action, $param, $param2,$i,  $seo_string).$query."\">". ($i) ."</a>";
      }       
    }
    
    if ($currentPage != 1){
      $prev = "<a href=\"" . $routing->buildLink_3_para($page_code, $lang_code, $action,$param, $param2,($this->getCurrentPage() - 1),$seo_string).$query."\">". "<<" . "</a>";
      $link = $prev . $link;
    }
    if ($totalPage == 0){
      $link = $link;
    } else
       if ($currentPage != $totalPage){
      $next = "<a href=\"" . $routing->buildLink_3_para($page_code, $lang_code, $action,$param, $param2,($this->getCurrentPage() + 1), $seo_string).$query. "\">". ">>" ."</a>";
      $link = $link . $next;
    }

    return $html.$link.'</div>';
	}
  
  /**
   * @author: Huy Le                                                                              
   * @date: 19/11/2010                                                                                       
   * @param object $count
   * @return 
   */
  
  
  function renderNavigateHtml($page_code, $action, $key="") {
    $strkey = "";
    if($key != "") {
        $strkey = "&keyword=".$key;
    }
    $totalPage = $this->getTotalPage();
    $currentPage = $this->getCurrentPage();
    $routing = new Routing();
    $html = "<ul class='pagination'>";
    $link="";
    for( $i=1; $i<=$totalPage; $i++ ){
      if( $i == $this->currentPage ){
            $link .= "<li class='active'><a title='". ($i) ."' href=''>". ($i) ."</a></li>";
      } else {
       if($totalPage>=10){
            if($this->currentPage<=4 && $i<=4 ){
               $link .= "<li><a  href=\"". $routing->GetLink($page_code, $action, "", "")."?page=".$i."$strkey\">". ($i) ."</a></li>";
            }else if($this->currentPage>4 ||  $i>4 ){
              if( $i == 1 || $i==$totalPage || ($i >= $this->currentPage+1 && $i <= $this->currentPage+4 ) || ($i >= $this->currentPage-2 && $i <= $this->currentPage )){
                 $link .= "<li><a  href=\"". $routing->GetLink($page_code, $action, "", "")."?page=".$i."$strkey\">". ($i) ."</a></li>";
              }else if( $i == $this->currentPage-3 ) {
                 $link .= "<li>...</li>";
              }else if( $i == $this->currentPage+5 ) {
                 $link .= "<li>...</li>";
              }
            }
       }else{
            $link .= "<li><a  href=\"". $routing->GetLink($page_code, $action, "", "")."?page=".$i."$strkey\">". ($i) ."</a></li>";
       }
      }
    }
    if ($currentPage != 1){
      $prev = "<li><a href=\"" .  $routing->GetLink($page_code, $action, "", "")."?page=".($this->getCurrentPage() - 1)."$strkey\" class=\"w-page-first\">Prev</a></li>";
      $link = $prev . $link;
    }
    if ($totalPage == 0){
      $link = $link;
    } else
       if ($currentPage != $totalPage){
      $next = "<li><a  href=\"" .  $routing->GetLink($page_code, $action, "", "")."?page=".($this->getCurrentPage() + 1). "$strkey\" class=\"w-page-last\">Next</a></li>";
      $link = $link . $next;
    }

    return $html.$link.'</ul>';
  }
  
  function renderNavigateHtmlAjax2($url){
    $totalPage = $this->getTotalPage();
	$totalPage=5;
    $currentPage = $this->getCurrentPage();
    $adjacent = intval($totalPage/4);
    $html = "<div class='paging'><ul> ";
    $link="";
    for( $i=1; $i<=$totalPage; $i++ ){      
       if( $i == $this->currentPage ){
            $link .= "<li class='active'>". ($i) ."</li>";
      } else {        
       if($totalPage >= 10){
            if($this->currentPage<=4 && $i<=4 ){
               $link .= "<li><a class='pager-next active' url=\"". $url . "&page=" . ($i) . "\">". ($i) ."</a></li>";
            }else if($this->currentPage>4 ||  $i>4 ){
              if( $i == 1 || $i==$totalPage || ($i >= $this->currentPage+1 && $i <= $this->currentPage+4 ) || ($i >= $this->currentPage-2 && $i <= $this->currentPage )){
                 $link .= "<li><a class='pager-next active' url=\"". $url . "&page=" . ($i) . "\">". ($i) ."</a></li>";
              }else if( $i == $this->currentPage-3 ) {
                 $link .= "...";
              }else if( $i == $this->currentPage+5 ) {
                 $link .= "...";
              }              
            }
       }else{
            $link .= "<li><a class='pager-next active' url=\"". $url . "&page=" . ($i) . "\">". ($i) ."</a></li>";
       }
      }
    }         
    
    return $html.$link.'</ul></div>';    
  }

function renderNavigateHtmlAjax3($url){

    $totalPage = $this->getTotalPage();
    $currentPage = $this->getCurrentPage();
    $adjacent = intval($totalPage/4);
    $html = "<div class='paging'><ul class='page-numbers'> ";
    $link="";
     for( $i=1; $i<=$totalPage; $i++ ){      
       if( $i == $this->currentPage ){
            $link .= "<li class='page-numbers current'>". ($i) ."</li>";
      } else {        
       if($totalPage>=10){
            if($this->currentPage<=4 && $i<=4 ){
               $link .= "<li><a class='page-numbers' href=\"". $url . "&page=" . ($i) . "\">". ($i) ."</a></li>";
            }else if($this->currentPage>4 ||  $i>4 ){
              if( $i == 1 || $i==$totalPage || ($i >= $this->currentPage+1 && $i <= $this->currentPage+4 ) || ($i >= $this->currentPage-2 && $i <= $this->currentPage )){
                 $link .= "<li><a class='page-numbers' href=\"". $url . "&page=" . ($i) . "\">". ($i) ."</a></li>";
              }else if( $i == $this->currentPage-3 ) {
                       $link .= "<li><span>...</span></li>";
              }else if( $i == $this->currentPage+5 ) {
                       $link .= "<li><span>...</span></li>";
              }              
            }
       }else{
            $link .= "<li><a class='page-numbers' href=\"". $url . "&page=" . ($i) . "\">". ($i) ."</a></li>";
       }
      }
    }         
    if ($currentPage != 1){
      $prev = "<li><a class='page-numbers' href=\"" . $url . "&page=" . ($this->getCurrentPage() - 1) . "\">". "<<" . "</a></li>";
      $link = $prev . $link;
    }
    if ($totalPage == 0){
      $link = $link;
    } else
       if ($currentPage != $totalPage){
      $next = "<li><a class='page-numbers' href=\"" . $url . "&page=" . ($this->getCurrentPage() + 1) . "\">". ">>" ."</a></li>";
      $link = $link . $next;
    }
    return $html.$link.'</ul></div>';    
  }


function Paging($total, $current_page, $page_code, $lang, $action, $var1, $seo_string){
      if($current_page==0) {
        $current_page = 1;
      }
      $end  = $current_page+4;
      $start  = $current_page-4;
      $first  = 1;
      //Previous page
      $paging_string ="";
      $paging_link = "";
      if($current_page>1){
        $pagepr=$current_page-1;
        $paging_link = $this->routing->buildLink($page_code, $lang, $action, $var1, $pagepr, $seo_string);
        $paging_string .='<SPAN><A class="pagelink" title="Previous"  href="'.$paging_link.'"><<<</A></SPAN>';
      }else{
        $paging_string .=" <SPAN class='pages_disabled'><<<</SPAN>";
      }
      
      //Paging number
      if ($start<$first) {
       $start=$first;
      } else {
        if($start > $first){
          $paging_link = $this->routing->buildLink($page_code, $lang, $action, $var1, $first, $seo_string);
          $paging_string .='<SPAN><a  class="pagelink"  href="'.$paging_link.'">';
            $paging_string .= $first . '</a></SPAN>';
          if ($start>$first+1) $paging_string .='<SPAN >&nbsp;...&nbsp;</SPAN>';
        }
      }
      if ($end>$total) $end=$total;
      
      for ($i = $start; $i <= $end; $i ++) {
          if ($i == $current_page) {
          $paging_string .='<SPAN class="pages_current">' . $i . '</SPAN>';
          } else {
            $paging_link = $this->routing->buildLink($page_code, $lang, $action, $var1, $i, $seo_string);
          $paging_string .='<SPAN ><a class="pagelink"  href="'.$paging_link.'">';
          $paging_string .= $i . '</a></SPAN> ';      
          }
      }
      
      if($end < $total) {
        if ($end < $total-1) $paging_string .='<SPAN >&nbsp;...&nbsp;</SPAN>';
        $paging_link = $this->routing->buildLink($page_code, $lang, $action, $var1, $total, $seo_string);
        $paging_string .='<SPAN><a class="pagelink" href="'.$paging_link.'">'; 
        $paging_string .= $total . '</a></SPAN>';
      }
      
      //Next page
      if($current_page<$total){
        $pagepr=$current_page+1;
        $paging_link = $this->routing->buildLink($page_code, $lang, $action, $var1, $pagepr, $seo_string);
        $paging_string .='<SPAN ><a class="pagelink" href="'.$paging_link.'" title="Next">>>></a></SPAN>';
      }else{
        $paging_string .=" <SPAN class='pages_disabled'>>>></SPAN>";
      }
      $strStyle="<style>/*Paging Style*/
          .bluelink{  color:#444444;
          font-weight:bold; text-decoration:none;}
          .pagelink{border:1px solid #B7D8EE;font-weight:bold;
          cursor:pointer;
          display:inline;
          margin:0.25em;
          padding:0.3em 0.5em;
          text-align:center;}
          .pages_disabled { 
          border:1px solid #B7D8EE;
          display:inline;
          margin:0.25em;
          padding:0.3em 0.5em;
          text-align:center; COLOR: #c6d6e6; BACKGROUND-COLOR: #fafdfd;}
          .pages_current {
          background-color:#D2EAF6;
          border:1px solid #B7D8EE;
          cursor:pointer;
          display:inline;
          margin:0.25em;
          padding:0.3em 0.5em;
          text-align:center;
      }</style>";
    return $strStyle.$paging_string;
  }
  
}
?>