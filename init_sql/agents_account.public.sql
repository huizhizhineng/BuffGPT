/*
 Navicat Premium Dump SQL

 Source Server         : buffgpt_pg_prod
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 118.31.113.98:17506
 Source Catalog        : agents_account
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 16/06/2025 17:28:12
*/


-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dept";
CREATE TABLE "public"."sys_dept" (
  "dept_id" int8 NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "sort_order" int4 NOT NULL DEFAULT 0,
  "parent_id" int8,
  "tenant_id" int8,
  "productline" int8,
  "create_by" int8 NOT NULL,
  "update_by" int8 NOT NULL,
  "create_by_productline" int8 NOT NULL,
  "update_by_productline" int8 NOT NULL,
  "create_time" timestamp(6),
  "update_time" timestamp(6),
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar
)
;
COMMENT ON COLUMN "public"."sys_dept"."dept_id" IS '部门ID';
COMMENT ON COLUMN "public"."sys_dept"."name" IS '部门名称';
COMMENT ON COLUMN "public"."sys_dept"."sort_order" IS '排序';
COMMENT ON COLUMN "public"."sys_dept"."parent_id" IS '父级部门ID';
COMMENT ON COLUMN "public"."sys_dept"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."sys_dept"."productline" IS '产品线';
COMMENT ON COLUMN "public"."sys_dept"."create_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_dept"."update_by" IS '修改人';
COMMENT ON COLUMN "public"."sys_dept"."create_by_productline" IS '创建人产品线';
COMMENT ON COLUMN "public"."sys_dept"."update_by_productline" IS '修改人产品线';
COMMENT ON COLUMN "public"."sys_dept"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dept"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_dept"."del_flag" IS '删除标志';
COMMENT ON TABLE "public"."sys_dept" IS '部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO "public"."sys_dept" ("dept_id", "name", "sort_order", "parent_id", "tenant_id", "productline", "create_by", "update_by", "create_by_productline", "update_by_productline", "create_time", "update_time", "del_flag") VALUES (1872885596332408833, '总经办', 1, 0, 1, 100001, 1, 1, 100001, 100001, '2024-12-28 14:01:37', '2025-06-17 19:46:22.015975', '0');
INSERT INTO "public"."sys_dept" ("dept_id", "name", "sort_order", "parent_id", "tenant_id", "productline", "create_by", "update_by", "create_by_productline", "update_by_productline", "create_time", "update_time", "del_flag") VALUES (1872885818550829058, '办公室', 0, 1872885596332408833, 1, 100001, 1, 1, 100001, 100001, '2024-12-28 14:02:30', '2025-06-17 19:46:33.035457', '0');
INSERT INTO "public"."sys_dept" ("dept_id", "name", "sort_order", "parent_id", "tenant_id", "productline", "create_by", "update_by", "create_by_productline", "update_by_productline", "create_time", "update_time", "del_flag") VALUES (1872885858560294914, '技术部', 0, 1872885596332408833, 1, 100001, 1, 1, 100001, 100001, '2024-12-28 14:02:40', '2025-06-17 19:46:54.154692', '0');
INSERT INTO "public"."sys_dept" ("dept_id", "name", "sort_order", "parent_id", "tenant_id", "productline", "create_by", "update_by", "create_by_productline", "update_by_productline", "create_time", "update_time", "del_flag") VALUES (1872885901304446977, '后勤组', 0, 1872885818550829058, 1, 100001, 1, 1, 100001, 100001, '2024-12-28 14:02:50', '2025-06-17 19:47:07.812504', '0');
INSERT INTO "public"."sys_dept" ("dept_id", "name", "sort_order", "parent_id", "tenant_id", "productline", "create_by", "update_by", "create_by_productline", "update_by_productline", "create_time", "update_time", "del_flag") VALUES (1872885924696080386, '产品组', 0, 1872885858560294914, 1, 100001, 1, 1, 100001, 100001, '2024-12-28 14:02:56', '2025-06-17 19:47:18.937489', '0');


