<?php

// ensure this file is being included by a parent file
defined( '_VALID_MOS' ) or die( 'Restricted access' );
include_once("constants.php");
/**
* Utility function for retrieving some characters from the left of the string
* @param string The string to be process
* @param int How many characters will be retrieved, from the first character on the left
*/
function fLeft($string, $length) {
	return substr($string, 0, $length);
}
function endswith($Haystack, $Needle){
    // Recommended version, using strpos
    return (false !== ($i = strrpos($Haystack, $Needle)) && $i === strlen($Haystack) - strlen($Needle)); 
}
function getSubStrByEndsWith($Haystack, $Needle){
	$i = strrpos($Haystack, $Needle);
	return substr($Haystack, 0, $i);
}
/**
* Utility function for retrieving some characters from the right of the string
* @param string The string to be process
* @param int How many characters will be retrieved, from the first character on the right
*/
function fRight($string, $length) {
	return substr($string, strlen($string) - $length, $length);
}

function fLeftToStringPattern($string, $pattern) {
	return substr($string, 0, strpos($string, $pattern));
}

function fRightToStringPattern($string, $pattern) {
	$right_pattern_position = strpos($string, $pattern) + strlen($pattern);
	return substr($string, $right_pattern_position, strlen($string) - $right_pattern_position);
}

function fGetSelfUrl() { 
	$s = empty($_SERVER["HTTPS"]) ? '' : ($_SERVER["HTTPS"] == "on") ? "s" : ""; 
	$protocol = fLeftToStringPattern(strtolower($_SERVER["SERVER_PROTOCOL"]), "/") . $s; 
	$port = ($_SERVER["SERVER_PORT"] == "80") ? "" : (":" . $_SERVER["SERVER_PORT"]);
	return $protocol . "://" . $_SERVER['SERVER_NAME'] . $port . $_SERVER['REQUEST_URI']; 
}

function fUrlToArray($fullURL = false) {
	global $site_folder;	
	$site_folder1= substr($site_folder,0,strlen($site_folder));
	return explode("/",(($fullURL) ? fGetSelfUrl() : (($site_folder1)? str_replace("/" . $site_folder1 , "", $_SERVER['REQUEST_URI']) : fRight($_SERVER['REQUEST_URI'], strlen($_SERVER['REQUEST_URI']) - 1))));
}

/**
*
* Utility function for processing a string, see the following example:
* Ex: we have a string: Welcome %user_name to our %website_name
* We need to display that string with %user_name and %website_name to be replaced with
* the name of the user and our website name. We use like this:
* fReplaceStringWithString("Welcome %user_name to our %website_name", Array(
* 		"%user_name"		=> "Name of user",
*		"website_name"		=> "Our Website name"
* ));
*/
function fReplaceStringWithString($stringToBeReplaced, $stringArray) {
	$string = $stringToBeReplaced;
	foreach ($stringArray as $key => $value) {
		$string = str_replace($key, $value, $string);
	}
	return $string;
}

function fMakeSqlQuery($query) {
	global $database_table_prefix;		
	return str_replace("#__", $database_table_prefix, $query);
}


//class CCache {
//	/**
//	* @return object A function cache object
//	*/
//	function &getCache(  $group=''  ) {
//		global $absolute_path, $folder_includes, $cache_caching, $cache_cachepath, $cache_cachetime;
//
//		require_once( $absolute_path . '/' . $folder_includes . '/nportal.cache.php' );
//
//		$options = array(
//			'cacheDir' 		=> $cache_cachepath . '/',
//			'caching' 		=> $cache_caching,
//			'defaultGroup' 	=> $group,
//			'lifeTime' 		=> $cache_cachetime
//		);
//		$cache = new JCache_Lite_Function( $options );
//		return $cache;
//	}
//
//	/**
//	* Cleans the cache
//	*/
//	function cleanCache( $group=false ) {
//		global $cache_caching;
//		if ($cache_caching) {
//			$cache =& CCache::getCache( $group );
//			$cache->clean( $group );
//		}
//	}
//}


define( "_MOS_NOTRIM", 0x0001 );
define( "_MOS_ALLOWHTML", 0x0002 );
define( "_MOS_ALLOWRAW", 0x0004 );
/**
 * Filter data that get from parameter
 * @return object
 * @param object $arr $_POST/$_GET
 * @param object $name
 * @param object $def[optional]
 * @param object $mask[optional]
 */
