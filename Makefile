APP=pump

JS_FILES=media/js/src/ media/js/tests
PY_DIRS=$(APP) features

all: eslint jenkins

# behave/bdd stuff still not factored out
MANAGE=./manage.py

behave: check flake8
	$(MANAGE) behave

include *.mk

eslint: $(JS_SENTINAL)
	$(NODE_MODULES)/.bin/eslint $(JS_FILES)

.PHONY: eslint
