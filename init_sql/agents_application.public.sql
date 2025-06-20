/*
 Navicat Premium Dump SQL

 Source Server         : buffgpt_pg_prod
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 118.31.113.98:17506
 Source Catalog        : agents_application
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 16/06/2025 11:28:39
*/


-- ----------------------------
-- Sequence structure for api_key_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."api_key_id_seq";
CREATE SEQUENCE "public"."api_key_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for application_api_key_relation_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."application_api_key_relation_id_seq";
CREATE SEQUENCE "public"."application_api_key_relation_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for application_code_demos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."application_code_demos_id_seq";
CREATE SEQUENCE "public"."application_code_demos_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for application_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."application_info_id_seq";
CREATE SEQUENCE "public"."application_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for intervention_rules_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."intervention_rules_id_seq";
CREATE SEQUENCE "public"."intervention_rules_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_agent_chat_async_record_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_agent_chat_async_record_id_seq";
CREATE SEQUENCE "public"."user_agent_chat_async_record_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_conversation_now_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_conversation_now_id_seq";
CREATE SEQUENCE "public"."user_conversation_now_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for api_key
-- ----------------------------
DROP TABLE IF EXISTS "public"."api_key";
CREATE TABLE "public"."api_key" (
  "id" int4 NOT NULL DEFAULT nextval('api_key_id_seq'::regclass),
  "key_no" varchar(32) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "period_of_validity_state" int4,
  "custom_time" int8,
  "api_key" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "open_state" int4,
  "use_num" int4 DEFAULT 0,
  "user_del" bool DEFAULT false,
  "tenant_id" int8,
  "productline" int8 DEFAULT 0,
  "del" bool DEFAULT false,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."api_key"."key_no" IS 'key 编号';
COMMENT ON COLUMN "public"."api_key"."name" IS 'KEY 名称';
COMMENT ON COLUMN "public"."api_key"."period_of_validity_state" IS '有效期 1永久 30 90 180 0、自定义时间';
COMMENT ON COLUMN "public"."api_key"."custom_time" IS '自定义时间';
COMMENT ON COLUMN "public"."api_key"."api_key" IS 'key';
COMMENT ON COLUMN "public"."api_key"."open_state" IS '状态 1、启用 0、停用';
COMMENT ON COLUMN "public"."api_key"."use_num" IS '应用 使用数量';
COMMENT ON COLUMN "public"."api_key"."user_del" IS '用户删除标记';
COMMENT ON COLUMN "public"."api_key"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."api_key"."productline" IS '产品线';
COMMENT ON COLUMN "public"."api_key"."del" IS '是否删除';
COMMENT ON COLUMN "public"."api_key"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."api_key"."creator" IS '创建人';
COMMENT ON COLUMN "public"."api_key"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."api_key"."updater" IS '更新人';

-- ----------------------------
-- Table structure for application_api_key_relation
-- ----------------------------
DROP TABLE IF EXISTS "public"."application_api_key_relation";
CREATE TABLE "public"."application_api_key_relation" (
  "id" int4 NOT NULL DEFAULT nextval('application_api_key_relation_id_seq'::regclass),
  "key_id" int8 NOT NULL,
  "key_no" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "application_id" int8 NOT NULL,
  "application_no" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "agent_uuid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "agent_id" int8,
  "tenant_id" int8 NOT NULL DEFAULT 0,
  "productline" int8 NOT NULL DEFAULT 0,
  "create_by" int8 NOT NULL,
  "update_by" int8 NOT NULL,
  "create_by_productline" int8 NOT NULL,
  "update_by_productline" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6),
  "del_flag" char(1) COLLATE "pg_catalog"."default" DEFAULT '0'::bpchar,
  "workflow_application_id" int4,
  "multi_agent_application_id" int4
)
;
COMMENT ON COLUMN "public"."application_api_key_relation"."key_id" IS 'key id';
COMMENT ON COLUMN "public"."application_api_key_relation"."key_no" IS 'key 编号';
COMMENT ON COLUMN "public"."application_api_key_relation"."application_id" IS '应用id';
COMMENT ON COLUMN "public"."application_api_key_relation"."application_no" IS '应用no';
COMMENT ON COLUMN "public"."application_api_key_relation"."agent_uuid" IS '智能体uuid';
COMMENT ON COLUMN "public"."application_api_key_relation"."agent_id" IS '智能体id';
COMMENT ON COLUMN "public"."application_api_key_relation"."tenant_id" IS '所属租户ID';
COMMENT ON COLUMN "public"."application_api_key_relation"."del_flag" IS '删除标记，0未删除，1已删除';
COMMENT ON COLUMN "public"."application_api_key_relation"."workflow_application_id" IS '工作流应用ID';
COMMENT ON COLUMN "public"."application_api_key_relation"."multi_agent_application_id" IS '多智能体应用ID';

