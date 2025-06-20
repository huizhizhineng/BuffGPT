/*
 * Copyright 1999-2018 Alibaba Group Holding Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

-- 删除已存在的表
DROP TABLE IF EXISTS "permissions";
DROP TABLE IF EXISTS "roles";
DROP TABLE IF EXISTS "users";
DROP TABLE IF EXISTS "tenant_info";
DROP TABLE IF EXISTS "tenant_capacity";
DROP TABLE IF EXISTS "his_config_info";
DROP TABLE IF EXISTS "group_capacity";
DROP TABLE IF EXISTS "config_tags_relation";
DROP TABLE IF EXISTS "config_info_tag";
DROP TABLE IF EXISTS "config_info_beta";
DROP TABLE IF EXISTS "config_info_aggr";
DROP TABLE IF EXISTS "config_info";

/******************************************/
/*   表名称 = config_info                  */
/******************************************/
CREATE TABLE "config_info" (
  "id" SERIAL PRIMARY KEY,
  "data_id" varchar(255) NOT NULL,
  "group_id" varchar(128) DEFAULT NULL,
  "content" text NOT NULL,
  "md5" varchar(32) DEFAULT NULL,
  "gmt_create" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "gmt_modified" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "src_user" text,
  "src_ip" varchar(50) DEFAULT NULL,
  "app_name" varchar(128) DEFAULT NULL,
  "tenant_id" varchar(128) DEFAULT '',
  "c_desc" varchar(256) DEFAULT NULL,
  "c_use" varchar(64) DEFAULT NULL,
  "effect" varchar(64) DEFAULT NULL,
  "type" varchar(64) DEFAULT NULL,
  "c_schema" text,
  "encrypted_data_key" varchar(1024) DEFAULT '',
  CONSTRAINT uk_configinfo_datagrouptenant UNIQUE ("data_id", "group_id", "tenant_id")
);

COMMENT ON TABLE "config_info" IS 'config_info';
COMMENT ON COLUMN "config_info"."id" IS 'id';
COMMENT ON COLUMN "config_info"."data_id" IS 'data_id';
COMMENT ON COLUMN "config_info"."group_id" IS 'group_id';
COMMENT ON COLUMN "config_info"."content" IS 'content';
COMMENT ON COLUMN "config_info"."md5" IS 'md5';
COMMENT ON COLUMN "config_info"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "config_info"."gmt_modified" IS '修改时间';
COMMENT ON COLUMN "config_info"."src_user" IS 'source user';
COMMENT ON COLUMN "config_info"."src_ip" IS 'source ip';
COMMENT ON COLUMN "config_info"."app_name" IS 'app_name';
COMMENT ON COLUMN "config_info"."tenant_id" IS '租户字段';
COMMENT ON COLUMN "config_info"."c_desc" IS 'configuration description';
COMMENT ON COLUMN "config_info"."c_use" IS 'configuration usage';
COMMENT ON COLUMN "config_info"."effect" IS '配置生效的描述';
COMMENT ON COLUMN "config_info"."type" IS '配置的类型';
COMMENT ON COLUMN "config_info"."c_schema" IS '配置的模式';
COMMENT ON COLUMN "config_info"."encrypted_data_key" IS '密钥';

/******************************************/
/*   表名称 = config_info_aggr             */
/******************************************/
CREATE TABLE "config_info_aggr" (
  "id" SERIAL PRIMARY KEY,
  "data_id" varchar(255) NOT NULL,
  "group_id" varchar(128) NOT NULL,
  "datum_id" varchar(255) NOT NULL,
  "content" text NOT NULL,
  "gmt_modified" timestamp NOT NULL,
  "app_name" varchar(128) DEFAULT NULL,
  "tenant_id" varchar(128) DEFAULT '',
  CONSTRAINT uk_configinfoaggr_datagrouptenantdatum UNIQUE ("data_id", "group_id", "tenant_id", "datum_id")
);

COMMENT ON TABLE "config_info_aggr" IS '增加租户字段';
COMMENT ON COLUMN "config_info_aggr"."id" IS 'id';
COMMENT ON COLUMN "config_info_aggr"."data_id" IS 'data_id';
COMMENT ON COLUMN "config_info_aggr"."group_id" IS 'group_id';
COMMENT ON COLUMN "config_info_aggr"."datum_id" IS 'datum_id';
COMMENT ON COLUMN "config_info_aggr"."content" IS '内容';
COMMENT ON COLUMN "config_info_aggr"."gmt_modified" IS '修改时间';
COMMENT ON COLUMN "config_info_aggr"."app_name" IS 'app_name';
COMMENT ON COLUMN "config_info_aggr"."tenant_id" IS '租户字段';

