from django.contrib import admin

from engine.models import Model


# Register your models here.
@admin.register
class ModelAdmin(Model):
    # 列表页面,设置显示字段,注意多对多关系的字段不能写进去，因为django不知道以什么分割，所以会报错，但是一对多，多对一的可以
    list_display = ["guid", "name", "label", "status"]
    # 列表页面,设置跳转字段,默认为第一列,可以写多个字段跳转
    list_display_links = ["guid", "name", "label"]
    # 列表页面,设置右侧筛选列
    list_filter = ["label", "status", "createTime", "updateTime"]
    # 列表页面,设置模糊搜索字段
    search_fields = ["label"]