-- ----------------------------
-- Table structure for application_code_demos
-- ----------------------------
DROP TABLE IF EXISTS "public"."application_code_demos";
CREATE TABLE "public"."application_code_demos" (
  "id" int8 NOT NULL DEFAULT nextval('application_code_demos_id_seq'::regclass),
  "application_type" int4,
  "code_demo_json" text COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."application_code_demos"."code_demo_json" IS '代码示例（压缩json字符串）';
COMMENT ON COLUMN "public"."application_code_demos"."description" IS '描述';


-- ----------------------------
-- Records of application_code_demos
-- ----------------------------
INSERT INTO "public"."application_code_demos" VALUES (1, 1, '[
    {
        "bizType": 1,
        "bizName": "单轮对话",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"agentId\": 87,\r\n    \"conversationId\": \"1898918319210237967\",\r\n    \"distance\": 0.5,\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setAgentId(87L);\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setDistance(0.5);\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build()));\r\n        request.setCallbackUrl(\"https://www.baidu.com\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        // agentUuid/agentId 二选一\r\n        private String agentUuid;\r\n        private Long agentId;\r\n        // 会话id\r\n        private String conversationId;\r\n        private Double distance;\r\n        // 消息体\r\n        private List<Message> messages;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n    static class Message {\r\n        // 内容\r\n        private String content;\r\n        // 角色\r\n        private String role;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \\\r\n-H \"Content-Type: application/json\" \\\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n-d ''{\r\n    \"agentId\": 128,\r\n    \"conversationId\": \"1898928216899457025\",\r\n    \"distance\": 0.5,\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 2,
        "bizName": "多轮对话",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"agentId\": 87,\r\n    \"conversationId\": \"1898918319210237967\",\r\n    \"distance\": 0.5,\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        },\r\n        {\r\n            \"content\": \"你好1\",\r\n            \"role\": \"assistant\"\r\n        },\r\n        {\r\n            \"content\": \"你好2\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setAgentId(87L);\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setDistance(0.5);\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build(),Message.builder().content(\"你好1\").role(\"user\").build(),Message.builder().content(\"你好2\").role(\"user\").build()));\r\n        request.setCallbackUrl(\"https://www.baidu.com\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        // agentUuid/agentId 二选一\r\n        private String agentUuid;\r\n        private Long agentId;\r\n        // 会话id\r\n        private String conversationId;\r\n        private Double distance;\r\n        // 消息体\r\n        private List<Message> messages;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n    static class Message {\r\n        // 内容\r\n        private String content;\r\n        // 角色\r\n        private String role;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \\\r\n-H \"Content-Type: application/json\" \\\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n-d ''{\r\n    \"agentId\": 128,\r\n    \"conversationId\": \"1898928216899457025\",\r\n    \"distance\": 0.5,\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        },\r\n        {\r\n            \"content\": \"你好1\",\r\n            \"role\": \"user\"\r\n        },\r\n        {\r\n            \"content\": \"你好2\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 3,
        "bizName": "自定义参数传递",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n# 请求体\r\ndata = {\r\n    \"agentId\": 87,\r\n    \"conversationId\": \"1898918319210237967\",\r\n    \"distance\": 0.5,\r\n    \"entryParameter\": {\r\n        \"tools\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ],\r\n        \"workflows\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ]\r\n    },\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setAgentId(87L);\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setDistance(0.5);\r\n        request.setEntryParameter(new EntryParameter());\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build()));\r\n        request.setCallbackUrl(\"https://www.baidu.com\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        // agentUuid/agentId 二选一\r\n        private String agentUuid;\r\n        private Long agentId;\r\n        // 会话id\r\n        private String conversationId;\r\n        private Double distance;\r\n        // 聊天输入变量\r\n        private EntryParameter entryParameter;\r\n        // 消息体\r\n        private List<Message> messages;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n    static class EntryParameter {\r\n        // 插件参数\r\n        private List<ParentParam> tools;\r\n        // 工作流参数\r\n        private List<ParentParam> workflows;\r\n\r\n        static class ParentParam {\r\n            // 插件和工作流id\r\n            private String id;\r\n            // 键值对\r\n            private List<Param> params;\r\n        }\r\n        static class Param {\r\n            // 键\r\n            private String name;\r\n            // 值\r\n            private Object value;\r\n            // 0业务透传；1模式识别\r\n            private Integer source;\r\n        }\r\n    }\r\n    static class Message {\r\n        // 内容\r\n        private String content;\r\n        // 角色\r\n        private String role;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \\\r\n-H \"Content-Type: application/json\" \\\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n-d ''{\r\n    \"agentId\": 128,\r\n    \"conversationId\": \"1898928216899457025\",\r\n    \"distance\": 0.5,\r\n    \"entryParameter\": {\r\n        \"tools\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ],\r\n        \"workflows\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ]\r\n    },\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 4,
        "bizName": "流式输出",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport aiohttp\r\nimport asyncio\r\n\r\nasync def fetch_sse():\r\n    # 请求 URL\r\n    url = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/sse/execute\"\r\n\r\n    # 请求头\r\n    headers = {\r\n        \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n    }\r\n\r\n    # 请求体\r\n    payload = {\r\n    \"agentId\": 87,\r\n    \"conversationId\": \"1898918319210237967\",\r\n    \"distance\": 0.5,\r\n    \"entryParameter\": {\r\n        \"tools\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ],\r\n        \"workflows\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ]\r\n    },\r\n    \"fileList\": [\r\n        {\r\n            \"fileName\": \"1111.txt\",\r\n            \"url\": \"https://wwww.sss.11111.txt\"\r\n        }\r\n    ],\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ]\r\n}\r\n\r\n    # 创建 aiohttp 客户端会话\r\n    async with aiohttp.ClientSession() as session:\r\n        # 发送 POST 请求\r\n        async with session.post(url, headers=headers, json=payload) as response:\r\n            # 检查响应状态\r\n            if response.status != 200:\r\n                print(f\"Error: {response.status}\")\r\n                return\r\n\r\n            # 逐行读取 SSE 事件流\r\n            async for line in response.content:\r\n                # 解码字节为字符串\r\n                line = line.decode(''utf-8'').strip()\r\n                if line:\r\n                    print(f\"Received event: {line}\")\r\n\r\n# 运行异步任务\r\nasync def main():\r\n    await fetch_sse()\r\n\r\n# 启动事件循环\r\nif __name__ == \"__main__\":\r\n    asyncio.run(main())\r\n",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setAgentId(87L);\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setDistance(0.5);\r\n        request.setEntryParameter(new EntryParameter());\r\n        request.setFileList(ListUtil.toList());\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build()));\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建 WebClient\r\n        WebClient webClient = WebClient.builder()\r\n                .baseUrl(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/sse/execute\")\r\n                .defaultHeaders(httpHeaders -> httpHeaders.addAll(headers))\r\n                .build();\r\n                // 发送 SSE 请求\r\n        Flux<ServerSentEvent<String>> eventStream = webClient.post()\r\n                .bodyValue(request)\r\n                .accept(MediaType.TEXT_EVENT_STREAM)\r\n                .retrieve()\r\n                .bodyToFlux(ServerSentEvent.class);\r\n\r\n        // 处理 SSE 事件\r\n        eventStream.subscribe(\r\n                event -> {\r\n                    System.out.println(\"Received event: \" + event.data());\r\n                },\r\n                error -> {\r\n                    System.err.println(\"Error occurred: \" + error.getMessage());\r\n                },\r\n                () -> {\r\n                    System.out.println(\"SSE stream completed.\");\r\n                }\r\n        );\r\n\r\n        // 保持主线程不退出（SSE 是异步的）\r\n        try {\r\n            Thread.sleep(60000); // 等待 60 秒\r\n        } catch (InterruptedException e) {\r\n            e.printStackTrace();\r\n        }\r\n    }\r\n    @Data\r\n    @NoArgsConstructor\r\n    @AllArgsConstructor\r\n    static class ApiRequest {\r\n\r\n        private String agentUuid;\r\n\r\n        private Long agentId;\r\n\r\n        private String memoryId;\r\n\r\n        /**\r\n         * 会话id\r\n         */\r\n        private String conversationId;\r\n\r\n        private Double distance;\r\n\r\n        /**\r\n         * 聊天输入变量\r\n         */\r\n        private EntryParameter entryParameter;\r\n\r\n        /**\r\n         * 文件信息\r\n         */\r\n        private List<File> fileList;\r\n\r\n        /**\r\n         * 消息体\r\n         */\r\n        private List<Message> messages;\r\n\r\n        /**\r\n         * 回调地址\r\n         */\r\n        private String callbackUrl;\r\n    }\r\n    @Data\r\n    @NoArgsConstructor\r\n    @AllArgsConstructor\r\n    static class EntryParameter {\r\n        /**\r\n         * 插件参数\r\n         */\r\n        private List<ParentParam> tools;\r\n        /**\r\n         * 工作流参数\r\n         */\r\n        private List<ParentParam> workflows;\r\n\r\n        static class ParentParam {\r\n            /**\r\n             * 插件和工作流id\r\n             */\r\n            private String id;\r\n            /**\r\n             * 键值对\r\n             */\r\n            private List<Param> params;\r\n        }\r\n\r\n        static class Param {\r\n\r\n            /**\r\n             * 键\r\n             */\r\n            private String name;\r\n\r\n            /**\r\n             * 值\r\n             */\r\n            private Object value;\r\n            /**\r\n             * 0业务透传；1模式识别\r\n             */\r\n            private Integer source;\r\n        }\r\n\r\n    }\r\n    @Data\r\n    @NoArgsConstructor\r\n    @AllArgsConstructor\r\n    @Builder\r\n    static class File {\r\n        /**\r\n         * 文件名称，含后缀\r\n         */\r\n        private String fileName;\r\n        /**\r\n         * 文件链接\r\n         */\r\n        private String url;\r\n    }\r\n    @Data\r\n    @NoArgsConstructor\r\n    @AllArgsConstructor\r\n    @Builder\r\n    static class Message {\r\n        /**\r\n         * 内容\r\n         */\r\n        private String content;\r\n        /**\r\n         * 角色\r\n         */\r\n        private String role;\r\n    }\r\n}",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -N -X POST \\\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/sse/execute \\\r\n-H \"Content-Type: application/json\" \\\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n-d ''{\r\n    \"agentId\": 128,\r\n    \"conversationId\": \"1898928216899457025\",\r\n    \"distance\": 0.5,\r\n    \"entryParameter\": {\r\n        \"tools\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ],\r\n        \"workflows\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ]\r\n    },\r\n    \"fileList\": [\r\n        {\r\n            \"fileName\": \"1111.txt\",\r\n            \"url\": \"https://wwww.sss.11111.txt\"\r\n        }\r\n    ],\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ]\r\n}''\r\n\r\n-N：禁用缓冲，确保实时接收 SSE 事件。",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 5,
        "bizName": "长期记忆",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"agentId\": 87,\r\n    \"memoryId\": \"1898918319210\",\r\n    \"conversationId\": \"1898918319210237967\",\r\n    \"distance\": 0.5,\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setAgentId(87L);\r\n        request.setMemoryId(\"18989183192102\");\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setDistance(0.5);\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build()));\r\n        request.setCallbackUrl(\"https://www.baidu.com\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        // agentUuid/agentId 二选一\r\n        private String agentUuid;\r\n        private Long agentId;\r\n        // 记忆id\r\n        private String memoryId;\r\n        // 会话id\r\n        private String conversationId;\r\n        private Double distance;\r\n        // 消息体\r\n        private List<Message> messages;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n    static class Message {\r\n        // 内容\r\n        private String content;\r\n        // 角色\r\n        private String role;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \\\r\n-H \"Content-Type: application/json\" \\\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n-d ''{\r\n    \"agentId\": 128,\r\n    \"memoryId\": \"18989282168994\",\r\n    \"conversationId\": \"1898928216899457025\",\r\n    \"distance\": 0.5,\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 6,
        "bizName": "上传文件",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"agentId\": 87,\r\n    \"conversationId\": \"1898918319210237967\",\r\n    \"distance\": 0.5,\r\n    \"fileList\": [\r\n        {\r\n            \"fileName\": \"1111.txt\",\r\n            \"url\": \"https://wwww.sss.11111.txt\"\r\n        }\r\n    ],\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": "```python\r\nimport requests\r\n\r\n# 定义URL和agentId\r\nurl = \"https://buffgpt.agentsyun.com/open/v1/uploadFile\"\r\nagent_id = \"73\"\r\n\r\n# 定义文件路径\r\nfile_path = \"file_path\"  # 请将此路径替换为你要上传的文件路径\r\n\r\n# 定义请求头，包括API-KEY\r\nheaders = {\r\n    \"API-KEY\": \"ak-XXXXXXXXXXXX\"\r\n}\r\n\r\n# 构造请求参数\r\nfiles = {\r\n    ''file'': open(file_path, ''rb'')\r\n}\r\nparams = {\r\n    ''agentId'': agent_id\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, files=files, params=params, headers=headers)\r\n\r\n# 打印响应结果\r\nprint(\"Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.text)\r\n\r\n# 关闭文件\r\nfiles[''file''].close()"
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setAgentId(87L);\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setDistance(0.5);\r\n        request.setFileList(ListUtil.toList());\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build()));\r\n        request.setCallbackUrl(\"https://www.baidu.com\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        // agentUuid/agentId 二选一\r\n        private String agentUuid;\r\n        private Long agentId;\r\n        // 会话id\r\n        private String conversationId;\r\n        private Double distance;\r\n        // 文件信息\r\n        private List<File> fileList;\r\n        // 消息体\r\n        private List<Message> messages;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n    static class File {\r\n        // 文件名称，含后缀\r\n        private String fileName;\r\n        // 文件链接\r\n        private String url;\r\n    }\r\n    static class Message {\r\n        // 内容\r\n        private String content;\r\n        // 角色\r\n        private String role;\r\n    }\r\n}\r\n",
                "fileCode": "```java\r\nimport org.springframework.beans.factory.annotation.Autowired;\r\nimport org.springframework.core.io.FileSystemResource;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.stereotype.Service;\r\nimport org.springframework.util.LinkedMultiValueMap;\r\nimport org.springframework.util.MultiValueMap;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.io.File;\r\n\r\npublic class FileUploadService {\r\n    public static void main(String[] args) {\r\n        // 创建文件资源\r\n        FileSystemResource fileResource = new FileSystemResource(new File(filePath));\r\n\r\n        // 构建请求体\r\n        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();\r\n        body.add(\"file\", fileResource);\r\n\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.MULTIPART_FORM_DATA);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n\r\n        // 创建 HttpEntity\r\n        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);\r\n\r\n        private RestTemplate restTemplate;\r\n        // 发送请求并获取响应\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/open/v1/uploadFile?agentId=73\", requestEntity, String.class);\r\n\r\n        // 获取响应状态码和响应内容\r\n        int statusCode = response.getStatusCodeValue();\r\n        String responseBody = response.getBody();\r\n\r\n        System.out.println(\"Response Status Code: \" + statusCode);\r\n        System.out.println(\"Response Body: \" + responseBody);\r\n    }\r\n}"
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \\\r\n-H \"Content-Type: application/json\" \\\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n-d ''{\r\n    \"agentId\": 128,\r\n    \"conversationId\": \"1898928216899457025\",\r\n    \"distance\": 0.5,\r\n    \"fileList\": [\r\n        {\r\n            \"fileName\": \"1111.txt\",\r\n            \"url\": \"https://wwww.sss.11111.txt\"\r\n        }\r\n    ],\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}''",
                "fileCode": "```http\r\ncurl -X POST \\\r\n  https://buffgpt.agentsyun.com/open/v1/uploadFile?agentId=73 \\\r\n  -H \"Content-Type: multipart/form-data\" \\\r\n  -H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n  -F \"file=@/home/user/documents/test.txt\""
            }
        ]
    }
]', '普通智能体应用');
INSERT INTO "public"."application_code_demos" VALUES (2, 2, '[
    {
        "bizType": 1,
        "bizName": "单轮对话",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"agentId\": 87,\r\n    \"conversationId\": \"1898918319210237967\",\r\n    \"distance\": 0.5,\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setAgentId(87L);\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setDistance(0.5);\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build()));\r\n        request.setCallbackUrl(\"https://www.baidu.com\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        // agentUuid/agentId 二选一\r\n        private String agentUuid;\r\n        private Long agentId;\r\n        // 会话id\r\n        private String conversationId;\r\n        private Double distance;\r\n        // 消息体\r\n        private List<Message> messages;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n    static class Message {\r\n        // 内容\r\n        private String content;\r\n        // 角色\r\n        private String role;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \\\r\n-H \"Content-Type: application/json\" \\\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n-d ''{\r\n    \"agentId\": 128,\r\n    \"conversationId\": \"1898928216899457025\",\r\n    \"distance\": 0.5,\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 2,
        "bizName": "多轮对话",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"agentId\": 87,\r\n    \"conversationId\": \"1898918319210237967\",\r\n    \"distance\": 0.5,\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        },\r\n        {\r\n            \"content\": \"你好1\",\r\n            \"role\": \"assistant\"\r\n        },\r\n        {\r\n            \"content\": \"你好2\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setAgentId(87L);\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setDistance(0.5);\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build(),Message.builder().content(\"你好1\").role(\"user\").build(),Message.builder().content(\"你好2\").role(\"user\").build()));\r\n        request.setCallbackUrl(\"https://www.baidu.com\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        // agentUuid/agentId 二选一\r\n        private String agentUuid;\r\n        private Long agentId;\r\n        // 会话id\r\n        private String conversationId;\r\n        private Double distance;\r\n        // 消息体\r\n        private List<Message> messages;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n    static class Message {\r\n        // 内容\r\n        private String content;\r\n        // 角色\r\n        private String role;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \\\r\n-H \"Content-Type: application/json\" \\\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n-d ''{\r\n    \"agentId\": 128,\r\n    \"conversationId\": \"1898928216899457025\",\r\n    \"distance\": 0.5,\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        },\r\n        {\r\n            \"content\": \"你好1\",\r\n            \"role\": \"user\"\r\n        },\r\n        {\r\n            \"content\": \"你好2\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 3,
        "bizName": "自定义参数传递",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n# 请求体\r\ndata = {\r\n    \"agentId\": 87,\r\n    \"conversationId\": \"1898918319210237967\",\r\n    \"distance\": 0.5,\r\n    \"entryParameter\": {\r\n        \"tools\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ],\r\n        \"workflows\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ]\r\n    },\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setAgentId(87L);\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setDistance(0.5);\r\n        request.setEntryParameter(new EntryParameter());\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build()));\r\n        request.setCallbackUrl(\"https://www.baidu.com\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        // agentUuid/agentId 二选一\r\n        private String agentUuid;\r\n        private Long agentId;\r\n        // 会话id\r\n        private String conversationId;\r\n        private Double distance;\r\n        // 聊天输入变量\r\n        private EntryParameter entryParameter;\r\n        // 消息体\r\n        private List<Message> messages;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n    static class EntryParameter {\r\n        // 插件参数\r\n        private List<ParentParam> tools;\r\n        // 工作流参数\r\n        private List<ParentParam> workflows;\r\n\r\n        static class ParentParam {\r\n            // 插件和工作流id\r\n            private String id;\r\n            // 键值对\r\n            private List<Param> params;\r\n        }\r\n        static class Param {\r\n            // 键\r\n            private String name;\r\n            // 值\r\n            private Object value;\r\n            // 0业务透传；1模式识别\r\n            private Integer source;\r\n        }\r\n    }\r\n    static class Message {\r\n        // 内容\r\n        private String content;\r\n        // 角色\r\n        private String role;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \\\r\n-H \"Content-Type: application/json\" \\\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n-d ''{\r\n    \"agentId\": 128,\r\n    \"conversationId\": \"1898928216899457025\",\r\n    \"distance\": 0.5,\r\n    \"entryParameter\": {\r\n        \"tools\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ],\r\n        \"workflows\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ]\r\n    },\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 4,
        "bizName": "流式输出",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport aiohttp\r\nimport asyncio\r\n\r\nasync def fetch_sse():\r\n    # 请求 URL\r\n    url = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/sse/execute\"\r\n\r\n    # 请求头\r\n    headers = {\r\n        \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n    }\r\n\r\n    # 请求体\r\n    payload = {\r\n    \"agentId\": 87,\r\n    \"conversationId\": \"1898918319210237967\",\r\n    \"distance\": 0.5,\r\n    \"entryParameter\": {\r\n        \"tools\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ],\r\n        \"workflows\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ]\r\n    },\r\n    \"fileList\": [\r\n        {\r\n            \"fileName\": \"1111.txt\",\r\n            \"url\": \"https://wwww.sss.11111.txt\"\r\n        }\r\n    ],\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ]\r\n}\r\n\r\n    # 创建 aiohttp 客户端会话\r\n    async with aiohttp.ClientSession() as session:\r\n        # 发送 POST 请求\r\n        async with session.post(url, headers=headers, json=payload) as response:\r\n            # 检查响应状态\r\n            if response.status != 200:\r\n                print(f\"Error: {response.status}\")\r\n                return\r\n\r\n            # 逐行读取 SSE 事件流\r\n            async for line in response.content:\r\n                # 解码字节为字符串\r\n                line = line.decode(''utf-8'').strip()\r\n                if line:\r\n                    print(f\"Received event: {line}\")\r\n\r\n# 运行异步任务\r\nasync def main():\r\n    await fetch_sse()\r\n\r\n# 启动事件循环\r\nif __name__ == \"__main__\":\r\n    asyncio.run(main())\r\n",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setAgentId(87L);\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setDistance(0.5);\r\n        request.setEntryParameter(new EntryParameter());\r\n        request.setFileList(ListUtil.toList());\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build()));\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建 WebClient\r\n        WebClient webClient = WebClient.builder()\r\n                .baseUrl(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/sse/execute\")\r\n                .defaultHeaders(httpHeaders -> httpHeaders.addAll(headers))\r\n                .build();\r\n                // 发送 SSE 请求\r\n        Flux<ServerSentEvent<String>> eventStream = webClient.post()\r\n                .bodyValue(request)\r\n                .accept(MediaType.TEXT_EVENT_STREAM)\r\n                .retrieve()\r\n                .bodyToFlux(ServerSentEvent.class);\r\n\r\n        // 处理 SSE 事件\r\n        eventStream.subscribe(\r\n                event -> {\r\n                    System.out.println(\"Received event: \" + event.data());\r\n                },\r\n                error -> {\r\n                    System.err.println(\"Error occurred: \" + error.getMessage());\r\n                },\r\n                () -> {\r\n                    System.out.println(\"SSE stream completed.\");\r\n                }\r\n        );\r\n\r\n        // 保持主线程不退出（SSE 是异步的）\r\n        try {\r\n            Thread.sleep(60000); // 等待 60 秒\r\n        } catch (InterruptedException e) {\r\n            e.printStackTrace();\r\n        }\r\n    }\r\n    @Data\r\n    @NoArgsConstructor\r\n    @AllArgsConstructor\r\n    static class ApiRequest {\r\n\r\n        private String agentUuid;\r\n\r\n        private Long agentId;\r\n\r\n        private String memoryId;\r\n\r\n        /**\r\n         * 会话id\r\n         */\r\n        private String conversationId;\r\n\r\n        private Double distance;\r\n\r\n        /**\r\n         * 聊天输入变量\r\n         */\r\n        private EntryParameter entryParameter;\r\n\r\n        /**\r\n         * 文件信息\r\n         */\r\n        private List<File> fileList;\r\n\r\n        /**\r\n         * 消息体\r\n         */\r\n        private List<Message> messages;\r\n\r\n        /**\r\n         * 回调地址\r\n         */\r\n        private String callbackUrl;\r\n    }\r\n    @Data\r\n    @NoArgsConstructor\r\n    @AllArgsConstructor\r\n    static class EntryParameter {\r\n        /**\r\n         * 插件参数\r\n         */\r\n        private List<ParentParam> tools;\r\n        /**\r\n         * 工作流参数\r\n         */\r\n        private List<ParentParam> workflows;\r\n\r\n        static class ParentParam {\r\n            /**\r\n             * 插件和工作流id\r\n             */\r\n            private String id;\r\n            /**\r\n             * 键值对\r\n             */\r\n            private List<Param> params;\r\n        }\r\n\r\n        static class Param {\r\n\r\n            /**\r\n             * 键\r\n             */\r\n            private String name;\r\n\r\n            /**\r\n             * 值\r\n             */\r\n            private Object value;\r\n            /**\r\n             * 0业务透传；1模式识别\r\n             */\r\n            private Integer source;\r\n        }\r\n\r\n    }\r\n    @Data\r\n    @NoArgsConstructor\r\n    @AllArgsConstructor\r\n    @Builder\r\n    static class File {\r\n        /**\r\n         * 文件名称，含后缀\r\n         */\r\n        private String fileName;\r\n        /**\r\n         * 文件链接\r\n         */\r\n        private String url;\r\n    }\r\n    @Data\r\n    @NoArgsConstructor\r\n    @AllArgsConstructor\r\n    @Builder\r\n    static class Message {\r\n        /**\r\n         * 内容\r\n         */\r\n        private String content;\r\n        /**\r\n         * 角色\r\n         */\r\n        private String role;\r\n    }\r\n}",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -N -X POST \\\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/sse/execute \\\r\n-H \"Content-Type: application/json\" \\\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n-d ''{\r\n    \"agentId\": 128,\r\n    \"conversationId\": \"1898928216899457025\",\r\n    \"distance\": 0.5,\r\n    \"entryParameter\": {\r\n        \"tools\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ],\r\n        \"workflows\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ]\r\n    },\r\n    \"fileList\": [\r\n        {\r\n            \"fileName\": \"1111.txt\",\r\n            \"url\": \"https://wwww.sss.11111.txt\"\r\n        }\r\n    ],\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ]\r\n}''\r\n\r\n-N：禁用缓冲，确保实时接收 SSE 事件。",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 5,
        "bizName": "长期记忆",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"agentId\": 87,\r\n    \"memoryId\": \"1898918319210\",\r\n    \"conversationId\": \"1898918319210237967\",\r\n    \"distance\": 0.5,\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setAgentId(87L);\r\n        request.setMemoryId(\"18989183192102\");\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setDistance(0.5);\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build()));\r\n        request.setCallbackUrl(\"https://www.baidu.com\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        // agentUuid/agentId 二选一\r\n        private String agentUuid;\r\n        private Long agentId;\r\n        // 记忆id\r\n        private String memoryId;\r\n        // 会话id\r\n        private String conversationId;\r\n        private Double distance;\r\n        // 消息体\r\n        private List<Message> messages;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n    static class Message {\r\n        // 内容\r\n        private String content;\r\n        // 角色\r\n        private String role;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \\\r\n-H \"Content-Type: application/json\" \\\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n-d ''{\r\n    \"agentId\": 128,\r\n    \"memoryId\": \"18989282168994\",\r\n    \"conversationId\": \"1898928216899457025\",\r\n    \"distance\": 0.5,\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 6,
        "bizName": "上传文件",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"agentId\": 87,\r\n    \"conversationId\": \"1898918319210237967\",\r\n    \"distance\": 0.5,\r\n    \"fileList\": [\r\n        {\r\n            \"fileName\": \"1111.txt\",\r\n            \"url\": \"https://wwww.sss.11111.txt\"\r\n        }\r\n    ],\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": "```python\r\nimport requests\r\n\r\n# 定义URL和agentId\r\nurl = \"https://buffgpt.agentsyun.com/open/v1/uploadFile\"\r\nagent_id = \"73\"\r\n\r\n# 定义文件路径\r\nfile_path = \"file_path\"  # 请将此路径替换为你要上传的文件路径\r\n\r\n# 定义请求头，包括API-KEY\r\nheaders = {\r\n    \"API-KEY\": \"ak-XXXXXXXXXXXX\"\r\n}\r\n\r\n# 构造请求参数\r\nfiles = {\r\n    ''file'': open(file_path, ''rb'')\r\n}\r\nparams = {\r\n    ''agentId'': agent_id\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, files=files, params=params, headers=headers)\r\n\r\n# 打印响应结果\r\nprint(\"Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.text)\r\n\r\n# 关闭文件\r\nfiles[''file''].close()"
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setAgentId(87L);\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setDistance(0.5);\r\n        request.setFileList(ListUtil.toList());\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build()));\r\n        request.setCallbackUrl(\"https://www.baidu.com\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        // agentUuid/agentId 二选一\r\n        private String agentUuid;\r\n        private Long agentId;\r\n        // 会话id\r\n        private String conversationId;\r\n        private Double distance;\r\n        // 文件信息\r\n        private List<File> fileList;\r\n        // 消息体\r\n        private List<Message> messages;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n    static class File {\r\n        // 文件名称，含后缀\r\n        private String fileName;\r\n        // 文件链接\r\n        private String url;\r\n    }\r\n    static class Message {\r\n        // 内容\r\n        private String content;\r\n        // 角色\r\n        private String role;\r\n    }\r\n}\r\n",
                "fileCode": "```java\r\nimport org.springframework.beans.factory.annotation.Autowired;\r\nimport org.springframework.core.io.FileSystemResource;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.stereotype.Service;\r\nimport org.springframework.util.LinkedMultiValueMap;\r\nimport org.springframework.util.MultiValueMap;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.io.File;\r\n\r\npublic class FileUploadService {\r\n    public static void main(String[] args) {\r\n        // 创建文件资源\r\n        FileSystemResource fileResource = new FileSystemResource(new File(filePath));\r\n\r\n        // 构建请求体\r\n        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();\r\n        body.add(\"file\", fileResource);\r\n\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.MULTIPART_FORM_DATA);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n\r\n        // 创建 HttpEntity\r\n        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);\r\n\r\n        private RestTemplate restTemplate;\r\n        // 发送请求并获取响应\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/open/v1/uploadFile?agentId=73\", requestEntity, String.class);\r\n\r\n        // 获取响应状态码和响应内容\r\n        int statusCode = response.getStatusCodeValue();\r\n        String responseBody = response.getBody();\r\n\r\n        System.out.println(\"Response Status Code: \" + statusCode);\r\n        System.out.println(\"Response Body: \" + responseBody);\r\n    }\r\n}"
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \\\r\n-H \"Content-Type: application/json\" \\\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n-d ''{\r\n    \"agentId\": 128,\r\n    \"conversationId\": \"1898928216899457025\",\r\n    \"distance\": 0.5,\r\n    \"fileList\": [\r\n        {\r\n            \"fileName\": \"1111.txt\",\r\n            \"url\": \"https://wwww.sss.11111.txt\"\r\n        }\r\n    ],\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"http://www.baidu.com\"\r\n}''",
                "fileCode": "```http\r\ncurl -X POST \\\r\n  https://buffgpt.agentsyun.com/open/v1/uploadFile?agentId=73 \\\r\n  -H \"Content-Type: multipart/form-data\" \\\r\n  -H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n  -F \"file=@/home/user/documents/test.txt\""
            }
        ]
    }
]', 'RAG智能体应用');
INSERT INTO "public"."application_code_demos" VALUES (3, 3, '[
    {
        "bizType": 1,
        "bizName": "单轮对话",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/dialog/workflow\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"workflowApplicationId\": \"110\",\r\n    \"definitionUuid\": \"3df25c8b-66fd-4d84-8e84-0b1c587e2d73\",\r\n    \"updateVersion\": 21,\r\n    \"userId\": \"100002:189687992818911611:1896879928776318911:official\",\r\n    \"conversationId\": \"1917036657236905111\",\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"回调地址\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setWorkflowApplicationId(110);\r\n        request.setDefinitionUuid(\"3df25c8b-66fd-4d84-8e84-0b1c587e2d73\");\r\n        request.setUpdateVersion(21);\r\n        request.setUserId(\"100002:189687992818911611:1896879928776318911:official\");\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build()));\r\n        request.setCallbackUrl(\"回调地址\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/dialog/workflow\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        // 应用uuid\r\n        private String definitionUuid;\r\n        // 版本号\r\n        private Integer updateVersion;\r\n        // 用户Id\r\n        private String userId;\r\n        // 会话id\r\n        private String conversationId;\r\n        // 聊天输入变量\r\n        private EntryParameter entryParameter;\r\n        // 文件信息\r\n        private List<File> fileList;\r\n        // 消息体\r\n        private List<Message> messages;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n    static class EntryParameter {\r\n        // 插件参数\r\n        private List<ParentParam> tools;\r\n        // 工作流参数\r\n        private List<ParentParam> workflows;\r\n\r\n        static class ParentParam {\r\n            // 插件和工作流id\r\n            private String id;\r\n            // 键值对\r\n            private List<Param> params;\r\n        }\r\n        static class Param {\r\n            // 键\r\n            private String name;\r\n            // 值\r\n            private Object value;\r\n            // 0业务透传；1模式识别\r\n            private Integer source;\r\n        }\r\n    }\r\n    static class File {\r\n        // 文件名称，含后缀\r\n        private String fileName;\r\n        // 文件链接\r\n        private String url;\r\n    }\r\n    static class Message {\r\n        // 内容\r\n        private String content;\r\n        // 角色 user/assistant\r\n        private String role;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \\r\n-H \"Content-Type: application/json\" \\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\r\n-d ''{\r\n    \"workflowApplicationId\": \"110\",\r\n    \"definitionUuid\":\"3df25c8b-66fd-4d84-8e84-0b1c587e2d73\",\r\n    \"updateVersion\": 21,\r\n    \"userId\":\"100002:189687992818911611:1896879928776318911:official\",\r\n    \"conversationId\": \"18989282168994571213\",\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"回调地址\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 2,
        "bizName": "多轮对话",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/dialog/workflow\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"workflowApplicationId\": \"110\",\r\n    \"definitionUuid\": \"3df25c8b-66fd-4d84-8e84-0b1c587e2d73\",\r\n    \"updateVersion\": 21,\r\n    \"userId\": \"100002:189687992818911611:1896879928776318911:official\",\r\n    \"conversationId\": \"1917036657236905111\",\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        },\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"assistant\"\r\n        },\r\n        {\r\n            \"content\": \"你是谁\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"回调地址\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setWorkflowApplicationId(110);\r\n        request.setDefinitionUuid(\"3df25c8b-66fd-4d84-8e84-0b1c587e2d73\");\r\n        request.setUpdateVersion(21);\r\n        request.setUserId(\"100002:189687992818911611:1896879928776318911:official\");\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build(),Message.builder().content(\"你好\").role(\"assistant\").build(),Message.builder().content(\"你是谁\").role(\"user\").build()));\r\n        request.setCallbackUrl(\"回调地址\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/dialog/workflow\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        // 应用uuid\r\n        private String definitionUuid;\r\n        // 版本号\r\n        private Integer updateVersion;\r\n        // 用户Id\r\n        private String userId;\r\n        // 会话id\r\n        private String conversationId;\r\n        // 聊天输入变量\r\n        private EntryParameter entryParameter;\r\n        // 文件信息\r\n        private List<File> fileList;\r\n        // 消息体\r\n        private List<Message> messages;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n    static class EntryParameter {\r\n        // 插件参数\r\n        private List<ParentParam> tools;\r\n        // 工作流参数\r\n        private List<ParentParam> workflows;\r\n\r\n        static class ParentParam {\r\n            // 插件和工作流id\r\n            private String id;\r\n            // 键值对\r\n            private List<Param> params;\r\n        }\r\n        static class Param {\r\n            // 键\r\n            private String name;\r\n            // 值\r\n            private Object value;\r\n            // 0业务透传；1模式识别\r\n            private Integer source;\r\n        }\r\n    }\r\n    static class File {\r\n        // 文件名称，含后缀\r\n        private String fileName;\r\n        // 文件链接\r\n        private String url;\r\n    }\r\n    static class Message {\r\n        // 内容\r\n        private String content;\r\n        // 角色 user/assistant\r\n        private String role;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \\r\n-H \"Content-Type: application/json\" \\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\r\n-d ''{\r\n    \"workflowApplicationId\": \"110\",\r\n    \"definitionUuid\":\"3df25c8b-66fd-4d84-8e84-0b1c587e2d73\",\r\n    \"updateVersion\": 21,\r\n    \"userId\":\"100002:189687992818911611:1896879928776318911:official\",\r\n    \"conversationId\": \"18989282168994571213\",\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        },\r\n        {\r\n            \"content\": \"你好1\",\r\n            \"role\": \"assistant\"\r\n        },\r\n        {\r\n            \"content\": \"你好2\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"回调地址\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 3,
        "bizName": "自定义参数传递",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/dialog/workflow\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"workflowApplicationId\": \"110\",\r\n    \"definitionUuid\": \"3df25c8b-66fd-4d84-8e84-0b1c587e2d73\",\r\n    \"updateVersion\": 21,\r\n    \"userId\": \"100002:189687992818911611:1896879928776318911:official\",\r\n    \"conversationId\": \"1917036657236905111\",\r\n    \"entryParameter\": [\r\n        {\r\n            \"name\": \"aaa\",\r\n            \"source\": 0,\r\n            \"value\": \"1\"\r\n        },\r\n        {\r\n            \"name\": \"bbb\",\r\n            \"source\": 0,\r\n            \"value\": \"222\"\r\n        },\r\n        {\r\n            \"name\": \"USER_INPUT\",\r\n            \"source\": 0,\r\n            \"value\": \"你好\"\r\n        }\r\n    ],\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"回调地址\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setWorkflowApplicationId(110);\r\n        request.setDefinitionUuid(\"3df25c8b-66fd-4d84-8e84-0b1c587e2d73\");\r\n        request.setUpdateVersion(21);\r\n        request.setUserId(\"100002:189687992818911611:1896879928776318911:official\");\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setEntryParameter(new EntryParameter());\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build()));\r\n        request.setCallbackUrl(\"回调地址\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/dialog/workflow\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        // 应用uuid\r\n        private String definitionUuid;\r\n        // 版本号\r\n        private Integer updateVersion;\r\n        // 用户Id\r\n        private String userId;\r\n        // 会话id\r\n        private String conversationId;\r\n        // 聊天输入变量\r\n        private EntryParameter entryParameter;\r\n        // 文件信息\r\n        private List<File> fileList;\r\n        // 消息体\r\n        private List<Message> messages;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n    static class EntryParameter {\r\n        // 插件参数\r\n        private List<ParentParam> tools;\r\n        // 工作流参数\r\n        private List<ParentParam> workflows;\r\n\r\n        static class ParentParam {\r\n            // 插件和工作流id\r\n            private String id;\r\n            // 键值对\r\n            private List<Param> params;\r\n        }\r\n        static class Param {\r\n            // 键\r\n            private String name;\r\n            // 值\r\n            private Object value;\r\n            // 0业务透传；1模式识别\r\n            private Integer source;\r\n        }\r\n    }\r\n    static class File {\r\n        // 文件名称，含后缀\r\n        private String fileName;\r\n        // 文件链接\r\n        private String url;\r\n    }\r\n    static class Message {\r\n        // 内容\r\n        private String content;\r\n        // 角色 user/assistant\r\n        private String role;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \\r\n-H \"Content-Type: application/json\" \\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\r\n-d ''{\r\n    \"workflowApplicationId\": \"110\",\r\n    \"definitionUuid\":\"3df25c8b-66fd-4d84-8e84-0b1c587e2d73\",\r\n    \"updateVersion\": 21,\r\n    \"userId\":\"100002:189687992818911611:1896879928776318911:official\",\r\n    \"conversationId\": \"18989282168994571213\",\r\n    \"entryParameter\": {\r\n        \"tools\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ],\r\n        \"workflows\": [\r\n            {\r\n                \"id\": \"9047aa71-22ca-41dd-bb70-bc51ff4edc3a\",\r\n                \"params\": [\r\n                    {\r\n                        \"name\": \"city\",\r\n                        \"value\": \"\",\r\n                        \"source\": null\r\n                    }\r\n                ]\r\n            }\r\n        ]\r\n    },\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"回调地址\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 4,
        "bizName": "流式输出",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 5,
        "bizName": "长期记忆",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 6,
        "bizName": "上传文件",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/dialog/workflow\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"workflowApplicationId\": \"110\",\r\n    \"definitionUuid\": \"3df25c8b-66fd-4d84-8e84-0b1c587e2d73\",\r\n    \"updateVersion\": 21,\r\n    \"userId\": \"100002:189687992818911611:1896879928776318911:official\",\r\n    \"conversationId\": \"1917036657236905111\",\r\n    \"fileList\": [\r\n        {\r\n            \"fileName\": \"1111.txt\",\r\n            \"url\": \"https://wwww.sss.11111.txt\"\r\n        }\r\n    ],\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"回调地址\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": "```python\r\nimport requests\r\n\r\n# 定义URL和agentId\r\nurl = \"https://buffgpt.agentsyun.com/open/v1/uploadFile\"\r\nagent_id = \"73\"\r\n\r\n# 定义文件路径\r\nfile_path = \"file_path\"  # 请将此路径替换为你要上传的文件路径\r\n\r\n# 定义请求头，包括API-KEY\r\nheaders = {\r\n    \"API-KEY\": \"ak-XXXXXXXXXXXX\"\r\n}\r\n\r\n# 构造请求参数\r\nfiles = {\r\n    ''file'': open(file_path, ''rb'')\r\n}\r\nparams = {\r\n    ''agentId'': agent_id\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, files=files, params=params, headers=headers)\r\n\r\n# 打印响应结果\r\nprint(\"Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.text)\r\n\r\n# 关闭文件\r\nfiles[''file''].close()"
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setWorkflowApplicationId(110);\r\n        request.setDefinitionUuid(\"3df25c8b-66fd-4d84-8e84-0b1c587e2d73\");\r\n        request.setUpdateVersion(21);\r\n        request.setUserId(\"100002:189687992818911611:1896879928776318911:official\");\r\n        request.setConversationId(\"1898918319210237967\");\r\n        request.setFileList(ListUtil.toList());\r\n        request.setMessages(ListUtil.toList(Message.builder().content(\"你好\").role(\"user\").build()));\r\n        request.setCallbackUrl(\"回调地址\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/dialog/workflow\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        // 应用uuid\r\n        private String definitionUuid;\r\n        // 版本号\r\n        private Integer updateVersion;\r\n        // 用户Id\r\n        private String userId;\r\n        // 会话id\r\n        private String conversationId;\r\n        // 聊天输入变量\r\n        private EntryParameter entryParameter;\r\n        // 文件信息\r\n        private List<File> fileList;\r\n        // 消息体\r\n        private List<Message> messages;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n    static class EntryParameter {\r\n        // 插件参数\r\n        private List<ParentParam> tools;\r\n        // 工作流参数\r\n        private List<ParentParam> workflows;\r\n\r\n        static class ParentParam {\r\n            // 插件和工作流id\r\n            private String id;\r\n            // 键值对\r\n            private List<Param> params;\r\n        }\r\n        static class Param {\r\n            // 键\r\n            private String name;\r\n            // 值\r\n            private Object value;\r\n            // 0业务透传；1模式识别\r\n            private Integer source;\r\n        }\r\n    }\r\n    static class File {\r\n        // 文件名称，含后缀\r\n        private String fileName;\r\n        // 文件链接\r\n        private String url;\r\n    }\r\n    static class Message {\r\n        // 内容\r\n        private String content;\r\n        // 角色 user/assistant\r\n        private String role;\r\n    }\r\n}\r\n",
                "fileCode": "```java\r\nimport org.springframework.beans.factory.annotation.Autowired;\r\nimport org.springframework.core.io.FileSystemResource;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.stereotype.Service;\r\nimport org.springframework.util.LinkedMultiValueMap;\r\nimport org.springframework.util.MultiValueMap;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.io.File;\r\n\r\npublic class FileUploadService {\r\n    public static void main(String[] args) {\r\n        // 创建文件资源\r\n        FileSystemResource fileResource = new FileSystemResource(new File(filePath));\r\n\r\n        // 构建请求体\r\n        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();\r\n        body.add(\"file\", fileResource);\r\n\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.MULTIPART_FORM_DATA);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n\r\n        // 创建 HttpEntity\r\n        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);\r\n\r\n        private RestTemplate restTemplate;\r\n        // 发送请求并获取响应\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/open/v1/uploadFile?agentId=73\", requestEntity, String.class);\r\n\r\n        // 获取响应状态码和响应内容\r\n        int statusCode = response.getStatusCodeValue();\r\n        String responseBody = response.getBody();\r\n\r\n        System.out.println(\"Response Status Code: \" + statusCode);\r\n        System.out.println(\"Response Body: \" + responseBody);\r\n    }\r\n}"
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute \\r\n-H \"Content-Type: application/json\" \\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\r\n-d ''{\r\n    \"workflowApplicationId\": \"110\",\r\n    \"definitionUuid\":\"3df25c8b-66fd-4d84-8e84-0b1c587e2d73\",\r\n    \"updateVersion\": 21,\r\n    \"userId\":\"100002:189687992818911611:1896879928776318911:official\",\r\n    \"conversationId\": \"18989282168994571213\",\r\n    \"fileList\": [\r\n        {\r\n            \"fileName\": \"1111.txt\",\r\n            \"url\": \"https://wwww.sss.11111.txt\"\r\n        }\r\n    ],\r\n    \"messages\": [\r\n        {\r\n            \"content\": \"你好\",\r\n            \"role\": \"user\"\r\n        }\r\n    ],\r\n    \"callbackUrl\": \"回调地址\"\r\n}''",
                "fileCode": "```http\r\ncurl -X POST \\\r\n  https://buffgpt.agentsyun.com/open/v1/uploadFile?agentId=73 \\\r\n  -H \"Content-Type: multipart/form-data\" \\\r\n  -H \"API-KEY: YOUR_API_KEY_VALUE\" \\\r\n  -F \"file=@/home/user/documents/test.txt\""
            }
        ]
    }
]', '对话型工作流应用');
INSERT INTO "public"."application_code_demos" VALUES (4, 4, '[
    {
        "bizType": 1,
        "bizName": "单轮对话",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/task/workflow\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"workflowApplicationId\": \"110\",\r\n    \"workflowApplicationUuid\": \"466bf125-e18d-4a1e-b0ef-4bd5fa08f69b\",\r\n    \"globalNodeInvokeDTO\": {\r\n        \"name\": \"buffgpt\",\r\n        \"age\": 20\r\n    },\r\n    \"version\": 49,\r\n    \"callbackUrl\": \"回调地址\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setWorkflowApplicationId(110);\r\n        request.setWorkflowApplicationUuid(87L);\r\n        request.setVersion(\"1898918319210237967\");\r\n        request.setGlobalNodeInvokeDTO(new Object());\r\n        request.setCallbackUrl(\"回调地址\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/task/workflow\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        private String workflowApplicationUuid;\r\n        private Integer version;\r\n        private Object globalNodeInvokeDTO;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/task/workflow \\r\n-H \"Content-Type: application/json\" \\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\r\n-d ''{\r\n    \"workflowApplicationId\": \"110\",\r\n    \"workflowApplicationUuid\": \"466bf125-e18d-4a1e-b0ef-4bd5fa08f69b\",\r\n    \"globalNodeInvokeDTO\": {\r\n        \"name\": \"buffgpt\",\r\n        \"age\": 20\r\n    },\r\n    \"version\": 49,\r\n    \"callbackUrl\": \"回调地址\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 2,
        "bizName": "多轮对话",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 3,
        "bizName": "自定义参数传递",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/task/workflow\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"workflowApplicationId\": \"110\",\r\n    \"workflowApplicationUuid\": \"466bf125-e18d-4a1e-b0ef-4bd5fa08f69b\",\r\n    \"globalNodeInvokeDTO\": {\r\n        \"name\": \"buffgpt\",\r\n        \"age\": 20\r\n    },\r\n    \"version\": 49,\r\n    \"callbackUrl\": \"回调地址\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setWorkflowApplicationId(110);\r\n        request.setWorkflowApplicationUuid(87L);\r\n        request.setVersion(\"1898918319210237967\");\r\n        request.setGlobalNodeInvokeDTO(new Object());\r\n        request.setCallbackUrl(\"回调地址\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/task/workflow\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        private String workflowApplicationUuid;\r\n        private Integer version;\r\n        private Object globalNodeInvokeDTO;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/task/workflow \\r\n-H \"Content-Type: application/json\" \\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\r\n-d ''{\r\n    \"workflowApplicationId\": \"110\",\r\n    \"workflowApplicationUuid\": \"466bf125-e18d-4a1e-b0ef-4bd5fa08f69b\",\r\n    \"globalNodeInvokeDTO\": {\r\n        \"name\": \"buffgpt\",\r\n        \"age\": 20\r\n    },\r\n    \"version\": 49,\r\n    \"callbackUrl\": \"回调地址\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 4,
        "bizName": "流式输出",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 5,
        "bizName": "长期记忆",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 6,
        "bizName": "上传文件",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "",
                "fileCode": null
            }
        ]
    }
]', '任务型工作流应用');
INSERT INTO "public"."application_code_demos" VALUES (5, 5, '[
    {
        "bizType": 1,
        "bizName": "单轮对话",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/dialog/multi-agent/workflow\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"multiAgentApplicationNo\": \"MAA19243733085314129926193\",\r\n    \"multiAgentApplicationUuid\": \"466bf125-e18d-4a1e-b0ef-4bd5fa08f69b\",\r\n    \"globalNodeInvokeDTO\": {\r\n        \"name\": \"buffgpt\",\r\n        \"age\": 20\r\n    },\r\n    \"version\": 49,\r\n    \"callbackUrl\": \"回调地址\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setmultiAgentApplicationNo(MAA19243733085314129926193);\r\n        request.setmultiAgentApplicationUuid(87L);\r\n        request.setVersion(\"1898918319210237967\");\r\n        request.setGlobalNodeInvokeDTO(new Object());\r\n        request.setCallbackUrl(\"回调地址\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/dialog/multi-agent/workflow\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        private String multiAgentApplicationUuid;\r\n        private Integer version;\r\n        private Object globalNodeInvokeDTO;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/dialog/multi-agent/workflow \\r\n-H \"Content-Type: application/json\" \\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\r\n-d ''{\r\n    \"multiAgentApplicationNo\": \"MAA19243733085314129926193\",\r\n    \"multiAgentApplicationUuid\": \"466bf125-e18d-4a1e-b0ef-4bd5fa08f69b\",\r\n    \"globalNodeInvokeDTO\": {\r\n        \"name\": \"buffgpt\",\r\n        \"age\": 20\r\n    },\r\n    \"version\": 49,\r\n    \"callbackUrl\": \"回调地址\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 2,
        "bizName": "多轮对话",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 3,
        "bizName": "自定义参数传递",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "```python\r\nimport requests\r\nimport json\r\n\r\n# 请求URL\r\nurl = \"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/dialog/multi-agent/workflow\"\r\n\r\n# 请求头\r\nheaders = {\r\n    \"Content-Type\": \"application/json\",\r\n    \"API-KEY\": \"YOUR_API_KEY_VALUE\"\r\n}\r\n\r\n# 请求体\r\ndata = {\r\n    \"multiAgentApplicationNo\": \"MAA19243733085314129926193\",\r\n    \"multiAgentApplicationUuid\": \"466bf125-e18d-4a1e-b0ef-4bd5fa08f69b\",\r\n    \"globalNodeInvokeDTO\": {\r\n        \"name\": \"buffgpt\",\r\n        \"age\": 20\r\n    },\r\n    \"version\": 49,\r\n    \"callbackUrl\": \"回调地址\"\r\n}\r\n\r\n# 发送POST请求\r\nresponse = requests.post(url, headers=headers, data=json.dumps(data))\r\n\r\n# 输出响应状态码和响应体\r\nprint(\"Response Status Code:\", response.status_code)\r\nprint(\"Response Body:\", response.json())",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "```java\r\npackage com.huizhi.service.openapi;\r\n\r\nimport cn.hutool.core.collection.ListUtil;\r\nimport lombok.AllArgsConstructor;\r\nimport lombok.Builder;\r\nimport lombok.Data;\r\nimport lombok.NoArgsConstructor;\r\nimport org.springframework.http.HttpEntity;\r\nimport org.springframework.http.HttpHeaders;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.http.ResponseEntity;\r\nimport org.springframework.web.client.RestTemplate;\r\nimport java.util.List;\r\n\r\npublic class OpenApiService {\r\n    public static void main(String[] args) {\r\n        ApiRequest request = new ApiRequest();\r\n        request.setmultiAgentApplicationNo(MAA19243733085314129926193);\r\n        request.setmultiAgentApplicationUuid(87L);\r\n        request.setVersion(\"1898918319210237967\");\r\n        request.setGlobalNodeInvokeDTO(new Object());\r\n        request.setCallbackUrl(\"回调地址\");\r\n        // 设置请求头\r\n        HttpHeaders headers = new HttpHeaders();\r\n        headers.setContentType(MediaType.APPLICATION_JSON);\r\n        // API KEY\r\n        headers.set(\"API-KEY\", \"YOUR_API_KEY_VALUE\");\r\n        // 创建请求实体\r\n        HttpEntity<ApiRequest> entity = new HttpEntity<>(request, headers);\r\n        RestTemplate restTemplate = new RestTemplate();\r\n        // 发送POST请求\r\n        ResponseEntity<String> response = restTemplate.postForEntity(\"https://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/dialog/multi-agent/workflow\", entity, String.class);// 输出响应结果\r\n        System.out.println(\"Response Status: \" + response.getStatusCode());\r\n        System.out.println(\"Response Body: \" + response.getBody());\r\n    }\r\n    \r\n    static class ApiRequest {\r\n        private String multiAgentApplicationUuid;\r\n        private Integer version;\r\n        private Object globalNodeInvokeDTO;\r\n        // 回调地址\r\n        private String callbackUrl;\r\n    }\r\n}\r\n",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "```http\r\ncurl -X POST \\r\nhttps://buffgpt.agentsyun.com/api/agents_application/open/v1/execute/dialog/multi-agent/workflow \\r\n-H \"Content-Type: application/json\" \\r\n-H \"API-KEY: YOUR_API_KEY_VALUE\" \\r\n-d ''{\r\n    \"multiAgentApplicationNo\": \"MAA19243733085314129926193\",\r\n    \"multiAgentApplicationUuid\": \"466bf125-e18d-4a1e-b0ef-4bd5fa08f69b\",\r\n    \"globalNodeInvokeDTO\": {\r\n        \"name\": \"buffgpt\",\r\n        \"age\": 20\r\n    },\r\n    \"version\": 49,\r\n    \"callbackUrl\": \"回调地址\"\r\n}''",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 4,
        "bizName": "流式输出",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 5,
        "bizName": "长期记忆",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "",
                "fileCode": null
            }
        ]
    },
    {
        "bizType": 6,
        "bizName": "上传文件",
        "snippets": [
            {
                "codeType": 1,
                "codeName": "Python",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 2,
                "codeName": "Java",
                "normalCode": "",
                "fileCode": null
            },
            {
                "codeType": 3,
                "codeName": "Http",
                "normalCode": "",
                "fileCode": null
            }
        ]
    }
]', '多智能体应用');

