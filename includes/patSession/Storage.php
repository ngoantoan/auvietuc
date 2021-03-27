<?php
/**
 * patSession Storage driver
 * 
 * $Id: Storage.php 49 2006-09-05 21:00:01Z gerd $
 *
 * @version	2.2.0
 * @package patSession
 * @subpackage Storage
 * 
 * @author gERD Schaufelberger <gerd@php-tools.net>
 * @copyright 2004-2006 http://www.php-tools.net
 * @license LGPL
 */
 
/**
 * patSession Storage driver
 * 
 * Base class for all storage drivers. The base class implements some basic 
 * features used by any storage driver. Furthermore the security checks are 
 * implemented here.
 * 
 * The derived drivers must implement the methods marked as abstract.
 * The constructor acts as template function to start the session. 
 * Therefore the driver must implement the following functions:
 *
 * _start()
 *    start or restart session. Make storage container available. Set
 *    session attributes.
 *
 * _suspend()
 *    stop session, make storage container persistend.
 *
 * Usually the following function are required for functional drivers, too:
 * 
 * _handleDestroy()
 *     do all neccessary steps to required to destroy current session.
 *
 * _handleFork()
 *     
 *
 * _setOptions()
 *
 * @abstract
 * @package patSession
 * @subpackage Storage
 */
abstract class patSession_Storage implements ArrayAccess, Iterator
{
   /**
	* session variables
	* @var	mixed $_sess temporary storage container
	*/
	protected  $_sess  = null;
    
   /**
	* session attributes
	* @var	array $_sessAttributes 
	*/
	protected	$_sessAttributes	=	array();
	
   /**
	* id string
	* @var	mixed $_id
    * @see getContainerId()
	*/
	protected	$_id	=	null;
	
   /**
    * string added to session id
    * @var  mixed $_idPrefix
    */
    protected   $_idPrefix    =   null;
    
   /**
	* internal state
	* @access protected
	* @var	string $_state one of 'new'|'active'|'destroyed'
    * @see getState()
	*/
	protected	$_state	=	'new';
	
   /**
	* maximum age of unused session 
	* @access protected
	* @var	string $_expire minutes 
	*/
	protected	$_expire	=	null;
	
   /**
	* accept tokens send by
	* @access protected
	* @var	string $_tokenMode
	*/
	protected	$_tokenMode	=	'cookie';
	
   /**
	* security policy
	* Default values:
	*  - fix_ip
	*  - fix_browser
	*  - fix_referer
    *  - use_token
	* 
	* @var array $_security list of checks that will be done.
	*/
	protected $_security = array( 'fix_referer', 'fix_ip', 'fix_browser' );

   /**
	* list of allowed referers
	* @var	array $_allowedReferer 
	*/
	protected	$_allowedReferer	=	array();
	
   /**
	* allow empty referer 
	* @var	string $_emptyReferer 'deny' is default
	*/
	protected	$_emptyReferer	=	null;
	
   /**
	* patSession Security Token
	* @var	string $_tokenName 
	*/
	protected	$_tokenName	=	'patSessionToken';
	
   /**
	* disposable controll value for each request
	* @var	string $_
	*/
	protected	$_tokenValue	=	null;
	
   /**
    * position of iterator
    * @var  string $_iteratorPos
    * @see rewind()
    */
    private $_iteratorPos    =   null;
    
   /**
    * valid iterator keys
    * @var  string $_iteratorKeys
    * @see rewind()
    */
    private $_iteratorKeys    =   array();
    
   /**
	* Start the session
	* 
	* - pass the configuration options
    * - start session
	* - perform security checks
	* - increase session counter
	* 
	* @param string $id name-prefix used for internal storage of session-data
	* @param array $options additional session paramter and configuration values
	*/
	final public function __construct( $id = 'session', $options = array() )
	{
		$this->_id	=	$id;
		$this->_setOptions( $options );

        $this->_start();
		
		$this->_state	=	'active';
        $this->_initCounter();
        $this->_initTimer();
		
		// perform security checks
		if( !$this->_checkSecurity() ) {
			$this->_sess	=	array();
		}
    }
	
   /**
    * make sure to suspend session values on shutdown
	*/
    final public function __destruct()
    {
	    $this->_suspend();
    }

