APP=pump

JS_FILES=media/js/src/ media/js/tests
PY_DIRS=$(APP) bdd_tests

all: eslint jenkins

# behave/bdd stuff still not factored out
MANAGE=./manage.py

behave: check flake8
	$(MANAGE) test bdd_tests --behave_browser firefox --testrunner=django_behave.runner.DjangoBehaveTestSuiteRunner

behave-wip: check flake8
	$(MANAGE) test bdd_tests --behave_tags @wip --behave_browser firefox --testrunner=django_behave.runner.DjangoBehaveTestSuiteRunner

include *.mk

eslint: $(JS_SENTINAL)
	$(NODE_MODULES)/.bin/eslint $(JS_FILES)

.PHONY: eslint
