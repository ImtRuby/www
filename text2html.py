#!/usr/bin/env python

import sys
import os


#####################################################################
#              Dual with one single file
#####################################################################
def text2html(path):
  index = 0

  if not os.path.isdir(path):
    return False

  print '</br>' * 4

  for filename in os.listdir(path):
    if filename != 'Makefile':
      print '<div class="title"><a href="#%s"> %d : %s </a></div>' % (filename.replace('.txt', ''), index, filename.replace('.txt', ''))
      index += 1

  print '</br>' * 8

  for filename in os.listdir(path):
    if filename != 'Makefile':
      mark = ''
      filepath=[]
      print '<h2 align="center"><a name="%s"> %s </a></h2>' % (filename.replace('.txt', ''), filename.replace(".txt", ""))

      # the mothod to join 2 strings
      filepath.append(filename)
      fp = open(path.join(filepath), "r")

      for eachline in fp:
        if eachline.find('@author') != -1:
          print '%s' % (mark)
          print '<div class="author">'
          mark = '</div>\n'

        elif eachline.find('@text') != -1:
          print '%s' % (mark)
          print '<pre class="text">'
          mark = '</pre>\n'

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
          if mark == '':
            mark = '-'
            print '<pre class="text">'

          # logic -- if no label for this line then print the content
          print eachline,

      if mark == '-':
        print '</pre>'
      else:
        print '%s' % (mark)


      fp.close()


#  mark = ''
#  fp=open(file, "r")
#
#  print '<h2 align="center"><a name="%s"> %s </a></h2>' % (file, file.replace(".txt", ""))
#  for eachline in fp:
#    if eachline.find('@author') != -1:
#      print '%s' % (mark)
#      print '<div class="author">'
#      mark = '</div>\n'
#
#    elif eachline.find('@text') != -1:
#      print '%s' % (mark)
#      print '<pre class="text">'
#      mark = '</pre>\n'
#
#    elif eachline.find('@code') != -1:
#      print '%s' % (mark)
#      print '<pre class="code">'
#      mark = '</pre>\n'
#
#    elif eachline.find('@picture') != -1:
#      print '%s' % (mark)
#      print '<div class="picture">'
#      mark = '</div>\n'
#
#    elif eachline.find('@link') != -1:
#      print '%s' % (mark)
#      print '<div class="link">'
#      mark = '</div>\n'
#
#    elif eachline.find('@article') != -1:
#      print '%s' % (mark)
#      print '<div class="article">'
#      mark = '</div>\n'
#
#    else:
#      if mark == '':
#        mark = '-'
#        print '<pre class="text">'
#      print eachline,
#
#  if mark == '-':
#    print '</pre>'
#  else:
#    print '%s' % (mark)
#
#  fp.close()



#####################################################################
#              Begin of main function
#####################################################################
#fp = open(sys.argv[1], 'r')
#
#for eachline in fp:
#  if eachline == '' or eachline == '\n':
#    continue
if __name__ == "__main__":
  text2html(sys.argv[1])

#fp.close()