-- ----------------------------
-- Table structure for application_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."application_info";
CREATE TABLE "public"."application_info" (
  "id" int4 NOT NULL DEFAULT nextval('application_info_id_seq'::regclass),
  "agent_type" int4,
  "no" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "agent_uuid" varchar(255) COLLATE "pg_catalog"."default",
  "agent_status" int4,
  "is_publicity" bool,
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
COMMENT ON COLUMN "public"."application_info"."agent_type" IS '类型 1、普通智能体应用 2、RAG智能体应用';
COMMENT ON COLUMN "public"."application_info"."no" IS '智能体编号';
COMMENT ON COLUMN "public"."application_info"."name" IS '智能体名称';
COMMENT ON COLUMN "public"."application_info"."agent_uuid" IS '第三方智能体应用uuid';
COMMENT ON COLUMN "public"."application_info"."agent_status" IS '["正常": 1, "维护": 2, "下线": 3]';
COMMENT ON COLUMN "public"."application_info"."del_flag" IS '删除标记，0未删除，1已删除';

-- ----------------------------
-- Table structure for intervention_rules
-- ----------------------------
DROP TABLE IF EXISTS "public"."intervention_rules";
CREATE TABLE "public"."intervention_rules" (
  "id" int4 NOT NULL DEFAULT nextval('intervention_rules_id_seq'::regclass),
  "rule_no" varchar(255) COLLATE "pg_catalog"."default",
  "agent_no" varchar(255) COLLATE "pg_catalog"."default",
  "rule_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "rule_state" int2,
  "answer_content" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "conditions" text COLLATE "pg_catalog"."default" NOT NULL,
  "tenant_id" int8,
  "productline" int8 NOT NULL DEFAULT 0,
  "del" bool NOT NULL DEFAULT false,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0,
  "agent_third_id" varchar(255) COLLATE "pg_catalog"."default",
  "rule_third_id" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."intervention_rules"."rule_name" IS '规则名称，最多20个字';
COMMENT ON COLUMN "public"."intervention_rules"."rule_state" IS '规则状态（启用/停用）';
COMMENT ON COLUMN "public"."intervention_rules"."answer_content" IS '回复内容，最多200个字';
COMMENT ON COLUMN "public"."intervention_rules"."conditions" IS '判断条件 json';

-- ----------------------------
-- Table structure for user_agent_chat_async_record
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_agent_chat_async_record";
CREATE TABLE "public"."user_agent_chat_async_record" (
  "id" int4 NOT NULL DEFAULT nextval('user_agent_chat_async_record_id_seq'::regclass),
  "question" text COLLATE "pg_catalog"."default" NOT NULL,
  "tenant_id" int8 NOT NULL DEFAULT 0,
  "conversation_id" varchar(255) COLLATE "pg_catalog"."default",
  "message_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "agent_no" varchar(255) COLLATE "pg_catalog"."default",
  "agent_uuid" varchar(255) COLLATE "pg_catalog"."default",
  "user_id" varchar(255) COLLATE "pg_catalog"."default",
  "productline" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '0'::character varying,
  "request_state" int2 DEFAULT 0,
  "receive_mq_body" text COLLATE "pg_catalog"."default",
  "receive_mq_time" timestamp(6),
  "push_body" text COLLATE "pg_catalog"."default",
  "push_failed_info" varchar(1000) COLLATE "pg_catalog"."default",
  "device_id" varchar(500) COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "del" bool NOT NULL DEFAULT false,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0
)
;
COMMENT ON COLUMN "public"."user_agent_chat_async_record"."request_state" IS '状态：0未收到MQ,1已收到MQ未推送IM,2已推送IM,3IM推送失败';
COMMENT ON TABLE "public"."user_agent_chat_async_record" IS '用户智能体聊天异步处理记录';

-- ----------------------------
-- Table structure for user_conversation_now
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_conversation_now";
CREATE TABLE "public"."user_conversation_now" (
  "id" int4 NOT NULL DEFAULT nextval('user_conversation_now_id_seq'::regclass),
  "tenant_id" int8 NOT NULL DEFAULT 0,
  "productline" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '0'::character varying,
  "conversation_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "agent_no" varchar(255) COLLATE "pg_catalog"."default",
  "agent_uuid" varchar(255) COLLATE "pg_catalog"."default",
  "user_id" int8,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "creator" int8 DEFAULT 0,
  "del" bool NOT NULL DEFAULT false,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updater" int8 DEFAULT 0
)
;
COMMENT ON TABLE "public"."user_conversation_now" IS '用户当前会话';

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."api_key_id_seq"
OWNED BY "public"."api_key"."id";
SELECT setval('"public"."api_key_id_seq"', 62, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."application_api_key_relation_id_seq"
OWNED BY "public"."application_api_key_relation"."id";
SELECT setval('"public"."application_api_key_relation_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."application_code_demos_id_seq"
OWNED BY "public"."application_code_demos"."id";
SELECT setval('"public"."application_code_demos_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."application_info_id_seq"
OWNED BY "public"."application_info"."id";
SELECT setval('"public"."application_info_id_seq"', 546, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."intervention_rules_id_seq"
OWNED BY "public"."intervention_rules"."id";
SELECT setval('"public"."intervention_rules_id_seq"', 55, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."user_agent_chat_async_record_id_seq"
OWNED BY "public"."user_agent_chat_async_record"."id";
SELECT setval('"public"."user_agent_chat_async_record_id_seq"', 8234, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."user_conversation_now_id_seq"
OWNED BY "public"."user_conversation_now"."id";
SELECT setval('"public"."user_conversation_now_id_seq"', 451, true);

-- ----------------------------
-- Primary Key structure for table api_key
-- ----------------------------
ALTER TABLE "public"."api_key" ADD CONSTRAINT "api_key_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table application_api_key_relation
-- ----------------------------
ALTER TABLE "public"."application_api_key_relation" ADD CONSTRAINT "application_api_key_relation_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table application_code_demos
-- ----------------------------
ALTER TABLE "public"."application_code_demos" ADD CONSTRAINT "application_code_demos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table application_info
-- ----------------------------
ALTER TABLE "public"."application_info" ADD CONSTRAINT "application_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table intervention_rules
-- ----------------------------
ALTER TABLE "public"."intervention_rules" ADD CONSTRAINT "intervention_rules_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table user_agent_chat_async_record
-- ----------------------------
ALTER TABLE "public"."user_agent_chat_async_record" ADD CONSTRAINT "user_agent_chat_async_record_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table user_conversation_now
-- ----------------------------
ALTER TABLE "public"."user_conversation_now" ADD CONSTRAINT "user_conversation_now_pkey" PRIMARY KEY ("id");
