/*
 Navicat Premium Data Transfer

 Source Server         : 虚拟机
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 192.168.2.120:3306
 Source Schema         : backend

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 21/05/2019 18:52:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apis_app
-- ----------------------------
DROP TABLE IF EXISTS `apis_app`;
CREATE TABLE `apis_app`  (
  `appid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `application` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publish_date` date NOT NULL,
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`appid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apis_app
-- ----------------------------
INSERT INTO `apis_app` VALUES ('7b27422f98f13eb2610f1996ec757be7', 'life', 'stock', '股票', '2018-10-01', '/service/stock', 'this is a stock app.');
INSERT INTO `apis_app` VALUES ('833cfd91bc1ac638ecd3764715b443ef', 'life', 'joke', '笑话', '2018-10-03', '/service/constellation', 'this is a jock app.');
INSERT INTO `apis_app` VALUES ('a381d410bea99d3618cc6cd431c32b0f', 'life', 'constellation', '星座运势', '2018-11-16', '/service/constellation', 'this is a constellation app.');
INSERT INTO `apis_app` VALUES ('c4873ccb8579389205d66126a38a6d08', 'life', 'Image backup', '图片备份', '2018-11-15', '/service/image', 'this is a Image backup app.');
INSERT INTO `apis_app` VALUES ('f18ba49825b634f44e8cdfb694ecaa13', 'life', 'weather', '天气', '2018-12-01', '/service/weather', 'this is a weather app.');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add user', 7, 'add_user');
INSERT INTO `auth_permission` VALUES (20, 'Can change user', 7, 'change_user');
INSERT INTO `auth_permission` VALUES (21, 'Can delete user', 7, 'delete_user');
INSERT INTO `auth_permission` VALUES (22, 'Can add app', 8, 'add_app');
INSERT INTO `auth_permission` VALUES (23, 'Can change app', 8, 'change_app');
INSERT INTO `auth_permission` VALUES (24, 'Can delete app', 8, 'delete_app');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$100000$U41DTsmRRhQW$2B31FzjKQeYyUqmskbhLsz7cJmRBpvjo+eEGbFsFB7M=', '2019-05-21 02:07:45.554600', 1, 'zhangyanqing', '', '', '984430071@qq.com', 1, 1, '2019-05-21 02:06:18.111925');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for authorization_user
-- ----------------------------
DROP TABLE IF EXISTS `authorization_user`;
CREATE TABLE `authorization_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `focus_cities` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `focus_constellations` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `focus_stock` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `open_id`(`open_id`) USING BTREE,
  INDEX `authorizati_nicknam_b76290_idx`(`nickname`) USING BTREE,
  INDEX `authorizati_open_id_5cfcc1_idx`(`open_id`, `nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authorization_user
-- ----------------------------
INSERT INTO `authorization_user` VALUES (3, 'osYBs5ZmG1SobLJ_821dW9CvzcXw', 'null1', '[{\"province\": \"\\u5c71\\u4e1c\\u7701\", \"city\": \"\\u6ee8\\u5dde\\u5e02\", \"area\": \"\\u6ee8\\u57ce\\u533a\"}, {\"province\": \"\\u6c5f\\u82cf\\u7701\", \"city\": \"\\u5357\\u4eac\\u5e02\", \"area\": \"\\u7384\\u6b66\\u533a\"}, {\"province\": \"\\u6c5f\\u82cf\\u7701\", \"city\": \"\\u5357\\u4eac\\u5e02\", \"area\": \"\\u6816\\u971e\\u533a\"}, {\"province\": \"\\u5317\\u4eac\\u5e02\", \"city\": \"\\u5317\\u4eac\\u5e02\", \"area\": \"\\u4e1c\\u57ce\\u533a\"}, {\"province\": \"\\u6cb3\\u5317\\u7701\", \"city\": \"\\u77f3\\u5bb6\\u5e84\\u5e02\", \"area\": \"\\u957f\\u5b89\\u533a\"}]', '[\"\\u767d\\u7f8a\\u5ea7\", \"\\u91d1\\u725b\\u5ea7\", \"\\u53cc\\u5b50\\u5ea7\", \"\\u72ee\\u5b50\\u5ea7\"]', '[{\"code\": \"000001\", \"name\": \"\\u5e73\\u5b89\\u94f6\\u884c\", \"fullInfo\": \"\\u6df1\\u4ea4\\u6240-\\u5e73\\u5b89\\u94f6\\u884c(000001)\", \"market\": \"sz\"}, {\"code\": \"000002\", \"name\": \"\\u4e07 \\u79d1\\uff21\", \"fullInfo\": \"\\u6df1\\u4ea4\\u6240-\\u4e07 \\u79d1\\uff21(000002)\", \"market\": \"sz\"}]');

-- ----------------------------
-- Table structure for authorization_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `authorization_user_menu`;
CREATE TABLE `authorization_user_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `app_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `authorization_user_focus_app_user_id_app_id_85aa4ac5_uniq`(`user_id`, `app_id`) USING BTREE,
  INDEX `authorization_user_menu_app_id_13ca5893_fk_apis_app_appid`(`app_id`) USING BTREE,
  CONSTRAINT `authorization_user_m_user_id_b7aaa9f0_fk_authoriza` FOREIGN KEY (`user_id`) REFERENCES `authorization_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `authorization_user_menu_app_id_13ca5893_fk_apis_app_appid` FOREIGN KEY (`app_id`) REFERENCES `apis_app` (`appid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authorization_user_menu
-- ----------------------------
INSERT INTO `authorization_user_menu` VALUES (139, 3, '7b27422f98f13eb2610f1996ec757be7');
INSERT INTO `authorization_user_menu` VALUES (138, 3, '833cfd91bc1ac638ecd3764715b443ef');
INSERT INTO `authorization_user_menu` VALUES (142, 3, 'a381d410bea99d3618cc6cd431c32b0f');
INSERT INTO `authorization_user_menu` VALUES (143, 3, 'c4873ccb8579389205d66126a38a6d08');
INSERT INTO `authorization_user_menu` VALUES (144, 3, 'f18ba49825b634f44e8cdfb694ecaa13');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (8, 'apis', 'app');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (7, 'authorization', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-05-07 10:09:15.082358');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-05-07 10:09:15.471990');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-05-07 10:09:15.540635');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-05-07 10:09:15.548821');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2019-05-07 10:09:15.588439');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2019-05-07 10:09:15.608286');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0003_alter_user_email_max_length', '2019-05-07 10:09:15.628609');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0004_alter_user_username_opts', '2019-05-07 10:09:15.638867');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0005_alter_user_last_login_null', '2019-05-07 10:09:15.656839');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0006_require_contenttypes_0002', '2019-05-07 10:09:15.659352');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2019-05-07 10:09:15.672107');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0008_alter_user_username_max_length', '2019-05-07 10:09:15.695575');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0009_alter_user_last_name_max_length', '2019-05-07 10:09:15.731009');
INSERT INTO `django_migrations` VALUES (14, 'authorization', '0001_initial', '2019-05-07 10:09:15.755785');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2019-05-07 10:09:15.781683');
INSERT INTO `django_migrations` VALUES (16, 'authorization', '0002_auto_20190507_1056', '2019-05-07 10:56:56.498780');
INSERT INTO `django_migrations` VALUES (17, 'apis', '0001_initial', '2019-05-08 03:04:45.365189');
INSERT INTO `django_migrations` VALUES (18, 'authorization', '0003_user_focus_app', '2019-05-11 02:06:29.945300');
INSERT INTO `django_migrations` VALUES (19, 'authorization', '0004_auto_20190511_0235', '2019-05-11 02:35:49.313454');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0k6vvcgunwkpp28kjzsffziyzs6bcrsf', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-14 04:04:31.042237');
INSERT INTO `django_session` VALUES ('1bbz4jkzo01skux4n9c57apviunietwr', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-14 02:58:47.403026');
INSERT INTO `django_session` VALUES ('4ey9lzrdf3f8v1drcqctrnfmvfugsi4f', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-04-30 09:26:34.479000');
INSERT INTO `django_session` VALUES ('4q5mou88ds008hp1kpxaupllhmquaqpc', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-17 07:15:41.467884');
INSERT INTO `django_session` VALUES ('5lrescgovdzcbmdxa6fv1mmbyn31sjw5', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-14 04:07:15.028987');
INSERT INTO `django_session` VALUES ('6eaz5rg1ikv6kppqjt8u0qll4mqbpuju', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-16 07:46:12.199184');
INSERT INTO `django_session` VALUES ('7pm9381y5lg5xzvjnha60rvlyjl5zdp6', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-09 01:11:46.353217');
INSERT INTO `django_session` VALUES ('7zeeqrrhip02ykyi7xxf5a40wljzsp9p', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-11 02:14:15.563349');
INSERT INTO `django_session` VALUES ('8it9bdr03l33u7cl03756lvp2tbghzp4', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-01 09:24:29.366000');
INSERT INTO `django_session` VALUES ('9xtato6edfexpmkiwwjy44lcqk0n2l2r', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-04-30 09:26:30.201000');
INSERT INTO `django_session` VALUES ('afwz4g500w8qa9ac5buwmyzsr395aoq7', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-14 02:57:23.256736');
INSERT INTO `django_session` VALUES ('ar87uzo0v65tq6ldmkao5idlrztm00on', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-08 07:55:49.546000');
INSERT INTO `django_session` VALUES ('cje7c64zlt2y8skpu7yfazcbmxn8nijl', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-21 02:22:41.758575');
INSERT INTO `django_session` VALUES ('d27471wei7ebstnsnfe8j3dazpwf1em7', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-10 07:02:32.051785');
INSERT INTO `django_session` VALUES ('dzyrg9nrh1qicqsww9a5e9qkabd64o6o', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-19 08:37:31.571544');
INSERT INTO `django_session` VALUES ('f07hr0xpqzhui50iucsj7xb1vag8i75w', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-15 08:04:30.963960');
INSERT INTO `django_session` VALUES ('gtimt18peon9zwf6noo6hxg09wl26v5n', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-15 09:15:09.934782');
INSERT INTO `django_session` VALUES ('hvtt7kyv35lyhj3vs7qh4ynbhqqwe126', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-14 03:24:16.157745');
INSERT INTO `django_session` VALUES ('i5nqfhldzbpnwfbox7wf44xd5upscgg7', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-02 06:09:21.505000');
INSERT INTO `django_session` VALUES ('ipo72bu6xy6b03w5g9p4fpuzlseef9rw', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-15 09:53:06.182837');
INSERT INTO `django_session` VALUES ('jbe96tdfpaxpricr0d4x2fpks31r5ol4', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-15 07:22:35.428552');
INSERT INTO `django_session` VALUES ('jy0hqp7e9a9cdfnc30snjmbv9xyr0cly', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-19 08:42:03.939370');
INSERT INTO `django_session` VALUES ('kfvn2tycaqfxcii3cw4g7gw75ugbbxdx', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-01 09:24:33.219000');
INSERT INTO `django_session` VALUES ('krlkq94y40q6az3fsjckvcmmbp5fcvf1', 'NWI3ODg1NDY5ZTBhZmU3MWY4ZmE2MzBmODFjMjc2YzA5NGE2ZjQ1NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYjZjMDEwN2YwYzNhNjRlNDY4M2NhMzU4NmU3OTFmODE3ZmMyNzdiIn0=', '2019-05-22 02:07:45.563261');
INSERT INTO `django_session` VALUES ('lpkl8487a4uif5dh04s7v1d1le6g3z4d', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-16 07:35:24.413305');
INSERT INTO `django_session` VALUES ('me1mij7ce40ybtrvve974zi6iin0b41d', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-14 10:24:28.492981');
INSERT INTO `django_session` VALUES ('n7vkyqnoxo6r3rhivlkoakzpnw7s593l', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-15 09:17:41.100890');
INSERT INTO `django_session` VALUES ('nfxmqoma907otcxktpwdbgmmyjfkuprh', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-19 08:37:13.745507');
INSERT INTO `django_session` VALUES ('qc11bcbzh2hdzb6zst2xve99s8f2ne01', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-01 01:24:56.000000');
INSERT INTO `django_session` VALUES ('s0s930xy4r4cs24suhvg866b0oqpgzir', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-17 07:16:00.926195');
INSERT INTO `django_session` VALUES ('s75qncs2nekcgdkzk2nikqd689hj0iqp', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-01 01:24:16.631000');
INSERT INTO `django_session` VALUES ('sn4sv08hoa052htym8m4i8cddu68r3v0', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-14 10:12:24.447211');
INSERT INTO `django_session` VALUES ('tmdj9zt6qhvn4m3vs9wl8ro510fc7u1n', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-15 09:52:59.478108');
INSERT INTO `django_session` VALUES ('urpgz8v68b3ut3kut0034kv968xjh2gq', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-09 01:13:28.480692');
INSERT INTO `django_session` VALUES ('wd0nw803acjo70smp9ur41foan9u7r9c', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-01 08:20:32.174000');
INSERT INTO `django_session` VALUES ('wz184qwjcz1rt8913ulcnaauz2o2berj', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-16 06:18:08.187372');
INSERT INTO `django_session` VALUES ('x90tb0wleq62r14elz492fmxby1ijpqd', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-04-30 09:25:32.455000');
INSERT INTO `django_session` VALUES ('xeepga9tj8wugljagpuic3vwbe6znjdw', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-19 08:41:51.072032');
INSERT INTO `django_session` VALUES ('xubp6hphsvm8pkjc41k8rik03x771npn', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-07 08:14:45.349000');
INSERT INTO `django_session` VALUES ('ybno0z25kp7j419hyvqv52ip701shfqg', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-22 08:22:06.606494');
INSERT INTO `django_session` VALUES ('zoj1cpaqtu7ixs7yyrskgix0xlx7p2z4', 'MGZiZTU0NTc1YTdlYjkwNTlhM2I1YWZjZTE5YmNhYTY3NjNhMTEwYTp7Im9wZW5faWQiOiJvc1lCczVabUcxU29iTEpfODIxZFc5Q3Z6Y1h3IiwiaXNfYXV0aG9yaXplIjp0cnVlfQ==', '2019-05-14 04:10:41.012354');

SET FOREIGN_KEY_CHECKS = 1;
