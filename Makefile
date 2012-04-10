# Makefile for generating website using Hyde.

PYTHON="build/bin/python2.7"
PIP="build/bin/pip"
HYDE="build/bin/hyde"
BUILD_FOLDER=.

generate:
	${PYTHON} ${HYDE} gen -r -d ${BUILD_FOLDER}


run: generate

	${PYTHON} ${HYDE} serve -d ${BUILD_FOLDER}


deps:
	virtualenv build -p /usr/bin/python2.7
	${PYTHON} ${PIP} install docutils
	${PYTHON} ${PIP} install \
		-e 'git://github.com/adiroiban/hyde.git#egg=hyde'


clean:
	rm -rf ${BUILD_FOLDER}
