D=${HOME}/.local/share/iaito/translations
SOURCES=$(wildcard */*.ts)

all:
	$(MAKE) install
	$(MAKE) allzip

allzip:
	rm -f all.zip
	mkdir all
	cp */*.ts all
	cd all && zip ../all.zip *
	rm -rf all

clean:
	rm -f all.zip
	rm -rf build

install: build

build:
	rm -rf build
	mkdir -p build
	lrelease $(SOURCES)
	cp */*.qm build

user-install: build
	mkdir -p "$(D)"
	cp -rf build/* "$(D)/"

.PHONY: all allzip clean install user-install
