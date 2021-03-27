<?php
/**
 * patSession_Storage_Null
 * 
 * Implements the Null-Driver for patSession. 
 * Null does not store any value at all, so this is a quite useless driver
 * 
 * $Id: Null.php 49 2006-09-05 21:00:01Z gerd $
 *
 * @version 2.0.0
 * @package patSession
 * @subpackage Storage
 * 
 * @author gERD Schaufelberger <gerd@php-tools.net>
 * @copyright 2004 http://www.php-tools.net
 * @license LGPL
 */
 
/**
 * patSession_Storage_Null
 * 
 * Implements the Null-Driver for patSession.
 * Null does not store any value at all, so this is a quite useless driver. 
 * It implements the features of starting and destroying a session. It also keeps track
 * of the session-state.
 * 
 * @package patSession
 * @subpackage Storage
 */
class patSession_Storage_Null extends patSession_Storage
{
   /**
	* Start the session
	* 
	* @return boolean $result true on success
	*/
	protected function	_start( )
	{
		// always start a new session
		$this->_sess	=	array();
		
		if( !isset( $this->_sessAttributes['id'] ) ) {
	        $this->_sessAttributes['id']	=   0;
		}
		
		if( !isset( $this->_sessAttributes['name'] ) ) {
	        $this->_sessAttributes['name']	=   'patSessiion_Null';
		}
		
		return true;
	}
	
   /**
    * suspend the session values
    * 
    * Do nothing! In other words, don't make session values persistent
	*
	* @return boolean $result true on success
	*/
    protected function _suspend()
    {
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
			$this->_sessAttributes['name']	=	$options['name'];
		}
		
		// set id
		if( isset( $options['id'] ) ) {
			$this->_sessAttributes['id']	=	$options['id'];
		}

        return parent::_setOptions( $options );
    }
}
?>