function mosGetParam( &$arr, $name, $def=null, $mask=0 ) {
	static $noHtmlFilter 	= null;
	static $safeHtmlFilter 	= null;

	$return = null;
	if (isset( $arr[$name] )) {
		$return = $arr[$name];

		if (is_string( $return )) {
			// trim data
			if (!($mask&_MOS_NOTRIM)) {
				$return = trim( $return );
			}

			if ($mask&_MOS_ALLOWRAW) {
				// do nothing
			} else if ($mask&_MOS_ALLOWHTML) {
				// do nothing - compatibility mode
			} else {
				// send to inputfilter
				//if (is_null( $noHtmlFilter )) {
				//	$noHtmlFilter = new InputFilter( /* $tags, $attr, $tag_method, $attr_method, $xss_auto */ );
				//}
				//$return = $noHtmlFilter->process( $return );

				if (empty($return) && is_numeric($def)) {
				// if value is defined and default value is numeric set variable type to integer
					$return = intval($return);
				}
			}

			// account for magic quotes setting
			if (!get_magic_quotes_gpc()) {
				$return = addslashes( $return );
			}
			//check if this function exists
		    if( function_exists( "mysql_real_escape_string" ) ) {
		          $return =  $return ;
		    }
		    //for PHP version < 4.3.0 use addslashes
		    else  {
		        $return = addslashes( $return );
		    }
		}

		return $return;
	} else {
		return $def;
	}
}
/**
 * Get Parameter with method POST or GET(default)
 * @return object
 * @param object $paraName
 * @param object $Method[optional] constants::GET(default)/constants::POST
 */
function getParameter($paraName, $Method=constants::GET) {
	$return ="";
	if($Method==constants::POST) {
		$return = strval( mosGetParam( $_POST, $paraName, '' ) );
	} else {
		$return = strval( mosGetParam( $_GET, $paraName, '' ) );
	}
	return $return;
}

/**
 * 
 * @param object $paramName
 * @return $_REQUEST['$paramName']/NULL
 */
function getRequest($paramName){
	return isset($_REQUEST["$paramName"])?$_REQUEST["$paramName"]:NULL;	
}
/**
 * Strip slashes from strings or arrays of strings
 * @param mixed The input string or array
 * @return mixed String or array stripped of slashes
 */
function mosStripslashes( &$value ) {
	$ret = '';
	if (is_string( $value )) {
		$ret = stripslashes( $value );
	} else {
		if (is_array( $value )) {
			$ret = array();
			foreach ($value as $key => $val) {
				$ret[$key] = mosStripslashes( $val );
			}
		} else {
			$ret = $value;
		}
	}
	return $ret;
}

/**
* Random password generator
* @return password
*/
function mosMakePassword($length=8) {
	$salt 		= "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	$makepass	= '';
	mt_srand(10000000*(double)microtime());
	for ($i = 0; $i < $length; $i++)
		$makepass .= $salt[mt_rand(0,61)];
	return $makepass;
}

/**
 * Provides a secure hash based on a seed
 * @param string Seed string
 * @return string
 */
function mosHash( $seed ) {
	return md5( $GLOBALS['mosConfig_secret'] . md5( $seed ) );
}

/**
 * A simple helper function to salt and hash a clear-text password.
 *
 * @since	1.0.13
 * @param	string	$password	A plain-text password
 * @return	string	An md5 hashed password with salt
 */
function josHashPassword($password)
{
	// Salt and hash the password
	$salt	= mosMakePassword(16);
	$crypt	= md5($password.$salt);
	$hash	= $crypt.':'.$salt;

	return $hash;
}
/**
 * 
 * @return 
 * @param object $p_path
 * @param object $p_addtrailingslash[optional]
 */
