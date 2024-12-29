from django.db import models
from django.utils import timezone

# 基础定义
class AbstractModel(models.Model):
    id = models.AutoField(primary_key=True, help_text='数据主键')
    version = models.IntegerField(default=0, help_text='数据版本')
    createTime = models.DateTimeField(auto_now_add=True, help_text='创建时间')
    updateTime = models.DateTimeField(auto_now=True, help_text='更新时间')

    class Meta:
        abstract = True

# 模型定义
class Model(AbstractModel):
    guid = models.CharField(max_length=64, blank=False ,null=False, help_text='业务唯一')
    model_name = models.CharField(max_length=32, blank=False, null=False, default='', help_text='模型名称')
    label = models.CharField(max_length=32, blank=False, null=False, help_text='显示名称')
    entity_name = models.CharField(max_length=32, blank=False, null=False, default='', help_text='实体主键')
    event_name = models.CharField(max_length=32, blank=False, null=False, default='', help_text='事件主键')
    reference_date = models.CharField(max_length=32, blank=False, null=False, default='', help_text='事件时间')
    status = models.IntegerField(blank=False, null=False, default=0, help_text='状态(0-新建，1-启用，2-禁用)')
    field_validate = models.IntegerField(blank=True, null=False, default=0, help_text='字段校验')
    dashboard_url = models.CharField(max_length=32, blank=True, null=False, default='', help_text='URL地址')
    template = models.BooleanField(blank=False, null=False, default='', help_text='模板(0-否，1-是)')
    tenant_code = models.CharField(max_length=64, blank=True, null=False, default='', help_text='租户编码')

    class Meta:
        db_table = 'engine_model'  # 自定义表名

    def __str__(self):
        return self.model_name

# 基础字段
class Field(AbstractModel):
    model_id = models.BigIntegerField(blank=False, null=False,help_text='模型ID')
    field_name = models.CharField(max_length=32, blank=False, null=False, default='', help_text='字段名称')
    label = models.CharField(max_length=32, blank=False, null=False, default='', help_text='显示名称')
    field_type = models.CharField(max_length=16, blank=False, null=False, default='', help_text='字段类型')
    validate_type = models.CharField(max_length=16, blank=True, null=False, default='', help_text='校验类型')
    validate_args = models.CharField(max_length=16, blank=True, null=False, default='', help_text='校验参数')
    indexed = models.BooleanField(blank=False, null=False, default=True, help_text='索引标识(0-否，1-是)')

# 扩展字段
class Extend(AbstractModel):
    model_id = models.BigIntegerField(blank=False, null=False, help_text='模型ID')
    input_field = models.CharField(max_length=32, blank=False, null=False, help_text='输入字段名称')
    input_label = models.CharField(max_length=32, blank=False, null=False, help_text='输入字段显示')
    output_field = models.CharField(max_length=32, blank=False, null=False, default='', help_text='输出字段名称')
    output_label = models.CharField(max_length=32, blank=False, null=False, help_text='输出字段显示')
    plugin = models.CharField(max_length=32, blank=False, null=False, default='', help_text='插件名称')
    args = models.CharField(max_length=256, blank=True, null=False, default='', help_text='插件参数')
    config_json = models.CharField(max_length=256, blank=True, null=False, default='', help_text='响应字段配置信息')
    request_type = models.CharField(max_length=16, blank=True, null=False, default='', help_text='请求方式')
    status = models.BooleanField(blank=False, null=False, default=True, help_text='状态')

# 黑白名单
class BlackList(AbstractModel):
    model_id = models.BigIntegerField(blank=False, null=False, help_text='模型ID')
    name = models.CharField(max_length=32, blank=False, null=False, default=0, help_text='名单名称')
    label = models.CharField(max_length=32, blank=False, null=False, default=0, help_text='显示名称')
    comment = models.CharField(max_length=128, blank=False, null=False, default=0, help_text='备注')
    list_type = models.CharField(max_length=32, blank=True, null=False, default=0, help_text='名单类型')
    status = models.BooleanField(blank=False, null=False, default=False, help_text='状态')

# 黑白名单元数据
class BlackListMeta(AbstractModel):
    black_list_id = models.BigIntegerField(blank=False, null=False, help_text='黑名单ID')
    name = models.CharField(max_length=32, blank=False, null=False, default='', help_text='字段名称')
    label = models.CharField(max_length=32, blank=False, null=False, default='', help_text='显示名称')
    seq_num = models.IntegerField(blank=False, null=False, default='', help_text='字段序号')

