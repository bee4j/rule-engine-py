# 项目搭建

## 安装Python 3.12.6运行环境：https://www.python.org 
   - 验证安装： Python
   - 退出命令： exit(0)
## Django 5.1.4 框架描述
    - https://www.djangoproject.com
    - https://docs.djangoproject.com/zh-hans/5.1
    - https://www.runoob.com/django/django-install.html
## 创建项目
    - 在Github创建一个空项目
    - 在Pycharm社区版下载这个项目
    - 安装Django 5.1.4 框架及框架依赖
        - python -m pip install Django
        - pip3 install pymysql
    - 在命令行初始化Django项目
        - django-admin startproject bootstrap
    - 默认访问地址： http://127.0.0.1:8000/
## 项目结构
   - 按照个人习惯，不要中间层bootstrap目录
## 项目启动
   - 在Pycharm社区版命令行
     - **项目启动**： python manage.py runserver
     - **项目停止**： Ctrl + C
   - 在Pycharm社区版配置
     - Edit Configurations/script parameters配置项输入: runserver 127.0.0.1:8000
## 项目开发
### Django框架
    - 默认DB使用SQLite3，模块内settings.py修改默认DB，这里使用MySQL
    - 模块内__init__.py导入MySQL驱动
    - 初始化Django框架依赖的基本表结构
        - python manage.py migrate
### 创建Django超级管理员账号
    - python manage.py createsuperuser
        - 提示创建账号 admin
        - 提示输入邮箱 
        - 提示输入密码 111111
        - 提示确认密码 111111
    - 登录地址 http://127.0.0.1:8000/admin
        - 模块配置 在apps.py
        - 模块注册 在settings.py里INSTALLED_APPS
        - 视图配置 CURD
        - 视图绑定 在urls.py里的urlpatterns，将views.py和URL绑定，默认页面将不会再展示
        - 在manage.py同级目录创建应用(这个应用可以作为顶级模块导入，而不是项目的子模块)
            - **创建模块**： python manage.py startapp rule
            - **定义模型**： python manage.py makemigrations rule
            - **创建模型**： python manage.py migrate rule --run-syncdb
## 在Pycharm社区版提交项目：git push
