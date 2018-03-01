# -*- coding: utf-8 -*-
''' 存放装饰器相关 '''

from flask import abort
from flask_login import current_user
from functools import wraps
from edu.models import User


def role_required(role):
    ''' 带参数的装饰器，可以使用它保护一个路由处理函数
    只能被特定角色的用户访问:
        @role_required(User.ADMIN)
        def admin():
            pass
    '''
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwrargs):
            # 未登录用户或者角色不满足引发 404
            # 不是 403 是不希望把路由暴露给不具有权限的用户
            if not current_user.is_authenticated or current_user.role < role:
                abort(404)
            return func(*args, **kwrargs)
        return wrapper
    return decorator


# 特定角色的装饰器
staff_required = role_required(User.ROLE_STAFF)
admin_required = role_required(User.ROLE_ADMIN)