   /**
    * start session 
    * 
    * @return boolean $result true on success
    */
    abstract protected function _start();

   /**
    * suspend the session values
    * 
    * Make session values persistent
    *
    * @return boolean $result true on success
    */
    abstract protected function _suspend();

   /**
    * Easy-access wrapper
    *
    * @param string $property
    * @return mixed $value
    */
    final public function __get( $property )
    {
        switch( $property ) {
            case 'SID':
                return $this->getSID();
                break;
            case 'id':
                return $this->getId();
                break;
            case 'idPrefix':
                return $this->_idPrefix;
                break;
            case 'name':
                return $this->getName();
                break;
            case 'state':
                return $this->getState();
                break;
            case 'new':
                return $this->isNew();
                break;
            case 'counter':
                return $this->getCounter();
                break;
            case 'timer':
                return $this->getTimer();
                break;
        }

        return null;
    }

   /**
	* get current state of sessoin
	*
	* @return string $state named state
	*/
    final public function getState()
    {
		return $this->_state;
    }

   /**
	* recieve url-encoded string
	* The query string contains the session name and id
	* and can be used the same way as the constant SID
	*
	* @return string $querystring 
	*/
    final public function getSID()
    {
		$query	=	array( $this->getName() . '=' . $this->getId() );
		if( !empty( $this->_tokenValue ) ) {
			array_push( $query, $this->_tokenValue );
		}
	
		return implode( '&amp;', $query );
    }

   /**
    * recieve url-encoded string
    * The query string contains the session name and id
    * and can be used the same way as the constant SID
    *
    * @deprecated in favor of getSID()
    * @return string $querystring 
    * @see getSID()
    */
    final public function getQueryString()
    {
        return $this->getSID();
    }

   /**
	* recieve name of session container
	*
	* @return string $state named state
	*/
    final public function getContainerId()
    {
		return $this->_id;
    }

   /**
	* recieve name of this session
	*
	* @return string $name session name
	*/
    final public function getName()
    {
		return $this->_sessAttributes['name'];
    }

   /**
	* recieve id of this session
	*
	* @return string $id session id
	*/
    final public function getId()
    {
		if( $this->_state === 'destroyed' ) {
			patErrorManager::raiseNotice( 'patSession:' . patSession::ERROR_NOT_ACTIVE,
						'Session is destroyed - no session id available',
						'The session was destroyed before and the session id removed.'
					 );
			return null;
		}
		
		return $this->_sessAttributes['id'];
    }
	
   /**
	* save data into session
	* 
	* @param string $name name of variable
	* @param mixed $value any value to be stored into session
	* @return boolean $result true on success
	*/ 
	final public function	set( $name, $value )
	{
		if( $this->_state !== 'active' ) {
            $error = null;
//			$error =& patErrorManager::raiseError( 'patSession:' . patSession::ERROR_NOT_ACTIVE,
//						'Cannot set value because session not active.',
//						'Either the session was destroyed, has expired or locked by security'
//					 );
            return $error;
		}
		
		$this->_sess[$name]	=	$value;
		return true;
	}
	
   /**
	* get data from session
	* 
	* @param string $name name of variable
	* @return mixed $value the value from session or NULL if not set
	*/ 
	final public function	get( $name )
	{
		if( $this->_state !== 'active' ) {
		  $error = null;
            return $error;
		}
		
		if( isset( $this->_sess[$name] ) ) {
			return $this->_sess[$name];
		}
		
		return null;
	}

   /**
	* check wheter a session value exists
	* 
	* @param string $name name of variable
	* @return boolean $result true if the variable exists
	*/ 
	final public function	has( $name )
	{
		if( $this->_state !== 'active' ) {
				$error =& patErrorManager::raiseWarning( 'patSession:' . patSession::ERROR_NOT_ACTIVE,
						'Cannot recieve value because session not active.',
						'Either the session was destroyed, has expired or locked because of security reasons.'
					 );
                return $error;
		}
		
		return isset( $this->_sess[$name] );
	}

