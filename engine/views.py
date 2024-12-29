import json
from django.core.serializers import serialize
from django.http import HttpResponse,JsonResponse
from django.shortcuts import render
from engine.models import Model

# Create your views here.

def index(request):
    models = Model.objects.all()
    # print(arr)
    # print(arr[0])
    # print(repr(arr[0]))
    # print("------->resp:" + str(arr[0]))
    # print("------->resp:{}".format(arr[0]))
    data = serialize('json', models)
    print(data)
    return HttpResponse("模型列表" + data)

def field(request):
    return HttpResponse("基础字段")

def extend(request):
    return HttpResponse("扩展字段")

def extend(request):
    return HttpResponse("扩展字段")

def extend(request):
    return HttpResponse("扩展字段")