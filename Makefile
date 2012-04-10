# Makefile for generating website using Hyde.

PYTHON="build/bin/python2.7"
PIP="build/bin/pip"
HYDE="build/bin/hyde"
BUILD_FOLDER=.
DESTINATION='adi@tla.ro:/home/adi/adi.roiban.ro/'

generate:
	${PYTHON} ${HYDE} gen -r -d ${BUILD_FOLDER}


run: generate
	${PYTHON} ${HYDE} serve -d ${BUILD_FOLDER}


deps:
	virtualenv build -p /usr/bin/python2.7
	${PYTHON} ${PIP} install docutils
	${PYTHON} ${PIP} install \
		-e 'git://github.com/adiroiban/hyde.git#egg=hyde'


publish: generate
	git commit -a -m 'make: Update static files.'
	git push origin


upload:
	rsync -aqcz -e 'ssh' --exclude-from=rsync.exclude ./ ${DESTINATION}

clean:
	rm -rf ${BUILD_FOLDER}
