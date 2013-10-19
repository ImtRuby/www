.PHONY : default clean

ROOT = $(realpath .)
FILES = $(ROOT)/file

default :
	@rm -f $(ROOT)/webpage/html/*
	@set -e; \
	cd $(FILES) && make special -r ROOT=$(ROOT) $@ ; \
	sleep 1
	@sudo rm /var/www/* -rf
	@sudo cp webpage/* /var/www/ -r

#clean : 
#	@set -e; \
#	for dir in $(FILES); \
#	do \
#		cd $$dir && rm -rf *.o; \
#	done

push:
	tar -cjvf file_backup.tar.bz2 file/
	@echo "sleep 1s..."
	@sleep 1
	rm file -rf
	git config --global core.editor vi
	git config --global gui.encoding utf-8
	git config --global user.email "hacker.do@163.com"
	git config --global user.name "mark.huang"
	git add .
	git commit -s && git push -u origin master

tag:
	@git log
	@echo "git tag R1.0.0 962ee63dde5a5b7b3ae693e1d5108d5a43fb8d6d"
