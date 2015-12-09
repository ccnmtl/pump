MANAGE=./manage.py
APP=pump
FLAKE8=./ve/bin/flake8

JS_FILES=media/js/src/ media/js/tests

jenkins: ./ve/bin/python check flake8 jshint jscs test

./ve/bin/python: requirements.txt bootstrap.py virtualenv.py
	chmod +x manage.py bootstrap.py
	./bootstrap.py

jshint: node_modules/jshint/bin/jshint
	./node_modules/jshint/bin/jshint $(JS_FILES) --config=./jshintrc

jscs: node_modules/jscs/bin/jscs
	./node_modules/jscs/bin/jscs $(JS_FILES) --config=./jscsrc

node_modules/jshint/bin/jshint:
	npm install jshint --prefix .

node_modules/jscs/bin/jscs:
	npm install jscs --prefix .

test: ./ve/bin/python
	$(MANAGE) jenkins --pep8-exclude=migrations --enable-coverage --coverage-rcfile=.coveragerc

flake8: ./ve/bin/python
	$(FLAKE8) $(APP) bdd_tests --exclude=migrations --max-complexity=10

behave: ./ve/bin/python check flake8
	$(MANAGE) test bdd_tests --behave_browser firefox --testrunner=django_behave.runner.DjangoBehaveTestSuiteRunner

behave-wip: ./ve/bin/python check flake8
	$(MANAGE) test bdd_tests --behave_tags @wip --behave_browser firefox --testrunner=django_behave.runner.DjangoBehaveTestSuiteRunner

runserver: ./ve/bin/python check
	$(MANAGE) runserver

migrate: ./ve/bin/python check jenkins
	$(MANAGE) migrate

check: ./ve/bin/python
	$(MANAGE) check

shell: ./ve/bin/python
	$(MANAGE) shell_plus

clean:
	rm -rf ve
	rm -rf media/CACHE
	rm -rf reports
	rm -f celerybeat-schedule .coverage
	find . -name '*.pyc' -exec rm {} \;

pull:
	git pull
	make check
	make test
	make migrate
	make flake8

rebase:
	git pull --rebase
	make check
	make test
	make migrate
	make flake8

syncdb: ./ve/bin/python
	$(MANAGE) syncdb

collectstatic: ./ve/bin/python check
	$(MANAGE) collectstatic --noinput --settings=$(APP).settings_production

# run this one the very first time you check
# this out on a new machine to set up dev
# database, etc. You probably *DON'T* want
# to run it after that, though.
install: ./ve/bin/python check jenkins
	createdb $(APP)
	$(MANAGE) syncdb --noinput
	make migrate
