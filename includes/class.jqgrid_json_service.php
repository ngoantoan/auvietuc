<?php
class jqgridJsonService {
    var $page; // Get the requested page. By default grid sets this to 1.
    var $limit; // get how many rows we want to have into the grid
    var $sidx; // get index row - i.e. user click to sort. At first time sortname parameter -
    // after that the index from colModel
    var $sord; // sorting order - at first time sortorder
    var $searchField;// search fields name
    var $searchString;// search key word
    var $searchOper; // search operator
    var $query; // query to get total records
    var $id; // id of category [options]
    var $db;
    
    /**
     *
     * @param object $page
     * @param object $limit
     * @param object $sidx
     * @param object $sord
     * @param object $query
     * @return
     */
    public function __construct($query) {
        $this->page = getRequest('page');
		if ($this->page == NULL) $this->page = 0;
        $this->limit = 10;
        if(getRequest('rows') > 0) {
            $this->limit = getRequest('rows');
        }
        $this->sidx = getRequest('sidx');
        $this->sord = getRequest('sord');
        $this->searchField = isset($_REQUEST['searchField']) ? $_REQUEST['searchField'] : "";
        $this->searchString = isset($_REQUEST['searchString']) ? $_REQUEST['searchString'] : "";
        $this->searchOper = isset($_REQUEST['searchOper']) ? $_REQUEST['searchOper'] : "";
        $this->query = $query;
        global $db;
        $this->db = $db;
    }

    public function jqgridJsonService($query) {
        $this->page = getRequest('page');
		if ($this->page == NULL) $this->page = 0;
        $this->limit = 10;
        if(getRequest('rows') > 0) {
            $this->limit = getRequest('rows');
        }
        $this->sidx = getRequest('sidx');
        $this->sord = getRequest('sord');
        $this->searchField = isset($_REQUEST['searchField']) ? $_REQUEST['searchField'] : "";
        $this->searchString = isset($_REQUEST['searchString']) ? $_REQUEST['searchString'] : "";
        $this->searchOper = isset($_REQUEST['searchOper']) ? $_REQUEST['searchOper'] : "";
        $this->query = $query;
        global $db;
        $this->db = $db;
    }
    
	/**
	 * 
	 * @return 
	 */
    private function countRecordSet() {
        if ($this->query == null || $this->query == "") {
            echo "Query is not init";
        }
        $rs = $this->db->Execute($this->query);
        if ($rs)
            return $rs->RecordCount();
        return 0;
    }
    
	/**
	 * 
	 * @param object $count
	 * @return 
	 */
    private function getTotalPage($count) {
        if ($count > 0 && $this->limit > 0)
            return ceil($count / $this->limit);
        else
            return 0;
    }
    
	/**
	 * 
	 * @return 
	 */
    private function buildSql($start) {
        return "SELECT * FROM ($this->query) as temp ".$this->buildSubSearchQuery()." ORDER BY `$this->sidx` $this->sord LIMIT $start , $this->limit";
    }
    
	/**
	 * 
	 * @return 
	 */
    private function buildSubSearchQuery() {
        if ($this->searchField == "" || $this->searchString == "" || $this->searchOper == "")
            return "";
        //['eq','ne','lt','le','gt','ge','bw','bn','in','ni','ew','en','cn','nc']
        //    	$qopers = array(
        //				  'eq'=>" = ",
        //				  'ne'=>" <> ",
        //				  'lt'=>" < ",
        //				  'le'=>" <= ",
        //				  'gt'=>" > ",
        //				  'ge'=>" >= ",
        //				  'bw'=>" LIKE ",
        //				  'bn'=>" NOT LIKE ",
        //				  'in'=>" IN ",
        //				  'ni'=>" NOT IN ",
        //				  'ew'=>" LIKE ",
        //				  'en'=>" NOT LIKE ",
        //				  'cn'=>" LIKE ",
        //				  'nc'=>" NOT LIKE "
        //				  );
        
        switch ($this->searchOper) {
            case 'cn':
                return " WHERE $this->searchField LIKE '%".$this->searchString."%' ";
                break;
        }
    }
	
	/**
	 * 
	 * @param object $pri_key [optional]
	 * @return 
	 */
    public function renderJson($pri_key = "id") {
        $count = $this->countRecordSet();
        $total_pages = $this->getTotalPage($count);
        if ($this->page > $total_pages) $this->page = $total_pages;
        if ($this->limit < 0) $this->limit = 0;
        $start = $this->limit * $this->page - $this->limit;
        if ($this->sidx == "") $this->sidx = $pri_key;
        if ($start < 0) $start = 0;
        $sql = $this->buildSql($start);
        $rs = $this->db->Execute($sql);
        $responce = new StdClass;
        $responce->page = $this->page;
        $responce->total = $total_pages;
        $responce->records = $count;
        $i = 0;
		if ($rs) {
			while (!$rs->EOF) {
	            $arr = array();
	            $responce->rows[$i]['id'] = $rs->fields[$pri_key];
	            foreach ($rs->fields as $key=>$value) {
	                $arr[] = $value;
	            }
	            $responce->rows[$i]['cell'] = $arr;
	            $rs->MoveNext();
	            $i++;
       		}
		}
        echo json_encode($responce);
    }
}

?>