/******************************************/
/*   表名称 = config_info_beta             */
/******************************************/
CREATE TABLE "config_info_beta" (
  "id" SERIAL PRIMARY KEY,
  "data_id" varchar(255) NOT NULL,
  "group_id" varchar(128) NOT NULL,
  "app_name" varchar(128) DEFAULT NULL,
  "content" text NOT NULL,
  "beta_ips" varchar(1024) DEFAULT NULL,
  "md5" varchar(32) DEFAULT NULL,
  "gmt_create" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "gmt_modified" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "src_user" text,
  "src_ip" varchar(50) DEFAULT NULL,
  "tenant_id" varchar(128) DEFAULT '',
  "encrypted_data_key" varchar(1024) DEFAULT '',
  CONSTRAINT uk_configinfobeta_datagrouptenant UNIQUE ("data_id", "group_id", "tenant_id")
);

COMMENT ON TABLE "config_info_beta" IS 'config_info_beta';
COMMENT ON COLUMN "config_info_beta"."id" IS 'id';
COMMENT ON COLUMN "config_info_beta"."data_id" IS 'data_id';
COMMENT ON COLUMN "config_info_beta"."group_id" IS 'group_id';
COMMENT ON COLUMN "config_info_beta"."app_name" IS 'app_name';
COMMENT ON COLUMN "config_info_beta"."content" IS 'content';
COMMENT ON COLUMN "config_info_beta"."beta_ips" IS 'betaIps';
COMMENT ON COLUMN "config_info_beta"."md5" IS 'md5';
COMMENT ON COLUMN "config_info_beta"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "config_info_beta"."gmt_modified" IS '修改时间';
COMMENT ON COLUMN "config_info_beta"."src_user" IS 'source user';
COMMENT ON COLUMN "config_info_beta"."src_ip" IS 'source ip';
COMMENT ON COLUMN "config_info_beta"."tenant_id" IS '租户字段';
COMMENT ON COLUMN "config_info_beta"."encrypted_data_key" IS '密钥';

/******************************************/
/*   表名称 = config_info_tag              */
/******************************************/
CREATE TABLE "config_info_tag" (
  "id" SERIAL PRIMARY KEY,
  "data_id" varchar(255) NOT NULL,
  "group_id" varchar(128) NOT NULL,
  "tenant_id" varchar(128) DEFAULT '',
  "tag_id" varchar(128) NOT NULL,
  "app_name" varchar(128) DEFAULT NULL,
  "content" text NOT NULL,
  "md5" varchar(32) DEFAULT NULL,
  "gmt_create" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "gmt_modified" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "src_user" text,
  "src_ip" varchar(50) DEFAULT NULL,
  CONSTRAINT uk_configinfotag_datagrouptenanttag UNIQUE ("data_id", "group_id", "tenant_id", "tag_id")
);

COMMENT ON TABLE "config_info_tag" IS 'config_info_tag';
COMMENT ON COLUMN "config_info_tag"."id" IS 'id';
COMMENT ON COLUMN "config_info_tag"."data_id" IS 'data_id';
COMMENT ON COLUMN "config_info_tag"."group_id" IS 'group_id';
COMMENT ON COLUMN "config_info_tag"."tenant_id" IS 'tenant_id';
COMMENT ON COLUMN "config_info_tag"."tag_id" IS 'tag_id';
COMMENT ON COLUMN "config_info_tag"."app_name" IS 'app_name';
COMMENT ON COLUMN "config_info_tag"."content" IS 'content';
COMMENT ON COLUMN "config_info_tag"."md5" IS 'md5';
COMMENT ON COLUMN "config_info_tag"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "config_info_tag"."gmt_modified" IS '修改时间';
COMMENT ON COLUMN "config_info_tag"."src_user" IS 'source user';
COMMENT ON COLUMN "config_info_tag"."src_ip" IS 'source ip';

/******************************************/
/*   表名称 = config_tags_relation         */
/******************************************/
CREATE TABLE "config_tags_relation" (
  "id" bigint NOT NULL,
  "tag_name" varchar(128) NOT NULL,
  "tag_type" varchar(64) DEFAULT NULL,
  "data_id" varchar(255) NOT NULL,
  "group_id" varchar(128) NOT NULL,
  "tenant_id" varchar(128) DEFAULT '',
  "nid" SERIAL PRIMARY KEY,
  CONSTRAINT uk_configtagrelation_configidtag UNIQUE ("id", "tag_name", "tag_type")
);

