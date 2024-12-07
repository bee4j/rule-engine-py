from django.http import HttpResponse
from django.shortcuts import render

#首页
def index(request):
    #渲染模板
    return render(request,'index.html', content_type='text/html')

def register(request):
    return HttpResponse("Welcome register Python World! ")

def login(request):
    return HttpResponse("Welcome login Python World! ")
