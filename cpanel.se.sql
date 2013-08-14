/*
 Navicat Premium Data Transfer

 Source Server         : local mysql
 Source Server Type    : MySQL
 Source Server Version : 50529
 Source Host           : localhost
 Source Database       : cpanel.se

 Target Server Type    : MySQL
 Target Server Version : 50529
 File Encoding         : utf-8

 Date: 08/14/2013 17:48:06 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `groups`
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `groups`
-- ----------------------------
BEGIN;
INSERT INTO `groups` VALUES ('1', 'Denetmen1', '{\"view\":1,\"update\":1}', '2013-08-14 14:13:00', '2013-08-14 14:22:53'), ('2', 'Sahip', '{\"view\":1,\"create\":1,\"update\":1,\"delete\":1}', '2013-08-14 14:13:42', '2013-08-14 14:13:51');
COMMIT;

-- ----------------------------
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `migrations`
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES ('2012_12_06_225921_migration_cartalyst_sentry_install_users', '1'), ('2012_12_06_225929_migration_cartalyst_sentry_install_groups', '1'), ('2012_12_06_225945_migration_cartalyst_sentry_install_users_groups_pivot', '1'), ('2012_12_06_225988_migration_cartalyst_sentry_install_throttle', '1'), ('2013_06_16_144920_create_permissions_table', '2');
COMMIT;

-- ----------------------------
--  Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `permissions`
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES ('1', 'Admin', '[\"admin.view\"]', '2013-08-14 14:11:08', '2013-08-14 14:11:08'), ('2', 'Users', '[\"users.view\",\"users.create\",\"users.update\",\"users.delete\"]', '2013-08-14 14:11:08', '2013-08-14 14:11:08'), ('3', 'Groups', '[\"groups.view\",\"groups.create\",\"groups.update\",\"groups.delete\"]', '2013-08-14 14:11:08', '2013-08-14 14:11:08'), ('4', 'Permissions', '[\"permissions.view\",\"permissions.create\",\"permissions.update\",\"permissions.delete\"]', '2013-08-14 14:11:08', '2013-08-14 14:11:08'), ('5', 'Design', '[\"design.view\",\"design.create\",\"design.update\",\"design.delete\"]', '2013-08-14 14:14:29', '2013-08-14 14:14:29');
COMMIT;

-- ----------------------------
--  Table structure for `throttle`
-- ----------------------------
DROP TABLE IF EXISTS `throttle`;
CREATE TABLE `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `throttle`
-- ----------------------------
BEGIN;
INSERT INTO `throttle` VALUES ('1', '1', '127.0.0.1', '0', '0', '0', null, null, null), ('2', '2', null, '0', '0', '0', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'sineld@gmail.com', '$2y$10$9so7btrSnBJrT10mbsxEwO7QBBLNFjjEY2BjLvQylhp18PhPNRfly', '{\"superuser\":1}', '1', null, '2013-08-14 14:11:53', '2013-08-14 14:12:28', '$2y$10$lrUIV7l0wNYPuItw1mfdm.hR4dH4PDAfGjNvHvi4RuSySxiwMAMP6', null, 'Sinan Eldem', null, '2013-08-14 14:11:53', '2013-08-14 14:12:28'), ('2', 'tuana@gmail.com', '$2y$10$/lHj.NhiFiyKX.2aMuP90eKY.ATo9BGRdNHT.Ejin5J.kI55xFAP6', '{\"users.view\":1,\"groups.view\":1,\"groups.update\":1,\"permissions.view\":1}', '1', null, '2013-08-14 14:15:27', '2013-08-14 14:27:01', '$2y$10$lBeGcSyaGHxzcJfeN0ki.OY8gxsvc6GzMv93ZqszLKyX9k/4Ve1te', null, 'Tuana', 'Şeyma', '2013-08-14 14:15:27', '2013-08-14 14:27:01');
COMMIT;

-- ----------------------------
--  Table structure for `users_groups`
-- ----------------------------
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE `users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
