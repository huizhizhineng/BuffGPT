/*
 Navicat Premium Data Transfer

 Source Server         : 118.31.113.98-生产环境pg
 Source Server Type    : PostgreSQL
 Source Server Version : 140012
 Source Host           : 118.31.113.98:17506
 Source Catalog        : platform
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140012
 File Encoding         : 65001

 Date: 01/04/2025 15:15:45
*/

-- ----------------------------
-- Table structure for t_model_support
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_model_support";
CREATE TABLE "public"."t_model_support" (
  "id" "pg_catalog"."uuid" NOT NULL,
  "model_name" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "provider_id" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "model_specs" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "model_type" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "max_length" "pg_catalog"."int4",
  "deploy_type" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "api_type" "pg_catalog"."int4" NOT NULL,
  "deploy_properties" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "status" "pg_catalog"."int4" NOT NULL,
  "create_time" "pg_catalog"."timestamp" NOT NULL,
  "update_time" "pg_catalog"."timestamp" NOT NULL,
  "fc_status" "pg_catalog"."int4" NOT NULL DEFAULT 0
)
;


-- ----------------------------
-- Records of t_model_support
-- ----------------------------
INSERT INTO "public"."t_model_support" VALUES ('f89197fe-a1b9-4e8c-8841-13b2e4cc8167', 'qwen2.5-1.5b-instruct', '100005', 'qwen2.5-1.5b-instruct', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('97c04288-1be2-498c-88f7-62be62d8aa13', 'qwen-plus-chat', '100005', 'qwen-plus-chat', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('bdf1073f-a484-4252-882c-f2a1997f8da0', 'qwen2.5-72b-instruct', '100005', 'qwen2.5-72b-instruct', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('8d86830e-dabd-4e67-a3b3-3e0a49e9834e', 'qwen2.5-coder-7b-instruct', '100005', 'qwen2.5-coder-7b-instruct', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('16445798-dd8c-4ec1-8ec0-a266abd2dfc6', 'qwen2-math-1.5b-instruct', '100005', 'qwen2-math-1.5b-instruct', 'chat', 2000, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('da5c96cb-1cb3-4652-86cd-9052dea4b95b', 'qwen2-math-7b-instruct', '100005', 'qwen2-math-7b-instruct', 'chat', 2000, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('246bbfc7-4132-4560-b660-9066083b2f88', 'qwen2-math-72b-instruct', '100005', 'qwen2-math-72b-instruct', 'chat', 2000, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('5b58b9a2-80dc-4fee-a757-718170a9ff9c', 'qwen-coder-turbo', '100005', 'qwen-coder-turbo', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('a19a02ed-4115-49e1-a35f-3a938e7eb57e', 'qwen2.5-32b-instruct', '100005', 'qwen2.5-32b-instruct', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('8cac8c6d-53a9-4e0e-8b67-2d578dff5023', 'qwen-coder-turbo-latest', '100005', 'qwen-coder-turbo-latest', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('29d39527-e2e8-4c6a-8129-33c277aed6eb', 'qwen-vl-plus', '100005', 'qwen-vl-plus', 'chat', 2000, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.01, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.1, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 0);
INSERT INTO "public"."t_model_support" VALUES ('20c3cd01-19d9-4724-a3c4-f9e787276e44', 'qwen-math-plus', '100005', 'qwen-math-plus', 'chat', 3072, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('5cab9990-8a8b-40f8-ad00-531b8dce1239', 'qwen-max', '100005', 'qwen-max', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('9c54e967-9419-49c8-8aaa-c8021fcd166d', 'qwen-max-latest', '100005', 'qwen-max-latest', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('609f7a97-8734-4e8f-9d54-63f1c7d10368', 'qwen-max-longcontext', '100005', 'qwen-max-longcontext', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('e30c6e7d-dfc7-44f0-b80c-5536d73474d0', 'qwen-plus', '100005', 'qwen-plus', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('c0b63928-27d0-4817-989a-e8b938867a9c', 'qwen-turbo-0206', '100005', 'qwen-turbo-0206', 'chat', 8000, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('ea7b7e83-1fab-4315-a82f-f01d05bbb0e1', 'qwen-turbo-chat', '100005', 'qwen-turbo-chat', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('db88c871-856e-4c41-9f73-fa24e1c8e530', 'qwen-turbo', '100005', 'qwen-turbo', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('5dc3f258-f224-4cc3-855a-12e6f9d2320d', 'qwen-turbo-0919', '100005', 'qwen-turbo-0919', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('318520a6-47bc-43d2-8a93-f67cca468326', 'ernie-4.0-turbo-8k', '100002', 'ernie-4.0-turbo-8k', 'chat', 2048, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('24383cd0-0a9f-4b1f-928f-db219f79765e', 'qwen-math-turbo-latest', '100005', 'qwen-math-turbo-latest', 'chat', 3072, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 0);
INSERT INTO "public"."t_model_support" VALUES ('7d6af394-c41d-4e17-9361-d1f9ad645fcb', 'qwen-vl-plus-0809', '100005', 'qwen-vl-plus-0809', 'chat', 2048, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.01, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.001, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('25462ae0-8ee6-47f7-b1da-9e4d2a2aaf75', 'Doubao-pro-4k', '100008', 'Doubao-pro-4k', 'chat', 4096, 'volcengine_maas', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('ac1929c1-87e0-4020-96f6-e36d5ae58669', 'qwen-vl-max-0809', '100005', 'qwen-vl-max-0809', 'chat', 2048, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.01, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.001, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 0);
INSERT INTO "public"."t_model_support" VALUES ('a1d54fcf-1b1b-4444-ba65-fd62e5631b96', 'qwen2.5-0.5b-instruct', '100005', 'qwen2.5-0.5b-instruct', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 0);
INSERT INTO "public"."t_model_support" VALUES ('5aeb71c8-0d82-4f7a-8599-87ebf2fca622', 'glm-4v', '100003', 'glm-4v', 'chat', 1024, 'zhipuai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.6, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('358caf27-6dd5-470d-adbc-4a71ca04f1ce', 'Moonshot-v1-32k', '100008', 'Moonshot-v1-32k', 'chat', 16384, 'volcengine_maas', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('c6e06b7e-b4a1-448a-a19a-f62c0ef0edf0', 'GLM3-130B', '100008', 'GLM3-130B', 'chat', 4096, 'volcengine_maas', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('acf9e974-03cc-4b98-9e04-8f665343d288', 'ernie-4.0-8k', '100002', 'ernie-4.0-8k', 'chat', 8000, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('ca03636a-d5d6-42d1-b2b5-db1105966a6a', 'ernie-3.5-8k-1222', '100002', 'ernie-3.5-8k-1222', 'chat', 2048, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('fbc3304c-da29-4c44-8364-582a940daac3', 'ernie-3.5-128k', '100002', 'ernie-3.5-128k', 'chat', 4096, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('eac54fc2-1f0a-4d69-b4d4-c90c72818813', 'ernie-character-8k-0321', '100002', 'ernie-character-8k-0321', 'chat', 1024, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.95, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('35201331-2aff-4218-b0ce-d3cd2e09cf07', 'gpt-4o-2024-08-06', '100001', 'gpt-4o-2024-08-06', 'chat', 16384, 'openai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('3d12253f-e7bd-40d0-9728-774cd627198b', 'gpt-4o-2024-11-20', '100001', 'gpt-4o-2024-11-20', 'chat', 16384, 'openai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('2522f6cc-e037-433e-8a17-21a99bae2d07', 'gpt-3.5-turbo', '100001', 'gpt-3.5-turbo', 'chat', 4096, 'openai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('1163a8d6-d6a1-4831-9bc0-8fb1a49f0d65', 'gpt-3.5-turbo-instruct', '100001', 'gpt-3.5-turbo-instruct', 'chat', 4096, 'openai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('e29ae00b-b832-4765-8ead-52aa52d71b9f', 'ernie-bot-4', '100002', 'ernie-bot-4', 'chat', 4800, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.8, "min": 0.1, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('96cfca2f-53c3-47c6-b48a-dc1d79c9f39a', 'ernie-3.5-4k-0205', '100002', 'ernie-3.5-4k-0205', 'chat', 2048, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('b9954da5-ff16-4a79-bdea-56e590b156a2', 'ernie-4.0-turbo-128k', '100002', 'ernie-4.0-turbo-128k', 'chat', 4096, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('eecf3443-363c-4d06-86e9-c4a13e856835', 'ernie-bot', '100002', 'ernie-bot', 'chat', 4800, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('938098a7-bbab-4808-a8a0-12837e55953d', 'ernie-speed-8k', '100002', 'ernie-speed-8k', 'chat', 2048, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.95, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('96987a5c-9cd5-431e-a06b-d86cda748b87', 'ernie-bot-8k', '100002', 'ernie-bot-8k', 'chat', 8000, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.8, "min": 0.1, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('7ffa6874-43f3-4b9d-ba4d-56fb7ebc285c', 'ernie-speed-128k', '100002', 'ernie-speed-128k', 'chat', 4096, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.95, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('8ca94364-4bf1-430d-a943-db8e98cc853c', 'glm-4-0520', '100003', 'glm-4-0520', 'chat', 1024, 'zhipuai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.95, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('a9d6d48b-c4fe-4e53-b799-fb45b555dafe', 'yi_34b_chat', '100002', 'yi_34b_chat', 'chat', 4096, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('ea90183f-991e-46ab-bc18-f338d4e5ecb7', 'ernie-lite-8k-0308', '100002', 'ernie-lite-8k-0308', 'chat', 2048, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.95, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('d4effbbc-5804-4932-b1ad-a5941fdfd94c', 'glm-4-flash', '100003', 'glm-4-flash', 'chat', 4095, 'zhipuai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.95, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('0bc50221-60a6-4f03-a94a-911fca74c059', 'glm-3-turbo', '100003', 'glm-3-turbo', 'chat', 1024, 'zhipuai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.95, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('70b3caae-08fc-48e2-a5dc-73afb7f93a86', 'glm-4', '100003', 'glm-4', 'chat', 4095, 'zhipuai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.95, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('5cd10503-84aa-486f-8069-38e135d935a8', 'glm-4v-plus', '100003', 'glm-4v-plus', 'chat', 4095, 'zhipuai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.6, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('2c475b1f-3d0f-4864-8ed4-60374a2042e4', 'chatglm_turbo', '100003', 'chatglm_turbo', 'chat', 1024, 'zhipuai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.95, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.1, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('95c920e6-3220-4f2d-b0f7-e2c158e6a541', 'chatglm_pro', '100003', 'chatglm_pro', 'chat', 1024, 'zhipuai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.9, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.1, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('e2d4d1a5-6ad8-400e-9354-45cae3327f8c', 'chatglm_lite_32k', '100003', 'chatglm_lite_32k', 'chat', 1024, 'zhipuai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.9, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.1, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('77819126-b5e3-4266-9234-320b08b7b913', 'chatglm_std', '100003', 'chatglm_std', 'chat', 1024, 'zhipuai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.9, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.1, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('cb83d3be-fded-4a4d-a0cd-e95a2414c7bc', 'hunyuan-standard', '100006', 'hunyuan-standard', 'chat', 32000, 'hunyuan', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('58c968dd-3ec2-452e-87ad-db2d587d0bff', 'hunyuan-standard-256K', '100006', 'hunyuan-standard-256K', 'chat', 256000, 'hunyuan', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('e963639e-d928-4947-94af-f20869ae7e7b', 'hunyuan-lite', '100006', 'hunyuan-lite', 'chat', 1024, 'hunyuan', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('03e33d20-2fba-4e5c-9d7e-04bf5e511a02', 'hunyuan-vision', '100006', 'hunyuan-vision', 'chat', 8000, 'hunyuan', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('5793d5e9-4c87-41c9-99c9-16802ea685ed', 'moonshot-v1-8k', '100007', 'moonshot-v1-8k', 'chat', 8192, 'moonshot', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('d9353eb4-2018-4871-bcf4-26b694f09411', 'qwen2.5-3b-instruct', '100005', 'wen2.5-3b-instruct', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('a1665efc-c64c-482d-8a6c-c4c4b7f1f211', 'qwen2.5-14b-instruct', '100005', 'qwen2.5-14b-instruct', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('71c78d46-962b-447e-945d-a3a3011add24', 'qwen-plus-latest', '100005', 'qwen-plus-latest', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('6020c67b-3057-40b0-986a-264f875ef2f6', 'ernie-3.5-8k', '100002', 'ernie-3.5-8k', 'chat', 2048, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('e5f9369c-4fbf-4404-825e-de68bb894ace', 'glm-4v-flash', '100003', 'glm-4v-flash', 'chat', 1024, 'zhipuai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.8, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.6, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('7eab132c-7c1f-41b3-8c3d-ac613d3bfdec', 'glm-4-air', '100003', 'glm-4-air', 'chat', 4095, 'zhipuai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.95, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('86c474d8-69fb-4d0b-8beb-66103dd38ce5', 'Doubao-lite-4k', '100008', 'Doubao-lite-4k', 'chat', 4096, 'volcengine_maas', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('20141eae-a869-40eb-b77d-d8acff76e1e3', 'qwen-vl-max', '100005', 'qwen-vl-max', 'chat', 2048, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.01, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.1, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 0);
INSERT INTO "public"."t_model_support" VALUES ('fa49750c-2543-4454-bbc5-7109c0f076a2', 'ernie-bot-turbo', '100002', 'ernie-bot-turbo', 'chat', 11200, 'wenxin', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.8, "min": 0.1, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('1f10e545-19b2-4279-ae6d-0ef27d72c5a4', 'Doubao-pro-32k', '100008', 'Doubao-pro-32k', 'chat', 4096, 'volcengine_maas', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('12b89432-2dab-4a40-8eef-e5dee4d409f1', 'Doubao-lite-32k', '100008', 'Doubao-lite-32k', 'chat', 4096, 'volcengine_maas', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('ff4f800f-508f-427d-aa36-7d604e9a3995', 'Doubao-pro-128k', '100008', 'Doubao-pro-128k', 'chat', 4096, 'volcengine_maas', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('05164a70-7f01-480c-8388-adc8b7a3116f', 'Doubao-lite-128k', '100008', 'Doubao-lite-128k', 'chat', 4096, 'volcengine_maas', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('38b2a229-4af6-4d02-8653-0f07bf22c0af', 'Llama3-70B', '100008', 'Llama3-70B', 'chat', 8192, 'volcengine_maas', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('564726f7-dc4f-414f-8390-d758bfdb3aff', 'Skylark2-pro-4k', '100008', 'Skylark2-pro-4k', 'chat', 4096, 'volcengine_maas', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('172a1949-39a1-4aa8-a786-bd0b23386a8b', 'Mistral-7B', '100008', 'Mistral-7B', 'chat', 2048, 'volcengine_maas', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('964ccafd-2809-4c14-858b-06f6b51bc9db', 'Llama3-8B', '100008', 'Llama3-8B', 'chat', 8192, 'volcengine_maas', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('17fe5d5d-79f7-4500-9537-794c82014108', 'hunyuan-pro', '100006', 'hunyuan-pro', 'chat', 32000, 'hunyuan', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 0);
INSERT INTO "public"."t_model_support" VALUES ('3e8fa316-74b1-4c9e-aa68-408027179f1e', 'gpt-4o-mini', '100001', 'gpt-4o-mini', 'chat', 16384, 'openai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('8a10267b-0cf1-43e9-a2af-8b07f59773d2', 'gpt-4', '100001', 'gpt-4', 'chat', 8192, 'openai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('ff3f3772-937a-49fa-9f58-47e360deb8b2', 'gpt-4-32k', '100001', 'gpt-4-32k', 'chat', 32768, 'openai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('929a2629-9710-4127-9bda-521b8fe794b7', 'gpt-4-turbo', '100001', 'gpt-4-turbo', 'chat', 4096, 'openai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('5f97ea67-72b3-4533-a79f-56770c2bd3eb', 'qwen-turbo-latest', '100005', 'qwen-turbo-latest', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('130ec082-4e3f-4358-bf62-e38714c5e462', 'qwen2.5-7b-instruct', '100005', 'qwen2.5-7b-instruct', 'chat', 8192, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.7, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('9dcce7a7-4cdd-4846-b26a-f502eaa65f0e', 'Moonshot-v1-8k', '100008', 'Moonshot-v1-8k', 'chat', 4096, 'volcengine_maas', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('56866717-9181-4367-8341-3489f7745ef1', 'qwen-math-turbo', '100005', 'qwen-math-turbo', 'chat', 3072, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 0);
INSERT INTO "public"."t_model_support" VALUES ('82ac2479-2a2a-4540-875c-9c3dc15059e8', 'Moonshot-v1-128k', '100008', 'Moonshot-v1-128k', 'chat', 65536, 'volcengine_maas', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('15a65488-7db0-4fbe-ba78-f0d3aab814fd', 'glm-4-plus', '100003', 'glm-4-plus', 'chat', 4095, 'zhipuai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.95, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('82ac2479-2a2a-4540-875c-9c3dc1505919', 'deepseek-Distill-carrotai', '100009', 'deepseek-Distill-carrotai', 'chat', 4096, 'xinference', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-22 14:42:58', '2025-03-22 04:00:33', 0);
INSERT INTO "public"."t_model_support" VALUES ('09b1bd04-e3c2-44d6-8f79-a5514114a8df', 'deepseek-chat', '100004', 'deepseek-chat', 'chat', 4096, 'deepseek', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('06b3d705-41f0-4181-b71b-d4ef6cb860d3', 'deepseek-coder', '100004', 'deepseek-coder', 'chat', 4096, 'deepseek', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('6d0d4515-eab4-4927-8293-fad36d6c6375', 'hunyuan-turbo', '100006', 'hunyuan-turbo', 'chat', 32000, 'hunyuan', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('51d233e9-cc25-4856-96a0-243389ae1081', 'moonshot-v1-128k', '100007', 'moonshot-v1-128k', 'chat', 128000, 'moonshot', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('d95c30c2-5092-40e0-ad37-19a360bdca8f', 'moonshot-v1-32k', '100007', 'moonshot-v1-32k', 'chat', 32000, 'moonshot', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('8f4f0783-8f8f-4518-b080-cc67e803ded5', 'gpt-4o', '100001', 'gpt-4o', 'chat', 4096, 'openai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('db1f84d2-e37f-4731-8be0-23bbc4084394', 'gpt-3.5-turbo-1106', '100001', 'gpt-3.5-turbo-1106', 'chat', 4096, 'openai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('e15e6c2c-959b-4e50-8748-a4f7979e46c0', 'gpt-4o-2024-05-13', '100001', 'gpt-4o-2024-05-13', 'chat', 4096, 'openai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('a6e9fe71-a462-483c-8502-2d44cf1f6dd2', 'gpt-4o-mini-2024-07-18', '100001', 'gpt-4o-mini-2024-07-18', 'chat', 16384, 'openai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('ab347c18-3356-4c6a-9b4a-824a25cab617', 'gpt-3.5-turbo-0125', '100001', 'gpt-3.5-turbo-0125', 'chat', 4096, 'openai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('82ac2479-2a2a-4540-875c-9c3dc15059e1', 'qwen1.5-chat', '100009', 'qwen1.5-chat', 'chat', 131072, 'xinference', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 14:42:58', '2025-03-04 04:00:33', 1);
INSERT INTO "public"."t_model_support" VALUES ('bcadc420-0d80-4777-b352-4152a4f8be4f', 'gpt-4-0125-preview', '100001', 'gpt-4-0125-preview', 'chat', 4096, 'openai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 1.0, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('35dee1b5-1b1c-41bd-8e83-c9ea41dba4af', 'qwen-long', '100005', 'qwen-long', 'chat', 6000, 'tongyi', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1.0, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.8, "min": 0.1, "max": 0.9, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-06 10:45:57.714931', 1);
INSERT INTO "public"."t_model_support" VALUES ('c48d4efd-8695-4148-96be-c1cd3385bc56', 'glm-4-long', '100003', 'glm-4-long', 'chat', 4095, 'zhipuai', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 0.95, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-04 03:40:13.666139', '2025-03-04 03:40:13.666139', 1);
INSERT INTO "public"."t_model_support" VALUES ('72ac2479-2a2a-4540-875c-9c3dc1515919', 'qwen2.5-instruct', '100009', 'qwen2.5-instruct', 'chat', 7000, 'xinference', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-03-23 14:42:58', '2025-03-23 04:00:33', 1);
INSERT INTO "public"."t_model_support" VALUES ('82ac2479-2a2a-4540-875c-9c3dc1516919', 'CarrotAI', '100009', 'carrotai-3-instruct', 'chat', 7000, 'xinference', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 1.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}, {"name": "随机性", "key": "top_p", "type": "float", "default": 0.7, "min": 0.0, "max": 1.0, "help": "控制生成结果的随机性。数值越小，随机性越弱；数值越大，随机性越强。一般而言，top_p 和 temperature 两个参数选择一个进行调整即可。"}]', 0, '2025-04-22 14:42:58', '2025-04-22 04:00:33', 1);
INSERT INTO "public"."t_model_support" VALUES ('fe239a60-de11-472f-81f0-3cbedbddcd9b', 'deepseek-reasoner', '100004', 'deepseek-reasoner', 'chat', 4096, 'deepseek', 0, '[{"name": "温度", "key": "temperature", "type": "float", "default": 1, "min": 0.0, "max": 2.0, "help": "控制生成结果的多样性和随机性。数值越小，越严谨；数值越大，越发散。"}]', 0, '2025-06-13 03:40:13', '2025-06-13 03:40:13', 0);

-- ----------------------------
-- Primary Key structure for table t_model_support
-- ----------------------------
ALTER TABLE "public"."t_model_support" ADD CONSTRAINT "t_model_support_pkey" PRIMARY KEY ("id");


/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.7.2-platform
 Source Server Type    : PostgreSQL
 Source Server Version : 140005
 Source Host           : 192.168.7.2:5432
 Source Catalog        : platform
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140005
 File Encoding         : 65001

 Date: 27/02/2025 17:40:04
*/


-- ----------------------------
-- Table structure for t_auth_instance
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_auth_instance";
CREATE TABLE "public"."t_auth_instance" (
  "id" "pg_catalog"."uuid" NOT NULL,
  "name" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "template_id" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "template_name" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "template_description" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "provider_code" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "type" "pg_catalog"."int4",
  "content" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "template_params" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "status" "pg_catalog"."int4" NOT NULL,
  "create_time" "pg_catalog"."timestamp" NOT NULL,
  "update_time" "pg_catalog"."timestamp" NOT NULL
)
;

-- ----------------------------
-- Primary Key structure for table t_auth_instance
-- ----------------------------
ALTER TABLE "public"."t_auth_instance" ADD CONSTRAINT "t_auth_instance_pkey" PRIMARY KEY ("id");


/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.7.2-platform
 Source Server Type    : PostgreSQL
 Source Server Version : 140005
 Source Host           : 192.168.7.2:5432
 Source Catalog        : platform
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140005
 File Encoding         : 65001

 Date: 27/02/2025 17:40:13
*/


-- ----------------------------
-- Table structure for t_auth_template
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_auth_template";
CREATE TABLE "public"."t_auth_template" (
  "id" "pg_catalog"."uuid" NOT NULL,
  "name" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "provider_code" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "type" "pg_catalog"."int4",
  "description" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "properties" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "status" "pg_catalog"."int4" NOT NULL DEFAULT 3,
  "create_time" "pg_catalog"."timestamp" NOT NULL,
  "update_time" "pg_catalog"."timestamp" NOT NULL
)
;

-- ----------------------------
-- Primary Key structure for table t_auth_template
-- ----------------------------
ALTER TABLE "public"."t_auth_template" ADD CONSTRAINT "t_auth_template_pkey" PRIMARY KEY ("id");


/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.7.2-platform
 Source Server Type    : PostgreSQL
 Source Server Version : 140005
 Source Host           : 192.168.7.2:5432
 Source Catalog        : platform
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140005
 File Encoding         : 65001

 Date: 01/03/2025 16:16:11
*/


-- ----------------------------
-- Table structure for agent_message
-- ----------------------------
DROP TABLE IF EXISTS "public"."agent_message";
CREATE TABLE "public"."agent_message" (
  "id" "pg_catalog"."uuid" NOT NULL,
  "conversation_id" "pg_catalog"."varchar" COLLATE "pg_catalog"."default",
  "message_id" "pg_catalog"."varchar" COLLATE "pg_catalog"."default" NOT NULL,
  "type" "pg_catalog"."int4",
  "status" "pg_catalog"."int4",
  "duration" "pg_catalog"."float4",
  "tokens" "pg_catalog"."int4",
  "result" "pg_catalog"."text" COLLATE "pg_catalog"."default",
  "timestamp" "pg_catalog"."int8" NOT NULL,
  "create_time" "pg_catalog"."timestamp" NOT NULL,
  "update_time" "pg_catalog"."timestamp" NOT NULL
)
;

-- ----------------------------
-- Indexes structure for table agent_message
-- ----------------------------
CREATE INDEX "agentmessagemodel_message_id" ON "public"."agent_message" USING btree (
  "message_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table agent_message
-- ----------------------------
ALTER TABLE "public"."agent_message" ADD CONSTRAINT "agent_message_pkey" PRIMARY KEY ("id");


INSERT INTO "public"."spliter" ("id", "spliter_id", "spliter", "create_time", "update_time") VALUES (1, '77cfb857-4690-4c87-bc3b-2456a432caf9', 'Character TextSplitter (字符分割器)', '2025-02-28 17:42:30.549', '2025-02-28 17:42:35.829');
INSERT INTO "public"."spliter" ("id", "spliter_id", "spliter", "create_time", "update_time") VALUES (2, '6f81c61f-c8e2-4c41-9775-eff605d1dc0e', 'Code Text Splitter(代码分割器)', '2025-02-28 17:42:38.803', '2025-02-28 17:42:41.335');
INSERT INTO "public"."spliter" ("id", "spliter_id", "spliter", "create_time", "update_time") VALUES (3, 'd1095ac4-b3fc-4893-9d63-c0d02f1da62d', 'Markdown TextSplitter(Markdown 分割器)', '2025-02-28 17:42:45.634', '2025-02-28 17:42:49.083');

-- ----------------------------
-- Add preset data for LLM node conversation isolation scenarios
-- ----------------------------
INSERT INTO "public"."agents" ("id", "name", "agent_uuid", "description", "avatar_image", "agent_status", "agent_type", "model_configs", "model_parameters", "model_proof", "system_prompt", "opening_statement", "opening_remarks_issue", "is_knowledge", "knowledge_config", "entry_parameter", "auto_follow_up", "long_term_memory", "consecutive_memory_num", "long_term_memory_num", "is_publicity", "version", "is_delete", "modified", "delisting_cause", "delisting_info", "delisting_image", "websearch_config", "publish_time", "create_time", "update_time", "release_status", "score") VALUES (1, '大模型节点预设', '30a862f9-4fb6-410a-8507-e19536afea73', '大模型节点预设', '1', 1, 1, '{}', '{}', '{}', NULL, NULL, NULL, 't', '{}', NULL, 'f', 'f', 10, 6, 'f', '1', 'f', 1, NULL, NULL, NULL, '{}', NULL, '2025-06-14 15:22:39', '2025-06-14 15:22:44', 0, 1);


CREATE VIEW "public"."v_application_basic" AS SELECT t.id,
    t.application_uuid,
    t.application_no,
    t.avatar_image,
    t.application_name,
    t.application_type,
    t.publish_status,
    t.description,
    t.delisting_cause,
    t.delisting_info,
    t.delisting_image,
    t.version,
    t.status,
    t.created_at,
    t.updated_at,
    t.published_at,
    t.created_by,
    t.updated_by,
    t.modified,
    t.update_version,
    t.privacy_status,
    t.release_status,
    t.score
   FROM ( SELECT d.id,
            d.uuid AS application_uuid,
            d.definition_no AS application_no,
            d.icon AS avatar_image,
            d.name AS application_name,
            d.application_type,
            d.publish_status,
            d.description,
            d.delisting_cause,
            d.delisting_info,
            d.delisting_image,
            d.version,
                CASE
                    WHEN d.status = 1 THEN 2
                    WHEN d.status = 2 THEN 1
                    ELSE d.status
                END AS status,
            d.created_at,
            d.updated_at,
            d.published_at,
            d.created_by,
            d.updated_by,
            db.modified,
            db.update_version,
            db.privacy_status,
            '-1'::integer AS release_status,
            db.score
           FROM m_process_definition d
             JOIN m_process_definition_basic db ON d.definition_no::text = db.definition_no::text
        UNION ALL
         SELECT d.id,
            d.uuid AS application_uuid,
            d.definition_no AS application_no,
            d.icon AS avatar_image,
            d.name AS application_name,
            d.application_type,
            d.publish_status,
            d.description,
            d.delisting_cause,
            d.delisting_info,
            d.delisting_image,
            d.version,
                CASE
                    WHEN d.status = 1 THEN 2
                    WHEN d.status = 2 THEN 1
                    ELSE d.status
                END AS status,
            d.created_at,
            d.updated_at,
            d.published_at,
            d.created_by,
            d.updated_by,
            db.modified,
            db.update_version,
            db.privacy_status,
            '-1'::integer AS release_status,
            db.score
           FROM a_process_definition d
             JOIN a_process_definition_basic db ON d.definition_no::text = db.definition_no::text
        UNION ALL
         SELECT ag.id,
            ag.agent_uuid AS application_uuid,
            ag.agent_uuid AS application_no,
            ag.avatar_image,
            ag.name AS application_name,
            ag.agent_type AS application_type,
                CASE
                    WHEN ag.agent_status = 1 THEN 1
                    ELSE 0
                END AS publish_status,
            ag.description,
            ag.delisting_cause,
            ag.delisting_info,
            ag.delisting_image,
            ag.version::text AS version,
                CASE
                    WHEN ag.is_delete = true THEN 3
                    ELSE ag.agent_status
                END AS status,
            to_char(ag.create_time, 'YYYY-MM-DD HH24:MI:SS'::text) AS created_at,
            to_char(ag.update_time, 'YYYY-MM-DD HH24:MI:SS'::text) AS updated_at,
            to_char(ag.publish_time, 'YYYY-MM-DD HH24:MI:SS'::text) AS published_at,
            NULL::character varying AS created_by,
            NULL::character varying AS updated_by,
            ag.modified,
            NULL::bigint AS update_version,
                CASE
                    WHEN ag.is_publicity THEN 1
                    ELSE 0
                END AS privacy_status,
            ag.release_status,
            ag.score
           FROM agents ag) t;