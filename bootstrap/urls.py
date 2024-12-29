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
from django.template.defaulttags import url
from django.urls import path, include

from bootstrap import views

# 绑定URL和views.py，按顺序依次匹配列表中的项，直到找到匹配的项
urlpatterns = [
    # 配置""替换默认的视图
    path("", views.index, name="bootstrap"),
    # path("register/", views.register, name="注册"),
    path("login/", views.login, name="登录"),
    path('admin/', admin.site.urls),
    path("engine/", include("engine.urls")),
    path("data/", include("data.urls"))
]
