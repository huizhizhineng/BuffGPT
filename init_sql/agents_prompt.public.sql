/*
 Navicat Premium Dump SQL

 Source Server         : buffgpt_pg_prod
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 118.31.113.98:17506
 Source Catalog        : agents_prompt
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 16/06/2025 11:50:15
*/


-- ----------------------------
-- Sequence structure for prompts_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."prompts_info_id_seq";
CREATE SEQUENCE "public"."prompts_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for prompts_template_square_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."prompts_template_square_id_seq";
CREATE SEQUENCE "public"."prompts_template_square_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for prompts_template_violation_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."prompts_template_violation_info_id_seq";
CREATE SEQUENCE "public"."prompts_template_violation_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for prompts_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."prompts_info";
CREATE TABLE "public"."prompts_info" (
  "id" int8 NOT NULL DEFAULT nextval('prompts_info_id_seq'::regclass),
  "prompt_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "prompt_logo" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" int8 NOT NULL,
  "prompt_api_no" int8 NOT NULL,
  "prompt_no" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "product_line" int8 NOT NULL DEFAULT 0,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "del" bool NOT NULL DEFAULT false,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."prompts_info"."id" IS '主键';
COMMENT ON COLUMN "public"."prompts_info"."prompt_name" IS '提示词名称';
COMMENT ON COLUMN "public"."prompts_info"."prompt_logo" IS '提示词logo';
COMMENT ON COLUMN "public"."prompts_info"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."prompts_info"."prompt_api_no" IS '提示词Api的唯一标识';
COMMENT ON COLUMN "public"."prompts_info"."prompt_no" IS '提示词编码';
COMMENT ON COLUMN "public"."prompts_info"."product_line" IS '产品线';
COMMENT ON COLUMN "public"."prompts_info"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."prompts_info"."creator" IS '创建人';
COMMENT ON COLUMN "public"."prompts_info"."del" IS '是否删除';
COMMENT ON COLUMN "public"."prompts_info"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."prompts_info"."updater" IS '更新人';
COMMENT ON TABLE "public"."prompts_info" IS '提示词信息';

-- ----------------------------
-- Table structure for prompts_template_square
-- ----------------------------
DROP TABLE IF EXISTS "public"."prompts_template_square";
CREATE TABLE "public"."prompts_template_square" (
  "id" int8 NOT NULL DEFAULT nextval('prompts_template_square_id_seq'::regclass),
  "prompt_api_no" int8 NOT NULL,
  "tenant_id" int8 NOT NULL,
  "prompt_template_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "prompt_template_logo" varchar(255) COLLATE "pg_catalog"."default",
  "prompt_template_no" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "product_line" int8 NOT NULL DEFAULT 0,
  "release_time" timestamp(6),
  "publisher" int8 NOT NULL,
  "template_type" int2 NOT NULL,
  "template_classification" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "release_status" int2 NOT NULL,
  "sort_no" int8 NOT NULL DEFAULT 0,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "del" bool NOT NULL DEFAULT false,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."prompts_template_square"."id" IS '主键';
COMMENT ON COLUMN "public"."prompts_template_square"."prompt_api_no" IS '提示词API唯一标识';
COMMENT ON COLUMN "public"."prompts_template_square"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."prompts_template_square"."prompt_template_name" IS '提示词模板名称';
COMMENT ON COLUMN "public"."prompts_template_square"."prompt_template_logo" IS '提示词模板logo';
COMMENT ON COLUMN "public"."prompts_template_square"."prompt_template_no" IS '提示词模板编码';
COMMENT ON COLUMN "public"."prompts_template_square"."product_line" IS '产品线';
COMMENT ON COLUMN "public"."prompts_template_square"."release_time" IS '发布时间';
COMMENT ON COLUMN "public"."prompts_template_square"."publisher" IS '发布者';
COMMENT ON COLUMN "public"."prompts_template_square"."template_type" IS '模板类型：1-文本生成，2-图片生成';
COMMENT ON COLUMN "public"."prompts_template_square"."template_classification" IS '模板分类：见枚举,多个都好隔开';
COMMENT ON COLUMN "public"."prompts_template_square"."release_status" IS '发布状态:0-已下架，1-已发布，3-违规';
COMMENT ON COLUMN "public"."prompts_template_square"."sort_no" IS '排序';
COMMENT ON COLUMN "public"."prompts_template_square"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."prompts_template_square"."creator" IS '创建人';
COMMENT ON COLUMN "public"."prompts_template_square"."del" IS '是否删除';
COMMENT ON COLUMN "public"."prompts_template_square"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."prompts_template_square"."updater" IS '更新人';
COMMENT ON TABLE "public"."prompts_template_square" IS '提示词模板广场';

-- ----------------------------
-- Table structure for prompts_template_violation_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."prompts_template_violation_info";
CREATE TABLE "public"."prompts_template_violation_info" (
  "id" int8 NOT NULL DEFAULT nextval('prompts_template_violation_info_id_seq'::regclass),
  "prompt_template_id" int8 NOT NULL,
  "prompt_template_no" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "cause_of_violation" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "violation_details" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "image_attachment" varchar(255) COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "del" bool NOT NULL DEFAULT false,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."prompts_template_violation_info"."id" IS '主键';
COMMENT ON COLUMN "public"."prompts_template_violation_info"."prompt_template_id" IS '提示词ID';
COMMENT ON COLUMN "public"."prompts_template_violation_info"."prompt_template_no" IS '提示词编码';
COMMENT ON COLUMN "public"."prompts_template_violation_info"."cause_of_violation" IS '违规原因';
COMMENT ON COLUMN "public"."prompts_template_violation_info"."violation_details" IS '违规详细信息';
COMMENT ON COLUMN "public"."prompts_template_violation_info"."image_attachment" IS '图片附件';
COMMENT ON COLUMN "public"."prompts_template_violation_info"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."prompts_template_violation_info"."creator" IS '创建人';
COMMENT ON COLUMN "public"."prompts_template_violation_info"."del" IS '是否删除';
COMMENT ON COLUMN "public"."prompts_template_violation_info"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."prompts_template_violation_info"."updater" IS '更新人';
COMMENT ON TABLE "public"."prompts_template_violation_info" IS '提示词模板违规信息';

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."prompts_info_id_seq"
OWNED BY "public"."prompts_info"."id";
SELECT setval('"public"."prompts_info_id_seq"', 345, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."prompts_template_square_id_seq"
OWNED BY "public"."prompts_template_square"."id";
SELECT setval('"public"."prompts_template_square_id_seq"', 123, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."prompts_template_violation_info_id_seq"
OWNED BY "public"."prompts_template_violation_info"."id";
SELECT setval('"public"."prompts_template_violation_info_id_seq"', 6, true);

-- ----------------------------
-- Primary Key structure for table prompts_info
-- ----------------------------
ALTER TABLE "public"."prompts_info" ADD CONSTRAINT "prompts_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table prompts_template_square
-- ----------------------------
ALTER TABLE "public"."prompts_template_square" ADD CONSTRAINT "prompts_template_square_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table prompts_template_violation_info
-- ----------------------------
ALTER TABLE "public"."prompts_template_violation_info" ADD CONSTRAINT "prompts_template_violation_info_pkey" PRIMARY KEY ("id");
