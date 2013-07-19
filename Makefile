.PHONY : all clean

TOPDIR = $(shell pwd)
FILES = $(TOPDIR)/file

all :
	@set -e; \
	for dir in $(FILES); \
	do \
		cd $$dir && make; \
	done

clean : 
	@set -e; \
	for dir in $(FILES); \
	do \
		cd $$dir && rm -rf *.o; \
	done

push:
	git add .
	git config core.editor vim
	git commit -s && git push -u origin master

