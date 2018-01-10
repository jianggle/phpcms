SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `phpcms_admin`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_admin`;
CREATE TABLE `phpcms_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_admin_panel`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_admin_panel`;
CREATE TABLE `phpcms_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_admin_role`;
CREATE TABLE `phpcms_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_admin_role_priv`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_admin_role_priv`;
CREATE TABLE `phpcms_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_attachment`;
CREATE TABLE `phpcms_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_attachment_index`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_attachment_index`;
CREATE TABLE `phpcms_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) TYPE=MyISAM;
-- ----------------------------
-- Table structure for `phpcms_badword`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_badword`;
CREATE TABLE `phpcms_badword` (
  `badid` smallint(5) unsigned NOT NULL auto_increment,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL default '1',
  `replaceword` char(20) NOT NULL default '0',
  `lastusetime` int(10) unsigned NOT NULL default '0',
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) TYPE=MyISAM ;

-- ----------------------------
-- Table structure for `phpcms_block`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_block`;
CREATE TABLE `phpcms_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_block_history`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_block_history`;
CREATE TABLE `phpcms_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_block_priv`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_block_priv`;
CREATE TABLE `phpcms_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_cache`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_cache`;
CREATE TABLE `phpcms_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY  (`filename`,`path`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_category`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_category`;
CREATE TABLE `phpcms_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) TYPE=MyISAM ;

-- ----------------------------
-- Table structure for `phpcms_category_priv`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_category_priv`;
CREATE TABLE `phpcms_category_priv` (
 `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) TYPE=MyISAM;

DROP TABLE IF EXISTS `phpcms_content_check`;
CREATE TABLE `phpcms_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_datacall`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_datacall`;
CREATE TABLE `phpcms_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_dbsource`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_dbsource`;
CREATE TABLE `phpcms_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL ,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_downservers`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_downservers`;
CREATE TABLE `phpcms_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_favorite`;
CREATE TABLE `phpcms_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_hits`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_hits`;
CREATE TABLE `phpcms_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_ipbanned`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_ipbanned`;
CREATE TABLE `phpcms_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL auto_increment,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ipbannedid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_keylink`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_keylink`;
CREATE TABLE `phpcms_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL auto_increment,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY  (`keylinkid`)
) TYPE=MyISAM;


-- ----------------------------
-- Table structure for `phpcms_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_keyword`;
CREATE TABLE IF NOT EXISTS `phpcms_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) TYPE=MyISAM;


-- ----------------------------
-- Table structure for `phpcms_keyword_data`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_keyword_data`;
CREATE TABLE IF NOT EXISTS `phpcms_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_linkage`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_linkage`;
CREATE TABLE `phpcms_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL default '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL default '0',
  `listorder` smallint(5) unsigned NOT NULL default '0',
  `description` varchar(255) default NULL,
  `setting` varchar(255) default NULL,
  `siteid` smallint(5) NOT NULL default '0',
  PRIMARY KEY  (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_log`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_log`;
CREATE TABLE `phpcms_log` (
  `logid` int(10) unsigned NOT NULL auto_increment,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL default '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_member`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member`;
CREATE TABLE `phpcms_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) TYPE=MyISAM;



-- ----------------------------
-- Table structure for `phpcms_member_detail`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_detail`;
CREATE TABLE `phpcms_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_member_group`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_group`;
CREATE TABLE `phpcms_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL auto_increment,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL default '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL default '0',
  `allowvisit` tinyint(1) unsigned NOT NULL default '0',
  `allowpost` tinyint(1) unsigned NOT NULL default '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL default '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL default '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL default '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL default '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL default '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL default '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL default '0',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) TYPE=MyISAM;


-- ----------------------------
-- Table structure for `phpcms_member_verify`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_verify`;
CREATE TABLE `phpcms_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL auto_increment,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL default '0',
  `point` smallint(5) unsigned NOT NULL default '0',
  `amount` decimal(8,2) unsigned NOT NULL default '0.00',
  `modelinfo` char(255) NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) default NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY  (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_member_menu`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_menu`;
CREATE TABLE `phpcms_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_member_vip`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_vip`;
CREATE TABLE `phpcms_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_menu`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_menu`;
CREATE TABLE `phpcms_menu` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `name` char(40) NOT NULL default '',
  `parentid` smallint(6) NOT NULL default '0',
  `m` char(20) NOT NULL default '',
  `c` char(20) NOT NULL default '',
  `a` char(20) NOT NULL default '',
  `data` char(100) NOT NULL default '',
  `listorder` smallint(6) unsigned NOT NULL default '0',
  `display` enum('1','0') NOT NULL default '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY  (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) TYPE=MyISAM;

--
-- 表的结构 `phpcms_model`
--

DROP TABLE IF EXISTS `phpcms_model`;
CREATE TABLE IF NOT EXISTS `phpcms_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL ,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' ,
  `items` smallint(5) unsigned NOT NULL DEFAULT '0' ,
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL ,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL ,
  `member_list_template` varchar(30) NOT NULL ,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) TYPE=MyISAM;

