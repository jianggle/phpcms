<?php
defined('IN_PHPCMS') or exit('Access Denied');
defined('INSTALL') or exit('Access Denied');
$parentid = $menu_db->insert(array('name'=>'scan', 'parentid'=>'977', 'm'=>'scan', 'c'=>'index', 'a'=>'init', 'data'=>'', 'listorder'=>0, 'display'=>'1'), true);
$menu_db->insert(array('name'=>'scan_report', 'parentid'=>$parentid, 'm'=>'scan', 'c'=>'index', 'a'=>'scan_report', 'data'=>'', 'listorder'=>0, 'display'=>'1'));
$menu_db->insert(array('name'=>'md5_creat', 'parentid'=>$parentid, 'm'=>'scan', 'c'=>'index', 'a'=>'md5_creat', 'data'=>'', 'listorder'=>0, 'display'=>'1'));

?>