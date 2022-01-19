from sqlite3 import Date
from flask import Flask

app = Flask(__name__)


class Hello:
    @app.route('/')
    def hello():
        return "Hello World"    
    
    @app.route('/second')
    def second():
        return "This is second page"
    
    @app.route('/third')
    def third():
        return "This is the third page"

    @app.route('/third/subthird')
    def subthird():
        return "This is the subpage of the third page"


if __name__=="__main__":
    app.run(debug=True)