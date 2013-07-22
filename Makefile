.PHONY : all clean

ROOT = $(realpath .)
FILES = $(ROOT)/file

all :
	@set -e; \
	for dir in $(FILES); \
	do \
		cd $$dir && make -r ROOT=$(ROOT) $@ ; \
	done

clean : 
	@set -e; \
	for dir in $(FILES); \
	do \
		cd $$dir && rm -rf *.o; \
	done

push:
	git add .
	git commit -s && git push -u origin master

