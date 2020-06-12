import platform, sys
from flask import Flask, render_template
app = Flask(__name__)

# version number as an argument
ver = sys.argv[1]

# home page
@app.route('/')
def home():
    return render_template("home.html",version=str(ver))

# hostname page
@app.route('/hostname')
def hostname():
    returnString = str('Hello, World from ' + platform.node() + '!')
    return returnString

# healthcheck page
@app.route('/healthcheck')
def healthcheck():
    returnString = str('ok: ' + ver)
    return returnString

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)