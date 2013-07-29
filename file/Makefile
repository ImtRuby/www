dirs=$(strip $(filter-out Makefile base.html, $(shell ls)))


special:
	@head -n 40 base.html > $(DIR_HTML)/index.html
	@echo '<table bgcolor="#edca98"; cellspacing="10"><tbody><tr>' >> $(DIR_HTML)/index.html
#
	@for dir in $(dirs) ; \
	do \
	    echo '<td align="center" ; width="180">' $$dir '</td>' >> $(DIR_HTML)/index.html; \
		cd $$dir && make html -r ROOT=$(ROOT) $@ ; cd .. ; \
	done
#
	@echo '</tr></tbody></table>' >> $(DIR_HTML)/index.html
	@tail -n 4 base.html >> $(DIR_HTML)/index.html

include $(ROOT)/make.rule

