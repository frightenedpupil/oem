/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : oem7

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 21/02/2022 14:33:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_url
-- ----------------------------
DROP TABLE IF EXISTS `sys_url`;
CREATE TABLE `sys_url`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_url
-- ----------------------------
INSERT INTO `sys_url` VALUES (1, '/oem/');
INSERT INTO `sys_url` VALUES (2, '/oem/home');
INSERT INTO `sys_url` VALUES (3, '/oem/upload');
INSERT INTO `sys_url` VALUES (4, '/oem/mine');
INSERT INTO `sys_url` VALUES (5, '/oem/review');
INSERT INTO `sys_url` VALUES (6, '/oem/query-stu');
INSERT INTO `sys_url` VALUES (7, '/oem/work');
INSERT INTO `sys_url` VALUES (8, '/oem/work-add');
INSERT INTO `sys_url` VALUES (9, '/oem/student-management');
INSERT INTO `sys_url` VALUES (10, '/oem/teacher-management');
INSERT INTO `sys_url` VALUES (11, '/oem/import-stu');
INSERT INTO `sys_url` VALUES (12, '/oem/import-tea');
INSERT INTO `sys_url` VALUES (13, '/oem/password');
INSERT INTO `sys_url` VALUES (14, '/oem/logout');
INSERT INTO `sys_url` VALUES (15, '/oem/detail-stu');
INSERT INTO `sys_url` VALUES (16, '/oem/notice');
INSERT INTO `sys_url` VALUES (17, '/oem/subject');

-- ----------------------------
-- Table structure for sys_url_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_url_role`;
CREATE TABLE `sys_url_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `urlId` int(11) NOT NULL COMMENT 'urlId',
  `roleId` int(11) NOT NULL COMMENT '角色Id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_sys_url_role_sys_url_1`(`urlId`) USING BTREE,
  INDEX `fk_sys_url_role_t_role_1`(`roleId`) USING BTREE,
  CONSTRAINT `sys_url_role_ibfk_1` FOREIGN KEY (`urlId`) REFERENCES `sys_url` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_url_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'url角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_url_role
-- ----------------------------
INSERT INTO `sys_url_role` VALUES (1, 1, 1);
INSERT INTO `sys_url_role` VALUES (2, 2, 1);
INSERT INTO `sys_url_role` VALUES (3, 3, 1);
INSERT INTO `sys_url_role` VALUES (4, 4, 1);
INSERT INTO `sys_url_role` VALUES (5, 5, 1);
INSERT INTO `sys_url_role` VALUES (6, 6, 1);
INSERT INTO `sys_url_role` VALUES (7, 7, 1);
INSERT INTO `sys_url_role` VALUES (8, 8, 1);
INSERT INTO `sys_url_role` VALUES (9, 9, 1);
INSERT INTO `sys_url_role` VALUES (10, 10, 1);
INSERT INTO `sys_url_role` VALUES (11, 11, 1);
INSERT INTO `sys_url_role` VALUES (12, 12, 1);
INSERT INTO `sys_url_role` VALUES (13, 13, 1);
INSERT INTO `sys_url_role` VALUES (14, 14, 1);
INSERT INTO `sys_url_role` VALUES (15, 15, 1);
INSERT INTO `sys_url_role` VALUES (16, 16, 1);
INSERT INTO `sys_url_role` VALUES (17, 1, 2);
INSERT INTO `sys_url_role` VALUES (18, 2, 2);
INSERT INTO `sys_url_role` VALUES (19, 3, 2);
INSERT INTO `sys_url_role` VALUES (20, 4, 2);
INSERT INTO `sys_url_role` VALUES (21, 5, 2);
INSERT INTO `sys_url_role` VALUES (22, 6, 2);
INSERT INTO `sys_url_role` VALUES (23, 7, 2);
INSERT INTO `sys_url_role` VALUES (24, 8, 2);
INSERT INTO `sys_url_role` VALUES (25, 9, 2);
INSERT INTO `sys_url_role` VALUES (26, 11, 2);
INSERT INTO `sys_url_role` VALUES (27, 13, 2);
INSERT INTO `sys_url_role` VALUES (28, 14, 2);
INSERT INTO `sys_url_role` VALUES (29, 15, 2);
INSERT INTO `sys_url_role` VALUES (30, 16, 2);
INSERT INTO `sys_url_role` VALUES (31, 1, 3);
INSERT INTO `sys_url_role` VALUES (32, 2, 3);
INSERT INTO `sys_url_role` VALUES (33, 3, 3);
INSERT INTO `sys_url_role` VALUES (34, 4, 3);
INSERT INTO `sys_url_role` VALUES (35, 13, 3);
INSERT INTO `sys_url_role` VALUES (36, 14, 3);
INSERT INTO `sys_url_role` VALUES (37, 15, 3);
INSERT INTO `sys_url_role` VALUES (38, 17, 1);
INSERT INTO `sys_url_role` VALUES (39, 17, 2);
INSERT INTO `sys_url_role` VALUES (57, 17, 3);

-- ----------------------------
-- Table structure for t_class
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class`  (
  `id` int(11) NOT NULL COMMENT 'id',
  `className` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '班级名称',
  `classNo` int(11) NOT NULL DEFAULT 0 COMMENT '班号',
  `majorId` int(11) NOT NULL COMMENT '专业id',
  `gradeId` int(11) NOT NULL COMMENT '年级id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_t_class_t_grade_1`(`gradeId`) USING BTREE,
  INDEX `fk_t_class_t_major_1`(`majorId`) USING BTREE,
  CONSTRAINT `t_class_ibfk_1` FOREIGN KEY (`gradeId`) REFERENCES `t_grade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_class_ibfk_2` FOREIGN KEY (`majorId`) REFERENCES `t_major` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '班级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class` VALUES (1, '18电子信息工程1班', 1, 101, 2018);
