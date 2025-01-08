# rule-engine-py
Rule Engine By Python
## 实时规则引擎平台
### 一、反欺诈
   - 在金融、电信、电商等社会领域，在特定时间段内，出现请求频次、交易金额的异常特征，黑白名单系统，因此，可识别行为风险。
   - 适用场景
      - 同一个商户
      - 同一个用户
      - 同一张银行卡
      - 同一张电话卡
      - 同一个网络IP
### 二、技术栈
   - 运行环境：Python 3.12.6
   - 基础框架：Django 5.1.1
   - 规则存储：MySQL 8.x，配置库
      - 模型定义
      - 基础字段
      - 扩展字段(可灵活配置插件实现基础字段加工)
      - 特征字段(可灵活设置多维度的count、distinct、sum等聚合函数统计查询，获得实时量化结果)
      - 黑白名单
      - 评分规则(可配置单一评分、评分累加计算场景)
   - 事件存储：MongoDB 6.x，非结构化的行为事件数据存储。
   - 索引存储：事件识别分析结果数据存储，支持配置，二选一
      - Elasticsearch 7.x
      - MongoDB 6.x
### 三、架构设计
   - 产品架构
     ![风控中心1 0(产品架构)](https://github.com/user-attachments/assets/db7d32ed-a8fc-4e8d-9f69-b66e7fc9e1ed)
   - 系统架构
