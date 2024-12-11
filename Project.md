# 项目搭建

## 安装Python 3.12.6
   - 官网文档： https://www.python.org 
   - 验证安装： 控制台输入命令 Python
   - 退出命令： 控制台输入命令 exit(0)

## 初始化代码库
   - 在Github或Gitee创建一个空项目
   - 在Pycharm社区版下载这个项目

## 安装Django 5.1.11
### 官网文档：
   - https://www.djangoproject.com
   - https://docs.djangoproject.com/zh-hans/5.1
   - https://www.runoob.com/django/django-install.html
### 它遵循MVC(模型-视图-控制器)架构模式
   - 在Django中，部署的是项目，一个项目可以拆分多个应用，每一个应用是一个独立的聚合模块。
   - 在Django中，主目录负责处理项目的初始化操作以及请求的分发，而具体的请求是由各个应用去处理。
### 安装Django
   - python -m pip install Django

## 创建Django项目
### 在命令行输入命令： django-admin startproject bootstrap
### 项目结构： 
   - 按照个人习惯，不要中间层bootstrap目录
### 项目启动： 
   - 在命令行输入命令
      - **项目启动**： python manage.py runserver
      - **项目停止**： Ctrl + C
   - 在Pycharm社区版配置
      - Edit Configurations/选择工作目录
      - Edit Configurations/选择执行脚本manage.py
      - Edit Configurations/script parameters配置项输入: runserver 127.0.0.1:8000
   - 默认访问地址： http://127.0.0.1:8000/

## 配置Django项目
### DB配置： 默认DB使用SQLite3，这里使用MySQL
   - 在命令行输入命令
      - **安装依赖**： pip3 install pymysql
   - 配置Django应用
      - **bootstrap/settings.py**： 修改DB配置，这里使用MySQL。
      - **bootstrap/__init__.py**： 导入MySQL驱动。
   - 初始化Django框架基本表结构
      - python manage.py migrate
   - 创建Django超级管理员账号
      - **输入命令**： python manage.py createsuperuser
         - 提示创建账号 admin
         - 提示输入邮箱 
         - 提示输入密码 111111
         - 提示确认密码 111111
      - **登陆地址**： http://127.0.0.1:8000/admin

## 创建Django应用
   - 在命令行输入命令： python manage.py startapp rule

## 创建Django模型
### 模型配置
   - **修改rule/models.py**： 定义模型
   - **修改rule/apps.py**： 
   - **修改rule/settings.py**： 修改INSTALLED_APPS列表
### 模型注册
   - **修改rule/admin.py**： admin.site.register(rule)
### 视图配置
   - **修改rule/views.py**：  
### 视图绑定
   - **修改rule/urls.py**：  修改urlpatterns，将views.py和URL绑定，默认页面将不会再展示
### 在manage.py同级目录创建应用(这个应用可以作为顶级模块导入，而不是项目的子模块)
   - **创建模型**： python manage.py makemigrations rule
   - **更新模型**： python manage.py migrate rule --run-syncdb

## 在Pycharm社区版提交项目：git push