INSERT INTO `t_class` VALUES (2, '18电子信息工程2班', 2, 101, 2018);
INSERT INTO `t_class` VALUES (3, '18电子信息工程3班', 3, 101, 2018);
INSERT INTO `t_class` VALUES (4, '18电子信息工程4班', 4, 101, 2018);
INSERT INTO `t_class` VALUES (5, '18电子信息工程5班', 5, 101, 2018);
INSERT INTO `t_class` VALUES (6, '18电子信息工程6班', 6, 101, 2018);
INSERT INTO `t_class` VALUES (7, '18电子信息工程7班', 7, 101, 2018);
INSERT INTO `t_class` VALUES (8, '18电子信息工程8班', 8, 101, 2018);
INSERT INTO `t_class` VALUES (9, '18电子科学与技术1班', 1, 102, 2018);
INSERT INTO `t_class` VALUES (10, '18电子科学与技术2班', 2, 102, 2018);
INSERT INTO `t_class` VALUES (11, '18电子科学与技术3班', 3, 102, 2018);
INSERT INTO `t_class` VALUES (12, '18电子科学与技术4班', 4, 102, 2018);
INSERT INTO `t_class` VALUES (13, '18电子科学与技术5班', 5, 102, 2018);
INSERT INTO `t_class` VALUES (14, '18电子科学与技术6班', 6, 102, 2018);
INSERT INTO `t_class` VALUES (15, '18电子科学与技术7班', 7, 102, 2018);
INSERT INTO `t_class` VALUES (16, '18电子科学与技术8班', 8, 102, 2018);
INSERT INTO `t_class` VALUES (17, '18自动化1班', 1, 103, 2018);
INSERT INTO `t_class` VALUES (18, '18自动化2班', 2, 103, 2018);
INSERT INTO `t_class` VALUES (19, '18自动化3班', 3, 103, 2018);
INSERT INTO `t_class` VALUES (20, '18自动化4班', 4, 103, 2018);
INSERT INTO `t_class` VALUES (21, '18自动化5班', 5, 103, 2018);
INSERT INTO `t_class` VALUES (22, '18自动化6班', 6, 103, 2018);
INSERT INTO `t_class` VALUES (23, '18自动化7班', 7, 103, 2018);
INSERT INTO `t_class` VALUES (24, '18自动化8班', 8, 103, 2018);
INSERT INTO `t_class` VALUES (25, '18计算机科学与技术1班', 1, 104, 2018);
INSERT INTO `t_class` VALUES (26, '18计算机科学与技术2班', 2, 104, 2018);
INSERT INTO `t_class` VALUES (27, '18计算机科学与技术3班', 3, 104, 2018);
INSERT INTO `t_class` VALUES (28, '18计算机科学与技术4班', 4, 104, 2018);
INSERT INTO `t_class` VALUES (29, '18计算机科学与技术5班', 5, 104, 2018);
INSERT INTO `t_class` VALUES (30, '18计算机科学与技术6班', 6, 104, 2018);
INSERT INTO `t_class` VALUES (31, '18计算机科学与技术7班', 7, 104, 2018);
INSERT INTO `t_class` VALUES (32, '18计算机科学与技术8班', 8, 104, 2018);
INSERT INTO `t_class` VALUES (33, '18软件工程1班', 1, 105, 2018);
INSERT INTO `t_class` VALUES (34, '18软件工程2班', 2, 105, 2018);
INSERT INTO `t_class` VALUES (35, '18软件工程3班', 3, 105, 2018);
INSERT INTO `t_class` VALUES (36, '18软件工程4班', 4, 105, 2018);
INSERT INTO `t_class` VALUES (37, '18软件工程5班', 5, 105, 2018);
INSERT INTO `t_class` VALUES (38, '18软件工程6班', 6, 105, 2018);
INSERT INTO `t_class` VALUES (39, '18软件工程7班', 7, 105, 2018);
INSERT INTO `t_class` VALUES (40, '18软件工程8班', 8, 105, 2018);
INSERT INTO `t_class` VALUES (41, '18计算机类1班', 1, 106, 2018);
INSERT INTO `t_class` VALUES (42, '18计算机类2班', 2, 106, 2018);
INSERT INTO `t_class` VALUES (43, '18计算机类3班', 3, 106, 2018);
INSERT INTO `t_class` VALUES (44, '18计算机类4班', 4, 106, 2018);
INSERT INTO `t_class` VALUES (45, '18计算机类5班', 5, 106, 2018);
INSERT INTO `t_class` VALUES (46, '18计算机类6班', 6, 106, 2018);
INSERT INTO `t_class` VALUES (47, '18计算机类7班', 7, 106, 2018);
INSERT INTO `t_class` VALUES (48, '18计算机类8班', 8, 106, 2018);
INSERT INTO `t_class` VALUES (49, '19电子信息工程1班', 1, 101, 2019);
INSERT INTO `t_class` VALUES (50, '19电子信息工程2班', 2, 101, 2019);
INSERT INTO `t_class` VALUES (51, '19电子信息工程3班', 3, 101, 2019);
INSERT INTO `t_class` VALUES (52, '19电子信息工程4班', 4, 101, 2019);
INSERT INTO `t_class` VALUES (53, '19电子信息工程5班', 5, 101, 2019);
INSERT INTO `t_class` VALUES (54, '19电子信息工程6班', 6, 101, 2019);
INSERT INTO `t_class` VALUES (55, '19电子信息工程7班', 7, 101, 2019);
INSERT INTO `t_class` VALUES (56, '19电子信息工程8班', 8, 101, 2019);
INSERT INTO `t_class` VALUES (57, '19电子科学与技术1班', 1, 102, 2019);
INSERT INTO `t_class` VALUES (58, '19电子科学与技术2班', 2, 102, 2019);
INSERT INTO `t_class` VALUES (59, '19电子科学与技术3班', 3, 102, 2019);
INSERT INTO `t_class` VALUES (60, '19电子科学与技术4班', 4, 102, 2019);
INSERT INTO `t_class` VALUES (61, '19电子科学与技术5班', 5, 102, 2019);
INSERT INTO `t_class` VALUES (62, '19电子科学与技术6班', 6, 102, 2019);
INSERT INTO `t_class` VALUES (63, '19电子科学与技术7班', 7, 102, 2019);
INSERT INTO `t_class` VALUES (64, '19电子科学与技术8班', 8, 102, 2019);
INSERT INTO `t_class` VALUES (65, '19自动化1班', 1, 103, 2019);
INSERT INTO `t_class` VALUES (66, '19自动化2班', 2, 103, 2019);
INSERT INTO `t_class` VALUES (67, '19自动化3班', 3, 103, 2019);
INSERT INTO `t_class` VALUES (68, '19自动化4班', 4, 103, 2019);
INSERT INTO `t_class` VALUES (69, '19自动化5班', 5, 103, 2019);
INSERT INTO `t_class` VALUES (70, '19自动化6班', 6, 103, 2019);
INSERT INTO `t_class` VALUES (71, '19自动化7班', 7, 103, 2019);
INSERT INTO `t_class` VALUES (72, '19自动化8班', 8, 103, 2019);
INSERT INTO `t_class` VALUES (73, '19计算机科学与技术1班', 1, 104, 2019);
INSERT INTO `t_class` VALUES (74, '19计算机科学与技术2班', 2, 104, 2019);
INSERT INTO `t_class` VALUES (75, '19计算机科学与技术3班', 3, 104, 2019);
INSERT INTO `t_class` VALUES (76, '19计算机科学与技术4班', 4, 104, 2019);
INSERT INTO `t_class` VALUES (77, '19计算机科学与技术5班', 5, 104, 2019);
INSERT INTO `t_class` VALUES (78, '19计算机科学与技术6班', 6, 104, 2019);
INSERT INTO `t_class` VALUES (79, '19计算机科学与技术7班', 7, 104, 2019);
INSERT INTO `t_class` VALUES (80, '19计算机科学与技术8班', 8, 104, 2019);
INSERT INTO `t_class` VALUES (81, '19软件工程1班', 1, 105, 2019);
INSERT INTO `t_class` VALUES (82, '19软件工程2班', 2, 105, 2019);
INSERT INTO `t_class` VALUES (83, '19软件工程3班', 3, 105, 2019);
INSERT INTO `t_class` VALUES (84, '19软件工程4班', 4, 105, 2019);
INSERT INTO `t_class` VALUES (85, '19软件工程5班', 5, 105, 2019);
INSERT INTO `t_class` VALUES (86, '19软件工程6班', 6, 105, 2019);
INSERT INTO `t_class` VALUES (87, '19软件工程7班', 7, 105, 2019);
INSERT INTO `t_class` VALUES (88, '19软件工程8班', 8, 105, 2019);
INSERT INTO `t_class` VALUES (89, '19计算机类1班', 1, 106, 2019);
INSERT INTO `t_class` VALUES (90, '19计算机类2班', 2, 106, 2019);
INSERT INTO `t_class` VALUES (91, '19计算机类3班', 3, 106, 2019);
INSERT INTO `t_class` VALUES (92, '19计算机类4班', 4, 106, 2019);
INSERT INTO `t_class` VALUES (93, '19计算机类5班', 5, 106, 2019);
INSERT INTO `t_class` VALUES (94, '19计算机类6班', 6, 106, 2019);
INSERT INTO `t_class` VALUES (95, '19计算机类7班', 7, 106, 2019);
INSERT INTO `t_class` VALUES (96, '19计算机类8班', 8, 106, 2019);
INSERT INTO `t_class` VALUES (97, '20电子信息工程1班', 1, 101, 2020);
INSERT INTO `t_class` VALUES (98, '20电子信息工程2班', 2, 101, 2020);
INSERT INTO `t_class` VALUES (99, '20电子信息工程3班', 3, 101, 2020);
INSERT INTO `t_class` VALUES (100, '20电子信息工程4班', 4, 101, 2020);
INSERT INTO `t_class` VALUES (101, '20电子信息工程5班', 5, 101, 2020);
INSERT INTO `t_class` VALUES (102, '20电子信息工程6班', 6, 101, 2020);
INSERT INTO `t_class` VALUES (103, '20电子信息工程7班', 7, 101, 2020);
INSERT INTO `t_class` VALUES (104, '20电子信息工程8班', 8, 101, 2020);
INSERT INTO `t_class` VALUES (105, '20电子科学与技术1班', 1, 102, 2020);
INSERT INTO `t_class` VALUES (106, '20电子科学与技术2班', 2, 102, 2020);
INSERT INTO `t_class` VALUES (107, '20电子科学与技术3班', 3, 102, 2020);
INSERT INTO `t_class` VALUES (108, '20电子科学与技术4班', 4, 102, 2020);
INSERT INTO `t_class` VALUES (109, '20电子科学与技术5班', 5, 102, 2020);
INSERT INTO `t_class` VALUES (110, '20电子科学与技术6班', 6, 102, 2020);
INSERT INTO `t_class` VALUES (111, '20电子科学与技术7班', 7, 102, 2020);
INSERT INTO `t_class` VALUES (112, '20电子科学与技术8班', 8, 102, 2020);
INSERT INTO `t_class` VALUES (113, '20自动化1班', 1, 103, 2020);
INSERT INTO `t_class` VALUES (114, '20自动化2班', 2, 103, 2020);
INSERT INTO `t_class` VALUES (115, '20自动化3班', 3, 103, 2020);
INSERT INTO `t_class` VALUES (116, '20自动化4班', 4, 103, 2020);
INSERT INTO `t_class` VALUES (117, '20自动化5班', 5, 103, 2020);
INSERT INTO `t_class` VALUES (118, '20自动化6班', 6, 103, 2020);
INSERT INTO `t_class` VALUES (119, '20自动化7班', 7, 103, 2020);
INSERT INTO `t_class` VALUES (120, '20自动化8班', 8, 103, 2020);
INSERT INTO `t_class` VALUES (121, '20计算机科学与技术1班', 1, 104, 2020);
INSERT INTO `t_class` VALUES (122, '20计算机科学与技术2班', 2, 104, 2020);
INSERT INTO `t_class` VALUES (123, '20计算机科学与技术3班', 3, 104, 2020);
INSERT INTO `t_class` VALUES (124, '20计算机科学与技术4班', 4, 104, 2020);
INSERT INTO `t_class` VALUES (125, '20计算机科学与技术5班', 5, 104, 2020);
INSERT INTO `t_class` VALUES (126, '20计算机科学与技术6班', 6, 104, 2020);
INSERT INTO `t_class` VALUES (127, '20计算机科学与技术7班', 7, 104, 2020);
INSERT INTO `t_class` VALUES (128, '20计算机科学与技术8班', 8, 104, 2020);
INSERT INTO `t_class` VALUES (129, '20软件工程1班', 1, 105, 2020);
INSERT INTO `t_class` VALUES (130, '20软件工程2班', 2, 105, 2020);
INSERT INTO `t_class` VALUES (131, '20软件工程3班', 3, 105, 2020);
INSERT INTO `t_class` VALUES (132, '20软件工程4班', 4, 105, 2020);
INSERT INTO `t_class` VALUES (133, '20软件工程5班', 5, 105, 2020);
INSERT INTO `t_class` VALUES (134, '20软件工程6班', 6, 105, 2020);
INSERT INTO `t_class` VALUES (135, '20软件工程7班', 7, 105, 2020);
INSERT INTO `t_class` VALUES (136, '20软件工程8班', 8, 105, 2020);
INSERT INTO `t_class` VALUES (137, '20计算机类1班', 1, 106, 2020);
INSERT INTO `t_class` VALUES (138, '20计算机类2班', 2, 106, 2020);
INSERT INTO `t_class` VALUES (139, '20计算机类3班', 3, 106, 2020);
INSERT INTO `t_class` VALUES (140, '20计算机类4班', 4, 106, 2020);
INSERT INTO `t_class` VALUES (141, '20计算机类5班', 5, 106, 2020);
INSERT INTO `t_class` VALUES (142, '20计算机类6班', 6, 106, 2020);
INSERT INTO `t_class` VALUES (143, '20计算机类7班', 7, 106, 2020);
INSERT INTO `t_class` VALUES (144, '20计算机类8班', 8, 106, 2020);
INSERT INTO `t_class` VALUES (145, '21电子信息工程1班', 1, 101, 2021);
INSERT INTO `t_class` VALUES (146, '21电子信息工程2班', 2, 101, 2021);
INSERT INTO `t_class` VALUES (147, '21电子信息工程3班', 3, 101, 2021);
INSERT INTO `t_class` VALUES (148, '21电子信息工程4班', 4, 101, 2021);
INSERT INTO `t_class` VALUES (149, '21电子信息工程5班', 5, 101, 2021);
INSERT INTO `t_class` VALUES (150, '21电子信息工程6班', 6, 101, 2021);
INSERT INTO `t_class` VALUES (151, '21电子信息工程7班', 7, 101, 2021);
INSERT INTO `t_class` VALUES (152, '21电子信息工程8班', 8, 101, 2021);
INSERT INTO `t_class` VALUES (153, '21电子科学与技术1班', 1, 102, 2021);
INSERT INTO `t_class` VALUES (154, '21电子科学与技术2班', 2, 102, 2021);
INSERT INTO `t_class` VALUES (155, '21电子科学与技术3班', 3, 102, 2021);
INSERT INTO `t_class` VALUES (156, '21电子科学与技术4班', 4, 102, 2021);
INSERT INTO `t_class` VALUES (157, '21电子科学与技术5班', 5, 102, 2021);
INSERT INTO `t_class` VALUES (158, '21电子科学与技术6班', 6, 102, 2021);
INSERT INTO `t_class` VALUES (159, '21电子科学与技术7班', 7, 102, 2021);
INSERT INTO `t_class` VALUES (160, '21电子科学与技术8班', 8, 102, 2021);
INSERT INTO `t_class` VALUES (161, '21自动化1班', 1, 103, 2021);
INSERT INTO `t_class` VALUES (162, '21自动化2班', 2, 103, 2021);
INSERT INTO `t_class` VALUES (163, '21自动化3班', 3, 103, 2021);
INSERT INTO `t_class` VALUES (164, '21自动化4班', 4, 103, 2021);
INSERT INTO `t_class` VALUES (165, '21自动化5班', 5, 103, 2021);
INSERT INTO `t_class` VALUES (166, '21自动化6班', 6, 103, 2021);
INSERT INTO `t_class` VALUES (167, '21自动化7班', 7, 103, 2021);
INSERT INTO `t_class` VALUES (168, '21自动化8班', 8, 103, 2021);
INSERT INTO `t_class` VALUES (169, '21计算机科学与技术1班', 1, 104, 2021);
INSERT INTO `t_class` VALUES (170, '21计算机科学与技术2班', 2, 104, 2021);
INSERT INTO `t_class` VALUES (171, '21计算机科学与技术3班', 3, 104, 2021);
INSERT INTO `t_class` VALUES (172, '21计算机科学与技术4班', 4, 104, 2021);
INSERT INTO `t_class` VALUES (173, '21计算机科学与技术5班', 5, 104, 2021);
INSERT INTO `t_class` VALUES (174, '21计算机科学与技术6班', 6, 104, 2021);
INSERT INTO `t_class` VALUES (175, '21计算机科学与技术7班', 7, 104, 2021);
INSERT INTO `t_class` VALUES (176, '21计算机科学与技术8班', 8, 104, 2021);
INSERT INTO `t_class` VALUES (177, '21软件工程1班', 1, 105, 2021);
INSERT INTO `t_class` VALUES (178, '21软件工程2班', 2, 105, 2021);
INSERT INTO `t_class` VALUES (179, '21软件工程3班', 3, 105, 2021);
INSERT INTO `t_class` VALUES (180, '21软件工程4班', 4, 105, 2021);
INSERT INTO `t_class` VALUES (181, '21软件工程5班', 5, 105, 2021);
INSERT INTO `t_class` VALUES (182, '21软件工程6班', 6, 105, 2021);
INSERT INTO `t_class` VALUES (183, '21软件工程7班', 7, 105, 2021);
INSERT INTO `t_class` VALUES (184, '21软件工程8班', 8, 105, 2021);
INSERT INTO `t_class` VALUES (185, '21计算机类1班', 1, 106, 2021);
INSERT INTO `t_class` VALUES (186, '21计算机类2班', 2, 106, 2021);
INSERT INTO `t_class` VALUES (187, '21计算机类3班', 3, 106, 2021);
INSERT INTO `t_class` VALUES (188, '21计算机类4班', 4, 106, 2021);
INSERT INTO `t_class` VALUES (189, '21计算机类5班', 5, 106, 2021);
INSERT INTO `t_class` VALUES (190, '21计算机类6班', 6, 106, 2021);
INSERT INTO `t_class` VALUES (191, '21计算机类7班', 7, 106, 2021);
INSERT INTO `t_class` VALUES (192, '21计算机类8班', 8, 106, 2021);
INSERT INTO `t_class` VALUES (193, '22电子信息工程1班', 1, 101, 2022);
INSERT INTO `t_class` VALUES (194, '22电子信息工程2班', 2, 101, 2022);
INSERT INTO `t_class` VALUES (195, '22电子信息工程3班', 3, 101, 2022);
INSERT INTO `t_class` VALUES (196, '22电子信息工程4班', 4, 101, 2022);
INSERT INTO `t_class` VALUES (197, '22电子信息工程5班', 5, 101, 2022);
INSERT INTO `t_class` VALUES (198, '22电子信息工程6班', 6, 101, 2022);
INSERT INTO `t_class` VALUES (199, '22电子信息工程7班', 7, 101, 2022);
INSERT INTO `t_class` VALUES (200, '22电子信息工程8班', 8, 101, 2022);
INSERT INTO `t_class` VALUES (201, '22电子科学与技术1班', 1, 102, 2022);
INSERT INTO `t_class` VALUES (202, '22电子科学与技术2班', 2, 102, 2022);
INSERT INTO `t_class` VALUES (203, '22电子科学与技术3班', 3, 102, 2022);
INSERT INTO `t_class` VALUES (204, '22电子科学与技术4班', 4, 102, 2022);
INSERT INTO `t_class` VALUES (205, '22电子科学与技术5班', 5, 102, 2022);
INSERT INTO `t_class` VALUES (206, '22电子科学与技术6班', 6, 102, 2022);
INSERT INTO `t_class` VALUES (207, '22电子科学与技术7班', 7, 102, 2022);
INSERT INTO `t_class` VALUES (208, '22电子科学与技术8班', 8, 102, 2022);
INSERT INTO `t_class` VALUES (209, '22自动化1班', 1, 103, 2022);
INSERT INTO `t_class` VALUES (210, '22自动化2班', 2, 103, 2022);
INSERT INTO `t_class` VALUES (211, '22自动化3班', 3, 103, 2022);
INSERT INTO `t_class` VALUES (212, '22自动化4班', 4, 103, 2022);
INSERT INTO `t_class` VALUES (213, '22自动化5班', 5, 103, 2022);
INSERT INTO `t_class` VALUES (214, '22自动化6班', 6, 103, 2022);
INSERT INTO `t_class` VALUES (215, '22自动化7班', 7, 103, 2022);
INSERT INTO `t_class` VALUES (216, '22自动化8班', 8, 103, 2022);
INSERT INTO `t_class` VALUES (217, '22计算机科学与技术1班', 1, 104, 2022);
INSERT INTO `t_class` VALUES (218, '22计算机科学与技术2班', 2, 104, 2022);
INSERT INTO `t_class` VALUES (219, '22计算机科学与技术3班', 3, 104, 2022);
INSERT INTO `t_class` VALUES (220, '22计算机科学与技术4班', 4, 104, 2022);
INSERT INTO `t_class` VALUES (221, '22计算机科学与技术5班', 5, 104, 2022);
INSERT INTO `t_class` VALUES (222, '22计算机科学与技术6班', 6, 104, 2022);
INSERT INTO `t_class` VALUES (223, '22计算机科学与技术7班', 7, 104, 2022);
INSERT INTO `t_class` VALUES (224, '22计算机科学与技术8班', 8, 104, 2022);
INSERT INTO `t_class` VALUES (225, '22软件工程1班', 1, 105, 2022);
INSERT INTO `t_class` VALUES (226, '22软件工程2班', 2, 105, 2022);
INSERT INTO `t_class` VALUES (227, '22软件工程3班', 3, 105, 2022);
INSERT INTO `t_class` VALUES (228, '22软件工程4班', 4, 105, 2022);
INSERT INTO `t_class` VALUES (229, '22软件工程5班', 5, 105, 2022);
INSERT INTO `t_class` VALUES (230, '22软件工程6班', 6, 105, 2022);
INSERT INTO `t_class` VALUES (231, '22软件工程7班', 7, 105, 2022);
INSERT INTO `t_class` VALUES (232, '22软件工程8班', 8, 105, 2022);
INSERT INTO `t_class` VALUES (233, '22计算机类1班', 1, 106, 2022);
INSERT INTO `t_class` VALUES (234, '22计算机类2班', 2, 106, 2022);
INSERT INTO `t_class` VALUES (235, '22计算机类3班', 3, 106, 2022);
INSERT INTO `t_class` VALUES (236, '22计算机类4班', 4, 106, 2022);
INSERT INTO `t_class` VALUES (237, '22计算机类5班', 5, 106, 2022);
INSERT INTO `t_class` VALUES (238, '22计算机类6班', 6, 106, 2022);
INSERT INTO `t_class` VALUES (239, '22计算机类7班', 7, 106, 2022);
INSERT INTO `t_class` VALUES (240, '22计算机类8班', 8, 106, 2022);
INSERT INTO `t_class` VALUES (241, '23电子信息工程1班', 1, 101, 2023);
INSERT INTO `t_class` VALUES (242, '23电子信息工程2班', 2, 101, 2023);
INSERT INTO `t_class` VALUES (243, '23电子信息工程3班', 3, 101, 2023);
INSERT INTO `t_class` VALUES (244, '23电子信息工程4班', 4, 101, 2023);
INSERT INTO `t_class` VALUES (245, '23电子信息工程5班', 5, 101, 2023);
INSERT INTO `t_class` VALUES (246, '23电子信息工程6班', 6, 101, 2023);
INSERT INTO `t_class` VALUES (247, '23电子信息工程7班', 7, 101, 2023);
INSERT INTO `t_class` VALUES (248, '23电子信息工程8班', 8, 101, 2023);
INSERT INTO `t_class` VALUES (249, '23电子科学与技术1班', 1, 102, 2023);
INSERT INTO `t_class` VALUES (250, '23电子科学与技术2班', 2, 102, 2023);
INSERT INTO `t_class` VALUES (251, '23电子科学与技术3班', 3, 102, 2023);
INSERT INTO `t_class` VALUES (252, '23电子科学与技术4班', 4, 102, 2023);
INSERT INTO `t_class` VALUES (253, '23电子科学与技术5班', 5, 102, 2023);
INSERT INTO `t_class` VALUES (254, '23电子科学与技术6班', 6, 102, 2023);
INSERT INTO `t_class` VALUES (255, '23电子科学与技术7班', 7, 102, 2023);
INSERT INTO `t_class` VALUES (256, '23电子科学与技术8班', 8, 102, 2023);
INSERT INTO `t_class` VALUES (257, '23自动化1班', 1, 103, 2023);
INSERT INTO `t_class` VALUES (258, '23自动化2班', 2, 103, 2023);
INSERT INTO `t_class` VALUES (259, '23自动化3班', 3, 103, 2023);
INSERT INTO `t_class` VALUES (260, '23自动化4班', 4, 103, 2023);
INSERT INTO `t_class` VALUES (261, '23自动化5班', 5, 103, 2023);
INSERT INTO `t_class` VALUES (262, '23自动化6班', 6, 103, 2023);
INSERT INTO `t_class` VALUES (263, '23自动化7班', 7, 103, 2023);
INSERT INTO `t_class` VALUES (264, '23自动化8班', 8, 103, 2023);
INSERT INTO `t_class` VALUES (265, '23计算机科学与技术1班', 1, 104, 2023);
INSERT INTO `t_class` VALUES (266, '23计算机科学与技术2班', 2, 104, 2023);
INSERT INTO `t_class` VALUES (267, '23计算机科学与技术3班', 3, 104, 2023);
INSERT INTO `t_class` VALUES (268, '23计算机科学与技术4班', 4, 104, 2023);
INSERT INTO `t_class` VALUES (269, '23计算机科学与技术5班', 5, 104, 2023);
INSERT INTO `t_class` VALUES (270, '23计算机科学与技术6班', 6, 104, 2023);
INSERT INTO `t_class` VALUES (271, '23计算机科学与技术7班', 7, 104, 2023);
INSERT INTO `t_class` VALUES (272, '23计算机科学与技术8班', 8, 104, 2023);
INSERT INTO `t_class` VALUES (273, '23软件工程1班', 1, 105, 2023);
INSERT INTO `t_class` VALUES (274, '23软件工程2班', 2, 105, 2023);
INSERT INTO `t_class` VALUES (275, '23软件工程3班', 3, 105, 2023);
INSERT INTO `t_class` VALUES (276, '23软件工程4班', 4, 105, 2023);
INSERT INTO `t_class` VALUES (277, '23软件工程5班', 5, 105, 2023);
INSERT INTO `t_class` VALUES (278, '23软件工程6班', 6, 105, 2023);
INSERT INTO `t_class` VALUES (279, '23软件工程7班', 7, 105, 2023);
INSERT INTO `t_class` VALUES (280, '23软件工程8班', 8, 105, 2023);
INSERT INTO `t_class` VALUES (281, '23计算机类1班', 1, 106, 2023);
INSERT INTO `t_class` VALUES (282, '23计算机类2班', 2, 106, 2023);
INSERT INTO `t_class` VALUES (283, '23计算机类3班', 3, 106, 2023);
INSERT INTO `t_class` VALUES (284, '23计算机类4班', 4, 106, 2023);
INSERT INTO `t_class` VALUES (285, '23计算机类5班', 5, 106, 2023);
INSERT INTO `t_class` VALUES (286, '23计算机类6班', 6, 106, 2023);
INSERT INTO `t_class` VALUES (287, '23计算机类7班', 7, 106, 2023);
INSERT INTO `t_class` VALUES (288, '23计算机类8班', 8, 106, 2023);
INSERT INTO `t_class` VALUES (289, '24电子信息工程1班', 1, 101, 2024);
INSERT INTO `t_class` VALUES (290, '24电子信息工程2班', 2, 101, 2024);
INSERT INTO `t_class` VALUES (291, '24电子信息工程3班', 3, 101, 2024);
INSERT INTO `t_class` VALUES (292, '24电子信息工程4班', 4, 101, 2024);
INSERT INTO `t_class` VALUES (293, '24电子信息工程5班', 5, 101, 2024);
INSERT INTO `t_class` VALUES (294, '24电子信息工程6班', 6, 101, 2024);
INSERT INTO `t_class` VALUES (295, '24电子信息工程7班', 7, 101, 2024);
INSERT INTO `t_class` VALUES (296, '24电子信息工程8班', 8, 101, 2024);
INSERT INTO `t_class` VALUES (297, '24电子科学与技术1班', 1, 102, 2024);
INSERT INTO `t_class` VALUES (298, '24电子科学与技术2班', 2, 102, 2024);
INSERT INTO `t_class` VALUES (299, '24电子科学与技术3班', 3, 102, 2024);
INSERT INTO `t_class` VALUES (300, '24电子科学与技术4班', 4, 102, 2024);
INSERT INTO `t_class` VALUES (301, '24电子科学与技术5班', 5, 102, 2024);
INSERT INTO `t_class` VALUES (302, '24电子科学与技术6班', 6, 102, 2024);
INSERT INTO `t_class` VALUES (303, '24电子科学与技术7班', 7, 102, 2024);
INSERT INTO `t_class` VALUES (304, '24电子科学与技术8班', 8, 102, 2024);
INSERT INTO `t_class` VALUES (305, '24自动化1班', 1, 103, 2024);
INSERT INTO `t_class` VALUES (306, '24自动化2班', 2, 103, 2024);
INSERT INTO `t_class` VALUES (307, '24自动化3班', 3, 103, 2024);
INSERT INTO `t_class` VALUES (308, '24自动化4班', 4, 103, 2024);
INSERT INTO `t_class` VALUES (309, '24自动化5班', 5, 103, 2024);
INSERT INTO `t_class` VALUES (310, '24自动化6班', 6, 103, 2024);
INSERT INTO `t_class` VALUES (311, '24自动化7班', 7, 103, 2024);
INSERT INTO `t_class` VALUES (312, '24自动化8班', 8, 103, 2024);
INSERT INTO `t_class` VALUES (313, '24计算机科学与技术1班', 1, 104, 2024);
INSERT INTO `t_class` VALUES (314, '24计算机科学与技术2班', 2, 104, 2024);
INSERT INTO `t_class` VALUES (315, '24计算机科学与技术3班', 3, 104, 2024);
INSERT INTO `t_class` VALUES (316, '24计算机科学与技术4班', 4, 104, 2024);
INSERT INTO `t_class` VALUES (317, '24计算机科学与技术5班', 5, 104, 2024);
INSERT INTO `t_class` VALUES (318, '24计算机科学与技术6班', 6, 104, 2024);
INSERT INTO `t_class` VALUES (319, '24计算机科学与技术7班', 7, 104, 2024);
INSERT INTO `t_class` VALUES (320, '24计算机科学与技术8班', 8, 104, 2024);
INSERT INTO `t_class` VALUES (321, '24软件工程1班', 1, 105, 2024);
INSERT INTO `t_class` VALUES (322, '24软件工程2班', 2, 105, 2024);
INSERT INTO `t_class` VALUES (323, '24软件工程3班', 3, 105, 2024);
INSERT INTO `t_class` VALUES (324, '24软件工程4班', 4, 105, 2024);
INSERT INTO `t_class` VALUES (325, '24软件工程5班', 5, 105, 2024);
INSERT INTO `t_class` VALUES (326, '24软件工程6班', 6, 105, 2024);
INSERT INTO `t_class` VALUES (327, '24软件工程7班', 7, 105, 2024);
INSERT INTO `t_class` VALUES (328, '24软件工程8班', 8, 105, 2024);
INSERT INTO `t_class` VALUES (329, '24计算机类1班', 1, 106, 2024);
INSERT INTO `t_class` VALUES (330, '24计算机类2班', 2, 106, 2024);
INSERT INTO `t_class` VALUES (331, '24计算机类3班', 3, 106, 2024);
INSERT INTO `t_class` VALUES (332, '24计算机类4班', 4, 106, 2024);
INSERT INTO `t_class` VALUES (333, '24计算机类5班', 5, 106, 2024);
INSERT INTO `t_class` VALUES (334, '24计算机类6班', 6, 106, 2024);
INSERT INTO `t_class` VALUES (335, '24计算机类7班', 7, 106, 2024);
INSERT INTO `t_class` VALUES (336, '24计算机类8班', 8, 106, 2024);
INSERT INTO `t_class` VALUES (337, '25电子信息工程1班', 1, 101, 2025);
INSERT INTO `t_class` VALUES (338, '25电子信息工程2班', 2, 101, 2025);
INSERT INTO `t_class` VALUES (339, '25电子信息工程3班', 3, 101, 2025);
INSERT INTO `t_class` VALUES (340, '25电子信息工程4班', 4, 101, 2025);
INSERT INTO `t_class` VALUES (341, '25电子信息工程5班', 5, 101, 2025);
INSERT INTO `t_class` VALUES (342, '25电子信息工程6班', 6, 101, 2025);
INSERT INTO `t_class` VALUES (343, '25电子信息工程7班', 7, 101, 2025);
INSERT INTO `t_class` VALUES (344, '25电子信息工程8班', 8, 101, 2025);
INSERT INTO `t_class` VALUES (345, '25电子科学与技术1班', 1, 102, 2025);
INSERT INTO `t_class` VALUES (346, '25电子科学与技术2班', 2, 102, 2025);
INSERT INTO `t_class` VALUES (347, '25电子科学与技术3班', 3, 102, 2025);
INSERT INTO `t_class` VALUES (348, '25电子科学与技术4班', 4, 102, 2025);
INSERT INTO `t_class` VALUES (349, '25电子科学与技术5班', 5, 102, 2025);
INSERT INTO `t_class` VALUES (350, '25电子科学与技术6班', 6, 102, 2025);
INSERT INTO `t_class` VALUES (351, '25电子科学与技术7班', 7, 102, 2025);
INSERT INTO `t_class` VALUES (352, '25电子科学与技术8班', 8, 102, 2025);
INSERT INTO `t_class` VALUES (353, '25自动化1班', 1, 103, 2025);
INSERT INTO `t_class` VALUES (354, '25自动化2班', 2, 103, 2025);
INSERT INTO `t_class` VALUES (355, '25自动化3班', 3, 103, 2025);
INSERT INTO `t_class` VALUES (356, '25自动化4班', 4, 103, 2025);
INSERT INTO `t_class` VALUES (357, '25自动化5班', 5, 103, 2025);
INSERT INTO `t_class` VALUES (358, '25自动化6班', 6, 103, 2025);
INSERT INTO `t_class` VALUES (359, '25自动化7班', 7, 103, 2025);
INSERT INTO `t_class` VALUES (360, '25自动化8班', 8, 103, 2025);
INSERT INTO `t_class` VALUES (361, '25计算机科学与技术1班', 1, 104, 2025);
INSERT INTO `t_class` VALUES (362, '25计算机科学与技术2班', 2, 104, 2025);
INSERT INTO `t_class` VALUES (363, '25计算机科学与技术3班', 3, 104, 2025);
INSERT INTO `t_class` VALUES (364, '25计算机科学与技术4班', 4, 104, 2025);
INSERT INTO `t_class` VALUES (365, '25计算机科学与技术5班', 5, 104, 2025);
INSERT INTO `t_class` VALUES (366, '25计算机科学与技术6班', 6, 104, 2025);
INSERT INTO `t_class` VALUES (367, '25计算机科学与技术7班', 7, 104, 2025);
INSERT INTO `t_class` VALUES (368, '25计算机科学与技术8班', 8, 104, 2025);
INSERT INTO `t_class` VALUES (369, '25软件工程1班', 1, 105, 2025);
INSERT INTO `t_class` VALUES (370, '25软件工程2班', 2, 105, 2025);
INSERT INTO `t_class` VALUES (371, '25软件工程3班', 3, 105, 2025);
INSERT INTO `t_class` VALUES (372, '25软件工程4班', 4, 105, 2025);
INSERT INTO `t_class` VALUES (373, '25软件工程5班', 5, 105, 2025);
INSERT INTO `t_class` VALUES (374, '25软件工程6班', 6, 105, 2025);
INSERT INTO `t_class` VALUES (375, '25软件工程7班', 7, 105, 2025);
INSERT INTO `t_class` VALUES (376, '25软件工程8班', 8, 105, 2025);
INSERT INTO `t_class` VALUES (377, '25计算机类1班', 1, 106, 2025);
INSERT INTO `t_class` VALUES (378, '25计算机类2班', 2, 106, 2025);
INSERT INTO `t_class` VALUES (379, '25计算机类3班', 3, 106, 2025);
INSERT INTO `t_class` VALUES (380, '25计算机类4班', 4, 106, 2025);
INSERT INTO `t_class` VALUES (381, '25计算机类5班', 5, 106, 2025);
INSERT INTO `t_class` VALUES (382, '25计算机类6班', 6, 106, 2025);
INSERT INTO `t_class` VALUES (383, '25计算机类7班', 7, 106, 2025);
INSERT INTO `t_class` VALUES (384, '25计算机类8班', 8, 106, 2025);
INSERT INTO `t_class` VALUES (385, '26电子信息工程1班', 1, 101, 2026);
INSERT INTO `t_class` VALUES (386, '26电子信息工程2班', 2, 101, 2026);
INSERT INTO `t_class` VALUES (387, '26电子信息工程3班', 3, 101, 2026);
INSERT INTO `t_class` VALUES (388, '26电子信息工程4班', 4, 101, 2026);
INSERT INTO `t_class` VALUES (389, '26电子信息工程5班', 5, 101, 2026);
INSERT INTO `t_class` VALUES (390, '26电子信息工程6班', 6, 101, 2026);
INSERT INTO `t_class` VALUES (391, '26电子信息工程7班', 7, 101, 2026);
INSERT INTO `t_class` VALUES (392, '26电子信息工程8班', 8, 101, 2026);
INSERT INTO `t_class` VALUES (393, '26电子科学与技术1班', 1, 102, 2026);
INSERT INTO `t_class` VALUES (394, '26电子科学与技术2班', 2, 102, 2026);
INSERT INTO `t_class` VALUES (395, '26电子科学与技术3班', 3, 102, 2026);
INSERT INTO `t_class` VALUES (396, '26电子科学与技术4班', 4, 102, 2026);
INSERT INTO `t_class` VALUES (397, '26电子科学与技术5班', 5, 102, 2026);
INSERT INTO `t_class` VALUES (398, '26电子科学与技术6班', 6, 102, 2026);
INSERT INTO `t_class` VALUES (399, '26电子科学与技术7班', 7, 102, 2026);
INSERT INTO `t_class` VALUES (400, '26电子科学与技术8班', 8, 102, 2026);
INSERT INTO `t_class` VALUES (401, '26自动化1班', 1, 103, 2026);
INSERT INTO `t_class` VALUES (402, '26自动化2班', 2, 103, 2026);
INSERT INTO `t_class` VALUES (403, '26自动化3班', 3, 103, 2026);
INSERT INTO `t_class` VALUES (404, '26自动化4班', 4, 103, 2026);
INSERT INTO `t_class` VALUES (405, '26自动化5班', 5, 103, 2026);
INSERT INTO `t_class` VALUES (406, '26自动化6班', 6, 103, 2026);
INSERT INTO `t_class` VALUES (407, '26自动化7班', 7, 103, 2026);
INSERT INTO `t_class` VALUES (408, '26自动化8班', 8, 103, 2026);
INSERT INTO `t_class` VALUES (409, '26计算机科学与技术1班', 1, 104, 2026);
INSERT INTO `t_class` VALUES (410, '26计算机科学与技术2班', 2, 104, 2026);
INSERT INTO `t_class` VALUES (411, '26计算机科学与技术3班', 3, 104, 2026);
INSERT INTO `t_class` VALUES (412, '26计算机科学与技术4班', 4, 104, 2026);
INSERT INTO `t_class` VALUES (413, '26计算机科学与技术5班', 5, 104, 2026);
INSERT INTO `t_class` VALUES (414, '26计算机科学与技术6班', 6, 104, 2026);
INSERT INTO `t_class` VALUES (415, '26计算机科学与技术7班', 7, 104, 2026);
INSERT INTO `t_class` VALUES (416, '26计算机科学与技术8班', 8, 104, 2026);
INSERT INTO `t_class` VALUES (417, '26软件工程1班', 1, 105, 2026);
INSERT INTO `t_class` VALUES (418, '26软件工程2班', 2, 105, 2026);
INSERT INTO `t_class` VALUES (419, '26软件工程3班', 3, 105, 2026);
INSERT INTO `t_class` VALUES (420, '26软件工程4班', 4, 105, 2026);
INSERT INTO `t_class` VALUES (421, '26软件工程5班', 5, 105, 2026);
INSERT INTO `t_class` VALUES (422, '26软件工程6班', 6, 105, 2026);
INSERT INTO `t_class` VALUES (423, '26软件工程7班', 7, 105, 2026);
INSERT INTO `t_class` VALUES (424, '26软件工程8班', 8, 105, 2026);
INSERT INTO `t_class` VALUES (425, '26计算机类1班', 1, 106, 2026);
INSERT INTO `t_class` VALUES (426, '26计算机类2班', 2, 106, 2026);
INSERT INTO `t_class` VALUES (427, '26计算机类3班', 3, 106, 2026);
INSERT INTO `t_class` VALUES (428, '26计算机类4班', 4, 106, 2026);
INSERT INTO `t_class` VALUES (429, '26计算机类5班', 5, 106, 2026);
INSERT INTO `t_class` VALUES (430, '26计算机类6班', 6, 106, 2026);
INSERT INTO `t_class` VALUES (431, '26计算机类7班', 7, 106, 2026);
INSERT INTO `t_class` VALUES (432, '26计算机类8班', 8, 106, 2026);
INSERT INTO `t_class` VALUES (433, '27电子信息工程1班', 1, 101, 2027);
INSERT INTO `t_class` VALUES (434, '27电子信息工程2班', 2, 101, 2027);
INSERT INTO `t_class` VALUES (435, '27电子信息工程3班', 3, 101, 2027);
INSERT INTO `t_class` VALUES (436, '27电子信息工程4班', 4, 101, 2027);
INSERT INTO `t_class` VALUES (437, '27电子信息工程5班', 5, 101, 2027);
INSERT INTO `t_class` VALUES (438, '27电子信息工程6班', 6, 101, 2027);
INSERT INTO `t_class` VALUES (439, '27电子信息工程7班', 7, 101, 2027);
INSERT INTO `t_class` VALUES (440, '27电子信息工程8班', 8, 101, 2027);
INSERT INTO `t_class` VALUES (441, '27电子科学与技术1班', 1, 102, 2027);
INSERT INTO `t_class` VALUES (442, '27电子科学与技术2班', 2, 102, 2027);
INSERT INTO `t_class` VALUES (443, '27电子科学与技术3班', 3, 102, 2027);
INSERT INTO `t_class` VALUES (444, '27电子科学与技术4班', 4, 102, 2027);
INSERT INTO `t_class` VALUES (445, '27电子科学与技术5班', 5, 102, 2027);
INSERT INTO `t_class` VALUES (446, '27电子科学与技术6班', 6, 102, 2027);
INSERT INTO `t_class` VALUES (447, '27电子科学与技术7班', 7, 102, 2027);
INSERT INTO `t_class` VALUES (448, '27电子科学与技术8班', 8, 102, 2027);
INSERT INTO `t_class` VALUES (449, '27自动化1班', 1, 103, 2027);
INSERT INTO `t_class` VALUES (450, '27自动化2班', 2, 103, 2027);
INSERT INTO `t_class` VALUES (451, '27自动化3班', 3, 103, 2027);
INSERT INTO `t_class` VALUES (452, '27自动化4班', 4, 103, 2027);
INSERT INTO `t_class` VALUES (453, '27自动化5班', 5, 103, 2027);
INSERT INTO `t_class` VALUES (454, '27自动化6班', 6, 103, 2027);
INSERT INTO `t_class` VALUES (455, '27自动化7班', 7, 103, 2027);
INSERT INTO `t_class` VALUES (456, '27自动化8班', 8, 103, 2027);
INSERT INTO `t_class` VALUES (457, '27计算机科学与技术1班', 1, 104, 2027);
INSERT INTO `t_class` VALUES (458, '27计算机科学与技术2班', 2, 104, 2027);
INSERT INTO `t_class` VALUES (459, '27计算机科学与技术3班', 3, 104, 2027);
INSERT INTO `t_class` VALUES (460, '27计算机科学与技术4班', 4, 104, 2027);
INSERT INTO `t_class` VALUES (461, '27计算机科学与技术5班', 5, 104, 2027);
INSERT INTO `t_class` VALUES (462, '27计算机科学与技术6班', 6, 104, 2027);
INSERT INTO `t_class` VALUES (463, '27计算机科学与技术7班', 7, 104, 2027);
INSERT INTO `t_class` VALUES (464, '27计算机科学与技术8班', 8, 104, 2027);
INSERT INTO `t_class` VALUES (465, '27软件工程1班', 1, 105, 2027);
INSERT INTO `t_class` VALUES (466, '27软件工程2班', 2, 105, 2027);
INSERT INTO `t_class` VALUES (467, '27软件工程3班', 3, 105, 2027);
INSERT INTO `t_class` VALUES (468, '27软件工程4班', 4, 105, 2027);
INSERT INTO `t_class` VALUES (469, '27软件工程5班', 5, 105, 2027);
INSERT INTO `t_class` VALUES (470, '27软件工程6班', 6, 105, 2027);
INSERT INTO `t_class` VALUES (471, '27软件工程7班', 7, 105, 2027);
INSERT INTO `t_class` VALUES (472, '27软件工程8班', 8, 105, 2027);
INSERT INTO `t_class` VALUES (473, '27计算机类1班', 1, 106, 2027);
INSERT INTO `t_class` VALUES (474, '27计算机类2班', 2, 106, 2027);
INSERT INTO `t_class` VALUES (475, '27计算机类3班', 3, 106, 2027);
INSERT INTO `t_class` VALUES (476, '27计算机类4班', 4, 106, 2027);
INSERT INTO `t_class` VALUES (477, '27计算机类5班', 5, 106, 2027);
INSERT INTO `t_class` VALUES (478, '27计算机类6班', 6, 106, 2027);
INSERT INTO `t_class` VALUES (479, '27计算机类7班', 7, 106, 2027);
INSERT INTO `t_class` VALUES (480, '27计算机类8班', 8, 106, 2027);
INSERT INTO `t_class` VALUES (481, '28电子信息工程1班', 1, 101, 2028);
INSERT INTO `t_class` VALUES (482, '28电子信息工程2班', 2, 101, 2028);
INSERT INTO `t_class` VALUES (483, '28电子信息工程3班', 3, 101, 2028);
INSERT INTO `t_class` VALUES (484, '28电子信息工程4班', 4, 101, 2028);
INSERT INTO `t_class` VALUES (485, '28电子信息工程5班', 5, 101, 2028);
INSERT INTO `t_class` VALUES (486, '28电子信息工程6班', 6, 101, 2028);
INSERT INTO `t_class` VALUES (487, '28电子信息工程7班', 7, 101, 2028);
INSERT INTO `t_class` VALUES (488, '28电子信息工程8班', 8, 101, 2028);
INSERT INTO `t_class` VALUES (489, '28电子科学与技术1班', 1, 102, 2028);
INSERT INTO `t_class` VALUES (490, '28电子科学与技术2班', 2, 102, 2028);
INSERT INTO `t_class` VALUES (491, '28电子科学与技术3班', 3, 102, 2028);
INSERT INTO `t_class` VALUES (492, '28电子科学与技术4班', 4, 102, 2028);
INSERT INTO `t_class` VALUES (493, '28电子科学与技术5班', 5, 102, 2028);
INSERT INTO `t_class` VALUES (494, '28电子科学与技术6班', 6, 102, 2028);
INSERT INTO `t_class` VALUES (495, '28电子科学与技术7班', 7, 102, 2028);
INSERT INTO `t_class` VALUES (496, '28电子科学与技术8班', 8, 102, 2028);
INSERT INTO `t_class` VALUES (497, '28自动化1班', 1, 103, 2028);
INSERT INTO `t_class` VALUES (498, '28自动化2班', 2, 103, 2028);
INSERT INTO `t_class` VALUES (499, '28自动化3班', 3, 103, 2028);
INSERT INTO `t_class` VALUES (500, '28自动化4班', 4, 103, 2028);
INSERT INTO `t_class` VALUES (501, '28自动化5班', 5, 103, 2028);
INSERT INTO `t_class` VALUES (502, '28自动化6班', 6, 103, 2028);
INSERT INTO `t_class` VALUES (503, '28自动化7班', 7, 103, 2028);
INSERT INTO `t_class` VALUES (504, '28自动化8班', 8, 103, 2028);
INSERT INTO `t_class` VALUES (505, '28计算机科学与技术1班', 1, 104, 2028);
INSERT INTO `t_class` VALUES (506, '28计算机科学与技术2班', 2, 104, 2028);
INSERT INTO `t_class` VALUES (507, '28计算机科学与技术3班', 3, 104, 2028);
INSERT INTO `t_class` VALUES (508, '28计算机科学与技术4班', 4, 104, 2028);
INSERT INTO `t_class` VALUES (509, '28计算机科学与技术5班', 5, 104, 2028);
INSERT INTO `t_class` VALUES (510, '28计算机科学与技术6班', 6, 104, 2028);
INSERT INTO `t_class` VALUES (511, '28计算机科学与技术7班', 7, 104, 2028);
INSERT INTO `t_class` VALUES (512, '28计算机科学与技术8班', 8, 104, 2028);
INSERT INTO `t_class` VALUES (513, '28软件工程1班', 1, 105, 2028);
INSERT INTO `t_class` VALUES (514, '28软件工程2班', 2, 105, 2028);
INSERT INTO `t_class` VALUES (515, '28软件工程3班', 3, 105, 2028);
INSERT INTO `t_class` VALUES (516, '28软件工程4班', 4, 105, 2028);
INSERT INTO `t_class` VALUES (517, '28软件工程5班', 5, 105, 2028);
INSERT INTO `t_class` VALUES (518, '28软件工程6班', 6, 105, 2028);
INSERT INTO `t_class` VALUES (519, '28软件工程7班', 7, 105, 2028);
INSERT INTO `t_class` VALUES (520, '28软件工程8班', 8, 105, 2028);
INSERT INTO `t_class` VALUES (521, '28计算机类1班', 1, 106, 2028);
INSERT INTO `t_class` VALUES (522, '28计算机类2班', 2, 106, 2028);
INSERT INTO `t_class` VALUES (523, '28计算机类3班', 3, 106, 2028);
INSERT INTO `t_class` VALUES (524, '28计算机类4班', 4, 106, 2028);
INSERT INTO `t_class` VALUES (525, '28计算机类5班', 5, 106, 2028);
INSERT INTO `t_class` VALUES (526, '28计算机类6班', 6, 106, 2028);
INSERT INTO `t_class` VALUES (527, '28计算机类7班', 7, 106, 2028);
INSERT INTO `t_class` VALUES (528, '28计算机类8班', 8, 106, 2028);
INSERT INTO `t_class` VALUES (529, '29电子信息工程1班', 1, 101, 2029);
INSERT INTO `t_class` VALUES (530, '29电子信息工程2班', 2, 101, 2029);
INSERT INTO `t_class` VALUES (531, '29电子信息工程3班', 3, 101, 2029);
INSERT INTO `t_class` VALUES (532, '29电子信息工程4班', 4, 101, 2029);
INSERT INTO `t_class` VALUES (533, '29电子信息工程5班', 5, 101, 2029);
INSERT INTO `t_class` VALUES (534, '29电子信息工程6班', 6, 101, 2029);
INSERT INTO `t_class` VALUES (535, '29电子信息工程7班', 7, 101, 2029);
INSERT INTO `t_class` VALUES (536, '29电子信息工程8班', 8, 101, 2029);
INSERT INTO `t_class` VALUES (537, '29电子科学与技术1班', 1, 102, 2029);
INSERT INTO `t_class` VALUES (538, '29电子科学与技术2班', 2, 102, 2029);
INSERT INTO `t_class` VALUES (539, '29电子科学与技术3班', 3, 102, 2029);
INSERT INTO `t_class` VALUES (540, '29电子科学与技术4班', 4, 102, 2029);
INSERT INTO `t_class` VALUES (541, '29电子科学与技术5班', 5, 102, 2029);
INSERT INTO `t_class` VALUES (542, '29电子科学与技术6班', 6, 102, 2029);
INSERT INTO `t_class` VALUES (543, '29电子科学与技术7班', 7, 102, 2029);
INSERT INTO `t_class` VALUES (544, '29电子科学与技术8班', 8, 102, 2029);
INSERT INTO `t_class` VALUES (545, '29自动化1班', 1, 103, 2029);
INSERT INTO `t_class` VALUES (546, '29自动化2班', 2, 103, 2029);
INSERT INTO `t_class` VALUES (547, '29自动化3班', 3, 103, 2029);
INSERT INTO `t_class` VALUES (548, '29自动化4班', 4, 103, 2029);
INSERT INTO `t_class` VALUES (549, '29自动化5班', 5, 103, 2029);
INSERT INTO `t_class` VALUES (550, '29自动化6班', 6, 103, 2029);
INSERT INTO `t_class` VALUES (551, '29自动化7班', 7, 103, 2029);
INSERT INTO `t_class` VALUES (552, '29自动化8班', 8, 103, 2029);
INSERT INTO `t_class` VALUES (553, '29计算机科学与技术1班', 1, 104, 2029);
INSERT INTO `t_class` VALUES (554, '29计算机科学与技术2班', 2, 104, 2029);
INSERT INTO `t_class` VALUES (555, '29计算机科学与技术3班', 3, 104, 2029);
INSERT INTO `t_class` VALUES (556, '29计算机科学与技术4班', 4, 104, 2029);
INSERT INTO `t_class` VALUES (557, '29计算机科学与技术5班', 5, 104, 2029);
INSERT INTO `t_class` VALUES (558, '29计算机科学与技术6班', 6, 104, 2029);
INSERT INTO `t_class` VALUES (559, '29计算机科学与技术7班', 7, 104, 2029);
INSERT INTO `t_class` VALUES (560, '29计算机科学与技术8班', 8, 104, 2029);
INSERT INTO `t_class` VALUES (561, '29软件工程1班', 1, 105, 2029);
INSERT INTO `t_class` VALUES (562, '29软件工程2班', 2, 105, 2029);
INSERT INTO `t_class` VALUES (563, '29软件工程3班', 3, 105, 2029);
INSERT INTO `t_class` VALUES (564, '29软件工程4班', 4, 105, 2029);
INSERT INTO `t_class` VALUES (565, '29软件工程5班', 5, 105, 2029);
INSERT INTO `t_class` VALUES (566, '29软件工程6班', 6, 105, 2029);
INSERT INTO `t_class` VALUES (567, '29软件工程7班', 7, 105, 2029);
INSERT INTO `t_class` VALUES (568, '29软件工程8班', 8, 105, 2029);
INSERT INTO `t_class` VALUES (569, '29计算机类1班', 1, 106, 2029);
INSERT INTO `t_class` VALUES (570, '29计算机类2班', 2, 106, 2029);
INSERT INTO `t_class` VALUES (571, '29计算机类3班', 3, 106, 2029);
INSERT INTO `t_class` VALUES (572, '29计算机类4班', 4, 106, 2029);
INSERT INTO `t_class` VALUES (573, '29计算机类5班', 5, 106, 2029);
INSERT INTO `t_class` VALUES (574, '29计算机类6班', 6, 106, 2029);
INSERT INTO `t_class` VALUES (575, '29计算机类7班', 7, 106, 2029);
INSERT INTO `t_class` VALUES (576, '29计算机类8班', 8, 106, 2029);
INSERT INTO `t_class` VALUES (577, '30电子信息工程1班', 1, 101, 2030);
INSERT INTO `t_class` VALUES (578, '30电子信息工程2班', 2, 101, 2030);
INSERT INTO `t_class` VALUES (579, '30电子信息工程3班', 3, 101, 2030);
INSERT INTO `t_class` VALUES (580, '30电子信息工程4班', 4, 101, 2030);
INSERT INTO `t_class` VALUES (581, '30电子信息工程5班', 5, 101, 2030);
INSERT INTO `t_class` VALUES (582, '30电子信息工程6班', 6, 101, 2030);
INSERT INTO `t_class` VALUES (583, '30电子信息工程7班', 7, 101, 2030);
INSERT INTO `t_class` VALUES (584, '30电子信息工程8班', 8, 101, 2030);
INSERT INTO `t_class` VALUES (585, '30电子科学与技术1班', 1, 102, 2030);
INSERT INTO `t_class` VALUES (586, '30电子科学与技术2班', 2, 102, 2030);
INSERT INTO `t_class` VALUES (587, '30电子科学与技术3班', 3, 102, 2030);
INSERT INTO `t_class` VALUES (588, '30电子科学与技术4班', 4, 102, 2030);
INSERT INTO `t_class` VALUES (589, '30电子科学与技术5班', 5, 102, 2030);
INSERT INTO `t_class` VALUES (590, '30电子科学与技术6班', 6, 102, 2030);
INSERT INTO `t_class` VALUES (591, '30电子科学与技术7班', 7, 102, 2030);
INSERT INTO `t_class` VALUES (592, '30电子科学与技术8班', 8, 102, 2030);
INSERT INTO `t_class` VALUES (593, '30自动化1班', 1, 103, 2030);
INSERT INTO `t_class` VALUES (594, '30自动化2班', 2, 103, 2030);
INSERT INTO `t_class` VALUES (595, '30自动化3班', 3, 103, 2030);
INSERT INTO `t_class` VALUES (596, '30自动化4班', 4, 103, 2030);
INSERT INTO `t_class` VALUES (597, '30自动化5班', 5, 103, 2030);
INSERT INTO `t_class` VALUES (598, '30自动化6班', 6, 103, 2030);
INSERT INTO `t_class` VALUES (599, '30自动化7班', 7, 103, 2030);
INSERT INTO `t_class` VALUES (600, '30自动化8班', 8, 103, 2030);
INSERT INTO `t_class` VALUES (601, '30计算机科学与技术1班', 1, 104, 2030);
INSERT INTO `t_class` VALUES (602, '30计算机科学与技术2班', 2, 104, 2030);
INSERT INTO `t_class` VALUES (603, '30计算机科学与技术3班', 3, 104, 2030);
INSERT INTO `t_class` VALUES (604, '30计算机科学与技术4班', 4, 104, 2030);
INSERT INTO `t_class` VALUES (605, '30计算机科学与技术5班', 5, 104, 2030);
INSERT INTO `t_class` VALUES (606, '30计算机科学与技术6班', 6, 104, 2030);
INSERT INTO `t_class` VALUES (607, '30计算机科学与技术7班', 7, 104, 2030);
INSERT INTO `t_class` VALUES (608, '30计算机科学与技术8班', 8, 104, 2030);
INSERT INTO `t_class` VALUES (609, '30软件工程1班', 1, 105, 2030);
INSERT INTO `t_class` VALUES (610, '30软件工程2班', 2, 105, 2030);
INSERT INTO `t_class` VALUES (611, '30软件工程3班', 3, 105, 2030);
INSERT INTO `t_class` VALUES (612, '30软件工程4班', 4, 105, 2030);
INSERT INTO `t_class` VALUES (613, '30软件工程5班', 5, 105, 2030);
INSERT INTO `t_class` VALUES (614, '30软件工程6班', 6, 105, 2030);
INSERT INTO `t_class` VALUES (615, '30软件工程7班', 7, 105, 2030);
INSERT INTO `t_class` VALUES (616, '30软件工程8班', 8, 105, 2030);
INSERT INTO `t_class` VALUES (617, '30计算机类1班', 1, 106, 2030);
INSERT INTO `t_class` VALUES (618, '30计算机类2班', 2, 106, 2030);
INSERT INTO `t_class` VALUES (619, '30计算机类3班', 3, 106, 2030);
INSERT INTO `t_class` VALUES (620, '30计算机类4班', 4, 106, 2030);
INSERT INTO `t_class` VALUES (621, '30计算机类5班', 5, 106, 2030);
INSERT INTO `t_class` VALUES (622, '30计算机类6班', 6, 106, 2030);
INSERT INTO `t_class` VALUES (623, '30计算机类7班', 7, 106, 2030);
INSERT INTO `t_class` VALUES (624, '30计算机类8班', 8, 106, 2030);
INSERT INTO `t_class` VALUES (625, '31电子信息工程1班', 1, 101, 2031);
INSERT INTO `t_class` VALUES (626, '31电子信息工程2班', 2, 101, 2031);
INSERT INTO `t_class` VALUES (627, '31电子信息工程3班', 3, 101, 2031);
INSERT INTO `t_class` VALUES (628, '31电子信息工程4班', 4, 101, 2031);
INSERT INTO `t_class` VALUES (629, '31电子信息工程5班', 5, 101, 2031);
INSERT INTO `t_class` VALUES (630, '31电子信息工程6班', 6, 101, 2031);
INSERT INTO `t_class` VALUES (631, '31电子信息工程7班', 7, 101, 2031);
INSERT INTO `t_class` VALUES (632, '31电子信息工程8班', 8, 101, 2031);
INSERT INTO `t_class` VALUES (633, '31电子科学与技术1班', 1, 102, 2031);
INSERT INTO `t_class` VALUES (634, '31电子科学与技术2班', 2, 102, 2031);
INSERT INTO `t_class` VALUES (635, '31电子科学与技术3班', 3, 102, 2031);
INSERT INTO `t_class` VALUES (636, '31电子科学与技术4班', 4, 102, 2031);
INSERT INTO `t_class` VALUES (637, '31电子科学与技术5班', 5, 102, 2031);
INSERT INTO `t_class` VALUES (638, '31电子科学与技术6班', 6, 102, 2031);
INSERT INTO `t_class` VALUES (639, '31电子科学与技术7班', 7, 102, 2031);
INSERT INTO `t_class` VALUES (640, '31电子科学与技术8班', 8, 102, 2031);
INSERT INTO `t_class` VALUES (641, '31自动化1班', 1, 103, 2031);
INSERT INTO `t_class` VALUES (642, '31自动化2班', 2, 103, 2031);
INSERT INTO `t_class` VALUES (643, '31自动化3班', 3, 103, 2031);
INSERT INTO `t_class` VALUES (644, '31自动化4班', 4, 103, 2031);
INSERT INTO `t_class` VALUES (645, '31自动化5班', 5, 103, 2031);
INSERT INTO `t_class` VALUES (646, '31自动化6班', 6, 103, 2031);
INSERT INTO `t_class` VALUES (647, '31自动化7班', 7, 103, 2031);
INSERT INTO `t_class` VALUES (648, '31自动化8班', 8, 103, 2031);
INSERT INTO `t_class` VALUES (649, '31计算机科学与技术1班', 1, 104, 2031);
INSERT INTO `t_class` VALUES (650, '31计算机科学与技术2班', 2, 104, 2031);
INSERT INTO `t_class` VALUES (651, '31计算机科学与技术3班', 3, 104, 2031);
INSERT INTO `t_class` VALUES (652, '31计算机科学与技术4班', 4, 104, 2031);
INSERT INTO `t_class` VALUES (653, '31计算机科学与技术5班', 5, 104, 2031);
INSERT INTO `t_class` VALUES (654, '31计算机科学与技术6班', 6, 104, 2031);
INSERT INTO `t_class` VALUES (655, '31计算机科学与技术7班', 7, 104, 2031);
INSERT INTO `t_class` VALUES (656, '31计算机科学与技术8班', 8, 104, 2031);
INSERT INTO `t_class` VALUES (657, '31软件工程1班', 1, 105, 2031);
INSERT INTO `t_class` VALUES (658, '31软件工程2班', 2, 105, 2031);
INSERT INTO `t_class` VALUES (659, '31软件工程3班', 3, 105, 2031);
INSERT INTO `t_class` VALUES (660, '31软件工程4班', 4, 105, 2031);
INSERT INTO `t_class` VALUES (661, '31软件工程5班', 5, 105, 2031);
INSERT INTO `t_class` VALUES (662, '31软件工程6班', 6, 105, 2031);
INSERT INTO `t_class` VALUES (663, '31软件工程7班', 7, 105, 2031);
INSERT INTO `t_class` VALUES (664, '31软件工程8班', 8, 105, 2031);
INSERT INTO `t_class` VALUES (665, '31计算机类1班', 1, 106, 2031);
INSERT INTO `t_class` VALUES (666, '31计算机类2班', 2, 106, 2031);
INSERT INTO `t_class` VALUES (667, '31计算机类3班', 3, 106, 2031);
INSERT INTO `t_class` VALUES (668, '31计算机类4班', 4, 106, 2031);
INSERT INTO `t_class` VALUES (669, '31计算机类5班', 5, 106, 2031);
INSERT INTO `t_class` VALUES (670, '31计算机类6班', 6, 106, 2031);
INSERT INTO `t_class` VALUES (671, '31计算机类7班', 7, 106, 2031);
INSERT INTO `t_class` VALUES (672, '31计算机类8班', 8, 106, 2031);
INSERT INTO `t_class` VALUES (673, '32电子信息工程1班', 1, 101, 2032);
INSERT INTO `t_class` VALUES (674, '32电子信息工程2班', 2, 101, 2032);
INSERT INTO `t_class` VALUES (675, '32电子信息工程3班', 3, 101, 2032);
INSERT INTO `t_class` VALUES (676, '32电子信息工程4班', 4, 101, 2032);
INSERT INTO `t_class` VALUES (677, '32电子信息工程5班', 5, 101, 2032);
INSERT INTO `t_class` VALUES (678, '32电子信息工程6班', 6, 101, 2032);
INSERT INTO `t_class` VALUES (679, '32电子信息工程7班', 7, 101, 2032);
INSERT INTO `t_class` VALUES (680, '32电子信息工程8班', 8, 101, 2032);
INSERT INTO `t_class` VALUES (681, '32电子科学与技术1班', 1, 102, 2032);
INSERT INTO `t_class` VALUES (682, '32电子科学与技术2班', 2, 102, 2032);
INSERT INTO `t_class` VALUES (683, '32电子科学与技术3班', 3, 102, 2032);
INSERT INTO `t_class` VALUES (684, '32电子科学与技术4班', 4, 102, 2032);
INSERT INTO `t_class` VALUES (685, '32电子科学与技术5班', 5, 102, 2032);
INSERT INTO `t_class` VALUES (686, '32电子科学与技术6班', 6, 102, 2032);
INSERT INTO `t_class` VALUES (687, '32电子科学与技术7班', 7, 102, 2032);
INSERT INTO `t_class` VALUES (688, '32电子科学与技术8班', 8, 102, 2032);
INSERT INTO `t_class` VALUES (689, '32自动化1班', 1, 103, 2032);
INSERT INTO `t_class` VALUES (690, '32自动化2班', 2, 103, 2032);
INSERT INTO `t_class` VALUES (691, '32自动化3班', 3, 103, 2032);
INSERT INTO `t_class` VALUES (692, '32自动化4班', 4, 103, 2032);
INSERT INTO `t_class` VALUES (693, '32自动化5班', 5, 103, 2032);
INSERT INTO `t_class` VALUES (694, '32自动化6班', 6, 103, 2032);
INSERT INTO `t_class` VALUES (695, '32自动化7班', 7, 103, 2032);
INSERT INTO `t_class` VALUES (696, '32自动化8班', 8, 103, 2032);
INSERT INTO `t_class` VALUES (697, '32计算机科学与技术1班', 1, 104, 2032);
INSERT INTO `t_class` VALUES (698, '32计算机科学与技术2班', 2, 104, 2032);
INSERT INTO `t_class` VALUES (699, '32计算机科学与技术3班', 3, 104, 2032);
INSERT INTO `t_class` VALUES (700, '32计算机科学与技术4班', 4, 104, 2032);
INSERT INTO `t_class` VALUES (701, '32计算机科学与技术5班', 5, 104, 2032);
INSERT INTO `t_class` VALUES (702, '32计算机科学与技术6班', 6, 104, 2032);
INSERT INTO `t_class` VALUES (703, '32计算机科学与技术7班', 7, 104, 2032);
INSERT INTO `t_class` VALUES (704, '32计算机科学与技术8班', 8, 104, 2032);
INSERT INTO `t_class` VALUES (705, '32软件工程1班', 1, 105, 2032);
INSERT INTO `t_class` VALUES (706, '32软件工程2班', 2, 105, 2032);
INSERT INTO `t_class` VALUES (707, '32软件工程3班', 3, 105, 2032);
INSERT INTO `t_class` VALUES (708, '32软件工程4班', 4, 105, 2032);
INSERT INTO `t_class` VALUES (709, '32软件工程5班', 5, 105, 2032);
INSERT INTO `t_class` VALUES (710, '32软件工程6班', 6, 105, 2032);
INSERT INTO `t_class` VALUES (711, '32软件工程7班', 7, 105, 2032);
INSERT INTO `t_class` VALUES (712, '32软件工程8班', 8, 105, 2032);
INSERT INTO `t_class` VALUES (713, '32计算机类1班', 1, 106, 2032);
INSERT INTO `t_class` VALUES (714, '32计算机类2班', 2, 106, 2032);
INSERT INTO `t_class` VALUES (715, '32计算机类3班', 3, 106, 2032);
INSERT INTO `t_class` VALUES (716, '32计算机类4班', 4, 106, 2032);
INSERT INTO `t_class` VALUES (717, '32计算机类5班', 5, 106, 2032);
INSERT INTO `t_class` VALUES (718, '32计算机类6班', 6, 106, 2032);
INSERT INTO `t_class` VALUES (719, '32计算机类7班', 7, 106, 2032);
INSERT INTO `t_class` VALUES (720, '32计算机类8班', 8, 106, 2032);
INSERT INTO `t_class` VALUES (721, '33电子信息工程1班', 1, 101, 2033);
INSERT INTO `t_class` VALUES (722, '33电子信息工程2班', 2, 101, 2033);
INSERT INTO `t_class` VALUES (723, '33电子信息工程3班', 3, 101, 2033);
INSERT INTO `t_class` VALUES (724, '33电子信息工程4班', 4, 101, 2033);
INSERT INTO `t_class` VALUES (725, '33电子信息工程5班', 5, 101, 2033);
INSERT INTO `t_class` VALUES (726, '33电子信息工程6班', 6, 101, 2033);
INSERT INTO `t_class` VALUES (727, '33电子信息工程7班', 7, 101, 2033);
INSERT INTO `t_class` VALUES (728, '33电子信息工程8班', 8, 101, 2033);
INSERT INTO `t_class` VALUES (729, '33电子科学与技术1班', 1, 102, 2033);
INSERT INTO `t_class` VALUES (730, '33电子科学与技术2班', 2, 102, 2033);
INSERT INTO `t_class` VALUES (731, '33电子科学与技术3班', 3, 102, 2033);
INSERT INTO `t_class` VALUES (732, '33电子科学与技术4班', 4, 102, 2033);
INSERT INTO `t_class` VALUES (733, '33电子科学与技术5班', 5, 102, 2033);
INSERT INTO `t_class` VALUES (734, '33电子科学与技术6班', 6, 102, 2033);
INSERT INTO `t_class` VALUES (735, '33电子科学与技术7班', 7, 102, 2033);
INSERT INTO `t_class` VALUES (736, '33电子科学与技术8班', 8, 102, 2033);
INSERT INTO `t_class` VALUES (737, '33自动化1班', 1, 103, 2033);
INSERT INTO `t_class` VALUES (738, '33自动化2班', 2, 103, 2033);
INSERT INTO `t_class` VALUES (739, '33自动化3班', 3, 103, 2033);
INSERT INTO `t_class` VALUES (740, '33自动化4班', 4, 103, 2033);
INSERT INTO `t_class` VALUES (741, '33自动化5班', 5, 103, 2033);
INSERT INTO `t_class` VALUES (742, '33自动化6班', 6, 103, 2033);
INSERT INTO `t_class` VALUES (743, '33自动化7班', 7, 103, 2033);
INSERT INTO `t_class` VALUES (744, '33自动化8班', 8, 103, 2033);
INSERT INTO `t_class` VALUES (745, '33计算机科学与技术1班', 1, 104, 2033);
INSERT INTO `t_class` VALUES (746, '33计算机科学与技术2班', 2, 104, 2033);
INSERT INTO `t_class` VALUES (747, '33计算机科学与技术3班', 3, 104, 2033);
INSERT INTO `t_class` VALUES (748, '33计算机科学与技术4班', 4, 104, 2033);
INSERT INTO `t_class` VALUES (749, '33计算机科学与技术5班', 5, 104, 2033);
INSERT INTO `t_class` VALUES (750, '33计算机科学与技术6班', 6, 104, 2033);
INSERT INTO `t_class` VALUES (751, '33计算机科学与技术7班', 7, 104, 2033);
INSERT INTO `t_class` VALUES (752, '33计算机科学与技术8班', 8, 104, 2033);
INSERT INTO `t_class` VALUES (753, '33软件工程1班', 1, 105, 2033);
INSERT INTO `t_class` VALUES (754, '33软件工程2班', 2, 105, 2033);
INSERT INTO `t_class` VALUES (755, '33软件工程3班', 3, 105, 2033);
INSERT INTO `t_class` VALUES (756, '33软件工程4班', 4, 105, 2033);
INSERT INTO `t_class` VALUES (757, '33软件工程5班', 5, 105, 2033);
INSERT INTO `t_class` VALUES (758, '33软件工程6班', 6, 105, 2033);
INSERT INTO `t_class` VALUES (759, '33软件工程7班', 7, 105, 2033);
INSERT INTO `t_class` VALUES (760, '33软件工程8班', 8, 105, 2033);
INSERT INTO `t_class` VALUES (761, '33计算机类1班', 1, 106, 2033);
INSERT INTO `t_class` VALUES (762, '33计算机类2班', 2, 106, 2033);
INSERT INTO `t_class` VALUES (763, '33计算机类3班', 3, 106, 2033);
INSERT INTO `t_class` VALUES (764, '33计算机类4班', 4, 106, 2033);
INSERT INTO `t_class` VALUES (765, '33计算机类5班', 5, 106, 2033);
INSERT INTO `t_class` VALUES (766, '33计算机类6班', 6, 106, 2033);
INSERT INTO `t_class` VALUES (767, '33计算机类7班', 7, 106, 2033);
INSERT INTO `t_class` VALUES (768, '33计算机类8班', 8, 106, 2033);
INSERT INTO `t_class` VALUES (769, '34电子信息工程1班', 1, 101, 2034);
INSERT INTO `t_class` VALUES (770, '34电子信息工程2班', 2, 101, 2034);
INSERT INTO `t_class` VALUES (771, '34电子信息工程3班', 3, 101, 2034);
INSERT INTO `t_class` VALUES (772, '34电子信息工程4班', 4, 101, 2034);
INSERT INTO `t_class` VALUES (773, '34电子信息工程5班', 5, 101, 2034);
INSERT INTO `t_class` VALUES (774, '34电子信息工程6班', 6, 101, 2034);
INSERT INTO `t_class` VALUES (775, '34电子信息工程7班', 7, 101, 2034);
INSERT INTO `t_class` VALUES (776, '34电子信息工程8班', 8, 101, 2034);
INSERT INTO `t_class` VALUES (777, '34电子科学与技术1班', 1, 102, 2034);
INSERT INTO `t_class` VALUES (778, '34电子科学与技术2班', 2, 102, 2034);
INSERT INTO `t_class` VALUES (779, '34电子科学与技术3班', 3, 102, 2034);
INSERT INTO `t_class` VALUES (780, '34电子科学与技术4班', 4, 102, 2034);
INSERT INTO `t_class` VALUES (781, '34电子科学与技术5班', 5, 102, 2034);
INSERT INTO `t_class` VALUES (782, '34电子科学与技术6班', 6, 102, 2034);
INSERT INTO `t_class` VALUES (783, '34电子科学与技术7班', 7, 102, 2034);
INSERT INTO `t_class` VALUES (784, '34电子科学与技术8班', 8, 102, 2034);
INSERT INTO `t_class` VALUES (785, '34自动化1班', 1, 103, 2034);
INSERT INTO `t_class` VALUES (786, '34自动化2班', 2, 103, 2034);
INSERT INTO `t_class` VALUES (787, '34自动化3班', 3, 103, 2034);
INSERT INTO `t_class` VALUES (788, '34自动化4班', 4, 103, 2034);
INSERT INTO `t_class` VALUES (789, '34自动化5班', 5, 103, 2034);
INSERT INTO `t_class` VALUES (790, '34自动化6班', 6, 103, 2034);
INSERT INTO `t_class` VALUES (791, '34自动化7班', 7, 103, 2034);
INSERT INTO `t_class` VALUES (792, '34自动化8班', 8, 103, 2034);
INSERT INTO `t_class` VALUES (793, '34计算机科学与技术1班', 1, 104, 2034);
INSERT INTO `t_class` VALUES (794, '34计算机科学与技术2班', 2, 104, 2034);
INSERT INTO `t_class` VALUES (795, '34计算机科学与技术3班', 3, 104, 2034);
INSERT INTO `t_class` VALUES (796, '34计算机科学与技术4班', 4, 104, 2034);
INSERT INTO `t_class` VALUES (797, '34计算机科学与技术5班', 5, 104, 2034);
INSERT INTO `t_class` VALUES (798, '34计算机科学与技术6班', 6, 104, 2034);
INSERT INTO `t_class` VALUES (799, '34计算机科学与技术7班', 7, 104, 2034);
INSERT INTO `t_class` VALUES (800, '34计算机科学与技术8班', 8, 104, 2034);
INSERT INTO `t_class` VALUES (801, '34软件工程1班', 1, 105, 2034);
INSERT INTO `t_class` VALUES (802, '34软件工程2班', 2, 105, 2034);
INSERT INTO `t_class` VALUES (803, '34软件工程3班', 3, 105, 2034);
INSERT INTO `t_class` VALUES (804, '34软件工程4班', 4, 105, 2034);
INSERT INTO `t_class` VALUES (805, '34软件工程5班', 5, 105, 2034);
INSERT INTO `t_class` VALUES (806, '34软件工程6班', 6, 105, 2034);
INSERT INTO `t_class` VALUES (807, '34软件工程7班', 7, 105, 2034);
INSERT INTO `t_class` VALUES (808, '34软件工程8班', 8, 105, 2034);
INSERT INTO `t_class` VALUES (809, '34计算机类1班', 1, 106, 2034);
INSERT INTO `t_class` VALUES (810, '34计算机类2班', 2, 106, 2034);
INSERT INTO `t_class` VALUES (811, '34计算机类3班', 3, 106, 2034);
INSERT INTO `t_class` VALUES (812, '34计算机类4班', 4, 106, 2034);
INSERT INTO `t_class` VALUES (813, '34计算机类5班', 5, 106, 2034);
INSERT INTO `t_class` VALUES (814, '34计算机类6班', 6, 106, 2034);
INSERT INTO `t_class` VALUES (815, '34计算机类7班', 7, 106, 2034);
INSERT INTO `t_class` VALUES (816, '34计算机类8班', 8, 106, 2034);
INSERT INTO `t_class` VALUES (817, '35电子信息工程1班', 1, 101, 2035);
INSERT INTO `t_class` VALUES (818, '35电子信息工程2班', 2, 101, 2035);
INSERT INTO `t_class` VALUES (819, '35电子信息工程3班', 3, 101, 2035);
INSERT INTO `t_class` VALUES (820, '35电子信息工程4班', 4, 101, 2035);
INSERT INTO `t_class` VALUES (821, '35电子信息工程5班', 5, 101, 2035);
INSERT INTO `t_class` VALUES (822, '35电子信息工程6班', 6, 101, 2035);
INSERT INTO `t_class` VALUES (823, '35电子信息工程7班', 7, 101, 2035);
INSERT INTO `t_class` VALUES (824, '35电子信息工程8班', 8, 101, 2035);
INSERT INTO `t_class` VALUES (825, '35电子科学与技术1班', 1, 102, 2035);
INSERT INTO `t_class` VALUES (826, '35电子科学与技术2班', 2, 102, 2035);
INSERT INTO `t_class` VALUES (827, '35电子科学与技术3班', 3, 102, 2035);
INSERT INTO `t_class` VALUES (828, '35电子科学与技术4班', 4, 102, 2035);
INSERT INTO `t_class` VALUES (829, '35电子科学与技术5班', 5, 102, 2035);
INSERT INTO `t_class` VALUES (830, '35电子科学与技术6班', 6, 102, 2035);
INSERT INTO `t_class` VALUES (831, '35电子科学与技术7班', 7, 102, 2035);
INSERT INTO `t_class` VALUES (832, '35电子科学与技术8班', 8, 102, 2035);
INSERT INTO `t_class` VALUES (833, '35自动化1班', 1, 103, 2035);
INSERT INTO `t_class` VALUES (834, '35自动化2班', 2, 103, 2035);
INSERT INTO `t_class` VALUES (835, '35自动化3班', 3, 103, 2035);
INSERT INTO `t_class` VALUES (836, '35自动化4班', 4, 103, 2035);
INSERT INTO `t_class` VALUES (837, '35自动化5班', 5, 103, 2035);
INSERT INTO `t_class` VALUES (838, '35自动化6班', 6, 103, 2035);
INSERT INTO `t_class` VALUES (839, '35自动化7班', 7, 103, 2035);
INSERT INTO `t_class` VALUES (840, '35自动化8班', 8, 103, 2035);
INSERT INTO `t_class` VALUES (841, '35计算机科学与技术1班', 1, 104, 2035);
INSERT INTO `t_class` VALUES (842, '35计算机科学与技术2班', 2, 104, 2035);
INSERT INTO `t_class` VALUES (843, '35计算机科学与技术3班', 3, 104, 2035);
INSERT INTO `t_class` VALUES (844, '35计算机科学与技术4班', 4, 104, 2035);
INSERT INTO `t_class` VALUES (845, '35计算机科学与技术5班', 5, 104, 2035);
INSERT INTO `t_class` VALUES (846, '35计算机科学与技术6班', 6, 104, 2035);
INSERT INTO `t_class` VALUES (847, '35计算机科学与技术7班', 7, 104, 2035);
INSERT INTO `t_class` VALUES (848, '35计算机科学与技术8班', 8, 104, 2035);
INSERT INTO `t_class` VALUES (849, '35软件工程1班', 1, 105, 2035);
INSERT INTO `t_class` VALUES (850, '35软件工程2班', 2, 105, 2035);
INSERT INTO `t_class` VALUES (851, '35软件工程3班', 3, 105, 2035);
INSERT INTO `t_class` VALUES (852, '35软件工程4班', 4, 105, 2035);
INSERT INTO `t_class` VALUES (853, '35软件工程5班', 5, 105, 2035);
INSERT INTO `t_class` VALUES (854, '35软件工程6班', 6, 105, 2035);
INSERT INTO `t_class` VALUES (855, '35软件工程7班', 7, 105, 2035);
INSERT INTO `t_class` VALUES (856, '35软件工程8班', 8, 105, 2035);
INSERT INTO `t_class` VALUES (857, '35计算机类1班', 1, 106, 2035);
INSERT INTO `t_class` VALUES (858, '35计算机类2班', 2, 106, 2035);
INSERT INTO `t_class` VALUES (859, '35计算机类3班', 3, 106, 2035);
INSERT INTO `t_class` VALUES (860, '35计算机类4班', 4, 106, 2035);
INSERT INTO `t_class` VALUES (861, '35计算机类5班', 5, 106, 2035);
INSERT INTO `t_class` VALUES (862, '35计算机类6班', 6, 106, 2035);
INSERT INTO `t_class` VALUES (863, '35计算机类7班', 7, 106, 2035);
INSERT INTO `t_class` VALUES (864, '35计算机类8班', 8, 106, 2035);
INSERT INTO `t_class` VALUES (865, '36电子信息工程1班', 1, 101, 2036);
INSERT INTO `t_class` VALUES (866, '36电子信息工程2班', 2, 101, 2036);
INSERT INTO `t_class` VALUES (867, '36电子信息工程3班', 3, 101, 2036);
INSERT INTO `t_class` VALUES (868, '36电子信息工程4班', 4, 101, 2036);
INSERT INTO `t_class` VALUES (869, '36电子信息工程5班', 5, 101, 2036);
INSERT INTO `t_class` VALUES (870, '36电子信息工程6班', 6, 101, 2036);
INSERT INTO `t_class` VALUES (871, '36电子信息工程7班', 7, 101, 2036);
INSERT INTO `t_class` VALUES (872, '36电子信息工程8班', 8, 101, 2036);
INSERT INTO `t_class` VALUES (873, '36电子科学与技术1班', 1, 102, 2036);
INSERT INTO `t_class` VALUES (874, '36电子科学与技术2班', 2, 102, 2036);
INSERT INTO `t_class` VALUES (875, '36电子科学与技术3班', 3, 102, 2036);
INSERT INTO `t_class` VALUES (876, '36电子科学与技术4班', 4, 102, 2036);
INSERT INTO `t_class` VALUES (877, '36电子科学与技术5班', 5, 102, 2036);
INSERT INTO `t_class` VALUES (878, '36电子科学与技术6班', 6, 102, 2036);
INSERT INTO `t_class` VALUES (879, '36电子科学与技术7班', 7, 102, 2036);
INSERT INTO `t_class` VALUES (880, '36电子科学与技术8班', 8, 102, 2036);
INSERT INTO `t_class` VALUES (881, '36自动化1班', 1, 103, 2036);
INSERT INTO `t_class` VALUES (882, '36自动化2班', 2, 103, 2036);
INSERT INTO `t_class` VALUES (883, '36自动化3班', 3, 103, 2036);
INSERT INTO `t_class` VALUES (884, '36自动化4班', 4, 103, 2036);
INSERT INTO `t_class` VALUES (885, '36自动化5班', 5, 103, 2036);
INSERT INTO `t_class` VALUES (886, '36自动化6班', 6, 103, 2036);
INSERT INTO `t_class` VALUES (887, '36自动化7班', 7, 103, 2036);
INSERT INTO `t_class` VALUES (888, '36自动化8班', 8, 103, 2036);
INSERT INTO `t_class` VALUES (889, '36计算机科学与技术1班', 1, 104, 2036);
INSERT INTO `t_class` VALUES (890, '36计算机科学与技术2班', 2, 104, 2036);
INSERT INTO `t_class` VALUES (891, '36计算机科学与技术3班', 3, 104, 2036);
INSERT INTO `t_class` VALUES (892, '36计算机科学与技术4班', 4, 104, 2036);
INSERT INTO `t_class` VALUES (893, '36计算机科学与技术5班', 5, 104, 2036);
INSERT INTO `t_class` VALUES (894, '36计算机科学与技术6班', 6, 104, 2036);
INSERT INTO `t_class` VALUES (895, '36计算机科学与技术7班', 7, 104, 2036);
INSERT INTO `t_class` VALUES (896, '36计算机科学与技术8班', 8, 104, 2036);
INSERT INTO `t_class` VALUES (897, '36软件工程1班', 1, 105, 2036);
INSERT INTO `t_class` VALUES (898, '36软件工程2班', 2, 105, 2036);
INSERT INTO `t_class` VALUES (899, '36软件工程3班', 3, 105, 2036);
INSERT INTO `t_class` VALUES (900, '36软件工程4班', 4, 105, 2036);
INSERT INTO `t_class` VALUES (901, '36软件工程5班', 5, 105, 2036);
INSERT INTO `t_class` VALUES (902, '36软件工程6班', 6, 105, 2036);
INSERT INTO `t_class` VALUES (903, '36软件工程7班', 7, 105, 2036);
INSERT INTO `t_class` VALUES (904, '36软件工程8班', 8, 105, 2036);
INSERT INTO `t_class` VALUES (905, '36计算机类1班', 1, 106, 2036);
INSERT INTO `t_class` VALUES (906, '36计算机类2班', 2, 106, 2036);
INSERT INTO `t_class` VALUES (907, '36计算机类3班', 3, 106, 2036);
INSERT INTO `t_class` VALUES (908, '36计算机类4班', 4, 106, 2036);
INSERT INTO `t_class` VALUES (909, '36计算机类5班', 5, 106, 2036);
INSERT INTO `t_class` VALUES (910, '36计算机类6班', 6, 106, 2036);
INSERT INTO `t_class` VALUES (911, '36计算机类7班', 7, 106, 2036);
INSERT INTO `t_class` VALUES (912, '36计算机类8班', 8, 106, 2036);
INSERT INTO `t_class` VALUES (913, '37电子信息工程1班', 1, 101, 2037);
INSERT INTO `t_class` VALUES (914, '37电子信息工程2班', 2, 101, 2037);
INSERT INTO `t_class` VALUES (915, '37电子信息工程3班', 3, 101, 2037);
INSERT INTO `t_class` VALUES (916, '37电子信息工程4班', 4, 101, 2037);
INSERT INTO `t_class` VALUES (917, '37电子信息工程5班', 5, 101, 2037);
INSERT INTO `t_class` VALUES (918, '37电子信息工程6班', 6, 101, 2037);
INSERT INTO `t_class` VALUES (919, '37电子信息工程7班', 7, 101, 2037);
INSERT INTO `t_class` VALUES (920, '37电子信息工程8班', 8, 101, 2037);
INSERT INTO `t_class` VALUES (921, '37电子科学与技术1班', 1, 102, 2037);
INSERT INTO `t_class` VALUES (922, '37电子科学与技术2班', 2, 102, 2037);
INSERT INTO `t_class` VALUES (923, '37电子科学与技术3班', 3, 102, 2037);
INSERT INTO `t_class` VALUES (924, '37电子科学与技术4班', 4, 102, 2037);
INSERT INTO `t_class` VALUES (925, '37电子科学与技术5班', 5, 102, 2037);
INSERT INTO `t_class` VALUES (926, '37电子科学与技术6班', 6, 102, 2037);
INSERT INTO `t_class` VALUES (927, '37电子科学与技术7班', 7, 102, 2037);
INSERT INTO `t_class` VALUES (928, '37电子科学与技术8班', 8, 102, 2037);
INSERT INTO `t_class` VALUES (929, '37自动化1班', 1, 103, 2037);
INSERT INTO `t_class` VALUES (930, '37自动化2班', 2, 103, 2037);
INSERT INTO `t_class` VALUES (931, '37自动化3班', 3, 103, 2037);
INSERT INTO `t_class` VALUES (932, '37自动化4班', 4, 103, 2037);
INSERT INTO `t_class` VALUES (933, '37自动化5班', 5, 103, 2037);
INSERT INTO `t_class` VALUES (934, '37自动化6班', 6, 103, 2037);
INSERT INTO `t_class` VALUES (935, '37自动化7班', 7, 103, 2037);
INSERT INTO `t_class` VALUES (936, '37自动化8班', 8, 103, 2037);
INSERT INTO `t_class` VALUES (937, '37计算机科学与技术1班', 1, 104, 2037);
INSERT INTO `t_class` VALUES (938, '37计算机科学与技术2班', 2, 104, 2037);
INSERT INTO `t_class` VALUES (939, '37计算机科学与技术3班', 3, 104, 2037);
INSERT INTO `t_class` VALUES (940, '37计算机科学与技术4班', 4, 104, 2037);
INSERT INTO `t_class` VALUES (941, '37计算机科学与技术5班', 5, 104, 2037);
INSERT INTO `t_class` VALUES (942, '37计算机科学与技术6班', 6, 104, 2037);
INSERT INTO `t_class` VALUES (943, '37计算机科学与技术7班', 7, 104, 2037);
INSERT INTO `t_class` VALUES (944, '37计算机科学与技术8班', 8, 104, 2037);
INSERT INTO `t_class` VALUES (945, '37软件工程1班', 1, 105, 2037);
INSERT INTO `t_class` VALUES (946, '37软件工程2班', 2, 105, 2037);
INSERT INTO `t_class` VALUES (947, '37软件工程3班', 3, 105, 2037);
INSERT INTO `t_class` VALUES (948, '37软件工程4班', 4, 105, 2037);
INSERT INTO `t_class` VALUES (949, '37软件工程5班', 5, 105, 2037);
INSERT INTO `t_class` VALUES (950, '37软件工程6班', 6, 105, 2037);
INSERT INTO `t_class` VALUES (951, '37软件工程7班', 7, 105, 2037);
INSERT INTO `t_class` VALUES (952, '37软件工程8班', 8, 105, 2037);
INSERT INTO `t_class` VALUES (953, '37计算机类1班', 1, 106, 2037);
INSERT INTO `t_class` VALUES (954, '37计算机类2班', 2, 106, 2037);
INSERT INTO `t_class` VALUES (955, '37计算机类3班', 3, 106, 2037);
INSERT INTO `t_class` VALUES (956, '37计算机类4班', 4, 106, 2037);
INSERT INTO `t_class` VALUES (957, '37计算机类5班', 5, 106, 2037);
INSERT INTO `t_class` VALUES (958, '37计算机类6班', 6, 106, 2037);
INSERT INTO `t_class` VALUES (959, '37计算机类7班', 7, 106, 2037);
INSERT INTO `t_class` VALUES (960, '37计算机类8班', 8, 106, 2037);
INSERT INTO `t_class` VALUES (961, '38电子信息工程1班', 1, 101, 2038);
INSERT INTO `t_class` VALUES (962, '38电子信息工程2班', 2, 101, 2038);
INSERT INTO `t_class` VALUES (963, '38电子信息工程3班', 3, 101, 2038);
INSERT INTO `t_class` VALUES (964, '38电子信息工程4班', 4, 101, 2038);
INSERT INTO `t_class` VALUES (965, '38电子信息工程5班', 5, 101, 2038);
INSERT INTO `t_class` VALUES (966, '38电子信息工程6班', 6, 101, 2038);
INSERT INTO `t_class` VALUES (967, '38电子信息工程7班', 7, 101, 2038);
INSERT INTO `t_class` VALUES (968, '38电子信息工程8班', 8, 101, 2038);
INSERT INTO `t_class` VALUES (969, '38电子科学与技术1班', 1, 102, 2038);
INSERT INTO `t_class` VALUES (970, '38电子科学与技术2班', 2, 102, 2038);
INSERT INTO `t_class` VALUES (971, '38电子科学与技术3班', 3, 102, 2038);
INSERT INTO `t_class` VALUES (972, '38电子科学与技术4班', 4, 102, 2038);
INSERT INTO `t_class` VALUES (973, '38电子科学与技术5班', 5, 102, 2038);
INSERT INTO `t_class` VALUES (974, '38电子科学与技术6班', 6, 102, 2038);
INSERT INTO `t_class` VALUES (975, '38电子科学与技术7班', 7, 102, 2038);
INSERT INTO `t_class` VALUES (976, '38电子科学与技术8班', 8, 102, 2038);
INSERT INTO `t_class` VALUES (977, '38自动化1班', 1, 103, 2038);
INSERT INTO `t_class` VALUES (978, '38自动化2班', 2, 103, 2038);
INSERT INTO `t_class` VALUES (979, '38自动化3班', 3, 103, 2038);
INSERT INTO `t_class` VALUES (980, '38自动化4班', 4, 103, 2038);
INSERT INTO `t_class` VALUES (981, '38自动化5班', 5, 103, 2038);
INSERT INTO `t_class` VALUES (982, '38自动化6班', 6, 103, 2038);
INSERT INTO `t_class` VALUES (983, '38自动化7班', 7, 103, 2038);
INSERT INTO `t_class` VALUES (984, '38自动化8班', 8, 103, 2038);
INSERT INTO `t_class` VALUES (985, '38计算机科学与技术1班', 1, 104, 2038);
INSERT INTO `t_class` VALUES (986, '38计算机科学与技术2班', 2, 104, 2038);
INSERT INTO `t_class` VALUES (987, '38计算机科学与技术3班', 3, 104, 2038);
INSERT INTO `t_class` VALUES (988, '38计算机科学与技术4班', 4, 104, 2038);
INSERT INTO `t_class` VALUES (989, '38计算机科学与技术5班', 5, 104, 2038);
INSERT INTO `t_class` VALUES (990, '38计算机科学与技术6班', 6, 104, 2038);
INSERT INTO `t_class` VALUES (991, '38计算机科学与技术7班', 7, 104, 2038);
INSERT INTO `t_class` VALUES (992, '38计算机科学与技术8班', 8, 104, 2038);
INSERT INTO `t_class` VALUES (993, '38软件工程1班', 1, 105, 2038);
INSERT INTO `t_class` VALUES (994, '38软件工程2班', 2, 105, 2038);
INSERT INTO `t_class` VALUES (995, '38软件工程3班', 3, 105, 2038);
INSERT INTO `t_class` VALUES (996, '38软件工程4班', 4, 105, 2038);
INSERT INTO `t_class` VALUES (997, '38软件工程5班', 5, 105, 2038);
INSERT INTO `t_class` VALUES (998, '38软件工程6班', 6, 105, 2038);
INSERT INTO `t_class` VALUES (999, '38软件工程7班', 7, 105, 2038);
INSERT INTO `t_class` VALUES (1000, '38软件工程8班', 8, 105, 2038);
INSERT INTO `t_class` VALUES (1001, '38计算机类1班', 1, 106, 2038);
INSERT INTO `t_class` VALUES (1002, '38计算机类2班', 2, 106, 2038);
INSERT INTO `t_class` VALUES (1003, '38计算机类3班', 3, 106, 2038);
INSERT INTO `t_class` VALUES (1004, '38计算机类4班', 4, 106, 2038);
INSERT INTO `t_class` VALUES (1005, '38计算机类5班', 5, 106, 2038);
INSERT INTO `t_class` VALUES (1006, '38计算机类6班', 6, 106, 2038);
INSERT INTO `t_class` VALUES (1007, '38计算机类7班', 7, 106, 2038);
INSERT INTO `t_class` VALUES (1008, '38计算机类8班', 8, 106, 2038);
INSERT INTO `t_class` VALUES (1009, '39电子信息工程1班', 1, 101, 2039);
INSERT INTO `t_class` VALUES (1010, '39电子信息工程2班', 2, 101, 2039);
INSERT INTO `t_class` VALUES (1011, '39电子信息工程3班', 3, 101, 2039);
INSERT INTO `t_class` VALUES (1012, '39电子信息工程4班', 4, 101, 2039);
INSERT INTO `t_class` VALUES (1013, '39电子信息工程5班', 5, 101, 2039);
INSERT INTO `t_class` VALUES (1014, '39电子信息工程6班', 6, 101, 2039);
INSERT INTO `t_class` VALUES (1015, '39电子信息工程7班', 7, 101, 2039);
INSERT INTO `t_class` VALUES (1016, '39电子信息工程8班', 8, 101, 2039);
INSERT INTO `t_class` VALUES (1017, '39电子科学与技术1班', 1, 102, 2039);
INSERT INTO `t_class` VALUES (1018, '39电子科学与技术2班', 2, 102, 2039);
INSERT INTO `t_class` VALUES (1019, '39电子科学与技术3班', 3, 102, 2039);
INSERT INTO `t_class` VALUES (1020, '39电子科学与技术4班', 4, 102, 2039);
INSERT INTO `t_class` VALUES (1021, '39电子科学与技术5班', 5, 102, 2039);
INSERT INTO `t_class` VALUES (1022, '39电子科学与技术6班', 6, 102, 2039);
INSERT INTO `t_class` VALUES (1023, '39电子科学与技术7班', 7, 102, 2039);
INSERT INTO `t_class` VALUES (1024, '39电子科学与技术8班', 8, 102, 2039);
INSERT INTO `t_class` VALUES (1025, '39自动化1班', 1, 103, 2039);
INSERT INTO `t_class` VALUES (1026, '39自动化2班', 2, 103, 2039);
INSERT INTO `t_class` VALUES (1027, '39自动化3班', 3, 103, 2039);
INSERT INTO `t_class` VALUES (1028, '39自动化4班', 4, 103, 2039);
INSERT INTO `t_class` VALUES (1029, '39自动化5班', 5, 103, 2039);
INSERT INTO `t_class` VALUES (1030, '39自动化6班', 6, 103, 2039);
INSERT INTO `t_class` VALUES (1031, '39自动化7班', 7, 103, 2039);
INSERT INTO `t_class` VALUES (1032, '39自动化8班', 8, 103, 2039);
INSERT INTO `t_class` VALUES (1033, '39计算机科学与技术1班', 1, 104, 2039);
INSERT INTO `t_class` VALUES (1034, '39计算机科学与技术2班', 2, 104, 2039);
INSERT INTO `t_class` VALUES (1035, '39计算机科学与技术3班', 3, 104, 2039);
INSERT INTO `t_class` VALUES (1036, '39计算机科学与技术4班', 4, 104, 2039);
INSERT INTO `t_class` VALUES (1037, '39计算机科学与技术5班', 5, 104, 2039);
INSERT INTO `t_class` VALUES (1038, '39计算机科学与技术6班', 6, 104, 2039);
INSERT INTO `t_class` VALUES (1039, '39计算机科学与技术7班', 7, 104, 2039);
INSERT INTO `t_class` VALUES (1040, '39计算机科学与技术8班', 8, 104, 2039);
INSERT INTO `t_class` VALUES (1041, '39软件工程1班', 1, 105, 2039);
INSERT INTO `t_class` VALUES (1042, '39软件工程2班', 2, 105, 2039);
INSERT INTO `t_class` VALUES (1043, '39软件工程3班', 3, 105, 2039);
INSERT INTO `t_class` VALUES (1044, '39软件工程4班', 4, 105, 2039);
INSERT INTO `t_class` VALUES (1045, '39软件工程5班', 5, 105, 2039);
INSERT INTO `t_class` VALUES (1046, '39软件工程6班', 6, 105, 2039);
INSERT INTO `t_class` VALUES (1047, '39软件工程7班', 7, 105, 2039);
INSERT INTO `t_class` VALUES (1048, '39软件工程8班', 8, 105, 2039);
INSERT INTO `t_class` VALUES (1049, '39计算机类1班', 1, 106, 2039);
INSERT INTO `t_class` VALUES (1050, '39计算机类2班', 2, 106, 2039);
INSERT INTO `t_class` VALUES (1051, '39计算机类3班', 3, 106, 2039);
INSERT INTO `t_class` VALUES (1052, '39计算机类4班', 4, 106, 2039);
INSERT INTO `t_class` VALUES (1053, '39计算机类5班', 5, 106, 2039);
INSERT INTO `t_class` VALUES (1054, '39计算机类6班', 6, 106, 2039);
INSERT INTO `t_class` VALUES (1055, '39计算机类7班', 7, 106, 2039);
INSERT INTO `t_class` VALUES (1056, '39计算机类8班', 8, 106, 2039);
INSERT INTO `t_class` VALUES (1057, '40电子信息工程1班', 1, 101, 2040);
INSERT INTO `t_class` VALUES (1058, '40电子信息工程2班', 2, 101, 2040);
INSERT INTO `t_class` VALUES (1059, '40电子信息工程3班', 3, 101, 2040);
INSERT INTO `t_class` VALUES (1060, '40电子信息工程4班', 4, 101, 2040);
INSERT INTO `t_class` VALUES (1061, '40电子信息工程5班', 5, 101, 2040);
INSERT INTO `t_class` VALUES (1062, '40电子信息工程6班', 6, 101, 2040);
INSERT INTO `t_class` VALUES (1063, '40电子信息工程7班', 7, 101, 2040);
INSERT INTO `t_class` VALUES (1064, '40电子信息工程8班', 8, 101, 2040);
INSERT INTO `t_class` VALUES (1065, '40电子科学与技术1班', 1, 102, 2040);
INSERT INTO `t_class` VALUES (1066, '40电子科学与技术2班', 2, 102, 2040);
INSERT INTO `t_class` VALUES (1067, '40电子科学与技术3班', 3, 102, 2040);
INSERT INTO `t_class` VALUES (1068, '40电子科学与技术4班', 4, 102, 2040);
INSERT INTO `t_class` VALUES (1069, '40电子科学与技术5班', 5, 102, 2040);
INSERT INTO `t_class` VALUES (1070, '40电子科学与技术6班', 6, 102, 2040);
INSERT INTO `t_class` VALUES (1071, '40电子科学与技术7班', 7, 102, 2040);
INSERT INTO `t_class` VALUES (1072, '40电子科学与技术8班', 8, 102, 2040);
INSERT INTO `t_class` VALUES (1073, '40自动化1班', 1, 103, 2040);
INSERT INTO `t_class` VALUES (1074, '40自动化2班', 2, 103, 2040);
INSERT INTO `t_class` VALUES (1075, '40自动化3班', 3, 103, 2040);
INSERT INTO `t_class` VALUES (1076, '40自动化4班', 4, 103, 2040);
INSERT INTO `t_class` VALUES (1077, '40自动化5班', 5, 103, 2040);
INSERT INTO `t_class` VALUES (1078, '40自动化6班', 6, 103, 2040);
INSERT INTO `t_class` VALUES (1079, '40自动化7班', 7, 103, 2040);
INSERT INTO `t_class` VALUES (1080, '40自动化8班', 8, 103, 2040);
INSERT INTO `t_class` VALUES (1081, '40计算机科学与技术1班', 1, 104, 2040);
INSERT INTO `t_class` VALUES (1082, '40计算机科学与技术2班', 2, 104, 2040);
INSERT INTO `t_class` VALUES (1083, '40计算机科学与技术3班', 3, 104, 2040);
INSERT INTO `t_class` VALUES (1084, '40计算机科学与技术4班', 4, 104, 2040);
INSERT INTO `t_class` VALUES (1085, '40计算机科学与技术5班', 5, 104, 2040);
INSERT INTO `t_class` VALUES (1086, '40计算机科学与技术6班', 6, 104, 2040);
INSERT INTO `t_class` VALUES (1087, '40计算机科学与技术7班', 7, 104, 2040);
INSERT INTO `t_class` VALUES (1088, '40计算机科学与技术8班', 8, 104, 2040);
INSERT INTO `t_class` VALUES (1089, '40软件工程1班', 1, 105, 2040);
INSERT INTO `t_class` VALUES (1090, '40软件工程2班', 2, 105, 2040);
INSERT INTO `t_class` VALUES (1091, '40软件工程3班', 3, 105, 2040);
INSERT INTO `t_class` VALUES (1092, '40软件工程4班', 4, 105, 2040);
INSERT INTO `t_class` VALUES (1093, '40软件工程5班', 5, 105, 2040);
INSERT INTO `t_class` VALUES (1094, '40软件工程6班', 6, 105, 2040);
INSERT INTO `t_class` VALUES (1095, '40软件工程7班', 7, 105, 2040);
INSERT INTO `t_class` VALUES (1096, '40软件工程8班', 8, 105, 2040);
INSERT INTO `t_class` VALUES (1097, '40计算机类1班', 1, 106, 2040);
INSERT INTO `t_class` VALUES (1098, '40计算机类2班', 2, 106, 2040);
INSERT INTO `t_class` VALUES (1099, '40计算机类3班', 3, 106, 2040);
INSERT INTO `t_class` VALUES (1100, '40计算机类4班', 4, 106, 2040);
INSERT INTO `t_class` VALUES (1101, '40计算机类5班', 5, 106, 2040);
INSERT INTO `t_class` VALUES (1102, '40计算机类6班', 6, 106, 2040);
INSERT INTO `t_class` VALUES (1103, '40计算机类7班', 7, 106, 2040);
INSERT INTO `t_class` VALUES (1104, '40计算机类8班', 8, 106, 2040);
INSERT INTO `t_class` VALUES (1105, '41电子信息工程1班', 1, 101, 2041);
INSERT INTO `t_class` VALUES (1106, '41电子信息工程2班', 2, 101, 2041);
INSERT INTO `t_class` VALUES (1107, '41电子信息工程3班', 3, 101, 2041);
INSERT INTO `t_class` VALUES (1108, '41电子信息工程4班', 4, 101, 2041);
INSERT INTO `t_class` VALUES (1109, '41电子信息工程5班', 5, 101, 2041);
INSERT INTO `t_class` VALUES (1110, '41电子信息工程6班', 6, 101, 2041);
INSERT INTO `t_class` VALUES (1111, '41电子信息工程7班', 7, 101, 2041);
INSERT INTO `t_class` VALUES (1112, '41电子信息工程8班', 8, 101, 2041);
INSERT INTO `t_class` VALUES (1113, '41电子科学与技术1班', 1, 102, 2041);
INSERT INTO `t_class` VALUES (1114, '41电子科学与技术2班', 2, 102, 2041);
INSERT INTO `t_class` VALUES (1115, '41电子科学与技术3班', 3, 102, 2041);
INSERT INTO `t_class` VALUES (1116, '41电子科学与技术4班', 4, 102, 2041);
INSERT INTO `t_class` VALUES (1117, '41电子科学与技术5班', 5, 102, 2041);
INSERT INTO `t_class` VALUES (1118, '41电子科学与技术6班', 6, 102, 2041);
INSERT INTO `t_class` VALUES (1119, '41电子科学与技术7班', 7, 102, 2041);
INSERT INTO `t_class` VALUES (1120, '41电子科学与技术8班', 8, 102, 2041);
INSERT INTO `t_class` VALUES (1121, '41自动化1班', 1, 103, 2041);
INSERT INTO `t_class` VALUES (1122, '41自动化2班', 2, 103, 2041);
INSERT INTO `t_class` VALUES (1123, '41自动化3班', 3, 103, 2041);
INSERT INTO `t_class` VALUES (1124, '41自动化4班', 4, 103, 2041);
INSERT INTO `t_class` VALUES (1125, '41自动化5班', 5, 103, 2041);
INSERT INTO `t_class` VALUES (1126, '41自动化6班', 6, 103, 2041);
INSERT INTO `t_class` VALUES (1127, '41自动化7班', 7, 103, 2041);
INSERT INTO `t_class` VALUES (1128, '41自动化8班', 8, 103, 2041);
INSERT INTO `t_class` VALUES (1129, '41计算机科学与技术1班', 1, 104, 2041);
INSERT INTO `t_class` VALUES (1130, '41计算机科学与技术2班', 2, 104, 2041);
INSERT INTO `t_class` VALUES (1131, '41计算机科学与技术3班', 3, 104, 2041);
INSERT INTO `t_class` VALUES (1132, '41计算机科学与技术4班', 4, 104, 2041);
INSERT INTO `t_class` VALUES (1133, '41计算机科学与技术5班', 5, 104, 2041);
INSERT INTO `t_class` VALUES (1134, '41计算机科学与技术6班', 6, 104, 2041);
INSERT INTO `t_class` VALUES (1135, '41计算机科学与技术7班', 7, 104, 2041);
INSERT INTO `t_class` VALUES (1136, '41计算机科学与技术8班', 8, 104, 2041);
INSERT INTO `t_class` VALUES (1137, '41软件工程1班', 1, 105, 2041);
INSERT INTO `t_class` VALUES (1138, '41软件工程2班', 2, 105, 2041);
INSERT INTO `t_class` VALUES (1139, '41软件工程3班', 3, 105, 2041);
INSERT INTO `t_class` VALUES (1140, '41软件工程4班', 4, 105, 2041);
INSERT INTO `t_class` VALUES (1141, '41软件工程5班', 5, 105, 2041);
INSERT INTO `t_class` VALUES (1142, '41软件工程6班', 6, 105, 2041);
INSERT INTO `t_class` VALUES (1143, '41软件工程7班', 7, 105, 2041);
INSERT INTO `t_class` VALUES (1144, '41软件工程8班', 8, 105, 2041);
INSERT INTO `t_class` VALUES (1145, '41计算机类1班', 1, 106, 2041);
INSERT INTO `t_class` VALUES (1146, '41计算机类2班', 2, 106, 2041);
INSERT INTO `t_class` VALUES (1147, '41计算机类3班', 3, 106, 2041);
INSERT INTO `t_class` VALUES (1148, '41计算机类4班', 4, 106, 2041);
INSERT INTO `t_class` VALUES (1149, '41计算机类5班', 5, 106, 2041);
INSERT INTO `t_class` VALUES (1150, '41计算机类6班', 6, 106, 2041);
INSERT INTO `t_class` VALUES (1151, '41计算机类7班', 7, 106, 2041);
INSERT INTO `t_class` VALUES (1152, '41计算机类8班', 8, 106, 2041);
INSERT INTO `t_class` VALUES (1153, '42电子信息工程1班', 1, 101, 2042);
INSERT INTO `t_class` VALUES (1154, '42电子信息工程2班', 2, 101, 2042);
INSERT INTO `t_class` VALUES (1155, '42电子信息工程3班', 3, 101, 2042);
INSERT INTO `t_class` VALUES (1156, '42电子信息工程4班', 4, 101, 2042);
INSERT INTO `t_class` VALUES (1157, '42电子信息工程5班', 5, 101, 2042);
INSERT INTO `t_class` VALUES (1158, '42电子信息工程6班', 6, 101, 2042);
INSERT INTO `t_class` VALUES (1159, '42电子信息工程7班', 7, 101, 2042);
INSERT INTO `t_class` VALUES (1160, '42电子信息工程8班', 8, 101, 2042);
INSERT INTO `t_class` VALUES (1161, '42电子科学与技术1班', 1, 102, 2042);
INSERT INTO `t_class` VALUES (1162, '42电子科学与技术2班', 2, 102, 2042);
INSERT INTO `t_class` VALUES (1163, '42电子科学与技术3班', 3, 102, 2042);
INSERT INTO `t_class` VALUES (1164, '42电子科学与技术4班', 4, 102, 2042);
INSERT INTO `t_class` VALUES (1165, '42电子科学与技术5班', 5, 102, 2042);
INSERT INTO `t_class` VALUES (1166, '42电子科学与技术6班', 6, 102, 2042);
INSERT INTO `t_class` VALUES (1167, '42电子科学与技术7班', 7, 102, 2042);
INSERT INTO `t_class` VALUES (1168, '42电子科学与技术8班', 8, 102, 2042);
INSERT INTO `t_class` VALUES (1169, '42自动化1班', 1, 103, 2042);
INSERT INTO `t_class` VALUES (1170, '42自动化2班', 2, 103, 2042);
INSERT INTO `t_class` VALUES (1171, '42自动化3班', 3, 103, 2042);
INSERT INTO `t_class` VALUES (1172, '42自动化4班', 4, 103, 2042);
INSERT INTO `t_class` VALUES (1173, '42自动化5班', 5, 103, 2042);
INSERT INTO `t_class` VALUES (1174, '42自动化6班', 6, 103, 2042);
INSERT INTO `t_class` VALUES (1175, '42自动化7班', 7, 103, 2042);
INSERT INTO `t_class` VALUES (1176, '42自动化8班', 8, 103, 2042);
INSERT INTO `t_class` VALUES (1177, '42计算机科学与技术1班', 1, 104, 2042);
INSERT INTO `t_class` VALUES (1178, '42计算机科学与技术2班', 2, 104, 2042);
INSERT INTO `t_class` VALUES (1179, '42计算机科学与技术3班', 3, 104, 2042);
INSERT INTO `t_class` VALUES (1180, '42计算机科学与技术4班', 4, 104, 2042);
INSERT INTO `t_class` VALUES (1181, '42计算机科学与技术5班', 5, 104, 2042);
INSERT INTO `t_class` VALUES (1182, '42计算机科学与技术6班', 6, 104, 2042);
INSERT INTO `t_class` VALUES (1183, '42计算机科学与技术7班', 7, 104, 2042);
INSERT INTO `t_class` VALUES (1184, '42计算机科学与技术8班', 8, 104, 2042);
INSERT INTO `t_class` VALUES (1185, '42软件工程1班', 1, 105, 2042);
INSERT INTO `t_class` VALUES (1186, '42软件工程2班', 2, 105, 2042);
INSERT INTO `t_class` VALUES (1187, '42软件工程3班', 3, 105, 2042);
INSERT INTO `t_class` VALUES (1188, '42软件工程4班', 4, 105, 2042);
INSERT INTO `t_class` VALUES (1189, '42软件工程5班', 5, 105, 2042);
INSERT INTO `t_class` VALUES (1190, '42软件工程6班', 6, 105, 2042);
INSERT INTO `t_class` VALUES (1191, '42软件工程7班', 7, 105, 2042);
INSERT INTO `t_class` VALUES (1192, '42软件工程8班', 8, 105, 2042);
INSERT INTO `t_class` VALUES (1193, '42计算机类1班', 1, 106, 2042);
INSERT INTO `t_class` VALUES (1194, '42计算机类2班', 2, 106, 2042);
INSERT INTO `t_class` VALUES (1195, '42计算机类3班', 3, 106, 2042);
INSERT INTO `t_class` VALUES (1196, '42计算机类4班', 4, 106, 2042);
INSERT INTO `t_class` VALUES (1197, '42计算机类5班', 5, 106, 2042);
INSERT INTO `t_class` VALUES (1198, '42计算机类6班', 6, 106, 2042);
INSERT INTO `t_class` VALUES (1199, '42计算机类7班', 7, 106, 2042);
INSERT INTO `t_class` VALUES (1200, '42计算机类8班', 8, 106, 2042);
INSERT INTO `t_class` VALUES (1201, '43电子信息工程1班', 1, 101, 2043);
INSERT INTO `t_class` VALUES (1202, '43电子信息工程2班', 2, 101, 2043);
INSERT INTO `t_class` VALUES (1203, '43电子信息工程3班', 3, 101, 2043);
INSERT INTO `t_class` VALUES (1204, '43电子信息工程4班', 4, 101, 2043);
INSERT INTO `t_class` VALUES (1205, '43电子信息工程5班', 5, 101, 2043);
INSERT INTO `t_class` VALUES (1206, '43电子信息工程6班', 6, 101, 2043);
INSERT INTO `t_class` VALUES (1207, '43电子信息工程7班', 7, 101, 2043);
INSERT INTO `t_class` VALUES (1208, '43电子信息工程8班', 8, 101, 2043);
INSERT INTO `t_class` VALUES (1209, '43电子科学与技术1班', 1, 102, 2043);
INSERT INTO `t_class` VALUES (1210, '43电子科学与技术2班', 2, 102, 2043);
INSERT INTO `t_class` VALUES (1211, '43电子科学与技术3班', 3, 102, 2043);
INSERT INTO `t_class` VALUES (1212, '43电子科学与技术4班', 4, 102, 2043);
INSERT INTO `t_class` VALUES (1213, '43电子科学与技术5班', 5, 102, 2043);
INSERT INTO `t_class` VALUES (1214, '43电子科学与技术6班', 6, 102, 2043);
INSERT INTO `t_class` VALUES (1215, '43电子科学与技术7班', 7, 102, 2043);
INSERT INTO `t_class` VALUES (1216, '43电子科学与技术8班', 8, 102, 2043);
INSERT INTO `t_class` VALUES (1217, '43自动化1班', 1, 103, 2043);
INSERT INTO `t_class` VALUES (1218, '43自动化2班', 2, 103, 2043);
INSERT INTO `t_class` VALUES (1219, '43自动化3班', 3, 103, 2043);
INSERT INTO `t_class` VALUES (1220, '43自动化4班', 4, 103, 2043);
INSERT INTO `t_class` VALUES (1221, '43自动化5班', 5, 103, 2043);
INSERT INTO `t_class` VALUES (1222, '43自动化6班', 6, 103, 2043);
INSERT INTO `t_class` VALUES (1223, '43自动化7班', 7, 103, 2043);
INSERT INTO `t_class` VALUES (1224, '43自动化8班', 8, 103, 2043);
INSERT INTO `t_class` VALUES (1225, '43计算机科学与技术1班', 1, 104, 2043);
INSERT INTO `t_class` VALUES (1226, '43计算机科学与技术2班', 2, 104, 2043);
INSERT INTO `t_class` VALUES (1227, '43计算机科学与技术3班', 3, 104, 2043);
INSERT INTO `t_class` VALUES (1228, '43计算机科学与技术4班', 4, 104, 2043);
INSERT INTO `t_class` VALUES (1229, '43计算机科学与技术5班', 5, 104, 2043);
INSERT INTO `t_class` VALUES (1230, '43计算机科学与技术6班', 6, 104, 2043);
INSERT INTO `t_class` VALUES (1231, '43计算机科学与技术7班', 7, 104, 2043);
INSERT INTO `t_class` VALUES (1232, '43计算机科学与技术8班', 8, 104, 2043);
INSERT INTO `t_class` VALUES (1233, '43软件工程1班', 1, 105, 2043);
INSERT INTO `t_class` VALUES (1234, '43软件工程2班', 2, 105, 2043);
INSERT INTO `t_class` VALUES (1235, '43软件工程3班', 3, 105, 2043);
INSERT INTO `t_class` VALUES (1236, '43软件工程4班', 4, 105, 2043);
INSERT INTO `t_class` VALUES (1237, '43软件工程5班', 5, 105, 2043);
INSERT INTO `t_class` VALUES (1238, '43软件工程6班', 6, 105, 2043);
INSERT INTO `t_class` VALUES (1239, '43软件工程7班', 7, 105, 2043);
INSERT INTO `t_class` VALUES (1240, '43软件工程8班', 8, 105, 2043);
INSERT INTO `t_class` VALUES (1241, '43计算机类1班', 1, 106, 2043);
INSERT INTO `t_class` VALUES (1242, '43计算机类2班', 2, 106, 2043);
INSERT INTO `t_class` VALUES (1243, '43计算机类3班', 3, 106, 2043);
INSERT INTO `t_class` VALUES (1244, '43计算机类4班', 4, 106, 2043);
INSERT INTO `t_class` VALUES (1245, '43计算机类5班', 5, 106, 2043);
INSERT INTO `t_class` VALUES (1246, '43计算机类6班', 6, 106, 2043);
INSERT INTO `t_class` VALUES (1247, '43计算机类7班', 7, 106, 2043);
INSERT INTO `t_class` VALUES (1248, '43计算机类8班', 8, 106, 2043);
INSERT INTO `t_class` VALUES (1249, '44电子信息工程1班', 1, 101, 2044);
INSERT INTO `t_class` VALUES (1250, '44电子信息工程2班', 2, 101, 2044);
INSERT INTO `t_class` VALUES (1251, '44电子信息工程3班', 3, 101, 2044);
INSERT INTO `t_class` VALUES (1252, '44电子信息工程4班', 4, 101, 2044);
INSERT INTO `t_class` VALUES (1253, '44电子信息工程5班', 5, 101, 2044);
INSERT INTO `t_class` VALUES (1254, '44电子信息工程6班', 6, 101, 2044);
INSERT INTO `t_class` VALUES (1255, '44电子信息工程7班', 7, 101, 2044);
INSERT INTO `t_class` VALUES (1256, '44电子信息工程8班', 8, 101, 2044);
INSERT INTO `t_class` VALUES (1257, '44电子科学与技术1班', 1, 102, 2044);
INSERT INTO `t_class` VALUES (1258, '44电子科学与技术2班', 2, 102, 2044);
INSERT INTO `t_class` VALUES (1259, '44电子科学与技术3班', 3, 102, 2044);
INSERT INTO `t_class` VALUES (1260, '44电子科学与技术4班', 4, 102, 2044);
INSERT INTO `t_class` VALUES (1261, '44电子科学与技术5班', 5, 102, 2044);
INSERT INTO `t_class` VALUES (1262, '44电子科学与技术6班', 6, 102, 2044);
INSERT INTO `t_class` VALUES (1263, '44电子科学与技术7班', 7, 102, 2044);
INSERT INTO `t_class` VALUES (1264, '44电子科学与技术8班', 8, 102, 2044);
INSERT INTO `t_class` VALUES (1265, '44自动化1班', 1, 103, 2044);
INSERT INTO `t_class` VALUES (1266, '44自动化2班', 2, 103, 2044);
INSERT INTO `t_class` VALUES (1267, '44自动化3班', 3, 103, 2044);
INSERT INTO `t_class` VALUES (1268, '44自动化4班', 4, 103, 2044);
INSERT INTO `t_class` VALUES (1269, '44自动化5班', 5, 103, 2044);
INSERT INTO `t_class` VALUES (1270, '44自动化6班', 6, 103, 2044);
INSERT INTO `t_class` VALUES (1271, '44自动化7班', 7, 103, 2044);
INSERT INTO `t_class` VALUES (1272, '44自动化8班', 8, 103, 2044);
INSERT INTO `t_class` VALUES (1273, '44计算机科学与技术1班', 1, 104, 2044);
INSERT INTO `t_class` VALUES (1274, '44计算机科学与技术2班', 2, 104, 2044);
INSERT INTO `t_class` VALUES (1275, '44计算机科学与技术3班', 3, 104, 2044);
INSERT INTO `t_class` VALUES (1276, '44计算机科学与技术4班', 4, 104, 2044);
INSERT INTO `t_class` VALUES (1277, '44计算机科学与技术5班', 5, 104, 2044);
INSERT INTO `t_class` VALUES (1278, '44计算机科学与技术6班', 6, 104, 2044);
INSERT INTO `t_class` VALUES (1279, '44计算机科学与技术7班', 7, 104, 2044);
INSERT INTO `t_class` VALUES (1280, '44计算机科学与技术8班', 8, 104, 2044);
INSERT INTO `t_class` VALUES (1281, '44软件工程1班', 1, 105, 2044);
INSERT INTO `t_class` VALUES (1282, '44软件工程2班', 2, 105, 2044);
INSERT INTO `t_class` VALUES (1283, '44软件工程3班', 3, 105, 2044);
INSERT INTO `t_class` VALUES (1284, '44软件工程4班', 4, 105, 2044);
INSERT INTO `t_class` VALUES (1285, '44软件工程5班', 5, 105, 2044);
INSERT INTO `t_class` VALUES (1286, '44软件工程6班', 6, 105, 2044);
INSERT INTO `t_class` VALUES (1287, '44软件工程7班', 7, 105, 2044);
INSERT INTO `t_class` VALUES (1288, '44软件工程8班', 8, 105, 2044);
INSERT INTO `t_class` VALUES (1289, '44计算机类1班', 1, 106, 2044);
INSERT INTO `t_class` VALUES (1290, '44计算机类2班', 2, 106, 2044);
INSERT INTO `t_class` VALUES (1291, '44计算机类3班', 3, 106, 2044);
INSERT INTO `t_class` VALUES (1292, '44计算机类4班', 4, 106, 2044);
INSERT INTO `t_class` VALUES (1293, '44计算机类5班', 5, 106, 2044);
INSERT INTO `t_class` VALUES (1294, '44计算机类6班', 6, 106, 2044);
INSERT INTO `t_class` VALUES (1295, '44计算机类7班', 7, 106, 2044);
INSERT INTO `t_class` VALUES (1296, '44计算机类8班', 8, 106, 2044);
INSERT INTO `t_class` VALUES (1297, '45电子信息工程1班', 1, 101, 2045);
INSERT INTO `t_class` VALUES (1298, '45电子信息工程2班', 2, 101, 2045);
INSERT INTO `t_class` VALUES (1299, '45电子信息工程3班', 3, 101, 2045);
INSERT INTO `t_class` VALUES (1300, '45电子信息工程4班', 4, 101, 2045);
INSERT INTO `t_class` VALUES (1301, '45电子信息工程5班', 5, 101, 2045);
INSERT INTO `t_class` VALUES (1302, '45电子信息工程6班', 6, 101, 2045);
INSERT INTO `t_class` VALUES (1303, '45电子信息工程7班', 7, 101, 2045);
INSERT INTO `t_class` VALUES (1304, '45电子信息工程8班', 8, 101, 2045);
INSERT INTO `t_class` VALUES (1305, '45电子科学与技术1班', 1, 102, 2045);
INSERT INTO `t_class` VALUES (1306, '45电子科学与技术2班', 2, 102, 2045);
INSERT INTO `t_class` VALUES (1307, '45电子科学与技术3班', 3, 102, 2045);
INSERT INTO `t_class` VALUES (1308, '45电子科学与技术4班', 4, 102, 2045);
INSERT INTO `t_class` VALUES (1309, '45电子科学与技术5班', 5, 102, 2045);
INSERT INTO `t_class` VALUES (1310, '45电子科学与技术6班', 6, 102, 2045);
INSERT INTO `t_class` VALUES (1311, '45电子科学与技术7班', 7, 102, 2045);
INSERT INTO `t_class` VALUES (1312, '45电子科学与技术8班', 8, 102, 2045);
INSERT INTO `t_class` VALUES (1313, '45自动化1班', 1, 103, 2045);
INSERT INTO `t_class` VALUES (1314, '45自动化2班', 2, 103, 2045);
INSERT INTO `t_class` VALUES (1315, '45自动化3班', 3, 103, 2045);
INSERT INTO `t_class` VALUES (1316, '45自动化4班', 4, 103, 2045);
INSERT INTO `t_class` VALUES (1317, '45自动化5班', 5, 103, 2045);
INSERT INTO `t_class` VALUES (1318, '45自动化6班', 6, 103, 2045);
INSERT INTO `t_class` VALUES (1319, '45自动化7班', 7, 103, 2045);
INSERT INTO `t_class` VALUES (1320, '45自动化8班', 8, 103, 2045);
INSERT INTO `t_class` VALUES (1321, '45计算机科学与技术1班', 1, 104, 2045);
INSERT INTO `t_class` VALUES (1322, '45计算机科学与技术2班', 2, 104, 2045);
INSERT INTO `t_class` VALUES (1323, '45计算机科学与技术3班', 3, 104, 2045);
INSERT INTO `t_class` VALUES (1324, '45计算机科学与技术4班', 4, 104, 2045);
INSERT INTO `t_class` VALUES (1325, '45计算机科学与技术5班', 5, 104, 2045);
INSERT INTO `t_class` VALUES (1326, '45计算机科学与技术6班', 6, 104, 2045);
INSERT INTO `t_class` VALUES (1327, '45计算机科学与技术7班', 7, 104, 2045);
INSERT INTO `t_class` VALUES (1328, '45计算机科学与技术8班', 8, 104, 2045);
INSERT INTO `t_class` VALUES (1329, '45软件工程1班', 1, 105, 2045);
INSERT INTO `t_class` VALUES (1330, '45软件工程2班', 2, 105, 2045);
INSERT INTO `t_class` VALUES (1331, '45软件工程3班', 3, 105, 2045);
INSERT INTO `t_class` VALUES (1332, '45软件工程4班', 4, 105, 2045);
INSERT INTO `t_class` VALUES (1333, '45软件工程5班', 5, 105, 2045);
INSERT INTO `t_class` VALUES (1334, '45软件工程6班', 6, 105, 2045);
INSERT INTO `t_class` VALUES (1335, '45软件工程7班', 7, 105, 2045);
INSERT INTO `t_class` VALUES (1336, '45软件工程8班', 8, 105, 2045);
INSERT INTO `t_class` VALUES (1337, '45计算机类1班', 1, 106, 2045);
INSERT INTO `t_class` VALUES (1338, '45计算机类2班', 2, 106, 2045);
INSERT INTO `t_class` VALUES (1339, '45计算机类3班', 3, 106, 2045);
INSERT INTO `t_class` VALUES (1340, '45计算机类4班', 4, 106, 2045);
INSERT INTO `t_class` VALUES (1341, '45计算机类5班', 5, 106, 2045);
INSERT INTO `t_class` VALUES (1342, '45计算机类6班', 6, 106, 2045);
INSERT INTO `t_class` VALUES (1343, '45计算机类7班', 7, 106, 2045);
INSERT INTO `t_class` VALUES (1344, '45计算机类8班', 8, 106, 2045);
INSERT INTO `t_class` VALUES (1345, '46电子信息工程1班', 1, 101, 2046);
INSERT INTO `t_class` VALUES (1346, '46电子信息工程2班', 2, 101, 2046);
INSERT INTO `t_class` VALUES (1347, '46电子信息工程3班', 3, 101, 2046);
INSERT INTO `t_class` VALUES (1348, '46电子信息工程4班', 4, 101, 2046);
INSERT INTO `t_class` VALUES (1349, '46电子信息工程5班', 5, 101, 2046);
INSERT INTO `t_class` VALUES (1350, '46电子信息工程6班', 6, 101, 2046);
INSERT INTO `t_class` VALUES (1351, '46电子信息工程7班', 7, 101, 2046);
INSERT INTO `t_class` VALUES (1352, '46电子信息工程8班', 8, 101, 2046);
INSERT INTO `t_class` VALUES (1353, '46电子科学与技术1班', 1, 102, 2046);
INSERT INTO `t_class` VALUES (1354, '46电子科学与技术2班', 2, 102, 2046);
INSERT INTO `t_class` VALUES (1355, '46电子科学与技术3班', 3, 102, 2046);
INSERT INTO `t_class` VALUES (1356, '46电子科学与技术4班', 4, 102, 2046);
INSERT INTO `t_class` VALUES (1357, '46电子科学与技术5班', 5, 102, 2046);
INSERT INTO `t_class` VALUES (1358, '46电子科学与技术6班', 6, 102, 2046);
INSERT INTO `t_class` VALUES (1359, '46电子科学与技术7班', 7, 102, 2046);
INSERT INTO `t_class` VALUES (1360, '46电子科学与技术8班', 8, 102, 2046);
INSERT INTO `t_class` VALUES (1361, '46自动化1班', 1, 103, 2046);
INSERT INTO `t_class` VALUES (1362, '46自动化2班', 2, 103, 2046);
INSERT INTO `t_class` VALUES (1363, '46自动化3班', 3, 103, 2046);
INSERT INTO `t_class` VALUES (1364, '46自动化4班', 4, 103, 2046);
INSERT INTO `t_class` VALUES (1365, '46自动化5班', 5, 103, 2046);
INSERT INTO `t_class` VALUES (1366, '46自动化6班', 6, 103, 2046);
INSERT INTO `t_class` VALUES (1367, '46自动化7班', 7, 103, 2046);
INSERT INTO `t_class` VALUES (1368, '46自动化8班', 8, 103, 2046);
INSERT INTO `t_class` VALUES (1369, '46计算机科学与技术1班', 1, 104, 2046);
INSERT INTO `t_class` VALUES (1370, '46计算机科学与技术2班', 2, 104, 2046);
INSERT INTO `t_class` VALUES (1371, '46计算机科学与技术3班', 3, 104, 2046);
INSERT INTO `t_class` VALUES (1372, '46计算机科学与技术4班', 4, 104, 2046);
INSERT INTO `t_class` VALUES (1373, '46计算机科学与技术5班', 5, 104, 2046);
INSERT INTO `t_class` VALUES (1374, '46计算机科学与技术6班', 6, 104, 2046);
INSERT INTO `t_class` VALUES (1375, '46计算机科学与技术7班', 7, 104, 2046);
INSERT INTO `t_class` VALUES (1376, '46计算机科学与技术8班', 8, 104, 2046);
INSERT INTO `t_class` VALUES (1377, '46软件工程1班', 1, 105, 2046);
INSERT INTO `t_class` VALUES (1378, '46软件工程2班', 2, 105, 2046);
INSERT INTO `t_class` VALUES (1379, '46软件工程3班', 3, 105, 2046);
INSERT INTO `t_class` VALUES (1380, '46软件工程4班', 4, 105, 2046);
INSERT INTO `t_class` VALUES (1381, '46软件工程5班', 5, 105, 2046);
INSERT INTO `t_class` VALUES (1382, '46软件工程6班', 6, 105, 2046);
INSERT INTO `t_class` VALUES (1383, '46软件工程7班', 7, 105, 2046);
INSERT INTO `t_class` VALUES (1384, '46软件工程8班', 8, 105, 2046);
INSERT INTO `t_class` VALUES (1385, '46计算机类1班', 1, 106, 2046);
INSERT INTO `t_class` VALUES (1386, '46计算机类2班', 2, 106, 2046);
INSERT INTO `t_class` VALUES (1387, '46计算机类3班', 3, 106, 2046);
INSERT INTO `t_class` VALUES (1388, '46计算机类4班', 4, 106, 2046);
INSERT INTO `t_class` VALUES (1389, '46计算机类5班', 5, 106, 2046);
INSERT INTO `t_class` VALUES (1390, '46计算机类6班', 6, 106, 2046);
INSERT INTO `t_class` VALUES (1391, '46计算机类7班', 7, 106, 2046);
INSERT INTO `t_class` VALUES (1392, '46计算机类8班', 8, 106, 2046);
INSERT INTO `t_class` VALUES (1393, '47电子信息工程1班', 1, 101, 2047);
INSERT INTO `t_class` VALUES (1394, '47电子信息工程2班', 2, 101, 2047);
INSERT INTO `t_class` VALUES (1395, '47电子信息工程3班', 3, 101, 2047);
INSERT INTO `t_class` VALUES (1396, '47电子信息工程4班', 4, 101, 2047);
INSERT INTO `t_class` VALUES (1397, '47电子信息工程5班', 5, 101, 2047);
INSERT INTO `t_class` VALUES (1398, '47电子信息工程6班', 6, 101, 2047);
INSERT INTO `t_class` VALUES (1399, '47电子信息工程7班', 7, 101, 2047);
INSERT INTO `t_class` VALUES (1400, '47电子信息工程8班', 8, 101, 2047);
INSERT INTO `t_class` VALUES (1401, '47电子科学与技术1班', 1, 102, 2047);
INSERT INTO `t_class` VALUES (1402, '47电子科学与技术2班', 2, 102, 2047);
INSERT INTO `t_class` VALUES (1403, '47电子科学与技术3班', 3, 102, 2047);
INSERT INTO `t_class` VALUES (1404, '47电子科学与技术4班', 4, 102, 2047);
INSERT INTO `t_class` VALUES (1405, '47电子科学与技术5班', 5, 102, 2047);
INSERT INTO `t_class` VALUES (1406, '47电子科学与技术6班', 6, 102, 2047);
INSERT INTO `t_class` VALUES (1407, '47电子科学与技术7班', 7, 102, 2047);
INSERT INTO `t_class` VALUES (1408, '47电子科学与技术8班', 8, 102, 2047);
INSERT INTO `t_class` VALUES (1409, '47自动化1班', 1, 103, 2047);
INSERT INTO `t_class` VALUES (1410, '47自动化2班', 2, 103, 2047);
INSERT INTO `t_class` VALUES (1411, '47自动化3班', 3, 103, 2047);
INSERT INTO `t_class` VALUES (1412, '47自动化4班', 4, 103, 2047);
INSERT INTO `t_class` VALUES (1413, '47自动化5班', 5, 103, 2047);
INSERT INTO `t_class` VALUES (1414, '47自动化6班', 6, 103, 2047);
INSERT INTO `t_class` VALUES (1415, '47自动化7班', 7, 103, 2047);
INSERT INTO `t_class` VALUES (1416, '47自动化8班', 8, 103, 2047);
INSERT INTO `t_class` VALUES (1417, '47计算机科学与技术1班', 1, 104, 2047);
INSERT INTO `t_class` VALUES (1418, '47计算机科学与技术2班', 2, 104, 2047);
INSERT INTO `t_class` VALUES (1419, '47计算机科学与技术3班', 3, 104, 2047);
INSERT INTO `t_class` VALUES (1420, '47计算机科学与技术4班', 4, 104, 2047);
INSERT INTO `t_class` VALUES (1421, '47计算机科学与技术5班', 5, 104, 2047);
INSERT INTO `t_class` VALUES (1422, '47计算机科学与技术6班', 6, 104, 2047);
INSERT INTO `t_class` VALUES (1423, '47计算机科学与技术7班', 7, 104, 2047);
INSERT INTO `t_class` VALUES (1424, '47计算机科学与技术8班', 8, 104, 2047);
INSERT INTO `t_class` VALUES (1425, '47软件工程1班', 1, 105, 2047);
INSERT INTO `t_class` VALUES (1426, '47软件工程2班', 2, 105, 2047);
INSERT INTO `t_class` VALUES (1427, '47软件工程3班', 3, 105, 2047);
INSERT INTO `t_class` VALUES (1428, '47软件工程4班', 4, 105, 2047);
INSERT INTO `t_class` VALUES (1429, '47软件工程5班', 5, 105, 2047);
INSERT INTO `t_class` VALUES (1430, '47软件工程6班', 6, 105, 2047);
INSERT INTO `t_class` VALUES (1431, '47软件工程7班', 7, 105, 2047);
INSERT INTO `t_class` VALUES (1432, '47软件工程8班', 8, 105, 2047);
INSERT INTO `t_class` VALUES (1433, '47计算机类1班', 1, 106, 2047);
INSERT INTO `t_class` VALUES (1434, '47计算机类2班', 2, 106, 2047);
INSERT INTO `t_class` VALUES (1435, '47计算机类3班', 3, 106, 2047);
INSERT INTO `t_class` VALUES (1436, '47计算机类4班', 4, 106, 2047);
INSERT INTO `t_class` VALUES (1437, '47计算机类5班', 5, 106, 2047);
INSERT INTO `t_class` VALUES (1438, '47计算机类6班', 6, 106, 2047);
INSERT INTO `t_class` VALUES (1439, '47计算机类7班', 7, 106, 2047);
INSERT INTO `t_class` VALUES (1440, '47计算机类8班', 8, 106, 2047);
INSERT INTO `t_class` VALUES (1441, '48电子信息工程1班', 1, 101, 2048);
INSERT INTO `t_class` VALUES (1442, '48电子信息工程2班', 2, 101, 2048);
INSERT INTO `t_class` VALUES (1443, '48电子信息工程3班', 3, 101, 2048);
INSERT INTO `t_class` VALUES (1444, '48电子信息工程4班', 4, 101, 2048);
INSERT INTO `t_class` VALUES (1445, '48电子信息工程5班', 5, 101, 2048);
INSERT INTO `t_class` VALUES (1446, '48电子信息工程6班', 6, 101, 2048);
INSERT INTO `t_class` VALUES (1447, '48电子信息工程7班', 7, 101, 2048);
INSERT INTO `t_class` VALUES (1448, '48电子信息工程8班', 8, 101, 2048);
INSERT INTO `t_class` VALUES (1449, '48电子科学与技术1班', 1, 102, 2048);
INSERT INTO `t_class` VALUES (1450, '48电子科学与技术2班', 2, 102, 2048);
INSERT INTO `t_class` VALUES (1451, '48电子科学与技术3班', 3, 102, 2048);
INSERT INTO `t_class` VALUES (1452, '48电子科学与技术4班', 4, 102, 2048);
INSERT INTO `t_class` VALUES (1453, '48电子科学与技术5班', 5, 102, 2048);
INSERT INTO `t_class` VALUES (1454, '48电子科学与技术6班', 6, 102, 2048);
INSERT INTO `t_class` VALUES (1455, '48电子科学与技术7班', 7, 102, 2048);
INSERT INTO `t_class` VALUES (1456, '48电子科学与技术8班', 8, 102, 2048);
INSERT INTO `t_class` VALUES (1457, '48自动化1班', 1, 103, 2048);
INSERT INTO `t_class` VALUES (1458, '48自动化2班', 2, 103, 2048);
INSERT INTO `t_class` VALUES (1459, '48自动化3班', 3, 103, 2048);
INSERT INTO `t_class` VALUES (1460, '48自动化4班', 4, 103, 2048);
INSERT INTO `t_class` VALUES (1461, '48自动化5班', 5, 103, 2048);
INSERT INTO `t_class` VALUES (1462, '48自动化6班', 6, 103, 2048);
INSERT INTO `t_class` VALUES (1463, '48自动化7班', 7, 103, 2048);
INSERT INTO `t_class` VALUES (1464, '48自动化8班', 8, 103, 2048);
INSERT INTO `t_class` VALUES (1465, '48计算机科学与技术1班', 1, 104, 2048);
INSERT INTO `t_class` VALUES (1466, '48计算机科学与技术2班', 2, 104, 2048);
INSERT INTO `t_class` VALUES (1467, '48计算机科学与技术3班', 3, 104, 2048);
INSERT INTO `t_class` VALUES (1468, '48计算机科学与技术4班', 4, 104, 2048);
INSERT INTO `t_class` VALUES (1469, '48计算机科学与技术5班', 5, 104, 2048);
INSERT INTO `t_class` VALUES (1470, '48计算机科学与技术6班', 6, 104, 2048);
INSERT INTO `t_class` VALUES (1471, '48计算机科学与技术7班', 7, 104, 2048);
INSERT INTO `t_class` VALUES (1472, '48计算机科学与技术8班', 8, 104, 2048);
INSERT INTO `t_class` VALUES (1473, '48软件工程1班', 1, 105, 2048);
INSERT INTO `t_class` VALUES (1474, '48软件工程2班', 2, 105, 2048);
INSERT INTO `t_class` VALUES (1475, '48软件工程3班', 3, 105, 2048);
INSERT INTO `t_class` VALUES (1476, '48软件工程4班', 4, 105, 2048);
INSERT INTO `t_class` VALUES (1477, '48软件工程5班', 5, 105, 2048);
INSERT INTO `t_class` VALUES (1478, '48软件工程6班', 6, 105, 2048);
INSERT INTO `t_class` VALUES (1479, '48软件工程7班', 7, 105, 2048);
INSERT INTO `t_class` VALUES (1480, '48软件工程8班', 8, 105, 2048);
INSERT INTO `t_class` VALUES (1481, '48计算机类1班', 1, 106, 2048);
INSERT INTO `t_class` VALUES (1482, '48计算机类2班', 2, 106, 2048);
INSERT INTO `t_class` VALUES (1483, '48计算机类3班', 3, 106, 2048);
INSERT INTO `t_class` VALUES (1484, '48计算机类4班', 4, 106, 2048);
INSERT INTO `t_class` VALUES (1485, '48计算机类5班', 5, 106, 2048);
INSERT INTO `t_class` VALUES (1486, '48计算机类6班', 6, 106, 2048);
INSERT INTO `t_class` VALUES (1487, '48计算机类7班', 7, 106, 2048);
INSERT INTO `t_class` VALUES (1488, '48计算机类8班', 8, 106, 2048);
INSERT INTO `t_class` VALUES (1489, '49电子信息工程1班', 1, 101, 2049);
INSERT INTO `t_class` VALUES (1490, '49电子信息工程2班', 2, 101, 2049);
INSERT INTO `t_class` VALUES (1491, '49电子信息工程3班', 3, 101, 2049);
INSERT INTO `t_class` VALUES (1492, '49电子信息工程4班', 4, 101, 2049);
INSERT INTO `t_class` VALUES (1493, '49电子信息工程5班', 5, 101, 2049);
INSERT INTO `t_class` VALUES (1494, '49电子信息工程6班', 6, 101, 2049);
INSERT INTO `t_class` VALUES (1495, '49电子信息工程7班', 7, 101, 2049);
INSERT INTO `t_class` VALUES (1496, '49电子信息工程8班', 8, 101, 2049);
INSERT INTO `t_class` VALUES (1497, '49电子科学与技术1班', 1, 102, 2049);
INSERT INTO `t_class` VALUES (1498, '49电子科学与技术2班', 2, 102, 2049);
INSERT INTO `t_class` VALUES (1499, '49电子科学与技术3班', 3, 102, 2049);
INSERT INTO `t_class` VALUES (1500, '49电子科学与技术4班', 4, 102, 2049);
INSERT INTO `t_class` VALUES (1501, '49电子科学与技术5班', 5, 102, 2049);
INSERT INTO `t_class` VALUES (1502, '49电子科学与技术6班', 6, 102, 2049);
INSERT INTO `t_class` VALUES (1503, '49电子科学与技术7班', 7, 102, 2049);
INSERT INTO `t_class` VALUES (1504, '49电子科学与技术8班', 8, 102, 2049);
INSERT INTO `t_class` VALUES (1505, '49自动化1班', 1, 103, 2049);
INSERT INTO `t_class` VALUES (1506, '49自动化2班', 2, 103, 2049);
INSERT INTO `t_class` VALUES (1507, '49自动化3班', 3, 103, 2049);
INSERT INTO `t_class` VALUES (1508, '49自动化4班', 4, 103, 2049);
INSERT INTO `t_class` VALUES (1509, '49自动化5班', 5, 103, 2049);
INSERT INTO `t_class` VALUES (1510, '49自动化6班', 6, 103, 2049);
INSERT INTO `t_class` VALUES (1511, '49自动化7班', 7, 103, 2049);
INSERT INTO `t_class` VALUES (1512, '49自动化8班', 8, 103, 2049);
INSERT INTO `t_class` VALUES (1513, '49计算机科学与技术1班', 1, 104, 2049);
INSERT INTO `t_class` VALUES (1514, '49计算机科学与技术2班', 2, 104, 2049);
INSERT INTO `t_class` VALUES (1515, '49计算机科学与技术3班', 3, 104, 2049);
INSERT INTO `t_class` VALUES (1516, '49计算机科学与技术4班', 4, 104, 2049);
INSERT INTO `t_class` VALUES (1517, '49计算机科学与技术5班', 5, 104, 2049);
INSERT INTO `t_class` VALUES (1518, '49计算机科学与技术6班', 6, 104, 2049);
INSERT INTO `t_class` VALUES (1519, '49计算机科学与技术7班', 7, 104, 2049);
INSERT INTO `t_class` VALUES (1520, '49计算机科学与技术8班', 8, 104, 2049);
INSERT INTO `t_class` VALUES (1521, '49软件工程1班', 1, 105, 2049);
INSERT INTO `t_class` VALUES (1522, '49软件工程2班', 2, 105, 2049);
INSERT INTO `t_class` VALUES (1523, '49软件工程3班', 3, 105, 2049);
INSERT INTO `t_class` VALUES (1524, '49软件工程4班', 4, 105, 2049);
INSERT INTO `t_class` VALUES (1525, '49软件工程5班', 5, 105, 2049);
INSERT INTO `t_class` VALUES (1526, '49软件工程6班', 6, 105, 2049);
INSERT INTO `t_class` VALUES (1527, '49软件工程7班', 7, 105, 2049);
INSERT INTO `t_class` VALUES (1528, '49软件工程8班', 8, 105, 2049);
INSERT INTO `t_class` VALUES (1529, '49计算机类1班', 1, 106, 2049);
INSERT INTO `t_class` VALUES (1530, '49计算机类2班', 2, 106, 2049);
INSERT INTO `t_class` VALUES (1531, '49计算机类3班', 3, 106, 2049);
INSERT INTO `t_class` VALUES (1532, '49计算机类4班', 4, 106, 2049);
INSERT INTO `t_class` VALUES (1533, '49计算机类5班', 5, 106, 2049);
INSERT INTO `t_class` VALUES (1534, '49计算机类6班', 6, 106, 2049);
INSERT INTO `t_class` VALUES (1535, '49计算机类7班', 7, 106, 2049);
INSERT INTO `t_class` VALUES (1536, '49计算机类8班', 8, 106, 2049);
INSERT INTO `t_class` VALUES (1537, '50电子信息工程1班', 1, 101, 2050);
INSERT INTO `t_class` VALUES (1538, '50电子信息工程2班', 2, 101, 2050);
INSERT INTO `t_class` VALUES (1539, '50电子信息工程3班', 3, 101, 2050);
INSERT INTO `t_class` VALUES (1540, '50电子信息工程4班', 4, 101, 2050);
INSERT INTO `t_class` VALUES (1541, '50电子信息工程5班', 5, 101, 2050);
INSERT INTO `t_class` VALUES (1542, '50电子信息工程6班', 6, 101, 2050);
INSERT INTO `t_class` VALUES (1543, '50电子信息工程7班', 7, 101, 2050);
INSERT INTO `t_class` VALUES (1544, '50电子信息工程8班', 8, 101, 2050);
INSERT INTO `t_class` VALUES (1545, '50电子科学与技术1班', 1, 102, 2050);
INSERT INTO `t_class` VALUES (1546, '50电子科学与技术2班', 2, 102, 2050);
INSERT INTO `t_class` VALUES (1547, '50电子科学与技术3班', 3, 102, 2050);
INSERT INTO `t_class` VALUES (1548, '50电子科学与技术4班', 4, 102, 2050);
INSERT INTO `t_class` VALUES (1549, '50电子科学与技术5班', 5, 102, 2050);
INSERT INTO `t_class` VALUES (1550, '50电子科学与技术6班', 6, 102, 2050);
INSERT INTO `t_class` VALUES (1551, '50电子科学与技术7班', 7, 102, 2050);
INSERT INTO `t_class` VALUES (1552, '50电子科学与技术8班', 8, 102, 2050);
INSERT INTO `t_class` VALUES (1553, '50自动化1班', 1, 103, 2050);
INSERT INTO `t_class` VALUES (1554, '50自动化2班', 2, 103, 2050);
INSERT INTO `t_class` VALUES (1555, '50自动化3班', 3, 103, 2050);
INSERT INTO `t_class` VALUES (1556, '50自动化4班', 4, 103, 2050);
INSERT INTO `t_class` VALUES (1557, '50自动化5班', 5, 103, 2050);
INSERT INTO `t_class` VALUES (1558, '50自动化6班', 6, 103, 2050);
INSERT INTO `t_class` VALUES (1559, '50自动化7班', 7, 103, 2050);
INSERT INTO `t_class` VALUES (1560, '50自动化8班', 8, 103, 2050);
INSERT INTO `t_class` VALUES (1561, '50计算机科学与技术1班', 1, 104, 2050);
INSERT INTO `t_class` VALUES (1562, '50计算机科学与技术2班', 2, 104, 2050);
INSERT INTO `t_class` VALUES (1563, '50计算机科学与技术3班', 3, 104, 2050);
INSERT INTO `t_class` VALUES (1564, '50计算机科学与技术4班', 4, 104, 2050);
INSERT INTO `t_class` VALUES (1565, '50计算机科学与技术5班', 5, 104, 2050);
INSERT INTO `t_class` VALUES (1566, '50计算机科学与技术6班', 6, 104, 2050);
INSERT INTO `t_class` VALUES (1567, '50计算机科学与技术7班', 7, 104, 2050);
INSERT INTO `t_class` VALUES (1568, '50计算机科学与技术8班', 8, 104, 2050);
INSERT INTO `t_class` VALUES (1569, '50软件工程1班', 1, 105, 2050);
INSERT INTO `t_class` VALUES (1570, '50软件工程2班', 2, 105, 2050);
INSERT INTO `t_class` VALUES (1571, '50软件工程3班', 3, 105, 2050);
INSERT INTO `t_class` VALUES (1572, '50软件工程4班', 4, 105, 2050);
INSERT INTO `t_class` VALUES (1573, '50软件工程5班', 5, 105, 2050);
INSERT INTO `t_class` VALUES (1574, '50软件工程6班', 6, 105, 2050);
INSERT INTO `t_class` VALUES (1575, '50软件工程7班', 7, 105, 2050);
INSERT INTO `t_class` VALUES (1576, '50软件工程8班', 8, 105, 2050);
INSERT INTO `t_class` VALUES (1577, '50计算机类1班', 1, 106, 2050);
INSERT INTO `t_class` VALUES (1578, '50计算机类2班', 2, 106, 2050);
INSERT INTO `t_class` VALUES (1579, '50计算机类3班', 3, 106, 2050);
INSERT INTO `t_class` VALUES (1580, '50计算机类4班', 4, 106, 2050);
INSERT INTO `t_class` VALUES (1581, '50计算机类5班', 5, 106, 2050);
INSERT INTO `t_class` VALUES (1582, '50计算机类6班', 6, 106, 2050);
INSERT INTO `t_class` VALUES (1583, '50计算机类7班', 7, 106, 2050);
INSERT INTO `t_class` VALUES (1584, '50计算机类8班', 8, 106, 2050);

