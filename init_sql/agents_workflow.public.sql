/*
 Navicat Premium Dump SQL

 Source Server         : buffgpt_pg_prod
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 118.31.113.98:17506
 Source Catalog        : agents_workflow
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 16/06/2025 11:50:37
*/


-- ----------------------------
-- Sequence structure for user_workflow_request_record_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_workflow_request_record_id_seq";
CREATE SEQUENCE "public"."user_workflow_request_record_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for workflow_application_execute_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."workflow_application_execute_log_id_seq";
CREATE SEQUENCE "public"."workflow_application_execute_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for workflow_application_execute_node_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."workflow_application_execute_node_log_id_seq";
CREATE SEQUENCE "public"."workflow_application_execute_node_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for workflow_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."workflow_info_id_seq";
CREATE SEQUENCE "public"."workflow_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for user_workflow_request_record
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_workflow_request_record";
CREATE TABLE "public"."user_workflow_request_record" (
  "id" int4 NOT NULL DEFAULT nextval('user_workflow_request_record_id_seq'::regclass),
  "workflow_id" int8 NOT NULL,
  "tenant_id" int8 NOT NULL DEFAULT 0,
  "task_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "session_id" text COLLATE "pg_catalog"."default",
  "im_push_unique_identifier" text COLLATE "pg_catalog"."default",
  "node_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT '0'::text,
  "created_by_product_line" int8 NOT NULL DEFAULT 0,
  "updated_by_product_line" int8 NOT NULL DEFAULT 0,
  "request_type" int2 DEFAULT 2,
  "request_state" int2 DEFAULT 0,
  "receive_mq_body" text COLLATE "pg_catalog"."default",
  "receive_mq_time" timestamp(6),
  "push_body" text COLLATE "pg_catalog"."default",
  "push_failed_info" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "del" bool NOT NULL DEFAULT false,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0,
  "business_type" int2 DEFAULT 1
)
;
COMMENT ON COLUMN "public"."user_workflow_request_record"."id" IS '主键';
COMMENT ON COLUMN "public"."user_workflow_request_record"."workflow_id" IS '工作流ID';
COMMENT ON COLUMN "public"."user_workflow_request_record"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."user_workflow_request_record"."task_id" IS '任务ID';
COMMENT ON COLUMN "public"."user_workflow_request_record"."session_id" IS 'websocket sessionId';
COMMENT ON COLUMN "public"."user_workflow_request_record"."im_push_unique_identifier" IS 'IM推送唯一标识';
COMMENT ON COLUMN "public"."user_workflow_request_record"."node_id" IS '节点ID';
COMMENT ON COLUMN "public"."user_workflow_request_record"."created_by_product_line" IS '创建的产品线';
COMMENT ON COLUMN "public"."user_workflow_request_record"."updated_by_product_line" IS '修改的产品线';
COMMENT ON COLUMN "public"."user_workflow_request_record"."request_type" IS '请求类型：1全局节点，2单节点';
COMMENT ON COLUMN "public"."user_workflow_request_record"."request_state" IS '状态：0未收到MQ,1已收到MQ未推送IM,2已推送IM,3IM推送失败';
COMMENT ON COLUMN "public"."user_workflow_request_record"."receive_mq_body" IS 'MQ回调内容';
COMMENT ON COLUMN "public"."user_workflow_request_record"."receive_mq_time" IS 'MQ回调时间';
COMMENT ON COLUMN "public"."user_workflow_request_record"."push_body" IS '推送内容';
COMMENT ON COLUMN "public"."user_workflow_request_record"."push_failed_info" IS '推送失败原因';
COMMENT ON COLUMN "public"."user_workflow_request_record"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."user_workflow_request_record"."creator" IS '创建人';
COMMENT ON COLUMN "public"."user_workflow_request_record"."del" IS '是否删除';
COMMENT ON COLUMN "public"."user_workflow_request_record"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."user_workflow_request_record"."updater" IS '更新人';
COMMENT ON COLUMN "public"."user_workflow_request_record"."business_type" IS '业务类型：1工作流，2工作流应用，默认为1';
COMMENT ON TABLE "public"."user_workflow_request_record" IS '用户工作流请求记录';

-- ----------------------------
-- Table structure for workflow_application_execute_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."workflow_application_execute_log";
CREATE TABLE "public"."workflow_application_execute_log" (
  "id" int8 NOT NULL DEFAULT nextval('workflow_application_execute_log_id_seq'::regclass),
  "task_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "business_id" int8 NOT NULL,
  "execute_args" text COLLATE "pg_catalog"."default" NOT NULL,
  "execute_result" text COLLATE "pg_catalog"."default",
  "tenant_id" int8 NOT NULL,
  "definition_uuid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_time" timestamp(6),
  "creator" int8,
  "del" bool NOT NULL DEFAULT false,
  "updated_time" timestamp(6),
  "updater" int8,
  "business_type" int2
)
;
COMMENT ON COLUMN "public"."workflow_application_execute_log"."id" IS '主键';
COMMENT ON COLUMN "public"."workflow_application_execute_log"."task_id" IS '执行任务Id';
COMMENT ON COLUMN "public"."workflow_application_execute_log"."business_id" IS '工作流应用ID';
COMMENT ON COLUMN "public"."workflow_application_execute_log"."execute_args" IS '执行入参';
COMMENT ON COLUMN "public"."workflow_application_execute_log"."execute_result" IS '执行结果';
COMMENT ON COLUMN "public"."workflow_application_execute_log"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."workflow_application_execute_log"."definition_uuid" IS '工作流应用uuid';
COMMENT ON COLUMN "public"."workflow_application_execute_log"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."workflow_application_execute_log"."creator" IS '创建人';
COMMENT ON COLUMN "public"."workflow_application_execute_log"."del" IS '是否删除';
COMMENT ON COLUMN "public"."workflow_application_execute_log"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."workflow_application_execute_log"."updater" IS '更新人';
COMMENT ON COLUMN "public"."workflow_application_execute_log"."business_type" IS '业务类型：1工作流，2工作流应用，3多智能体应用';

