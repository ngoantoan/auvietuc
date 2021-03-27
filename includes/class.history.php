<?php
require_once("class.cookies.php");
class HistoryLink{
  protected static $instance;
  private $arrHistory = array();//array($link => array($hinh,$price))
  const Prefix = ' ';
  private function HistoryLink(){
    $this->cookieClass = new cookieClass("HISTORY");
    $this->setup();
  }
  
  /**
   * connect db get info
   * auto wiring properties
   * @return 
   */
  private function setup(){
    $this->arrHistory = (array) json_decode(stripcslashes($this->cookieClass->ReadCookie("HISTORY")));
  }
  
  static function getInstance(){
    if (!isset(self::$instance)) {
       $c = __CLASS__;
            self::$instance = new $c;
    }
    return self::$instance;
  }
  
  public function addOrUpdate($id, $image){
    $arr=$this->get();
    $total = count($arr);
    if($total>12){
      $result = $arr;
      $i=0;
      foreach ($result as $key=>$value){
        if($i>12){
          $this->remove($key);
        }
        $i++;
      }
    }
    
    $arr_temp = array(self::Prefix.$id =>array($image));
    foreach ($this->arrHistory as $key=>$value){
      $arr_temp[$key] =  $value;
    }
    $this->arrHistory = $arr_temp;
    //var_dump($this->arrHistory);
    //$this->arrHistory[self::Prefix.$id] = array($image,$price,$name,$link);
    $this->updateCookie();
  }
   
  function remove($key){
      unset($this->arrHistory[$key]);
      $this->updateCookie();
  }

  function clear(){
    $this->arrHistory = array();
    $this->updateCookie();
  }
  
  function isEmpty(){
    if ($this->arrHistory == NULL) return true;
    return false;
  }
  
  function get(){
    return $this->arrHistory;
  }
  
  
  private function updateCookie(){
    $this->cookieClass->WriteCookie(array("HISTORY" =>json_encode($this->arrHistory)));
    $this->setup();
  }
}
?>