# -*- coding: utf-8 -*-

import os
import json
from random import randint
from faker import Faker
from edu.models import db, User, Course, Chapter

# 创建 faker 工厂对象
faker = Faker()


def iter_users():
    # 生成一个教师用户
    yield User(
        username='Jack Lee',
        email='jacklee@163.com',
        password='jacklee',
        job='Python高级工程师')


def iter_courses():
    # 读取 courses.json 生成测试课程数据，将课程教师设置为生成的教师
    author = User.query.filter_by(username='Jack Lee').first()
    with open(
            os.path.join(
                os.path.dirname(__file__), '..', 'datas',
                'courses.json')) as f:
        courses = json.load(f)
    for course in courses:
        yield Course(
            name=course['name'],
            description=course['description'],
            image_url=course['image_url'],
            author=author)


def iter_chapters():
    for course in Course.query:
        for i in range(randint(3, 10)):
            yield Chapter(
                name=faker.sentence(),
                course=course,
                vedio_url=
                'https://labfile.oss.aliyuncs.com/courses/923/week2_mp4/2-1-1-mac.mp4',
                vedio_duration='{}:{}'.format(
                    randint(10, 30), randint(10, 59)))


def run():
    for user in iter_users():
        db.session.add(user)

    for course in iter_courses():
        db.session.add(course)

    for chapter in iter_chapters():
        db.session.add(chapter)
    try:
        db.session.commit()
    except Exception as e:
        print(e)
        db.sessiion.rollback()