-- ----------------------------
-- Table structure for t_gender
-- ----------------------------
DROP TABLE IF EXISTS `t_gender`;
CREATE TABLE `t_gender`  (
  `id` int(11) NOT NULL COMMENT 'id',
  `genderName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '性别名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '性别表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_gender
-- ----------------------------
INSERT INTO `t_gender` VALUES (1, '男');
INSERT INTO `t_gender` VALUES (2, '女');

-- ----------------------------
-- Table structure for t_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade`  (
  `id` int(11) NOT NULL COMMENT 'id',
  `gradeName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '年级名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '年级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES (2018, '2018');
INSERT INTO `t_grade` VALUES (2019, '2019');
INSERT INTO `t_grade` VALUES (2020, '2020');
INSERT INTO `t_grade` VALUES (2021, '2021');
INSERT INTO `t_grade` VALUES (2022, '2022');
INSERT INTO `t_grade` VALUES (2023, '2023');
INSERT INTO `t_grade` VALUES (2024, '2024');
INSERT INTO `t_grade` VALUES (2025, '2025');
INSERT INTO `t_grade` VALUES (2026, '2026');
INSERT INTO `t_grade` VALUES (2027, '2027');
INSERT INTO `t_grade` VALUES (2028, '2028');
INSERT INTO `t_grade` VALUES (2029, '2029');
INSERT INTO `t_grade` VALUES (2030, '2030');
INSERT INTO `t_grade` VALUES (2031, '2031');
INSERT INTO `t_grade` VALUES (2032, '2032');
INSERT INTO `t_grade` VALUES (2033, '2033');
INSERT INTO `t_grade` VALUES (2034, '2034');
INSERT INTO `t_grade` VALUES (2035, '2035');
INSERT INTO `t_grade` VALUES (2036, '2036');
INSERT INTO `t_grade` VALUES (2037, '2037');
INSERT INTO `t_grade` VALUES (2038, '2038');
INSERT INTO `t_grade` VALUES (2039, '2039');
INSERT INTO `t_grade` VALUES (2040, '2040');
INSERT INTO `t_grade` VALUES (2041, '2041');
INSERT INTO `t_grade` VALUES (2042, '2042');
INSERT INTO `t_grade` VALUES (2043, '2043');
INSERT INTO `t_grade` VALUES (2044, '2044');
INSERT INTO `t_grade` VALUES (2045, '2045');
INSERT INTO `t_grade` VALUES (2046, '2046');
INSERT INTO `t_grade` VALUES (2047, '2047');
INSERT INTO `t_grade` VALUES (2048, '2048');
INSERT INTO `t_grade` VALUES (2049, '2049');
INSERT INTO `t_grade` VALUES (2050, '2050');

-- ----------------------------
-- Table structure for t_inform
-- ----------------------------
DROP TABLE IF EXISTS `t_inform`;
CREATE TABLE `t_inform`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_inform
-- ----------------------------
INSERT INTO `t_inform` VALUES (1, '“扫描全能王”', '手机App端免费下载“扫描全能王”，方便上传各项证书。');

-- ----------------------------
-- Table structure for t_major
-- ----------------------------
DROP TABLE IF EXISTS `t_major`;
CREATE TABLE `t_major`  (
  `id` int(11) NOT NULL COMMENT 'id',
  `majorName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '专业表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_major
-- ----------------------------
INSERT INTO `t_major` VALUES (101, '电子信息工程');
INSERT INTO `t_major` VALUES (102, '电子科学与技术');
INSERT INTO `t_major` VALUES (103, '自动化');
INSERT INTO `t_major` VALUES (104, '计算机科学与技术');
INSERT INTO `t_major` VALUES (105, '软件工程');
INSERT INTO `t_major` VALUES (106, '计算机类');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (1, '请大家尽快上传各类奖项、证书、论文、专利。');

-- ----------------------------
-- Table structure for t_picture
-- ----------------------------
DROP TABLE IF EXISTS `t_picture`;
CREATE TABLE `t_picture`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `imagePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径地址',
  `writing` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_picture
-- ----------------------------
INSERT INTO `t_picture` VALUES (12, 'http://eta.cxxy.seu.edu.cn/api/upload/student/17自动化1班/17自动化1班_10317139钱成_全国大学生FPGA创新设计邀请赛_2020_10_13_23_02_24.jpeg', '全国大学生FPGA创新设计邀请赛');
INSERT INTO `t_picture` VALUES (13, 'http://eta.cxxy.seu.edu.cn/api/upload/student/18计算机科学与技术1班/18计算机科学与技术1班_10418132陈家伟_软件著作权_2020_10_13_19_00_56.jpeg', '软件著作权');
INSERT INTO `t_picture` VALUES (16, 'http://eta.cxxy.seu.edu.cn/api/upload/student/17电子科学与技术2班/17电子科学与技术2班_10217202王靓_国家实用新型专利_2020_10_14_11_29_19_1.jpeg', '国家实用新型专利');

-- ----------------------------
-- Table structure for t_review
-- ----------------------------
DROP TABLE IF EXISTS `t_review`;
CREATE TABLE `t_review`  (
  `id` int(11) NOT NULL COMMENT 'id',
  `reviewName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '审核状态名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '审核状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_review
-- ----------------------------
INSERT INTO `t_review` VALUES (1, '未审核');
INSERT INTO `t_review` VALUES (2, '已审核');
INSERT INTO `t_review` VALUES (3, '未通过');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL COMMENT 'id',
  `roleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `roleNameEn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色英文名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '系统管理员', 'admin');
INSERT INTO `t_role` VALUES (2, '任课教师', 'teacher');
INSERT INTO `t_role` VALUES (3, '学生', 'student');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `stuNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '学号',
  `stuName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `genderId` int(11) NOT NULL COMMENT '性别ID',
  `classId` int(11) NOT NULL COMMENT '班级ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `stuNo`(`stuNo`) USING BTREE,
  INDEX `fk_t_student_t_class_1`(`classId`) USING BTREE,
  INDEX `fk_t_student_t_gender_1`(`genderId`) USING BTREE,
  CONSTRAINT `t_student_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `t_class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_student_ibfk_2` FOREIGN KEY (`genderId`) REFERENCES `t_gender` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3547 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES (3509, '10419801', '周祎', 2, 80);
INSERT INTO `t_student` VALUES (3510, '10419802', '郭慧颖', 2, 80);
INSERT INTO `t_student` VALUES (3511, '10419803', '徐智敏', 2, 80);
INSERT INTO `t_student` VALUES (3512, '10419804', '纪雯烩', 2, 80);
INSERT INTO `t_student` VALUES (3513, '10419805', '王丹枫', 2, 80);
INSERT INTO `t_student` VALUES (3514, '10419806', '陶佳妮', 2, 80);
INSERT INTO `t_student` VALUES (3515, '10419807', '胡悦', 2, 80);
INSERT INTO `t_student` VALUES (3516, '10419808', '蒋舒琪', 2, 80);
INSERT INTO `t_student` VALUES (3517, '10419809', '沈宏宇', 2, 80);
INSERT INTO `t_student` VALUES (3518, '10419810', '吴笛', 2, 80);
INSERT INTO `t_student` VALUES (3519, '10419811', '陆怡', 2, 80);
INSERT INTO `t_student` VALUES (3520, '10419812', '朱乐涵', 1, 80);
INSERT INTO `t_student` VALUES (3521, '10419814', '尹鹏', 1, 80);
INSERT INTO `t_student` VALUES (3522, '10419815', '沈秋芃', 1, 80);
INSERT INTO `t_student` VALUES (3523, '10419816', '金士程', 1, 80);
INSERT INTO `t_student` VALUES (3524, '10419817', '肖蔚', 1, 80);
INSERT INTO `t_student` VALUES (3525, '10419818', '李舒洋', 1, 80);
INSERT INTO `t_student` VALUES (3526, '10419819', '张旭', 1, 80);
INSERT INTO `t_student` VALUES (3527, '10419820', '黄子元', 1, 80);
INSERT INTO `t_student` VALUES (3528, '10419821', '王启鹏', 1, 80);
INSERT INTO `t_student` VALUES (3529, '10419822', '钱誉恒', 1, 80);
INSERT INTO `t_student` VALUES (3530, '10419823', '张润禾', 1, 80);
INSERT INTO `t_student` VALUES (3531, '10419824', '刘清政', 1, 80);
INSERT INTO `t_student` VALUES (3532, '10419825', '缪政', 1, 80);
INSERT INTO `t_student` VALUES (3533, '10419826', '颜壮', 1, 80);
INSERT INTO `t_student` VALUES (3534, '10419827', '杨程鸿', 1, 80);
INSERT INTO `t_student` VALUES (3535, '10419828', '李洹', 1, 80);
INSERT INTO `t_student` VALUES (3536, '10419829', '刘志成', 1, 80);
INSERT INTO `t_student` VALUES (3537, '10419830', '庞俊', 1, 80);
INSERT INTO `t_student` VALUES (3538, '10419831', '陈罡', 1, 80);
INSERT INTO `t_student` VALUES (3539, '10419832', '赖志豪', 1, 80);
INSERT INTO `t_student` VALUES (3540, '10419833', '刘舒', 1, 80);
INSERT INTO `t_student` VALUES (3541, '10419834', '王均川', 1, 80);
INSERT INTO `t_student` VALUES (3542, '10419835', '费宇宸', 1, 80);
INSERT INTO `t_student` VALUES (3543, '10419836', '周潇海', 1, 80);
INSERT INTO `t_student` VALUES (3544, '10419837', '陶贤锋', 1, 80);
INSERT INTO `t_student` VALUES (3545, '10419838', '李梓豪', 1, 80);
INSERT INTO `t_student` VALUES (3546, '10419839', '钱龙', 1, 80);

-- ----------------------------
-- Table structure for t_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `SubjectName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '章节名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO `t_subject` VALUES (2, '测试');

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `teaNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '教师号',
  `teaName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `genderId` int(11) NOT NULL COMMENT '性别id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_t_teacher_t_gender_1`(`genderId`) USING BTREE,
  INDEX `teaNo`(`teaNo`) USING BTREE,
  CONSTRAINT `t_teacher_ibfk_1` FOREIGN KEY (`genderId`) REFERENCES `t_gender` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 410 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教师信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES (190, '133800295', '羊栋', 1);
INSERT INTO `t_teacher` VALUES (215, '931200189', '褚福涛', 1);
INSERT INTO `t_teacher` VALUES (216, '931200190', '吕国芳', 1);
INSERT INTO `t_teacher` VALUES (217, '931300144', '王刚', 1);
INSERT INTO `t_teacher` VALUES (218, '931300145', '刘勇', 1);
INSERT INTO `t_teacher` VALUES (219, '100000617', '丁江', 1);
INSERT INTO `t_teacher` VALUES (220, '100000625', '朱国康', 1);
INSERT INTO `t_teacher` VALUES (221, '138000344', '周曼云', 2);
INSERT INTO `t_teacher` VALUES (222, '938100285', '梁衡弘', 1);
INSERT INTO `t_teacher` VALUES (223, '937100265', '张志政', 1);
INSERT INTO `t_teacher` VALUES (224, '938000731', '翟玉庆', 1);
INSERT INTO `t_teacher` VALUES (225, '938100697', '张柏礼', 1);
INSERT INTO `t_teacher` VALUES (226, '999100049', '李冰', 1);
INSERT INTO `t_teacher` VALUES (227, '931200105', '包金明', 1);
INSERT INTO `t_teacher` VALUES (228, '999100182', '常昌远', 1);
INSERT INTO `t_teacher` VALUES (229, '931100376', '赵宁', 1);
INSERT INTO `t_teacher` VALUES (230, '931400020', '张锡宁', 2);
INSERT INTO `t_teacher` VALUES (231, '931300017', '张萌', 1);
INSERT INTO `t_teacher` VALUES (232, '999100235', '钟锐', 1);
INSERT INTO `t_teacher` VALUES (233, '931100397', '张士凯', 1);
INSERT INTO `t_teacher` VALUES (234, '131100310', '陆清茹', 2);
INSERT INTO `t_teacher` VALUES (235, '131800119', '朱建军', 2);
INSERT INTO `t_teacher` VALUES (236, '164000261', '朱罕非', 1);
INSERT INTO `t_teacher` VALUES (237, '164000501', '郝菁', 2);
INSERT INTO `t_teacher` VALUES (238, '938000730', '刘亚军', 2);
INSERT INTO `t_teacher` VALUES (239, '938000732', '沈军', 1);
INSERT INTO `t_teacher` VALUES (240, '938000849', '王彩玲', 2);
INSERT INTO `t_teacher` VALUES (241, '938000865', '韩敬利', 2);
INSERT INTO `t_teacher` VALUES (242, '938100233', '王晓蔚', 2);
INSERT INTO `t_teacher` VALUES (243, '938100418', '朱节中', 1);
INSERT INTO `t_teacher` VALUES (244, '938100696', '杨全胜', 1);
INSERT INTO `t_teacher` VALUES (245, '100000677', '张京中', 1);
INSERT INTO `t_teacher` VALUES (246, '100000747', '华歆', 1);
INSERT INTO `t_teacher` VALUES (247, '100000786', '吴小虎', 1);
INSERT INTO `t_teacher` VALUES (248, '100000853', '胡永东', 1);
INSERT INTO `t_teacher` VALUES (249, '100000894', '王丽娜', 2);
INSERT INTO `t_teacher` VALUES (250, '100000895', '陈蓓玉', 2);
INSERT INTO `t_teacher` VALUES (251, '100000904', '赵振南', 1);
INSERT INTO `t_teacher` VALUES (252, '100000924', '文学志', 1);
INSERT INTO `t_teacher` VALUES (253, '100000941', '黄萍', 2);
INSERT INTO `t_teacher` VALUES (254, '100000944', '桂启发', 1);
INSERT INTO `t_teacher` VALUES (255, '100000945', '李文渊', 1);
INSERT INTO `t_teacher` VALUES (256, '100000953', '杨建明', 1);
INSERT INTO `t_teacher` VALUES (257, '999100078', '孙琳', 2);
INSERT INTO `t_teacher` VALUES (258, '999100191', '冯耀霖', 1);
INSERT INTO `t_teacher` VALUES (259, '999100200', '蒋珉', 1);
INSERT INTO `t_teacher` VALUES (260, '999100236', '凌明', 1);
INSERT INTO `t_teacher` VALUES (261, '900000886', '崇志宏', 1);
INSERT INTO `t_teacher` VALUES (262, '931000773', '田磊', 2);
INSERT INTO `t_teacher` VALUES (263, '931100449', '高乙月', 2);
INSERT INTO `t_teacher` VALUES (264, '931100606', '王其', 1);
INSERT INTO `t_teacher` VALUES (265, '931000756', '冉昌艳', 2);
INSERT INTO `t_teacher` VALUES (266, '931000794', '李家强', 1);
INSERT INTO `t_teacher` VALUES (267, '931100137', '沈晨鸣', 1);
INSERT INTO `t_teacher` VALUES (268, '931100373', '李东新', 1);
INSERT INTO `t_teacher` VALUES (269, '931100422', '朱萍', 2);
INSERT INTO `t_teacher` VALUES (270, '931100447', '胡素君', 2);
INSERT INTO `t_teacher` VALUES (271, '931100607', '卢新彪', 1);
INSERT INTO `t_teacher` VALUES (272, '931100665', '陈董', 1);
INSERT INTO `t_teacher` VALUES (273, '931100698', '崔晓波', 1);
INSERT INTO `t_teacher` VALUES (274, '931200183', '汪力纯', 1);
INSERT INTO `t_teacher` VALUES (275, '931300014', '樊路嘉', 1);
INSERT INTO `t_teacher` VALUES (276, '931300015', '龚克西', 2);
INSERT INTO `t_teacher` VALUES (277, '931300200', '裴荣', 2);
INSERT INTO `t_teacher` VALUES (278, '931300201', '丁文秋', 2);
INSERT INTO `t_teacher` VALUES (279, '931400019', '杨丹', 2);
INSERT INTO `t_teacher` VALUES (280, '131100309', '陈德斌', 1);
INSERT INTO `t_teacher` VALUES (281, '131000345', '刘福章', 1);
INSERT INTO `t_teacher` VALUES (282, '131100356', '黄卉', 2);
INSERT INTO `t_teacher` VALUES (283, '131000548', '戴义保', 1);
INSERT INTO `t_teacher` VALUES (284, '138100177', '李香菊', 2);
INSERT INTO `t_teacher` VALUES (285, '900001003', '缪勇', 1);
INSERT INTO `t_teacher` VALUES (286, '900001002', '沈锦仁', 1);
INSERT INTO `t_teacher` VALUES (287, '900001011', '程峰', 1);
INSERT INTO `t_teacher` VALUES (288, '931500024', '张强', 1);
INSERT INTO `t_teacher` VALUES (289, '900001066', '吕成绪', 1);
INSERT INTO `t_teacher` VALUES (290, '900001062', '胡轶宁', 1);
INSERT INTO `t_teacher` VALUES (291, '900001061', '王征', 1);
INSERT INTO `t_teacher` VALUES (292, '900001067', '赵阳', 1);
INSERT INTO `t_teacher` VALUES (293, '900001065', '陆静', 2);
INSERT INTO `t_teacher` VALUES (294, '900001063', '汪芸', 2);
INSERT INTO `t_teacher` VALUES (295, '900001064', '李骅', 1);
INSERT INTO `t_teacher` VALUES (296, '900001022', '黄钱彬', 1);
INSERT INTO `t_teacher` VALUES (297, '900001023', '薛峰', 1);
INSERT INTO `t_teacher` VALUES (298, '900001021', '程明权', 1);
INSERT INTO `t_teacher` VALUES (299, '999100220', '王志明', 2);
INSERT INTO `t_teacher` VALUES (300, '100000695', '王伟', 1);
INSERT INTO `t_teacher` VALUES (301, '100000723', '傅骏钦', 1);
INSERT INTO `t_teacher` VALUES (302, '100000745', '王世杰', 1);
INSERT INTO `t_teacher` VALUES (303, '100000761', '时龙兴', 1);
INSERT INTO `t_teacher` VALUES (304, '100000783', '应毅', 1);
INSERT INTO `t_teacher` VALUES (305, '100000802', '方巍', 1);
INSERT INTO `t_teacher` VALUES (306, '100000823', '杨鸿儒', 1);
INSERT INTO `t_teacher` VALUES (307, '100000872', '夏思宇', 1);
INSERT INTO `t_teacher` VALUES (308, '931100664', '曹永娟', 2);
INSERT INTO `t_teacher` VALUES (309, '938000773', '祝学云', 1);
INSERT INTO `t_teacher` VALUES (310, '999100126', '袁晓辉', 1);
INSERT INTO `t_teacher` VALUES (311, '999100175', '董逸生', 1);
INSERT INTO `t_teacher` VALUES (312, '999100214', '陶军', 1);
INSERT INTO `t_teacher` VALUES (313, '999100222', '吴剑章', 1);
INSERT INTO `t_teacher` VALUES (314, '931000885', '马旭东', 1);
INSERT INTO `t_teacher` VALUES (315, '931500022', '武淑萍', 2);
INSERT INTO `t_teacher` VALUES (316, '931400197', '陈凡', 1);
INSERT INTO `t_teacher` VALUES (317, '900001049', '周平', 1);
INSERT INTO `t_teacher` VALUES (318, '900001060', '沈傲东', 1);
INSERT INTO `t_teacher` VALUES (319, '931200230', '刘久付', 1);
INSERT INTO `t_teacher` VALUES (320, '931500021', '韩范', 1);
INSERT INTO `t_teacher` VALUES (321, '164000169', '徐玉菁', 2);
INSERT INTO `t_teacher` VALUES (322, '931200186', '吴晓梅', 2);
INSERT INTO `t_teacher` VALUES (323, '931200188', '叶彦斐', 1);
INSERT INTO `t_teacher` VALUES (324, '137000114', '弭娜', 2);
INSERT INTO `t_teacher` VALUES (325, '164000132', '余康', 2);
INSERT INTO `t_teacher` VALUES (326, '131100180', '黄丽薇', 2);
INSERT INTO `t_teacher` VALUES (327, '131100182', '郑英', 2);
INSERT INTO `t_teacher` VALUES (328, '164000212', '吴春红', 2);
INSERT INTO `t_teacher` VALUES (329, '131800218', '庄丽', 2);
INSERT INTO `t_teacher` VALUES (330, '138100265', '孙丽', 2);
INSERT INTO `t_teacher` VALUES (331, '131100308', '许立峰', 1);
INSERT INTO `t_teacher` VALUES (332, '137800397', '周文娟', 2);
INSERT INTO `t_teacher` VALUES (333, '138100093', '俞琰', 2);
INSERT INTO `t_teacher` VALUES (334, '138100372', '赵勍邶', 1);
INSERT INTO `t_teacher` VALUES (335, '138100478', '谢修娟', 2);
INSERT INTO `t_teacher` VALUES (336, '931000739', '李晨', 1);
INSERT INTO `t_teacher` VALUES (337, '931000741', '李骏扬', 1);
INSERT INTO `t_teacher` VALUES (338, '931000743', '廉明', 1);
INSERT INTO `t_teacher` VALUES (339, '931000744', '孙培勇', 1);
INSERT INTO `t_teacher` VALUES (340, '938100598', '倪巍伟', 1);
INSERT INTO `t_teacher` VALUES (341, '164000369', '许庆', 2);
INSERT INTO `t_teacher` VALUES (342, '164000371', '曹诚伟', 1);
INSERT INTO `t_teacher` VALUES (343, '131100403', '辛海燕', 2);
INSERT INTO `t_teacher` VALUES (344, '131100404', '王迷迷', 2);
INSERT INTO `t_teacher` VALUES (345, '138100460', '操凤萍', 2);
INSERT INTO `t_teacher` VALUES (346, '131000519', '高建国', 1);
INSERT INTO `t_teacher` VALUES (347, '131100531', '陈玉林', 2);
INSERT INTO `t_teacher` VALUES (348, '131100532', '陈慧琴', 2);
INSERT INTO `t_teacher` VALUES (349, '138800549', '徐品琪', 1);
INSERT INTO `t_teacher` VALUES (350, '131100567', '郁佳佳', 2);
INSERT INTO `t_teacher` VALUES (351, '131100568', '左梅', 2);
INSERT INTO `t_teacher` VALUES (352, '100000642', '王理想', 1);
INSERT INTO `t_teacher` VALUES (353, '900001068', '晏祥彪', 1);
INSERT INTO `t_teacher` VALUES (354, '931000733', '胡飞', 1);
INSERT INTO `t_teacher` VALUES (355, '931000737', '秦明', 1);
INSERT INTO `t_teacher` VALUES (356, '931000742', '顾群', 1);
INSERT INTO `t_teacher` VALUES (357, '931000755', '冯宏星', 1);
INSERT INTO `t_teacher` VALUES (358, '931000793', '于兵', 1);
INSERT INTO `t_teacher` VALUES (359, '931100445', '赵力', 1);
INSERT INTO `t_teacher` VALUES (360, '931100518', '董乾', 1);
INSERT INTO `t_teacher` VALUES (361, '164000131', '李宗轩', 1);
INSERT INTO `t_teacher` VALUES (362, '164000149', '李振东', 1);
INSERT INTO `t_teacher` VALUES (363, '164000368', '吉静', 2);
INSERT INTO `t_teacher` VALUES (364, '999100031', '郝立', 2);
INSERT INTO `t_teacher` VALUES (365, '931100699', '薛红', 2);
INSERT INTO `t_teacher` VALUES (366, '931100243', '陈良斌', 1);
INSERT INTO `t_teacher` VALUES (367, '164000370', '王珩', 2);
INSERT INTO `t_teacher` VALUES (368, '931000815', '黄永明', 1);
INSERT INTO `t_teacher` VALUES (369, '931000816', '乐英高', 1);
INSERT INTO `t_teacher` VALUES (370, '931400196', '李泽民', 1);
INSERT INTO `t_teacher` VALUES (371, '999100219', '王增和', 1);
INSERT INTO `t_teacher` VALUES (372, '999100058', '林科学', 1);
INSERT INTO `t_teacher` VALUES (373, '938100695', '沈克勤', 1);
INSERT INTO `t_teacher` VALUES (374, '931100372', '许大宇', 1);
INSERT INTO `t_teacher` VALUES (375, '931100370', '陈黎来', 1);
INSERT INTO `t_teacher` VALUES (376, '931100692', '赵贤林', 1);
INSERT INTO `t_teacher` VALUES (377, '113000439', '朱金娟', 2);
INSERT INTO `t_teacher` VALUES (378, '931100374', '储荣', 1);
INSERT INTO `t_teacher` VALUES (379, '931100663', '王培章', 1);
INSERT INTO `t_teacher` VALUES (380, '931100562', '李林', 1);
INSERT INTO `t_teacher` VALUES (381, '931200184', '杨颖红', 2);
INSERT INTO `t_teacher` VALUES (382, '931000740', '徐大华', 1);
INSERT INTO `t_teacher` VALUES (383, '931100444', '束海泉', 1);
INSERT INTO `t_teacher` VALUES (384, '931000734', '李琦', 1);
INSERT INTO `t_teacher` VALUES (385, '931000735', '戚晨皓', 1);
INSERT INTO `t_teacher` VALUES (386, '931000736', '赵霞', 2);
INSERT INTO `t_teacher` VALUES (387, '931000738', '王琦龙', 1);
INSERT INTO `t_teacher` VALUES (388, '164000047', '吴小安', 2);
INSERT INTO `t_teacher` VALUES (389, '164000065', '于维顺', 1);
INSERT INTO `t_teacher` VALUES (390, '164000069', '张志鹏', 1);
INSERT INTO `t_teacher` VALUES (391, '138800576', '王晶晶', 2);
INSERT INTO `t_teacher` VALUES (392, '138100459', '刘雪娟', 2);
INSERT INTO `t_teacher` VALUES (393, '131100486', '张立珍', 2);
INSERT INTO `t_teacher` VALUES (394, '138100091', '朱林', 1);
INSERT INTO `t_teacher` VALUES (395, '100001010', '章品正', 1);
INSERT INTO `t_teacher` VALUES (396, '100001066', '王梦晓', 2);
INSERT INTO `t_teacher` VALUES (397, '100000974', '梁静婷', 2);
INSERT INTO `t_teacher` VALUES (398, '100000993', '王海彬', 1);
INSERT INTO `t_teacher` VALUES (399, '100000996', '虞金永', 1);
INSERT INTO `t_teacher` VALUES (400, '100000991', '马杰良', 1);
INSERT INTO `t_teacher` VALUES (401, '100000968', '张秀再', 1);
INSERT INTO `t_teacher` VALUES (402, '100001046', '王荣', 1);
INSERT INTO `t_teacher` VALUES (403, '100001150', '朱倩', 2);
INSERT INTO `t_teacher` VALUES (404, '100001144', '嵇亚婷', 2);
INSERT INTO `t_teacher` VALUES (405, '100001338', '李晓婷', 2);
INSERT INTO `t_teacher` VALUES (406, '100001430', '孙瑾微', 2);
INSERT INTO `t_teacher` VALUES (407, '100001607', '庄国良', 1);
INSERT INTO `t_teacher` VALUES (408, '555555555', '测试教师', 1);
INSERT INTO `t_teacher` VALUES (409, '666666666', '测试主任', 1);

-- ----------------------------
-- Table structure for t_teacher_link_student
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher_link_student`;
CREATE TABLE `t_teacher_link_student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(11) NOT NULL COMMENT '所管班级id',
  `teacherId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '教师id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_t_instructor_link_student_t_class_1`(`classId`) USING BTREE,
  INDEX `fk_t_instructor_link_student_t_teacher_1`(`teacherId`) USING BTREE,
  CONSTRAINT `t_teacher_link_student_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `t_class` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `t_teacher_link_student_ibfk_2` FOREIGN KEY (`teacherId`) REFERENCES `t_teacher` (`teaNo`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '辅导员审核学生奖项关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_teacher_link_student
-- ----------------------------
INSERT INTO `t_teacher_link_student` VALUES (145, 80, '100001338');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3973 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (232, '133800295', 'a466be0c8a4baf6618cdb95ca947df31', '2018-04-25 22:18:55', '2021-03-25 17:12:14');
INSERT INTO `t_user` VALUES (3740, '931200189', '8ec4d16558422e77211e700cf30b122d', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3741, '931200190', '15de2b5957b3cc8977f35b618aee16e0', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3742, '931300144', 'e9e1e21bc1fd5c06b0b0a7190939ae75', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3743, '931300145', '42f8ba069d45ddd113f7d304350f5468', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3744, '100000617', '4027eee66b8746b3bdffc8290e4060da', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3745, '100000625', '032586666121c721dc2d4aaa5ad27143', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3746, '138000344', '927e5f243c0c083a6fafc2f509bcb8d5', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3747, '938100285', '7cec29e9d3e363e5fbb6f8f96e900aa0', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3748, '937100265', '1a5d3327b935790a8a07735c8337dbd0', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3749, '938000731', '1dab433292fb30697a93f85e0105fcd6', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3750, '938100697', 'd67a036c2f45f5b43dd7f75427e5fc53', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3751, '999100049', '06b8b7d50c805c645477389e216077ef', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3752, '931200105', 'ef49d64865c5e03721842f3604610b76', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3753, '999100182', '2ec96d4b35b123273d8d2b7733f5cdd0', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3754, '931100376', '41d32ca8e0d1b749f301e694472bed13', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3755, '931400020', 'c010b99fef279ffcb4438418344a684b', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3756, '931300017', 'a675101ce906bce79dc5fa96163ef00a', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3757, '999100235', 'dddfd50b55539f9513b5703e1ae228c8', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3758, '931100397', 'a72bcbba1d2525ee1a7ea36e78a5f27d', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3759, '131100310', '4c3295eee427fbddc33aee4b1db27127', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3760, '131800119', 'd1de00d39832abc28c9faaf2a89d6978', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3761, '164000261', '665ca3d8d64ab79f55a519026e6112cf', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3762, '164000501', 'fb84f4415ab30b15bbf95d68785449c0', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3763, '938000730', '04505a2f6f71591fbd2960f9891859f4', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3764, '938000732', '36f1cdc51f23669250c243702baef5f4', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3765, '938000849', '448d804e0ffd2928e290cfe51cb11051', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3766, '938000865', 'bb567b8b5cae873bfe5592750f758006', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3767, '938100233', '3841e0fddc211269e50ada8067ac5f07', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3768, '938100418', '842411d140596d2cb1abd7e05a6ece57', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3769, '938100696', '0137628b1667013db57afc209dbfc58d', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3770, '100000677', 'd580ff66d08deba8a3d3581df3814ef9', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3771, '100000747', 'dbb7addbffd7b77ab2ce896d72892d65', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3772, '100000786', '0d4e40545900c755a91cfd4856511227', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3773, '100000853', '3a10e6054121f9543f8fa9ade74533b6', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3774, '100000894', 'e55260be424844cd5061d2fdbf4a520b', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3775, '100000895', 'a95296bd62032c0958cd49d724079ae3', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3776, '100000904', '3d8004a1554cd89ffdeb67d4f684f97c', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3777, '100000924', '3d7390ec0e581b16b3f83bf1bedbd8b6', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3778, '100000941', '9cb6430efbf4f3923ccb656974b1d1a0', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3779, '100000944', '12cf40d0a45b307429bd24f24c56f213', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3780, '100000945', 'bf39ecd9399f5c08736f920d7b470a36', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3781, '100000953', '1efe1cf33125c391bbcccc5f65a9ce1c', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3782, '999100078', '9d9e25578efe8214891c632269883cb2', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3783, '999100191', '894c3ea139e1ce3b7f4233ec7ae553c5', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3784, '999100200', '8dd7b3d465617a80dd7331a0a95452ce', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3785, '999100236', '227fa5ae2c3a0c013cc291ebf68402d3', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3786, '900000886', 'dca511719e719db40022581878e91203', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3787, '931000773', 'c2e48768197e3e660c280bd69407a79a', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3788, '931100449', 'ff918a00ce20d1bd465d167931e1d38c', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3789, '931100606', '71aea0a31d31e4347ba0fdb6c8ede13a', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3790, '931000756', '02f1c7638b0dd458b5320c92b5667be8', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3791, '931000794', 'b571d93d8750c2ee585b71302832c85a', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3792, '931100137', 'a79d188e5d1c69d7030927cd31b6f840', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3793, '931100373', 'c7fb923942076816069198d6bd3a5e01', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3794, '931100422', 'e66cb6d58dbdbeb2b61dc06100a38656', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3795, '931100447', '33fe2fd8dbd61eb5fb5608dd12b7e9ba', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3796, '931100607', 'b2e70617105392232578fe42ee96e454', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3797, '931100665', 'dcbbefbe6a1e56521e8699ca914032d0', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3798, '931100698', 'ef0cd5225f685de3586e6ddcd414ddaa', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3799, '931200183', '324d14958ae81a10e40d0bec12b4b74f', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3800, '931300014', '5e6de04f18a23ab155481b96c7ce9c00', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3801, '931300015', '1ed4da2fb1913298cfeff192b4b03d9a', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3802, '931300200', 'f457d359b2372b1bd899c29e3c6d42d9', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3803, '931300201', 'f4f3514411375c05a2cdd703fde78da7', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3804, '931400019', 'bc56f11b9e0853a6023bcbcf27397062', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3805, '131100309', 'c2c9eef21baa432a1ae9adb9c7867264', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3806, '131000345', '261e1f85e57988f87e75d9191d610d79', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3807, '131100356', '5e805c7294c6aa54e63aa2735b277d2a', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3808, '131000548', 'c9f003fa6d4d57fbd9ccf51756d3d724', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3809, '138100177', 'b9cc634ae14c99d74270ba0a34946117', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3810, '900001003', 'b517137693c633c8b811909df05f728b', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3811, '900001002', '3547bc57bb3b750d6dc7fc8717a9002b', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3812, '900001011', 'c112d3c7e413bc6cb8fdb0a2487fcb67', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3813, '931500024', '869ebfc5c30566307ae8c23c23ca21ad', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3814, '900001066', '20253cf6baae955ef2e5b0c945c2f3ff', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3815, '900001062', '72382e409655bf54ebb63f1fb01ff335', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3816, '900001061', '9627c4c19f2db3f7bb93aabdb530c5c9', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3817, '900001067', '596989b7efee7f4c010590c7a4b74b10', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3818, '900001065', '8637cde46f0f3066bb5d9307d23c9b36', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3819, '900001063', 'a140dbaf6b20ea26b68869e2ce3bc837', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3820, '900001064', '28295239cd4192f31e3773f5e0d14d55', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3821, '900001022', 'a06d5901a28adc72d7c502771453f5ec', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3822, '900001023', '1c7248b34261b71183d99cfc8b7d3df0', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3823, '900001021', 'd70f4a864b5262fead06219236c96dc5', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3824, '999100220', '8a12d1ddeca742f40fa1d8011b95c808', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3825, '100000695', '03706e4fb1200751e767f6360b750b53', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3826, '100000723', 'db98aacf9b6f648635257c6449e079e7', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3827, '100000745', '8a79c50f569882ae1d65b59401cb42e9', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3828, '100000761', '0c25771a8f8a9860ac28c124083a41d5', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3829, '100000783', 'b86230e68b90a7516634ae84b0eca1aa', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3830, '100000802', '1455757a76b4f3d64a4a9f6d0bde73cd', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3831, '100000823', '3eb31fb07302c104e7c1e3ed6d5ff3a3', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3832, '100000872', '3332cffcba22e39b3171171131efe02d', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3833, '931100664', '7c02a5c35a82bce642e17113550e8ce8', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3834, '938000773', 'cfa3c0eaf327541afe3b84cd0482cf25', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3835, '999100126', '3466cdc6b47ea8771d8759668b4dfcdf', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3836, '999100175', '6af918ddf58f5d689ee2d1501cf81d68', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3837, '999100214', 'dd5250027d2fb834c03b4a1e5d631e53', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3838, '999100222', '95ed908ffd2742febc491fac5ff90219', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3839, '931000885', '9b554e720d796bfe7c9d298229aa2f19', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3840, '931500022', 'f3c0bad8a593e8c8f63de74fc0a89f3d', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3841, '931400197', 'e9dbfa5ce66aa7d0f538ee47ba0dac33', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3842, '900001049', 'a42ebd925809c9734e9141cc842bf59a', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3843, '900001060', '06d4915c4a6ee54c19cd0a16f469a11a', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3844, '931200230', 'efe10aeb51698f09a31eb6bff43fe150', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3845, '931500021', '96a901b6617ef1b409c525fa14fada72', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3846, '164000169', '43f889ed1695f2b82a017b90b1f7d82e', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3847, '931200186', 'b2cfeca17f3baa8e3157f87797351a97', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3848, '931200188', '4b37c45c18b913fba79d9c479075d7de', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3849, '137000114', '24af2d995a52482f637e96ec84b45be4', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3850, '164000132', 'd5ff0f51d7688312c28c7425b2705704', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3851, '131100180', '06f3b87e5cd5fbac2562e6f0d0dcc90e', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3852, '131100182', '5eabe49d96d7f26cd6143f181e9eb8a9', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3853, '164000212', '9eaa99f13b27fe9ad2965db5df40e8b8', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3854, '131800218', '2a5da5a64e744408c9174272c9a800fd', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3855, '138100265', 'a9ebad7090e58d5fc8ef1d8a62329a56', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3856, '131100308', '5f004174c91d3cd21ce4c8b60888f090', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3857, '137800397', 'cc9b9e02452f0ee31dc0bb5dfc19d61f', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3858, '138100093', 'd62ba42963a9e8ebe571039f6e67fc64', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3859, '138100372', '871b73607d1fd3256fce7a228382d134', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3860, '138100478', '51d9c4b55a8386f74aa7a00179685290', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3861, '931000739', 'e2e2fa4cabcae03f6dbc5aa62206dcf1', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3862, '931000741', '986acabd483cc284560f20eb5634ff6d', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3863, '931000743', '1fcf143df60f4fd8cc11109ac12a7cc2', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3864, '931000744', '1e155fba64e3041bc60bff255a985473', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3865, '938100598', 'a1764b8189b36c4e61fbbbe5e6287044', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3866, '164000369', 'd4471f287f4355b7e0828575f59b6a63', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3867, '164000371', '2689a21a4e2824741ed80f7d3b6c6b52', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3868, '131100403', 'be60b56276f808bfeb350c269176dcbc', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3869, '131100404', 'c2cd3f9b8f0648a84f79c20547770323', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3870, '138100460', '6dcff2b2431e314b86913a0d5b84ae4f', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3871, '131000519', 'a01d8250b690c7e5de7037b37859bf84', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3872, '131100531', '3cb82ffba2cc65c15c642434f73bba35', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3873, '131100532', '860471b45c66a98ea1c0111ab5dd6bf1', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3874, '138800549', '1186ee94fc3717b81e93e93bb298ec55', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3875, '131100567', 'ee551b274b5654be995dddc39aee55b7', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3876, '131100568', '1d5a2359e8dabe94c228c3eecc421225', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3877, '100000642', 'f022ba4fef94b1347e39d42358077e79', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3878, '900001068', '1cb6cc9c5e230a28bd6a656c6ea8259a', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3879, '931000733', '4ce00a28815fb003b3a54b7863870f61', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3880, '931000737', '1afe9a2c3ff6abfd471733f841d2924d', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3881, '931000742', 'a71501c18e48b6be798054ee35e2ebaf', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3882, '931000755', '9986c635af40392500a6495d5759bf43', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3883, '931000793', '75baa6ef0162ef7727b4b5d96497193a', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3884, '931100445', '3292a730dcbd8765a80535b1ae144671', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3885, '931100518', 'f39b00e12d42d523fe6b0b03199e88ea', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3886, '164000131', '226c2a5eb24ea7ff1321dfe3d531d782', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3887, '164000149', '5ce3d7a54603a4068e4f7fac6c697226', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3888, '164000368', '54c49a45075faade97e42942637ca851', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3889, '999100031', '7452274767145d1d060347f71efa1bd5', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3890, '931100699', '78a67441a19f5e909e651341cb873b89', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3891, '931100243', 'a4aa2a111caa2019b7db7bc16e5649ae', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3892, '164000370', '441a38b3220fa0d64cb5fe496c422bcb', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3893, '931000815', '9da20badb6afd4d21de9cdf6b0168cf7', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3894, '931000816', 'd3903c3becf1cac6b9fa01b8b34ce726', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3895, '931400196', 'c92801f00c9ea76f50e75f7e76d882ff', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3896, '999100219', 'fb25374847a35f99c84c6cb448e65c10', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3897, '999100058', '897cd855a382e0a59a83591ac31ee60e', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3898, '938100695', '87e7da6a86ce00070b5eff533c871563', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3899, '931100372', 'a3a361c328ee60053414fe17adde2d85', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3900, '931100370', 'cf979c43c5c16430dd97820f9a77da52', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3901, '931100692', '6db2635d06f82c1a1f5bad739ce94262', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3902, '113000439', '62b27e5d7c97f71d5989457f379b67c1', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3903, '931100374', 'fa143de595f7529cefe169188aa72029', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3904, '931100663', '5c5598873c49af52014e0df24a3231c9', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3905, '931100562', '0dd411059b07d61db0f654ad1c91c131', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3906, '931200184', '0195d74ab14c98f97c4becbd914ebdd8', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3907, '931000740', '8c55d86c05ffbf36df47cda14f3497a8', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3908, '931100444', 'ac0b2a4bc948aa85a997a45eb12d56fb', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3909, '931000734', 'c1f912cfa5bce3d7fab52e81291c07b7', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3910, '931000735', '6f342f7a3500164cebf41c01d4be8079', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3911, '931000736', 'c5f14c57229c92fd22b40b6788e65c48', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3912, '931000738', '1441964a1d47feaccab01339a3f345b3', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3913, '164000047', '9cc7de2b0114cd8f657ef6c039a26fdc', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3914, '164000065', '2f8f0270c4df78a3e6a1f9532c4c74d2', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3915, '164000069', '0c12154200602a6b54d25f463c503a75', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3916, '138800576', '79c1bde69f52c9585a8b99e63ec7d0d3', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3917, '138100459', 'c74c52eac180adb88b91f85e70f708ba', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3918, '131100486', '7a05ae9e7ac1260016c2b414c494cf4a', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3919, '138100091', 'f594ccc14ea4cdef8292e662878855bc', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3920, '100001010', 'a1b6793844b830083c0c2314de5163d1', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3921, '100001066', 'f515df27345d5ae3bbf6a1c43603ede6', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3922, '100000974', '76a6e0091d9f7700a1a200c347d18cc0', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3923, '100000993', 'aa7e531f043379deb2e02e26e6cc4cef', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3924, '100000996', 'c3776005f8d846d90ffaf10ea701bf68', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3925, '100000991', 'aa14d5ed565d6c7cfa8b985be737f05e', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3926, '100000968', '6e65c38f269948ee7711f94fbb28e088', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3927, '100001046', 'f5c4d6a2b9f02d83c9a66a9d5c6e1996', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3928, '100001150', '57eda03b7ef8c1415e1a126b96e3f3da', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3929, '100001144', 'df5f281e9953bb485b5fd63e52bbb68c', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3930, '100001338', '2dc98afafc5ab2a4b76c3e6ce0ac8b03', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3931, '100001430', '6124b74449397bdc5cc41cdce42802c7', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3932, '100001607', '4049fc8ae7971e1c955225e1723103d3', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3933, '555555555', '10c12ad8317c2df67b23880b3bc63e60', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3934, '666666666', '823cfe2dc9b54fd618d714963449b6fa', '2022-02-10 17:12:00', '2022-02-10 17:12:00');
INSERT INTO `t_user` VALUES (3935, '10419801', '7194a9d67491e057d8f0811bc50cae3c', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3936, '10419802', '22f07796775d2a667c46c494c07f3422', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3937, '10419803', 'e423dbba89f0b4ba7336ddee358ff2d1', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3938, '10419804', 'd14bc9fe4dcb8ca38d27fef4286aec7f', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3939, '10419805', '11c2cfcf6a2fc3e5bb68edf16bac6610', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3940, '10419806', '96e4cf2fe9a07bed86206ce4a766d418', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3941, '10419807', 'e85cce6766caf538a3079493111d35ad', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3942, '10419808', 'ebd31cfe2506609b05e6f0a483c57b6f', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3943, '10419809', '13b5bf9cf7441670090602ae6b07d53b', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3944, '10419810', '5b2d5f4d3972cad0ed69efa58a982e65', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3945, '10419811', '82e045571cfde8924a332c05f3bd4473', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3946, '10419812', 'f4c12ea9fc3aa4f421aa5798844a7581', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3947, '10419814', '7079eafa44b6afb2d5a7675e9150ea1e', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3948, '10419815', '1620ea8fbcd37a68cd530ea5acb9c515', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3949, '10419816', 'd07412f628976d31b24c9c8bc96ab31a', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3950, '10419817', '9340dbd5ceebf7cadf87874ebb4f267a', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3951, '10419818', '06ee85e1d22809c8bee94ae0bcf261fc', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3952, '10419819', 'dafcac38831298a1f9abeddf7a2c75fb', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3953, '10419820', '78b2bd3b63a09ff0a28a3db277a22db6', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3954, '10419821', '769d03961bdd70bc17f3882cb8ea9e28', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3955, '10419822', '37a37bac8aedc265d373277998c49397', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3956, '10419823', '300cb96251bc2086a80e253e3908b761', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3957, '10419824', '515c8fd5d5f81c314b46546f72f800c7', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3958, '10419825', 'a4845fb748c1064073ad032e68f4dfa9', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3959, '10419826', 'e61f1d5b09a5b15c243a7761e6ba2086', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3960, '10419827', 'ecdaf9543f9fc6ab637aadc1aa965428', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3961, '10419828', '27a7fe8ab80f3358652b9b66af025ea1', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3962, '10419829', '957faefbb67e3a588efeb2af28a0fb6d', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3963, '10419830', 'cef6e90c37f78747999ce376f1ece777', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3964, '10419831', 'd12df745a4fb048ebc566a2e0964baf6', '2022-02-10 17:35:12', '2022-02-11 23:01:25');
INSERT INTO `t_user` VALUES (3965, '10419832', '624c076f2329b7155cd571afe0279e56', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3966, '10419833', '4d79b80154083e83fcc4c430532543f2', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3967, '10419834', '319295133b64bb7c63ca4b3e3b72850a', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3968, '10419835', '3655ce5909304f54e023b02999c74e2d', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3969, '10419836', '7277fcd2c05ca6af1cc7ddc8be1cc095', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3970, '10419837', '13bdef2ed913f4a9e20ac6df8a96c5c4', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3971, '10419838', 'e0bd35ecbfbc2705253803ff215b00b1', '2022-02-10 17:35:12', '2022-02-10 17:35:12');
INSERT INTO `t_user` VALUES (3972, '10419839', '088ee95c842728e99d33eaf0bd634f6f', '2022-02-10 17:35:12', '2022-02-10 17:35:12');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `roleId` int(11) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_t_user_role_t_role_1`(`roleId`) USING BTREE,
  INDEX `fk_t_user_role_t_user_1`(`userId`) USING BTREE,
  CONSTRAINT `t_user_role_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_user_role_t_role_id_fk` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3972 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 232, 1);
