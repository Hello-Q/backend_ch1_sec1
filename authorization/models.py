from django.db import models

# Create your models here.


class User(models.Model):
    # openid
    open_id = models.CharField(max_length=32, unique=True)
    # 昵称
    nickname = models.CharField(max_length=256)
    # 关注的城市
    focus_cities = models.TextField(default='[]')
    # 关注的星座
    focus_constellations = models.TextField(default='[]')
    # 关注的股票
    focus_stock = models.TextField(default='[]')

    class Meta:
        indexes = [
            models.Index(fields=['nickname']),  # 索引
            models.Index(fields=['open_id', 'nickname'])  # 复合索引
        ]