COMMENT ON TABLE "config_tags_relation" IS 'config_tag_relation';
COMMENT ON COLUMN "config_tags_relation"."id" IS 'id';
COMMENT ON COLUMN "config_tags_relation"."tag_name" IS 'tag_name';
COMMENT ON COLUMN "config_tags_relation"."tag_type" IS 'tag_type';
COMMENT ON COLUMN "config_tags_relation"."data_id" IS 'data_id';
COMMENT ON COLUMN "config_tags_relation"."group_id" IS 'group_id';
COMMENT ON COLUMN "config_tags_relation"."tenant_id" IS 'tenant_id';
COMMENT ON COLUMN "config_tags_relation"."nid" IS 'nid, 自增长标识';

-- 删除已存在的索引
DROP INDEX IF EXISTS idx_tenant_id;
CREATE INDEX idx_tenant_id ON "config_tags_relation" ("tenant_id");

/******************************************/
/*   表名称 = group_capacity               */
/******************************************/
CREATE TABLE "group_capacity" (
  "id" SERIAL PRIMARY KEY,
  "group_id" varchar(128) NOT NULL DEFAULT '',
  "quota" integer NOT NULL DEFAULT '0',
  "usage" integer NOT NULL DEFAULT '0',
  "max_size" integer NOT NULL DEFAULT '0',
  "max_aggr_count" integer NOT NULL DEFAULT '0',
  "max_aggr_size" integer NOT NULL DEFAULT '0',
  "max_history_count" integer NOT NULL DEFAULT '0',
  "gmt_create" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "gmt_modified" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uk_group_id UNIQUE ("group_id")
);

COMMENT ON TABLE "group_capacity" IS '集群、各Group容量信息表';
COMMENT ON COLUMN "group_capacity"."id" IS '主键ID';
COMMENT ON COLUMN "group_capacity"."group_id" IS 'Group ID，空字符表示整个集群';
COMMENT ON COLUMN "group_capacity"."quota" IS '配额，0表示使用默认值';
COMMENT ON COLUMN "group_capacity"."usage" IS '使用量';
COMMENT ON COLUMN "group_capacity"."max_size" IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "group_capacity"."max_aggr_count" IS '聚合子配置最大个数，，0表示使用默认值';
COMMENT ON COLUMN "group_capacity"."max_aggr_size" IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "group_capacity"."max_history_count" IS '最大变更历史数量';
COMMENT ON COLUMN "group_capacity"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "group_capacity"."gmt_modified" IS '修改时间';

/******************************************/
/*   表名称 = his_config_info              */
/******************************************/
CREATE TABLE "his_config_info" (
  "id" bigint NOT NULL,
  "nid" SERIAL PRIMARY KEY,
  "data_id" varchar(255) NOT NULL,
  "group_id" varchar(128) NOT NULL,
  "app_name" varchar(128) DEFAULT NULL,
  "content" text NOT NULL,
  "md5" varchar(32) DEFAULT NULL,
  "gmt_create" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "gmt_modified" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "src_user" text,
  "src_ip" varchar(50) DEFAULT NULL,
  "op_type" char(10) DEFAULT NULL,
  "tenant_id" varchar(128) DEFAULT '',
  "encrypted_data_key" varchar(1024) DEFAULT ''
);

COMMENT ON TABLE "his_config_info" IS '多租户改造';
COMMENT ON COLUMN "his_config_info"."id" IS 'id';
COMMENT ON COLUMN "his_config_info"."nid" IS 'nid, 自增标识';
COMMENT ON COLUMN "his_config_info"."data_id" IS 'data_id';
COMMENT ON COLUMN "his_config_info"."group_id" IS 'group_id';
COMMENT ON COLUMN "his_config_info"."app_name" IS 'app_name';
COMMENT ON COLUMN "his_config_info"."content" IS 'content';
COMMENT ON COLUMN "his_config_info"."md5" IS 'md5';
COMMENT ON COLUMN "his_config_info"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "his_config_info"."gmt_modified" IS '修改时间';
COMMENT ON COLUMN "his_config_info"."src_user" IS 'source user';
COMMENT ON COLUMN "his_config_info"."src_ip" IS 'source ip';
COMMENT ON COLUMN "his_config_info"."op_type" IS 'operation type';
COMMENT ON COLUMN "his_config_info"."tenant_id" IS '租户字段';
COMMENT ON COLUMN "his_config_info"."encrypted_data_key" IS '密钥';

-- 删除已存在的索引
DROP INDEX IF EXISTS idx_gmt_create;
DROP INDEX IF EXISTS idx_gmt_modified;
DROP INDEX IF EXISTS idx_did;
CREATE INDEX idx_gmt_create ON "his_config_info" ("gmt_create");
CREATE INDEX idx_gmt_modified ON "his_config_info" ("gmt_modified");
CREATE INDEX idx_did ON "his_config_info" ("data_id");

