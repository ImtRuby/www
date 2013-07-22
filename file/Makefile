dirs=$(strip $(filter-out Makefile base.html, $(shell ls)))

all:
	@head -n 40 base.html > $(ROOT)/www/html/index.html
	@echo '<table bgcolor="#edca98"; cellspacing="10"><tbody><tr>' >> $(ROOT)/www/html/index.html
#
	@for dir in $(dirs) ; \
	do \
	    echo '<td align="center" ; width="180">' $$dir '</td>' >> $(ROOT)/www/html/index.html; \
	done
#
	@echo '</tr></tbody></table>' >> $(ROOT)/www/html/index.html
	@tail -n 4 base.html >> $(ROOT)/www/html/index.html
