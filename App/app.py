import platform, sys
from flask import Flask, render_template
app = Flask(__name__)

ver = sys.argv[1]

@app.route('/')
def home():
    return render_template("home.html",version=str(ver)

@app.route('/hostname')
def hostname():
    returnString = str('Hello, World from ' + platform.node() + '!')
    return returnString

@app.route('/healthcheck')
def healthcheck():
    returnString = str('ok: ' + ver)
    return returnString

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)