DROP TABLE IF EXISTS `phpcms_model_field`;
CREATE TABLE IF NOT EXISTS `phpcms_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_module`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_module`;
CREATE TABLE `phpcms_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL default '0',
  `version` varchar(50) NOT NULL default '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  `installdate` date NOT NULL default '0000-00-00',
  `updatedate` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`module`)
) TYPE=MyISAM;



-- ----------------------------
-- Table structure for `phpcms_page`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_page`;
CREATE TABLE `phpcms_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_pay_account`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_pay_account`;
CREATE TABLE `phpcms_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_pay_payment`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_pay_payment`;
CREATE TABLE `phpcms_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) default NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL default '0',
  `is_online` tinyint(1) unsigned NOT NULL default '0',
  `pay_order` tinyint(3) unsigned NOT NULL default '0',
  `enabled` tinyint(1) unsigned NOT NULL default '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY  (`pay_id`),
  KEY `pay_code` (`pay_code`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_pay_spend`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_pay_spend`;
CREATE TABLE `phpcms_pay_spend` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creat_at` int(10) unsigned NOT NULL default '0',
  `userid` int(10) unsigned NOT NULL default '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL default '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL default '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_position`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_position`;
CREATE TABLE `phpcms_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) TYPE=MyISAM;


-- ----------------------------
-- Table structure for `phpcms_position_data`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_position_data`;
CREATE TABLE `phpcms_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) TYPE=MyISAM;


-- ----------------------------
-- Table structure for `phpcms_queue`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_queue`;
CREATE TABLE `phpcms_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_release_point`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_release_point`;
CREATE TABLE `phpcms_release_point` (
  `id` mediumint(8) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `host` varchar(100) default NULL,
  `username` varchar(50) default NULL,
  `password` varchar(50) default NULL,
  `port` varchar(10) default '21',
  `pasv` tinyint(1) default '0',
  `ssl` tinyint(1) default '0',
  `path` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_search`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_search`;
CREATE TABLE `phpcms_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_search_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_search_keyword`;
CREATE TABLE `phpcms_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_session`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_session`;
CREATE TABLE `phpcms_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL default '0',
  `roleid` tinyint(3) unsigned default '0',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY  (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) TYPE=MEMORY;

-- ----------------------------
-- Table structure for `phpcms_site`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_site`;
CREATE TABLE `phpcms_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `tel` varchar(100) DEFAULT '',
  `phone` varchar(100) DEFAULT '',
  `fax` varchar(100) DEFAULT '',
  `address` varchar(100) DEFAULT '',
  `weibo` varchar(100) DEFAULT '',
  `wechat` varchar(100) DEFAULT '',
  `qq` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `icp` varchar(100) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_sphinx_counter`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_sphinx_counter`;
CREATE TABLE `phpcms_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`counter_id`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_template_bak`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_template_bak`;
CREATE TABLE `phpcms_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) TYPE=MyISAM;



-- ----------------------------
-- Table structure for `phpcms_times`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_times`;
CREATE TABLE `phpcms_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL default '0',
  `isadmin` tinyint(1) NOT NULL default '0',
  `times` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`username`,`isadmin`)
) TYPE=MEMORY;

-- ----------------------------
-- Table structure for `phpcms_type`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_type`;
CREATE TABLE `phpcms_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_urlrule`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_urlrule`;
CREATE TABLE `phpcms_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL auto_increment,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL default '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY  (`urlruleid`)
) TYPE=MyISAM;

-- ----------------------------
-- Table structure for `phpcms_workflow`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_workflow`;
CREATE TABLE `phpcms_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) TYPE=MyISAM;

INSERT INTO `phpcms_workflow` (`workflowid`, `siteid`, `steps`, `workname`, `description`, `setting`) VALUES(1, 1, 1, '一级审核', '审核一次', '');
INSERT INTO `phpcms_workflow` (`workflowid`, `siteid`, `steps`, `workname`, `description`, `setting`) VALUES(2, 1, 2, '二级审核', '审核两次', '');
INSERT INTO `phpcms_workflow` (`workflowid`, `siteid`, `steps`, `workname`, `description`, `setting`) VALUES(3, 1, 3, '三级审核', '审核三次', '');
INSERT INTO `phpcms_workflow` (`workflowid`, `siteid`, `steps`, `workname`, `description`, `setting`) VALUES(4, 1, 4, '四级审核', '四级审核', '');

DROP TABLE IF EXISTS `phpcms_copyfrom`;
CREATE TABLE IF NOT EXISTS `phpcms_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) TYPE=MyISAM;


-- --------------------------------------------------------

--
-- 表的结构 `phpcms_news`
--

DROP TABLE IF EXISTS `phpcms_news`;
CREATE TABLE IF NOT EXISTS `phpcms_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) TYPE=MyISAM;

--
-- 转存表中的数据 `phpcms_news`
--


-- --------------------------------------------------------

--
-- 表的结构 `phpcms_news_data`
--

DROP TABLE IF EXISTS `phpcms_news_data`;
CREATE TABLE IF NOT EXISTS `phpcms_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) TYPE=MyISAM;

--
-- 转存表中的数据 `phpcms_news_data`
--


-- --------------------------------------------------------