   /**
	* unset data from session
	* 
	* @param string $name name of variable
	* @return mixed $value the value from session or NULL if not set
	*/ 
	final public function	clear( $name )
	{
		if( $this->_state !== 'active' ) {
			patErrorManager::raiseNotice( 'patSession:' . patSession::ERROR_NOT_ACTIVE,
						'Session is not active - nothing to clear',
						'Either the session was destroyed, has expired or locked because of security reasons.'
					 );
			return null;
		}
		
		$value	=	null;
		if( isset( $this->_sess[$name] ) ) {
			$value	=	$this->_sess[$name];
			unset( $this->_sess[$name] );
		}
	
		return $value;
	}

   /**
	* unset session variables and destroy session
	* 
	* @return boolean $result true on success
	*/ 
	public function	destroy()
    {
        // session was already destroyed
		if( $this->_state === 'destroyed' ) {
            return true;
		}
	
        if( $this->_state !== 'active' ) {
            patErrorManager::raiseNotice( 'patSession:' .patSession::ERROR_NOT_ACTIVE,
                        'Session is not active.',
                        'The session was destroyed before.'
                     );
            return false;
        }
        
		// call event handler
		if( is_callable( array( $this, '_handleDestroy' ) ) ) {
			$this->_handleDestroy();
		}
	
		$this->_sess	=	null;
		$this->_state	=	'destroyed';
		return true;
	}
	
   /**
    * restart a destroyed or locked sessionb
	*
	* @return boolean $result true on success
	* @see destroy
	*/
    final public function restart()
    {
        $this->destroy();
        if( $this->_state !==  'destroyed' ) {
            patErrorManager::raiseWarning( 'patSession:' . patSession::ERROR_NOT_DESTROYED,
                        'Cannot restart session.',
                        'Failed to destroy session.'
                     );
            
            return false;
        }
        
        $this->_state   =   'restart';
		$this->_start();
		$this->_state	=	'active';
		
		// perform security checks
		if( !$this->_checkSecurity( true ) ) {
			$this->sess	=	array();
		}
		
        $this->_initCounter();
        return true;
    }
	
	
   /**
	* create a new session and copy variables from the old one
	*
	* @return boolean $result true on success
	*/
    final public function fork()
    {
		if( $this->_state !== 'active' ) {
			if( !$this->_checkSecurity( true ) ) {
				$error =& patErrorManager::raiseNotice( 'patSession:' . patSession::ERROR_NOT_ACTIVE,
						'Session is not active.',
						'Either the session was destroyed, has expired or locked because of security reasons: '. $this->_state.'.'
					 );
                return $error;
			}
		}
		
		// call event handler
		if( is_callable( array( $this, '_handleFork' ) ) ) {
			$this->_handleFork();
		}
	
		return true;
    }
	
   /**
    * get session usage counter
	*
	* @return int $counter
	*/
    final public function getCounter()
    {
	    if( $this->_state !== 'active' ) {
			return null;
		}
		
        return $this->get( 'patSession:counter' );
    }

   /**
    * check whether this session is currently created
	*
	* @return boolean $result true on success
	*/
    final public function isNew()
    {
	    $counter	=	$this->get( 'patSession:counter' );
		if( $counter === 1 ) {
			return true;
		}
        return false;
    }

   /**
    * initialize counter of session usage
	*
	* @return boolean $result true on success
	*/
    final protected function _initCounter()
    {
		$counter	=	$this->get( 'patSession:counter' );
		if( !$counter ) {
			$counter	=	0;
		}
		
		++$counter;
		$this->set( 'patSession:counter', $counter );
    	return true;
    }

   /**
    * get session timers
    * 
	* returns a list of available timers in seconds since 1. January 1970
    *
	* @return array $timer
	*/
    final public function getTimer()
    {
	    if( $this->_state !== 'active' ) {
			return array();
		}
		
        $timers	=	array();
        $timers['start']			=	$this->get( 'patSession:timer:start' );
        $timers['last']				=	$this->get( 'patSession:timer:last' );
        $timers['now']				=	$this->get( 'patSession:timer:now' );
        $timers['elapsed_start']	=	$timers['now'] - $timers['start'];
        $timers['elapsed_last']		=	$timers['now'] - $timers['last'];
        
        return $timers;
    }

   /**
    * initialize timers
	*
	* @return boolean $result true on success
	*/
    final private function _initTimer()
    {
    	if( !$this->has( 'patSession:timer:start' ) ) {
            $start	=	time();
            
        	$this->set( 'patSession:timer:start', $start );
        	$this->set( 'patSession:timer:last', $start );
        	$this->set( 'patSession:timer:now', $start );
        }
        
        $this->set( 'patSession:timer:last', $this->get( 'patSession:timer:now' ) );
        $this->set( 'patSession:timer:now', time() );
        
    	return true;
    }

