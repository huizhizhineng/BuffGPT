/*
 Navicat Premium Dump SQL

 Source Server         : buffgpt_pg_prod
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 118.31.113.98:17506
 Source Catalog        : agents_knowledge
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 16/06/2025 11:37:50
*/


-- ----------------------------
-- Sequence structure for knowledge_base_file_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."knowledge_base_file_id_seq";
CREATE SEQUENCE "public"."knowledge_base_file_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for knowledge_base_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."knowledge_base_id_seq";
CREATE SEQUENCE "public"."knowledge_base_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for knowledge_base
-- ----------------------------
DROP TABLE IF EXISTS "public"."knowledge_base";
CREATE TABLE "public"."knowledge_base" (
  "id" int4 NOT NULL DEFAULT nextval('knowledge_base_id_seq'::regclass),
  "knowledge_no" varchar(64) COLLATE "pg_catalog"."default",
  "source_uuid" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "deal_status" int2,
  "file_total_num" int8 DEFAULT 0,
  "file_total_size" int8 DEFAULT 0,
  "file_total_character_num" int8 DEFAULT 0,
  "file_total_segmentation" int8 DEFAULT 0,
  "file_created_time" timestamp(6),
  "tenant_id" int8,
  "product_line" int8 NOT NULL DEFAULT 0,
  "del" bool NOT NULL DEFAULT false,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."knowledge_base"."knowledge_no" IS '知识库编号';
COMMENT ON COLUMN "public"."knowledge_base"."source_uuid" IS 'fastai知识库id';
COMMENT ON COLUMN "public"."knowledge_base"."name" IS '知识库名字';
COMMENT ON COLUMN "public"."knowledge_base"."deal_status" IS '处理状态：0、待处理 1、处理中 2、处理完成 3、处理失败';
COMMENT ON TABLE "public"."knowledge_base" IS '知识库表';

-- ----------------------------
-- Table structure for knowledge_base_file
-- ----------------------------
DROP TABLE IF EXISTS "public"."knowledge_base_file";
CREATE TABLE "public"."knowledge_base_file" (
  "id" int4 NOT NULL DEFAULT nextval('knowledge_base_file_id_seq'::regclass),
  "knowledge_file_no" varchar(64) COLLATE "pg_catalog"."default",
  "name" varchar(500) COLLATE "pg_catalog"."default",
  "uuid" varchar(255) COLLATE "pg_catalog"."default",
  "base_id" int8 NOT NULL,
  "document_id" varchar(255) COLLATE "pg_catalog"."default",
  "file_format" varchar(30) COLLATE "pg_catalog"."default",
  "size" int4,
  "processing_status" int4,
  "import_status" int4,
  "segmentation_type" int4,
  "splitter" varchar(255) COLLATE "pg_catalog"."default",
  "splitter_params" text COLLATE "pg_catalog"."default",
  "chunk_number" int4,
  "oss_url" varchar(1024) COLLATE "pg_catalog"."default",
  "tenant_id" int8,
  "product_line" int8 NOT NULL DEFAULT 0,
  "del" bool NOT NULL DEFAULT false,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0,
  "split_type" int4 DEFAULT 0,
  "graph_updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "graph_canvas" text COLLATE "pg_catalog"."default",
  "graph_status" int4,
  "graph_entity_types" text COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."knowledge_base_file"."knowledge_file_no" IS '文件编号';
COMMENT ON COLUMN "public"."knowledge_base_file"."name" IS '知识文件名字';
COMMENT ON COLUMN "public"."knowledge_base_file"."processing_status" IS '文件处理状态：1、处理中 2、处理完成 3、处理失败';
COMMENT ON COLUMN "public"."knowledge_base_file"."import_status" IS '1.本地上传';
COMMENT ON COLUMN "public"."knowledge_base_file"."segmentation_type" IS '分段方式：1、默认分段 2、自定义分段';
COMMENT ON COLUMN "public"."knowledge_base_file"."splitter" IS '分割器';
COMMENT ON COLUMN "public"."knowledge_base_file"."split_type" IS '文件分割方式，0正常分割 1 qa对分割';
COMMENT ON COLUMN "public"."knowledge_base_file"."graph_updated_time" IS '知识图谱更新时间';
COMMENT ON COLUMN "public"."knowledge_base_file"."graph_canvas" IS '知识图谱画布';
COMMENT ON COLUMN "public"."knowledge_base_file"."graph_status" IS '知识图谱状态';
COMMENT ON COLUMN "public"."knowledge_base_file"."graph_entity_types" IS '知识图谱实体类型';
COMMENT ON TABLE "public"."knowledge_base_file" IS '知识库文件表';

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."knowledge_base_file_id_seq"
OWNED BY "public"."knowledge_base_file"."id";
SELECT setval('"public"."knowledge_base_file_id_seq"', 582, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."knowledge_base_id_seq"
OWNED BY "public"."knowledge_base"."id";
SELECT setval('"public"."knowledge_base_id_seq"', 297, true);

-- ----------------------------
-- Primary Key structure for table knowledge_base
-- ----------------------------
ALTER TABLE "public"."knowledge_base" ADD CONSTRAINT "knowledge_base_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table knowledge_base_file
-- ----------------------------
ALTER TABLE "public"."knowledge_base_file" ADD CONSTRAINT "knowledge_base_file_pkey" PRIMARY KEY ("id");