--
-- 表的结构 `phpcms_picture`
--

DROP TABLE IF EXISTS `phpcms_picture`;
CREATE TABLE IF NOT EXISTS `phpcms_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) TYPE=MyISAM;

--
-- 转存表中的数据 `phpcms_picture`
--


-- --------------------------------------------------------

--
-- 表的结构 `phpcms_picture_data`
--

DROP TABLE IF EXISTS `phpcms_picture_data`;
CREATE TABLE IF NOT EXISTS `phpcms_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) TYPE=MyISAM;

-- --------------------------------------------------------


--
-- 表的结构 `phpcms_extend_setting`
--

DROP TABLE IF EXISTS `phpcms_extend_setting`;
CREATE TABLE IF NOT EXISTS `phpcms_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) TYPE=MyISAM;

-- ----------------------------
-- Records of phpcms_menu
-- ----------------------------
--
-- 转存表中的数据 `phpcms_menu`
--

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(1, 'sys_setting', 0, 'admin', 'setting', 'init', '', 1, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(2, 'module', 0, 'admin', 'module', 'init', '', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(872, 'sync_release_point', 873, 'release', 'index', 'init', '', 3, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(4, 'content', 0, 'content', 'content', 'init', '', 4, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(5, 'members', 0, 'member', 'member', 'init', '', 5, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(6, 'userinterface', 0, 'template', 'style', 'init', '', 6, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(30, 'correlative_setting', 1, 'admin', 'admin', 'admin', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(31, 'menu_manage', 977, 'admin', 'menu', 'init', '', 8, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(32, 'posid_manage', 975, 'admin', 'position', 'init', '', 7, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(29, 'module_list', 2, 'admin', 'module', '', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(82, 'module_manage', 2, 'admin', 'module', '', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(10, 'panel', 0, 'admin', 'index', 'public_main', '', 0, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(35, 'menu_add', 31, 'admin', 'menu', 'add', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(826, 'template_manager', 6, '', '', '', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(54, 'admin_manage', 49, 'admin', 'admin_manage', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(43, 'category_manage', 975, 'admin', 'category', 'init', 'module=admin', 4, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(42, 'add_category', 43, 'admin', 'category', 'add', 's=0', 1, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(44, 'edit_category', 43, 'admin', 'category', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(45, 'badword_manage', 977, 'admin', 'badword', 'init', '', 10, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(46, 'posid_add', 32, 'admin', 'position', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(49, 'admin_setting', 1, 'admin', '', '', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(50, 'role_manage', 49, 'admin', 'role', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(51, 'role_add', 50, 'admin', 'role', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(52, 'category_cache', 43, 'admin', 'category', 'public_cache', 'module=admin', 4, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(55, 'manage_member', 5, 'member', 'member', 'manage', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(58, 'admin_add', 54, 'admin', 'admin_manage', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(59, 'model_manage', 975, 'content', 'sitemodel', 'init', '', 5, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(64, 'site_management', 30, 'admin', 'site', 'init', '', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(81, 'member_add', 72, 'member', 'member', 'add', '', 2, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(62, 'add_model', 59, 'content', 'sitemodel', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(65, 'release_point_management', 30, 'admin', 'release_point', 'init', '', 3, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(66, 'badword_export', 45, 'admin', 'badword', 'export', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(67, 'add_site', 64, 'admin', 'site', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(68, 'badword_import', 45, 'admin', 'badword', 'import', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(812, 'member_group_manage', 76, 'member', 'member_group', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(74, 'member_verify', 55, 'member', 'member_verify', 'manage', 's=0', 3, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(76, 'manage_member_group', 5, 'member', 'member_group', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(77, 'manage_member_model', 5, 'member', 'member_model', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(78, 'member_group_add', 812, 'member', 'member_group', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(79, 'member_model_add', 813, 'member', 'member_model', 'add', '', 1, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(80, 'member_model_import', 77, 'member', 'member_model', 'import', '', 2, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(72, 'member_manage', 55, 'member', 'member', 'manage', '', 1, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(813, 'member_model_manage', 77, 'member', 'member_model', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(814, 'site_edit', 64, 'admin', 'site', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(815, 'site_del', 64, 'admin', 'site', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(816, 'release_point_add', 65, 'admin', 'release_point', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(817, 'release_point_del', 65, 'admin', 'release_point', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(818, 'release_point_edit', 65, 'admin', 'release_point', 'edit', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(821, 'content_publish', 4, 'content', 'content', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(822, 'content_manage', 821, 'content', 'content', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(867, 'linkage', 977, 'admin', 'linkage', 'init', '', 13, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(827, 'template_style', 826, 'template', 'style', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(828, 'import_style', 827, 'template', 'style', 'import', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(831, 'template_export', 827, 'template', 'style', 'export', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(830, 'template_file', 827, 'template', 'file', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(832, 'template_onoff', 827, 'template', 'style', 'disable', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(833, 'template_updatename', 827, 'template', 'style', 'updatename', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(834, 'member_lock', 72, 'member', 'member', 'lock', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(835, 'member_unlock', 72, 'member', 'member', 'unlock', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(836, 'member_move', 72, 'member', 'member', 'move', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(837, 'member_delete', 72, 'member', 'member', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(842, 'verify_ignore', 74, 'member', 'member_verify', 'manage', 's=2', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(839, 'member_setting', 55, 'member', 'member_setting', 'manage', '', 4, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(841, 'verify_pass', 74, 'member', 'member_verify', 'manage', 's=1', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(843, 'verify_delete', 74, 'member', 'member_verify', 'manage', 's=3', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(844, 'verify_deny', 74, 'member', 'member_verify', 'manage', 's=4', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(845, 'never_pass', 74, 'member', 'member_verify', 'manage', 's=5', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(846, 'template_file_list', 827, 'template', 'file', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(847, 'template_file_edit', 827, 'template', 'file', 'edit_file', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(848, 'file_add_file', 827, 'template', 'file', 'add_file', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(850, 'listorder', 76, 'member', 'member_group', 'sort', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(852, 'priv_setting', 50, 'admin', 'role', 'priv_setting', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(853, 'role_priv', 50, 'admin', 'role', 'role_priv', '', 0, '0');


INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(857, 'attachment_manage', 821, 'attachment', 'manage', 'init', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(869, 'template_editor', 827, 'template', 'file', 'edit_file', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(870, 'template_visualization', 827, 'template', 'file', 'visualization', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(871, 'pc_tag_edit', 827, 'template', 'file', 'edit_pc_tag', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(873, 'release_manage', 4, 'release', 'html', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(874, 'type_manage', 975, 'content', 'type_manage', 'init', '', 6, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(875, 'add_type', 874, 'content', 'type_manage', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(876, 'linkageadd', 867, 'admin', 'linkage', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(877, 'failure_list', 872, 'release', 'index', 'failed', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(879, 'member_search', 72, 'member', 'member', 'search', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(880, 'queue_del', 872, 'release', 'index', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(881, 'member_model_delete', 813, 'member', 'member_model', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(882, 'member_model_edit', 813, 'member', 'member_model', 'edit', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(885, 'workflow', 977, 'content', 'workflow', 'init', '', 15, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(888, 'add_workflow', 885, 'content', 'workflow', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(889, 'member_modelfield_add', 813, 'member', 'member_modelfield', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(890, 'member_modelfield_edit', 813, 'member', 'member_modelfield', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(891, 'member_modelfield_delete', 813, 'member', 'member_modelfield', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(892, 'member_modelfield_manage', 813, 'member', 'member_modelfield', 'manage', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(895, 'sitemodel_import', 59, 'content', 'sitemodel', 'import', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(896, 'pay', 29, 'pay', 'payment', 'pay_list', 's=3', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(897, 'payments', 896, 'pay', 'payment', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(898, 'paylist', 896, 'pay', 'payment', 'pay_list', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(899, 'add_content', 822, 'content', 'content', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(900, 'modify_deposit', 896, 'pay', 'payment', 'modify_deposit', 's=1', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(901, 'check_content', 822, 'content', 'content', 'pass', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(902, 'dbsource', 29, 'dbsource', 'data', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(905, 'create_content_html', 873, 'content', 'create_html', 'show', '', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(904, 'external_data_sources', 902, 'dbsource', 'dbsource_admin', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(906, 'update_urls', 873, 'content', 'create_html', 'update_urls', '', 1, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(909, 'fulltext_search', 29, 'search', 'search_type', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(910, 'manage_type', 909, 'search', 'search_type', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(911, 'search_setting', 909, 'search', 'search_admin', 'setting', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(912, 'createindex', 909, 'search', 'search_admin', 'createindex', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(913, 'add_search_type', 909, 'search', 'search_type', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(914, 'database_toos', 977, 'admin', 'database', 'export', '', 6, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(915, 'database_export', 914, 'admin', 'database', 'export', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(916, 'database_import', 914, 'admin', 'database', 'import', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(917, 'dbsource_add', 902, 'dbsource', 'dbsource_admin', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(918, 'dbsource_edit', 902, 'dbsource', 'dbsource_admin', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(919, 'dbsource_del', 902, 'dbsource', 'dbsource_admin', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(920, 'dbsource_data_add', 902, 'dbsource', 'data', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(921, 'dbsource_data_edit', 902, 'dbsource', 'data', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(922, 'dbsource_data_del', 902, 'dbsource', 'data', 'del', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(931, 'badword_add', 45, 'admin', 'badword', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(932, 'badword_edit', 45, 'admin', 'badword', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(933, 'badword_delete', 45, 'admin', 'badword', 'delete', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(942, 'history_version', 827, 'template', 'template_bak', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(943, 'restore_version', 827, 'template', 'template_bak', 'restore', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(944, 'del_history_version', 827, 'template', 'template_bak', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(945, 'block', 821, 'block', 'block_admin', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(946, 'block_add', 945, 'block', 'block_admin', 'add', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(950, 'block_edit', 945, 'block', 'block_admin', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(951, 'block_del', 945, 'block', 'block_admin', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(952, 'block_update', 945, 'block', 'block_admin', 'block_update', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(953, 'block_restore', 945, 'block', 'block_admin', 'history_restore', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(954, 'history_del', 945, 'block', 'block_admin', 'history_del', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(978, 'urlrule_manage', 977, 'admin', 'urlrule', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(979, 'safe_config', 30, 'admin', 'setting', 'init', '&tab=2', 11, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(959, 'basic_config', 30, 'admin', 'setting', 'init', '', 10, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(961, 'position_edit', 32, 'admin', 'position', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(969, 'googlesitemap', 977, 'admin', 'googlesitemap', 'set', '', 11, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(970, 'admininfo', 10, 'admin', 'admin_manage', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(971, 'editpwd', 970, 'admin', 'admin_manage', 'public_edit_pwd', '', 1, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(972, 'editinfo', 970, 'admin', 'admin_manage', 'public_edit_info', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(973, 'keylink', 977, 'admin', 'keylink', 'init', '', 12, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(974, 'add_keylink', 973, 'admin', 'keylink', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(975, 'content_settings', 4, 'content', 'content_settings', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(7, 'extend', 0, 'admin', 'extend', 'init_extend', '', 7, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(977, 'extend_all', 7, 'admin', 'extend_all', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(980, 'sso_config', 30, 'admin', 'setting', 'init', '&tab=3', 12, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(981, 'email_config', 30, 'admin', 'setting', 'init', '&tab=4', 13, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(982, 'module_manage', 82, 'admin', 'module', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(983, 'ipbanned', 977, 'admin', 'ipbanned', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(984, 'add_ipbanned', 983, 'admin', 'ipbanned', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(989, 'downsites', 977, 'admin', 'downservers', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(997, 'log', 977, 'admin', 'log', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(998, 'add_page', 43, 'admin', 'category', 'add', 's=1', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(999, 'add_cat_link', 43, 'admin', 'category', 'add', 's=2', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1000, 'count_items', 43, 'admin', 'category', 'count_items', '', 5, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1001, 'cache_all', 977, 'admin', 'cache_all', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1002, 'create_list_html', 873, 'content', 'create_html', 'category', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1003, 'create_html_quick', 10, 'content', 'create_html_opt', 'index', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1004, 'create_index', 1003, 'content', 'create_html', 'public_index', '', 0, '1');


INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(8, 'phpsso', 0, 'admin', 'phpsso', 'menu', '', 7, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1011, 'edit_content', 822, 'content', 'content', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1012, 'push_to_special', 822, 'content', 'push', 'init', '', 0, '0');



INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1023, 'delete_log', 997, 'admin', 'log', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1024, 'delete_ip', 983, 'admin', 'ipbanned', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1026, 'delete_keylink', 973, 'admin', 'keylink', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1027, 'edit_keylink', 973, 'admin', 'keylink', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1034, 'operation_pass', 74, 'member', 'member_verify', 'pass', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1035, 'operation_delete', 74, 'member', 'member_verify', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1039, 'operation_ignore', 74, 'member', 'member_verify', 'ignore', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1038, 'settingsave', 30, 'admin', 'setting', 'save', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1040, 'admin_edit', 54, 'admin', 'admin_manage', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1041, 'operation_reject', 74, 'member', 'member_verify', 'reject', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1042, 'admin_delete', 54, 'admin', 'admin_manage', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1043, 'card', 54, 'admin', 'admin_manage', 'card', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1044, 'creat_card', 54, 'admin', 'admin_manage', 'creat_card', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1045, 'remove_card', 54, 'admin', 'admin_manage', 'remove_card', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1049, 'member_group_edit', 812, 'member', 'member_group', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1048, 'member_edit', 72, 'member', 'member', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1050, 'role_edit', 50, 'admin', 'role', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1051, 'member_group_delete', 812, 'member', 'member_group', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1052, 'member_manage', 50, 'admin', 'role', 'member_manage', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1053, 'role_delete', 50, 'admin', 'role', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1054, 'member_model_export', 77, 'member', 'member_model', 'export', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1055, 'member_model_sort', 77, 'member', 'member_model', 'sort', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1056, 'member_model_move', 77, 'member', 'member_model', 'move', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1057, 'payment_add', 897, 'pay', 'payment', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1058, 'payment_delete', 897, 'pay', 'payment', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1059, 'payment_edit', 897, 'pay', 'payment', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1060, 'spend_record', 896, 'pay', 'spend', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1061, 'pay_stat', 896, 'pay', 'payment', 'pay_stat', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1062, 'fields_manage', 59, 'content', 'sitemodel_field', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1063, 'edit_model_content', 59, 'content', 'sitemodel', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1064, 'disabled_model', 59, 'content', 'sitemodel', 'disabled', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1065, 'delete_model', 59, 'content', 'sitemodel', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1066, 'export_model', 59, 'content', 'sitemodel', 'export', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1067, 'delete', 874, 'content', 'type_manage', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1068, 'edit', 874, 'content', 'type_manage', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1069, 'add_urlrule', 978, 'admin', 'urlrule', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1070, 'edit_urlrule', 978, 'admin', 'urlrule', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1071, 'delete_urlrule', 978, 'admin', 'urlrule', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1072, 'edit_menu', 31, 'admin', 'menu', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1073, 'delete_menu', 31, 'admin', 'menu', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1074, 'edit_workflow', 885, 'content', 'workflow', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1075, 'delete_workflow', 885, 'content', 'workflow', 'delete', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1093, 'connect_config', 30, 'admin', 'setting', 'init', '&tab=5', 14, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1102, 'view_modelinfo', 74, 'member', 'member_verify', 'modelinfo', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1240, 'view_memberlinfo', 72, 'member', 'member', 'memberinfo', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1239, 'copyfrom_manage', 977, 'admin', 'copyfrom', 'init', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1241, 'move_content', 822, 'content', 'content', 'remove', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1242, 'poster_template', 56, 'poster', 'space', 'poster_template', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1243, 'create_index', 873, 'content', 'create_html', 'public_index', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1244, 'add_othors', 822, 'content', 'content', 'add_othors', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1295, 'attachment_manager_dir', 857, 'attachment', 'manage', 'dir', '', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1296, 'attachment_manager_db', 857, 'attachment', 'manage', 'init', '', 1, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1346, 'attachment_address_replace', 857, 'attachment', 'address', 'init', '', 3, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1347, 'attachment_address_update', 857, 'attachment', 'address', 'update', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1348, 'delete_content', 822, 'content', 'content', 'delete', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1349, 'member_menu_manage', 977, 'member', 'member_menu', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1350, 'member_menu_add', 1349, 'member', 'member_menu', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1351, 'member_menu_edit', 1349, 'member', 'member_menu', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1352, 'member_menu_delete', 1349, 'member', 'member_menu', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1353, 'batch_show', 822, 'content', 'create_html', 'batch_show', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1354, 'pay_delete', 898, 'pay', 'payment', 'pay_del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1355, 'pay_cancel', 898, 'pay', 'payment', 'pay_cancel', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1356, 'discount', 898, 'pay', 'payment', 'discount', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1360, 'category_batch_edit', 43, 'admin', 'category', 'batch_edit', '', 6, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1500, 'listorder', 822, 'content', 'content', 'listorder', '', 0, '0');
INSERT INTO `phpcms_menu` (`name` ,`parentid` ,`m` ,`c` ,`a` ,`data` ,`listorder` ,`display` ,`project1` ,`project2` ,`project3` ,`project4` ,`project5`) VALUES ('a_clean_data',  '873',  'content',  'content',  'clear_data',  '',  '0',  '1',  '0',  '0',  '0',  '0',  '0');
-- ----------------------------
-- Records of phpcms_module
-- ----------------------------
INSERT INTO `phpcms_module` VALUES ('admin', 'admin', '', '1', '1.0', '', 'array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n)', '0', '0', '2010-10-18', '2010-10-18');

INSERT INTO `phpcms_module` VALUES ('member', '会员', '', '1', '1.0', '', 'array (\n  \'allowregister\' => \'0\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'10\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'0\',\n  \'regprotocol\' => \'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \',\n  \'registerverifymessage\' => \' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\',\n  \'forgetpassword\' => \' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\',\n)', '0', '0', '2010-09-06', '2010-09-06');

INSERT INTO `phpcms_module` VALUES ('pay', '支付', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');

INSERT INTO `phpcms_module` VALUES ('digg', '顶一下', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('content', '内容模块', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('search', '全站搜索', '', '0', '1.0', '', 'array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('attachment', '附件', 'attachment', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('block', '碎片', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('dbsource', '数据源', '', '1', '', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('template', '模板风格', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('release', '发布点', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');

-- ----------------------------
-- Records of phpcms_type
-- ----------------------------
INSERT INTO `phpcms_type` (`siteid`, `typeid`, `module`, `modelid`, `name`, `parentid`, `typedir`, `url`, `template`, `listorder`, `description`) VALUES('1', '52', 'search', '0', '专题', '0', 'special', '', '', '4', '专题');
INSERT INTO `phpcms_type` (`siteid`, `typeid`, `module`, `modelid`, `name`, `parentid`, `typedir`, `url`, `template`, `listorder`, `description`) VALUES('1', '1', 'search', '1', '新闻', '0', '', '', '', '1', '新闻模型搜索');
INSERT INTO `phpcms_type` (`siteid`, `typeid`, `module`, `modelid`, `name`, `parentid`, `typedir`, `url`, `template`, `listorder`, `description`) VALUES('1', '2', 'search', '2', '下载', '0', '', '', '', '3', '下载模型搜索');
INSERT INTO `phpcms_type` (`siteid`, `typeid`, `module`, `modelid`, `name`, `parentid`, `typedir`, `url`, `template`, `listorder`, `description`) VALUES('1', '3', 'search', '3', '图片', '0', '', '', '', '2', '图片模型搜索');



-- ----------------------------
-- Records of phpcms_urlrule
-- ----------------------------
INSERT INTO `phpcms_urlrule` VALUES ('1', 'content', 'category', '1', '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html', 'news/china/1000.html');
INSERT INTO `phpcms_urlrule` VALUES ('6', 'content', 'category', '0', 'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}', 'index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `phpcms_urlrule` VALUES ('11', 'content', 'show', '1', '{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html', '2010/catdir_0720/1_2.html');
INSERT INTO `phpcms_urlrule` VALUES ('12', 'content', 'show', '1', '{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html', 'it/product/2010/0720/1_2.html');
INSERT INTO `phpcms_urlrule` VALUES ('16', 'content', 'show', '0', 'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}', 'index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `phpcms_urlrule` VALUES ('17', 'content', 'show', '0', 'show-{$catid}-{$id}-{$page}.html', 'show-1-2-1.html');
INSERT INTO `phpcms_urlrule` VALUES ('18', 'content', 'show', '0', 'content-{$catid}-{$id}-{$page}.html', 'content-1-2-1.html');
INSERT INTO `phpcms_urlrule` VALUES ('30', 'content', 'category', '0', 'list-{$catid}-{$page}.html', 'list-1-1.html');


-- ----------------------------
-- Records of phpcms_model
-- ----------------------------
INSERT INTO `phpcms_model` (`modelid`, `siteid`, `name`, `description`, `tablename`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `sort`, `type`) VALUES(1, 1, '文章模型', '', 'news', 1, 0, 'default', 'category', 'list', 'show', 0, 0);
INSERT INTO `phpcms_model` (`modelid`, `siteid`, `name`, `description`, `tablename`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `sort`, `type`) VALUES(3, 1, '图片模型', '', 'picture', 1, 0, 'default', 'category_picture', 'list_picture', 'show_picture', 0, 0);
INSERT INTO `phpcms_model` (`modelid`, `siteid`, `name`, `description`, `tablename`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `sort`, `type`) VALUES(10, 1, '普通会员', '普通会员', 'member_detail', 1, 0, '', '', '', '', 0, 2);

-- ----------------------------
-- Records of phpcms_model_field
-- ----------------------------

INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(1, 1, 1, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(2, 1, 1, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(3, 1, 1, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(4, 1, 1, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(5, 1, 1, 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', 0, 40, '', '', 'keyword', 'array (\r\n  ''size'' => ''100'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(6, 1, 1, 'description', '摘要', '', '', 0, 255, '', '', 'textarea', 'array (\r\n  ''width'' => ''98'',\r\n  ''height'' => ''46'',\r\n  ''defaultvalue'' => '''',\r\n  ''enablehtml'' => ''0'',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 10, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(7, 1, 1, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  ''dateformat'' => ''int'',\r\n  ''format'' => ''Y-m-d H:i:s'',\r\n  ''defaulttype'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(8, 1, 1, 'content', '内容', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>是否截取内容</label><input type="text" name="introcude_length" value="200" size="3">字符至内容摘要\r\n<label><input type=''checkbox'' name=''auto_thumb'' value="1" checked>是否获取内容第</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">张图片作为标题图片\r\n</div>', '', 1, 999999, '', '内容不能为空', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(9, 1, 1, 'voteid', '添加投票', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''text\\'' name=\\''info[voteid]\\'' id=\\''voteid\\'' value=\\''{FIELD_VALUE}\\'' size=\\''3\\''> \r\n<input type=\\''button\\'' value="选择已有投票" onclick="omnipotent(\\''selectid\\'',\\''?m=vote&c=vote&a=public_get_votelist&from_api=1\\'',\\''选择已有投票\\'')" class="button">\r\n<input type=\\''button\\'' value="新增投票" onclick="omnipotent(\\''addvote\\'',\\''?m=vote&c=vote&a=add&from_api=1\\'',\\''添加投票\\'',0)" class="button">'',\n  ''fieldtype'' => ''mediumint'',\n  ''minnumber'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 1, 0, 21, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(10, 1, 1, 'pages', '分页方式', '', '', 0, 0, '', '', 'pages', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(11, 1, 1, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(12, 1, 1, 'posids', '推荐位', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(13, 1, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(14, 1, 1, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 51, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(15, 1, 1, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(16, 1, 1, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(17, 1, 1, 'groupids_view', '阅读权限', '', '', 0, 0, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(18, 1, 1, 'readpoint', '阅读收费', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(19, 1, 1, 'relation', '相关文章', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="添加相关" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''添加相关文章\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="显示已有" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(20, 1, 1, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(21, 1, 1, 'copyfrom', '来源', '', '', 0, 100, '', '', 'copyfrom', 'array (\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 8, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(80, 1, 1, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0);

INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(51, 3, 1, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(52, 3, 1, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(53, 3, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(54, 3, 1, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 51, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(55, 3, 1, 'posids', '推荐位', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(56, 3, 1, 'groupids_view', '阅读权限', '', '', 0, 0, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(57, 3, 1, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(58, 3, 1, 'pages', '分页方式', '', '', 0, 0, '', '', 'pages', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(59, 3, 1, 'relation', '相关组图', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="添加相关" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''添加相关文章\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="显示已有" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(60, 3, 1, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(61, 3, 1, 'content', '内容', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>是否截取内容</label><input type="text" name="introcude_length" value="200" size="3">字符至内容摘要\r\n<label><input type=''checkbox'' name=''auto_thumb'' value="1" checked>是否获取内容第</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">张图片作为标题图片\r\n</div>', '', 0, 999999, '', '', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n  ''height'' => '''',\n  ''disabled_page'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(62, 3, 1, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  ''dateformat'' => ''int'',\r\n  ''format'' => ''Y-m-d H:i:s'',\r\n  ''defaulttype'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(63, 3, 1, 'description', '摘要', '', '', 0, 255, '', '', 'textarea', 'array (\r\n  ''width'' => ''98'',\r\n  ''height'' => ''46'',\r\n  ''defaultvalue'' => '''',\r\n  ''enablehtml'' => ''0'',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 10, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(64, 3, 1, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(65, 3, 1, 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', 0, 40, '', '', 'keyword', 'array (\r\n  ''size'' => ''100'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(66, 3, 1, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(67, 3, 1, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(68, 3, 1, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(69, 3, 1, 'readpoint', '阅读收费', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(70, 3, 1, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(71, 3, 1, 'pictureurls', '组图', '', '', 0, 0, '', '', 'images', 'array (\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isselectimage'' => ''1'',\n  ''upload_number'' => ''50'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 15, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(72, 3, 1, 'copyfrom', '来源', '', '', 0, 0, '', '', 'copyfrom', 'array (\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 8, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(73, 1, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 30, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(74, 2, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 30, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(75, 3, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 30, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(83, 10, 1, 'birthday', '生日', '', '', 0, 0, '', '生日格式错误', 'datetime', 'array (\n  ''fieldtype'' => ''date'',\n  ''format'' => ''Y-m-d'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0);

--
-- 会员字段
--

INSERT INTO `phpcms_model_field` (`modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isselect`, `iswhere`, `isorder`, `islist`, `isshow`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`) VALUES ('10', '1', 'birthday', '生日', '', '', '0', '0', '', '生日格式错误', 'datetime', 'array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0');