   /**
	* do some checks for security reason
	* - timeout check (expire)
	* - ip-fixiation
	* - referer-fixiation
	* 
	* If one check failed, session data has to be cleaned.
	*
    * @param boolean $restart reactivate session
	* @return boolean $result true on success
	* @todo add network-mask feature for ip-check
	* @todo add allowed referer for session-transfers
	*/
	protected function _checkSecurity( $restart = false )
	{
		// allow to restsart a session
		if( $restart ) {
			$this->_state	=	'active';
			$this->set( 'patSession:atime', null );
			$this->set( 'patSession:clientAddr', null );
			$this->set( 'patSession:clientForwarded', null );
			$this->set( 'patSession:clientBrowser', null );
			$this->set( 'patSession:token', null );
		}
		
        if( !$this->_checkExpire() ) {
            return false;
        }
        
        if( !$this->_checkReferer() ) {
            return false;
        }
              
        if( !$this->_checkFixIp() ) {
            return false;
        }
        
        if( !$this->_checkFixBrowser() ) {
            return false;
        }
        
        if( !$this->_checkToken() ) {
            return false;
        }
        
		return true;
	}
    
   /**
    * fix session to client' user agent
    * 
    * User MUST NOT change user agent during session
    * 
    * @return true on success
    */
    protected function _checkFixBrowser()
    {
        // check for clients browser
        if( !in_array( 'fix_browser', $this->_security ) || !isset( $_SERVER['HTTP_USER_AGENT'] ) ) {
            return true;
        }
        
        $browser    =   $this->get( 'patSession:clientBrowser' );
        if( $browser === null ) {
            $this->set( 'patSession:clientBrowser', $_SERVER['HTTP_USER_AGENT'] );
            return true;
        }
        
        if( $_SERVER['HTTP_USER_AGENT'] !== $browser ) {
            $this->_state   =   'fix_browser_failed';
            return false;
        }
    
        return true;
    }
	
   /**
    * fix session to client's ip address
    * 
    * See whether fix_ip - feature is in use and check client's ip address. First check client's ip by
    * forwarded address from proxy. In a http-proxy is used, it should send "HTTP_X_FORWARDED_FOR" header
    * and tell the client's ip. We cannot check the proxy's ip, 'cause big providers use proxy pools. :-(
    * If there is no proxy, fix ip by "REMOTE_ADDR"
    *
    * @return true on success
    */
    protected function _checkFixIp()
    {
        // check not required or not possible
        if( !in_array( 'fix_ip', $this->_security ) || !isset( $_SERVER['REMOTE_ADDR'] ) ) {
            return true;
        }

        // some polite proxy server tell, for whom they forward the request for
        if( isset( $_SERVER['HTTP_X_FORWARDED_FOR'] ) ) {
            $forwarded  =   $this->get( 'patSession:clientForwarded' );
            
            if( $forwarded === null ) {
                $this->set( 'patSession:clientForwarded', $_SERVER['HTTP_X_FORWARDED_FOR'] );
                return true;
            }
            
            if( $_SERVER['HTTP_X_FORWARDED_FOR'] !== $forwarded ) {
                $this->_state   =   'fix_ip_failed';
                return false;
            }
            
            return true;
        }
        
        
        // not a proxy? Remote address must match!
        $ip =   $this->get( 'patSession:clientAddr' );
        if( $ip === null ) {
            $this->set( 'patSession:clientAddr', $_SERVER['REMOTE_ADDR'] );
            return true;
        }
        
        if( $_SERVER['REMOTE_ADDR'] !== $ip ) {
            $this->_state   =   'fix_ip_failed';
            return false;
        }
        return true;
    }
    
