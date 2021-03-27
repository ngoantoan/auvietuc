<?php
/**
 * patSession_Storage_Native
 * 
 * Implements the Native-Driver for patSession. Native uses 
 * PHP-Session usually stored in $_SESSION
 * 
 * $Id: Native.php 46 2006-03-15 22:15:57Z gerd $
 *
 * @version	2.0.1
 * @package patSession
 * @subpackage Storage
 * 
 * @author gERD Schaufelberger <gerd@php-tools.net>
 * @copyright 2004 http://www.php-tools.net
 * @license LGPL
 */
 
/**
 * patSession_Storage_Native
 * 
 * Implements the Native-Driver for patSession. Native uses 
 * PHP-Session usually stored in $_SESSION
 * 
 * @package patSession
 * @subpackage Storage
 */
class patSession_Storage_Native extends patSession_Storage
{
   /**
    * session id 
    * @var  mixed $_sessId
    */
    protected   $_sessId    =   null;
    
   /**
    * session name
    * @var  mixed $_sessName
    */
    protected   $_sessName    =   null;
    
   /**
    * start session 
    * 
    * - start session (if not already running or if session needs restart)
    * - select storage container by id
	* - store id in attributes
	* - store name in attributes
	*
	* @return boolean $result true on success
	*/
    protected function _start()
    {
		//  start session if not startet
		if( $this->_state != 'restart' && !defined( 'SID' ) ) {
            session_name( $this->_sessName );

            if( !isset( $_GET[$this->_sessName] ) && !isset( $_COOKIE[$this->_sessName] ) ) {
                if( $this->_sessId ) {
                    $id =   $this->_idPrefix . $this->_sessId;
                }
                else {
                    $id =   $this->_createId();
                }
                session_id( $id );
            }
			session_start();
		}

		// init session-array		
		if( !isset( $_SESSION[$this->_id] ) ) {
			$_SESSION[$this->_id]	=	array();
		}
		$this->_sess	=&	$_SESSION[$this->_id];

        $this->_sessAttributes['id']	=   session_id();
        $this->_sessAttributes['name']	=   $this->_sessName;
        
        return true;
    }

   /**
    * suspend the session values
    * 
    * Make session values persistent
	*
	* @return boolean $result true on success
	*/
    protected function _suspend()
    {
		// PHP does the trick automatically
        return true;
    }

   /**
	* event handler to destroy a the session
	* 
	* @return boolean $result true on success
	*/ 
	private function _handleDestroy()
	{
		session_unset();
		session_destroy();
		return true;
	}
	
   /**
	* create a new session and copy variables from the old one
	*
	* @return boolean $result true on success
	* @todo think about storage of session values - what happens to $_SESSION
	*/
    protected function _handleFork()
    {
		// save values
		$values			=	$_SESSION;

		// keep session config		
		$trans	=	ini_get( 'session.use_trans_sid' );
		if( $trans ) {
			ini_set( 'session.use_trans_sid', 0 );
		}
		$cookie	=	session_get_cookie_params();

		// create new session id		
		$id	=	$this->_createId();
		
		// kill session
		session_destroy();
		
		// restore config		
		ini_set( 'session.use_trans_sid', $trans );
		session_set_cookie_params( $cookie['lifetime'], $cookie['path'], $cookie['domain'], $cookie['secure'] );
		
		// restart session with new id
		session_id( $id );
		session_start();

		// restore values
		$_SESSION        =	$values;
        $this->_sessAttributes['id']    =   $id;
		$this->_sess	=&	$_SESSION[$this->_id];
		
		return true;
    }

   /**
	* set additional session options
	*
	* @param array $options list of parameter
	* @return boolean $result true on success
	*/
    protected function _setOptions( &$options )
    {
		// set name
		if( isset( $options['name'] ) ) {
			$this->_sessName = $options['name'];
		}
        else {
            $this->_sessName = session_name();
        }

		// set id
		if( isset( $options['id'] ) ) {
			$this->_sessId = $options['id'];
		}
		
		return parent::_setOptions( $options );
    }
}
?>