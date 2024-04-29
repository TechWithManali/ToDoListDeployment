import urllib.parse 
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from sqlalchemy import text

# Configure Database URI: 
#params = urllib.parse.quote_plus("DRIVER={ODBC Driver 18 for SQL Server};SERVER=serverbhavik.database.windows.net;DATABASE=databasebhavik;UID=sqladmin;PWD=sql@dmin123")
params = urllib.parse.quote_plus("DRIVER={ODBC Driver 18 for SQL Server};SERVER=leanixsqlserver00001.database.windows.net;DATABASE=leanixdb;UID=leanixadmin;PWD=Av@dha@#K112Hh1$4")

# initialization
app = Flask(__name__)
app.config['SECRET_KEY'] = 'supersecret'
app.config['SQLALCHEMY_DATABASE_URI'] = "mssql+pyodbc:///?odbc_connect=%s" % params
app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True

# extensions
db = SQLAlchemy(app)

# check if the connection is successfully established or not
with app.app_context():
    try:
        # db.session.execute('SELECT 1')
        db.session.execute(text('SELECT 1'))
        print('\n\n----------- Connection successful !')
    except Exception as e:
        print('\n\n----------- Connection failed ! ERROR : ', e)