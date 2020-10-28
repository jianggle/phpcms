<?php
defined('IN_PHPCMS') or exit('Access Denied');
defined('INSTALL') or exit('Access Denied');
$parentid = $menu_db->insert(array('name'=>'special', 'parentid'=>'821', 'm'=>'special', 'c'=>'special', 'a'=>'init', 'data'=>'', 'listorder'=>0, 'display'=>'1'), true);

$menu_db->insert(array('name'=>'add_special', 'parentid'=>$parentid, 'm'=>'special', 'c'=>'special', 'a'=>'add', 'data'=>'', 'listorder'=>0, 'display'=>'1'));
$menu_db->insert(array('name'=>'edit_special', 'parentid'=>$parentid, 'm'=>'special', 'c'=>'special', 'a'=>'edit', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'special_list', 'parentid'=>$parentid, 'm'=>'special', 'c'=>'special', 'a'=>'init', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'special_elite', 'parentid'=>$parentid, 'm'=>'special', 'c'=>'special', 'a'=>'elite', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'delete_special', 'parentid'=>$parentid, 'm'=>'special', 'c'=>'special', 'a'=>'delete', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'special_listorder', 'parentid'=>$parentid, 'm'=>'special', 'c'=>'special', 'a'=>'listorder', 'data'=>'', 'listorder'=>0, 'display'=>'0'));

$o_mid = $menu_db->insert(array('name'=>'special_content_list', 'parentid'=>$parentid, 'm'=>'special', 'c'=>'content', 'a'=>'init', 'data'=>'', 'listorder'=>0, 'display'=>'0'), true);
$menu_db->insert(array('name'=>'special_content_add', 'parentid'=>$o_mid, 'm'=>'special', 'c'=>'content', 'a'=>'add', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'special_content_list', 'parentid'=>$o_mid, 'm'=>'special', 'c'=>'content', 'a'=>'init', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'special_content_edit', 'parentid'=>$o_mid, 'm'=>'special', 'c'=>'content', 'a'=>'edit', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'special_content_delete', 'parentid'=>$o_mid, 'm'=>'special', 'c'=>'content', 'a'=>'delete', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'special_content_listorder', 'parentid'=>$o_mid, 'm'=>'special', 'c'=>'content', 'a'=>'listorder', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'special_content_import', 'parentid'=>$o_mid, 'm'=>'special', 'c'=>'special', 'a'=>'import', 'data'=>'', 'listorder'=>0, 'display'=>'0'));

$menu_db->insert(array('name'=>'album_import', 'parentid'=>$parentid, 'm'=>'special', 'c'=>'album', 'a'=>'import', 'data'=>'', 'listorder'=>0, 'display'=>'1'));
$menu_db->insert(array('name'=>'creat_html', 'parentid'=>$parentid, 'm'=>'special', 'c'=>'special', 'a'=>'html', 'data'=>'', 'listorder'=>0, 'display'=>'1'));
$menu_db->insert(array('name'=>'create_special_list', 'parentid'=>$parentid, 'm'=>'special', 'c'=>'special', 'a'=>'create_special_list', 'data'=>'', 'listorder'=>0, 'display'=>'1'));

?>