-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "menu_id" int8 NOT NULL,
  "name" varchar(32) COLLATE "pg_catalog"."default",
  "permission" varchar(32) COLLATE "pg_catalog"."default",
  "path" varchar(128) COLLATE "pg_catalog"."default",
  "parent_id" int8,
  "tenant_id" int8,
  "productline" int8,
  "icon" varchar(64) COLLATE "pg_catalog"."default",
  "sort_order" int4 DEFAULT 1,
  "menu_type" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" int8 NOT NULL,
  "update_by" int8 NOT NULL,
  "create_by_productline" int8 NOT NULL,
  "update_by_productline" int8 NOT NULL,
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6),
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar
)
;
COMMENT ON COLUMN "public"."sys_menu"."menu_id" IS '菜单ID';
COMMENT ON COLUMN "public"."sys_menu"."name" IS '菜单名称';
COMMENT ON COLUMN "public"."sys_menu"."permission" IS '权限标识';
COMMENT ON COLUMN "public"."sys_menu"."path" IS '路由路径';
COMMENT ON COLUMN "public"."sys_menu"."parent_id" IS '父菜单ID';
COMMENT ON COLUMN "public"."sys_menu"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."sys_menu"."productline" IS '产品线';
COMMENT ON COLUMN "public"."sys_menu"."icon" IS '菜单图标';
COMMENT ON COLUMN "public"."sys_menu"."sort_order" IS '排序值，越小越靠前';
COMMENT ON COLUMN "public"."sys_menu"."menu_type" IS '菜单类型，0目录，1菜单，2按钮';
COMMENT ON COLUMN "public"."sys_menu"."create_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_menu"."update_by" IS '修改人';
COMMENT ON COLUMN "public"."sys_menu"."create_by_productline" IS '创建人产品线';
COMMENT ON COLUMN "public"."sys_menu"."update_by_productline" IS '修改人产品线';
COMMENT ON COLUMN "public"."sys_menu"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_menu"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_menu"."del_flag" IS '删除标志，0未删除，1已删除';
COMMENT ON TABLE "public"."sys_menu" IS '菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO "public"."sys_menu" VALUES (2, '添加菜单', 'sys_menu_add', '', 1, 1, 100001, NULL, 1, '1', 1, 1, 100001, 100001, '2024-12-26 19:11:04', '2024-12-31 15:35:56', '0');
INSERT INTO "public"."sys_menu" VALUES (1872568955711180801, '系统管理', NULL, '/systemMange', -1, NULL, 100001, '', 2, '0', 1, 1, 100001, 100001, '2024-12-27 17:03:24', '2024-12-28 13:50:26', '0');
INSERT INTO "public"."sys_menu" VALUES (1872573428340834305, '111', NULL, '11111', 1872569676904976386, NULL, 100001, NULL, 999, '0', 1, 1, 100001, 100001, '2024-12-27 17:21:11', '2024-12-27 17:21:11', '0');
INSERT INTO "public"."sys_menu" VALUES (1872576077488422914, '角色管理', NULL, '/systemMange/role', 1872568955711180801, NULL, 100001, NULL, 3, '0', 1, 1, 100001, 100001, '2024-12-27 17:31:42', '2024-12-27 17:31:42', '0');
INSERT INTO "public"."sys_menu" VALUES (1872879914547888130, '部门管理', NULL, '/systemMange/dept', 1872568955711180801, NULL, 100001, NULL, 4, '0', 1, 1, 100001, 100001, '2024-12-28 13:39:03', '2024-12-28 13:39:03', '0');
INSERT INTO "public"."sys_menu" VALUES (1872894115064496130, 'B端菜单管理', NULL, '/systemMange/productLineMenu', 1872568955711180801, NULL, 100001, '', 5, '0', 1, 1, 100001, 100001, '2024-12-28 14:35:28', '2024-12-28 14:48:17', '0');
INSERT INTO "public"."sys_menu" VALUES (1873998860311273473, '编辑菜单', 'sys_menu_edit', NULL, 1, NULL, 100001, NULL, 999, '1', 1, 1, 100001, 100001, '2024-12-31 15:45:20', '2024-12-31 15:45:20', '0');
INSERT INTO "public"."sys_menu" VALUES (1874001295230574594, '新增', 'sys_systenant_add', NULL, 1872894115064496130, NULL, 100001, '', 1, '1', 1, 1, 100001, 100001, '2024-12-31 15:55:01', '2025-01-04 13:48:11', '0');
INSERT INTO "public"."sys_menu" VALUES (1874029088408543234, '新增', 'sys_user_add', NULL, 1872575879160758273, NULL, 100001, NULL, 1, '1', 1, 1, 100001, 100001, '2024-12-31 17:45:27', '2024-12-31 17:45:27', '0');
INSERT INTO "public"."sys_menu" VALUES (1874029244860276737, '编辑', 'sys_user_edit', NULL, 1872575879160758273, NULL, 100001, NULL, 2, '1', 1, 1, 100001, 100001, '2024-12-31 17:46:04', '2024-12-31 17:46:04', '0');
INSERT INTO "public"."sys_menu" VALUES (1874029332986798082, '删除', 'sys_user_del', NULL, 1872575879160758273, NULL, 100001, NULL, 3, '1', 1, 1, 100001, 100001, '2024-12-31 17:46:25', '2024-12-31 17:46:25', '0');
INSERT INTO "public"."sys_menu" VALUES (1874029605679472642, '新增', 'sys_role_add', NULL, 1872576077488422914, NULL, 100001, NULL, 1, '1', 1, 1, 100001, 100001, '2024-12-31 17:47:30', '2024-12-31 17:47:30', '0');
INSERT INTO "public"."sys_menu" VALUES (1874029692438650881, '编辑', 'sys_role_edit', NULL, 1872576077488422914, NULL, 100001, NULL, 2, '1', 1, 1, 100001, 100001, '2024-12-31 17:47:51', '2024-12-31 17:47:51', '0');
INSERT INTO "public"."sys_menu" VALUES (1874029776509280257, '删除', 'sys_role_del', NULL, 1872576077488422914, NULL, 100001, NULL, 3, '1', 1, 1, 100001, 100001, '2024-12-31 17:48:11', '2024-12-31 17:48:11', '0');
INSERT INTO "public"."sys_menu" VALUES (1874030050795790338, '新增', 'sys_dept_add', NULL, 1872879914547888130, NULL, 100001, NULL, 1, '1', 1, 1, 100001, 100001, '2024-12-31 17:49:17', '2024-12-31 17:49:17', '0');
INSERT INTO "public"."sys_menu" VALUES (1874030131905241089, '编辑', 'sys_dept_edit', NULL, 1872879914547888130, NULL, 100001, NULL, 2, '1', 1, 1, 100001, 100001, '2024-12-31 17:49:36', '2024-12-31 17:49:36', '0');
INSERT INTO "public"."sys_menu" VALUES (1874030208606478337, '删除', 'sys_dept_del', NULL, 1872879914547888130, NULL, 100001, NULL, 3, '1', 1, 1, 100001, 100001, '2024-12-31 17:49:54', '2024-12-31 17:49:54', '0');
INSERT INTO "public"."sys_menu" VALUES (1874030464446439426, '编辑', 'sys_systenant_edit', NULL, 1872894115064496130, NULL, 100001, '', 2, '1', 1, 1, 100001, 100001, '2024-12-31 17:50:55', '2025-01-04 13:47:49', '0');
INSERT INTO "public"."sys_menu" VALUES (1874030524743753729, '删除', 'sys_systenant_edit', NULL, 1872894115064496130, NULL, 100001, '', 3, '1', 1, 1, 100001, 100001, '2024-12-31 17:51:10', '2025-01-04 13:47:58', '0');
INSERT INTO "public"."sys_menu" VALUES (1874786508328075265, '系统管理', NULL, '/systemMange', -1, NULL, 100002, NULL, 3, '0', 1, 1, 100001, 100001, '2025-01-02 19:55:10', '2025-01-02 19:55:10', '0');
INSERT INTO "public"."sys_menu" VALUES (1875000969332703233, '模型管理', NULL, '/modelManage', -1, NULL, 100001, '', 3, '0', 1, 1, 100001, 100001, '2025-01-03 10:07:22', '2025-01-04 13:48:28', '0');
INSERT INTO "public"."sys_menu" VALUES (1875001160584577026, '模型管理', NULL, '/modelManage/index', 1875000969332703233, NULL, 100001, NULL, 999, '0', 1, 1, 100001, 100001, '2025-01-03 10:08:07', '2025-01-03 10:08:07', '0');
INSERT INTO "public"."sys_menu" VALUES (1875002128516694017, '供应商管理', NULL, '/supplier', -1, NULL, 100001, NULL, 4, '0', 1, 1, 100001, 100001, '2025-01-03 10:11:58', '2025-01-03 10:11:58', '0');
INSERT INTO "public"."sys_menu" VALUES (1875002232317329410, '供应商管理', NULL, '/supplier/index', 1875002128516694017, NULL, 100001, NULL, 1, '0', 1, 1, 100001, 100001, '2025-01-03 10:12:23', '2025-01-03 10:12:23', '0');
INSERT INTO "public"."sys_menu" VALUES (1875108670465294338, '提示词管理', NULL, '/promptManage', -1, NULL, 100001, '', 5, '0', 1, 1, 100001, 100001, '2025-01-03 17:15:20', '2025-01-03 17:15:32', '0');
INSERT INTO "public"."sys_menu" VALUES (1875108884588707842, '提示词管理', NULL, '/promptManage/index', 1875108670465294338, NULL, 100001, NULL, 1, '0', 1, 1, 100001, 100001, '2025-01-03 17:16:11', '2025-01-03 17:16:11', '0');
INSERT INTO "public"."sys_menu" VALUES (1875388325046910978, '中心广场', NULL, '/center', -1, NULL, 100002, NULL, 1, '0', 1, 1, 100001, 100001, '2025-01-04 11:46:34', '2025-01-04 11:46:34', '0');
INSERT INTO "public"."sys_menu" VALUES (1872575879160758273, '管理员管理', NULL, '/systemMange/user', 1872568955711180801, NULL, 100001, '', 2, '0', 1, 1902615993494327297, 100001, 100001, '2024-12-27 17:30:55', '2025-05-09 11:29:40.571937', '0');
INSERT INTO "public"."sys_menu" VALUES (1874786815854444546, '角色管理', NULL, '/systemMange/role', 1874786508328075265, NULL, 100002, 'icon-yidongyunkongzhitaiicon45', 2, '0', 1, 1902615993494327297, 100001, 100001, '2025-01-02 19:56:23', '2025-04-21 20:01:58.376633', '0');
INSERT INTO "public"."sys_menu" VALUES (1874786878320214017, '成员管理', NULL, '/systemMange/user', 1874786508328075265, NULL, 100002, 'icon-yonghuguanli', 1, '0', 1, 1902615993494327297, 100001, 100001, '2025-01-02 19:56:38', '2025-04-21 20:01:44.754794', '0');
INSERT INTO "public"."sys_menu" VALUES (1874786746468073474, '团队空间管理', NULL, '/systemMange/bizSpace', 1874786508328075265, NULL, 100002, 'icon-bumenguanli', 3, '0', 1, 1902615993494327297, 100001, 100001, '2025-01-02 19:56:07', '2025-04-21 20:02:03.778565', '0');
INSERT INTO "public"."sys_menu" VALUES (1875388482333310977, '模型广场', NULL, '/center/modal/index', 1875388325046910978, NULL, 100002, 'icon-moxingguangchang', 1, '0', 1, 1, 100001, 100001, '2025-01-04 11:47:12', '2025-01-08 11:26:22', '0');
INSERT INTO "public"."sys_menu" VALUES (1875389350759759874, '个人空间', NULL, '/personalSpace', -1, NULL, 100002, NULL, 2, '0', 1, 1, 100001, 100001, '2025-01-04 11:50:39', '2025-01-04 11:50:39', '0');
INSERT INTO "public"."sys_menu" VALUES (1875418165313667073, '删除', 'sys_menu_del', NULL, 1, NULL, 100001, NULL, 3, '1', 1, 1, 100001, 100001, '2025-01-04 13:45:09', '2025-01-04 13:45:09', '0');
INSERT INTO "public"."sys_menu" VALUES (1875419353216057346, '新增', 'sys_menu_add', NULL, 1874786660396761089, NULL, 100001, NULL, 1, '1', 1873680988213026817, 1873680988213026817, 100002, 100002, '2025-01-04 13:49:52', '2025-01-04 13:49:52', '0');
INSERT INTO "public"."sys_menu" VALUES (1876504121502748673, '插件管理', NULL, '/pluginManage', -1, NULL, 100001, '', 6, '0', 1, 1, 100001, 100001, '2025-01-07 13:40:21', '2025-01-07 13:41:22', '0');
INSERT INTO "public"."sys_menu" VALUES (1876504330437808130, '插件管理', NULL, '/pluginManage/index', 1876504121502748673, NULL, 100001, '', 1, '0', 1, 1, 100001, 100001, '2025-01-07 13:41:11', '2025-01-07 13:41:40', '0');
INSERT INTO "public"."sys_menu" VALUES (1880075473866354689, '商业授权管理', NULL, '/businessAuthManage', -1, NULL, 100001, '', 7, '0', 1, 1, 100001, 100001, '2025-01-17 10:11:38', '2025-01-17 10:12:01', '0');
INSERT INTO "public"."sys_menu" VALUES (1880076403844214785, '商业授权管理', NULL, '/businessAuthManage/index', 1880075473866354689, NULL, 100001, '', 1, '0', 1, 1, 100001, 100001, '2025-01-17 10:15:19', '2025-01-17 10:15:33', '0');
INSERT INTO "public"."sys_menu" VALUES (1889921529697832962, '应用管理', NULL, '/applicationManage', -1, NULL, 100001, '', 8, '0', 1, 1, 100001, 100001, '2025-02-13 14:16:20', '2025-02-13 14:16:45', '0');
INSERT INTO "public"."sys_menu" VALUES (1889921896871399425, '应用管理', NULL, '/applicationManage/index', 1889921529697832962, NULL, 100001, '', 1, '0', 1, 1, 100001, 100001, '2025-02-13 14:17:48', '2025-02-13 14:18:17', '0');
INSERT INTO "public"."sys_menu" VALUES (1898985571512930305, '新增', 'sys_tenant_add', NULL, 1898984830039674882, NULL, 100001, NULL, 999, '1', 1, 1, 100001, 100001, '2025-03-10 14:33:36.352458', '2025-03-10 14:33:36.352458', '0');
INSERT INTO "public"."sys_menu" VALUES (1875418418486050817, '更新角色菜单(权限)', 'sys_role_menu_update', NULL, 1872576077488422914, NULL, 100001, '', 4, '1', 1, 1, 100001, 100001, '2025-01-04 13:46:09', '2025-03-10 14:56:52.796977', '0');
INSERT INTO "public"."sys_menu" VALUES (1, '菜单管理', NULL, '/systemMange/menu', 1872568955711180801, 1, 100001, '', 1, '0', 1, 1, 100001, 100001, '2024-12-26 17:50:52', '2025-03-20 13:57:07.875076', '0');
INSERT INTO "public"."sys_menu" VALUES (1910306518026387457, '数据库管理', NULL, '/personalSpace/databaseManage/index', 1875389350759759874, NULL, 100002, 'icon-shujukuguanli', 9, '0', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-10 20:19:00.334346', '2025-04-21 19:57:49.320028', '0');
INSERT INTO "public"."sys_menu" VALUES (1877356001192660994, 'Prompt模版发布管理', NULL, '/personalSpace/promptPublishManage/index', 1875389350759759874, NULL, 100002, 'icon-xiaoxizhongxin', 6, '0', 1, 1902615993494327297, 100001, 100001, '2025-01-09 22:05:25', '2025-04-21 19:57:24.478953', '0');
INSERT INTO "public"."sys_menu" VALUES (1889492588617068545, '应用广场', NULL, '/center/agent/index', 1875388325046910978, NULL, 100002, 'icon-a-Frame1', 2, '0', 1, 1902615993494327297, 100001, 100001, '2025-02-12 09:51:53', '2025-04-21 19:58:27.274613', '0');
INSERT INTO "public"."sys_menu" VALUES (1876460877645500418, 'Prompt模版广场', NULL, '/center/prompt/index', 1875388325046910978, NULL, 100002, 'icon-promptmobanguangchang', 4, '0', 1, 1902615993494327297, 100001, 100001, '2025-01-07 10:48:31', '2025-03-28 10:46:10.907564', '0');
INSERT INTO "public"."sys_menu" VALUES (1914275841324740609, 'B端用户管理', NULL, '/userMange/index', 1914275764287959042, NULL, 100001, '', 999, '0', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-21 19:11:40.754601', '2025-04-21 19:11:52.646298', '0');
INSERT INTO "public"."sys_menu" VALUES (1914276179213676545, '新增', 'sys_bizSpace_add', NULL, 1874786746468073474, NULL, 100002, NULL, 1, '1', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-21 19:13:01.313643', '2025-04-21 19:13:01.313643', '0');
INSERT INTO "public"."sys_menu" VALUES (1914276327520071682, '修改', 'sys_bizSpace_edit', NULL, 1874786746468073474, NULL, 100002, NULL, 2, '1', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-21 19:13:36.672652', '2025-04-21 19:13:36.672652', '0');
INSERT INTO "public"."sys_menu" VALUES (1914276445942050818, '删除', 'sys_bizSpace_del', NULL, 1874786746468073474, NULL, 100002, NULL, 3, '1', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-21 19:14:04.90644', '2025-04-21 19:14:04.90644', '0');
INSERT INTO "public"."sys_menu" VALUES (1914276566498930690, '新增', 'sys_role_add', NULL, 1874786815854444546, NULL, 100002, NULL, 1, '1', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-21 19:14:33.649582', '2025-04-21 19:14:33.649582', '0');
INSERT INTO "public"."sys_menu" VALUES (1914276689798885377, '修改', 'sys_role_edit', NULL, 1874786815854444546, NULL, 100002, NULL, 2, '1', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-21 19:15:03.046796', '2025-04-21 19:15:03.046796', '0');
INSERT INTO "public"."sys_menu" VALUES (1914276797596692482, '删除', 'sys_role_del', NULL, 1874786815854444546, NULL, 100002, NULL, 3, '1', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-21 19:15:28.747879', '2025-04-21 19:15:28.747879', '0');
INSERT INTO "public"."sys_menu" VALUES (1914276924180787202, '新增', 'sys_user_add', NULL, 1874786878320214017, NULL, 100002, NULL, 1, '1', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-21 19:15:58.927819', '2025-04-21 19:15:58.927819', '0');
INSERT INTO "public"."sys_menu" VALUES (1914277006372368386, '修改', 'sys_user_edit', NULL, 1874786878320214017, NULL, 100002, NULL, 2, '1', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-21 19:16:18.524205', '2025-04-21 19:16:18.524205', '0');
INSERT INTO "public"."sys_menu" VALUES (1914277088438120450, '删除', 'sys_user_del', NULL, 1874786878320214017, NULL, 100002, NULL, 3, '1', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-21 19:16:38.089991', '2025-04-21 19:16:38.089991', '0');
INSERT INTO "public"."sys_menu" VALUES (1914277179878141953, '启用停用', 'sys_user_startOrStop', NULL, 1874786878320214017, NULL, 100002, NULL, 4, '1', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-21 19:16:59.89084', '2025-04-21 19:16:59.89084', '0');
INSERT INTO "public"."sys_menu" VALUES (1889989162715615233, '我的应用', NULL, '/personalSpace/myApply/index', 1875389350759759874, NULL, 100002, 'icon-moxingkapian', 1, '0', 1, 1902615993494327297, 100001, 100001, '2025-02-13 18:45:05', '2025-04-21 19:56:18.308864', '0');
INSERT INTO "public"."sys_menu" VALUES (1881589573032230914, '我的授权凭证', NULL, '/personalSpace/myAuthorization/index', 1875389350759759874, NULL, 100002, 'icon-wendangzhongxin', 7, '0', 1, 1902615993494327297, 100001, 100001, '2025-01-21 14:28:07', '2025-04-21 19:57:36.324992', '0');
INSERT INTO "public"."sys_menu" VALUES (1879723283637252097, '我的流程', NULL, '/personalSpace/myProcess/index', 1875389350759759874, NULL, 100002, 'icon-wodegongzuoliu', 2, '0', 1, 1902615993494327297, 100001, 100001, '2025-01-16 10:52:09', '2025-04-21 19:56:46.114097', '0');
INSERT INTO "public"."sys_menu" VALUES (1877231723891822594, '我的插件', NULL, '/personalSpace/myPlugin/index', 1875389350759759874, NULL, 100002, 'icon-wodechajian', 3, '0', 1, 1902615993494327297, 100001, 100001, '2025-01-09 13:51:35', '2025-04-21 19:56:57.754729', '0');
INSERT INTO "public"."sys_menu" VALUES (1877913032492318722, '我的知识库', NULL, '/personalSpace/myKnowledge/index', 1875389350759759874, NULL, 100002, 'icon-wodezhishiku', 4, '0', 1, 1902615993494327297, 100001, 100001, '2025-01-11 10:58:52', '2025-04-21 19:57:06.82918', '0');
INSERT INTO "public"."sys_menu" VALUES (1894361541613559810, '我的API KEY', NULL, '/personalSpace/myApiKey/index', 1875389350759759874, NULL, 100002, 'icon-API', 8, '0', 1, 1902615993494327297, 100001, 100001, '2025-02-25 20:19:22', '2025-04-21 19:57:43.580025', '0');
INSERT INTO "public"."sys_menu" VALUES (1876811447559426049, '插件广场', NULL, '/center/plugin/index', 1875388325046910978, NULL, 100002, 'icon-layers', 3, '0', 1, 1902615993494327297, 100001, 100001, '2025-01-08 10:01:33', '2025-04-21 19:58:35.587321', '0');
INSERT INTO "public"."sys_menu" VALUES (1917527352284925953, 'MCP服务管理', NULL, '/mcpMange', -1, NULL, 100001, NULL, 15, '0', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-30 18:32:01.377707', '2025-04-30 18:32:01.377707', '0');
INSERT INTO "public"."sys_menu" VALUES (1917527449907351554, 'MCP服务管理', NULL, '/mcpMange/index', 1917527352284925953, NULL, 100001, NULL, 15, '0', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-30 18:32:24.652613', '2025-04-30 18:32:24.652613', '0');
INSERT INTO "public"."sys_menu" VALUES (1914275764287959042, 'B端用户管理', NULL, '/userMange', 1872568955711180801, NULL, 100001, '', 2, '0', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-21 19:11:22.388926', '2025-05-09 11:28:06.255779', '0');
INSERT INTO "public"."sys_menu" VALUES (1917527721840857089, 'MCP服务管理', NULL, '/personalSpace/mcpManage/index', 1875389350759759874, NULL, 100002, 'icon-MCPfuwuguanli', 35, '0', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-04-30 18:33:29.486618', '2025-04-30 18:33:29.486618', '0');
INSERT INTO "public"."sys_menu" VALUES (1898984830039674882, '租户管理', NULL, '/systemMange/tenant', 1872568955711180801, NULL, 100001, '', 1, '0', 1, 1902615993494327297, 100001, 100001, '2025-03-10 14:30:39.571458', '2025-05-09 11:30:14.133122', '0');
INSERT INTO "public"."sys_menu" VALUES (1922972913744666626, 'MCP广场', NULL, '/center/mcp/index', 1875388325046910978, NULL, 100002, 'icon-MCPguangchang', 5, '0', 1902615993494327297, 1902615993494327297, 100001, 100001, '2025-05-15 19:10:44.403517', '2025-05-15 19:11:26.091565', '0');
INSERT INTO "public"."sys_menu" VALUES (1875389537091715074, '我的Prompt', NULL, '/personalSpace/myPrompt/index', 1875389350759759874, NULL, 100002, 'icon-message', 5, '0', 1, 1917140621883056129, 100001, 100001, '2025-01-04 11:51:23', '2025-05-19 10:49:08.8716', '0');

-- ----------------------------
-- Table structure for sys_oauth_client
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_oauth_client";
CREATE TABLE "public"."sys_oauth_client" (
  "id" int8 NOT NULL,
  "client_id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "resource_ids" varchar(256) COLLATE "pg_catalog"."default",
  "client_secret" varchar(256) COLLATE "pg_catalog"."default",
  "scope" varchar(256) COLLATE "pg_catalog"."default",
  "authorized_grant_types" varchar(256) COLLATE "pg_catalog"."default",
  "web_server_redirect_uri" varchar(256) COLLATE "pg_catalog"."default",
  "authorities" varchar(256) COLLATE "pg_catalog"."default",
  "access_token_validity" int4,
  "refresh_token_validity" int4,
  "additional_information" varchar(4096) COLLATE "pg_catalog"."default",
  "productline" int8 NOT NULL DEFAULT 0,
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" int8 NOT NULL,
  "update_by" int8 NOT NULL,
  "create_by_productline" int8 NOT NULL,
  "update_by_productline" int8 NOT NULL,
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON TABLE "public"."sys_oauth_client" IS '终端信息表';

-- ----------------------------
-- Records of sys_oauth_client
-- ----------------------------
INSERT INTO "public"."sys_oauth_client" VALUES (1, 'BOSS', NULL, 'boss_hzhywerwdslf88pw', 'allServer', 'password,refresh_token,authorization_code,client_credentials,mobile', 'http://127.0.0.1', NULL, 1209600, 1209600, NULL, 100001, '0', 1, 1, 100001, 100001, '2024-12-26 10:17:49', '2024-12-26 10:17:52');
INSERT INTO "public"."sys_oauth_client" VALUES (2, 'BWEB', NULL, 'BWEB_hzhywerwee3890', 'allServer', 'password,refresh_token,authorization_code,client_credentials,mobile', 'http://127.0.0.1', NULL, 1209600, 1209600, NULL, 100002, '0', 1, 1, 100001, 100001, '2024-12-26 10:17:49', '2024-12-26 10:17:52');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "role_id" int8 NOT NULL,
  "role_name" varchar(64) COLLATE "pg_catalog"."default",
  "role_code" varchar(64) COLLATE "pg_catalog"."default",
  "role_desc" varchar(255) COLLATE "pg_catalog"."default",
  "ds_type" char(1) COLLATE "pg_catalog"."default",
  "ds_scope" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" int8,
  "productline" int8,
  "create_by" int8 NOT NULL,
  "update_by" int8 NOT NULL,
  "create_by_productline" int8 NOT NULL,
  "update_by_productline" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6),
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar
)
;
COMMENT ON COLUMN "public"."sys_role"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role"."role_name" IS '角色名称';
COMMENT ON COLUMN "public"."sys_role"."role_code" IS '角色编码';
COMMENT ON COLUMN "public"."sys_role"."role_desc" IS '角色描述';
COMMENT ON COLUMN "public"."sys_role"."ds_type" IS '数据权限类型，0全部，1自定义，2本部门及以下，3本部门，4仅本人';
COMMENT ON COLUMN "public"."sys_role"."ds_scope" IS '数据权限范围';
COMMENT ON COLUMN "public"."sys_role"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."sys_role"."productline" IS '产品线';
COMMENT ON COLUMN "public"."sys_role"."create_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_role"."update_by" IS '修改人';
COMMENT ON COLUMN "public"."sys_role"."create_by_productline" IS '创建人产品线';
COMMENT ON COLUMN "public"."sys_role"."update_by_productline" IS '修改人产品线';
COMMENT ON COLUMN "public"."sys_role"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_role"."del_flag" IS '删除标记，0未删除，1已删除';
COMMENT ON TABLE "public"."sys_role" IS '系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES (1, '管理员', 'admin', '系统管理员', '0', NULL, 1, 100001, 1, 1, 100001, 100001, '2024-12-26 17:18:20', '2024-12-26 17:20:23', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menu";
CREATE TABLE "public"."sys_role_menu" (
  "role_id" int8 NOT NULL,
  "menu_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_role_menu"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role_menu"."menu_id" IS '菜单ID';
COMMENT ON TABLE "public"."sys_role_menu" IS '角色菜单表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1872568955711180801);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1898984830039674882);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1898985571512930305);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 2);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1875418165313667073);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1873998860311273473);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1872575879160758273);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1874029088408543234);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1874029244860276737);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1874029332986798082);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1872576077488422914);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1874029605679472642);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1874029692438650881);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1874029776509280257);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1875418418486050817);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1872879914547888130);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1874030050795790338);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1874030131905241089);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1874030208606478337);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1872894115064496130);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1874001295230574594);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1874030464446439426);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1874030524743753729);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1875000969332703233);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1875001160584577026);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1875002128516694017);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1875002232317329410);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1875108670465294338);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1875108884588707842);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1876504121502748673);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1876504330437808130);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1880075473866354689);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1880076403844214785);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1889921529697832962);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1889921896871399425);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1914275764287959042);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1914275841324740609);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1917527352284925953);
INSERT INTO "public"."sys_role_menu" ("role_id", "menu_id") VALUES (1, 1917527449907351554);


-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_tenant";
CREATE TABLE "public"."sys_tenant" (
  "id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "code" varchar(64) COLLATE "pg_catalog"."default",
  "tenant_domain" varchar(255) COLLATE "pg_catalog"."default",
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "create_by" int8 NOT NULL,
  "update_by" int8 NOT NULL,
  "create_by_productline" int8 NOT NULL,
  "update_by_productline" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "phone" varchar(255) COLLATE "pg_catalog"."default",
  "is_official" bool NOT NULL DEFAULT false
)
;
COMMENT ON COLUMN "public"."sys_tenant"."id" IS '租户ID';
COMMENT ON COLUMN "public"."sys_tenant"."name" IS '租户名称';
COMMENT ON COLUMN "public"."sys_tenant"."code" IS '租户编码';
COMMENT ON COLUMN "public"."sys_tenant"."tenant_domain" IS '租户域名';
COMMENT ON COLUMN "public"."sys_tenant"."status" IS '租户状态，0正常，1停用';
COMMENT ON COLUMN "public"."sys_tenant"."del_flag" IS '删除标记，0未删除，1已删除';
COMMENT ON COLUMN "public"."sys_tenant"."create_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_tenant"."update_by" IS '修改人';
COMMENT ON COLUMN "public"."sys_tenant"."create_by_productline" IS '创建人产品线';
COMMENT ON COLUMN "public"."sys_tenant"."update_by_productline" IS '修改人产品线';
COMMENT ON COLUMN "public"."sys_tenant"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_tenant"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_tenant"."phone" IS '手机号';
COMMENT ON COLUMN "public"."sys_tenant"."is_official" IS '是否官方账号';
COMMENT ON TABLE "public"."sys_tenant" IS '租户表';

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------



-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "user_id" int8 NOT NULL,
  "username" varchar(64) COLLATE "pg_catalog"."default",
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "salt" varchar(255) COLLATE "pg_catalog"."default",
  "phone" varchar(20) COLLATE "pg_catalog"."default",
  "avatar" varchar(255) COLLATE "pg_catalog"."default",
  "nickname" varchar(64) COLLATE "pg_catalog"."default",
  "name" varchar(64) COLLATE "pg_catalog"."default",
  "email" varchar(128) COLLATE "pg_catalog"."default",
  "dept_id" int8,
  "tenant_id" int8 NOT NULL DEFAULT 0,
  "productline" int8 NOT NULL DEFAULT 0,
  "lock_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "password_modify_time" timestamp(6),
  "create_by" int8 NOT NULL,
  "update_by" int8 NOT NULL,
  "create_by_productline" int8 NOT NULL,
  "update_by_productline" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6),
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "account_type" int2 NOT NULL DEFAULT 1,
  "status" int2 NOT NULL DEFAULT 1
)
;
COMMENT ON COLUMN "public"."sys_user"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."sys_user"."username" IS '用户名';
COMMENT ON COLUMN "public"."sys_user"."password" IS '密码';
COMMENT ON COLUMN "public"."sys_user"."salt" IS '盐值';
COMMENT ON COLUMN "public"."sys_user"."phone" IS '电话号码';
COMMENT ON COLUMN "public"."sys_user"."avatar" IS '头像';
COMMENT ON COLUMN "public"."sys_user"."nickname" IS '昵称';
COMMENT ON COLUMN "public"."sys_user"."name" IS '姓名';
COMMENT ON COLUMN "public"."sys_user"."email" IS '邮箱地址';
COMMENT ON COLUMN "public"."sys_user"."dept_id" IS '所属部门ID';
COMMENT ON COLUMN "public"."sys_user"."tenant_id" IS '所属租户ID';
COMMENT ON COLUMN "public"."sys_user"."productline" IS '产品线';
COMMENT ON COLUMN "public"."sys_user"."lock_flag" IS '锁定标记，0未锁定，1已锁定';
COMMENT ON COLUMN "public"."sys_user"."password_modify_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_user"."create_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_user"."update_by" IS '修改人';
COMMENT ON COLUMN "public"."sys_user"."create_by_productline" IS '创建人产品线';
COMMENT ON COLUMN "public"."sys_user"."update_by_productline" IS '修改人产品线';
COMMENT ON COLUMN "public"."sys_user"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sys_user"."del_flag" IS '删除标记，0未删除，1已删除';
COMMENT ON COLUMN "public"."sys_user"."account_type" IS '账号类型：1-主账号，2-子账号';
COMMENT ON COLUMN "public"."sys_user"."status" IS '用户状态：1-启用，2-停用';
COMMENT ON TABLE "public"."sys_user" IS '用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
-- admin / huizhi@123
INSERT INTO "public"."sys_user" ("user_id", "username", "password", "salt", "phone", "avatar", "nickname", "name", "email", "dept_id", "tenant_id", "productline", "lock_flag", "password_modify_time", "create_by", "update_by", "create_by_productline", "update_by_productline", "create_time", "update_time", "del_flag", "account_type", "status") VALUES (1, 'admin', '$2a$10$ykUkDLV2FpwUjZOFESKuqOk6Lm1wy7Jv0gqZWqEwGEwumthDw7lnm', NULL, '15365100790', NULL, NULL, '管理员', NULL, 1872885596332408833, 1, 100001, '0', '2024-12-26 16:04:57', 1, 0, 100001, 0, '2024-12-26 15:11:18', '2025-06-17 19:12:57.482066', '0', 1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_role";
CREATE TABLE "public"."sys_user_role" (
  "user_id" int8 NOT NULL,
  "role_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_user_role"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."sys_user_role"."role_id" IS '角色ID';
COMMENT ON TABLE "public"."sys_user_role" IS '用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO "public"."sys_user_role" ("user_id", "role_id") VALUES (1, 1);

-- ----------------------------
-- Primary Key structure for table sys_dept
-- ----------------------------
ALTER TABLE "public"."sys_dept" ADD CONSTRAINT "sys_dept_pkey" PRIMARY KEY ("dept_id");

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "sys_menu_pkey" PRIMARY KEY ("menu_id");

-- ----------------------------
-- Primary Key structure for table sys_oauth_client
-- ----------------------------
ALTER TABLE "public"."sys_oauth_client" ADD CONSTRAINT "sys_oauth_client_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("role_id");

-- ----------------------------
-- Primary Key structure for table sys_role_menu
-- ----------------------------
ALTER TABLE "public"."sys_role_menu" ADD CONSTRAINT "sys_role_menu_pkey" PRIMARY KEY ("role_id", "menu_id");

-- ----------------------------
-- Primary Key structure for table sys_tenant
-- ----------------------------
ALTER TABLE "public"."sys_tenant" ADD CONSTRAINT "sys_tenant_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_user
-- ----------------------------
CREATE INDEX "user_idx1_phone" ON "public"."sys_user" USING btree (
  "phone" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "user_idx2_username" ON "public"."sys_user" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table sys_user_role
-- ----------------------------
ALTER TABLE "public"."sys_user_role" ADD CONSTRAINT "sys_user_role_pkey" PRIMARY KEY ("user_id", "role_id");
