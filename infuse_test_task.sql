/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:8889
 Source Schema         : infuse_test_task

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 30/10/2022 05:31:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for views
-- ----------------------------
DROP TABLE IF EXISTS `views`;
CREATE TABLE `views` (
  `ip_address` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `user_agent` text COLLATE utf8_bin,
  `view_date` datetime DEFAULT NULL,
  `page_url` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `views_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of views
-- ----------------------------
BEGIN;
INSERT INTO `views` (`ip_address`, `user_agent`, `view_date`, `page_url`, `views_count`) VALUES ('127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:107.0) Gecko/20100101 Firefox/107.0', '2022-10-30 05:21:30', 'index2.html', 6);
INSERT INTO `views` (`ip_address`, `user_agent`, `view_date`, `page_url`, `views_count`) VALUES ('127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:107.0) Gecko/20100101 Firefox/107.0', '2022-10-30 05:21:39', 'index1.html', 8);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
