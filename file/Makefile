dirs=$(strip $(filter-out Makefile base.html, $(shell ls)))


special:
	@head -n 40 base.html > $(INDEX_HTML)
	@echo '<table bgcolor="#edca98"; cellspacing="10"><tbody><tr>' >> $(INDEX_HTML)
#
	@for name in $(dirs) ; \
	do \
	    echo '<td align="center"; width="180px"> <a href="./html/'$$name'.html">' $$name '</a> </td>' >> $(INDEX_HTML) ; \
		cd $$name && make html -r ROOT=$(ROOT) $@ ; cd .. ; \
	done
#
	@echo '</tr></tbody></table>' >> $(INDEX_HTML)
	@tail -n 4 base.html >> $(INDEX_HTML)
#xdg-open $(INDEX_HTML)

include $(ROOT)/rule.mk

