/*
 Navicat Premium Dump SQL

 Source Server         : buffgpt_pg_prod
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 118.31.113.98:17506
 Source Catalog        : agents_message
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 16/06/2025 11:43:01
*/


-- ----------------------------
-- Sequence structure for channel_account_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."channel_account_id_seq";
CREATE SEQUENCE "public"."channel_account_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for message_template_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."message_template_id_seq";
CREATE SEQUENCE "public"."message_template_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sms_record_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sms_record_id_seq";
CREATE SEQUENCE "public"."sms_record_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_inner_message_notify_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_inner_message_notify_id_seq";
CREATE SEQUENCE "public"."user_inner_message_notify_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for channel_account
-- ----------------------------
DROP TABLE IF EXISTS "public"."channel_account";
CREATE TABLE "public"."channel_account" (
  "id" int4 NOT NULL DEFAULT nextval('channel_account_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "send_channel" int4,
  "account_config" text COLLATE "pg_catalog"."default",
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
COMMENT ON COLUMN "public"."channel_account"."name" IS '账号名称';
COMMENT ON COLUMN "public"."channel_account"."send_channel" IS '发送渠道 30、短信';
COMMENT ON COLUMN "public"."channel_account"."account_config" IS '账号配置 阿里云短信：{"supplierId":1,"supplierName":"阿里云","scriptName":"AliyunSmsScript"}';
COMMENT ON COLUMN "public"."channel_account"."del_flag" IS '删除标记，0未删除，1已删除';

-- ----------------------------
-- Table structure for message_template
-- ----------------------------
DROP TABLE IF EXISTS "public"."message_template";
CREATE TABLE "public"."message_template" (
  "id" int4 NOT NULL DEFAULT nextval('message_template_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "audit_status" int4,
  "flow_id" varchar(255) COLLATE "pg_catalog"."default",
  "msg_status" int4,
  "cron_task_id" int4,
  "cron_crowd_path" varchar(255) COLLATE "pg_catalog"."default",
  "id_type" int4,
  "send_channel" int4,
  "template_type" int4,
  "shield_type" int4,
  "msg_type" int4,
  "expect_push_time" varchar(255) COLLATE "pg_catalog"."default",
  "msg_content" varchar(255) COLLATE "pg_catalog"."default",
  "send_account" int4,
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
COMMENT ON COLUMN "public"."message_template"."name" IS '模板标题';
COMMENT ON COLUMN "public"."message_template"."msg_type" IS '消息类型 10、通知类消息 20、营销类消息 30、验证码消息';
COMMENT ON COLUMN "public"."message_template"."expect_push_time" IS '推送消息的时间 0：立即发送 else：crontab 表达式';
COMMENT ON COLUMN "public"."message_template"."msg_content" IS '消息内容  {$var} 为占位符';

-- ----------------------------
-- Records of message_template
-- ----------------------------
INSERT INTO "public"."message_template" VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 20, NULL, 30, NULL, '{"content":"您的验证码为：${code}，请勿泄露于他人！"}', 1, 1, NULL, 0, 0, 0, 0, '2024-12-30 16:55:33', '2024-12-30 19:54:04', '0');
INSERT INTO "public"."message_template" VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 20, NULL, 30, NULL, '{"content":"尊敬的用户，您已成功登录BuffGPT平台，您的初始账户名为${username}，您的初始密码为${password}，您可以在BuffGPT平台修改账户名及密码。"}', 2, 1, NULL, 0, 0, 0, 0, '2025-04-21 15:20:59', '2025-04-21 15:25:37', '0');
INSERT INTO "public"."message_template" VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 20, NULL, 10, NULL, '{}', 3, 1, NULL, 0, 0, 0, 0, '2025-05-06 11:40:26', '2025-05-06 11:40:38', '0');

-- ----------------------------
-- Table structure for sms_record
-- ----------------------------
DROP TABLE IF EXISTS "public"."sms_record";
CREATE TABLE "public"."sms_record" (
  "id" int4 NOT NULL DEFAULT nextval('sms_record_id_seq'::regclass),
  "message_template_id" int8,
  "phone" varchar(255) COLLATE "pg_catalog"."default",
  "ip" varchar(255) COLLATE "pg_catalog"."default",
  "supplier_id" int8,
  "supplier_name" varchar(255) COLLATE "pg_catalog"."default",
  "msg_content" text COLLATE "pg_catalog"."default",
  "msg_type" int4,
  "series_id" varchar(255) COLLATE "pg_catalog"."default",
  "charging_num" int4,
  "report_content" text COLLATE "pg_catalog"."default",
  "status" int4,
  "send_date" int4,
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
COMMENT ON COLUMN "public"."sms_record"."message_template_id" IS '消息模板Id';
COMMENT ON COLUMN "public"."sms_record"."msg_type" IS '10、通知类消息 20、营销类消息 30、验证码消息';
COMMENT ON COLUMN "public"."sms_record"."series_id" IS '批次号Id';
COMMENT ON COLUMN "public"."sms_record"."charging_num" IS '计费条数';
COMMENT ON COLUMN "public"."sms_record"."report_content" IS '回执信息';
COMMENT ON COLUMN "public"."sms_record"."status" IS '短信状态';

-- ----------------------------
-- Table structure for user_inner_message_notify
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_inner_message_notify";
CREATE TABLE "public"."user_inner_message_notify" (
  "id" int4 NOT NULL DEFAULT nextval('user_inner_message_notify_id_seq'::regclass),
  "no" varchar(50) COLLATE "pg_catalog"."default",
  "sender_id" int8 NOT NULL DEFAULT 0,
  "receiver_id" int8 NOT NULL,
  "title" text COLLATE "pg_catalog"."default" NOT NULL,
  "content" text COLLATE "pg_catalog"."default" NOT NULL,
  "img" text COLLATE "pg_catalog"."default",
  "extra_data" text COLLATE "pg_catalog"."default",
  "type" int2 NOT NULL,
  "status" int2 NOT NULL DEFAULT 0,
  "business_id" int8,
  "business_type" int4,
  "status_change_time" timestamp(6),
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar
)
;
COMMENT ON COLUMN "public"."user_inner_message_notify"."id" IS '消息ID';
COMMENT ON COLUMN "public"."user_inner_message_notify"."no" IS '消息编号';
COMMENT ON COLUMN "public"."user_inner_message_notify"."sender_id" IS '发送者ID(0为系统)';
COMMENT ON COLUMN "public"."user_inner_message_notify"."receiver_id" IS '接收者ID';
COMMENT ON COLUMN "public"."user_inner_message_notify"."title" IS '消息标题';
COMMENT ON COLUMN "public"."user_inner_message_notify"."content" IS '消息内容';
COMMENT ON COLUMN "public"."user_inner_message_notify"."img" IS '图片';
COMMENT ON COLUMN "public"."user_inner_message_notify"."extra_data" IS '额外数据';
COMMENT ON COLUMN "public"."user_inner_message_notify"."type" IS '消息类型(1:系统通知,2:用户动作通知...)';
COMMENT ON COLUMN "public"."user_inner_message_notify"."status" IS '状态(0:未读,1:已读,2:删除)';
COMMENT ON COLUMN "public"."user_inner_message_notify"."business_id" IS '相关业务ID';
COMMENT ON COLUMN "public"."user_inner_message_notify"."business_type" IS '相关业务类型';
COMMENT ON COLUMN "public"."user_inner_message_notify"."status_change_time" IS '状态变更时间（0->1 0/1->2）';
COMMENT ON COLUMN "public"."user_inner_message_notify"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."user_inner_message_notify"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."user_inner_message_notify"."del_flag" IS '删除标记，0未删除，1已删除';

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."channel_account_id_seq"
OWNED BY "public"."channel_account"."id";
SELECT setval('"public"."channel_account_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."message_template_id_seq"
OWNED BY "public"."message_template"."id";
SELECT setval('"public"."message_template_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sms_record_id_seq"
OWNED BY "public"."sms_record"."id";
SELECT setval('"public"."sms_record_id_seq"', 1679, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."user_inner_message_notify_id_seq"
OWNED BY "public"."user_inner_message_notify"."id";
SELECT setval('"public"."user_inner_message_notify_id_seq"', 11, true);

-- ----------------------------
-- Primary Key structure for table channel_account
-- ----------------------------
ALTER TABLE "public"."channel_account" ADD CONSTRAINT "channel_account_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table message_template
-- ----------------------------
ALTER TABLE "public"."message_template" ADD CONSTRAINT "message_template_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sms_record
-- ----------------------------
ALTER TABLE "public"."sms_record" ADD CONSTRAINT "sms_record_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table user_inner_message_notify
-- ----------------------------
ALTER TABLE "public"."user_inner_message_notify" ADD CONSTRAINT "user_inner_message_notify_pkey" PRIMARY KEY ("id");
