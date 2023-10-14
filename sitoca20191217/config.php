<?php
// Hackes
define('URL', $_SERVER['HTTP_HOST'] . str_replace('/sitoca20191217', '', dirname($_SERVER['PHP_SELF']))."/");
define('BASE_DIR', str_replace(DIRECTORY_SEPARATOR,"/",str_replace(DIRECTORY_SEPARATOR . "sitoca20191217", "", realpath(dirname(__FILE__))))."/");
// Dynamic Protocol Settings
$protocol = "http://";
if($_SERVER["SERVER_PORT"] == 443){	$protocol = "https://";}
// HTTP Protocol
define('HTTP_SERVER', $protocol . URL. 'sitoca20191217/');
define('HTTPS_SERVER', $protocol . URL. 'sitoca20191217/');

// HTTP Protocol Catalog
define('HTTP_CATALOG', $protocol . URL);
define('HTTPS_CATALOG', $protocol . URL);

// Directory
define('DIR_APPLICATION', BASE_DIR. 'sitoca20191217/');
define('DIR_SYSTEM', BASE_DIR. 'system/');
define('DIR_IMAGE', BASE_DIR. 'image/');
define('DIR_LANGUAGE', BASE_DIR. 'sitoca20191217/language/');
define('DIR_TEMPLATE', BASE_DIR. 'sitoca20191217/view/template/');
define('DIR_CONFIG', BASE_DIR. 'system/config/');
define('DIR_CACHE', BASE_DIR. 'system/storage/cache/');
define('DIR_DOWNLOAD', BASE_DIR. 'system/storage/download/');
define('DIR_LOGS', BASE_DIR. 'system/storage/logs/');
define('DIR_MODIFICATION', BASE_DIR. 'system/storage/modification/');
define('DIR_UPLOAD', BASE_DIR. 'system/storage/upload/');
define('DIR_CATALOG', BASE_DIR. 'catalog/');
define('DIR_EXCEL', BASE_DIR. 'system/storage/excel/');
define('DIR_EXCEL_TPL', BASE_DIR. 'system/storage/excel/tpl/');
define('DIR_EXCEL_GEN', BASE_DIR. 'system/storage/excel/tpl/_generated/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
// define('DB_USERNAME', 'root');
// define('DB_PASSWORD', '');
// define('DB_DATABASE', 'sitoca');
define('DB_USERNAME', 'sitocasg_user');
define('DB_PASSWORD', '~U9;3|3teh');
define('DB_DATABASE', 'sitocasg_sitoca');
define('DB_PORT', '3306');
define('DB_PREFIX', 'j8f43oys2_clbmap5x_');

define('BANNER_EXTRA', true);
define('ADVANCE_PASSWORD', false);
define('ADMIN_FOLDER', 'sitoca20191217');
