from flask import render_template
from flask import Flask

app = Flask(__name__)

@app.route('/')
def head():
    return render_template("index.html",number1=34,number2=45)






if __name__=="__main__":
    app.run(debug=True)