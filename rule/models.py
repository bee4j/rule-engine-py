from django.db import models
from django.utils import timezone

# Create your models here.

class RuleUser(models.Model):
    id = models.AutoField(primary_key=True)
    version = models.IntegerField(default=0)
    tenant_code = models.CharField(max_length=64,blank=False,null=False,default=0)
    user_name = models.CharField(max_length=32,blank=False,null=False,default=0)
    password = models.CharField(max_length=64,blank=False,null=False,default=0)
    email = models.CharField(max_length=32,blank=False,null=False,default=0)
    mobile = models.CharField(max_length=16,blank=False,null=False,default=0)
    status = models.CharField(max_length=2, blank=False, null=False, default=0)
    vip_level = models.IntegerField(default=0)
    create_time = models.DateTimeField(default=timezone.now)
    update_time = models.DateTimeField(default=timezone.now)

class RuleModel(models.Model):
    id = models.AutoField(primary_key=True)
    version = models.IntegerField(default=0)
    guid = models.CharField(max_length=64,blank=False,null=False,default=0)
    model_name = models.CharField(max_length=32,blank=False,null=False,default=0)
    label = models.CharField(max_length=32,blank=False,null=False,default=0)
    entity_name = models.CharField(max_length=32,blank=False,null=False,default=0)
    event_name = models.CharField(max_length=32,blank=False,null=False,default=0)
    reference_date = models.CharField(max_length=32, blank=False, null=False, default=0)
    status = models.IntegerField(default=0)
    field_validate = models.IntegerField(default=0)
    dashboard_url = models.CharField(max_length=32, blank=False, null=False, default=0)
    template = models.IntegerField(default=0)
    tenant_code = models.CharField(max_length=64, blank=False, null=False, default=0)
    create_time = models.DateTimeField(default=timezone.now)
    update_time = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.model_name

class RuleField(models.Model):
    id = models.AutoField(primary_key=True)
    version = models.IntegerField(default=0)
    model_id = models.BigIntegerField(default=0)
    field_name = models.CharField(max_length=32,blank=False,null=False,default=0)
    label = models.CharField(max_length=32,blank=False,null=False,default=0)
    field_type = models.CharField(max_length=16,blank=False,null=False,default=0)
    validate_type = models.CharField(max_length=32,blank=False,null=False,default=0)
    validate_args = models.CharField(max_length=32,blank=False,null=False,default=0)
    indexed = models.IntegerField(default=0)
    create_time = models.DateTimeField(default=timezone.now)
    update_time = models.DateTimeField(default=timezone.now)
