# Makefile for generating website using Hyde.

PYTHON="build/bin/python2.7"
PIP="build/bin/pip"
HYDE="build/bin/hyde"


run:
	${PYTHON} ${HYDE} gen -r -d build/deploy
	${PYTHON} ${HYDE} serve -d build/deploy


deps:
	virtualenv build -p /usr/bin/python2.7
	${PYTHON} ${PIP} install docutils
	${PYTHON} ${PIP} install \
		-e 'git://github.com/adiroiban/hyde.git#egg=hyde'


clean:
	rm -rf build/deploy