INSERT INTO `t_user_role` VALUES (3739, 3740, 2);
INSERT INTO `t_user_role` VALUES (3740, 3741, 2);
INSERT INTO `t_user_role` VALUES (3741, 3742, 2);
INSERT INTO `t_user_role` VALUES (3742, 3743, 2);
INSERT INTO `t_user_role` VALUES (3743, 3744, 2);
INSERT INTO `t_user_role` VALUES (3744, 3745, 2);
INSERT INTO `t_user_role` VALUES (3745, 3746, 2);
INSERT INTO `t_user_role` VALUES (3746, 3747, 2);
INSERT INTO `t_user_role` VALUES (3747, 3748, 2);
INSERT INTO `t_user_role` VALUES (3748, 3749, 2);
INSERT INTO `t_user_role` VALUES (3749, 3750, 2);
INSERT INTO `t_user_role` VALUES (3750, 3751, 2);
INSERT INTO `t_user_role` VALUES (3751, 3752, 2);
INSERT INTO `t_user_role` VALUES (3752, 3753, 2);
INSERT INTO `t_user_role` VALUES (3753, 3754, 2);
INSERT INTO `t_user_role` VALUES (3754, 3755, 2);
INSERT INTO `t_user_role` VALUES (3755, 3756, 2);
INSERT INTO `t_user_role` VALUES (3756, 3757, 2);
INSERT INTO `t_user_role` VALUES (3757, 3758, 2);
INSERT INTO `t_user_role` VALUES (3758, 3759, 2);
INSERT INTO `t_user_role` VALUES (3759, 3760, 2);
INSERT INTO `t_user_role` VALUES (3760, 3761, 2);
INSERT INTO `t_user_role` VALUES (3761, 3762, 2);
INSERT INTO `t_user_role` VALUES (3762, 3763, 2);
INSERT INTO `t_user_role` VALUES (3763, 3764, 2);
INSERT INTO `t_user_role` VALUES (3764, 3765, 2);
INSERT INTO `t_user_role` VALUES (3765, 3766, 2);
INSERT INTO `t_user_role` VALUES (3766, 3767, 2);
INSERT INTO `t_user_role` VALUES (3767, 3768, 2);
INSERT INTO `t_user_role` VALUES (3768, 3769, 2);
INSERT INTO `t_user_role` VALUES (3769, 3770, 2);
INSERT INTO `t_user_role` VALUES (3770, 3771, 2);
INSERT INTO `t_user_role` VALUES (3771, 3772, 2);
INSERT INTO `t_user_role` VALUES (3772, 3773, 2);
INSERT INTO `t_user_role` VALUES (3773, 3774, 2);
INSERT INTO `t_user_role` VALUES (3774, 3775, 2);
INSERT INTO `t_user_role` VALUES (3775, 3776, 2);
INSERT INTO `t_user_role` VALUES (3776, 3777, 2);
INSERT INTO `t_user_role` VALUES (3777, 3778, 2);
INSERT INTO `t_user_role` VALUES (3778, 3779, 2);
INSERT INTO `t_user_role` VALUES (3779, 3780, 2);
INSERT INTO `t_user_role` VALUES (3780, 3781, 2);
INSERT INTO `t_user_role` VALUES (3781, 3782, 2);
INSERT INTO `t_user_role` VALUES (3782, 3783, 2);
INSERT INTO `t_user_role` VALUES (3783, 3784, 2);
INSERT INTO `t_user_role` VALUES (3784, 3785, 2);
INSERT INTO `t_user_role` VALUES (3785, 3786, 2);
INSERT INTO `t_user_role` VALUES (3786, 3787, 2);
INSERT INTO `t_user_role` VALUES (3787, 3788, 2);
INSERT INTO `t_user_role` VALUES (3788, 3789, 2);
INSERT INTO `t_user_role` VALUES (3789, 3790, 2);
INSERT INTO `t_user_role` VALUES (3790, 3791, 2);
INSERT INTO `t_user_role` VALUES (3791, 3792, 2);
INSERT INTO `t_user_role` VALUES (3792, 3793, 2);
INSERT INTO `t_user_role` VALUES (3793, 3794, 2);
INSERT INTO `t_user_role` VALUES (3794, 3795, 2);
INSERT INTO `t_user_role` VALUES (3795, 3796, 2);
INSERT INTO `t_user_role` VALUES (3796, 3797, 2);
INSERT INTO `t_user_role` VALUES (3797, 3798, 2);
INSERT INTO `t_user_role` VALUES (3798, 3799, 2);
INSERT INTO `t_user_role` VALUES (3799, 3800, 2);
INSERT INTO `t_user_role` VALUES (3800, 3801, 2);
INSERT INTO `t_user_role` VALUES (3801, 3802, 2);
INSERT INTO `t_user_role` VALUES (3802, 3803, 2);
INSERT INTO `t_user_role` VALUES (3803, 3804, 2);
INSERT INTO `t_user_role` VALUES (3804, 3805, 2);
INSERT INTO `t_user_role` VALUES (3805, 3806, 2);
INSERT INTO `t_user_role` VALUES (3806, 3807, 2);
INSERT INTO `t_user_role` VALUES (3807, 3808, 2);
INSERT INTO `t_user_role` VALUES (3808, 3809, 2);
INSERT INTO `t_user_role` VALUES (3809, 3810, 2);
INSERT INTO `t_user_role` VALUES (3810, 3811, 2);
INSERT INTO `t_user_role` VALUES (3811, 3812, 2);
INSERT INTO `t_user_role` VALUES (3812, 3813, 2);
INSERT INTO `t_user_role` VALUES (3813, 3814, 2);
INSERT INTO `t_user_role` VALUES (3814, 3815, 2);
INSERT INTO `t_user_role` VALUES (3815, 3816, 2);
INSERT INTO `t_user_role` VALUES (3816, 3817, 2);
INSERT INTO `t_user_role` VALUES (3817, 3818, 2);
INSERT INTO `t_user_role` VALUES (3818, 3819, 2);
INSERT INTO `t_user_role` VALUES (3819, 3820, 2);
INSERT INTO `t_user_role` VALUES (3820, 3821, 2);
INSERT INTO `t_user_role` VALUES (3821, 3822, 2);
INSERT INTO `t_user_role` VALUES (3822, 3823, 2);
INSERT INTO `t_user_role` VALUES (3823, 3824, 2);
INSERT INTO `t_user_role` VALUES (3824, 3825, 2);
INSERT INTO `t_user_role` VALUES (3825, 3826, 2);
INSERT INTO `t_user_role` VALUES (3826, 3827, 2);
INSERT INTO `t_user_role` VALUES (3827, 3828, 2);
INSERT INTO `t_user_role` VALUES (3828, 3829, 2);
INSERT INTO `t_user_role` VALUES (3829, 3830, 2);
INSERT INTO `t_user_role` VALUES (3830, 3831, 2);
INSERT INTO `t_user_role` VALUES (3831, 3832, 2);
INSERT INTO `t_user_role` VALUES (3832, 3833, 2);
INSERT INTO `t_user_role` VALUES (3833, 3834, 2);
INSERT INTO `t_user_role` VALUES (3834, 3835, 2);
INSERT INTO `t_user_role` VALUES (3835, 3836, 2);
INSERT INTO `t_user_role` VALUES (3836, 3837, 2);
INSERT INTO `t_user_role` VALUES (3837, 3838, 2);
INSERT INTO `t_user_role` VALUES (3838, 3839, 2);
INSERT INTO `t_user_role` VALUES (3839, 3840, 2);
INSERT INTO `t_user_role` VALUES (3840, 3841, 2);
INSERT INTO `t_user_role` VALUES (3841, 3842, 2);
INSERT INTO `t_user_role` VALUES (3842, 3843, 2);
INSERT INTO `t_user_role` VALUES (3843, 3844, 2);
INSERT INTO `t_user_role` VALUES (3844, 3845, 2);
INSERT INTO `t_user_role` VALUES (3845, 3846, 2);
INSERT INTO `t_user_role` VALUES (3846, 3847, 2);
INSERT INTO `t_user_role` VALUES (3847, 3848, 2);
INSERT INTO `t_user_role` VALUES (3848, 3849, 2);
INSERT INTO `t_user_role` VALUES (3849, 3850, 2);
INSERT INTO `t_user_role` VALUES (3850, 3851, 2);
INSERT INTO `t_user_role` VALUES (3851, 3852, 2);
INSERT INTO `t_user_role` VALUES (3852, 3853, 2);
INSERT INTO `t_user_role` VALUES (3853, 3854, 2);
INSERT INTO `t_user_role` VALUES (3854, 3855, 2);
INSERT INTO `t_user_role` VALUES (3855, 3856, 2);
INSERT INTO `t_user_role` VALUES (3856, 3857, 2);
INSERT INTO `t_user_role` VALUES (3857, 3858, 2);
INSERT INTO `t_user_role` VALUES (3858, 3859, 2);
INSERT INTO `t_user_role` VALUES (3859, 3860, 2);
INSERT INTO `t_user_role` VALUES (3860, 3861, 2);
INSERT INTO `t_user_role` VALUES (3861, 3862, 2);
INSERT INTO `t_user_role` VALUES (3862, 3863, 2);
INSERT INTO `t_user_role` VALUES (3863, 3864, 2);
INSERT INTO `t_user_role` VALUES (3864, 3865, 2);
INSERT INTO `t_user_role` VALUES (3865, 3866, 2);
INSERT INTO `t_user_role` VALUES (3866, 3867, 2);
INSERT INTO `t_user_role` VALUES (3867, 3868, 2);
INSERT INTO `t_user_role` VALUES (3868, 3869, 2);
INSERT INTO `t_user_role` VALUES (3869, 3870, 2);
INSERT INTO `t_user_role` VALUES (3870, 3871, 2);
INSERT INTO `t_user_role` VALUES (3871, 3872, 2);
INSERT INTO `t_user_role` VALUES (3872, 3873, 2);
INSERT INTO `t_user_role` VALUES (3873, 3874, 2);
INSERT INTO `t_user_role` VALUES (3874, 3875, 2);
INSERT INTO `t_user_role` VALUES (3875, 3876, 2);
INSERT INTO `t_user_role` VALUES (3876, 3877, 2);
INSERT INTO `t_user_role` VALUES (3877, 3878, 2);
INSERT INTO `t_user_role` VALUES (3878, 3879, 2);
INSERT INTO `t_user_role` VALUES (3879, 3880, 2);
INSERT INTO `t_user_role` VALUES (3880, 3881, 2);
INSERT INTO `t_user_role` VALUES (3881, 3882, 2);
INSERT INTO `t_user_role` VALUES (3882, 3883, 2);
INSERT INTO `t_user_role` VALUES (3883, 3884, 2);
INSERT INTO `t_user_role` VALUES (3884, 3885, 2);
INSERT INTO `t_user_role` VALUES (3885, 3886, 2);
INSERT INTO `t_user_role` VALUES (3886, 3887, 2);
INSERT INTO `t_user_role` VALUES (3887, 3888, 2);
INSERT INTO `t_user_role` VALUES (3888, 3889, 2);
INSERT INTO `t_user_role` VALUES (3889, 3890, 2);
INSERT INTO `t_user_role` VALUES (3890, 3891, 2);
INSERT INTO `t_user_role` VALUES (3891, 3892, 2);
INSERT INTO `t_user_role` VALUES (3892, 3893, 2);
INSERT INTO `t_user_role` VALUES (3893, 3894, 2);
INSERT INTO `t_user_role` VALUES (3894, 3895, 2);
INSERT INTO `t_user_role` VALUES (3895, 3896, 2);
INSERT INTO `t_user_role` VALUES (3896, 3897, 2);
INSERT INTO `t_user_role` VALUES (3897, 3898, 2);
INSERT INTO `t_user_role` VALUES (3898, 3899, 2);
INSERT INTO `t_user_role` VALUES (3899, 3900, 2);
INSERT INTO `t_user_role` VALUES (3900, 3901, 2);
INSERT INTO `t_user_role` VALUES (3901, 3902, 2);
INSERT INTO `t_user_role` VALUES (3902, 3903, 2);
INSERT INTO `t_user_role` VALUES (3903, 3904, 2);
INSERT INTO `t_user_role` VALUES (3904, 3905, 2);
INSERT INTO `t_user_role` VALUES (3905, 3906, 2);
INSERT INTO `t_user_role` VALUES (3906, 3907, 2);
INSERT INTO `t_user_role` VALUES (3907, 3908, 2);
INSERT INTO `t_user_role` VALUES (3908, 3909, 2);
INSERT INTO `t_user_role` VALUES (3909, 3910, 2);
INSERT INTO `t_user_role` VALUES (3910, 3911, 2);
INSERT INTO `t_user_role` VALUES (3911, 3912, 2);
INSERT INTO `t_user_role` VALUES (3912, 3913, 2);
INSERT INTO `t_user_role` VALUES (3913, 3914, 2);
INSERT INTO `t_user_role` VALUES (3914, 3915, 2);
INSERT INTO `t_user_role` VALUES (3915, 3916, 2);
INSERT INTO `t_user_role` VALUES (3916, 3917, 2);
INSERT INTO `t_user_role` VALUES (3917, 3918, 2);
INSERT INTO `t_user_role` VALUES (3918, 3919, 2);
INSERT INTO `t_user_role` VALUES (3919, 3920, 2);
INSERT INTO `t_user_role` VALUES (3920, 3921, 2);
INSERT INTO `t_user_role` VALUES (3921, 3922, 2);
INSERT INTO `t_user_role` VALUES (3922, 3923, 2);
INSERT INTO `t_user_role` VALUES (3923, 3924, 2);
INSERT INTO `t_user_role` VALUES (3924, 3925, 2);
INSERT INTO `t_user_role` VALUES (3925, 3926, 2);
INSERT INTO `t_user_role` VALUES (3926, 3927, 2);
INSERT INTO `t_user_role` VALUES (3927, 3928, 2);
INSERT INTO `t_user_role` VALUES (3928, 3929, 2);
INSERT INTO `t_user_role` VALUES (3929, 3930, 2);
INSERT INTO `t_user_role` VALUES (3930, 3931, 2);
INSERT INTO `t_user_role` VALUES (3931, 3932, 2);
INSERT INTO `t_user_role` VALUES (3932, 3933, 2);
INSERT INTO `t_user_role` VALUES (3933, 3934, 2);
INSERT INTO `t_user_role` VALUES (3934, 3935, 3);
INSERT INTO `t_user_role` VALUES (3935, 3936, 3);
INSERT INTO `t_user_role` VALUES (3936, 3937, 3);
INSERT INTO `t_user_role` VALUES (3937, 3938, 3);
INSERT INTO `t_user_role` VALUES (3938, 3939, 3);
INSERT INTO `t_user_role` VALUES (3939, 3940, 3);
INSERT INTO `t_user_role` VALUES (3940, 3941, 3);
INSERT INTO `t_user_role` VALUES (3941, 3942, 3);
INSERT INTO `t_user_role` VALUES (3942, 3943, 3);
INSERT INTO `t_user_role` VALUES (3943, 3944, 3);
INSERT INTO `t_user_role` VALUES (3944, 3945, 3);
INSERT INTO `t_user_role` VALUES (3945, 3946, 3);
INSERT INTO `t_user_role` VALUES (3946, 3947, 3);
INSERT INTO `t_user_role` VALUES (3947, 3948, 3);
INSERT INTO `t_user_role` VALUES (3948, 3949, 3);
INSERT INTO `t_user_role` VALUES (3949, 3950, 3);
INSERT INTO `t_user_role` VALUES (3950, 3951, 3);
INSERT INTO `t_user_role` VALUES (3951, 3952, 3);
INSERT INTO `t_user_role` VALUES (3952, 3953, 3);
INSERT INTO `t_user_role` VALUES (3953, 3954, 3);
INSERT INTO `t_user_role` VALUES (3954, 3955, 3);
INSERT INTO `t_user_role` VALUES (3955, 3956, 3);
INSERT INTO `t_user_role` VALUES (3956, 3957, 3);
INSERT INTO `t_user_role` VALUES (3957, 3958, 3);
INSERT INTO `t_user_role` VALUES (3958, 3959, 3);
INSERT INTO `t_user_role` VALUES (3959, 3960, 3);
INSERT INTO `t_user_role` VALUES (3960, 3961, 3);
INSERT INTO `t_user_role` VALUES (3961, 3962, 3);
INSERT INTO `t_user_role` VALUES (3962, 3963, 3);
INSERT INTO `t_user_role` VALUES (3963, 3964, 3);
INSERT INTO `t_user_role` VALUES (3964, 3965, 3);
INSERT INTO `t_user_role` VALUES (3965, 3966, 3);
INSERT INTO `t_user_role` VALUES (3966, 3967, 3);
INSERT INTO `t_user_role` VALUES (3967, 3968, 3);
INSERT INTO `t_user_role` VALUES (3968, 3969, 3);
INSERT INTO `t_user_role` VALUES (3969, 3970, 3);
INSERT INTO `t_user_role` VALUES (3970, 3971, 3);
INSERT INTO `t_user_role` VALUES (3971, 3972, 3);