-- ----------------------------
-- Table structure for workflow_application_execute_node_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."workflow_application_execute_node_log";
CREATE TABLE "public"."workflow_application_execute_node_log" (
  "id" int8 NOT NULL DEFAULT nextval('workflow_application_execute_node_log_id_seq'::regclass),
  "main_execute_id" int8 NOT NULL,
  "business_id" int8,
  "node_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "node_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "node_execute_result" text COLLATE "pg_catalog"."default" NOT NULL,
  "node_name" varchar(255) COLLATE "pg_catalog"."default",
  "event" varchar(255) COLLATE "pg_catalog"."default",
  "execute_end" timestamp(6),
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "del" bool DEFAULT false,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0,
  "execute_status" int8,
  "business_type" int2
)
;
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."id" IS '主键';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."main_execute_id" IS '工作流应用执行Id';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."business_id" IS '工作流应用ID';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."node_id" IS '执行任务Id';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."node_type" IS '节点类型';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."node_execute_result" IS '节点执行结果';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."node_name" IS '节点名称';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."event" IS '事件，finish正常结束，abnormal_finish异常结束';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."execute_end" IS '执行结束时间';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."creator" IS '创建人';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."del" IS '是否删除';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."updater" IS '更新人';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."execute_status" IS '节点执行状态：0成功，1失败';
COMMENT ON COLUMN "public"."workflow_application_execute_node_log"."business_type" IS '业务类型：1工作流，2工作流应用，3多智能体应用';

-- ----------------------------
-- Table structure for workflow_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."workflow_info";
CREATE TABLE "public"."workflow_info" (
  "id" int4 NOT NULL DEFAULT nextval('workflow_info_id_seq'::regclass),
  "workflow_name" text COLLATE "pg_catalog"."default" NOT NULL,
  "workflow_introduction" text COLLATE "pg_catalog"."default" NOT NULL,
  "workflow_logo" text COLLATE "pg_catalog"."default" NOT NULL,
  "tenant_id" int8 NOT NULL DEFAULT 0,
  "workflow_api_no" text COLLATE "pg_catalog"."default" NOT NULL,
  "workflow_no" text COLLATE "pg_catalog"."default" NOT NULL,
  "workflow_state" int2 NOT NULL DEFAULT 1,
  "created_by_product_line" int8 NOT NULL DEFAULT 0,
  "updated_by_product_line" int8 NOT NULL DEFAULT 0,
  "release_time" timestamp(6),
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "del" bool NOT NULL DEFAULT false,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."workflow_info"."id" IS '主键';
COMMENT ON COLUMN "public"."workflow_info"."workflow_name" IS '工作流名称';
COMMENT ON COLUMN "public"."workflow_info"."workflow_introduction" IS '工作流介绍';
COMMENT ON COLUMN "public"."workflow_info"."workflow_logo" IS '工作流logo';
COMMENT ON COLUMN "public"."workflow_info"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."workflow_info"."workflow_api_no" IS '工作流Api的唯一编码';
COMMENT ON COLUMN "public"."workflow_info"."workflow_no" IS '工作流编码';
COMMENT ON COLUMN "public"."workflow_info"."workflow_state" IS '工作流发布状态：1-未发布，2-已发布，3,已删除4已下架';
COMMENT ON COLUMN "public"."workflow_info"."created_by_product_line" IS '创建的产品线';
COMMENT ON COLUMN "public"."workflow_info"."updated_by_product_line" IS '修改的产品线';
COMMENT ON COLUMN "public"."workflow_info"."release_time" IS '发布时间';
COMMENT ON COLUMN "public"."workflow_info"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."workflow_info"."creator" IS '创建人';
COMMENT ON COLUMN "public"."workflow_info"."del" IS '是否删除';
COMMENT ON COLUMN "public"."workflow_info"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."workflow_info"."updater" IS '更新人';
COMMENT ON TABLE "public"."workflow_info" IS '工作流信息';

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."user_workflow_request_record_id_seq"
OWNED BY "public"."user_workflow_request_record"."id";
SELECT setval('"public"."user_workflow_request_record_id_seq"', 1992, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."workflow_application_execute_log_id_seq"
OWNED BY "public"."workflow_application_execute_log"."id";
SELECT setval('"public"."workflow_application_execute_log_id_seq"', 317, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."workflow_application_execute_node_log_id_seq"
OWNED BY "public"."workflow_application_execute_node_log"."id";
SELECT setval('"public"."workflow_application_execute_node_log_id_seq"', 1299, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."workflow_info_id_seq"
OWNED BY "public"."workflow_info"."id";
SELECT setval('"public"."workflow_info_id_seq"', 376, true);

-- ----------------------------
-- Primary Key structure for table user_workflow_request_record
-- ----------------------------
ALTER TABLE "public"."user_workflow_request_record" ADD CONSTRAINT "user_workflow_request_record_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table workflow_application_execute_log
-- ----------------------------
ALTER TABLE "public"."workflow_application_execute_log" ADD CONSTRAINT "workflow_application_execute_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table workflow_application_execute_node_log
-- ----------------------------
ALTER TABLE "public"."workflow_application_execute_node_log" ADD CONSTRAINT "workflow_application_execute_node_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table workflow_info
-- ----------------------------
ALTER TABLE "public"."workflow_info" ADD CONSTRAINT "workflow_info_pkey" PRIMARY KEY ("id");
