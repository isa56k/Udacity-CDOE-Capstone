setup:
	python3 -m venv ~/.capstone

activate:
	source ~/.capstone/bin/activate

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	pylint --disable=R,C,W1203,W1309 App/app.py
	tidy -q -e App/templates/home.html


all: install lint test