INSERT INTO `phpcms_admin_role` VALUES ('1', '超级管理员', '超级管理员', '0', '0');
INSERT INTO `phpcms_admin_role` VALUES ('2', '站点管理员', '站点管理员', '0', '0');
INSERT INTO `phpcms_admin_role` VALUES ('3', '运营总监', '运营总监', '1', '0');
INSERT INTO `phpcms_admin_role` VALUES ('4', '总编', '总编', '5', '0');
INSERT INTO `phpcms_admin_role` VALUES ('5', '编辑', '编辑', '1', '0');
INSERT INTO `phpcms_admin_role` VALUES ('7', '发布人员', '发布人员', '0', '0');

INSERT INTO `phpcms_site` VALUES ('1', '默认站点', '', 'http://test.phpcms.cn/', 'PHPCMS演示站', '关键字', '描述', '028-66669999','18866669999','','成都市某个区某个大道1234号','','eqifei_net','599580031','599580031@qq.com','蜀ICP备123456789号','', 'default', 'default', 'array (\n  \'upload_maxsize\' => \'2048\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\',\n  \'watermark_enable\' => \'0\',\n  \'watermark_minwidth\' => \'300\',\n  \'watermark_minheight\' => \'300\',\n  \'watermark_img\' => \'/statics/images/water/mark.png\',\n  \'watermark_pct\' => \'85\',\n  \'watermark_quality\' => \'80\',\n  \'watermark_pos\' => \'9\',\n)', '');

