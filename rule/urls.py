"""
URL configuration for statement1 project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

from rule import views as rule_views

# 绑定path和views.py 资源访问路径/rule/field
urlpatterns = [
    path("", rule_views.index, name="规则配置"),
    path("index", rule_views.index, name="模型列表"),
    path('field', rule_views.field, name="基础字段"),
    path('extend', rule_views.extend, name="扩展字段")
]
