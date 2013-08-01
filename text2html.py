#!/usr/bin/env python

import sys


#####################################################################
#              Dual with one single file
#####################################################################
def text2html(file):
  mark = ''
  fp=open(file, "r")

  for eachline in fp:
    if eachline.find('@author') != -1:
      print '%s' % (mark)
      print '<div class="author">'
      mark = '</div>\n'

    elif eachline.find('@text') != -1:
      print '%s' % (mark)
      print '<div class="text">'
      mark = '</div>\n'

    elif eachline.find('@code') != -1:
      print '%s' % (mark)
      print '<pre class="code">'
      mark = '</pre>\n'

    elif eachline.find('@picture') != -1:
      print '%s' % (mark)
      print '<div class="picture">'
      mark = '</div>\n'

    elif eachline.find('@link') != -1:
      print '%s' % (mark)
      print '<div class="link">'
      mark = '</div>\n'

    elif eachline.find('@article') != -1:
      print '%s' % (mark)
      print '<div class="article">'
      mark = '</div>\n'

    else:
      print eachline,

  print '%s' % (mark)
  fp.close()



#####################################################################
#              Begin of main function
#####################################################################
#fp = open(sys.argv[1], 'r')
#
#for eachline in fp:
#  if eachline == '' or eachline == '\n':
#    continue
text2html(sys.argv[1])

#fp.close()