INSERT INTO `phpcms_member_group` VALUES ('8', '游客', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '', '0', '0');
INSERT INTO `phpcms_member_group` VALUES ('2', '新手上路', '1', '1', '50', '100', '1', '1', '0', '0', '0', '1', '0', '0', '50.00', '10.00', '1.00', '', '', '', '2', '0');
INSERT INTO `phpcms_member_group` VALUES ('6', '注册会员', '1', '2', '100', '150', '0', '1', '0', '0', '1', '1', '0', '0', '300.00', '30.00', '1.00', '', '', '', '6', '0');
INSERT INTO `phpcms_member_group` VALUES ('4', '中级会员', '1', '3', '150', '500', '1', '1', '0', '1', '1', '1', '0', '0', '500.00', '60.00', '1.00', '', '', '', '4', '0');
INSERT INTO `phpcms_member_group` VALUES ('5', '高级会员', '1', '5', '300', '999', '1', '1', '0', '1', '1', '1', '0', '0', '360.00', '90.00', '5.00', '', '', '', '5', '0');
INSERT INTO `phpcms_member_group` VALUES ('1', '禁止访问', '1', '0', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '0', '0', '0');
INSERT INTO `phpcms_member_group` VALUES ('7', '邮件认证', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', 'images/group/vip.jpg', '#000000', '', '7', '0');

INSERT INTO `phpcms_member_menu` VALUES ('', 'member_init', '0', 'member', 'index', 'init', 't=0', '0', '1', '', '');
INSERT INTO `phpcms_member_menu` VALUES ('', 'account_manage', '0', 'member', 'index', 'account_manage', 't=1', '0', '1', '', '');
INSERT INTO `phpcms_member_menu` VALUES ('', 'favorite', '0', 'member', 'index', 'favorite', 't=2', '0', '1', '', '');