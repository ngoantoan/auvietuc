<?php
ini_set('post_max_size', 500);
ini_set('upload_max_filesize', 500);
define('_VALID_MOS', 1 );
ini_set('display_errors', '1');
require_once __DIR__ . '/../bootstrap.php';
require_once("../configuration.php");
require_once("includes" . "/functions.php");

$members = $db->getArray("select * from member WHERE api_key =''");
$db->debug = true;
if($members && count($members) > 0) {
    foreach($members as $m) {
        $api_key = password_hash($m['password'] . time(), PASSWORD_DEFAULT);
        $db->Execute("update member set api_key = ? where id=?", array($api_key, (int)$m['id']));
    }
}

?>