-- ----------------------------
-- Table structure for t_user_work
-- ----------------------------
DROP TABLE IF EXISTS `t_user_work`;
CREATE TABLE `t_user_work`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkTime` date NOT NULL COMMENT '获奖时间',
  `WorkPlace` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '获奖名次',
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `reviewAt` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `imagePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片路径',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `workId` int(11) NOT NULL COMMENT '奖项id',
  `reviewId` int(11) NOT NULL COMMENT '审核状态id',
  `score` int(11) NULL DEFAULT NULL COMMENT '分数',
  `scoreType` int(11) NOT NULL COMMENT '分数等级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_t_user_Work_t_Work_1`(`workId`) USING BTREE,
  INDEX `fk_t_user_Work_t_review_1`(`reviewId`) USING BTREE,
  INDEX `fk_t_user_Work_t_user_1`(`userId`) USING BTREE,
  INDEX `imagePath`(`imagePath`) USING BTREE,
  INDEX `fk_t_user_Work_t_work_type_1`(`scoreType`) USING BTREE,
  CONSTRAINT `t_user_Work_ibfk_1` FOREIGN KEY (`workId`) REFERENCES `t_work` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_user_Work_ibfk_2` FOREIGN KEY (`scoreType`) REFERENCES `t_work_type` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_user_Work_ibfk_3` FOREIGN KEY (`reviewId`) REFERENCES `t_review` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_user_Work_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户获奖信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_work
