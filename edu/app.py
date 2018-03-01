# -*- coding: utf-8 -*-

from flask import Flask
from edu.config import configs
from edu.models import db, User
from flask_migrate import Migrate
from flask_login import LoginManager


def register_extensions(app):
    db.init_app(app)
    Migrate(app, db)

    login_manager = LoginManager()
    login_manager.init_app(app)

    @login_manager.user_loader
    def user_loader(id):
        return User.query.get(id)

    login_manager.login_view = 'front.login'


def register_blueprints(app):
    from .handlers import front, course, admin, live
    app.register_blueprint(front)
    app.register_blueprint(course)
    app.register_blueprint(admin)
    app.register_blueprint(live)


def create_app(config):
    """
    可以根据传入的 config 名称，加载不同的配置
    App 工厂
    """
    app = Flask(__name__)
    app.config.from_object(configs.get(config))
    # SQLAlchemy 的初始化方式改为使用 init_app
    register_extensions(app)
    register_blueprints(app)
    return app
