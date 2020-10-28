DROP TABLE IF EXISTS `phpcms_collection_history`;
CREATE TABLE `phpcms_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) TYPE=MyISAM;