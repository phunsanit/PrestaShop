SET NAMES 'utf8';

INSERT INTO `PREFIX_hook_module` (`id_module`, `id_shop`, `id_hook`, `position`) (
  SELECT m.id_module, s.id_shop, h.id_hook, 0
  FROM `PREFIX_module` m, `PREFIX_shop` s, `PREFIX_hook` h
  WHERE m.name IN ('dashgoals', 'dashactivity', 'dashtrends', 'dashproducts')
        AND h.name IN ('actionAdminControllerSetMedia')
);

ALTER TABLE  `PREFIX_configuration` CHANGE  `name`  `name` VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

ALTER TABLE  `PREFIX_module_shop` ADD  `enable_device` TINYINT(1) NOT NULL DEFAULT  '7' AFTER  `id_shop`;

ALTER TABLE `PREFIX_theme` ADD `responsive` TINYINT( 1 ) NOT NULL DEFAULT '0';

CREATE TABLE IF NOT EXISTS `PREFIX_theme_meta` (
  `id_theme_meta` int(11) NOT NULL AUTO_INCREMENT,
  `id_theme` int(11) NOT NULL,
  `meta_page` varchar(64) NOT NULL,
  `left_column` tinyint(1) NOT NULL DEFAULT '0',
  `right_column` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_theme_meta`),
  UNIQUE KEY `id_theme` (`id_theme`,`meta_page`)
) ENGINE=ENGINE_TYPE DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE `PREFIX_meta` ADD `configurable` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' AFTER `page`;