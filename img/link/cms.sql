/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : service-mysql:3306
 Source Schema         : cms

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 06/05/2021 17:17:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

--
-- Current Database: `cms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cms` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cms`;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `order_num` int DEFAULT NULL COMMENT '排序',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `changed_at` datetime DEFAULT NULL COMMENT '修改时间',
  `changed_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COMMENT='部门管理';

-- ----------------------------
-- Records of dept
-- ----------------------------
BEGIN;
INSERT INTO `dept` VALUES (1, -1, '北京奈特瑞科技有限公司', 1, '2019-06-26 11:11:42', 'admin', '2019-07-22 17:34:11', 'admin', 5, 0);
INSERT INTO `dept` VALUES (8, 1, '北京开发团队', 2, '2019-06-26 11:11:42', 'admin', '2020-07-14 11:04:22', 'admin', 1, 0);
INSERT INTO `dept` VALUES (9, 8, '医疗研发中心', 3, '2019-06-26 11:11:42', 'admin', '2020-07-15 15:57:21', 'admin', 0, 0);
INSERT INTO `dept` VALUES (10, 1, '药品管理部', 1, '2020-12-01 19:09:05', 'admin', NULL, NULL, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典名称',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典类型',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典码',
  `value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典值',
  `order_num` int DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `changed_at` datetime DEFAULT NULL COMMENT '修改时间',
  `changed_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标记  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `type` (`type`,`code`,`del_flag`) USING BTREE,
  KEY `查询索引` (`type`,`code`,`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb3 COMMENT='数据字典表';

-- ----------------------------
-- Records of dict
-- ----------------------------
BEGIN;
INSERT INTO `dict` VALUES (1, 177, NULL, NULL, '0', '待支付', 1, NULL, '2018-04-12 14:19:34', 'admin', '2019-01-17 14:39:31', 'admin', 3, 0);
INSERT INTO `dict` VALUES (2, 177, NULL, NULL, '1', '已支付', 2, NULL, '2018-04-12 14:19:34', 'admin', '2019-01-17 14:40:09', 'admin', 2, 0);
INSERT INTO `dict` VALUES (3, 177, NULL, NULL, '2', '退款', 3, NULL, '2018-04-12 14:19:34', 'admin', '2019-01-17 14:40:03', 'admin', 2, 0);
INSERT INTO `dict` VALUES (7, 175, NULL, NULL, '1', '待付款', 1, NULL, '2018-04-12 14:19:34', 'admin', '2019-01-17 14:39:41', 'admin', 2, 0);
INSERT INTO `dict` VALUES (9, 175, NULL, NULL, '2', '待审核', 2, NULL, '2018-04-12 14:19:34', 'admin', '2019-01-17 14:39:41', 'admin', 2, 0);
INSERT INTO `dict` VALUES (10, 175, NULL, NULL, '3', '订单审核完成', 3, NULL, '2018-04-12 14:19:34', 'admin', '2019-01-17 14:39:41', 'admin', 2, 0);
INSERT INTO `dict` VALUES (11, 175, NULL, NULL, '4', '库房分配完成', 4, NULL, '2018-04-12 14:19:34', 'admin', '2019-01-17 14:39:41', 'admin', 2, 0);
INSERT INTO `dict` VALUES (14, 175, NULL, NULL, '5', '药店已确认订单', 6, NULL, '2018-04-12 14:19:34', 'admin', '2019-01-17 14:39:41', 'admin', 2, 0);
INSERT INTO `dict` VALUES (15, 175, NULL, NULL, '6', '订单已发货', 7, NULL, '2018-04-12 14:19:34', 'admin', '2019-01-17 14:39:41', 'admin', 2, 0);
INSERT INTO `dict` VALUES (16, 175, NULL, NULL, '7', '订单已签收', 8, NULL, '2018-04-12 14:19:34', 'admin', '2019-01-17 14:39:41', 'admin', 2, 0);
INSERT INTO `dict` VALUES (17, 169, NULL, NULL, '0', '主动退货', 0, NULL, '2019-02-19 14:03:57', 'admin', '2019-02-19 15:13:05', 'admin', 1, 0);
INSERT INTO `dict` VALUES (18, 169, NULL, NULL, '1', '客户拒收', 0, NULL, '2019-02-19 14:04:30', 'admin', '2019-02-19 15:13:20', 'admin', 1, 0);
INSERT INTO `dict` VALUES (19, 170, NULL, NULL, '0', '待审核', 0, NULL, '2019-02-19 15:14:10', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (20, 170, NULL, NULL, '1', '客服审核不通过', 0, NULL, '2019-02-19 15:14:32', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (21, 170, NULL, NULL, '2', '客服审核通过', 0, NULL, '2019-02-19 15:14:50', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (22, 170, NULL, NULL, '3', '生成退款单', 0, NULL, '2019-02-19 15:15:05', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (23, 170, NULL, NULL, '4', '已完成', 0, NULL, '2019-02-19 15:15:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (24, 171, NULL, NULL, '0', '待审核', 0, NULL, '2019-02-22 15:25:38', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (26, 171, NULL, NULL, '1', '审核不通过', 0, NULL, '2019-02-22 15:26:12', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (27, 171, NULL, NULL, '2', '审核通过', 0, NULL, '2019-02-22 15:26:28', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (28, 171, NULL, NULL, '3', '已退款', 0, NULL, '2019-02-22 15:26:48', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (29, 170, NULL, NULL, '5', '已取消', 0, NULL, '2019-03-11 14:12:58', 'admin', '2019-03-11 14:17:35', 'admin', 3, 0);
INSERT INTO `dict` VALUES (30, 178, NULL, NULL, '0', '已上架', 1, NULL, '2019-03-12 12:57:52', 'admin', '2019-03-20 16:02:20', 'admin', 1, 0);
INSERT INTO `dict` VALUES (31, 178, NULL, NULL, '1', '已下架', 1, NULL, '2019-03-12 12:58:17', 'admin', '2019-03-20 16:02:30', 'admin', 1, 0);
INSERT INTO `dict` VALUES (32, 178, NULL, NULL, '2', '已删除', 1, NULL, '2019-03-12 12:58:32', 'admin', '2019-03-20 16:02:41', 'admin', 1, 0);
INSERT INTO `dict` VALUES (33, 172, NULL, NULL, '0', '不支持退换货', 0, NULL, '2019-03-12 13:02:42', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (34, 172, NULL, NULL, '1', '7天无理由退货，拆开包装除外', 0, NULL, '2019-03-12 13:03:14', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (35, 173, NULL, NULL, '1', '耗材', 0, NULL, '2019-03-12 13:05:16', 'admin', '2019-03-12 13:12:21', 'admin', 1, 0);
INSERT INTO `dict` VALUES (36, 173, NULL, NULL, '2', '食品', 0, NULL, '2019-03-12 13:05:37', 'admin', '2019-03-12 13:12:15', 'admin', 2, 0);
INSERT INTO `dict` VALUES (37, 174, NULL, NULL, '1', '/ccm/static/images/product/', 0, NULL, '2019-03-13 15:31:31', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (38, 174, NULL, NULL, '2', '/ccm/static/images/detection/', 0, NULL, '2019-03-13 15:31:53', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (39, 179, NULL, NULL, '1', 'http://img.dev.naiterui.com', 1, NULL, '2019-03-13 15:50:12', 'admin', '2019-08-15 14:48:34', 'admin', 2, 0);
INSERT INTO `dict` VALUES (40, 175, NULL, NULL, '8', '已取消', 9, NULL, '2019-03-15 16:30:22', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (41, 179, NULL, NULL, '0', 'http://img.dev.naiterui.com/doctor/images/', 1, '医生资质域名', '2019-03-20 11:40:29', 'admin', '2019-08-15 14:48:10', 'admin', 0, 0);
INSERT INTO `dict` VALUES (48, 176, NULL, NULL, '1', '正常', 1, NULL, '2019-03-29 11:34:19', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (49, 176, NULL, NULL, '2', '已取消上门', 0, NULL, '2019-03-29 11:34:29', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (50, 180, NULL, NULL, '0', '下架', 1, NULL, '2019-04-02 17:05:49', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (51, 180, NULL, NULL, '1', '上架', 2, NULL, '2019-04-02 17:05:59', 'admin', '2019-04-02 17:06:19', 'admin', 1, 0);
INSERT INTO `dict` VALUES (55, 181, NULL, NULL, '0', '未知', 1, NULL, '2019-04-28 09:41:16', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (56, 181, NULL, NULL, '1', '男', 1, NULL, '2019-04-28 09:41:29', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (57, 181, NULL, NULL, '2', '女', 1, NULL, '2019-04-28 09:41:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (58, 182, NULL, NULL, '0', '禁用', 1, NULL, '2019-04-28 09:59:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (59, 182, NULL, NULL, '1', '正常', 1, NULL, '2019-04-28 09:59:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (60, 183, NULL, NULL, '0', '目录', 1, NULL, '2019-04-28 10:02:42', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (61, 183, NULL, NULL, '1', '菜单', 1, NULL, '2019-04-28 10:02:54', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (62, 183, NULL, NULL, '2', '按钮', 1, NULL, '2019-04-28 10:03:07', 'admin', '2019-04-30 18:02:57', 'admin', 1, 0);
INSERT INTO `dict` VALUES (63, 184, NULL, NULL, '0', '冻结', 1, NULL, '2019-05-07 14:37:52', 'admin', '2019-05-07 14:52:31', 'admin', 1, 0);
INSERT INTO `dict` VALUES (64, 184, NULL, NULL, '1', '可提现', 1, NULL, '2019-05-07 14:38:08', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (65, 184, NULL, NULL, '2', '已取消', 1, NULL, '2019-05-07 14:38:19', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (66, 184, NULL, NULL, '3', '已提现', 1, NULL, '2019-05-07 14:38:32', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (67, 185, NULL, NULL, '1', '正常', 1, NULL, '2019-05-07 14:42:52', 'admin', '2019-05-07 14:54:06', 'admin', 1, 0);
INSERT INTO `dict` VALUES (68, 185, NULL, NULL, '0', '锁定', 1, NULL, '2019-05-07 14:43:10', 'admin', '2019-05-07 14:54:00', 'admin', 1, 0);
INSERT INTO `dict` VALUES (69, 186, NULL, NULL, '0', '普通用户', 1, NULL, '2019-05-08 11:20:58', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (70, 186, NULL, NULL, '1', '种子用户', 1, NULL, '2019-05-08 11:21:15', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (71, 187, NULL, NULL, '0', '正常', 1, NULL, '2019-05-14 19:17:22', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (72, 187, NULL, NULL, '1', '禁用', 1, NULL, '2019-05-14 19:17:34', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (73, 188, NULL, NULL, '0', '未知', 1, NULL, '2019-05-14 19:19:12', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (74, 188, NULL, NULL, '1', '未取消', 1, NULL, '2019-05-14 19:19:32', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (75, 188, NULL, NULL, '2', '已取消', 1, NULL, '2019-05-14 19:19:50', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (76, 189, NULL, NULL, '0', '正式', 1, NULL, '2019-05-14 19:21:03', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (77, 189, NULL, NULL, '1', '测试', 1, NULL, '2019-05-14 19:21:16', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (78, 191, NULL, NULL, '0', '未认证', 1, NULL, '2019-05-14 19:22:38', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (79, 191, NULL, NULL, '1', '已认证', 1, NULL, '2019-05-14 19:22:54', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (80, 190, NULL, NULL, '0', '待审核', 1, NULL, '2019-05-14 19:24:55', 'admin', '2019-08-19 15:27:07', 'admin', 0, 0);
INSERT INTO `dict` VALUES (81, 190, NULL, NULL, '1', '已认证', 1, NULL, '2019-05-14 19:24:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (82, 190, NULL, NULL, '2', '未通过', 1, NULL, '2019-05-14 19:24:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (83, 190, NULL, NULL, '3', '再次申请认证', 1, NULL, '2019-05-14 19:24:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (84, 190, NULL, NULL, '4', '未提交资料', 1, NULL, '2019-05-14 19:24:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (85, 190, NULL, NULL, '5', '资料不完善', 1, NULL, '2019-05-14 19:24:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (86, 192, NULL, NULL, '0', '未申请备案', 1, NULL, '2019-05-14 19:24:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (87, 192, NULL, NULL, '1', '备案审核中', 1, NULL, '2019-05-14 19:24:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (88, 192, NULL, NULL, '2', '备案成功', 1, NULL, '2019-05-14 19:24:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (89, 192, NULL, NULL, '3', '备案失败', 1, NULL, '2019-05-14 19:24:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (90, 192, NULL, NULL, '4', '要求备案', 1, NULL, '2019-05-14 19:24:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (91, 193, NULL, NULL, '0', '正常', 1, NULL, '2019-05-14 19:24:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (92, 193, NULL, NULL, '1', '禁用', 1, NULL, '2019-05-14 19:24:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (93, 194, NULL, NULL, '0', '正式', 1, NULL, '2019-05-14 19:52:53', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (94, 194, NULL, NULL, '1', '测试', 1, NULL, '2019-05-14 19:53:04', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (95, 195, NULL, NULL, '0', '医师', 1, NULL, '2019-05-15 13:41:50', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (96, 195, NULL, NULL, '1', '副主任医师', 1, NULL, '2019-05-15 13:42:06', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (97, 195, NULL, NULL, '2', '主任医师', 1, NULL, '2019-05-15 13:42:21', 'admin', '2019-05-15 13:42:28', 'admin', 1, 0);
INSERT INTO `dict` VALUES (98, 195, NULL, NULL, '3', '主治医师', 1, NULL, '2019-05-15 13:42:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (99, 195, NULL, NULL, '4', '住院医师', 1, NULL, '2019-05-15 13:42:59', 'admin', '2019-07-12 11:41:17', 'admin', 0, 0);
INSERT INTO `dict` VALUES (100, 204, NULL, NULL, '0', '患者发起', 1, NULL, '2019-05-15 14:30:01', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (101, 204, NULL, NULL, '1', '医生发起', 1, NULL, '2019-05-15 14:30:14', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (102, 209, NULL, NULL, '0', '免费', 1, NULL, '2019-05-15 14:33:48', 'admin', NULL, NULL, 0, 1);
INSERT INTO `dict` VALUES (103, 209, NULL, NULL, '1', '收费', 1, NULL, '2019-05-15 14:33:59', 'admin', NULL, NULL, 0, 1);
INSERT INTO `dict` VALUES (104, 205, NULL, NULL, '1', '处方药', 1, NULL, '2019-05-20 14:32:06', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (105, 205, NULL, NULL, '2', 'OTC', 1, NULL, '2019-05-20 14:32:19', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (106, 206, NULL, NULL, '1', '中药', 1, NULL, '2019-05-20 14:32:58', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (107, 206, NULL, NULL, '2', '西药', 1, NULL, '2019-05-20 14:33:11', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (108, 206, NULL, NULL, '3', '血液制品', 1, NULL, '2019-05-20 14:33:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (109, 206, NULL, NULL, '4', '诊断制剂', 1, NULL, '2019-05-20 14:33:42', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (110, 207, NULL, NULL, '0', '无效', 1, NULL, '2019-05-20 14:45:19', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (111, 207, NULL, NULL, '1', '有效', 1, NULL, '2019-05-20 14:45:29', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (112, 208, NULL, NULL, '0', '正常', 1, NULL, '2019-05-21 20:32:41', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (113, 208, NULL, NULL, '1', '作废', 1, NULL, '2019-05-21 20:33:01', 'admin', '2019-05-21 20:33:08', 'admin', 1, 0);
INSERT INTO `dict` VALUES (114, 210, NULL, NULL, '0', '正常', 1, NULL, '2019-05-21 20:34:39', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (115, 210, NULL, NULL, '1', '非安全用药强制发送', 1, NULL, '2019-05-21 20:34:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (116, 211, NULL, NULL, '1', '同意收集', 1, NULL, '2019-05-21 20:35:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (117, 211, NULL, NULL, '2', '不同意收集', 1, NULL, '2019-05-21 20:36:08', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (118, 211, NULL, NULL, '3', '未提示是否同意', 1, NULL, '2019-05-21 20:36:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (119, 211, NULL, NULL, '4', '暂不同意', 1, NULL, '2019-05-21 20:36:41', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (120, 212, NULL, NULL, '0', '推荐未发送', 1, NULL, '2019-05-21 20:37:19', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (121, 212, NULL, NULL, '1', '非强制推荐', 1, NULL, '2019-05-21 20:37:35', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (122, 212, NULL, NULL, '2', '强制推荐(不进行电子签名)', 1, NULL, '2019-05-21 20:37:50', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (123, 216, NULL, NULL, '0', '未购', 1, NULL, '2019-05-21 20:38:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (124, 216, NULL, NULL, '1', '已全部购买', 1, NULL, '2019-05-21 20:39:07', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (125, 216, NULL, NULL, '2', '已下单', 1, NULL, '2019-05-21 20:39:22', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (126, 216, NULL, NULL, '3', '部分购买', 1, NULL, '2019-05-21 20:39:37', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (127, 216, NULL, NULL, '4', '已取消', 1, NULL, '2019-05-21 20:39:49', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (128, 213, NULL, NULL, '1', '普通推荐', 1, NULL, '2019-05-21 20:40:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (129, 213, NULL, NULL, '2', '求药推荐', 1, NULL, '2019-05-21 20:40:59', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (130, 213, NULL, NULL, '3', '系统推荐', 1, NULL, '2019-05-21 20:41:11', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (131, 214, NULL, NULL, '0', '未签名', 1, NULL, '2019-05-23 14:47:59', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (132, 214, NULL, NULL, '1', '已签名', 1, NULL, '2019-05-23 14:48:21', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (133, 214, NULL, NULL, '2', '签名失败', 1, NULL, '2019-05-23 14:48:37', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (134, 214, NULL, NULL, '-1', '不需要电子签名', 1, NULL, '2019-05-23 14:50:57', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (135, 215, NULL, NULL, '0', '未签名', 1, NULL, '2019-05-23 14:52:25', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (136, 215, NULL, NULL, '1', '已签名', 1, NULL, '2019-05-23 14:53:26', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (137, 197, NULL, NULL, '1', '药品', 1, NULL, '2019-06-10 20:19:00', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (138, 197, NULL, NULL, '2', '保健品', 2, NULL, '2019-06-10 20:19:18', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (139, 203, NULL, NULL, '盒', '盒', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (140, 203, NULL, NULL, '瓶', '瓶', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (141, 203, NULL, NULL, '袋', '袋', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (142, 203, NULL, NULL, '包', '包', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (143, 202, NULL, NULL, '片', '片', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (144, 202, NULL, NULL, '粒', '粒', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (145, 202, NULL, NULL, '支', '支', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (146, 202, NULL, NULL, '包', '包', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (147, 202, NULL, NULL, '块', '块', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (148, 202, NULL, NULL, '枚', '枚', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (149, 202, NULL, NULL, '丸', '丸', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (150, 202, NULL, NULL, '袋', '袋', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (151, 202, NULL, NULL, '滴', '滴', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (152, 202, NULL, NULL, '喷', '喷', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (153, 202, NULL, NULL, '瓶', '瓶', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (154, 202, NULL, NULL, '揿', '揿', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (155, 202, NULL, NULL, '贴', '贴', 1, NULL, '2019-06-11 10:20:45', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (156, 201, NULL, NULL, '0', '否', 1, NULL, '2019-06-11 11:40:09', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (157, 201, NULL, NULL, '1', '是', 1, NULL, '2019-06-11 11:40:30', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (158, 200, NULL, NULL, '0', '否', 1, NULL, '2019-06-11 11:41:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (159, 200, NULL, NULL, '1', '是', 1, NULL, '2019-06-11 11:42:01', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (160, 199, NULL, NULL, '0', '否', 1, NULL, '2019-06-12 15:32:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (161, 199, NULL, NULL, '1', '是', 1, NULL, '2019-06-12 15:32:57', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (163, 198, NULL, NULL, '0', '待审核', 1, NULL, '2019-06-18 19:43:38', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (164, 198, NULL, NULL, '1', '通过', 1, NULL, '2019-06-18 19:43:53', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (165, 198, NULL, NULL, '2', '不通过', 1, NULL, '2019-06-18 19:44:03', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (166, 196, NULL, NULL, '0', '是', 1, NULL, '2019-06-18 19:51:42', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (167, 196, NULL, NULL, '1', '否', 1, NULL, '2019-06-18 19:51:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (168, 179, NULL, NULL, '2', 'http://img.dev.naiterui.com/s/', 1, 'sku 图片域名', '2019-06-19 14:54:17', 'admin', '2019-08-15 14:48:01', 'admin', 0, 0);
INSERT INTO `dict` VALUES (169, 0, '退货涞源', 'return_order_source', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', '2019-06-26 17:52:28', 'admin', 0, 0);
INSERT INTO `dict` VALUES (170, 0, '退货订单状态	', 'return_order_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (171, 0, '退款审核状态', 'refund_order_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (172, 0, '商品退换货政策', 'product_return_service', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (173, 0, '商品分类', 'product_category', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (174, 0, '文件上传类型', 'upload_type', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (175, 0, '订单状态', 'order_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (176, 0, '揽收申请状态', 'detection_apply_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (177, 0, '订单支付状态', 'pay_order_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (178, 0, '商品状态', 'product_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (179, 0, '文件域名', 'img_host_type', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (180, 0, '商品规格状态', 'sku_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (181, 0, '性别', 'user_gender', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (182, 0, '用户状态', 'system_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (183, 0, '菜单类型', 'menu_type', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (184, 0, '提现状态', 'commission_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (185, 0, '提现是否可以解冻', 'commission_unlock', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (186, 0, '用户标签', 'mp_user_label', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (187, 0, '患者用户状态', 'patient_account_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (188, 0, '患者关注公众号状态', 'patient_cancel', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', '2019-07-22 14:07:29', 'admin', 0, 0);
INSERT INTO `dict` VALUES (189, 0, '患者账号类型', 'patient_type', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (190, 0, '医生认证状态', 'doctor_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (191, 0, '患者认证状态', 'patient_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (192, 0, '医生备案状态', 'doctor_record_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (193, 0, '医生账号状态', 'doctor_account_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (194, 0, '医生账号类型', 'doctor_type', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (195, 0, '医生职级', 'doctor_title', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (196, 0, '是否默认SKU', 'default_sku', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (197, 0, '商品种类', 'product_type', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (198, 0, '处方审核状态', 'medication_audit_type', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (199, 0, '是否隐藏菜单', 'menu_hidden', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (200, 0, '商品资料是否完整', 'product_data_integrity', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (201, 0, '商品是否关联SKU', 'product_relation_sku', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (202, 0, '最小包装单位', 'product_packing_unit_limit', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (203, 0, '包装单位', 'product_packing_unit', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (204, 0, '会话关系', 'consult_session_relation', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (205, 0, '药监局分类', 'product_nmpa_type', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (206, 0, '原料分类', 'product_material_type', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (207, 0, '商品状态', 'product_valid', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (208, 0, '处方病例作废状态', 'medication_recom_invalid', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (209, 0, '会话消费类型', 'consult_session_type', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 1);
INSERT INTO `dict` VALUES (210, 0, '处方触发安全用药发送标记', 'medication_recom_safeStatus', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (211, 0, '处方病历数据收集状态', 'medication_recom_collectStatus', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (212, 0, '处方强制推荐标识', 'medication_recom_forceRecom', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (213, 0, '处方推荐类型', 'medication_recom_type', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (214, 0, '处方医生电子签名状态', 'dedication_doctor_sign_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (215, 0, '药师电子签名状态', 'dedication_pharmacist_sign_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (216, 0, '处方推荐用药是否购药', 'medication_recom_status', '', '', 0, NULL, '2019-06-25 20:10:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (219, 202, NULL, NULL, '板', '板', 1, NULL, '2019-06-27 13:20:13', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (220, 202, NULL, NULL, 'g', '克', 1, NULL, '2019-06-28 10:43:41', 'admin', '2019-06-28 11:04:50', 'admin', 0, 0);
INSERT INTO `dict` VALUES (221, 0, '商家状态', 'warehouse_status', NULL, NULL, 1, NULL, '2019-07-16 14:28:39', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (222, 221, NULL, NULL, '0', '启用', 1, NULL, '2019-07-16 14:28:54', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (223, 221, NULL, NULL, '1', '停用', 1, NULL, '2019-07-16 14:29:02', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (224, 0, '库存状态', 'inventory_status', NULL, NULL, 1, NULL, '2019-07-16 14:29:55', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (225, 224, NULL, NULL, '0', '否', 1, NULL, '2019-07-16 14:30:05', 'admin', '2019-07-16 14:30:30', 'admin', 0, 0);
INSERT INTO `dict` VALUES (226, 224, NULL, NULL, '1', '是', 1, NULL, '2019-07-16 14:30:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (227, 0, '支付方式', 'pay_type', NULL, NULL, 1, NULL, '2019-07-17 16:02:58', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (228, 227, NULL, NULL, '2', '货到付款', 1, NULL, '2019-07-17 16:03:06', 'admin', '2019-09-26 13:48:39', 'admin', 0, 0);
INSERT INTO `dict` VALUES (229, 227, NULL, NULL, '1', '微信支付', 1, NULL, '2019-07-17 16:03:15', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (230, 0, '结算周期', 'settlement_cycle', '', '', 0, NULL, '2019-12-17 21:08:50', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (231, 0, '结算类型', 'settlement_type', '', '', 0, NULL, '2019-12-17 21:08:50', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (232, 0, '结算状态', 'settlement_status', '', '', 0, NULL, '2019-12-17 21:08:50', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (233, 230, NULL, NULL, '1', '单周', 1, NULL, '2019-12-17 21:09:36', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (234, 230, NULL, NULL, '2', '双周', 2, NULL, '2019-12-17 21:09:36', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (235, 230, NULL, NULL, '3', '月结', 3, NULL, '2019-12-17 21:09:36', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (236, 231, NULL, NULL, '1', '应收模式', 1, NULL, '2019-12-17 21:09:36', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (237, 231, NULL, NULL, '2', '留存模式', 2, NULL, '2019-12-17 21:09:36', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (238, 232, NULL, NULL, '0', '未结算', 1, NULL, '2019-12-17 21:09:36', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (239, 232, NULL, NULL, '1', '已结算', 2, NULL, '2019-12-17 21:09:36', 'admin', NULL, NULL, 0, 0);
INSERT INTO `dict` VALUES (240, 232, NULL, NULL, '2', '已延期', 3, NULL, '2019-12-17 21:09:36', 'admin', NULL, NULL, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求参数',
  `time` bigint NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'IP地址',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `changed_at` datetime DEFAULT NULL COMMENT '修改时间',
  `changed_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '是否删除 0：正常 1：删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `username` (`username`,`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62889 DEFAULT CHARSET=utf8mb3 COMMENT='系统日志';

-- ----------------------------
-- Records of log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标',
  `order_num` int NOT NULL DEFAULT '0' COMMENT '排序',
  `component` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组件路径地址',
  `hidden` int DEFAULT '0' COMMENT '是否隐藏 0：不隐藏  1：隐藏',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `changed_at` datetime DEFAULT NULL COMMENT '修改时间',
  `changed_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '是否删除 0：正常 1：删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb3 COMMENT='菜单管理';

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES (1, -1, '系统管理', '/system', NULL, 0, 'shezhi', 1, NULL, 0, '2018-04-12 00:00:00', 'admin', '2020-07-01 10:45:10', 'admin', 13, 0);
INSERT INTO `menu` VALUES (2, 1, '用户管理', 'user', '', 1, 'yonghuguanli', 1, 'system/user', 0, '2018-04-12 00:00:00', 'admin', '2019-10-19 15:11:22', 'admin', 8, 0);
INSERT INTO `menu` VALUES (3, 1, '角色管理', 'role', '', 1, 'jiaoseguanli', 2, 'system/role', 0, '2018-04-12 00:00:00', 'admin', '2019-10-19 15:11:28', 'admin', 2, 0);
INSERT INTO `menu` VALUES (4, 1, '菜单管理', 'menu', '', 1, 'caidan', 4, 'system/menu', 0, '2018-04-12 00:00:00', 'admin', '2019-10-19 15:11:39', 'admin', 4, 0);
INSERT INTO `menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0, NULL, 0, '2018-04-12 00:00:00', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0, NULL, 0, '2018-04-12 00:00:00', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0, NULL, 0, '2018-04-12 00:00:00', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:perms', 2, NULL, 0, NULL, 0, '2018-04-12 00:00:00', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:perms', 2, NULL, 0, NULL, 0, '2018-04-12 00:00:00', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0, NULL, 0, '2018-04-12 00:00:00', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select,sys:dept:select', 2, NULL, 0, NULL, 0, '2018-04-12 00:00:00', 'admin', '2019-10-14 14:06:41', 'quanxian', 0, 0);
INSERT INTO `menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select,sys:dept:select', 2, NULL, 0, NULL, 0, '2018-04-12 00:00:00', 'admin', '2019-10-14 14:06:52', 'quanxian', 0, 0);
INSERT INTO `menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0, NULL, 0, '2018-04-12 00:00:00', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (29, 1, '系统日志', 'log', 'sys:log:list', 1, 'log', 6, 'system/log', 0, '2018-04-12 00:00:00', 'admin', '2019-10-19 15:11:46', 'admin', 5, 0);
INSERT INTO `menu` VALUES (31, 1, '部门管理', 'dept', '', 1, 'bumenguanli', 3, 'system/dept', 0, '2018-04-12 00:00:00', 'admin', '2019-10-19 15:11:34', 'admin', 4, 0);
INSERT INTO `menu` VALUES (33, 31, '新增', NULL, 'sys:dept:save,sys:dept:select', 2, NULL, 0, NULL, 0, '2018-04-12 00:00:00', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (34, 31, '修改', NULL, 'sys:dept:update,sys:dept:select', 2, NULL, 0, NULL, 0, '2018-04-12 00:00:00', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (35, 31, '删除', NULL, 'sys:dept:delete', 2, NULL, 0, NULL, 0, '2018-04-12 00:00:00', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (64, -1, '订单管理', '/oms', NULL, 0, 'dingdanguanli', 2, NULL, 0, '2019-01-16 16:02:49', 'admin', '2019-04-24 11:12:31', 'admin', 10, 0);
INSERT INTO `menu` VALUES (65, -1, '用户管理', '/user', NULL, 0, 'yonghuguanli', 3, NULL, 0, '2019-01-16 16:03:05', 'admin', '2019-05-14 15:52:27', 'admin', 12, 0);
INSERT INTO `menu` VALUES (66, 65, '医生管理', 'doctor', '', 1, 'yisheng', 1, 'user/doctor', 0, '2019-01-16 16:04:48', 'admin', '2019-08-23 10:55:43', 'admin', 10, 0);
INSERT INTO `menu` VALUES (68, 64, '订单列表', 'order', '', 1, 'gouwudingdan', 1, 'oms/order', 0, '2019-01-16 16:05:54', 'admin', '2019-08-23 10:55:12', 'admin', 13, 0);
INSERT INTO `menu` VALUES (74, 65, '患者管理', 'patient', '', 1, 'huanzhe', 1, 'user/patient', 0, '2019-01-16 20:54:07', 'admin', '2019-08-23 10:56:02', 'admin', 7, 0);
INSERT INTO `menu` VALUES (86, 2, 'dashboard', NULL, 'sys:dashboard:list', 2, NULL, 0, NULL, 0, '2019-03-19 13:51:32', 'admin', '2019-07-01 14:22:56', 'admin', 0, 0);
INSERT INTO `menu` VALUES (87, 68, '统计', NULL, 'oms:order:statistical', 2, NULL, 0, NULL, 0, '2019-03-27 13:03:52', 'admin', '2019-04-23 14:04:13', 'admin', 1, 0);
INSERT INTO `menu` VALUES (105, 68, '取消订单', NULL, 'oms:order:cancel', 2, NULL, 1, NULL, 0, '2019-04-23 14:05:49', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (114, -1, '处方管理', '/recommend', NULL, 0, 'chufangguanli', 5, NULL, 0, '2019-05-21 20:05:12', 'admin', '2019-05-21 20:08:19', 'admin', 4, 0);
INSERT INTO `menu` VALUES (116, 114, '处方审核', 'audit', '', 1, 'shenhe', 2, 'recommend/audit', 0, '2019-05-22 16:46:13', 'admin', '2019-08-23 10:56:35', 'admin', 2, 0);
INSERT INTO `menu` VALUES (118, 116, '查看详情', NULL, 'medication:recom:detail', 2, NULL, 1, NULL, 0, '2019-05-23 14:56:07', 'admin', '2019-06-21 13:32:26', 'admin', 0, 0);
INSERT INTO `menu` VALUES (119, 66, '备案审核(列表审核listAudit;详情审核recordAudit)', NULL, 'user:doctor:record,user:doctor:recordAudit', 2, NULL, 1, NULL, 0, '2019-05-23 14:58:25', 'admin', '2021-03-10 11:25:03', 'admin', 1, 0);
INSERT INTO `menu` VALUES (120, 66, '认证审核', NULL, 'user:doctor:audit,pharmacy:partner:warehouse:doctor:list,pharmacy:partner:warehouse:doctor:add,pharmacy:partner:warehouse:doctor:del,pharmacy:partner:doctor:product:list,pharmacy:partner:doctor:product:all,pharmacy:partner:search', 2, NULL, 1, NULL, 0, '2019-05-24 13:56:24', 'admin', '2019-11-22 16:21:26', 'admin', 0, 0);
INSERT INTO `menu` VALUES (122, -1, '商品信息', '/product', NULL, 0, 'product', 1, NULL, 0, '2019-06-11 10:54:49', 'admin', '2019-06-11 11:19:51', 'admin', 7, 0);
INSERT INTO `menu` VALUES (125, 122, '基础分类', 'base', '', 1, 'caidan', 1, 'product/base', 0, '2019-06-11 11:18:49', 'admin', '2019-08-23 10:52:31', 'admin', 0, 0);
INSERT INTO `menu` VALUES (126, 122, '商品列表', 'list', '', 1, 'shangpin', 2, 'product/list', 0, '2019-06-11 11:25:25', 'admin', '2019-08-23 10:53:05', 'admin', 0, 0);
INSERT INTO `menu` VALUES (127, 122, '新增药品', 'info', '', 1, NULL, 1, 'product/info', 1, '2019-06-12 15:06:59', 'admin', '2019-08-07 17:07:04', 'admin', 0, 0);
INSERT INTO `menu` VALUES (128, 122, '编辑资料', 'info/:productId', '', 1, NULL, 1, 'product/info', 1, '2019-06-13 10:37:21', 'admin', '2019-08-07 17:07:09', 'admin', 0, 0);
INSERT INTO `menu` VALUES (129, 122, 'SKU管理', 'sku/:productId', '', 1, NULL, 1, 'product/sku', 1, '2019-06-13 11:27:51', 'admin', '2019-08-07 17:06:20', 'admin', 0, 0);
INSERT INTO `menu` VALUES (130, 114, '审核开关', 'switch', '', 1, 'switch', 2, 'recommend/switch', 0, '2019-06-18 10:44:47', 'admin', '2020-03-11 11:46:46', 'admin', 0, 0);
INSERT INTO `menu` VALUES (131, 114, '处方审核信息', 'info/:id', NULL, 1, NULL, 1, 'recommend/info', 1, '2019-06-18 16:14:32', 'admin', '2020-05-09 17:34:43', 'admin', 0, 0);
INSERT INTO `menu` VALUES (132, 116, '审核操作', NULL, 'medication:recom:audit', 2, NULL, 1, NULL, 0, '2019-06-21 13:27:38', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (135, 130, '设置', NULL, 'medication:recom:audit:config:set', 2, NULL, 1, NULL, 0, '2019-06-21 13:36:06', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (139, -1, '药店管理', '/pharmacy', NULL, 0, 'mendian', 1, NULL, 0, '2019-07-01 14:42:29', 'admin', '2019-11-05 19:12:17', 'admin', 0, 0);
INSERT INTO `menu` VALUES (140, 139, '新增商家', 'add', '', 1, 'add', 1, 'pharmacy/add', 1, '2019-07-01 14:50:11', 'admin', '2019-08-13 16:14:38', 'admin', 0, 0);
INSERT INTO `menu` VALUES (141, 139, '合作商品', 'product/:warehouseId', '', 1, 'product', 2, 'pharmacy/product', 1, '2019-07-01 15:25:55', 'admin', '2019-08-07 17:13:24', 'admin', 0, 0);
INSERT INTO `menu` VALUES (142, 139, '商家信息详情', 'seller/:warehouseId', '', 1, 'jiaoseguanli', 3, 'pharmacy/seller', 1, '2019-07-01 15:27:39', 'admin', '2019-08-07 17:13:35', 'admin', 0, 0);
INSERT INTO `menu` VALUES (143, -1, '库存管理', '/stock', NULL, 0, 'chufangguanli', 6, NULL, 0, '2019-07-01 16:10:41', 'admin', '2019-07-01 16:20:42', 'admin', 0, 0);
INSERT INTO `menu` VALUES (144, 143, '库存查询', 'index', '', 1, 'chufangguanli', 1, 'stock/index', 0, '2019-07-01 16:14:37', 'admin', '2019-08-23 10:57:18', 'admin', 0, 0);
INSERT INTO `menu` VALUES (145, 139, '商家列表', 'list', '', 1, 'mendian', 1, 'pharmacy/list', 0, '2019-07-02 11:18:07', 'admin', '2019-08-23 10:54:34', 'admin', 0, 0);
INSERT INTO `menu` VALUES (146, 139, '商家信息维护', 'add/:warehouseId', '', 1, NULL, 1, 'pharmacy/add', 1, '2019-07-02 15:56:48', 'admin', '2019-08-07 17:02:03', 'admin', 0, 0);
INSERT INTO `menu` VALUES (147, 126, '编辑', NULL, 'wms:medicine:info,wms:medicine:update,wms:category:list', 2, NULL, 1, NULL, 0, '2019-07-03 17:58:02', 'admin', '2019-10-14 16:15:22', 'quanxian', 0, 0);
INSERT INTO `menu` VALUES (148, 145, '商家信息维护', NULL, 'pharmacy:partner:update', 2, NULL, 1, NULL, 0, '2019-07-03 18:00:16', 'admin', '2019-08-08 14:52:13', 'admin', 0, 0);
INSERT INTO `menu` VALUES (149, 145, '停用/启用', NULL, 'pharmacy:partner:update', 2, NULL, 1, NULL, 0, '2019-07-03 18:02:31', 'admin', '2019-08-08 13:07:10', 'admin', 0, 0);
INSERT INTO `menu` VALUES (150, 145, '商家信息查看', NULL, 'pharmacy:partner:list', 2, NULL, 1, NULL, 0, '2019-07-03 18:07:24', 'admin', '2019-08-08 13:08:34', 'admin', 0, 0);
INSERT INTO `menu` VALUES (151, 145, '合作商品维护', NULL, 'pharmacy:partner:update,wms:category:pharmacology:list,pharmacy:partner:list,pharmacy:partner:goods:list,pharmacy:partner:delete,pharmacy:partner:set,pharmacy:partner:price', 2, NULL, 1, NULL, 0, '2019-07-03 18:09:42', 'admin', '2020-07-16 13:26:03', 'admin', 0, 0);
INSERT INTO `menu` VALUES (152, 68, '订单审核', NULL, 'oms:order:audit', 2, NULL, 1, NULL, 0, '2019-07-15 17:09:34', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (153, 145, '账号管理', NULL, 'pharmacy:warehouse:manage', 2, NULL, 1, NULL, 0, '2019-07-15 17:13:18', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (156, 126, '管理SKU', NULL, 'wms:medicine:sku:list,wms:medicine:sku:update', 2, NULL, 1, NULL, 0, '2019-08-07 17:06:06', 'admin', '2019-08-07 17:06:24', 'admin', 0, 0);
INSERT INTO `menu` VALUES (157, 126, '新增', NULL, 'wms:medicine:info,wms:medicine:update,wms:category:list', 2, NULL, 1, NULL, 0, '2019-08-07 17:07:34', 'admin', '2019-10-14 16:15:29', 'quanxian', 0, 0);
INSERT INTO `menu` VALUES (160, 145, '新增', NULL, 'pharmacy:partner:save', 2, NULL, 1, NULL, 0, '2019-08-13 16:12:55', 'admin', '2019-08-13 16:14:03', 'admin', 0, 0);
INSERT INTO `menu` VALUES (161, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 1, NULL, 0, '2019-08-23 10:49:38', 'admin', '2019-08-23 10:49:49', 'admin', 0, 0);
INSERT INTO `menu` VALUES (162, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 1, NULL, 0, '2019-08-23 10:50:14', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (163, 31, '查看', NULL, 'sys:dept:list,sys:dept:info', 2, NULL, 1, NULL, 0, '2019-08-23 10:50:38', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (164, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 1, NULL, 0, '2019-08-23 10:51:20', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (166, 125, '查看', NULL, 'wms:category:pharmacology:list,wms:category:agents:list,wms:category:drug:list', 2, NULL, 1, NULL, 0, '2019-08-23 10:52:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (167, 126, '查看', NULL, 'wms:product:list', 2, NULL, 1, NULL, 0, '2019-08-23 10:52:56', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (168, 145, '查看', NULL, 'pharmacy:partner:list,pharmacy:partner:city:list', 2, NULL, 1, NULL, 0, '2019-08-23 10:53:52', 'admin', '2019-08-23 10:54:24', 'admin', 0, 0);
INSERT INTO `menu` VALUES (169, 68, '查看', NULL, 'oms:order:list,pharmacy:partner:city:list', 2, NULL, 1, NULL, 0, '2019-08-23 10:55:05', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (170, 66, '查看', NULL, 'user:doctor:list', 2, NULL, 1, NULL, 0, '2019-08-23 10:55:35', 'admin', '2019-10-14 14:00:14', 'quanxian', 0, 0);
INSERT INTO `menu` VALUES (171, 74, '查看', NULL, 'user:patient:list', 2, NULL, 1, NULL, 0, '2019-08-23 10:55:57', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (172, 116, '查看', NULL, 'medication:recom:list', 2, NULL, 1, NULL, 0, '2019-08-23 10:56:28', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (173, 144, '查看', NULL, 'inventory:list', 2, NULL, 1, NULL, 0, '2019-08-23 10:57:02', 'admin', '2019-08-23 10:57:14', 'admin', 0, 0);
INSERT INTO `menu` VALUES (174, 130, '查看', NULL, 'medication:recom:audit:config:list', 2, NULL, 1, NULL, 0, '2019-08-23 10:57:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (175, 65, '药师管理', 'pharmacist', 'user:pharmacis:list', 1, 'yisheng', 1, 'user/pharmacist', 0, '2019-09-06 11:00:05', 'admin', '2019-09-06 11:13:44', 'admin', 0, 0);
INSERT INTO `menu` VALUES (176, 66, '停用/启用', NULL, 'user:doctor:status', 2, NULL, 1, NULL, 0, '2019-09-17 13:47:41', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (177, 65, '医生编辑', 'doctoredit/:doctorId', NULL, 1, NULL, 1, 'user/doctoredit', 1, '2019-09-26 14:52:30', 'admin', '2019-09-26 15:35:19', 'admin', 0, 0);
INSERT INTO `menu` VALUES (178, 143, '库存流水', 'log', NULL, 1, 'gouwudingdan', 2, 'stock/log', 0, '2019-09-26 16:48:25', 'admin', '2019-09-26 17:00:28', 'admin', 0, 0);
INSERT INTO `menu` VALUES (179, -1, '退换管理', '/exchange', NULL, 0, 'tuihuo', 9, NULL, 0, '2019-09-26 17:06:22', 'admin', '2019-11-25 19:19:58', 'admin', 0, 0);
INSERT INTO `menu` VALUES (180, 179, '退换列表', 'goods/list', NULL, 1, 'tuihuanhuo', 1, 'exchange/list', 0, '2019-09-26 17:07:59', 'admin', '2019-09-27 11:10:05', 'admin', 0, 0);
INSERT INTO `menu` VALUES (181, 179, '退货详情', 'retreat/:orderId', NULL, 1, NULL, 2, 'exchange/retreat', 1, '2019-09-26 18:15:40', 'admin', '2019-10-12 11:27:03', 'admin', 0, 0);
INSERT INTO `menu` VALUES (182, 179, '换货详情', 'change/:orderId', NULL, 1, NULL, 1, 'exchange/change', 1, '2019-09-26 18:18:13', 'admin', '2019-10-12 15:02:14', 'admin', 0, 0);
INSERT INTO `menu` VALUES (183, 179, '补货详情', 'repair/:orderId', NULL, 1, NULL, 1, 'exchange/repair', 1, '2019-09-26 18:19:20', 'admin', '2019-10-12 15:50:19', 'admin', 0, 0);
INSERT INTO `menu` VALUES (184, 179, '新增退换货单', 'add', NULL, 1, NULL, 2, 'exchange/add', 1, '2019-09-27 10:02:17', 'admin', '2019-10-12 11:26:59', 'admin', 0, 0);
INSERT INTO `menu` VALUES (185, 179, '退款列表', 'refund/list', NULL, 1, 'tuikuan', 1, 'refund/list', 0, '2019-09-27 11:12:43', 'admin', '2019-09-27 11:14:31', 'admin', 0, 0);
INSERT INTO `menu` VALUES (186, 179, '修改退货单', 'editretreat/:orderId', NULL, 1, NULL, 1, 'exchange/editretreat', 1, '2019-10-09 14:12:53', 'admin', '2019-10-12 11:27:28', 'admin', 0, 0);
INSERT INTO `menu` VALUES (187, 179, '修改补寄单', 'editrepair/:orderId', NULL, 1, NULL, 1, 'exchange/editrepair', 1, '2019-10-09 15:23:28', 'admin', '2019-10-12 11:27:24', 'admin', 0, 0);
INSERT INTO `menu` VALUES (188, 179, '修改换货单', 'editchange/:orderId', NULL, 1, NULL, 1, 'exchange/editchange', 1, '2019-10-09 15:23:57', 'admin', '2019-10-12 11:27:20', 'admin', 0, 0);
INSERT INTO `menu` VALUES (189, 179, '退货单详情', 'retreat/:orderId', NULL, 1, NULL, 1, 'exchange/retreat', 1, '2019-10-09 15:57:54', 'admin', '2020-12-02 14:07:39', 'admin', 0, 0);
INSERT INTO `menu` VALUES (190, 179, '换货单详情', 'change/:orderId', NULL, 1, NULL, 1, 'exchange/change', 1, '2019-10-09 15:58:15', 'admin', '2020-12-02 14:07:46', 'admin', 0, 0);
INSERT INTO `menu` VALUES (191, 179, '补寄单详情', 'repair/:orderId', NULL, 1, NULL, 1, 'exchange/repair', 1, '2019-10-09 15:58:35', 'admin', '2020-12-02 14:07:50', 'admin', 0, 0);
INSERT INTO `menu` VALUES (192, 179, '退货单审核', 'verifyretreat/:orderId', NULL, 1, NULL, 1, 'exchange/verifyretreat', 1, '2019-10-09 16:09:55', 'admin', '2019-10-12 11:27:16', 'admin', 0, 0);
INSERT INTO `menu` VALUES (193, 179, '换货单审核', 'verifychange/:orderId', NULL, 1, NULL, 1, 'exchange/verifychange', 1, '2019-10-09 16:10:17', 'admin', '2019-10-12 11:27:11', 'admin', 0, 0);
INSERT INTO `menu` VALUES (194, 179, '补寄单审核', 'verifyrepair/:orderId', NULL, 1, NULL, 1, 'exchange/verifyrepair', 1, '2019-10-09 16:10:32', 'admin', '2019-10-12 11:27:08', 'admin', 0, 0);
INSERT INTO `menu` VALUES (197, 178, '查看', NULL, 'inventory:water:list', 2, NULL, 1, NULL, 0, '2019-10-12 13:48:52', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (198, 180, '查看', NULL, 'oms:return:order:list', 2, NULL, 1, NULL, 0, '2019-10-12 13:49:17', 'admin', '2019-10-14 14:04:30', 'quanxian', 0, 0);
INSERT INTO `menu` VALUES (199, 185, '查看', NULL, 'oms:refund:order:list', 2, NULL, 1, NULL, 0, '2019-10-12 13:49:27', 'admin', '2019-10-12 13:59:41', 'admin', 0, 0);
INSERT INTO `menu` VALUES (200, 185, '详情', NULL, 'oms:refund:order:detai,oms:refund:order:query', 2, NULL, 1, NULL, 0, '2019-10-12 13:50:25', 'admin', '2019-10-12 13:57:39', 'admin', 0, 0);
INSERT INTO `menu` VALUES (201, 185, '添加', NULL, 'oms:refund:order:update,oms:refund:order:query,oms:order:list', 2, NULL, 1, NULL, 0, '2019-10-12 13:50:44', 'admin', '2019-10-14 14:38:00', 'quanxian', 0, 0);
INSERT INTO `menu` VALUES (202, 185, '修改', NULL, 'oms:refund:order:update,oms:refund:order:query', 2, NULL, 1, NULL, 0, '2019-10-12 13:50:53', 'admin', '2019-10-12 13:57:51', 'admin', 0, 0);
INSERT INTO `menu` VALUES (203, 185, '删除', NULL, 'oms:refund:order:del', 2, NULL, 1, NULL, 0, '2019-10-12 13:51:05', 'admin', '2019-10-12 13:59:01', 'admin', 0, 0);
INSERT INTO `menu` VALUES (204, 185, '审核', NULL, 'oms:refund:order:audit', 2, NULL, 1, NULL, 0, '2019-10-12 13:51:18', 'admin', '2019-10-12 13:58:11', 'admin', 0, 0);
INSERT INTO `menu` VALUES (205, 185, '反审', NULL, 'oms:refund:order:reverse:audit', 2, NULL, 1, NULL, 0, '2019-10-12 13:51:35', 'admin', '2019-10-12 13:58:37', 'admin', 0, 0);
INSERT INTO `menu` VALUES (206, 185, '确认付款', NULL, 'oms:refund:order:pay', 2, NULL, 1, NULL, 0, '2019-10-12 13:51:47', 'admin', '2019-10-12 13:55:33', 'admin', 0, 0);
INSERT INTO `menu` VALUES (207, 185, '提交', NULL, 'oms:refund:order:submit', 2, NULL, 1, NULL, 0, '2019-10-12 13:52:01', 'admin', '2019-10-12 13:55:55', 'admin', 0, 0);
INSERT INTO `menu` VALUES (208, 185, '作废', NULL, 'oms:refund:order:invalid', 2, NULL, 1, NULL, 0, '2019-10-12 13:52:14', 'admin', '2019-10-12 13:56:47', 'admin', 0, 0);
INSERT INTO `menu` VALUES (209, 66, '编辑', NULL, 'user:doctor:list,user:doctor:department:list,user:doctor:city:list,user:doctor:update,user:doctor:hospital:list', 2, NULL, 1, NULL, 0, '2019-10-14 14:03:16', 'quanxian', '2019-10-14 16:17:29', 'quanxian', 0, 0);
INSERT INTO `menu` VALUES (210, 180, '详情', NULL, 'oms:return:order:detail', 2, NULL, 1, NULL, 0, '2019-10-14 14:08:53', 'quanxian', '2019-10-14 14:24:54', 'quanxian', 0, 0);
INSERT INTO `menu` VALUES (211, 180, '审核', NULL, 'oms:return:order:audit,oms:return:order:detail', 2, NULL, 1, NULL, 0, '2019-10-14 14:11:47', 'quanxian', '2019-10-14 14:25:15', 'quanxian', 0, 0);
INSERT INTO `menu` VALUES (212, 180, '添加', NULL, 'oms:return:order:save', 2, NULL, 1, NULL, 0, '2019-10-14 14:26:22', 'quanxian', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (213, 180, '修改', NULL, 'oms:return:order:save', 2, NULL, 1, NULL, 0, '2019-10-14 14:26:35', 'quanxian', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (214, 180, '反审', NULL, 'oms:return:order:reset', 2, NULL, 1, NULL, 0, '2019-10-14 14:27:54', 'quanxian', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (215, 180, '提交', NULL, 'oms:return:order:submit', 2, NULL, 1, NULL, 0, '2019-10-14 14:28:18', 'quanxian', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (216, 180, '作废', NULL, 'oms:return:order:invalid', 2, NULL, 1, NULL, 0, '2019-10-14 14:28:36', 'quanxian', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (217, 180, '确认收货', NULL, 'oms:return:order:confirm', 2, NULL, 1, NULL, 0, '2019-10-14 14:28:56', 'quanxian', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (218, 139, '关联医生管理', 'relationDoctor/:id', 'pharmacy:partner:doctor:list,pharmacy:partner:warehouse:doctor:del,pharmacy:partner:doctor:product:list', 1, 'mendian', 1, 'pharmacy/relationDoctor', 1, '2019-11-05 19:06:05', 'admin', '2019-11-22 16:15:40', 'admin', 0, 0);
INSERT INTO `menu` VALUES (222, 139, '财务信息', 'finance/:warehouseId', NULL, 1, NULL, 1, 'pharmacy/finance', 1, '2019-11-26 16:35:14', 'admin', '2019-12-16 10:41:12', 'admin', 0, 0);
INSERT INTO `menu` VALUES (224, 139, '分成方案', 'divide/:warehouseId', NULL, 1, NULL, 1, 'pharmacy/divide', 1, '2019-11-27 11:29:51', 'admin', '2019-12-16 10:41:07', 'admin', 0, 0);
INSERT INTO `menu` VALUES (229, 65, '完善医生备案信息', 'recordDr/:doctorId', NULL, 1, NULL, 1, 'user/recordDr', 1, '2020-02-18 16:17:43', 'admin', '2020-02-28 15:02:09', 'admin', 0, 0);
INSERT INTO `menu` VALUES (231, 65, '完善药师信息', 'recordPh/:pharmacistId', NULL, 1, NULL, 1, 'user/recordPh', 1, '2020-02-18 16:17:43', 'admin', '2020-02-28 15:08:21', 'admin', 0, 0);
INSERT INTO `menu` VALUES (232, 65, '药师信息', NULL, 'user:pharmacis:record', 2, NULL, 1, NULL, 0, '2020-02-28 15:09:50', 'admin', '2020-02-28 16:39:03', 'admin', 0, 0);
INSERT INTO `menu` VALUES (233, 175, '添加药师', NULL, 'user:pharmacist:add', 2, NULL, 1, NULL, 0, '2020-07-16 11:32:52', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (234, 175, '提交', NULL, 'user:pharmacist:edit', 2, NULL, 1, NULL, 0, '2020-07-16 11:44:49', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (235, -1, '专家名医', '/searchDoctor', NULL, 0, 'eye', 60, NULL, 0, '2020-08-05 11:24:32', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (236, 235, '专家列表', 'doctor', NULL, 1, 'eye', 1, 'searchDoctor/doctor', 0, '2020-08-25 17:16:17', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (237, 1, '客户端日志', 'appLog', 'user:applog:list', 1, 'log', 7, 'system/appLog', 0, '2021-03-04 16:13:11', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (239, -1, '院务公开管理', '/notice', NULL, 0, 'gongsi', 80, NULL, 0, '2021-03-09 18:45:43', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (240, 239, '院务公开管理', 'list', 'notice:message:list', 1, 'gongsi', 81, 'notice/list', 0, '2021-03-09 18:47:00', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (241, 240, '新增', NULL, 'notice:message:save', 2, NULL, 1, NULL, 0, '2021-03-09 18:48:35', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (242, 240, '修改', NULL, 'notice:message:update', 2, NULL, 1, NULL, 0, '2021-03-09 18:48:50', 'admin', NULL, NULL, 0, 0);
INSERT INTO `menu` VALUES (243, 240, '删除', NULL, 'notice:message:delete', 2, NULL, 1, NULL, 0, '2021-03-11 13:21:39', 'admin', NULL, NULL, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `changed_at` datetime DEFAULT NULL COMMENT '修改时间',
  `changed_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '是否删除 0：正常 1：删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'admin', '超级管理员', 1, '2018-04-12 13:38:08', 'system', '2021-03-11 13:22:23', 'admin', 5, 0);
INSERT INTO `role` VALUES (7, '处方审核药师', NULL, 9, '2019-10-10 15:14:44', 'admin', '2020-07-01 10:44:56', 'admin', 0, 0);
INSERT INTO `role` VALUES (11, '管理员', NULL, 9, '2019-12-05 17:03:08', 'admin', '2020-07-16 11:45:33', 'admin', 0, 0);
INSERT INTO `role` VALUES (12, '演示', NULL, 9, '2020-06-19 14:51:29', 'admin', '2020-07-16 11:45:44', 'admin', 0, 0);
INSERT INTO `role` VALUES (13, '体验账号', NULL, 9, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role` VALUES (14, '药品管理员', NULL, 10, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for role_dept
-- ----------------------------
DROP TABLE IF EXISTS `role_dept`;
CREATE TABLE `role_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `changed_at` datetime DEFAULT NULL COMMENT '修改时间',
  `changed_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '是否删除 0：正常 1：删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of role_dept
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `changed_at` datetime DEFAULT NULL COMMENT '修改时间',
  `changed_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '是否删除 0：正常 1：删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`,`menu_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2331 DEFAULT CHARSET=utf8mb3 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of role_menu
-- ----------------------------
BEGIN;
INSERT INTO `role_menu` VALUES (1121, 7, 114, '2020-07-01 10:44:56', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1122, 7, 116, '2020-07-01 10:44:56', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1123, 7, 118, '2020-07-01 10:44:56', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1124, 7, 132, '2020-07-01 10:44:56', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1125, 7, 172, '2020-07-01 10:44:56', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1501, 11, 166, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1502, 11, 147, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1503, 11, 156, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1504, 11, 157, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1505, 11, 167, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1506, 11, 148, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1507, 11, 149, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1508, 11, 150, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1509, 11, 151, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1510, 11, 153, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1511, 11, 160, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1512, 11, 168, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1513, 11, 87, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1514, 11, 105, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1515, 11, 152, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1516, 11, 169, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1517, 11, 119, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1518, 11, 120, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1519, 11, 170, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1520, 11, 176, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1521, 11, 209, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1523, 11, 171, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1524, 11, 233, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1525, 11, 234, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1526, 11, 232, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1527, 11, 118, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1528, 11, 132, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1529, 11, 172, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1530, 11, 135, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1531, 11, 174, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1532, 11, 173, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1533, 11, 197, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1534, 11, 198, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1535, 11, 210, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1536, 11, 211, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1537, 11, 212, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1538, 11, 213, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1539, 11, 214, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1540, 11, 215, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1541, 11, 216, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1542, 11, 217, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1543, 11, 199, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1544, 11, 200, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1545, 11, 201, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1546, 11, 202, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1547, 11, 203, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1548, 11, 204, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1549, 11, 205, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1550, 11, 206, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1551, 11, 207, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1552, 11, 208, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1553, 11, 122, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1554, 11, 125, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1555, 11, 126, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1556, 11, 139, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1557, 11, 145, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1558, 11, 64, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1559, 11, 68, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1560, 11, 65, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1561, 11, 66, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1562, 11, 74, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1563, 11, 175, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1564, 11, 114, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1565, 11, 116, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1566, 11, 130, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1567, 11, 143, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1568, 11, 144, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1569, 11, 178, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1570, 11, 179, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1571, 11, 180, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1572, 11, 185, '2020-07-16 11:45:33', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1573, 12, 166, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1574, 12, 147, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1575, 12, 156, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1576, 12, 157, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1577, 12, 167, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1578, 12, 148, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1579, 12, 149, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1580, 12, 150, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1581, 12, 151, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1582, 12, 153, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1583, 12, 160, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1584, 12, 168, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1585, 12, 87, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1586, 12, 105, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1587, 12, 152, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1588, 12, 169, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1589, 12, 119, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1590, 12, 120, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1591, 12, 170, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1592, 12, 176, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1593, 12, 209, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1595, 12, 171, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1596, 12, 233, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1597, 12, 234, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1598, 12, 232, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1599, 12, 118, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1600, 12, 172, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1601, 12, 173, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1602, 12, 197, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1603, 12, 198, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1604, 12, 210, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1605, 12, 211, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1606, 12, 212, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1607, 12, 213, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1608, 12, 214, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1609, 12, 215, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1610, 12, 216, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1611, 12, 217, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1612, 12, 199, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1613, 12, 200, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1614, 12, 201, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1615, 12, 202, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1616, 12, 203, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1617, 12, 204, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1618, 12, 205, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1619, 12, 206, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1620, 12, 207, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1621, 12, 208, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1622, 12, 122, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1623, 12, 125, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1624, 12, 126, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1625, 12, 139, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1626, 12, 145, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1627, 12, 64, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1628, 12, 68, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1629, 12, 65, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1630, 12, 66, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1631, 12, 74, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1632, 12, 175, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1633, 12, 114, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1634, 12, 116, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1635, 12, 143, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1636, 12, 144, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1637, 12, 178, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1638, 12, 179, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1639, 12, 180, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1640, 12, 185, '2020-07-16 11:45:44', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1736, 13, 166, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1737, 13, 147, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1738, 13, 156, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1739, 13, 157, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1740, 13, 167, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1741, 13, 148, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1742, 13, 149, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1743, 13, 150, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1744, 13, 151, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1745, 13, 153, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1746, 13, 160, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1747, 13, 168, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1748, 13, 87, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1749, 13, 105, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1750, 13, 152, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1751, 13, 169, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1752, 13, 119, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1753, 13, 120, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1754, 13, 170, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1755, 13, 176, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1756, 13, 209, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1758, 13, 171, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1759, 13, 233, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1760, 13, 234, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1761, 13, 232, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1762, 13, 118, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1763, 13, 132, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1764, 13, 172, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1765, 13, 135, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1766, 13, 174, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1767, 13, 173, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1768, 13, 197, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1769, 13, 198, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1770, 13, 210, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1771, 13, 211, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1772, 13, 212, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1773, 13, 213, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1774, 13, 214, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1775, 13, 215, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1776, 13, 216, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1777, 13, 217, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1778, 13, 199, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1779, 13, 200, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1780, 13, 201, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1781, 13, 202, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1782, 13, 203, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1783, 13, 204, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1784, 13, 205, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1785, 13, 206, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1786, 13, 207, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1787, 13, 208, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1788, 13, 122, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1789, 13, 125, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1790, 13, 126, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1791, 13, 139, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1792, 13, 145, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1793, 13, 64, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1794, 13, 68, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1795, 13, 65, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1796, 13, 66, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1797, 13, 74, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1798, 13, 175, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1799, 13, 114, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1800, 13, 116, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1801, 13, 130, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1802, 13, 143, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1803, 13, 144, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1804, 13, 178, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1805, 13, 179, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1806, 13, 180, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1807, 13, 185, '2020-07-21 16:56:40', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1808, 14, 166, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1809, 14, 147, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1810, 14, 156, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1811, 14, 157, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1812, 14, 167, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1813, 14, 148, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1814, 14, 149, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1815, 14, 150, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1816, 14, 151, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1817, 14, 153, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1818, 14, 160, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1819, 14, 168, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1820, 14, 173, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1821, 14, 197, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1822, 14, 122, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1823, 14, 125, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1824, 14, 126, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1825, 14, 139, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1826, 14, 145, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1827, 14, 143, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1828, 14, 144, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (1829, 14, 178, '2020-12-01 20:00:51', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2229, 1, 16, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2230, 1, 17, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2231, 1, 18, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2232, 1, 86, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2233, 1, 161, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2234, 1, 20, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2235, 1, 21, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2236, 1, 22, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2237, 1, 162, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2238, 1, 33, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2239, 1, 34, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2240, 1, 35, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2241, 1, 163, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2242, 1, 24, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2243, 1, 25, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2244, 1, 26, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2245, 1, 164, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2246, 1, 29, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2247, 1, 237, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2248, 1, 166, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2249, 1, 147, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2250, 1, 156, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2251, 1, 157, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2252, 1, 167, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2253, 1, 148, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2254, 1, 149, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2255, 1, 150, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2256, 1, 151, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2257, 1, 153, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2258, 1, 160, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2259, 1, 168, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2260, 1, 87, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2261, 1, 105, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2262, 1, 152, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2263, 1, 169, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2264, 1, 119, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2265, 1, 120, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2266, 1, 170, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2267, 1, 176, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2268, 1, 209, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2269, 1, 171, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2270, 1, 233, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2271, 1, 234, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2272, 1, 232, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2273, 1, 118, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2274, 1, 132, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2275, 1, 172, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2276, 1, 135, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2277, 1, 174, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2278, 1, 173, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2279, 1, 197, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2280, 1, 198, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2281, 1, 210, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2282, 1, 211, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2283, 1, 212, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2284, 1, 213, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2285, 1, 214, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2286, 1, 215, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2287, 1, 216, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2288, 1, 217, '2021-03-11 13:22:23', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2289, 1, 199, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2290, 1, 200, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2291, 1, 201, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2292, 1, 202, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2293, 1, 203, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2294, 1, 204, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2295, 1, 205, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2296, 1, 206, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2297, 1, 207, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2298, 1, 208, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2299, 1, 236, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2300, 1, 241, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2301, 1, 242, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2302, 1, 243, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2303, 1, 1, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2304, 1, 2, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2305, 1, 3, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2306, 1, 31, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2307, 1, 4, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2308, 1, 122, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2309, 1, 125, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2310, 1, 126, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2311, 1, 139, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2312, 1, 145, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2313, 1, 64, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2314, 1, 68, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2315, 1, 65, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2316, 1, 66, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2317, 1, 74, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2318, 1, 175, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2319, 1, 114, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2320, 1, 116, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2321, 1, 130, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2322, 1, 143, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2323, 1, 144, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2324, 1, 178, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2325, 1, 179, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2326, 1, 180, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2327, 1, 185, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2328, 1, 235, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2329, 1, 239, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
INSERT INTO `role_menu` VALUES (2330, 1, 240, '2021-03-11 13:22:24', 'admin', NULL, NULL, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `changed_at` datetime DEFAULT NULL COMMENT '修改时间',
  `changed_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '是否删除 0：正常 1：删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户真实姓名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `last_password_reset_date` datetime NOT NULL COMMENT '上次密码更新时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `changed_at` datetime DEFAULT NULL COMMENT '修改时间',
  `changed_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '是否删除 0：正常 1：删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='系统用户';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'admin', '管理员', '$2a$10$ayQexRYfpWjK8q1DBTI/p.TXPxG8QtQoHr65j1D/.1AYcNHmtKwHe', NULL, 'admin@test.com', '13651232001', 1, 1, '2020-05-09 17:07:24', '2018-04-12 13:36:54', 'system', '2020-05-09 17:07:24', 'admin', 44, 0);
INSERT INTO `user` VALUES (2, 'superadmin', 'superadmin', '$2a$10$3aG7NkxQJKaPDy3ufM3M0uZC5U9UOB7gAiXfkL6wXTKwN6yzwjWSu', NULL, 'superadmin@example.com', '13651232001', 1, 1, '2021-03-08 17:19:36', '2021-03-08 17:19:36', 'admin', '2021-03-08 17:19:53', 'admin', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `changed_at` datetime DEFAULT NULL COMMENT '修改时间',
  `changed_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '是否删除 0：正常 1：删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`,`role_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` VALUES (1, 1, 1, '2019-11-05 19:13:01', 'admin', NULL, NULL, 0, 0);
INSERT INTO `user_role` VALUES (3, 2, 1, '2021-03-08 17:19:53', 'admin', NULL, NULL, 0, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
