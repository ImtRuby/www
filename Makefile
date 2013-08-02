.PHONY : default clean

ROOT = $(realpath .)
FILES = $(ROOT)/file

default :
	rm -f $(ROOT)/webpage/html/*
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
	tar -cjvf file_backup.tar.bz2 file/
	git add .
	git commit -s && git push -u origin master