# 黑白名单数据
class BlackListRecord(AbstractModel):
    black_list_id = models.BigIntegerField(blank=False, null=False, help_text='黑名单ID')
    record = models.CharField(max_length=256, blank=False, null=False, help_text='数据记录')
    remark = models.CharField(max_length=32, blank=False, null=False, default='', help_text='数据备注')
    seq_num = models.IntegerField(blank=False, null=False, default=0, help_text='字段序号')

# 特征变量
class Feature(AbstractModel):
    model_id = models.BigIntegerField(blank=False, null=False, help_text='模型ID')
    name = models.CharField(max_length=64, blank=False, null=False, default='', help_text='字段名称')
    label = models.CharField(max_length=32, blank=False, null=False, help_text='显示名称')
    aggregate_type = models.IntegerField(blank=False, null=False, help_text='统计类型')
    search_field = models.CharField(max_length=64, blank=False, null=False, help_text='统计条件')
    search_interval_type = models.IntegerField(blank=False, null=False, help_text='统计时间类型')
    search_interval_value = models.IntegerField(blank=False, null=False, help_text='统计时间期间')
    function_field = models.CharField(max_length=64, blank=False, null=False, help_text='统计字段')
    rule_script = models.CharField(max_length=2048, blank=False, null=False, default='', help_text='数据校验')
    rule_definition = models.CharField(max_length=2048, blank=False, null=False, default='', help_text='字段序号')
    status = models.BooleanField(blank=False, null=False, default=False, help_text='状态')
    comment = models.CharField(max_length=128, blank=True, null=False, default='', help_text='备注')

# 评分卡
class Card(AbstractModel):
    model_id = models.BigIntegerField(blank=False, null=False, help_text='模型ID')
    name = models.CharField(max_length=64, blank=False, null=False, default='', help_text='卡片名称')
    label = models.CharField(max_length=32, blank=False, null=False, help_text='显示名称')
    comment = models.CharField(max_length=128, blank=True, null=False, default='', help_text='备注')
    high = models.IntegerField(blank=False, null=False, default=0, help_text='最高分值')
    median = models.IntegerField(blank=False, null=False, default=0, help_text='中间分值')
    bottom = models.IntegerField(blank=False, null=False, default=0, help_text='最低分值')
    status = models.BooleanField(blank=False, null=False, default=False, help_text='状态')
    rule_order = models.CharField(max_length=256, blank=True, null=False, default='', help_text='规则排序')

# 评分规则
class Rule(AbstractModel):
    model_id = models.BigIntegerField(blank=False, null=False, help_text='模型ID')
    card_id = models.BigIntegerField(blank=False, null=False, help_text='卡片ID')
    name = models.CharField(max_length=64, blank=False, null=False, default='', help_text='规则名称')
    label = models.CharField(max_length=64, blank=False, null=False, help_text='显示名称')
    scripts = models.CharField(max_length=2048, blank=True, null=False, default='', help_text='检验脚本')
    init_score = models.IntegerField(blank=False, null=False, default=0, help_text='初始分数')
    base_num = models.IntegerField(blank=False, null=False, default=0, help_text='基数')
    operator = models.IntegerField(blank=False, null=False, default=0, help_text='运算符')
    rate = models.IntegerField(blank=False, null=False, default=0, help_text='比例')
    max_score = models.IntegerField(blank=False, null=False, default=0, help_text='最大得分')
    rule_definition = models.CharField(max_length=256, blank=True, null=False, default='', help_text='规则定义')
    status = models.BooleanField(blank=False, null=False, default=False, help_text='状态')

# 租户
class Tenant(AbstractModel):
    code = models.BigIntegerField(blank=False, null=False, help_text='租户编码')
    name = models.CharField(max_length=64, blank=False, null=False, help_text='租户名称')
    email = models.IntegerField(blank=False, null=False, help_text='邮箱')
    mobile = models.IntegerField(blank=False, null=False, help_text='电话')
    vip_level = models.CharField(max_length=4, blank=True, null=False, default='', help_text='等级')
    status = models.BooleanField(blank=False, null=False, default=False, help_text='状态')

    # # 与AuthUser建立一对一的关系
    # authUser = models.OneToOneField(to="AuthUser", on_insert=models.CASCADE)