   /**
    * check whether referer stays in limit
    * 
    * @return true on success
    */
    protected function _checkReferer()
    {
        if( !in_array( 'fix_referer', $this->_security ) ) {
            return true;
        }
    
        // empty referer?
        if( !isset( $_SERVER['HTTP_REFERER'] ) ) {
        
            // allow empty referer?
            if( $this->_emptyReferer === 'allow' ) {
                return true;
            }
            
            $this->_state   =   'empty_referer';
            return false;
        }
        
        // host name
        preg_match( '|https?://(.*)/|U', $_SERVER['HTTP_REFERER'], $match );
        $ref    =   $match[1];
        
        // allow session to hop within this server or virtual host
        if( $ref === $_SERVER['SERVER_NAME'] ) {
            return true;
        }
        
        if( empty( $this->_allowedReferer ) ) {
            $this->_state   =   'referer_not_allowed';
            return false;
        }
        
        // check allowed referers
        foreach( $this->_allowedReferer as $allowed ) {
            if( preg_match( $allowed, $ref ) ) {
                return true;
            }
        }
            
        $this->_state   =   'referer_not_allowed';
        return false;
    }
    
   /**
    * expire inactive session 
    * 
    * A session will expire after a long time of no further request.
    * 
    * @return true on success
    */
    protected function _checkExpire()
    {
        $atime  =   $this->get( 'patSession:atime' );
        
        // check if session has expired
        if( $this->_expire && $atime ) {
            $minAtime   =   time() - 60 * $this->_expire;
            $atime      =   strtotime( $atime );
            
            // empty session variables
            if( $atime < $minAtime ) {
                $this->_state   =   'expired';
                return false;
            }
        }
        
        $this->set( 'patSession:atime', gmdate( 'Y-m-d H:i:s' ) );
        return true;
    }
    
   /**
    * fix session to client' user agent
    * 
    * User MUST NOT send single server token to continue session. Tokens increase security if 
    * cookies are used. Passwing tokens via GET parameter might be a big mess.
    * Hence cookies should be prefered, because they supports browser navigation like "reload", 
    * "back" and "forward"        
    * @return true on success
    */
    protected function _checkToken()
    {
        // check token!
        if( !in_array( 'use_token', $this->_security ) ) {
            return true;
        }
        
        // current token
        $token  =   $this->get( 'patSession:token' );
        
        // create token for next request
        $tokenNew  =   $this->_createId( 12 );
        $this->set( 'patSession:token', $tokenNew );
        
        // use get parameter to store session token
        if( $this->_tokenMode == 'any' || $this->_tokenMode == 'get' ) {
            $this->_tokenValue  =   $tokenNew;
        }

        // try to set a cookie          
        if( $this->_tokenMode == 'any' || $this->_tokenMode == 'cookie' ) {
            setcookie( $this->_tokenName, $tokenNew );
        }
            
        // check if token is valid! 
        if( $token === null ) {
            return true;
        }
                
        $match  =   false;
        
        // check token from cookie
        if( ( $this->_tokenMode == 'any' || $this->_tokenMode == 'cookie' ) && isset( $_COOKIE[$this->_tokenName] ) && $_COOKIE[$this->_tokenName] == $token ) {
            $match  =   true;
        }
            
        // check token send as get parameter
        if( ( $this->_tokenMode == 'any' || $this->_tokenMode == 'get' ) && isset( $_GET[$token] ) ) {
            $match  =   true;
        }
        
        if( $match ) {
            return true;
        }
        
        $this->_state   =   'token_mismatch';
        return false;
    }
    
   /**
	* create an id-string
	*
	* @param int $length lenght of string
	* @return string $id generated id
	*/
	protected function _createId( $length = 32 )
	{
        // create a new id
        $chars      = range( 0, 9 );
        $chars      = array_merge( $chars, range( 'a', 'z' ), range( 'A', 'Z' ) );
        $max        = count( $chars ) - 1;
        $id         = '';
        for( $i = 0; $i < $length; ++$i ) {
            $id .= $chars[ (rand( 0, $max )) ];
        }

        // add prefix
        if( !empty( $this->_idPrefix ) ) {
            $id =   $this->_idPrefix . $id;
        }
        
        return $id;		
	}
	