/******************************************/
/*   表名称 = tenant_capacity              */
/******************************************/
CREATE TABLE "tenant_capacity" (
  "id" SERIAL PRIMARY KEY,
  "tenant_id" varchar(128) NOT NULL DEFAULT '',
  "quota" integer NOT NULL DEFAULT '0',
  "usage" integer NOT NULL DEFAULT '0',
  "max_size" integer NOT NULL DEFAULT '0',
  "max_aggr_count" integer NOT NULL DEFAULT '0',
  "max_aggr_size" integer NOT NULL DEFAULT '0',
  "max_history_count" integer NOT NULL DEFAULT '0',
  "gmt_create" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "gmt_modified" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uk_tenant_id UNIQUE ("tenant_id")
);

COMMENT ON TABLE "tenant_capacity" IS '租户容量信息表';
COMMENT ON COLUMN "tenant_capacity"."id" IS '主键ID';
COMMENT ON COLUMN "tenant_capacity"."tenant_id" IS 'Tenant ID';
COMMENT ON COLUMN "tenant_capacity"."quota" IS '配额，0表示使用默认值';
COMMENT ON COLUMN "tenant_capacity"."usage" IS '使用量';
COMMENT ON COLUMN "tenant_capacity"."max_size" IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "tenant_capacity"."max_aggr_count" IS '聚合子配置最大个数';
COMMENT ON COLUMN "tenant_capacity"."max_aggr_size" IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "tenant_capacity"."max_history_count" IS '最大变更历史数量';
COMMENT ON COLUMN "tenant_capacity"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "tenant_capacity"."gmt_modified" IS '修改时间';

/******************************************/
/*   表名称 = tenant_info                  */
/******************************************/
CREATE TABLE "tenant_info" (
  "id" SERIAL PRIMARY KEY,
  "kp" varchar(128) NOT NULL,
  "tenant_id" varchar(128) DEFAULT '',
  "tenant_name" varchar(128) DEFAULT '',
  "tenant_desc" varchar(256) DEFAULT NULL,
  "create_source" varchar(32) DEFAULT NULL,
  "gmt_create" bigint NOT NULL,
  "gmt_modified" bigint NOT NULL,
  CONSTRAINT uk_tenant_info_kptenantid UNIQUE ("kp", "tenant_id")
);

COMMENT ON TABLE "tenant_info" IS 'tenant_info';
COMMENT ON COLUMN "tenant_info"."id" IS 'id';
COMMENT ON COLUMN "tenant_info"."kp" IS 'kp';
COMMENT ON COLUMN "tenant_info"."tenant_id" IS 'tenant_id';
COMMENT ON COLUMN "tenant_info"."tenant_name" IS 'tenant_name';
COMMENT ON COLUMN "tenant_info"."tenant_desc" IS 'tenant_desc';
COMMENT ON COLUMN "tenant_info"."create_source" IS 'create_source';
COMMENT ON COLUMN "tenant_info"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "tenant_info"."gmt_modified" IS '修改时间';

-- 删除已存在的索引
DROP INDEX IF EXISTS idx_tenant_id;
CREATE INDEX idx_tenant_id ON "tenant_info" ("tenant_id");

/******************************************/
/*   表名称 = users                        */
/******************************************/
CREATE TABLE "users" (
  "username" varchar(50) PRIMARY KEY,
  "password" varchar(500) NOT NULL,
  "enabled" boolean NOT NULL
);

COMMENT ON TABLE "users" IS 'users';
COMMENT ON COLUMN "users"."username" IS 'username';
COMMENT ON COLUMN "users"."password" IS 'password';
COMMENT ON COLUMN "users"."enabled" IS 'enabled';

/******************************************/
/*   表名称 = roles                        */
/******************************************/
CREATE TABLE "roles" (
  "username" varchar(50) NOT NULL,
  "role" varchar(50) NOT NULL
);

COMMENT ON TABLE "roles" IS 'roles';
COMMENT ON COLUMN "roles"."username" IS 'username';
COMMENT ON COLUMN "roles"."role" IS 'role';

-- 删除已存在的索引
DROP INDEX IF EXISTS idx_user_role;
CREATE UNIQUE INDEX idx_user_role ON "roles" ("username", "role");

/******************************************/
/*   表名称 = permissions                  */
/******************************************/
CREATE TABLE "permissions" (
  "role" varchar(50) NOT NULL,
  "resource" varchar(128) NOT NULL,
  "action" varchar(8) NOT NULL
);

COMMENT ON TABLE "permissions" IS 'permissions';
COMMENT ON COLUMN "permissions"."role" IS 'role';
COMMENT ON COLUMN "permissions"."resource" IS 'resource';
COMMENT ON COLUMN "permissions"."action" IS 'action';

-- 删除已存在的索引
DROP INDEX IF EXISTS uk_role_permission;
CREATE UNIQUE INDEX uk_role_permission ON "permissions" ("role", "resource", "action"); 