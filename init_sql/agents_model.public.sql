/*
 Navicat Premium Dump SQL

 Source Server         : buffgpt_pg_prod
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 118.31.113.98:17506
 Source Catalog        : agents_model
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 16/06/2025 11:49:19
*/


-- ----------------------------
-- Sequence structure for commercial_license_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."commercial_license_id_seq";
CREATE SEQUENCE "public"."commercial_license_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for model_manage_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."model_manage_info_id_seq";
CREATE SEQUENCE "public"."model_manage_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for my_commercial_license_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."my_commercial_license_id_seq";
CREATE SEQUENCE "public"."my_commercial_license_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for plug_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."plug_info_id_seq";
CREATE SEQUENCE "public"."plug_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for supplier_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."supplier_info_id_seq";
CREATE SEQUENCE "public"."supplier_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for commercial_license
-- ----------------------------
DROP TABLE IF EXISTS "public"."commercial_license";
CREATE TABLE "public"."commercial_license" (
  "id" int8 NOT NULL DEFAULT nextval('commercial_license_id_seq'::regclass),
  "license_no" varchar(64) COLLATE "pg_catalog"."default",
  "uuid" varchar(64) COLLATE "pg_catalog"."default",
  "provider_id" int8,
  "provider_code" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "type" int2,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "status" int4,
  "tenant_id" int8,
  "product_line" int8 NOT NULL DEFAULT 0,
  "del" bool NOT NULL DEFAULT false,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0,
  "params" text COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."commercial_license"."id" IS 'ID';
COMMENT ON COLUMN "public"."commercial_license"."license_no" IS '授权编号';
COMMENT ON COLUMN "public"."commercial_license"."uuid" IS '三方id';
COMMENT ON COLUMN "public"."commercial_license"."provider_id" IS '供应商-服务提供商ID';
COMMENT ON COLUMN "public"."commercial_license"."provider_code" IS '供应商-服务提供商code';
COMMENT ON COLUMN "public"."commercial_license"."name" IS '名称';
COMMENT ON COLUMN "public"."commercial_license"."type" IS '鉴权方式： 1、API Key 2、Access Key 3、Secret Access Key 4、其他';
COMMENT ON COLUMN "public"."commercial_license"."description" IS '描述';
COMMENT ON COLUMN "public"."commercial_license"."status" IS '启用停用';
COMMENT ON COLUMN "public"."commercial_license"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."commercial_license"."product_line" IS '产品线';
COMMENT ON COLUMN "public"."commercial_license"."del" IS '是否删除';
COMMENT ON COLUMN "public"."commercial_license"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."commercial_license"."creator" IS '创建人';
COMMENT ON COLUMN "public"."commercial_license"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."commercial_license"."updater" IS '更新人';
COMMENT ON COLUMN "public"."commercial_license"."params" IS '参数管理';
COMMENT ON TABLE "public"."commercial_license" IS '商业授权表';

-- ----------------------------
-- Table structure for model_manage_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."model_manage_info";
CREATE TABLE "public"."model_manage_info" (
  "id" int8 NOT NULL DEFAULT nextval('model_manage_info_id_seq'::regclass),
  "source_model_id" varchar(64) COLLATE "pg_catalog"."default",
  "source_model_name" varchar(255) COLLATE "pg_catalog"."default",
  "source_model_specs" varchar(255) COLLATE "pg_catalog"."default",
  "source_provider_id" varchar(255) COLLATE "pg_catalog"."default",
  "source_model_type" varchar(255) COLLATE "pg_catalog"."default",
  "source_max_length" int8,
  "source_api_type" int8,
  "source_status" int8,
  "source_deploy_properties" text COLLATE "pg_catalog"."default",
  "source_deploy_type" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "model_no" varchar(255) COLLATE "pg_catalog"."default",
  "supplier_id" int8,
  "provider_supplier_id" int8,
  "spec" varchar(50) COLLATE "pg_catalog"."default",
  "context_length" int8,
  "type" int8,
  "cover" varchar(255) COLLATE "pg_catalog"."default",
  "call_price_in" numeric(10,2),
  "call_price_out" numeric(10,2),
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "application_scenarios" varchar(500) COLLATE "pg_catalog"."default",
  "api_sample" text COLLATE "pg_catalog"."default",
  "status" int8 DEFAULT 1,
  "sold_out_time" timestamp(6),
  "include_time" timestamp(6),
  "need_commerce_auth_approve_if" bool,
  "create_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "create_by" int8 DEFAULT 0,
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "update_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "update_by" int8 DEFAULT 0,
  "inner_del" bool DEFAULT false,
  "productline" int8,
  "create_by_productline" int8,
  "update_by_productline" int8,
  "source_fc_status" int8
)
;
COMMENT ON COLUMN "public"."model_manage_info"."id" IS 'ID';
COMMENT ON COLUMN "public"."model_manage_info"."source_model_id" IS '源模型id';
COMMENT ON COLUMN "public"."model_manage_info"."source_model_name" IS '源模型名称';
COMMENT ON COLUMN "public"."model_manage_info"."source_model_specs" IS '源模型规格';
COMMENT ON COLUMN "public"."model_manage_info"."source_provider_id" IS '源供应商id';
COMMENT ON COLUMN "public"."model_manage_info"."source_model_type" IS '源模型类型';
COMMENT ON COLUMN "public"."model_manage_info"."source_max_length" IS '源最大上下文长度';
COMMENT ON COLUMN "public"."model_manage_info"."source_api_type" IS '源类型 0 远程 1本地';
COMMENT ON COLUMN "public"."model_manage_info"."source_status" IS '源状态';
COMMENT ON COLUMN "public"."model_manage_info"."source_deploy_properties" IS '模型发布配置';
COMMENT ON COLUMN "public"."model_manage_info"."source_deploy_type" IS '源模型 发布类型';
COMMENT ON COLUMN "public"."model_manage_info"."name" IS '模型名称 模型名称唯一';
COMMENT ON COLUMN "public"."model_manage_info"."model_no" IS '模型编号';
COMMENT ON COLUMN "public"."model_manage_info"."supplier_id" IS '(模型生产厂商)模型厂商';
COMMENT ON COLUMN "public"."model_manage_info"."provider_supplier_id" IS '服务提供商';
COMMENT ON COLUMN "public"."model_manage_info"."spec" IS '模型规格';
COMMENT ON COLUMN "public"."model_manage_info"."context_length" IS '上下文最大长度';
COMMENT ON COLUMN "public"."model_manage_info"."type" IS '模型类型 数据字典的 模型类型';
COMMENT ON COLUMN "public"."model_manage_info"."cover" IS '模型封面';
COMMENT ON COLUMN "public"."model_manage_info"."call_price_in" IS '调用价格 输入价格';
COMMENT ON COLUMN "public"."model_manage_info"."call_price_out" IS '调用价格 输出价格';
COMMENT ON COLUMN "public"."model_manage_info"."description" IS '模型介绍';
COMMENT ON COLUMN "public"."model_manage_info"."application_scenarios" IS '应用场景';
COMMENT ON COLUMN "public"."model_manage_info"."api_sample" IS 'api示例';
COMMENT ON COLUMN "public"."model_manage_info"."status" IS '1、 初始化 2、上架 3、 下架 4、 待下架 5、涉及违规 6、已删除';
COMMENT ON COLUMN "public"."model_manage_info"."sold_out_time" IS '自动下架时间';
COMMENT ON COLUMN "public"."model_manage_info"."include_time" IS '收录时间';
COMMENT ON COLUMN "public"."model_manage_info"."need_commerce_auth_approve_if" IS '是否需要商业授权认证';
COMMENT ON COLUMN "public"."model_manage_info"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."model_manage_info"."create_by" IS '创建人';
COMMENT ON COLUMN "public"."model_manage_info"."del_flag" IS '是否删除';
COMMENT ON COLUMN "public"."model_manage_info"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."model_manage_info"."update_by" IS '更新人';
COMMENT ON COLUMN "public"."model_manage_info"."inner_del" IS '内部删除';
COMMENT ON COLUMN "public"."model_manage_info"."productline" IS '产品线';
COMMENT ON COLUMN "public"."model_manage_info"."create_by_productline" IS '创建人产品线';
COMMENT ON COLUMN "public"."model_manage_info"."update_by_productline" IS '修改人产品线';
COMMENT ON COLUMN "public"."model_manage_info"."source_fc_status" IS 'function calling状态 0 不支持 1 支持';
COMMENT ON TABLE "public"."model_manage_info" IS '模型管理表';

-- ----------------------------
-- Table structure for my_commercial_license
-- ----------------------------
DROP TABLE IF EXISTS "public"."my_commercial_license";
CREATE TABLE "public"."my_commercial_license" (
  "id" int8 NOT NULL DEFAULT nextval('my_commercial_license_id_seq'::regclass),
  "commercial_license_id" int8,
  "my_license_no" varchar(64) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "provider_id" int8,
  "provider_code" varchar(255) COLLATE "pg_catalog"."default",
  "template_name" varchar(255) COLLATE "pg_catalog"."default",
  "type" int2,
  "template_description" varchar(255) COLLATE "pg_catalog"."default",
  "template_params" text COLLATE "pg_catalog"."default",
  "tenant_id" int8,
  "product_line" int8 NOT NULL DEFAULT 0,
  "del" bool NOT NULL DEFAULT false,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0,
  "uuid" varchar(64) COLLATE "pg_catalog"."default",
  "commercial_uuid" varchar(64) COLLATE "pg_catalog"."default",
  "content" text COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."my_commercial_license"."id" IS 'ID';
COMMENT ON COLUMN "public"."my_commercial_license"."commercial_license_id" IS '关联商业授权ID';
COMMENT ON COLUMN "public"."my_commercial_license"."my_license_no" IS '授权编号';
COMMENT ON COLUMN "public"."my_commercial_license"."name" IS '授权凭据名称';
COMMENT ON COLUMN "public"."my_commercial_license"."provider_id" IS '供应商-服务提供商ID';
COMMENT ON COLUMN "public"."my_commercial_license"."provider_code" IS '供应商-服务提供商Code';
COMMENT ON COLUMN "public"."my_commercial_license"."template_name" IS '商业授权名称';
COMMENT ON COLUMN "public"."my_commercial_license"."type" IS '鉴权方式： 1、API Key 2、Access Key 3、Secret Access Key 4、其他';
COMMENT ON COLUMN "public"."my_commercial_license"."template_description" IS '描述';
COMMENT ON COLUMN "public"."my_commercial_license"."template_params" IS '参数管理';
COMMENT ON COLUMN "public"."my_commercial_license"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."my_commercial_license"."product_line" IS '产品线';
COMMENT ON COLUMN "public"."my_commercial_license"."del" IS '是否删除';
COMMENT ON COLUMN "public"."my_commercial_license"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."my_commercial_license"."creator" IS '创建人';
COMMENT ON COLUMN "public"."my_commercial_license"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."my_commercial_license"."updater" IS '更新人';
COMMENT ON COLUMN "public"."my_commercial_license"."uuid" IS '三方uuid';
COMMENT ON COLUMN "public"."my_commercial_license"."commercial_uuid" IS '三方 授权模板uuid';
COMMENT ON COLUMN "public"."my_commercial_license"."content" IS '参数数值';
COMMENT ON TABLE "public"."my_commercial_license" IS '我的授权凭据表';

-- ----------------------------
-- Table structure for plug_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."plug_info";
CREATE TABLE "public"."plug_info" (
  "id" int8 NOT NULL DEFAULT nextval('plug_info_id_seq'::regclass),
  "no" varchar(255) COLLATE "pg_catalog"."default",
  "base_no" varchar(255) COLLATE "pg_catalog"."default",
  "icon" text COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "type" int4,
  "description" text COLLATE "pg_catalog"."default",
  "url" text COLLATE "pg_catalog"."default",
  "status" int4,
  "sort" int4 DEFAULT 0,
  "publish_time" timestamp(6),
  "tenant_id" int8 NOT NULL DEFAULT 0,
  "productline" int8 NOT NULL DEFAULT 0,
  "create_by" int8 NOT NULL,
  "update_by" int8 NOT NULL,
  "create_by_productline" int8 NOT NULL,
  "update_by_productline" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6),
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar
)
;
COMMENT ON COLUMN "public"."plug_info"."id" IS 'ID';
COMMENT ON COLUMN "public"."plug_info"."no" IS '插件编号';
COMMENT ON COLUMN "public"."plug_info"."base_no" IS 'base插件编号';
COMMENT ON COLUMN "public"."plug_info"."icon" IS '插件logo';
COMMENT ON COLUMN "public"."plug_info"."name" IS '插件名称';
COMMENT ON COLUMN "public"."plug_info"."type" IS '插件类型';
COMMENT ON COLUMN "public"."plug_info"."description" IS '插件描述';
COMMENT ON COLUMN "public"."plug_info"."url" IS '插件url';
COMMENT ON COLUMN "public"."plug_info"."status" IS '插件状态 1未发布; 2已发布,3待下架,4已下架,5涉及违规,6已删除';
COMMENT ON COLUMN "public"."plug_info"."sort" IS '排序';
COMMENT ON COLUMN "public"."plug_info"."publish_time" IS '发布时间';
COMMENT ON COLUMN "public"."plug_info"."tenant_id" IS '所属租户ID';
COMMENT ON COLUMN "public"."plug_info"."productline" IS '产品线';
COMMENT ON COLUMN "public"."plug_info"."create_by" IS '创建人';
COMMENT ON COLUMN "public"."plug_info"."update_by" IS '修改人';
COMMENT ON COLUMN "public"."plug_info"."create_by_productline" IS '创建人产品线';
COMMENT ON COLUMN "public"."plug_info"."update_by_productline" IS '修改人产品线';
COMMENT ON COLUMN "public"."plug_info"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."plug_info"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."plug_info"."del_flag" IS '删除标记，0未删除，1已删除';
COMMENT ON TABLE "public"."plug_info" IS '插件信息表';

-- ----------------------------
-- Table structure for supplier_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."supplier_info";
CREATE TABLE "public"."supplier_info" (
  "id" int8 NOT NULL DEFAULT nextval('supplier_info_id_seq'::regclass),
  "no" varchar(255) COLLATE "pg_catalog"."default",
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "logo" text COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "type" int4,
  "sort" int4 DEFAULT 0,
  "create_by" int8 NOT NULL,
  "update_by" int8 NOT NULL,
  "create_by_productline" int8 NOT NULL,
  "update_by_productline" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6),
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "display" bool NOT NULL DEFAULT true
)
;
COMMENT ON COLUMN "public"."supplier_info"."id" IS 'ID';
COMMENT ON COLUMN "public"."supplier_info"."no" IS '供应商编号';
COMMENT ON COLUMN "public"."supplier_info"."code" IS '供应商code';
COMMENT ON COLUMN "public"."supplier_info"."logo" IS '供应商Logo';
COMMENT ON COLUMN "public"."supplier_info"."name" IS '供应商名称';
COMMENT ON COLUMN "public"."supplier_info"."type" IS '供应商类型';
COMMENT ON COLUMN "public"."supplier_info"."sort" IS '排序';
COMMENT ON COLUMN "public"."supplier_info"."create_by" IS '创建人';
COMMENT ON COLUMN "public"."supplier_info"."update_by" IS '修改人';
COMMENT ON COLUMN "public"."supplier_info"."create_by_productline" IS '创建人产品线';
COMMENT ON COLUMN "public"."supplier_info"."update_by_productline" IS '修改人产品线';
COMMENT ON COLUMN "public"."supplier_info"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."supplier_info"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."supplier_info"."del_flag" IS '删除标记，0未删除，1已删除';
COMMENT ON COLUMN "public"."supplier_info"."display" IS '是否展示';
COMMENT ON TABLE "public"."supplier_info" IS '供应商信息表';

