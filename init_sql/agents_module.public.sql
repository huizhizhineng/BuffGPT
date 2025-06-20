/*
 Navicat Premium Dump SQL

 Source Server         : buffgpt_pg_prod
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 118.31.113.98:17506
 Source Catalog        : agents_module
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 16/06/2025 11:49:54
*/


-- ----------------------------
-- Sequence structure for database_config_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."database_config_id_seq";
CREATE SEQUENCE "public"."database_config_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for mcp_collection_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."mcp_collection_id_seq";
CREATE SEQUENCE "public"."mcp_collection_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for mcp_service_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."mcp_service_id_seq";
CREATE SEQUENCE "public"."mcp_service_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for database_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."database_config";
CREATE TABLE "public"."database_config" (
  "id" int8 NOT NULL DEFAULT nextval('database_config_id_seq'::regclass),
  "db_no" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "db_uuid" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "tenant_id" int8 NOT NULL DEFAULT 0,
  "productline" int8 NOT NULL DEFAULT 0,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "del" bool NOT NULL DEFAULT false,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."database_config"."id" IS '主键';
COMMENT ON COLUMN "public"."database_config"."db_no" IS '数据库编号';
COMMENT ON COLUMN "public"."database_config"."name" IS '数据库名称';
COMMENT ON COLUMN "public"."database_config"."db_uuid" IS 'uuid';
COMMENT ON COLUMN "public"."database_config"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."database_config"."productline" IS '产品线';
COMMENT ON COLUMN "public"."database_config"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."database_config"."creator" IS '创建人';
COMMENT ON COLUMN "public"."database_config"."del" IS '是否删除';
COMMENT ON COLUMN "public"."database_config"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."database_config"."updater" IS '更新人';
COMMENT ON TABLE "public"."database_config" IS '数据库连接配置信息表';

-- ----------------------------
-- Table structure for mcp_collection
-- ----------------------------
DROP TABLE IF EXISTS "public"."mcp_collection";
CREATE TABLE "public"."mcp_collection" (
  "id" int8 NOT NULL DEFAULT nextval('mcp_collection_id_seq'::regclass),
  "mcp_id" int8 NOT NULL,
  "mcp_no" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" int8 NOT NULL,
  "api_key_value" varchar(255) COLLATE "pg_catalog"."default",
  "tenant_id" int8 NOT NULL DEFAULT 0,
  "productline" int8 NOT NULL DEFAULT 0,
  "created_time" timestamp(6),
  "sub_uuid" varchar(255) COLLATE "pg_catalog"."default",
  "collection_if" bool
)
;
COMMENT ON COLUMN "public"."mcp_collection"."mcp_id" IS 'mcp_id';
COMMENT ON COLUMN "public"."mcp_collection"."mcp_no" IS 'mcp编号';
COMMENT ON COLUMN "public"."mcp_collection"."user_id" IS '用户id';
COMMENT ON COLUMN "public"."mcp_collection"."api_key_value" IS 'api key 参数值';
COMMENT ON COLUMN "public"."mcp_collection"."tenant_id" IS '所属租户ID';
COMMENT ON COLUMN "public"."mcp_collection"."productline" IS '产品线';
COMMENT ON COLUMN "public"."mcp_collection"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."mcp_collection"."sub_uuid" IS '收藏关联uuid';
COMMENT ON COLUMN "public"."mcp_collection"."collection_if" IS '是否收藏';
COMMENT ON TABLE "public"."mcp_collection" IS 'MCP Collection Table';

-- ----------------------------
-- Table structure for mcp_service
-- ----------------------------
DROP TABLE IF EXISTS "public"."mcp_service";
CREATE TABLE "public"."mcp_service" (
  "id" int8 NOT NULL DEFAULT nextval('mcp_service_id_seq'::regclass),
  "mcp_no" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "avatar" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "server_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "application_scenarios" int4,
  "description" text COLLATE "pg_catalog"."default",
  "service_type" int2 NOT NULL,
  "auth_type" int2 NOT NULL,
  "api_key" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "config_info" text COLLATE "pg_catalog"."default",
  "delisting_cause" int4,
  "delisting_info" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "delisting_image" text COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "mcp_status" int4,
  "is_publicity" int4,
  "uuid" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "online_if" int4,
  "tenant_id" int8 NOT NULL DEFAULT 0,
  "productline" int8 NOT NULL DEFAULT 0,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "del" bool NOT NULL DEFAULT false,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0,
  "publish_time" timestamp(6),
  "brief" text COLLATE "pg_catalog"."default",
  "sold_out_time" timestamp(6),
  "api_key_value" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."mcp_service"."id" IS '主键 ID，自增';
COMMENT ON COLUMN "public"."mcp_service"."mcp_no" IS 'MCP编号';
COMMENT ON COLUMN "public"."mcp_service"."avatar" IS '服务 Logo 的 URL 地址';
COMMENT ON COLUMN "public"."mcp_service"."server_name" IS 'MCP 服务名称';
COMMENT ON COLUMN "public"."mcp_service"."application_scenarios" IS '应用场景名称0、地图服务 1、内容生成 2、办公工具 3、效率工具 4、网页搜索';
COMMENT ON COLUMN "public"."mcp_service"."description" IS '服务描述信息';
COMMENT ON COLUMN "public"."mcp_service"."service_type" IS '服务类型：0、STDIO 1、SSE';
COMMENT ON COLUMN "public"."mcp_service"."auth_type" IS 'API KEY 类型  0、开放使用 1、平台认证 2、第三方认证';
COMMENT ON COLUMN "public"."mcp_service"."api_key" IS 'key参数名称';
COMMENT ON COLUMN "public"."mcp_service"."config_info" IS '合成的参数';
COMMENT ON COLUMN "public"."mcp_service"."delisting_cause" IS '下架原因';
COMMENT ON COLUMN "public"."mcp_service"."delisting_info" IS '下架详细信息';
COMMENT ON COLUMN "public"."mcp_service"."delisting_image" IS '下架图片';
COMMENT ON COLUMN "public"."mcp_service"."mcp_status" IS '状态：1-未发布，2-已发布，3-已删除，4-已下架 5-违规下架';
COMMENT ON COLUMN "public"."mcp_service"."is_publicity" IS '公开状态';
COMMENT ON COLUMN "public"."mcp_service"."uuid" IS 'uuid';
COMMENT ON COLUMN "public"."mcp_service"."online_if" IS '在线状态 0 离线 1 在线';
COMMENT ON COLUMN "public"."mcp_service"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."mcp_service"."productline" IS '产品线';
COMMENT ON COLUMN "public"."mcp_service"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."mcp_service"."creator" IS '创建人';
COMMENT ON COLUMN "public"."mcp_service"."del" IS '是否删除';
COMMENT ON COLUMN "public"."mcp_service"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."mcp_service"."updater" IS '更新人';
COMMENT ON COLUMN "public"."mcp_service"."publish_time" IS '发布时间';
COMMENT ON COLUMN "public"."mcp_service"."brief" IS 'mcp 简介';
COMMENT ON COLUMN "public"."mcp_service"."sold_out_time" IS '下架时间';
COMMENT ON COLUMN "public"."mcp_service"."api_key_value" IS 'api key value';
COMMENT ON TABLE "public"."mcp_service" IS 'MCP 服务定义表';

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."database_config_id_seq"
OWNED BY "public"."database_config"."id";
SELECT setval('"public"."database_config_id_seq"', 28, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."mcp_collection_id_seq"
OWNED BY "public"."mcp_collection"."id";
SELECT setval('"public"."mcp_collection_id_seq"', 42, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."mcp_service_id_seq"
OWNED BY "public"."mcp_service"."id";
SELECT setval('"public"."mcp_service_id_seq"', 190, true);

-- ----------------------------
-- Primary Key structure for table database_config
-- ----------------------------
ALTER TABLE "public"."database_config" ADD CONSTRAINT "database_config_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mcp_collection
-- ----------------------------
ALTER TABLE "public"."mcp_collection" ADD CONSTRAINT "mcp_collection_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mcp_service
-- ----------------------------
ALTER TABLE "public"."mcp_service" ADD CONSTRAINT "mcp_service_pkey" PRIMARY KEY ("id");
