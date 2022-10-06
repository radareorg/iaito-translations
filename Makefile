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
	rm -rf all build
	rm -f */*.qm

install: build
	install -Dm644 -t $(PREFIX)/share/iaito/translations build/*.qm

build:
	rm -rf build
	mkdir -p build
	lrelease $(SOURCES)
	cp */*.qm build

user-install:
	$(MAKE) install PREFIX=${HOME}/.local

.PHONY: all allzip clean install user-install
