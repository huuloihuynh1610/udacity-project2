setup:
	python3 -m venv udacity-project2
	source udacity-project2/bin/activate

install:
	pip3 install --upgrade pip &&\
		pip3 install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb
	#python
	echo "Run test"

lint:
	pylint --disable=R,C,W1203,W0702 app.py

web-app:
	az webapp up --name loihuynh1610-ml-service --resource-group udacity-devops

all: install lint test
