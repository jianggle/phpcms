<?php
defined('IN_PHPCMS') or exit('Access Denied');
defined('INSTALL') or exit('Access Denied');
$parentid = $menu_db->insert(array('name'=>'collection_node', 'parentid'=>'821', 'm'=>'collection', 'c'=>'node', 'a'=>'manage', 'data'=>'', 'listorder'=>0, 'display'=>'1'), true);
$menu_db->insert(array('name'=>'node_add', 'parentid'=>$parentid, 'm'=>'collection', 'c'=>'node', 'a'=>'add', 'data'=>'', 'listorder'=>0, 'display'=>'1'));
$menu_db->insert(array('name'=>'collection_node_edit', 'parentid'=>$parentid, 'm'=>'collection', 'c'=>'node', 'a'=>'edit', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'collection_node_delete', 'parentid'=>$parentid, 'm'=>'collection', 'c'=>'node', 'a'=>'del', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'col_url_list', 'parentid'=>$parentid, 'm'=>'collection', 'c'=>'node', 'a'=>'col_url_list', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'collection_node_publish', 'parentid'=>$parentid, 'm'=>'collection', 'c'=>'node', 'a'=>'publist', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'collection_node_import', 'parentid'=>$parentid, 'm'=>'collection', 'c'=>'node', 'a'=>'node_import', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'collection_node_export', 'parentid'=>$parentid, 'm'=>'collection', 'c'=>'node', 'a'=>'export', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'collection_node_collection_content', 'parentid'=>$parentid, 'm'=>'collection', 'c'=>'node', 'a'=>'col_content', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'collection_content_import', 'parentid'=>$parentid, 'm'=>'collection', 'c'=>'node', 'a'=>'import', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'copy_node', 'parentid'=>$parentid, 'm'=>'collection', 'c'=>'node', 'a'=>'copy', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'content_del', 'parentid'=>$parentid, 'm'=>'collection', 'c'=>'node', 'a'=>'content_del', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'import_program_add', 'parentid'=>$parentid, 'm'=>'collection', 'c'=>'node', 'a'=>'import_program_add', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'import_program_del', 'parentid'=>$parentid, 'm'=>'collection', 'c'=>'node', 'a'=>'import_program_del', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'import_content', 'parentid'=>$parentid, 'm'=>'collection', 'c'=>'node', 'a'=>'import_content', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
?>