-- ----------------------------
INSERT INTO `t_user_work` VALUES (1, '2022-02-01', '测试', '2022-02-14 13:04:17', NULL, '\\upload\\student\\19计算机科学与技术8班\\19计算机科学与技术8班\\10419832赖志豪\\137_第一次作业\\测试_2022_02_14_13_04_17.jpeg', 3965, 137, 1, NULL, 1);

-- ----------------------------
-- Table structure for t_work
-- ----------------------------
DROP TABLE IF EXISTS `t_work`;
CREATE TABLE `t_work`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `WorkName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作业名称',
  `WorkContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作业内容',
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `DeadLine` date NOT NULL COMMENT '作业截止日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '奖项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_work
-- ----------------------------
INSERT INTO `t_work` VALUES (137, '第一次作业', '测试内容', '2022-02-11 13:29:47', '2022-02-11 14:07:16', '2022-02-26');
INSERT INTO `t_work` VALUES (138, '第二次作业', '作业Test', '2022-02-11 21:38:27', '2022-02-11 21:38:27', '2022-02-10');

-- ----------------------------
-- Table structure for t_work_type
-- ----------------------------
DROP TABLE IF EXISTS `t_work_type`;
CREATE TABLE `t_work_type`  (
  `id` int(11) NOT NULL,
  `typeName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '奖项类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_work_type
-- ----------------------------
INSERT INTO `t_work_type` VALUES (1, '未打分');
INSERT INTO `t_work_type` VALUES (2, '优秀');
INSERT INTO `t_work_type` VALUES (3, '良好');
INSERT INTO `t_work_type` VALUES (4, '及格');
INSERT INTO `t_work_type` VALUES (5, '不及格');

-- ----------------------------
-- View structure for v_student_info
-- ----------------------------
DROP VIEW IF EXISTS `v_student_info`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_student_info` AS select `t_user`.`id` AS `userId`,`t_user`.`username` AS `username`,`t_user`.`createAt` AS `createAt`,`t_user`.`updateAt` AS `updateAt`,`t_user_role`.`roleId` AS `roleId`,`t_role`.`roleName` AS `roleName`,`t_role`.`roleNameEn` AS `roleNameEn`,`t_student`.`stuNo` AS `stuNo`,`t_student`.`stuName` AS `name`,`t_class`.`className` AS `className`,`t_gender`.`genderName` AS `genderName`,`t_grade`.`gradeName` AS `gradeName`,`t_major`.`majorName` AS `majorName`,`t_student`.`genderId` AS `genderId`,`t_student`.`classId` AS `classId`,`t_class`.`gradeId` AS `gradeId`,`t_class`.`majorId` AS `majorId`,`t_class`.`classNo` AS `classNo` from (((((((`t_user` join `t_user_role` on((`t_user_role`.`userId` = `t_user`.`id`))) join `t_role` on((`t_user_role`.`roleId` = `t_role`.`id`))) join `t_student` on((`t_user`.`username` = `t_student`.`stuNo`))) join `t_class` on((`t_student`.`classId` = `t_class`.`id`))) join `t_gender` on((`t_student`.`genderId` = `t_gender`.`id`))) join `t_grade` on((`t_class`.`gradeId` = `t_grade`.`id`))) join `t_major` on((`t_class`.`majorId` = `t_major`.`id`)));

-- ----------------------------
-- View structure for v_student_work
-- ----------------------------
DROP VIEW IF EXISTS `v_student_work`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_student_work` AS select `t_user_work`.`id` AS `id`,`t_user_work`.`WorkTime` AS `WorkTime`,`t_user_work`.`WorkPlace` AS `WorkPlace`,`t_user_work`.`createAt` AS `createAt`,`t_user_work`.`reviewAt` AS `reviewAt`,`t_user_work`.`imagePath` AS `imagePath`,`t_work`.`WorkName` AS `WorkName`,`t_review`.`reviewName` AS `reviewName`,`v_student_info`.`username` AS `username`,`v_student_info`.`stuNo` AS `stuNo`,`v_student_info`.`name` AS `name`,`v_student_info`.`className` AS `className`,`v_student_info`.`genderName` AS `genderName`,`v_student_info`.`gradeName` AS `gradeName`,`v_student_info`.`majorName` AS `majorName`,`t_user_work`.`userId` AS `userId`,`t_user_work`.`workId` AS `WorkId`,`t_user_work`.`reviewId` AS `reviewId`,`v_student_info`.`genderId` AS `genderId`,`v_student_info`.`classId` AS `classId`,`v_student_info`.`gradeId` AS `gradeId`,`v_student_info`.`majorId` AS `majorId`,`t_work`.`createAt` AS `startTime`,`t_work`.`DeadLine` AS `DeadLine`,`t_user_work`.`score` AS `score`,`t_user_work`.`scoreType` AS `scoreType`,`t_work`.`WorkContent` AS `WorkContent`,`t_work_type`.`typeName` AS `scoreName` from ((((`t_user_work` join `t_work` on((`t_user_work`.`workId` = `t_work`.`id`))) join `t_review` on((`t_user_work`.`reviewId` = `t_review`.`id`))) join `v_student_info` on((`t_user_work`.`userId` = `v_student_info`.`userId`))) join `t_work_type` on((`t_user_work`.`scoreType` = `t_work_type`.`id`)));

-- ----------------------------
-- View structure for v_student_work_teacher
-- ----------------------------
DROP VIEW IF EXISTS `v_student_work_teacher`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_student_work_teacher` AS select `t_user_work`.`id` AS `id`,`t_user_work`.`WorkTime` AS `WorkTime`,`t_user_work`.`WorkPlace` AS `WorkPlace`,`t_user_work`.`createAt` AS `createAt`,`t_user_work`.`reviewAt` AS `reviewAt`,`t_user_work`.`imagePath` AS `imagePath`,`t_work`.`WorkName` AS `WorkName`,`t_review`.`reviewName` AS `reviewName`,`v_student_info`.`username` AS `username`,`v_student_info`.`stuNo` AS `stuNo`,`v_student_info`.`name` AS `name`,`v_student_info`.`className` AS `className`,`v_student_info`.`genderName` AS `genderName`,`v_student_info`.`gradeName` AS `gradeName`,`v_student_info`.`majorName` AS `majorName`,`t_user_work`.`userId` AS `userId`,`t_user_work`.`workId` AS `WorkId`,`t_user_work`.`reviewId` AS `reviewId`,`v_student_info`.`genderId` AS `genderId`,`v_student_info`.`classId` AS `classId`,`v_student_info`.`gradeId` AS `gradeId`,`v_student_info`.`majorId` AS `majorId`,`t_work`.`createAt` AS `startTime`,`t_work`.`DeadLine` AS `DeadLine`,`t_user_work`.`score` AS `score`,`t_user_work`.`scoreType` AS `scoreType`,`t_work`.`WorkContent` AS `WorkContent`,`t_work_type`.`typeName` AS `scoreName`,`t_teacher_link_student`.`teacherId` AS `teacherId` from (((((`t_user_work` join `t_work` on((`t_user_work`.`workId` = `t_work`.`id`))) join `t_review` on((`t_user_work`.`reviewId` = `t_review`.`id`))) join `v_student_info` on((`t_user_work`.`userId` = `v_student_info`.`userId`))) join `t_work_type` on((`t_user_work`.`scoreType` = `t_work_type`.`id`))) join `t_teacher_link_student` on((`v_student_info`.`classId` = `t_teacher_link_student`.`classId`)));

-- ----------------------------
-- View structure for v_teacher_info
-- ----------------------------
DROP VIEW IF EXISTS `v_teacher_info`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_teacher_info` AS select `t_user`.`id` AS `userId`,`t_user`.`username` AS `username`,`t_user`.`createAt` AS `createAt`,`t_user`.`updateAt` AS `updateAt`,`t_user_role`.`roleId` AS `roleId`,`t_role`.`roleName` AS `roleName`,`t_role`.`roleNameEn` AS `roleNameEn`,`t_teacher`.`teaNo` AS `teaNo`,`t_teacher`.`teaName` AS `name`,`t_gender`.`genderName` AS `genderName`,`t_teacher`.`genderId` AS `genderId` from ((((`t_user` join `t_user_role` on((`t_user_role`.`userId` = `t_user`.`id`))) join `t_role` on((`t_user_role`.`roleId` = `t_role`.`id`))) join `t_teacher` on((`t_user`.`username` = `t_teacher`.`teaNo`))) join `t_gender` on((`t_teacher`.`genderId` = `t_gender`.`id`)));

-- ----------------------------
-- View structure for v_user_info
-- ----------------------------
DROP VIEW IF EXISTS `v_user_info`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_user_info` AS select `t_user`.`id` AS `userId`,`t_user`.`username` AS `username`,`t_user`.`password` AS `password`,`t_user_role`.`roleId` AS `roleId`,`t_role`.`roleName` AS `roleName`,`t_role`.`roleNameEn` AS `roleNameEn` from ((`t_user` join `t_user_role` on((`t_user_role`.`userId` = `t_user`.`id`))) join `t_role` on((`t_user_role`.`roleId` = `t_role`.`id`)));

-- ----------------------------
-- View structure for v_work_info
-- ----------------------------
DROP VIEW IF EXISTS `v_work_info`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_work_info` AS select `t_work`.`id` AS `id`,`t_work`.`WorkName` AS `WorkName`,`t_work`.`WorkContent` AS `WorkContent`,`t_work`.`DeadLine` AS `DeadLine`,`t_work`.`createAt` AS `createAt`,`t_work`.`updateAt` AS `updateAt` from `t_work`;

SET FOREIGN_KEY_CHECKS = 1;