   /**
	* set additional session options
	*
	* @param array $options list of parameter
	* @return boolean $result true on success
	*/
    protected function _setOptions( &$options )
    {
        // set id-prefix
        if( isset( $options['id-prefix'] ) ) {
            $this->_idPrefix  =   $options['id-prefix'];
        }
        
		// set expire time
		if( isset( $options['expire'] ) ) {
			$this->_expire	=	$options['expire'];
		}
		
		// get security options
		if( isset( $options['security'] ) ) {
			$this->_security	=	explode( ',', $options['security'] );
		}
		
		// set token mode
		if( isset( $options['token-mode'] ) && in_array( $options['token-mode'], array( 'any', 'cookie', 'get' ) ) ) {
			$this->_tokenMode	=	$options['token-mode'];

            if( isset( $options['token-name'] ) ) {
                $this->_tokenName   =   $options['token-name'];
            }
		}
		
		// some referers are allowed
		if( isset( $options['allow-referer'] ) && !empty( $options['allow-referer'] ) ) {
			$referer	=	explode( ',', $options['allow-referer'] );
			foreach( $referer as $ref ) {
				$ref	=	strtr( $ref, array( '.' => '\.' ));
				$preg	=	$ref;
				
				if( $ref[0] === '*' ) {
					$ref	=	substr( $ref, 1 );
					$preg	=	'/'. $ref . '$/';
				}
				else if( $ref[ strlen( $ref ) - 1 ] === '*' ) {
					$ref	=	substr( $ref, 0, -1 );
					$preg	=	'/^'. $ref . '/';
				}
				
				array_push( $this->_allowedReferer, $preg ); 
			}
		}
		
		// allow empty referer
		if( isset( $options['empty-referer'] ) && $options['empty-referer'] === 'allow' ) {
			$this->_emptyReferer	=	'allow';
		}
		
		return true;
    }
    
   /**
    * debugging output
    *
    * @return string 
    */
    final public function __toString()
    {
        return print_r( $this->_sess, true );
    }
    
   /**
    * implement Iterator interface
    *
    * @return boolean $result true on success
    * @see Iterator::rewind()
    */
    final public function rewind()
    {
        $keys   = array_keys( $this->_sess );
        $unset  =   array();
        for( $i = 0; $i < count( $keys ); ++$i ) {
            if( strncmp( 'patSession:', $keys[$i], 11 ) == 0 ) {
                array_push( $unset, $i );
            }
        }
        foreach( $unset as $i ) {
            unset( $keys[$i] );
        }
        $this->_iteratorKeys    =   array_values( $keys );
        $this->_iteratorPos     =   0;
    }
    
   /**
    * implement Iterator interface
    *
    * @return boolean $result true on success
    * @see Iterator::valid()
    */
    final public function valid()
    {
        if( $this->_iteratorPos < count( $this->_iteratorKeys ) ) {
            return true;
        }
        return false;
    }
    
   /**
    * implement Iterator interface
    *
    * @return boolean $result true on success
    * @see Iterator::valid()
    */
    final public function key()
    {
        return $this->_iteratorKeys[$this->_iteratorPos];
    }
    
   /**
    * implement Iterator interface
    *
    * @return boolean $result true on success
    * @see Iterator::current()
    */
    final function current()
    {
        return $this->_sess[ $this->_iteratorKeys[$this->_iteratorPos] ];
    }
    
   /**
    * implement Iterator interface
    *
    * @return boolean $result true on success
    * @see Iterator::next()
    */
    final public function next()
    {
        ++$this->_iteratorPos;
    }
    
   /**
    * offsetExists
    * 
    * implement ArrayAccess interface
    *
    * @param mixed $offset 
    * @return boolean $result true on success
    * @see ArrayAccess::offsetExists()
    */
    final public function offsetExists( $offset )
    {
        return $this->has( $offset );
    }
    
   /**
    * offsetGet
    * 
    * implement ArrayAccess interface
    *
    * @param mixed $offset 
    * @return boolean $result true on success
    * @see ArrayAccess::offsetGet()
    */
    final public function offsetGet( $offset )
    {
        return $this->get( $offset );
    }
    
   /**
    * offsetSet
    * 
    * implement ArrayAccess interface
    *
    * @param mixed $offset 
    * @return boolean $result true on success
    * @see ArrayAccess::offsetSet()
    */
    final public function offsetSet( $offset, $value )
    {
        $this->set( $offset, $value );
    }
   
   /**
    * offsetUnset
    * 
    * implement ArrayAccess interface
    *
    * @param mixed $offset 
    * @return boolean $result true on success
    * @see ArrayAccess::offsetUnset()
    */
    final public function offsetUnset( $offset )
    {
        $this->clear( $offset );
    }
}
?>