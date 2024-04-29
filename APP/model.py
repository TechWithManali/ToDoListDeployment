from flask import Flask
from flask_sqlalchemy import SQLAlchemy

from sqlalchemy import text
from connectionstring import db,app

#Define ToDo model
# class Todo(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     name = db.Column(db.String(100))
#     done=db.Column(db.Boolean,default=False)


class Tododemo(db.Model):
    task_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))
    done = db.Column(db.Boolean, default=False)

with app.app_context():
     db.create_all()