# Makefile for generating website using Hyde.

PWD=`pwd`
PYTHON="build/bin/python2.7"
PIP="build/bin/pip"
HYDE="build/bin/hyde"
BUILD_FOLDER="build/deploy/"
DESTINATION='adi@tla.ro:/home/adi/adi.roiban.ro/'
DOWNLOADS_FOLDER='downloads'

run: generate
	rm -rf ${BUILD_FOLDER}/media
	ln -s ${PWD}/media ${BUILD_FOLDER}media
	${PYTHON} ${HYDE} serve -d ${BUILD_FOLDER}


clean:
	rm -rf ${BUILD_FOLDER}


deps:
	virtualenv build -p /usr/bin/python2.7
	${PYTHON} ${PIP} install docutils
	${PYTHON} ${PIP} install \
		-e 'git://github.com/adiroiban/hyde.git#egg=hyde'


generate: clean
	${PYTHON} ${HYDE} gen -r -d ${BUILD_FOLDER}
	cp -r media ${BUILD_FOLDER}

publish: generate
	rsync -aqcz --delete -e 'ssh' --exclude-from=rsync.exclude \
		${BUILD_FOLDER} ${DESTINATION}
	rsync -aqcz --delete -e 'ssh' --exclude-from=rsync.exclude \
		${DOWNLOADS_FOLDER} ${DESTINATION}