function mosPathName($p_path,$p_addtrailingslash = true) {
	$retval = "";

	$isWin = (substr(PHP_OS, 0, 3) == 'WIN');

	if ($isWin)	{
		$retval = str_replace( '/', '\\', $p_path );
		if ($p_addtrailingslash) {
			if (substr( $retval, -1 ) != '\\') {
				$retval .= '\\';
			}
		}

		// Check if UNC path
		$unc = substr($retval,0,2) == '\\\\' ? 1 : 0;

		// Remove double \\
		$retval = str_replace( '\\\\', '\\', $retval );

		// If UNC path, we have to add one \ in front or everything breaks!
		if ( $unc == 1 ) {
			$retval = '\\'.$retval;
		}
	} else {
		$retval = str_replace( '\\', '/', $p_path );
		if ($p_addtrailingslash) {
			if (substr( $retval, -1 ) != '/') {
				$retval .= '/';
			}
		}

		// Check if UNC path
		$unc = substr($retval,0,2) == '//' ? 1 : 0;

		// Remove double //
		$retval = str_replace('//','/',$retval);

		// If UNC path, we have to add one / in front or everything breaks!
		if ( $unc == 1 ) {
			$retval = '/'.$retval;
		}
	}

	return $retval;
}
/**
 * 
 * @return 
 * @param object $path
 * @param object $filter[optional]
 * @param object $recurse[optional]
 * @param object $fullpath[optional]
 */
function mosReadDirectory( $path, $filter='.', $recurse=false, $fullpath=false  ) {
	$arr = array();
	if (!@is_dir( $path )) {
		return $arr;
	}
	$handle = opendir( $path );

	while ($file = readdir($handle)) {
		$dir = mosPathName( $path.'/'.$file, false );
		$isDir = is_dir( $dir );
		if (($file != ".") && ($file != "..")) {
			if (preg_match( "/$filter/", $file )) {
				if ($fullpath) {
					$arr[] = trim( mosPathName( $path.'/'.$file, false ) );
				} else {
					$arr[] = trim( $file );
				}
			}
			if ($recurse && $isDir) {
				$arr2 = mosReadDirectory( $dir, $filter, $recurse, $fullpath );
				$arr = array_merge( $arr, $arr2 );
			}
		}
	}
	closedir($handle);
	asort($arr);
	return $arr;
}
/**
 * 
 * @return 
 * @param object $special_page_code
 * @param object $lang
 */
function GetSpecialPageURL($special_page_code, $lang_id) {
	global $db;
	$sql = fMakeSqlQuery("select t1.pages_title from #__pages_attributes t1 INNER JOIN #__pages t2 ON t1.pages_id = t2.id WHERE t2.code='".$special_page_code."' AND t1.languages_id = ".$lang_id);
	 $page_title = $db->GetOne($sql);
	if ($page_title) {
		return $page_title;
	} else {
		//return GetSpecialPageURL("page_not_found", $lang_id); 
		die("Can not found this page with ".$special_page_code);
	}
}
function GetSpecialPageTitle($special_page_code, $lang_id) {
    global $db;
    $sql = fMakeSqlQuery("select t1.seo_title from #__pages_attributes t1 INNER JOIN #__pages t2 ON t1.pages_id = t2.id WHERE t2.code='".$special_page_code."' AND t1.languages_id = ".$lang_id);
    $page_title = $db->GetOne($sql);
    if ($page_title) {
        return $page_title;
    } else {
        //return GetSpecialPageURL("page_not_found", $lang_id);
        die("Can not found this page with ".$special_page_code);
    }
}
/**
 * Get the Current Page URL 
 * @return String URL
 */
function curPageURL() {
 $pageURL = 'http';
 //if ($_SERVER["HTTPS"] == "on") {$pageURL .= "s";}
 	$pageURL .= "://";
 if ($_SERVER["SERVER_PORT"] != "80") {
  $pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
 } else {
  $pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
 }
 return $pageURL;
}

function getDocumentRootPath(){
          /**
     * The absolute pathname of the currently executing script.
     * Notatka: If a script is executed with the CLI, as a relative path, such as file.php or ../file.php,
     * $_SERVER['SCRIPT_FILENAME'] will contain the relative path specified by the user.
     */
    if (isset($_SERVER['SCRIPT_FILENAME'])) {
        $sRealPath = dirname($_SERVER['SCRIPT_FILENAME']);
    }
    else {
        /**
         * realpath — Returns canonicalized absolute pathname
         */
        $sRealPath = realpath( './' ) ;
    }
	 /**
     * The filename of the currently executing script, relative to the document root.
     * For instance, $_SERVER['PHP_SELF'] in a script at the address http://example.com/test.php/foo.bar
     * would be /test.php/foo.bar.
     */
    $sSelfPath = dirname($_SERVER['PHP_SELF']);

    return substr($sRealPath, 0, strlen($sRealPath) - strlen($sSelfPath));
}
?>