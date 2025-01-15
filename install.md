# 项目搭建

## 基础环境
     - Python 3.12.6
     - Django 5.1.5
     - pymysql 1.1.1
     
## 环境隔离
     - 创建虚拟环境：python -m venv venv
     - 激活虚拟环境：
        - MacOS环境：source venv/bin/activate
        - Windows环境：venv\Scripts\activate    操作显示(venv) PS D:\Projects\rule-engine-py>
     - 退出虚拟环境：deactivate
     - 删除虚拟环境：只需删除创建它的文件夹即可?

## 框架说明
### 官网文档
     - https://www.djangoproject.com
     - https://docs.djangoproject.com/zh-hans/5.1
     - https://www.runoob.com/django/django-install.html
### 它遵循MVC(模型-视图-模版/控制器)架构模式
     - 在Django中，部署的是项目，一个项目可以拆分多个应用，每一个应用是一个独立的聚合模块。
     - 在Django中，主目录负责处理项目的初始化操作以及请求的分发，而具体的请求是由各个应用去处理。
### 它自带一套管理后台模版，很适合做B端的管理系统

## 创建项目
### 安装依赖
     - python -m pip install Django
     - pip3 install pymysql
### 输入命令： django-admin startproject bootstrap
### 项目结构
     - 默认创建项目根目录和一个同名的应用模块
     - 按照个人习惯，不要中间层bootstrap目录
### 项目启动
     - 在命令行输入命令
          - 项目启动： python manage.py runserver
          - 项目停止： Ctrl + C
     - 在Pycharm社区版配置
          - Edit Configurations/选择工作目录
          - Edit Configurations/选择执行脚本manage.py
          - Edit Configurations/script parameters配置项输入: runserver 127.0.0.1:8000
### 默认地址：http://127.0.0.1:8000/

## 配置项目
### 默认DB使用SQLite3，这里使用MySQL
### 配置项目(把bootstrap理解为一个负责项目配置的主应用)
     - **bootstrap/settings.py**： 修改DB配置，这里使用MySQL
     - **bootstrap/__init__.py**： 导入MySQL驱动
     - **bootstrap/apps.py**： 项目配置
     - **bootstrap/views.py**： 项目视图
     - **bootstrap/urls.py**： 项目资源路径/请求分发处理
### 创建Django项目基本表结构：python manage.py migrate
### 创建Django项目超级管理员：python manage.py createsuperuser
      - 提示创建账号 admin
      - 提示输入邮箱 
      - 提示输入密码 111111
      - 提示确认密码 111111
### 登陆地址： http://127.0.0.1:8000/admin
### 其它配置： 

## 创建应用(一个项目可以创建多个，每一个应用都是一个独立的功能聚合模块)
     - 在命令行输入命令： python manage.py startapp rule

## 创建模型
### 模型配置
     - **修改rule/models.py**：定义模型(如事件、基础字段、扩展字段、特征字段、评分规则、策略集合等数据模型)
     - **修改rule/apps.py**： 
     - **修改rule/settings.py**： INSTALLED_APPS列表中新增rule应用
### 模型注册： 将某个模型注册到Django管理后台，以便在管理界面进行CURD操作
     - **修改rule/admin.py**：两种方式
          - 推荐注册方式：@admin.register(模型名称)，可以定义页面列表元数据、查询条件、分页参数等。
          - 传统注册方式：admin.site.register(模型名称)
### 视图配置
     - **修改rule/views.py**：  
### 视图绑定
     - **修改rule/urls.py**：  修改urlpatterns，将views.py和URL绑定，默认页面将不会再展示
### 在manage.py同级目录创建应用(这个应用可以作为顶级模块导入，而不是项目的子模块)
     - **模型同步创建到DB**： python manage.py makemigrations rule
     - **模型同步更新到DB**： python manage.py migrate rule --run-syncdb
     
## 依赖清单
    - pip list
    - pip freeze > requirements.txt

## 提交项目：git push

## 安装依赖
     - pip install --upgrade pip
     - pip install --upgrade pip setuptools
     - pip install -r requirements.txt
     