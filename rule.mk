.PHONY : all clean

DIR_FILE = $(ROOT)/file/
DIR_HTML = $(ROOT)/webpage/html
DIR_CSS = $(ROOT)/webpage/css
DIR_SCRIPT = $(ROOT)/webpage/script
DIR_RES = $(ROOT)/webpage/res

PWD_PATH = $(realpath .)
FILE_LIST=$(strip $(filter-out Makefile, $(shell ls -r)))
FILE_NAME=$(shell basename `pwd`).html

html:
	@head -n 14 $(DIR_FILE)/base.html > $(DIR_HTML)/$(FILE_NAME)
	@echo "<body>" >> $(DIR_HTML)/$(FILE_NAME)
	
	@for file in $(FILE_LIST) ; \
	do \
	done
	
	@for file in $(FILE_LIST) ; \
	do \
		python $(ROOT)/text2html.py $$file >> $(DIR_HTML)/$(FILE_NAME) ; \
	done
	@tail -n 2 $(DIR_FILE)/base.html >> $(DIR_HTML)/$(FILE_NAME)

default:
	@echo
	@echo "\033[32m Use rule.mk default target build! \033[0m"








#
#DIRS = $(DIR_OBJS) $(DIR_DEPS) $(DIR_EXES) $(DIR_LIBS)
#RMS = $(DIR_OBJS) $(DIR_DEPS)
#
#ifneq ("$(EXE)", "")
#EXE := $(addprefix $(DIR_EXES)/, $(EXE))
#RMS += $(EXE)
#endif
#
#ifneq ("$(LIB)", "")
#LIB := $(addprefix $(DIR_LIBS)/, $(LIB))
#RMS += $(LIB)
#endif
#
#SRCS = $(wildcard *.c)
#OBJS = $(patsubst %.c, %.o, $(SRCS))
#OBJS := $(addprefix $(DIR_OBJS)/, $(OBJS))
#DEPS = $(patsubst %.c, %.dep, $(SRCS))
#DEPS := $(addprefix $(DIR_DEPS)/, $(DEPS))
#
#ifeq ("$(wildcard $(DIR_OBJS))", "")
#DEP_DIR_OBJS := $(DIR_OBJS)
#endif
#ifeq ("$(wildcard $(DIR_EXES))", "")
#DEP_DIR_EXES:= $(DIR_EXES)
#endif
#ifeq ("$(wildcard $(DIR_DEPS))", "")
#DEP_DIR_DEPS:= $(DIR_DEPS)
#endif
#ifeq ("$(wildcard $(DIR_LIBS))", "")
#DEP_DIR_LIBS:= $(DIR_LIBS)
#endif
#
#all : $(EXE) $(LIB)
#
#ifneq ($(MAKECMDGOALS), clean)
#include $(DEPS)
#endif
#
#ifneq ($(INCLUDE_DIRS), "")
#INCLUDE_DIRS := $(strip $(INCLUDE_DIRS))
#INCLUDE_DIRS := $(addprefix -I, $(INCLUDE_DIRS))
#endif
#
##防止一些不是工程的库在build/libs中
#ifneq ($(LINK_LIBS), "")
#LINK_LIBS := $(strip $(LINK_LIBS))
#LIB_ALL := $(notdir $(wildcard $(DIR_LIBS)/*))
#LIB_FILTERED := $(addsuffix .a, $(addprefix lib, $(LINK_LIBS)))
#$(eval DEP_LIBS = $(filter $(LIB_FILTERED), $(LIB_ALL)))
#DEP_LIBS := $(addprefix $(DIR_LIBS)/, $(DEP_LIBS))
#LINK_LIBS := $(addprefix -l, $(LINK_LIBS))
#endif
#
#$(DIRS) :
#	$(MKDIR) $@
#$(EXE) : $(DEP_DIR_EXES) $(OBJS) $(DEP_LIBS)
#	$(CC) -L$(DIR_LIBS) -o $@ $(filter %.o, $^) $(LINK_LIBS)
#$(LIB) : $(DEP_DIR_LIBS) $(OBJS)
#	$(AR) $(ARFLAGS) $@ $(filter %.o, $^)
#$(DIR_OBJS)/%.o : $(DEP_DIR_OBJS) %.c
#	$(CC) $(INCLUDE_DIRS) -o $@ -c $(filter %.c, $^)
#$(DIR_DEPS)/%.dep : $(DEP_DIR_DEPS) %.c
#
##set	告诉shell,执行出错退出,加上 ';'表示在一个shell中执行
#
##sed	语句表示在所有行中替换.o为后缀并且后面跟着' '或':'的单词
##	加入前缀'obj/'
##\(\)	保存匹配的字符，如s/\(love\)able/\1rs，loveable被替换成lovers
#	@echo "Creating $@ ..."
#	@set -e; \
#	$(RM) $(RMFLAGS) $@.tmp; \
#	$(CC) $(INCLUDE_DIRS) -E -MM $(filter %.c, $^) > $@.tmp; \
#	sed 's,\(.*\)\.o[ :]*,objs/\1.o $@: ,g' < $@.tmp > $@; \
#	$(RM) $(RMFLAGS) $@.tmp
#
#clean :
#	$(RM) $(RMFLAGS) $(RMS)
