dirs=$(strip $(filter-out Makefile base.html, $(shell ls)))


special:
	@head -n 40 base.html > $(DIR_HTML)/index.html
	@echo '<table bgcolor="#edca98"; cellspacing="10"><tbody><tr>' >> $(DIR_HTML)/index.html
#
	@for name in $(dirs) ; \
	do \
	    echo '<td align="center"; width="180px"> <a href="$(DIR_HTML)/'$$name'.html">' $$name '</a> </td>' >> $(DIR_HTML)/index.html; \
		cd $$name && make html -r ROOT=$(ROOT) $@ ; cd .. ; \
	done
#
	@echo '</tr></tbody></table>' >> $(DIR_HTML)/index.html
	@tail -n 4 base.html >> $(DIR_HTML)/index.html
#xdg-open $(DIR_HTML)/index.html

include $(ROOT)/rule.mk

