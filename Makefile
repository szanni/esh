.PHONY: all install dist clean

PACKAGE = esh
VERSION = 0.1.0
DIST = Makefile ${PACKAGE} ${PACKAGE}.adoc ${PACKAGE}.1 LICENSE CHANGELOG

PREFIX ?= /usr/local

all: ${PACKAGE}.1

${PACKAGE}.1: ${PACKAGE}.adoc
	a2x -f manpage $<

install: ${PACKAGE} ${PACKAGE}.1
	install -D -m755 ${PACKAGE} ${DESTDIR}${PREFIX}/bin/${PACKAGE}
	install -D -m644 ${PACKAGE}.1 ${DESTDIR}${PREFIX}/share/man/man1/${PACKAGE}.1

dist: ${DIST}
	mkdir -p ${PACKAGE}-${VERSION}
	cp ${DIST} ${PACKAGE}-${VERSION}
	tar -cf ${PACKAGE}-${VERSION}.tar ${PACKAGE}-${VERSION}
	gzip -fk ${PACKAGE}-${VERSION}.tar
	xz -f ${PACKAGE}-${VERSION}.tar

clean:
	rm -f ${PACKAGE}.1
	rm -rf ${PACKAGE}-${VERSION}{,.tar,.tar.gz,.tar.xz}
