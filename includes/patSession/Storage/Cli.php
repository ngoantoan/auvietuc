<?php
/**
 * patSession_Storage_Cli
 * 
 * Implements the Cli-Driver for patSession. 
 * 
 * $Id: Cli.php 46 2006-03-15 22:15:57Z gerd $
 *
 * @version	2.0.0
 * @package patSession
 * @subpackage Storage
 * 
 * @author gERD Schaufelberger <gerd@php-tools.net>
 * @copyright 2004 http://www.php-tools.net
 * @license LGPL
 */
 
/**
 * patSession_Storage_Cli
 * 
 * Implements the Cli-Driver for patSession.
 * 
 * The Cli-Driver gets handy, if you want to emulate sessions for PHP-CLI.
 * Of course, sessions in the scope of CLI-programmes are completely different 
 * than in HTTP. Nevertheless. You may still want to treat a session in the 
 * same way than in web-based scripts. That's where the storage driver CLI comes 
 * in.
 * 
 * Please note: 
 * - The session is always active 
 * - All security checks are switched off
 * - The values stored in this session will not survive multiple instances
 *   (the session ends when the programm ends). 
 *  
 * @package patSession
 * @subpackage Storage
 */
class patSession_Storage_Cli extends patSession_Storage
{
   /**
	* Start the session
	* 
	* @access private
    * @return bool $result true on success
	*/
	protected function	_start( )
	{
		// always start a new session
		$this->_sess	=	array();
		
		if( !isset( $this->_sessAttributes['id'] ) ) {
	        $this->_sessAttributes['id']	=   42;
		}
		
		if( !isset( $this->_sessAttributes['name'] ) ) {
	        $this->_sessAttributes['name']	=   'patSession_Cli';
		}
		
		// check whether the script runs as CLI processor
		if( !isset( $_SERVER['argv'] ) || empty(  $_SERVER['argv'] )  ) {
			patErrorManager::raiseWarning( 'patSession:Cli:1',
					'Storage driver "Cli" loaded!',
					'This script does not run in a CLI environment. Use another driver e.g. "Native".'
				 );
		}
		
		return true;
	}
	
   /**
    * suspend the session values
    * 
    * Do nothing! In other words, don't make session values persistent
	*
	* @access private
	* @return boolean $result true on success
	*/
    protected function _suspend() 
    {
        return true;
    }
	
   /**
	* set additional session options
	* 
	* @access private
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
			$this->_sessAttributes['id']		=	$options['id'];
		}

        return parent::_setOptions( $options );
    }
}
?>