INSERT INTO "public"."supplier_info" VALUES ('SR18823228298783662082675', '100006', 'http://192.168.7.2:9000/ai-public-bucket/2025/01/23/e04d42be-c0a0-4b4f-ad8b-01e671f3f32e_1737615629_微信图片_20230607112025.jpg', '腾讯混元', 4, 0, 1, 1, 100001, 100001, '2025-01-23 15:01:49', '2025-01-23 15:05:32', '0', 't');
INSERT INTO "public"."supplier_info" VALUES ('SR18823229886831042566069', '100007', 'http://192.168.7.2:9000/ai-public-bucket/2025/01/23/f840acb7-1bf3-4101-85bc-f635ac31f088_1737615664_微信图片_20230607112326.jpg', '月之暗面', 4, 0, 1, 1, 100001, 100001, '2025-01-23 15:02:27', '2025-01-23 15:05:32', '0', 't');
INSERT INTO "public"."supplier_info" VALUES ('SR18823231395648020483447', '100008', 'http://192.168.7.2:9000/ai-public-bucket/2025/01/23/31906d80-4e41-4c57-a541-f443b9e4314c_1737615703_5.jpg', '火山引擎', 4, 0, 1, 1, 100001, 100001, '2025-01-23 15:03:03', '2025-01-23 15:05:35', '0', 't');
INSERT INTO "public"."supplier_info" VALUES ('SR18957508702645821443409', '100009', 'http://120.26.167.137:9000/ai-public-bucket/2025/03/01/eac30842-2b54-4222-900c-bf755fa2f1dc_1740817202_19.png', '汇智', 4, 0, 1, 1, 100001, 100001, '2025-03-01 16:20:03', '2025-03-01 16:20:03', '0', 't');
INSERT INTO "public"."supplier_info" VALUES ('SR18964476874783498247644', '100003', 'http://120.26.167.137:9000/ai-public-bucket/2025/03/03/32383b32-00e4-4743-ae2b-256d828d9fa6_1740983333_005PEvICgy1hgycj74pbfj30sg0sgx5a.jpg', '智谱AI', 4, 101, 1, 1, 100001, 100001, '2025-03-03 14:28:58', '2025-03-03 14:28:58', '0', 't');
INSERT INTO "public"."supplier_info" VALUES ('SR18823222547302359049836', '100002', 'http://192.168.7.2:9000/ai-public-bucket/2025/01/23/ce630e94-f158-41b0-ad31-07a718194934_1737615492_1696823140(1).jpg', '文心一言', 4, 6, 1, 1, 100001, 100001, '2025-01-23 14:59:32', '2025-01-23 15:05:28', '0', 't');
INSERT INTO "public"."supplier_info" VALUES ('SR18823226839333642246982', '100005', 'http://192.168.7.2:9000/ai-public-bucket/2025/01/23/2bfc1ed1-088e-4ac8-9462-a9d972711d3b_1737615594_微信图片_20211216124230.jpg', '阿里云百炼', 4, 0, 1, 1, 100001, 100001, '2025-01-23 15:01:14', '2025-01-23 15:05:31', '0', 't');
INSERT INTO "public"."supplier_info" VALUES ('SR18823225426733998081749', '100004', 'http://192.168.7.2:9000/ai-public-bucket/2025/01/23/38d163ae-d2cb-4e02-8153-97571d665196_1737615561_微信图片_20211215152620.jpg', '深度求索', 4, 0, 1, 1, 100001, 100001, '2025-01-23 15:00:41', '2025-01-23 15:05:30', '0', 't');
INSERT INTO "public"."supplier_info" VALUES ('SR18823220460258631688027', '100001', 'http://192.168.7.2:9000/ai-public-bucket/2025/01/23/49b51412-bc99-4d49-8937-a273bfc1d262_1737615438_微信图片_20211216124221.jpg', 'OpenAi', 4, 5, 1, 1, 100001, 100001, '2025-01-23 14:58:42', '2025-01-23 15:05:27', '0', 't');
INSERT INTO "public"."supplier_info" VALUES ('SR19351812853959270400284', '100010', 'https://file.dev.agentsyun.com/ai-public-bucket/2025/06/18/1047dfbd-4f25-401d-8c9b-2a29f38ad0b6_1750218145_screenshot_2025-04-11_17-25-52.png', '昇腾环境', 4, 0, 1, 1, 100001, 100001, '2025-06-18 11:42:27.025838', '2025-06-18 11:42:27.025838', '0', 't');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."commercial_license_id_seq"
OWNED BY "public"."commercial_license"."id";
SELECT setval('"public"."commercial_license_id_seq"', 13, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."model_manage_info_id_seq"
OWNED BY "public"."model_manage_info"."id";
SELECT setval('"public"."model_manage_info_id_seq"', 107, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."my_commercial_license_id_seq"
OWNED BY "public"."my_commercial_license"."id";
SELECT setval('"public"."my_commercial_license_id_seq"', 234, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."plug_info_id_seq"
OWNED BY "public"."plug_info"."id";
SELECT setval('"public"."plug_info_id_seq"', 323, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."supplier_info_id_seq"
OWNED BY "public"."supplier_info"."id";
SELECT setval('"public"."supplier_info_id_seq"', 21, true);

-- ----------------------------
-- Primary Key structure for table commercial_license
-- ----------------------------
ALTER TABLE "public"."commercial_license" ADD CONSTRAINT "commercial_license_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table model_manage_info
-- ----------------------------
ALTER TABLE "public"."model_manage_info" ADD CONSTRAINT "model_manage_info_name_key" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table model_manage_info
-- ----------------------------
ALTER TABLE "public"."model_manage_info" ADD CONSTRAINT "model_manage_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table my_commercial_license
-- ----------------------------
ALTER TABLE "public"."my_commercial_license" ADD CONSTRAINT "my_commercial_license_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table plug_info
-- ----------------------------
ALTER TABLE "public"."plug_info" ADD CONSTRAINT "plug_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table supplier_info
-- ----------------------------
ALTER TABLE "public"."supplier_info" ADD CONSTRAINT "supplier_info_pkey" PRIMARY KEY ("id");
