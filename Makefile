D=${HOME}/.local/share/iaito/translations

all:
	$(MAKE) install
	$(MAKE) allzip

allzip:
	rm all.zip
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
	lrelease ../Iaito.pro
	cp */*.qm build

user-install: build
	echo "$(D)"
	mkdir -p $(D)
	cp -rf build/* $(D)/

.PHONY: all allzip clean install
