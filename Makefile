all:
	rm all.zip
	mkdir all
	cp */*.ts all
	cd all && zip ../all.zip *
	rm -rf all
