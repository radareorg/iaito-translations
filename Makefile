PREFIX:=/usr/local
SOURCES=$(wildcard */*.ts)

all:
	$(MAKE) build
	$(MAKE) allzip

allzip:
	rm -f all.zip
	mkdir all
	cp */*.ts all
	cd all && zip ../all.zip *
	rm -rf all

clean:
	rm -f all.zip
	rm -rf all
	rm -f */*.qm

install: build
	install -d $(PREFIX)/share/iaito/translations
	install -m 644 */*.qm $(PREFIX)/share/iaito/translations/

build:
	lrelease $(SOURCES)

user-install:
	$(MAKE) install PREFIX=${HOME}/.local

.PHONY: all allzip clean install build user-install
