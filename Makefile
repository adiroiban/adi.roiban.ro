# Makefile for generating website using Hyde.

PYTHON="build/bin/python"
PIP="build/bin/pip"
HYDE="build/bin/hyde"


deps:
	virtualenv build
	${PYTHON} $PIP install docutils
	${PYTHON} $PIP install \
		-e 'git://github.com/hyde/hyde.git#egg=hyde'

run:
	${PYTHON} ${HYDE} gen -d build/deploy
	${PYTHON} ${HYDE} serve -d build/deploy