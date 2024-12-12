USE `rule_engine_py`;

/*Table structure for table `activation` */
DROP TABLE IF EXISTS `activation`;
CREATE TABLE `activation` (
  `id`              BIGINT          NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version`         BIGINT          NULL DEFAULT '0' COMMENT '版本',
  `activation_name` VARCHAR(64)     NULL             COMMENT '策略名称',
  `label`           VARCHAR(32)     NULL DEFAULT ''  COMMENT '显示名称',
  `model_id`        BIGINT          NULL             COMMENT '模型ID',
  `comment`         VARCHAR(128)    NULL             COMMENT '注释',
  `bottom`          INT             NULL DEFAULT '0' COMMENT '底部阀值',
  `median`          INT             NULL DEFAULT '0' COMMENT '中间阀值',
  `high`            INT             NULL DEFAULT '0' COMMENT '顶部阀值',
  `status`          INT             NULL DEFAULT '0' COMMENT '状态',
  `rule_order`      VARCHAR(256)    DEFAULT NULL,
  `create_time`     DATETIME(3)     NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time`     DATETIME(3)     NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='规则集合表';

/*Data for the table `activation` */

/*Table structure for table `black_list` */

DROP TABLE IF EXISTS `black_list`;

CREATE TABLE `black_list` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` BIGINT NULL DEFAULT '0' COMMENT '版本',
  `name` VARCHAR(32) NULL COMMENT '名单名称',
  `label` VARCHAR(32) NULL COMMENT '显示名称',
  `model_id` BIGINT NULL COMMENT '模型ID',
  `comment` VARCHAR(128)  DEFAULT NULL COMMENT '注释',
  `list_type` VARCHAR(11) NULL DEFAULT 'BLACK' COMMENT '名单类型',
  `status` INT NULL COMMENT '状态',
  `create_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='黑名单表';

/*Data for the table `black_list` */

/*Table structure for table `black_list_meta` */

DROP TABLE IF EXISTS `black_list_meta`;

CREATE TABLE `black_list_meta` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` BIGINT NULL DEFAULT '0' COMMENT '版本',
  `black_list_id` BIGINT NULL COMMENT '黑名单ID',
  `field_name` VARCHAR(32) NULL COMMENT '字段名称',
  `label` VARCHAR(32) NULL DEFAULT '' COMMENT '显示名称',
  `seq_num` INT NULL COMMENT '字段序号',
  `create_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='黑名单元数据表';

/*Data for the table `black_list_meta` */

/*Table structure for table `black_list_record` */

DROP TABLE IF EXISTS `black_list_record`;

CREATE TABLE `black_list_record` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` BIGINT NULL DEFAULT '0' COMMENT '版本',
  `black_list_id` BIGINT NULL COMMENT '黑名单ID',
  `data_record` VARCHAR(255) NULL COMMENT '数据记录',
  `data_remark` VARCHAR(32)  DEFAULT NULL COMMENT '数据备注',
  `create_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='黑名单列表';

/*Data for the table `black_list_record` */

/*Table structure for table `feature` */

DROP TABLE IF EXISTS `feature`;

CREATE TABLE `feature` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` BIGINT NULL DEFAULT '0' COMMENT '版本',
  `name` VARCHAR(64) NULL COMMENT '特征名称',
  `label` VARCHAR(32) NULL DEFAULT '' COMMENT '显示名称',
  `model_id` BIGINT NULL COMMENT '模型ID',
  `aggregate_type` INT NULL COMMENT '统计类型(聚合函数)',
  `search_field` VARCHAR(64)  DEFAULT NULL COMMENT '搜索条件字段',
  `search_interval_type` INT NULL COMMENT '时间段类型',
  `search_interval_value` INT NULL COMMENT '时间段具体值',
  `function_field` VARCHAR(64)  DEFAULT NULL COMMENT '统计字段',
  `rule_script` VARCHAR(2048) NULL COMMENT '数据校验',
  `rule_definition` VARCHAR(2048)  DEFAULT NULL,
  `status` INT NULL COMMENT '状态',
  `comment` VARCHAR(128)  DEFAULT NULL COMMENT '备注',
  `create_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='特征字段';

/*Data for the table `feature` */

/*Table structure for table `field` */

DROP TABLE IF EXISTS `field`;

CREATE TABLE `field` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` BIGINT NULL DEFAULT '0' COMMENT '版本',
  `model_id` BIGINT NULL COMMENT '模型ID',
  `field_name` VARCHAR(32) NULL COMMENT '事件信息包含的字段名称',
  `label` VARCHAR(32) NULL DEFAULT '' COMMENT '显示名称',
  `field_type` VARCHAR(16) NULL COMMENT '字段类型',
  `validate_type` VARCHAR(15)  DEFAULT NULL COMMENT '校验类型',
  `validate_args` VARCHAR(15)  DEFAULT NULL COMMENT '校验参数',
  `indexed` TINYINT(1) DEFAULT '0' COMMENT '是否是索引字段',
  `create_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_model_field` (`model_id`,`field_name`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='基础字段';

/*Data for the table `field` */

/*Table structure for table `field_extend` */

DROP TABLE IF EXISTS `field_extend`;

CREATE TABLE `field_extend` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` BIGINT NULL DEFAULT '0' COMMENT '版本',
  `model_id` BIGINT NULL COMMENT '模型ID',
  `source_field` VARCHAR(32) NULL COMMENT '来源字段',
  `source_label` VARCHAR(32) NULL COMMENT '显示名称',
  `dest_field` VARCHAR(32) NULL COMMENT '目标字段',
  `label` VARCHAR(32) NULL DEFAULT '' COMMENT '显示名称',
  `args` VARCHAR(250)  DEFAULT '' COMMENT '参数',
  `plugin` VARCHAR(32) NULL COMMENT '转换插件',
  `config_json` VARCHAR(250)  DEFAULT NULL COMMENT '响应字段配置信息',
  `req_type` VARCHAR(16)  DEFAULT NULL COMMENT '请求方式',
  `status` INT NULL COMMENT '状态',
  `create_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_model_field` (`model_id`,`dest_field`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='扩展字段';

/*Data for the table `field_extend` */

INSERT  INTO `field_extend`(`id`,`version`,`model_id`,`source_field`,`source_label`,`dest_field`,`label`,`args`,`plugin`,`config_json`,`req_type`,`status`,`create_time`,`update_time`) VALUES (1,0,1,'ip','IP','extend_1','IP归属地','','Ip2LocationPlugin','{}','GET',1,'2024-12-01 19:05:32.069','2024-12-01 19:05:32.087');

/*Table structure for table `machine_learning_conf` */

DROP TABLE IF EXISTS `machine_learning_conf`;

CREATE TABLE `machine_learning_conf` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` BIGINT NULL DEFAULT '0' COMMENT '版本',
  `model_id` BIGINT NULL COMMENT '模型ID',
  `name` VARCHAR(255) NULL COMMENT 'ML名称',
  `path` VARCHAR(255)  DEFAULT NULL COMMENT '相对路径',
  `tag` VARCHAR(255)  DEFAULT NULL,
  `operation` VARCHAR(255)  DEFAULT NULL,
  `type` VARCHAR(255)  DEFAULT NULL,
  `comment` VARCHAR(128)  DEFAULT NULL COMMENT '备注',
  `create_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='机器学习配置表';

/*Data for the table `machine_learning_conf` */

/*Table structure for table `machine_learning_param` */

DROP TABLE IF EXISTS `machine_learning_param`;

CREATE TABLE `machine_learning_param` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` BIGINT NULL DEFAULT '0' COMMENT '版本',
  `conf_id` BIGINT NULL COMMENT 'ML表ID',
  `feed` VARCHAR(255)  DEFAULT NULL COMMENT '参数key',
  `expressions` VARCHAR(255)  DEFAULT NULL COMMENT '取数表达式',
  `create_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='机器学习参数表';

/*Data for the table `machine_learning_param` */

/*Table structure for table `mobile_phone` */

DROP TABLE IF EXISTS `mobile_phone`;

CREATE TABLE `mobile_phone` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` BIGINT NULL DEFAULT '0' COMMENT '版本',
  `mobile` VARCHAR(7) NULL COMMENT '主键',
  `province` VARCHAR(30) NULL COMMENT '省',
  `city` VARCHAR(30) NULL COMMENT '市',
  `supplier` VARCHAR(30) NULL COMMENT '卡信息',
  `region_code` VARCHAR(4) NULL COMMENT '区号',
  `create_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='移动手机号码表';

/*Data for the table `mobile_phone` */

/*Table structure for table `model` */

DROP TABLE IF EXISTS `model`;

CREATE TABLE `model` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` BIGINT NULL DEFAULT '0' COMMENT '版本',
  `guid` VARCHAR(64) NULL COMMENT '业务唯一',
  `model_name` VARCHAR(30) NULL COMMENT '模型名称',
  `label` VARCHAR(32) NULL DEFAULT '' COMMENT '显示名称',
  `entity_name` VARCHAR(30) NULL COMMENT '实体主键',
  `event_name` VARCHAR(30) NULL COMMENT '事件主键',
  `reference_date` VARCHAR(30) NULL COMMENT '事件时间',
  `status` INT NULL DEFAULT '0' COMMENT '状态(0-新建，1-启用，2-禁用)',
  `field_validate` TINYINT(1) NULL DEFAULT '0' COMMENT '字段校验',
  `dashboard_url` VARCHAR(300)  DEFAULT NULL COMMENT 'URL地址',
  `template` TINYINT(1) NULL DEFAULT '0' COMMENT '模板(0-否，1-是)',
  `tenant_code` VARCHAR(60) NULL DEFAULT '' COMMENT '租户编码',
  `create_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_guid` (`guid`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='模型主表';

/*Data for the table `model` */

/*Table structure for table `rule` */

DROP TABLE IF EXISTS `rule`;

CREATE TABLE `rule` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` BIGINT NULL DEFAULT '0' COMMENT '版本',
  `model_id` BIGINT NULL COMMENT '模型ID',
  `activation_id` BIGINT NULL COMMENT '集合ID',
  `name` VARCHAR(64) NULL DEFAULT '' COMMENT '规则名称',
  `label` VARCHAR(64) NULL DEFAULT '' COMMENT '显示名称',
  `scripts` VARCHAR(2048) NULL COMMENT '检验脚本',
  `init_score` INT NULL DEFAULT '0' COMMENT '初始分数',
  `base_num` INT NULL DEFAULT '0' COMMENT '基数',
  `operator` VARCHAR(32) NULL COMMENT '运算符',
  `abstraction_name` VARCHAR(64) NULL,
  `rate` INT NULL DEFAULT '100' COMMENT '比例',
  `max` INT NULL DEFAULT '0' COMMENT '最大得分值',
  `status` INT NULL COMMENT '状态',
  `rule_definition` VARCHAR(2048) NULL COMMENT '规则定义',
  `create_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='特征评分';

/*Data for the table `rule` */

/*Table structure for table `rule_history` */

DROP TABLE IF EXISTS `rule_history`;

CREATE TABLE `rule_history` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` BIGINT NULL DEFAULT '0' COMMENT '版本',
  `user_name` VARCHAR(60) NULL COMMENT '操作账号',
  `rule_id` BIGINT NULL COMMENT '模型ID',
  `label` VARCHAR(64) NULL DEFAULT '' COMMENT '规则名称',
  `init_score` INT NULL DEFAULT '0' COMMENT '初始分数',
  `base_num` INT NULL DEFAULT '0' COMMENT '基数',
  `operator` VARCHAR(32) NULL COMMENT '运算符',
  `rate` INT NULL DEFAULT '100' COMMENT '比例',
  `abstraction_name` VARCHAR(64) DEFAULT '',
  `rule_definition` VARCHAR(2048) NULL COMMENT '规则定义',
  `create_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='规则历史';

/*Data for the table `rule_history` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` BIGINT NULL DEFAULT '0' COMMENT '版本',
  `tenant_code` VARCHAR(64) DEFAULT NULL COMMENT '租户编码',
  `user_name` VARCHAR(32)  DEFAULT NULL COMMENT '登录账号(全局唯一)',
  `password` VARCHAR(64)  DEFAULT NULL COMMENT '登录密码',
  `email` VARCHAR(32)  DEFAULT NULL COMMENT '邮箱',
  `mobile` VARCHAR(20)  DEFAULT NULL COMMENT '手机号',
  `status` VARCHAR(2)  DEFAULT NULL COMMENT '状态',
  `vip_level` INT DEFAULT '1' COMMENT 'VIP等级',
  `create_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_name` (`user_name`)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='租户账号';

/*Data for the table `user` */

INSERT  INTO `user`(`id`,`version`,`tenant_code`,`user_name`,`password`,`email`,`mobile`,`status`,`vip_level`,`create_time`,`update_time`) VALUES (1,0,'0','admin','223CE7B851123353479D85757FBBF4E320D1E251',NULL,NULL,'1',1,'2024-12-01 15:56:46.869','2024-12-02 01:00:50.749'),(2,0,'PDD','test','B2478239CD7E68E8052398D8EB87D385BF962085',NULL,NULL,'1',1,'2024-12-01 15:56:46.869','2024-12-01 15:56:46.869');
