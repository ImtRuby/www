.PHONY : default clean

ROOT = $(realpath .)
FILES = $(ROOT)/file

default :
	@set -e; \
	cd $(FILES) && make special -r ROOT=$(ROOT) $@ ; \
	#cd $(FILES) && make -r ROOT=$(ROOT) $@ ; \
	#for dir in $(FILES); \
	#do \
	#	cd $$dir && make special -r ROOT=$(ROOT) $@ ; \
	#done

clean : 
	@set -e; \
	for dir in $(FILES); \
	do \
		cd $$dir && rm -rf *.o; \
	done

push:
	git add .
	git commit -s && git push -u origin master
