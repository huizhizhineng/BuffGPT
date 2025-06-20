/*
 Navicat Premium Dump SQL

 Source Server         : buffgpt_pg_prod
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 118.31.113.98:17506
 Source Catalog        : agents_common
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 16/06/2025 11:37:15
*/


-- ----------------------------
-- Sequence structure for audit_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."audit_log_id_seq";
CREATE SEQUENCE "public"."audit_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for oss_file_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."oss_file_id_seq";
CREATE SEQUENCE "public"."oss_file_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_dict_data_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_dict_data_id_seq";
CREATE SEQUENCE "public"."sys_dict_data_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_dict_type_dict_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_dict_type_dict_id_seq";
CREATE SEQUENCE "public"."sys_dict_type_dict_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for audit_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."audit_log";
CREATE TABLE "public"."audit_log" (
  "id" int8 NOT NULL DEFAULT nextval('audit_log_id_seq'::regclass),
  "request_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "business_id" varchar(255) COLLATE "pg_catalog"."default",
  "operate_name" varchar(255) COLLATE "pg_catalog"."default",
  "module" varchar(255) COLLATE "pg_catalog"."default",
  "business_desc" varchar(255) COLLATE "pg_catalog"."default",
  "data_change" text COLLATE "pg_catalog"."default",
  "before_value" text COLLATE "pg_catalog"."default",
  "new_value" text COLLATE "pg_catalog"."default",
  "table_name" varchar(50) COLLATE "pg_catalog"."default",
  "entity_class" varchar(1000) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "ip" varchar(255) COLLATE "pg_catalog"."default",
  "operator_id" int8,
  "transfer_data" text COLLATE "pg_catalog"."default",
  "operator" varchar(255) COLLATE "pg_catalog"."default",
  "execute_method" varchar(1000) COLLATE "pg_catalog"."default",
  "request_info" text COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."audit_log"."id" IS '主键';
COMMENT ON COLUMN "public"."audit_log"."request_id" IS '请求ID';
COMMENT ON COLUMN "public"."audit_log"."business_id" IS '业务唯一标识';
COMMENT ON COLUMN "public"."audit_log"."operate_name" IS '操作的对象名称';
COMMENT ON COLUMN "public"."audit_log"."module" IS '模块描述';
COMMENT ON COLUMN "public"."audit_log"."business_desc" IS '业务描述';
COMMENT ON COLUMN "public"."audit_log"."data_change" IS '变更项';
COMMENT ON COLUMN "public"."audit_log"."before_value" IS '对象变更前json';
COMMENT ON COLUMN "public"."audit_log"."new_value" IS '对象变更后json';
COMMENT ON COLUMN "public"."audit_log"."table_name" IS '变更表名';
COMMENT ON COLUMN "public"."audit_log"."entity_class" IS '实体类';
COMMENT ON COLUMN "public"."audit_log"."created_at" IS '变更时间';
COMMENT ON COLUMN "public"."audit_log"."ip" IS '操作来源ip';
COMMENT ON COLUMN "public"."audit_log"."operator_id" IS '操作人用户ID';
COMMENT ON COLUMN "public"."audit_log"."transfer_data" IS '参数';
COMMENT ON COLUMN "public"."audit_log"."operator" IS '操作人';
COMMENT ON COLUMN "public"."audit_log"."execute_method" IS '执行方法路径';
COMMENT ON COLUMN "public"."audit_log"."request_info" IS '请求信息';
COMMENT ON TABLE "public"."audit_log" IS '审计日志表';

-- ----------------------------
-- Table structure for oss_file
-- ----------------------------
DROP TABLE IF EXISTS "public"."oss_file";
CREATE TABLE "public"."oss_file" (
  "id" int8 NOT NULL DEFAULT nextval('oss_file_id_seq'::regclass),
  "oss_file_id" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "oss_file_name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "oss_file_type" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "oss_file_url" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "tenant_id" int8,
  "productline" int8,
  "creator" int8,
  "updater" int8,
  "createdTime" timestamp(6),
  "updatedTime" timestamp(6),
  "del" bool DEFAULT false
)
;
COMMENT ON COLUMN "public"."oss_file"."id" IS '主键';
COMMENT ON COLUMN "public"."oss_file"."oss_file_id" IS 'oss文件唯一标识';
COMMENT ON COLUMN "public"."oss_file"."oss_file_name" IS 'oss文件名称';
COMMENT ON COLUMN "public"."oss_file"."oss_file_type" IS 'oss文件类型';
COMMENT ON COLUMN "public"."oss_file"."oss_file_url" IS 'oss文件链接';
COMMENT ON COLUMN "public"."oss_file"."tenant_id" IS '租户Id';
COMMENT ON COLUMN "public"."oss_file"."productline" IS '产品线';
COMMENT ON COLUMN "public"."oss_file"."creator" IS '创建人';
COMMENT ON COLUMN "public"."oss_file"."updater" IS '修改人';
COMMENT ON COLUMN "public"."oss_file"."createdTime" IS '创建时间';
COMMENT ON COLUMN "public"."oss_file"."updatedTime" IS '更新时间';

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_data";
CREATE TABLE "public"."sys_dict_data" (
  "id" int8 NOT NULL DEFAULT nextval('sys_dict_data_id_seq'::regclass),
  "sort" int4 DEFAULT 0,
  "label" text COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "value" int8 DEFAULT 0,
  "dict_type" int8 DEFAULT 0,
  "css_class" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "list_class" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "is_default" char(1) COLLATE "pg_catalog"."default" DEFAULT 'N'::bpchar,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "productline" int8,
  "create_by" int8 NOT NULL DEFAULT 0,
  "update_by" int8 NOT NULL DEFAULT 0,
  "create_by_productline" int8 NOT NULL DEFAULT 0,
  "update_by_productline" int8 NOT NULL DEFAULT 0,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6),
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "remark" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."sys_dict_data"."id" IS '字典编码';
COMMENT ON COLUMN "public"."sys_dict_data"."sort" IS '字典排序';
COMMENT ON COLUMN "public"."sys_dict_data"."label" IS '字典标签';
COMMENT ON COLUMN "public"."sys_dict_data"."value" IS '字典键值';
COMMENT ON COLUMN "public"."sys_dict_data"."dict_type" IS '字典类型';
COMMENT ON COLUMN "public"."sys_dict_data"."css_class" IS '样式属性（其他样式扩展）';
COMMENT ON COLUMN "public"."sys_dict_data"."list_class" IS '表格回显样式';
COMMENT ON COLUMN "public"."sys_dict_data"."is_default" IS '是否默认（Y是 N否）';
COMMENT ON COLUMN "public"."sys_dict_data"."status" IS '状态（0正常 1停用）';
COMMENT ON COLUMN "public"."sys_dict_data"."productline" IS '产品线';
COMMENT ON COLUMN "public"."sys_dict_data"."create_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_dict_data"."update_by" IS '修改人';
COMMENT ON COLUMN "public"."sys_dict_data"."create_by_productline" IS '创建人产品线';
COMMENT ON COLUMN "public"."sys_dict_data"."update_by_productline" IS '修改人产品线';
COMMENT ON COLUMN "public"."sys_dict_data"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict_data"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dict_data"."del_flag" IS '删除标记，0未删除，1已删除';
COMMENT ON COLUMN "public"."sys_dict_data"."remark" IS '备注';
COMMENT ON TABLE "public"."sys_dict_data" IS '字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO "public"."sys_dict_data" VALUES (1, 1, '违背公序良俗', 1, 1, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, 2, '违规营销', 2, 1, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, 3, '违法违规', 3, 1, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, 4, '邪教宣传', 4, 1, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, 5, '人身攻击', 5, 1, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (6, 6, '涉黄信息', 6, 1, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (7, 7, '涉政敏感', 7, 1, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (8, 8, '诈骗信息', 8, 1, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (9, 9, '侵犯个人权益', 9, 1, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (10, 10, '企业侵权', 10, 1, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (11, 11, '其他', 11, 1, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (12, 1, '创意文案', 1, 3, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (13, 2, '办公助手', 2, 3, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (14, 3, '学习助手', 3, 3, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (15, 4, '智慧办公', 4, 3, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (16, 5, '新颖设计', 5, 3, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (17, 1, '文本生成', 1, 2, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (18, 2, '图片生成', 2, 2, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-15 13:57:41', '2025-01-15 13:57:41', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (121, 3, '15', 3, 26, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.698602', '2025-04-10 20:54:38.698602', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (20, 1, '未发布', 0, 6, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-17 16:03:11', '2025-01-17 16:03:11', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (21, 2, '已发布', 1, 6, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-17 16:03:11', '2025-01-17 16:03:11', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (22, 3, '已下架', 2, 6, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-17 16:03:11', '2025-01-17 16:03:11', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (23, 1, '待处理', 0, 7, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-20 15:55:44', '2025-01-20 15:55:44', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (24, 2, '处理中', 1, 7, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-20 15:55:44', '2025-01-20 15:55:44', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (25, 3, '处理完成', 2, 7, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-20 15:55:44', '2025-01-20 15:55:44', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (26, 4, '处理失败', 3, 7, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-20 15:55:44', '2025-01-20 15:55:44', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (27, 1, 'gpt2', 1, 8, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-20 15:55:44', '2025-01-20 15:55:44', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (28, 2, 'r50k_base', 2, 8, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-20 15:55:44', '2025-01-20 15:55:44', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (29, 3, 'p50k_base', 3, 8, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-20 15:55:44', '2025-01-20 15:55:44', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (30, 4, 'p50k_edit', 4, 8, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-20 15:55:44', '2025-01-20 15:55:44', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (31, 5, 'cl100k_base', 5, 8, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-20 15:55:44', '2025-01-20 15:55:44', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (32, 1, '文本生成', 1, 9, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-22 10:48:51', '2025-01-22 10:48:51', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (33, 2, '图片理解', 2, 9, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-22 10:48:51', '2025-01-22 10:48:51', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (34, 3, '视频理解', 3, 9, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-22 10:48:51', '2025-01-22 10:48:51', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (35, 4, '图片生成', 4, 9, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-22 10:48:51', '2025-01-22 10:48:51', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (36, 5, '视频生成', 5, 9, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-22 10:48:51', '2025-01-22 10:48:51', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (37, 6, '向量模型', 6, 9, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-22 10:48:51', '2025-01-22 10:48:51', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (38, 7, '图片处理', 7, 9, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-22 10:48:51', '2025-01-22 10:48:51', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (39, 8, '语音识别', 8, 9, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-22 10:48:51', '2025-01-22 10:48:51', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (40, 9, '语音合成', 9, 9, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-22 10:48:51', '2025-01-22 10:48:51', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (41, 1, 'API Key', 1, 10, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-22 10:48:51', '2025-01-22 10:48:51', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (42, 2, 'Access Key', 2, 10, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-22 10:48:51', '2025-01-23 16:28:46', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (43, 3, '其他', 3, 10, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-22 10:48:51', '2025-01-22 10:48:51', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (44, 3, '已删除', 3, 6, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-02-18 16:02:11', '2025-02-18 16:02:11', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (45, 4, '已下架', 4, 6, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-02-18 16:02:11', '2025-02-18 16:02:11', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (46, 1, '普通智能体应用', 1, 11, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-02-21 15:23:22', '2025-02-21 15:23:22', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (47, 2, 'RAG智能体应用', 2, 11, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-02-21 15:23:22', '2025-02-21 15:23:22', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (48, 3, '对话型工作流应用', 3, 11, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-02-21 15:23:22', '2025-02-21 15:23:22', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (49, 4, '任务型工作流应用', 4, 11, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-02-21 15:23:22', '2025-02-21 15:23:22', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (50, 5, '智能体编排应用', 5, 11, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-02-21 15:23:22', '2025-02-21 15:23:22', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (53, 1, '开启', 1, 13, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-02-28 15:41:46', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (54, 2, '停用', 0, 13, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-02-28 15:42:00', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (55, 1, '关键词', 1, 14, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-01 16:30:52', '2025-03-01 16:30:52', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (56, 2, '正则表达式', 2, 14, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-01 16:30:52', '2025-03-01 16:30:52', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (52, 2, '违背公序良俗', 2, 12, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-02-21 16:52:46', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (57, 3, '语义意图', 3, 14, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-01 16:30:52', '2025-03-01 16:30:52', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (58, 1, '永久', 1, 15, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-01 16:30:52', '2025-03-01 16:30:52', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (59, 2, '自定义', 0, 15, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-01 16:30:52', '2025-03-01 16:30:52', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (60, 3, '30', 30, 15, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-01 16:30:52', '2025-03-01 16:30:52', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (61, 4, '90', 90, 15, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-01 16:30:52', '2025-03-01 16:30:52', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (62, 5, '180', 180, 15, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-01 16:30:52', '2025-03-01 16:30:52', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (63, 1, '模型厂商', 1, 16, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 13:59:12', '2025-03-03 14:20:59', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (64, 2, '服务器厂商', 2, 16, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 13:59:15', '2025-03-03 13:59:40', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (65, 3, 'GPU厂商', 3, 16, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 13:59:22', '2025-03-03 13:59:40', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (66, 4, '模型服务提供商', 4, 16, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 13:59:26', '2025-03-03 13:59:40', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (67, 1, '图片处理', 1, 17, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 14:10:21', '2025-03-03 14:11:06', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (68, 2, '实用工具', 2, 17, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 14:10:26', '2025-03-03 14:11:06', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (69, 3, '便利生活', 3, 17, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 14:10:31', '2025-03-03 14:11:06', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (70, 4, '新闻阅读', 4, 17, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 14:10:38', '2025-03-03 14:11:06', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (71, 5, '信息检索', 5, 17, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 14:10:42', '2025-03-03 14:11:06', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (72, 6, '科学教育', 6, 17, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 14:10:44', '2025-03-03 14:11:06', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (73, 1, '未发布', 1, 18, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 17:22:39', '2025-03-03 17:23:18', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (74, 2, '已发布', 2, 18, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 17:22:44', '2025-03-03 17:23:19', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (75, 3, '待下架', 3, 18, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 17:22:49', '2025-03-03 17:23:21', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (76, 4, '已下架', 4, 18, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 17:22:54', '2025-03-03 17:23:24', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (77, 5, '涉及违规', 5, 18, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-03 17:22:57', '2025-03-03 17:23:26', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (78, 1, '单轮对话', 1, 19, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-10 10:24:52', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (79, 2, '多轮对话', 2, 19, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-10 10:24:58', '2025-03-10 10:25:30', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (80, 3, '自定义参数传递', 3, 19, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-10 10:25:03', '2025-03-10 10:25:33', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (81, 4, '流式输出', 4, 19, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-10 10:25:06', '2025-03-10 10:25:36', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (82, 5, '长期记忆', 5, 19, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-10 10:25:09', '2025-03-10 10:25:39', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (83, 6, '上传文件', 6, 19, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-10 10:25:14', '2025-03-10 10:25:40', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (84, 1, 'Python', 1, 20, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-10 10:27:40', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (85, 2, 'Java', 2, 20, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-10 10:27:49', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (86, 3, 'Http', 3, 20, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-10 10:27:58', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (19, 1, 'http://172.30.194.166:8000', 1, 5, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-01-17 16:03:11', '2025-02-28 10:29:28', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (122, 4, '14', 4, 26, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.700413', '2025-04-10 20:54:38.700413', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (123, 5, '13', 5, 26, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.701381', '2025-04-10 20:54:38.701381', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (124, 6, '12', 6, 26, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.703906', '2025-04-10 20:54:38.703906', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (125, 7, '11', 7, 26, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.704868', '2025-04-10 20:54:38.704868', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (126, 8, '10', 8, 26, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.705716', '2025-04-10 20:54:38.705716', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (127, 1, '9.2', 1, 27, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.706648', '2025-04-10 20:54:38.706648', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (128, 2, '9.0', 2, 27, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.707642', '2025-04-10 20:54:38.707642', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (129, 3, '8.4', 3, 27, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.708375', '2025-04-10 20:54:38.708375', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (130, 4, '8.3', 4, 27, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.709089', '2025-04-10 20:54:38.709089', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (131, 5, '8.2', 5, 27, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.70984', '2025-04-10 20:54:38.70984', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (132, 6, '8.1', 6, 27, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.710604', '2025-04-10 20:54:38.710604', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (133, 7, '8.0', 7, 27, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.713705', '2025-04-10 20:54:38.713705', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (134, 8, '5.7', 8, 27, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.714692', '2025-04-10 20:54:38.714692', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (169, 3, '{"title":"【系统通知】您发布的插件`name`已下架","content":"您发布的插件`name`因违规已被下架，下架原因：`reason`，请及时关注。\n下架详细信息：`detail`。"}', 31, 34, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-17 15:29:15.318404', '2025-05-17 15:29:15.318404', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (170, 4, '{"title":"【系统通知】您使用的插件`name`已下架","content":"您构建的应用`application`使用的插件`name`因违规已被下架，下架原因：`reason`，请及时关注。\n下架详细信息：`detail`。"}', 32, 34, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-17 15:29:15.327296', '2025-05-17 15:29:15.327296', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (135, 1, '地图服务', 0, 29, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-30 18:19:25.456358', '2025-04-30 18:19:25.456358', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (136, 2, '内容生成', 1, 29, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-30 18:19:25.464387', '2025-04-30 18:19:25.464387', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (137, 3, '办公工具', 2, 29, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-30 18:19:25.465747', '2025-04-30 18:19:25.465747', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (138, 4, '效率工具', 3, 29, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-30 18:19:25.46733', '2025-04-30 18:19:25.46733', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (139, 5, '网页搜索', 4, 29, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-30 18:19:25.468284', '2025-04-30 18:19:25.468284', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (140, 1, '在线', 1, 31, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-30 18:19:25.469863', '2025-04-30 18:19:25.469863', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (141, 2, '离线', 0, 31, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-30 18:19:25.47089', '2025-04-30 18:19:25.47089', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (142, 1, 'https://buffgpt.agentsyun.com/api/module/b/mcp/mcpRunningStatus/callback', 1, 32, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-30 18:19:25.473102', '2025-04-30 18:19:25.473102', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (171, 5, '{"title":"【系统通知】您发布的MCP服务`name`已下架","content":"您发布的MCP服务`name`已被下架，下架原因：`reason`，请及时关注。\n下架详细信息：`detail`。"}', 41, 34, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-17 15:29:15.343006', '2025-05-17 15:29:15.343006', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (172, 6, '{"title":"【系统通知】您发布的MCP服务`name`已下架","content":"您构建的应用`application`使用的MCP服务`name`因违规已被下架，下架原因：`reason`，请及时关注。\n下架详细信息：`detail`。"}', 42, 34, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-17 15:29:15.357527', '2025-05-17 15:29:15.357527', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (173, 7, '{"title":"【系统通知】您使用的插件`name`即将下架","content":"您构建的应用`application`使用的插件`name`将于`time`下架，请及时关注。"}', 33, 34, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-17 15:29:15.363522', '2025-05-17 15:29:15.363522', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (174, 8, '{"title":"【系统通知】您使用MCP服务`name`即将下架","content":"您构建的应用`application`使用的MCP服务`name`将于`time`下架，请及时关注。"}', 43, 34, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-17 15:29:15.382035', '2025-05-17 15:29:15.382035', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (156, 1, '违规营销', 1, 33, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 15:26:42', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (157, 2, '违背公序良俗', 2, 33, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 15:26:52', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (158, 3, '违法违规', 3, 33, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 15:27:03', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (159, 4, '邪教宣传', 4, 33, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 15:27:07', '2025-05-07 15:27:15', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (160, 5, '人身攻击', 5, 33, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 15:27:28', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (161, 6, '涉黄信息', 6, 33, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 15:27:32', '2025-05-07 15:27:39', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (162, 7, '涉政敏感', 7, 33, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 15:27:50', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (163, 8, '诈骗信息', 8, 33, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 15:28:01', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (164, 9, '侵犯个人权益', 9, 33, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 15:28:15', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (165, 10, '企业侵权', 10, 33, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 15:28:23', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (166, 11, '其他', 0, 33, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 15:28:36', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (167, 1, '{"title":"【系统通知】您发布的应用`name`已下架","content":"您发布的应用`name`因违规已被下架，下架原因：`reason`，请及时关注。\n下架详细信息：`detail`。"}', 11, 34, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-17 15:29:14.924852', '2025-05-17 15:29:14.924852', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (168, 2, '{"title":"【系统通知】您发布的Prompt模版`name`已下架","content":"您发布的Prompt模版`name`因违规已被下架，下架原因：`reason`，请及时关注。\n下架详细信息：`detail`。"}', 21, 34, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-17 15:29:15.305688', '2025-05-17 15:29:15.305688', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (175, 6, '已删除', 6, 18, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-20 18:35:55.479221', '2025-05-20 18:35:55.479221', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (112, 1, '普通智能体应用', 1, 23, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 19:16:53.808864', '2025-04-10 19:16:53.808864', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (113, 2, 'RAG智能体应用', 2, 23, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 19:16:53.82433', '2025-04-10 19:16:53.82433', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (116, 5, '智能体编排应用', 5, 23, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 19:16:53.836018', '2025-04-10 19:16:53.836018', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (88, 1, '```python
import requests
import json

# 请求URL
url = "https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute"

# 请求头
headers = {
    "Content-Type": "application/json",
    "API-KEY": "YOUR_API_KEY_VALUE"
}

# 请求体
data = {
    "agentId": 87,
    "conversationId": "1898918319210237967",
    "distance": 0.5,
    "messages": [
        {
            "content": "你好",
            "role": "user"
        }
    ],
    "callbackUrl": "http://www.baidu.com"
}

# 发送POST请求
response = requests.post(url, headers=headers, data=json.dumps(data))

# 输出响应状态码和响应体
print("Response Status Code:", response.status_code)
print("Response Body:", response.json())', 11, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.328272', '2025-03-19 11:10:36.328272', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (89, 2, '```java
package com.huizhi.service.openapi;

import cn.hutool.core.collection.ListUtil;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import java.util.List;

public class OpenApiService {
    public static void main(String[] args) {
        ApiRequest request = new ApiRequest();
        request.setAgentId(87L);
        request.setConversationId("1898918319210237967");
        request.setDistance(0.5);
        request.setMessages(ListUtil.toList(Message.builder().content("你好").role("user").build()));
        request.setCallbackUrl("https://www.baidu.com");
        // 设置请求头
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // API KEY
        headers.set("API-KEY", "YOUR_API_KEY_VALUE");
        // 创建请求实体
        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);
        RestTemplate restTemplate = new RestTemplate();
        // 发送POST请求
        ResponseEntity<String> response = restTemplate.postForEntity("https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute", entity, String.class);// 输出响应结果
        System.out.println("Response Status: " + response.getStatusCode());
        System.out.println("Response Body: " + response.getBody());
    }
    
    static class ApiRequest {
        // agentUuid/agentId 二选一
        private String agentUuid;
        private Long agentId;
        // 会话id
        private String conversationId;
        private Double distance;
        // 消息体
        private List<Message> messages;
        // 回调地址
        private String callbackUrl;
    }
    static class Message {
        // 内容
        private String content;
        // 角色
        private String role;
    }
}
', 12, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.386466', '2025-03-19 11:10:36.386466', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (90, 3, '```http
curl -X POST \
https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \
-H "Content-Type: application/json" \
-H "API-KEY: YOUR_API_KEY_VALUE" \
-d ''{
    "agentId": 128,
    "conversationId": "1898928216899457025",
    "distance": 0.5,
    "messages": [
        {
            "content": "你好",
            "role": "user"
        }
    ],
    "callbackUrl": "http://www.baidu.com"
}''', 13, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.387697', '2025-03-19 11:10:36.387697', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (91, 1, '```python
import requests
import json

# 请求URL
url = "https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute"

# 请求头
headers = {
    "Content-Type": "application/json",
    "API-KEY": "YOUR_API_KEY_VALUE"
}

# 请求体
data = {
    "agentId": 87,
    "conversationId": "1898918319210237967",
    "distance": 0.5,
    "messages": [
        {
            "content": "你好",
            "role": "user"
        },
        {
            "content": "你好1",
            "role": "user"
        },
        {
            "content": "你好2",
            "role": "user"
        }
    ],
    "callbackUrl": "http://www.baidu.com"
}

# 发送POST请求
response = requests.post(url, headers=headers, data=json.dumps(data))

# 输出响应状态码和响应体
print("Response Status Code:", response.status_code)
print("Response Body:", response.json())', 21, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.388764', '2025-03-19 11:10:36.388764', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (92, 2, '```java
package com.huizhi.service.openapi;

import cn.hutool.core.collection.ListUtil;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import java.util.List;

public class OpenApiService {
    public static void main(String[] args) {
        ApiRequest request = new ApiRequest();
        request.setAgentId(87L);
        request.setConversationId("1898918319210237967");
        request.setDistance(0.5);
        request.setMessages(ListUtil.toList(Message.builder().content("你好").role("user").build(),Message.builder().content("你好1").role("user").build(),Message.builder().content("你好2").role("user").build()));
        request.setCallbackUrl("https://www.baidu.com");
        // 设置请求头
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // API KEY
        headers.set("API-KEY", "YOUR_API_KEY_VALUE");
        // 创建请求实体
        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);
        RestTemplate restTemplate = new RestTemplate();
        // 发送POST请求
        ResponseEntity<String> response = restTemplate.postForEntity("https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute", entity, String.class);// 输出响应结果
        System.out.println("Response Status: " + response.getStatusCode());
        System.out.println("Response Body: " + response.getBody());
    }
    
    static class ApiRequest {
        // agentUuid/agentId 二选一
        private String agentUuid;
        private Long agentId;
        // 会话id
        private String conversationId;
        private Double distance;
        // 消息体
        private List<Message> messages;
        // 回调地址
        private String callbackUrl;
    }
    static class Message {
        // 内容
        private String content;
        // 角色
        private String role;
    }
}
', 22, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.38968', '2025-03-19 11:10:36.38968', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (93, 3, '```http
curl -X POST \
https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \
-H "Content-Type: application/json" \
-H "API-KEY: YOUR_API_KEY_VALUE" \
-d ''{
    "agentId": 128,
    "conversationId": "1898928216899457025",
    "distance": 0.5,
    "messages": [
        {
            "content": "你好",
            "role": "user"
        },
        {
            "content": "你好1",
            "role": "user"
        },
        {
            "content": "你好2",
            "role": "user"
        }
    ],
    "callbackUrl": "http://www.baidu.com"
}''', 23, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.391247', '2025-03-19 11:10:36.391247', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (114, 3, '智能对话模式工作流应用', 3, 23, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 19:16:53.828994', '2025-04-10 19:16:53.828994', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (115, 4, '智能任务模式工作流应用', 4, 23, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 19:16:53.833261', '2025-04-10 19:16:53.833261', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (51, 1, '违规营销', 1, 12, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-02-21 16:52:37', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (144, 4, '邪教宣传', 4, 12, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 10:24:44.139989', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (145, 5, '人身攻击', 5, 12, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 10:24:46.622675', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (146, 6, '涉黄信息', 6, 12, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 10:24:49.047141', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (147, 7, '涉政敏感', 7, 12, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 10:24:51.588622', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (148, 8, '诈骗信息', 8, 12, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 10:24:54.54957', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (149, 9, '侵犯个人权益', 9, 12, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 10:24:58.819359', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (150, 10, '企业侵权', 10, 12, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 10:25:01.525285', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (143, 3, '违法违规', 3, 12, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 10:24:39.0456', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (151, 11, '其他', 0, 12, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-05-07 10:25:11.032997', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (117, 1, 'PostgreSQL', 1, 25, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.685361', '2025-04-10 20:54:38.685361', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (118, 2, 'MySQL', 2, 25, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.694781', '2025-04-10 20:54:38.694781', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (119, 1, '17', 1, 26, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.695929', '2025-04-10 20:54:38.695929', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (120, 2, '16', 2, 26, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-04-10 20:54:38.697252', '2025-04-10 20:54:38.697252', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (95, 2, '```java
package com.huizhi.service.openapi;

import cn.hutool.core.collection.ListUtil;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import java.util.List;

public class OpenApiService {
    public static void main(String[] args) {
        ApiRequest request = new ApiRequest();
        request.setAgentId(87L);
        request.setConversationId("1898918319210237967");
        request.setDistance(0.5);
        request.setEntryParameter(new EntryParameter());
        request.setMessages(ListUtil.toList(Message.builder().content("你好").role("user").build()));
        request.setCallbackUrl("https://www.baidu.com");
        // 设置请求头
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // API KEY
        headers.set("API-KEY", "YOUR_API_KEY_VALUE");
        // 创建请求实体
        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);
        RestTemplate restTemplate = new RestTemplate();
        // 发送POST请求
        ResponseEntity<String> response = restTemplate.postForEntity("https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute", entity, String.class);// 输出响应结果
        System.out.println("Response Status: " + response.getStatusCode());
        System.out.println("Response Body: " + response.getBody());
    }
    
    static class ApiRequest {
        // agentUuid/agentId 二选一
        private String agentUuid;
        private Long agentId;
        // 会话id
        private String conversationId;
        private Double distance;
        // 聊天输入变量
        private EntryParameter entryParameter;
        // 消息体
        private List<Message> messages;
        // 回调地址
        private String callbackUrl;
    }
    static class EntryParameter {
        // 插件参数
        private List<ParentParam> tools;
        // 工作流参数
        private List<ParentParam> workflows;

        static class ParentParam {
            // 插件和工作流id
            private String id;
            // 键值对
            private List<Param> params;
        }
        static class Param {
            // 键
            private String name;
            // 值
            private Object value;
            // 0业务透传；1模式识别
            private Integer source;
        }
    }
    static class Message {
        // 内容
        private String content;
        // 角色
        private String role;
    }
}
', 32, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.394379', '2025-03-19 11:10:36.394379', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (96, 3, '```http
curl -X POST \
https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \
-H "Content-Type: application/json" \
-H "API-KEY: YOUR_API_KEY_VALUE" \
-d ''{
    "agentId": 128,
    "conversationId": "1898928216899457025",
    "distance": 0.5,
    "entryParameter": {
        "tools": [
            {
                "id": "9047aa71-22ca-41dd-bb70-bc51ff4edc3a",
                "params": [
                    {
                        "name": "city",
                        "value": "",
                        "source": null
                    }
                ]
            }
        ],
        "workflows": [
            {
                "id": "9047aa71-22ca-41dd-bb70-bc51ff4edc3a",
                "params": [
                    {
                        "name": "city",
                        "value": "",
                        "source": null
                    }
                ]
            }
        ]
    },
    "messages": [
        {
            "content": "你好",
            "role": "user"
        }
    ],
    "callbackUrl": "http://www.baidu.com"
}''', 33, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.395739', '2025-03-19 11:10:36.395739', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (97, 1, '```python
import aiohttp
import asyncio

async def fetch_sse():
    # 请求 URL
    url = "https://buffgpt.agentsyun.com/api/agents_application/open/v1/sse/execute"

    # 请求头
    headers = {
        "Content-Type": "application/json",
    "API-KEY": "YOUR_API_KEY_VALUE"
    }

    # 请求体
    payload = {
    "agentId": 87,
    "conversationId": "1898918319210237967",
    "distance": 0.5,
    "entryParameter": {
        "tools": [
            {
                "id": "9047aa71-22ca-41dd-bb70-bc51ff4edc3a",
                "params": [
                    {
                        "name": "city",
                        "value": "",
                        "source": null
                    }
                ]
            }
        ],
        "workflows": [
            {
                "id": "9047aa71-22ca-41dd-bb70-bc51ff4edc3a",
                "params": [
                    {
                        "name": "city",
                        "value": "",
                        "source": null
                    }
                ]
            }
        ]
    },
    "fileList": [
        {
            "fileName": "1111.txt",
            "url": "https://wwww.sss.11111.txt"
        }
    ],
    "messages": [
        {
            "content": "你好",
            "role": "user"
        }
    ]
}

    # 创建 aiohttp 客户端会话
    async with aiohttp.ClientSession() as session:
        # 发送 POST 请求
        async with session.post(url, headers=headers, json=payload) as response:
            # 检查响应状态
            if response.status != 200:
                print(f"Error: {response.status}")
                return

            # 逐行读取 SSE 事件流
            async for line in response.content:
                # 解码字节为字符串
                line = line.decode(''utf-8'').strip()
                if line:
                    print(f"Received event: {line}")

# 运行异步任务
async def main():
    await fetch_sse()

# 启动事件循环
if __name__ == "__main__":
    asyncio.run(main())
', 41, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.396632', '2025-03-19 11:10:36.396632', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (100, 1, '```python
import requests
import json

# 请求URL
url = "https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute"

# 请求头
headers = {
    "Content-Type": "application/json",
    "API-KEY": "YOUR_API_KEY_VALUE"
}

# 请求体
data = {
    "agentId": 87,
    "memoryId": "1898918319210",
    "conversationId": "1898918319210237967",
    "distance": 0.5,
    "messages": [
        {
            "content": "你好",
            "role": "user"
        }
    ],
    "callbackUrl": "http://www.baidu.com"
}

# 发送POST请求
response = requests.post(url, headers=headers, data=json.dumps(data))

# 输出响应状态码和响应体
print("Response Status Code:", response.status_code)
print("Response Body:", response.json())', 51, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.399066', '2025-03-19 11:10:36.399066', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (101, 2, '```java
package com.huizhi.service.openapi;

import cn.hutool.core.collection.ListUtil;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import java.util.List;

public class OpenApiService {
    public static void main(String[] args) {
        ApiRequest request = new ApiRequest();
        request.setAgentId(87L);
        request.setMemoryId("18989183192102");
        request.setConversationId("1898918319210237967");
        request.setDistance(0.5);
        request.setMessages(ListUtil.toList(Message.builder().content("你好").role("user").build()));
        request.setCallbackUrl("https://www.baidu.com");
        // 设置请求头
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // API KEY
        headers.set("API-KEY", "YOUR_API_KEY_VALUE");
        // 创建请求实体
        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);
        RestTemplate restTemplate = new RestTemplate();
        // 发送POST请求
        ResponseEntity<String> response = restTemplate.postForEntity("https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute", entity, String.class);// 输出响应结果
        System.out.println("Response Status: " + response.getStatusCode());
        System.out.println("Response Body: " + response.getBody());
    }
    
    static class ApiRequest {
        // agentUuid/agentId 二选一
        private String agentUuid;
        private Long agentId;
        // 记忆id
        private String memoryId;
        // 会话id
        private String conversationId;
        private Double distance;
        // 消息体
        private List<Message> messages;
        // 回调地址
        private String callbackUrl;
    }
    static class Message {
        // 内容
        private String content;
        // 角色
        private String role;
    }
}
', 52, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.399758', '2025-03-19 11:10:36.399758', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (102, 3, '```http
curl -X POST \
https://buffgpt.agentsyun.comapi/agents_application/open/v1/execute \
-H "Content-Type: application/json" \
-H "API-KEY: YOUR_API_KEY_VALUE" \
-d ''{
    "agentId": 128,
    "memoryId": "18989282168994",
    "conversationId": "1898928216899457025",
    "distance": 0.5,
    "messages": [
        {
            "content": "你好",
            "role": "user"
        }
    ],
    "callbackUrl": "http://www.baidu.com"
}''', 53, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.400492', '2025-03-19 11:10:36.400492', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (104, 2, '```java
package com.huizhi.service.openapi;

import cn.hutool.core.collection.ListUtil;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import java.util.List;

public class OpenApiService {
    public static void main(String[] args) {
        ApiRequest request = new ApiRequest();
        request.setAgentId(87L);
        request.setConversationId("1898918319210237967");
        request.setDistance(0.5);
        request.setFileList(ListUtil.toList());
        request.setMessages(ListUtil.toList(Message.builder().content("你好").role("user").build()));
        request.setCallbackUrl("https://www.baidu.com");
        // 设置请求头
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // API KEY
        headers.set("API-KEY", "YOUR_API_KEY_VALUE");
        // 创建请求实体
        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);
        RestTemplate restTemplate = new RestTemplate();
        // 发送POST请求
        ResponseEntity<String> response = restTemplate.postForEntity("https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute", entity, String.class);// 输出响应结果
        System.out.println("Response Status: " + response.getStatusCode());
        System.out.println("Response Body: " + response.getBody());
    }
    
    static class ApiRequest {
        // agentUuid/agentId 二选一
        private String agentUuid;
        private Long agentId;
        // 会话id
        private String conversationId;
        private Double distance;
        // 文件信息
        private List<File> fileList;
        // 消息体
        private List<Message> messages;
        // 回调地址
        private String callbackUrl;
    }
    static class File {
        // 文件名称，含后缀
        private String fileName;
        // 文件链接
        private String url;
    }
    static class Message {
        // 内容
        private String content;
        // 角色
        private String role;
    }
}
', 62, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.406508', '2025-03-19 11:10:36.406508', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (105, 3, '```http
curl -X POST \
https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \
-H "Content-Type: application/json" \
-H "API-KEY: YOUR_API_KEY_VALUE" \
-d ''{
    "agentId": 128,
    "conversationId": "1898928216899457025",
    "distance": 0.5,
    "fileList": [
        {
            "fileName": "1111.txt",
            "url": "https://wwww.sss.11111.txt"
        }
    ],
    "messages": [
        {
            "content": "你好",
            "role": "user"
        }
    ],
    "callbackUrl": "http://www.baidu.com"
}''', 63, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.40765', '2025-03-19 11:10:36.40765', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (106, 4, '```python
import requests

# 定义URL和agentId
url = "https://buffgpt.agentsyun.com/open/v1/uploadFile"
agent_id = "73"

# 定义文件路径
file_path = "file_path"  # 请将此路径替换为你要上传的文件路径

# 定义请求头，包括API-KEY
headers = {
    "API-KEY": "ak-XXXXXXXXXXXX"
}

# 构造请求参数
files = {
    ''file'': open(file_path, ''rb'')
}
params = {
    ''agentId'': agent_id
}

# 发送POST请求
response = requests.post(url, files=files, params=params, headers=headers)

# 打印响应结果
print("Status Code:", response.status_code)
print("Response Body:", response.text)

# 关闭文件
files[''file''].close()', 610, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.408457', '2025-03-19 11:10:36.408457', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (109, 1, '阿里云', 1, 22, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:11:18.412047', '2025-03-19 11:11:18.412047', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (110, 2, '腾讯', 2, 22, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:11:18.478725', '2025-03-19 11:11:18.478725', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (111, 3, '云片', 3, 22, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:11:18.480382', '2025-03-19 11:11:18.480382', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (94, 1, '```python
import requests
import json

# 请求URL
url = "https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute"

# 请求头
headers = {
    "Content-Type": "application/json",
    "API-KEY": "YOUR_API_KEY_VALUE"
}
# 请求体
data = {
    "agentId": 87,
    "conversationId": "1898918319210237967",
    "distance": 0.5,
    "entryParameter": {
        "tools": [
            {
                "id": "9047aa71-22ca-41dd-bb70-bc51ff4edc3a",
                "params": [
                    {
                        "name": "city",
                        "value": "",
                        "source": null
                    }
                ]
            }
        ],
        "workflows": [
            {
                "id": "9047aa71-22ca-41dd-bb70-bc51ff4edc3a",
                "params": [
                    {
                        "name": "city",
                        "value": "",
                        "source": null
                    }
                ]
            }
        ]
    },
    "messages": [
        {
            "content": "你好",
            "role": "user"
        }
    ],
    "callbackUrl": "http://www.baidu.com"
}

# 发送POST请求
response = requests.post(url, headers=headers, data=json.dumps(data))

# 输出响应状态码和响应体
print("Response Status Code:", response.status_code)
print("Response Body:", response.json())', 31, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.392105', '2025-03-19 11:10:36.392105', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (98, 2, '```java
package com.huizhi.service.openapi;

import cn.hutool.core.collection.ListUtil;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import java.util.List;

public class OpenApiService {
    public static void main(String[] args) {
        ApiRequest request = new ApiRequest();
        request.setAgentId(87L);
        request.setConversationId("1898918319210237967");
        request.setDistance(0.5);
        request.setEntryParameter(new EntryParameter());
        request.setFileList(ListUtil.toList());
        request.setMessages(ListUtil.toList(Message.builder().content("你好").role("user").build()));
        // 设置请求头
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // API KEY
        headers.set("API-KEY", "YOUR_API_KEY_VALUE");
        // 创建 WebClient
        WebClient webClient = WebClient.builder()
                .baseUrl("https://buffgpt.agentsyun.com/api/agents_application/open/v1/sse/execute")
                .defaultHeaders(httpHeaders -> httpHeaders.addAll(headers))
                .build();
                // 发送 SSE 请求
        Flux<ServerSentEvent<String>> eventStream = webClient.post()
                .bodyValue(request)
                .accept(MediaType.TEXT_EVENT_STREAM)
                .retrieve()
                .bodyToFlux(ServerSentEvent.class);

        // 处理 SSE 事件
        eventStream.subscribe(
                event -> {
                    System.out.println("Received event: " + event.data());
                },
                error -> {
                    System.err.println("Error occurred: " + error.getMessage());
                },
                () -> {
                    System.out.println("SSE stream completed.");
                }
        );

        // 保持主线程不退出（SSE 是异步的）
        try {
            Thread.sleep(60000); // 等待 60 秒
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    static class ApiRequest {

        private String agentUuid;

        private Long agentId;

        private String memoryId;

        /**
         * 会话id
         */
        private String conversationId;

        private Double distance;

        /**
         * 聊天输入变量
         */
        private EntryParameter entryParameter;

        /**
         * 文件信息
         */
        private List<File> fileList;

        /**
         * 消息体
         */
        private List<Message> messages;

        /**
         * 回调地址
         */
        private String callbackUrl;
    }
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    static class EntryParameter {
        /**
         * 插件参数
         */
        private List<ParentParam> tools;
        /**
         * 工作流参数
         */
        private List<ParentParam> workflows;

        static class ParentParam {
            /**
             * 插件和工作流id
             */
            private String id;
            /**
             * 键值对
             */
            private List<Param> params;
        }

        static class Param {

            /**
             * 键
             */
            private String name;

            /**
             * 值
             */
            private Object value;
            /**
             * 0业务透传；1模式识别
             */
            private Integer source;
        }

    }
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    static class File {
        /**
         * 文件名称，含后缀
         */
        private String fileName;
        /**
         * 文件链接
         */
        private String url;
    }
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    static class Message {
        /**
         * 内容
         */
        private String content;
        /**
         * 角色
         */
        private String role;
    }
}', 42, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.397418', '2025-03-19 11:10:36.397418', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (99, 3, '```http
curl -N -X POST \
https://buffgpt.agentsyun.com/api/agents_application/open/v1/sse/execute \
-H "Content-Type: application/json" \
-H "API-KEY: YOUR_API_KEY_VALUE" \
-d ''{
    "agentId": 128,
    "conversationId": "1898928216899457025",
    "distance": 0.5,
    "entryParameter": {
        "tools": [
            {
                "id": "9047aa71-22ca-41dd-bb70-bc51ff4edc3a",
                "params": [
                    {
                        "name": "city",
                        "value": "",
                        "source": null
                    }
                ]
            }
        ],
        "workflows": [
            {
                "id": "9047aa71-22ca-41dd-bb70-bc51ff4edc3a",
                "params": [
                    {
                        "name": "city",
                        "value": "",
                        "source": null
                    }
                ]
            }
        ]
    },
    "fileList": [
        {
            "fileName": "1111.txt",
            "url": "https://wwww.sss.11111.txt"
        }
    ],
    "messages": [
        {
            "content": "你好",
            "role": "user"
        }
    ]
}''

-N：禁用缓冲，确保实时接收 SSE 事件。', 43, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.398235', '2025-03-19 11:10:36.398235', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (108, 6, '```http
curl -X POST \
  https://buffgpt.agentsyun.com/open/v1/uploadFile?agentId=73 \
  -H "Content-Type: multipart/form-data" \
  -H "API-KEY: YOUR_API_KEY_VALUE" \
  -F "file=@/home/user/documents/test.txt"', 630, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.409883', '2025-03-19 11:10:36.409883', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (103, 1, '```python
import requests
import json

# 请求URL
url = "https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute"

# 请求头
headers = {
    "Content-Type": "application/json",
    "API-KEY": "YOUR_API_KEY_VALUE"
}

# 请求体
data = {
    "agentId": 87,
    "conversationId": "1898918319210237967",
    "distance": 0.5,
    "fileList": [
        {
            "fileName": "1111.txt",
            "url": "https://wwww.sss.11111.txt"
        }
    ],
    "messages": [
        {
            "content": "你好",
            "role": "user"
        }
    ],
    "callbackUrl": "http://www.baidu.com"
}

# 发送POST请求
response = requests.post(url, headers=headers, data=json.dumps(data))

# 输出响应状态码和响应体
print("Response Status Code:", response.status_code)
print("Response Body:", response.json())', 61, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.401356', '2025-03-19 11:10:36.401356', '0', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (107, 5, '```java
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import java.io.File;

public class FileUploadService {
    public static void main(String[] args) {
        // 创建文件资源
        FileSystemResource fileResource = new FileSystemResource(new File(filePath));

        // 构建请求体
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        body.add("file", fileResource);

        // 设置请求头
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);
        // API KEY
        headers.set("API-KEY", "YOUR_API_KEY_VALUE");

        // 创建 HttpEntity
        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

        private RestTemplate restTemplate;
        // 发送请求并获取响应
        ResponseEntity<String> response = restTemplate.postForEntity("https://buffgpt.agentsyun.com/open/v1/uploadFile?agentId=73", requestEntity, String.class);

        // 获取响应状态码和响应内容
        int statusCode = response.getStatusCodeValue();
        String responseBody = response.getBody();

        System.out.println("Response Status Code: " + statusCode);
        System.out.println("Response Body: " + responseBody);
    }
}', 620, 21, NULL, NULL, 'N', '0', NULL, 0, 0, 0, 0, '2025-03-19 11:10:36.409177', '2025-03-19 11:10:36.409177', '0', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_type";
CREATE TABLE "public"."sys_dict_type" (
  "dict_id" int8 NOT NULL DEFAULT nextval('sys_dict_type_dict_id_seq'::regclass),
  "dict_name" varchar(100) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "dict_type" varchar(100) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "status" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "productline" int8,
  "dict_level" int2 DEFAULT 0,
  "create_by" int8 NOT NULL DEFAULT 0,
  "update_by" int8 NOT NULL DEFAULT 0,
  "create_by_productline" int8 NOT NULL DEFAULT 0,
  "update_by_productline" int8 NOT NULL DEFAULT 0,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6),
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "remark" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON COLUMN "public"."sys_dict_type"."dict_id" IS '字典主键';
COMMENT ON COLUMN "public"."sys_dict_type"."dict_name" IS '字典名称';
COMMENT ON COLUMN "public"."sys_dict_type"."dict_type" IS '字典类型';
COMMENT ON COLUMN "public"."sys_dict_type"."status" IS '状态（0正常 1停用）';
COMMENT ON COLUMN "public"."sys_dict_type"."productline" IS '产品线';
COMMENT ON COLUMN "public"."sys_dict_type"."dict_level" IS '字典等级：0-系统级，1用户级';
COMMENT ON COLUMN "public"."sys_dict_type"."create_by" IS '创建人';
COMMENT ON COLUMN "public"."sys_dict_type"."update_by" IS '修改人';
COMMENT ON COLUMN "public"."sys_dict_type"."create_by_productline" IS '创建人产品线';
COMMENT ON COLUMN "public"."sys_dict_type"."update_by_productline" IS '修改人产品线';
COMMENT ON COLUMN "public"."sys_dict_type"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict_type"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dict_type"."del_flag" IS '删除标记，0未删除，1已删除';
COMMENT ON COLUMN "public"."sys_dict_type"."remark" IS '备注';
COMMENT ON TABLE "public"."sys_dict_type" IS '字典类型表';


-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO "public"."sys_dict_type" VALUES (1, '违规原因', 'com.huizhi.agent.prompt.api.enums.ViolationReasonEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-01-06 15:42:25', '2025-01-16 20:08:03', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (2, '模板类型', 'com.huizhi.agent.prompt.api.enums.TemplateTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-01-13 16:59:27', '2025-01-16 20:08:04', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (3, '模板分类', 'com.huizhi.agent.prompt.api.enums.TemplateClassifyEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-01-13 17:04:09', '2025-01-16 20:08:04', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (5, 'Api通用信息', 'com.huizhi.agent.dict.api.enums.CommonApiEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-01-17 16:03:11', '2025-01-17 16:03:11', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (6, '工作流状态', 'com.huizhi.agent.workflow.api.enums.WorkflowStateEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-01-17 16:03:11', '2025-01-17 16:03:11', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (7, '知识库处理状态', 'com.huizhi.agent.knowledge.api.enums.knowledge.KnowledgeDealStatudEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-01-20 15:55:44', '2025-01-20 15:55:44', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (8, '编码名称', 'com.huizhi.agent.knowledge.api.enums.knowledge.EncodingNameEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-01-20 15:55:44', '2025-01-20 15:55:44', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (9, '模型类型', 'com.huizhi.agent.model.api.enums.model.ModelTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-01-22 10:48:50', '2025-01-22 10:48:50', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (10, '鉴权方式', 'com.huizhi.agent.model.api.enums.commercialicense.licenseModeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-01-22 10:48:51', '2025-01-22 10:48:51', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (11, '应用类型', 'com.huizhi.agent.agents_app.api.enums.AgentTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-02-21 15:22:57', '2025-02-21 15:22:57', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (12, '应用违规原因类型', 'com.huizhi.agent.agents_app.api.enums.AgentIllegalCauseTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-02-21 16:52:15', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (13, 'api key open状态类型', 'com.huizhi.agent.agents_app.api.enums.ApiKeyOpenTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-02-28 15:41:08', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (14, '规则条件类型', 'com.huizhi.agent.agents_app.api.enums.ConditionTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-03-01 16:30:51', '2025-03-01 16:30:51', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (15, 'api key 有效期状态类型', 'com.huizhi.agent.agents_app.api.enums.ApiKeyPeriodOfValidityTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-03-01 16:30:51', '2025-03-01 16:30:51', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (16, '供应商类型', 'com.huizhi.agent.model.api.enums.supplier.SupplierTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-03-03 13:58:31', '2025-03-03 13:58:31', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (17, '插件类型', 'com.huizhi.agent.model.api.enums.plug.PlugTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-03-03 14:10:10', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (18, '插件状态', 'com.huizhi.agent.model.api.enums.plug.PlugStatusEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-03-03 17:22:16', '2025-03-03 17:22:16', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (19, 'API代码示例类型', 'com.huizhi.agent.agents_app.api.enums.CodeExampleBizTypeEnums', '0', NULL, 0, 0, 0, 0, 0, '2025-03-03 17:22:16', '2025-03-03 17:22:16', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (20, 'API代码示例语言类型', 'com.huizhi.agent.agents_app.api.enums.CodeExampleCodeTypeEnums', '0', NULL, 0, 0, 0, 0, 0, '2025-03-03 17:22:16', '2025-03-03 17:22:16', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (21, '代码示例代码片段枚举', 'com.huizhi.agent.agents_app.api.enums.CodeExampleSnippetsEnums', '0', NULL, 0, 0, 0, 0, 0, '2025-03-10 12:03:46.923604', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (22, '短信账户类型', 'com.huizhi.agent.message.api.enums.SmsAccountTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-03-13 06:22:31.850554', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (23, '应用类型', 'com.huizhi.agent.agents_app.api.enums.ApplicationTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-04-10 19:16:52.779325', '2025-04-10 19:16:52.779325', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (25, '数据库类型', 'com.huizhi.agent.module.api.enums.DbTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-04-10 20:54:38.31252', '2025-04-10 20:54:38.31252', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (26, 'PG数据库类型', 'com.huizhi.agent.module.api.enums.PostgressTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-04-10 20:54:38.423209', '2025-04-10 20:54:38.423209', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (27, 'MYSQL数据库类型', 'com.huizhi.agent.module.api.enums.MysqlTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-04-10 20:54:38.545144', '2025-04-10 20:54:38.545144', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (28, '应用违规原因类型', 'com.huizhi.agent.module.api.enums.McpIllegalCauseTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-04-30 18:19:24.867783', '2025-04-30 18:19:24.867783', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (29, 'MCP应用场景 类型', 'com.huizhi.agent.module.api.enums.McpSceneTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-04-30 18:19:24.952261', '2025-04-30 18:19:24.952261', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (30, 'MCP发布状态 类型', 'com.huizhi.agent.module.api.enums.McpStatusDictEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-04-30 18:19:25.102026', '2025-04-30 18:19:25.102026', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (31, 'MCP运行状态 类型', 'com.huizhi.agent.module.api.enums.McpRunningStatusEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-04-30 18:19:25.123279', '2025-04-30 18:19:25.123279', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (32, 'mcp 回调地址', 'com.huizhi.agent.module.api.enums.McpRunningStatusCallbackUrl', '0', NULL, 0, 0, 0, 0, 0, '2025-04-30 18:19:25.415412', '2025-04-30 18:19:25.415412', '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (33, '插件违规原因类型', 'com.huizhi.agent.model.api.enums.plug.PluginIllegalCauseTypeEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-05-07 15:24:03', NULL, '0', NULL);
INSERT INTO "public"."sys_dict_type" VALUES (34, '站内信消息模板', 'com.huizhi.agent.message.api.enums.userinnermessage.UserInnerMessageTemplateEnum', '0', NULL, 0, 0, 0, 0, 0, '2025-05-17 15:26:04.644363', '2025-05-17 15:26:04.644363', '0', NULL);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."audit_log_id_seq"
OWNED BY "public"."audit_log"."id";
SELECT setval('"public"."audit_log_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."oss_file_id_seq"
OWNED BY "public"."oss_file"."id";
SELECT setval('"public"."oss_file_id_seq"', 1949, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_dict_data_id_seq"
OWNED BY "public"."sys_dict_data"."id";
SELECT setval('"public"."sys_dict_data_id_seq"', 175, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_dict_type_dict_id_seq"
OWNED BY "public"."sys_dict_type"."dict_id";
SELECT setval('"public"."sys_dict_type_dict_id_seq"', 34, true);

-- ----------------------------
-- Primary Key structure for table audit_log
-- ----------------------------
ALTER TABLE "public"."audit_log" ADD CONSTRAINT "audit_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table oss_file
-- ----------------------------
ALTER TABLE "public"."oss_file" ADD CONSTRAINT "oss_file_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_dict_data
-- ----------------------------
ALTER TABLE "public"."sys_dict_data" ADD CONSTRAINT "sys_dict_data_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_dict_type
-- ----------------------------
CREATE UNIQUE INDEX "dict_type_idx" ON "public"."sys_dict_type" USING btree (
  "dict_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_dict_type
-- ----------------------------
ALTER TABLE "public"."sys_dict_type" ADD CONSTRAINT "sys_dict_type_pkey" PRIMARY KEY ("dict_id");
