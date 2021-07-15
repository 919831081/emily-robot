
CREATE TABLE IF NOT EXISTS user_info (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '用户编号 暂定数据库自增Id',
	`user_name` VARCHAR(40) NOT NULL COMMENT '用户名',
	`user_password` VARCHAR(100) NOT NULL COMMENT '用户密码',
	`user_source` VARCHAR(20) DEFAULT 'SELF' COMMENT '用户来源:默认自建',
	`status` TINYINT(1) DEFAULT 1 COMMENT '是否启用: 0禁用/1启用',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`creator` BIGINT DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL,
  `last_modifier` BIGINT DEFAULT NULL COMMENT '更新人',
	PRIMARY KEY(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户表';

CREATE TABLE IF NOT EXISTS resource_data_storage_config (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '资源认证编号 数据库自增Id',
	`storage_pattern` VARCHAR(10) NOT NULL COMMENT '资源数据存储方式 mysql/redis/es/local.log',
	`storage_url` VARCHAR(100) NOT NULL COMMENT '资源数据存储地址 127.0.0.1:3306/redis:127.0.0.1/service_local_path',
	`user_name` VARCHAR(40) NOT NULL COMMENT '存储用户',
	`user_password` VARCHAR(100) NOT NULL COMMENT '存储密码',
	`status` TINYINT(1) DEFAULT NUll COMMENT '是否启用: 0禁用/1启用',
	`create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`creator` BIGINT DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL,
  `last_modifier` BIGINT DEFAULT NULL COMMENT '更新人',
	PRIMARY KEY(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='资源数据存储配置表';

CREATE TABLE IF NOT EXISTS resource_auth (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '资源认证编号 数据库自增Id',
	`auth_pattern` VARCHAR(10) NOT NULL COMMENT '资源认证方式 NONE/AUTH/LDAP/OTHER',
	`auth_user` VARCHAR(40) NOT NULL COMMENT '认证用户',
	`auth_password` VARCHAR(100) NOT NULL COMMENT '认证密码',
	`auth_info` VARCHAR(200) NOT NULL COMMENT '认证信息 auth_pattern字段OTHER时使用',
	`status` TINYINT(1) DEFAULT 1 COMMENT '是否启用: 0禁用/1启用',
	`create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`creator` BIGINT DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL,
  `last_modifier` BIGINT DEFAULT NULL COMMENT '更新人',
	PRIMARY KEY(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='资源认证表';

CREATE TABLE IF NOT EXISTS resource_config (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '资源编号 数据库自增Id',
	`resource_resume` VARCHAR(40) NOT NULL COMMENT '资源简述 简短描述资源功能',
	`resource_level` INT(2) DEFAULT 1 COMMENT '资源等级 1/2/3——N 默认1',
	`parent_resource_id` INT(2) DEFAULT NUll COMMENT '上级资源编号 资源等级不为1时需选择',
	`resource_type` VARCHAR(40) NOT NULL COMMENT '资源类型 url/button/text',
	`resource_context` VARCHAR(200) NOT NULL COMMENT '资源内容',
	`resource_request_type` VARCHAR(40) NOT NULL COMMENT '资源请求类型 POST/GET/PUT/DELETE/PATCH',
	`check_code` TINYINT(1) DEFAULT 1 COMMENT '是否需要识别验证码',
	`check_type` varchar(10) DEFAULT NULL COMMENT '验证码类型: ',
	`action_sleep_time` INT(20) DEFAULT 3 COMMENT '资源动作休眠时常 单位值为秒',
	`resource_auth_id` BIGINT DEFAULT NULL COMMENT '资源认证配置编号',
	`resource_data_storage_id` BIGINT DEFAULT NULL COMMENT '资源数据存储配置编号',
	`status` TINYINT(1) DEFAULT 1 COMMENT '是否启用: 0禁用/1启用',
	`create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`creator` BIGINT DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL,
  `last_modifier` BIGINT DEFAULT NULL COMMENT '更新人',
	PRIMARY KEY(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='资源配置表';

CREATE TABLE IF NOT EXISTS resource_group (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '资源组编号 数据库自增Id',
	`resource_group_resume` VARCHAR(40) NOT NULL COMMENT '资源组简述 简短描述资源组功能',
	`resource_id` BIGINT DEFAULT NULL COMMENT '资源编号',
	`weight_level` INT(2) DEFAULT 1 COMMENT '权重级别 1/2/3——N',
	`status` TINYINT(1) DEFAULT 1 COMMENT '是否启用: 0禁用/1启用',
	`create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`creator` BIGINT DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL,
  `last_modifier` BIGINT DEFAULT NULL COMMENT '更新人',
	PRIMARY KEY(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='资源组表';

CREATE TABLE IF NOT EXISTS grab_policy (
	`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '触发资源编号 数据库自增Id',
	`grab_pattern` VARCHAR(10) NOT NULL COMMENT '抓取方式	xpath/jsoup/http',
	`trigger_policy` VARCHAR(10) NOT NULL COMMENT '触发策略 手动/自动定时',
	`trigger_value` VARCHAR(20) NOT NULL COMMENT '触发值 manual/定时cron内容',
	`trigger_level` INT(2) DEFAULT 1 COMMENT '触发级别 1/2/3——N',
	`resource_group_id` BIGINT DEFAULT NULL COMMENT '资源组编号',
	`data_version` INT(6) DEFAULT 1 COMMENT '数据版本 正数值递增/并发多接点时使用',
	`status` TINYINT(1) DEFAULT 1 COMMENT '是否启用: 0禁用/1启用',
	`create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`creator` BIGINT DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL,
  `last_modifier` BIGINT DEFAULT NULL COMMENT '更新人',
	PRIMARY KEY(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='抓取策略表';

CREATE TABLE IF NOT EXISTS exe_record (
		`id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '执行编号 数据库自增Id',
		`tigger_pattern` VARCHAR(10) NOT NULL COMMENT '触发策略 手动/自动定时',
		`resource_group_id` BIGINT DEFAULT NULL COMMENT '资源组编号',
		`resource_id` BIGINT DEFAULT NULL COMMENT '资源编号',
		`create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
		`creator` BIGINT DEFAULT NULL COMMENT '创建人',
		PRIMARY KEY(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='执行记录表';


/**
	用户表
		用户编号 数据库自增Id
		用户名称
		用户密码
		用户来源 默认自建
		状态 是否启用 0禁用/1启用
		创建时间
		创建人
		修改时间
		修改人


  资源数据存储配置
		资源认证编号 数据库自增Id
		资源数据存储方式 mysql/redis/es/local.log
		资源数据存储地址 127.0.0.1:3306/redis:127.0.0.1/service_local_path
		存储用户
		存储密码
		状态 是否启用 0禁用/1启用
		创建时间
		创建人
		修改时间
		修改人

  资源认证表
		资源认证编号 数据库自增Id
		资源认证方式 NONE/AUTH/LDAP/OTHER
		认证用户
		认证密码
		认证信息 OTHER时使用
		状态 是否启用 0禁用/1启用
		创建时间
		创建人
		修改时间
		修改人

	资源配置表
		资源编号 数据库自增Id
		资源简述 简短描述资源功能
		资源等级 1/2/3——N 默认1
		上级资源编号 资源等级不为1时需选择
		资源类型 url/button/text
		资源内容
		资源请求类型 POST/GET/PUT/DELETE/PATCH
		是否需要识别验证码 ********
		验证码类型 ********
		资源动作休眠时常 单位值为秒 ********
		资源认证配置编号
		资源数据存储配置编号
		状态 是否启用 0禁用/1启用
		创建时间
		创建人
		修改时间
		修改人

	资源组表
		资源组编号 数据库自增Id
		资源组简述 简短描述资源组功能
		资源编号
		权重级别 1/2/3——N
		状态 是否启用 0禁用/1启用
		创建时间
		创建人
		修改时间
		修改人

	抓取策略表
		触发资源编号 数据库自增Id
		抓取方式	xpath/jsoup/http
		触发策略 手动/自动定时
		触发值   manual/定时cron内容
		触发级别 1/2/3——N
		资源组编号
		数据版本 正数值递增/并发多接点时使用
		状态 是否启用 0禁用/1启用
		创建时间
		创建人
		修改时间
		修改人

	执行记录表
			执行编号
			触发策略
			执行资源组编号
			执行资源编号

**/

