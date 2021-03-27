<?php

// ensure this file is being included by a parent file
defined( '_VALID_MOS' ) or die( 'Restricted access' );

/**
 * patSession 
 * 
 * $Id: patSession.php 53 2007-03-23 18:10:56Z gerd $
 *
 * @version	2.0.2
 * @package patSession
 * 
 * @author gERD Schaufelberger <gerd@php-tools.net>
 * @copyright 2004-2006 http://www.php-tools.net
 * @license LGPL
 */
 
/**
 * patSession allows easy access to session values
 * - usable in static or object mode
 * - support for singleton
 */
class patSession
{
   /**
    * error definition: session not active
    */                                 
    const ERROR_NOT_ACTIVE = 1;

   /**
    * error definition: could not load driver
    */                                 
    const ERROR_DRIVER_NOT_FOUND = 2;
    
    /**
    * error definition: session not destroyed
    */                                 
    const ERROR_NOT_DESTROYED = 3;

   /**
    * storage driver singleton
    * @var object
    */
    static private $_singleton = null;

   /**
    * storage drivers
    * @var array
    */
    static private $_factory = array();

   /**
    * custom driver dir
    * @var array
    */
    static private $_driverDir = array();

   /**
    * Custom driver dir to include your own classes
    * 
    * Set or add a folder as custom driver directory
    *
    * @static
    * @access public
    * @param string $dir of custom drivers
    * @param bool $add 
    * @return int current amount of custom directories 
    */
    static public function setDriverDir( $dir, $add = true )
    {
        if( !$add ) {
            self::$_driverDir   =   array();
        }
    
        self::$_driverDir[] =   $dir;
        return count( self::$_driverDir );
    }

   /**
    * Singleton
	* create a single instance of patSession driver
	*
	* @static
	* @access public
	* @param string $id name-prefix used for internal storage of session-data
	* @param string $storage named storage driver
	* @param array $options optional parameter passed to the storage driver
	* @return object $session patSession object
	*/
    static public function &singleton( $id = 'session', $storage = 'Native', $options = array() )
    {
        // check whether instance was already created
        if( self::$_singleton ) {
            return self::$_singleton;
        }
        
        // create driver
        $driver	=&	self::createDriver( $id, $storage, $options );
        //if( patErrorManager::isError( $driver ) ) {
        //    return $driver;
        //}
        
        // remember driver
        self::$_singleton =& $driver;
        
        return $driver;
    }

   /**
	* factory
	* Allows to create multiple instances of patSession
	* Each instance must differ in name of prefix, otherwise this function return a previously created object.
	*
	* @static
	* @access public
	* @param string $id name-prefix used for internal storage of session-data
	* @param string $storage named storage driver
	* @param array $options optional parameter passed to the storage driver
	* @return object $session patSession object
	*/
    static function &create( $id = 'session', $storage = 'Native', $options = array() )
    {
		// check whether instance was already created
		if( isset( self::$_factory[$storage . '_' . $id] ) ) {
			return self::$_factory[$storage . '_' . $id];
		}
		
		// create driver
		$driver	=	self::createDriver( $id, $storage, $options );
		//if( patErrorManager::isError( $driver ) ) {
		//	return $driver;
		//}
		
		// remember driver
		self::$_factory[$storage . '_' . $id]	=& $driver;
		
		return $driver;
    }

   /**
	* load driver and create a instance of it
	*
	* @static
	* @access private
	* @param string $id session-id
	* @param string $storage named storage-driver
	* @param array $options optional parameter passed to the storage driver
	* @return object $driver storage driver
	*/
    static function &createDriver( $id, $storage, &$options )
    {
		$driver	=	ucfirst(  $storage );
		$name	=	'patSession_Storage_' . $driver;
		
		$includePath	=	dirname( __FILE__ ) . '/patSession';
        
        // include base class
		if( !class_exists( 'patSession_Storage', false ) ) {
			require $includePath . '/Storage.php';
		}
		
        // storage driver already loaded      
        if( class_exists( $name, false ) ) {
            $driver = new $name( $id, $options );
            return $driver;        
        }
                
        // try to load storage driver
        $includeDirs    =   self::$_driverDir;
        $includeDirs[]  =   $includePath    .=  '/Storage';   
        
        foreach( $includeDirs as $dir ) {
        
            // locate include file
            if( file_exists( $dir . '/' . $driver . '.php' ) ) {
            
                // start driver
                include $dir . '/' . $driver . '.php';      
                $driver = new $name( $id, $options );
                return $driver;
            }            
        }
        
        // could not find class to include
        
        // collect other files
        $available  =   array();
        foreach( $includeDirs as $dir ) {
            $di =   new DirectoryIterator( $dir );
            foreach( $di as $file ) {
                if( $file->isDot() || !$file->isFile() ) {
                    continue;
                }
                
                $n  =   explode( '.', $file->getFilename() );
                // strange name
                if( count( $n ) < 2 ) {
                    continue;
                }
                    
                // require php-files
                $ext    =   array_pop( $n );
                if( $ext != 'php' ) {
                    continue;
                }
            
                array_push( $available, implode( '.', $n ) );
            }
        }
            
        // create error! 
        $error  =   //patErrorManager::raiseError( 'patSession:' . self::ERROR_DRIVER_NOT_FOUND,
                       // 'Storage driver not found!',
                        'Driver "'. $storage .'" not found - available drivers: "'. implode( '", "', $available ) .'"';
                        //);
        return $error;        		
    }
} 
?>