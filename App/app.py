import platform
from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def home():
    return render_template("home.html")

@app.route('/hostname')
def hostname():
    returnString = str('Hello, World from ' + platform.node() + '!')
    return returnString

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)